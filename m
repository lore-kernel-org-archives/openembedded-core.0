Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4355C719DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 13:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2FDr2LF009472; Wed, 15 Mar 2017 13:53:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HLSeWmpW7tGC; Wed, 15 Mar 2017 13:53:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2FDrC50009555
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Mar 2017 13:53:13 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1co9MW-0003My-2x; Wed, 15 Mar 2017 13:53:12 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 13:53:10 +0000
Message-Id: <1489585990-12914-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] selftest: Disable SSTATE_MIRRORS for sstate signing test
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
X-List-Received-Date: Wed, 15 Mar 2017 13:53:16 -0000

Building ed into an sstate mirror, then leaving it enabled for
oe-selftest -r signing.Signing.test_signing_sstate_archive results in:

NOTE: recipe ed-1.14.1-r0: task do_populate_lic_setscene: Started
WARNING: ed-1.14.1-r0 do_populate_lic_setscene: Failed to fetch URL file://29/sstate:ed::1.14.1:r0::3:290bbc39f3b25cc27028dafce4b5aa48_populate_lic.tgz.sig;downloadfilename=29/sstate:ed::1.14.1:r0::3:290bbc39f3b25cc27028dafce4b5aa48_populate_lic.tgz.sig, attempting MIRRORS if available
ERROR: ed-1.14.1-r0 do_populate_lic_setscene: Fetcher failure: Unable to find file file://29/sstate:ed::1.14.1:r0::3:290bbc39f3b25cc27028dafce4b5aa48_populate_lic.tgz.sig;downloadfilename=29/sstate:ed::1.14.1:r0::3:290bbc39f3b25cc27028dafce4b5aa48_populate_lic.tgz.sig anywhere. The paths that were searched were:
    /media/build1/poky/build/test-sstate
    /media/build1/poky/build/test-sstate
WARNING: ed-1.14.1-r0 do_populate_lic_setscene: Cannot verify signature on sstate package /media/build1/poky/build/test-sstate/29/sstate:ed::1.14.1:r0::3:290bbc39f3b25cc27028dafce4b5aa48_populate_lic.tgz
NOTE: recipe ed-1.14.1-r0: task do_populate_lic_setscene: Succeeded

so we need to disable SSTATE_MIRRORS for this test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/signing.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 38b2fca..ba44c79 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -108,6 +108,8 @@ class Signing(oeSelfTest):
         feature += 'SSTATE_VERIFY_SIG ?= "1"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
         feature += 'SSTATE_DIR = "%s"\n' % sstatedir
+        # Any mirror might have partial sstate without .sig files, triggering failures
+        feature += 'SSTATE_MIRRORS_forcevariable = ""\n'
 
         self.write_config(feature)
 
-- 
2.7.4


