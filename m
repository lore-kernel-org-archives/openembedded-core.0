Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHvOu-0007I2-Ob for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 13:07:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BAwVHG006824
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 11:58:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06514-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 11:58:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BAwMAG006817
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 11:58:23 +0100
Message-ID: <1334141902.10826.145.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2012 11:58:22 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] python: Fix host contamination issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 11:07:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

python-nativesdk could fail with:
   
| /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/x86_64-linux/usr/bin/python: /lib64/libc.so.6: version `GLIBC_2.14' not found (required by /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/python-nativesdk-2.7.2-r1.9/Python-2.7.2/libpython2.7.so.1.0)
| make: *** [sharedmods] Error 1
    
which is caused by the fact LD_LIBRARY_PATH is being set to include WORKDIR
when calling HOSTPYTHON. HOSTPYTHON is from python-native and needs no such
help so the easiest fix here is not to set crazy LD_LIBRARY_PATH values
since we should never be running anything from WORKDIR given the way we build
things.
    
The patch clears out the RUNSHARED variable which would contain the
LD_LIBRARY_PATH value prior to this patch.
    
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 8cf45da..53e994f 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.9"
+PR = "${INC_PR}.10"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -62,6 +62,9 @@ do_compile() {
 	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
 	sed -i -e s,ccache,'$(CCACHE)', Makefile
 
+	# remove any bogus LD_LIBRARY_PATH
+	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
+
 	install -m 0644 Makefile Makefile.orig
 	sed -i -e 's,${includedir},${STAGING_INCDIR},' Makefile
 	sed -i -e 's,${libdir},${STAGING_LIBDIR},' Makefile



