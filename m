Return-Path: <miroslav.kes@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6D685605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 19:39:23 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id k14so2722895wgh.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 12:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=wD2T6O4pahh+jix88AYtbfQ0S4W2UxO35iHwTqa+9dM=;
	b=dG69CRlFpAqci3Ag9O/EfPhNVc1u6kQO09ot6vlJedmMZHVuWvaJ/GMpzNFT0oGfND
	w89gYNIr/UsSw7soeKoKBghBZGrH+Vm9FIgJ8LZ1JXJ90HU5dAiFpU6pHJPhXs+3QIIz
	3bRdSOZZqf8zhCxGHSY6gaiJs1xexymU65PHL7lMsVWOE4UQFclK2rrRKNAXAivctoSl
	gPsWKgxm02xBEHot1nfsjScgimz1WGKHVe9JvSclk6EhHAV5iTaAiFT0ymzu0T97zsYk
	xCiT/YZb3Bad8fotxVKiPQ+xRBsbZP89S6uNSQnUZbwYPgUT5uyoOgpzsV8lP6frJgPH
	+adQ==
X-Received: by 10.180.74.131 with SMTP id t3mr9018979wiv.23.1403206763978;
	Thu, 19 Jun 2014 12:39:23 -0700 (PDT)
Received: from [192.168.1.100] ([188.175.125.133])
	by mx.google.com with ESMTPSA id
	gp6sm14206365wib.12.2014.06.19.12.39.22 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Jun 2014 12:39:23 -0700 (PDT)
Message-ID: <53A33C63.9040209@gmail.com>
Date: Thu, 19 Jun 2014 21:39:15 +0200
From: =?UTF-8?B?TWlyb3NsYXYgS2XFoQ==?= <miroslav.kes@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
References: <539B27F0.90109@gmail.com>	<CAJTo0Lauenh9=Mep+4ZUVPnjf0yJDdaCxbrNcB5vXEmtjn5-iA@mail.gmail.com>
	<53A0A2F0.2020701@gmail.com> <53A0A6D1.7010206@linux.intel.com>
In-Reply-To: <53A0A6D1.7010206@linux.intel.com>
Subject: [PATCH v2] cmake: respect ${S} and ${B} patch problem
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
X-List-Received-Date: Thu, 19 Jun 2014 19:39:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> The cmake.bbclass currently generates the cmake command using the ${S}
> variable as the path where the top most CMakeLists.txt should be found.
> This works OK as along as the CMakeLists.txt is in the top level
> directory of the package source tree.
> But CMake doesn't require the directory tree to be structured that way.
> If the top level CMakeLists.txt is in a subdirectory of the package
> source tree AND the recipe needs to patch a file which is at a higher
> level the OE build is broken.
>
> I would propose to return the OECMAKE_SOURCEPATH variable to the
> cmake.bbclass, pass it to the cmake command as the "path to the CMake
> file", and set its default value to ${S}


On 06/17/14 22:36, Saul Wold wrote:
>
> Can you send this as a proper v2 patch please.
> Thanks
>     Sau!

I'm doing it first time in my life. Hoping I understood the instructions correctly.

Mira

Signed-off-by: Miroslav Kes <miroslav.kes@gmail.com>
---
 meta/classes/cmake.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index c9c15f3..f762792 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -23,6 +23,9 @@ OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
 OECMAKE_EXTRA_ROOT_PATH ?= ""
 
+# Path to the CMake file to process.
+OECMAKE_SOURCEPATH ?= "${S}"
+
 cmake_do_generate_toolchain_file() {
     cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
@@ -65,8 +68,8 @@ EOF
 addtask generate_toolchain_file after do_patch before do_configure
 
 cmake_do_configure() {
-    if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
-        bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
+    if [ "${OECMAKE_BUILDPATH}" ]; then
+        bbnote "cmake.bbclass no longer uses OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
     fi
 
     if [ "${S}" != "${B}" ]; then
@@ -84,7 +87,7 @@ cmake_do_configure() {
 
     cmake \
       ${OECMAKE_SITEFILE} \
-      ${S} \
+      ${OECMAKE_SOURCEPATH} \
       -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
       -DCMAKE_INSTALL_BINDIR:PATH=${bindir} \
       -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir} \
-- 
1.8.5.5



