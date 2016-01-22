Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE01731E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MD5PWN019999 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:05:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ftMbk5FS9esk
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:05:25 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MD5Ltq019995
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:05:22 GMT
Message-ID: <1453467921.27999.205.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jan 2016 13:05:21 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] uninative: Add fetch capability
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
X-List-Received-Date: Fri, 22 Jan 2016 13:05:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Originally, the idea was that the init environment would handle
fetching or providing the binary shim that uninative needs.

This turns out to be ugly, especially when you consider proxy
environments and so on getting involved. Instead, lets therefore
support our fetcher which already handles all this.

The distro is expected to setup configuration like:

UNINATIVE_URL ?= "http://mydomain/mypath/"
UNINATIVE_CHECKSUM[i586] =
"md5sum1"
UNINATIVE_CHECKSUM[x86_64] = "md5sum2"

and then it should all work if the user inherits the uninative class.

This patch also improves the error handling in the class to give more
user readable error messages.

If the shim binary is already provided, the system will just use that
and ignore the url information.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 0cd27db..b40b817 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -2,16 +2,51 @@ NATIVELSBSTRING = "universal"
 
 UNINATIVE_LOADER ?= "${@bb.utils.contains('BUILD_ARCH', 'x86_64', '${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2', '${STAGING_DIR_NATIVE}/lib/ld-linux.so.2', d)}"
 
+UNINATIVE_URL ?= "unset"
+UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
+# Example checksums
+#UNINATIVE_CHECKSUM[i586] = "dead"
+#UNINATIVE_CHECKSUM[x86_64] = "dead"
+UNINATIVE_DLDIR ?= "${COREBASE}"
+
 addhandler uninative_eventhandler
 uninative_eventhandler[eventmask] = "bb.event.BuildStarted"
 
 python uninative_eventhandler() {
     loader = e.data.getVar("UNINATIVE_LOADER", True)
+    tarball = d.getVar("UNINATIVE_TARBALL", True)
+    tarballdir = d.getVar("UNINATIVE_DLDIR", True)
     if not os.path.exists(loader):
         import subprocess
-        cmd = e.data.expand("mkdir -p ${STAGING_DIR}; cd ${STAGING_DIR}; tar -xjf ${COREBASE}/${BUILD_ARCH}-nativesdk-libc.tar.bz2; ${STAGING_DIR}/relocate_sdk.py ${STAGING_DIR_NATIVE} ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_BINDIR_NATIVE}/patchelf-uninative")
-        #bb.warn("nativesdk lib extraction: " + cmd)
-        subprocess.check_call(cmd, shell=True)
+
+        olddir = os.getcwd()
+        if not os.path.exists(os.path.join(tarballdir, tarball)):
+            # Copy the data object and override DL_DIR and SRC_URI
+            localdata = bb.data.createCopy(d)
+
+            if d.getVar("UNINATIVE_URL", True) == "unset":
+                bb.fatal("Uninative selected but not configured, please set UNINATIVE_URL")
+
+            chksum = d.getVarFlag("UNINATIVE_CHECKSUM", d.getVar("BUILD_ARCH", True), True)
+            if not chksum:
+                bb.fatal("Uninative selected but not configured correctly, please set UNINATIVE_CHECKSUM[%s]" % d.getVar("BUILD_ARCH", True))
+
+            srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};md5sum=%s" % chksum)
+            dldir = localdata.expand(tarballdir)
+            localdata.setVar('FILESPATH', dldir)
+            localdata.setVar('DL_DIR', dldir)
+            bb.note("Fetching uninative binary shim from %s" % srcuri)
+            fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
+            try:
+                fetcher.download()
+            except Exception as exc:
+                bb.fatal("Unable to download uninative tarball: %s" % str(exc))
+        cmd = e.data.expand("mkdir -p ${STAGING_DIR}; cd ${STAGING_DIR}; tar -xjf ${UNINATIVE_DLDIR}/${UNINATIVE_TARBALL}; ${STAGING_DIR}/relocate_sdk.py ${STAGING_DIR_NATIVE} ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_BINDIR_NATIVE}/patchelf-uninative")
+        try:
+            subprocess.check_call(cmd, shell=True)
+        except supprocess.CalledProcessError as exc:
+            bb.fatal("Unable to install uninative tarball: %s" % str(exc))
+        os.chdir(olddir)
 }
 
 SSTATEPOSTUNPACKFUNCS_append = " uninative_changeinterp"



