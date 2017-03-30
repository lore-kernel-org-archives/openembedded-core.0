Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 49A0577C41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2U9ZdLk030679; 
	Thu, 30 Mar 2017 10:35:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2lItzIjqfHGl; Thu, 30 Mar 2017 10:35:39 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2U9Zcc2030670
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 10:35:39 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ctWUU-0005ke-FM; Thu, 30 Mar 2017 10:35:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 10:35:34 +0100
Message-Id: <1490866536-22063-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490866536-22063-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1490866536-22063-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/4] sanity: Drop obsolete TMPDIR ABI conversions
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
X-List-Received-Date: Thu, 30 Mar 2017 09:35:40 -0000

When we get to version 12 we have a hard break as we can't convert to newer
versions. There is no point in running the old conversions on an old tmpdir
only to hit that block. Remove all the old conversions to avoid that and
make things clearer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 43 +------------------------------------------
 1 file changed, 1 insertion(+), 42 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e3be40b..94c78b5 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -588,48 +588,7 @@ def sanity_handle_abichanges(status, d):
         if not abi.isdigit():
             with open(abifile, "w") as f:
                 f.write(current_abi)
-        elif abi == "2" and current_abi == "3":
-            bb.note("Converting staging from layout version 2 to layout version 3")
-            subprocess.call(d.expand("mv ${TMPDIR}/staging ${TMPDIR}/sysroots"), shell=True)
-            subprocess.call(d.expand("ln -s sysroots ${TMPDIR}/staging"), shell=True)
-            subprocess.call(d.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done"), shell=True)
-            with open(abifile, "w") as f:
-                f.write(current_abi)
-        elif abi == "3" and current_abi == "4":
-            bb.note("Converting staging layout from version 3 to layout version 4")
-            if os.path.exists(d.expand("${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}")):
-                subprocess.call(d.expand("mv ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS} ${STAGING_BINDIR_CROSS}"), shell=True)
-                subprocess.call(d.expand("ln -s ${STAGING_BINDIR_CROSS} ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"), shell=True)
-            with open(abifile, "w") as f:
-                f.write(current_abi)
-        elif abi == "4":
-            status.addresult("Staging layout has changed. The cross directory has been deprecated and cross packages are now built under the native sysroot.\nThis requires a rebuild.\n")
-        elif abi == "5" and current_abi == "6":
-            bb.note("Converting staging layout from version 5 to layout version 6")
-            subprocess.call(d.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}"), shell=True)
-            with open(abifile, "w") as f:
-                f.write(current_abi)
-        elif abi == "7" and current_abi == "8":
-            status.addresult("Your configuration is using stamp files including the sstate hash but your build directory was built with stamp files that do not include this.\nTo continue, either rebuild or switch back to the OEBasic signature handler with BB_SIGNATURE_HANDLER = 'OEBasic'.\n")
-        elif (abi != current_abi and current_abi == "9"):
-            status.addresult("The layout of the TMPDIR STAMPS directory has changed. Please clean out TMPDIR and rebuild (sstate will be still be valid and reused)\n")
-        elif (abi != current_abi and current_abi == "10" and (abi == "8" or abi == "9")):
-            bb.note("Converting staging layout from version 8/9 to layout version 10")
-            cmd = d.expand("grep -r -l sysroot-providers/virtual_kernel ${SSTATE_MANIFESTS}")
-            ret, result = oe.utils.getstatusoutput(cmd)
-            result = result.split()
-            for f in result:
-                bb.note("Uninstalling manifest file %s" % f)
-                sstate_clean_manifest(f, d)
-            with open(abifile, "w") as f:
-                f.write(current_abi)
-        elif abi == "10" and current_abi == "11":
-            bb.note("Converting staging layout from version 10 to layout version 11")
-            # Files in xf86-video-modesetting moved to xserver-xorg and bitbake can't currently handle that:
-            subprocess.call(d.expand("rm ${TMPDIR}/sysroots/*/usr/lib/xorg/modules/drivers/modesetting_drv.so ${TMPDIR}/sysroots/*/pkgdata/runtime/xf86-video-modesetting* ${TMPDIR}/sysroots/*/pkgdata/runtime-reverse/xf86-video-modesetting* ${TMPDIR}/sysroots/*/pkgdata/shlibs2/xf86-video-modesetting*"), shell=True)
-            with open(abifile, "w") as f:
-                f.write(current_abi)
-        elif abi == "11" and current_abi == "12":
+        elif int(abi) <= 11 and current_abi == "12":
             status.addresult("The layout of TMPDIR changed for Recipe Specific Sysroots.\nConversion doesn't make sense and this change will rebuild everything so please start with a clean TMPDIR.\n")
         elif (abi != current_abi):
             # Code to convert from one ABI to another could go here if possible.
-- 
2.7.4


