Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4C9DF77218
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 23:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NNT29A001892; Mon, 23 Jan 2017 23:29:02 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uCRvBU_u3e0S; Mon, 23 Jan 2017 23:29:02 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NNSxFa001888
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 23:29:00 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cVo2l-0003B9-Eh; Mon, 23 Jan 2017 23:28:59 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 23:28:56 +0000
Message-Id: <1485214136-12180-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] sanity/abi-version: Force a clean TMPDIR after recipe specific sysroot changes
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
X-List-Received-Date: Mon, 23 Jan 2017 23:29:03 -0000

With the recipe specific sysroots, we need a clean tmpdir, else pseudo-native,
openssl-native, subversion-native and serf-native need to be manually cleaned.
After these there are probably more places where software doesn't rebuild correctly
even if we pass in new parameters to it.

The simplest solution is to force people to start from a clean TMPDIR since
everything would rebuild anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 2 ++
 meta/conf/abi_version.conf  | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c9bb034..7bcceee 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -630,6 +630,8 @@ def sanity_handle_abichanges(status, d):
             subprocess.call(d.expand("rm ${TMPDIR}/sysroots/*/usr/lib/xorg/modules/drivers/modesetting_drv.so ${TMPDIR}/sysroots/*/pkgdata/runtime/xf86-video-modesetting* ${TMPDIR}/sysroots/*/pkgdata/runtime-reverse/xf86-video-modesetting* ${TMPDIR}/sysroots/*/pkgdata/shlibs2/xf86-video-modesetting*"), shell=True)
             with open(abifile, "w") as f:
                 f.write(current_abi)
+        elif abi == "11" and current_abi == "12":
+            status.addresult("The layout of TMPDIR changed for Recipe Specific Sysroots.\nConversion doesn't make sense and this change will rebuild everything so please start with a clean TMPDIR.\n")
         elif (abi != current_abi):
             # Code to convert from one ABI to another could go here if possible.
             status.addresult("Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi))
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index a829687..4964880 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -4,4 +4,4 @@
 # that breaks the format and have been previously discussed on the mailing list 
 # with general agreement from the core team.
 #
-OELAYOUT_ABI = "11"
+OELAYOUT_ABI = "12"
-- 
2.7.4


