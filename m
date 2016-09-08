Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EB40D65C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 10:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u88AO62D007741 for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Sep 2016 11:24:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QmXCHVPDHv1t
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 11:24:06 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u88AO0gu007733
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Sep 2016 11:24:01 +0100
Message-ID: <1473330240.20226.149.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 08 Sep 2016 11:24:00 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa/runtime/smart: Prune feeds to save memory
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
X-List-Received-Date: Thu, 08 Sep 2016 10:24:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Full package feed indexes overload a 256MB image so reduce the number of rpms
the feed. Filter to p* since we use the psplash packages and this leaves some
allarch and machine arch packages too.

[YOCTO #8771]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index c8ba433..6cdb10d 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -87,6 +87,10 @@ class SmartRepoTest(SmartTest):
             lockfilename = oeRuntimeTest.tc.d.getVar('DEPLOY_DIR_RPM', True) + "/rpm.lock"
             lf = bb.utils.lockfile(lockfilename, False)
             oe.path.copyhardlinktree(rpm_dir, idx_path)
+            # Full indexes overload a 256MB image so reduce the number of rpms
+            # in the feed. Filter to p* since we use the psplash packages and
+            # this leaves some allarch and machine arch packages too.
+            bb.utils.remove(idx_path + "*/[a-oq-z]*.rpm")
             bb.utils.unlockfile(lf)
             index_cmds.append("%s --dbpath %s --update -q %s" % (rpm_createrepo, db_path, idx_path))
             rpm_dirs_found = True



