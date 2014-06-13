Return-Path: <miroslav.kes@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id B1F2A6FC3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 16:34:03 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id u57so3100633wes.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 09:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=QJL8p1gulp388Tb2Ug7lfgidItNBNGwPGdwYlae8qo4=;
	b=bQ7RTFKp4Z5mH0ORyF3NH+hZpWbvt8WjuTfzGIqdeBaXa0utj6vYTOS9qH8fWZncGQ
	6I9m6KyisfJM+1W4p75N/6emMFISF6JkjdRXAdK+RBuchW7f4WbY7PmgvYFOGNofCmsw
	57Q5zkQ8rM7MYXGblMfQzkeAsnFSe7Vu/0BHJUziQbqbfvcf/4rh7BBjyoXvBO7nlu/W
	+rRA9dlgvBLn03oTt/I98RNqQS1/FF6XFlWdthWkRzkUEYky709ceWmmxX2TxLgDmDXF
	ZY1Zpa/LqevD6iH5kMQKPIlQOGnsaVbc9+lYFMMWK/YKirPOcGjrmD74vzJS1Zztinj3
	mkoA==
X-Received: by 10.194.1.164 with SMTP id 4mr5841187wjn.17.1402677243944;
	Fri, 13 Jun 2014 09:34:03 -0700 (PDT)
Received: from [192.168.1.100] ([188.175.125.133])
	by mx.google.com with ESMTPSA id na4sm3335385wic.21.2014.06.13.09.34.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Jun 2014 09:34:03 -0700 (PDT)
Message-ID: <539B27F0.90109@gmail.com>
Date: Fri, 13 Jun 2014 18:33:52 +0200
From: =?windows-1252?Q?Miroslav_Ke=9A?= <miroslav.kes@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: cmake: respect ${S} and ${B} patch problem
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jun 2014 16:34:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi!

I have found a problem related to the patch "respect ${S} and ${B}" on the
cmake.bbclass (commit 43073569cb67d98c11aa71211d77b566b64f9145)

The cmake.bbclass now generates the cmake command using the ${S}
variable as the path where the top most CMakeLists.txt should be found.
This works OK as along as the CMakeLists.txt is in the top level
directory of the package source tree.
But CMake doesn't require the directory tree to be structured that way.
If the top level CMakeLists.txt is in a subdirectory of the package
source tree AND the recipe needs to patch a file which is at a higher
level the OE build is broken.

Example:

${WORKDIR}
    - cmake
        - Modules
            - FindSomePackage.cmake
    - Src
        - CMakeLists.txt  <- top level CMake file

For the cmake.bbclass to work correctly after the patch the S must be
set to the ${WORKDIR}/Src.
But the ${S} is also used as the base directory for patching.
In the example, the patch task creates directory  ${S}/patches (i.e.
${WORKDIR}/Src/patches) and creates symbolic links to all relevant
patches in that directory.
But those patches can only patch files under the ${S} subtree.
The ${WORKDIR}/cmake/Modules/FindSomePackage.cmake becomes invisible for
patches and the patch task ends up with error "No file to patch."

I would propose to return the OECMAKE_SOURCEPATH variable to the
cmake.bbclass, pass it to the cmake command as the "path to the CMake
file", and set its default value to ${S}

Regards

Mira


Signed-off-by: Mira Kes <miroslav.kes@gmail.com>

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index c9c15f3..95a1cbf 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -65,8 +65,12 @@ EOF
 addtask generate_toolchain_file after do_patch before do_configure
 
 cmake_do_configure() {
-    if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
-        bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH and
OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with
B=WORKDIR/build."
+    if [ "${OECMAKE_BUILDPATH}" ]; then
+        bbnote "cmake.bbclass no longer uses OECMAKE_BUILDPATH.  The
default behaviour is now out-of-tree builds with B=WORKDIR/build."
+    fi
+
+    if [ -z "${OECMAKE_SOURCEPATH}" ]; then
+        OECMAKE_SOURCEPATH="${S}"
     fi
 
     if [ "${S}" != "${B}" ]; then
@@ -84,7 +88,7 @@ cmake_do_configure() {
 
     cmake \
       ${OECMAKE_SITEFILE} \
-      ${S} \
+      ${OECMAKE_SOURCEPATH} \
       -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
       -DCMAKE_INSTALL_BINDIR:PATH=${bindir} \
       -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir} \


