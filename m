Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 478D871BA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 07:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2E7nGKj029871; Tue, 14 Mar 2017 07:49:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dmcz8oQNyDS0; Tue, 14 Mar 2017 07:49:16 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2E7nE1U029867
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 14 Mar 2017 07:49:16 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cnhCk-0004WD-TJ; Tue, 14 Mar 2017 07:49:14 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 07:49:13 +0000
Message-Id: <1489477753-17329-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] testimage: Don't use systemd.log_level=debug logging
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
X-List-Received-Date: Tue, 14 Mar 2017 07:49:17 -0000

This causes MBs of log messages which overload the standard 200kb syslog limit
used by busybox syslog by default. This means some tests which rely on messages
being detected in syslog, e.g.
rpm.RpmInstallRemoveTest.test_check_rpm_install_removal_log_file_size
fail (AssertionError: 54 not greater than or equal to 80 : Cound not find sufficient
amount of rpm entries in /var/log/messages, found 54 entries).

We enabled this to aid debugging of some systemd race issues, those are
now resolved so we can disable this. Leave the log level parameter as a
comment to save others having to look it up if they need debugging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 07744af..173d974 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -261,7 +261,8 @@ def testimage_main(d):
 
     bootparams = None
     if d.getVar('VIRTUAL-RUNTIME_init_manager', '') == 'systemd':
-        bootparams = 'systemd.log_level=debug systemd.log_target=console'
+        # Add systemd.log_level=debug to enable systemd debug logging
+        bootparams = 'systemd.log_target=console'
 
     results = None
     orig_sigterm_handler = signal.signal(signal.SIGTERM, sigterm_exception)
-- 
2.7.4


