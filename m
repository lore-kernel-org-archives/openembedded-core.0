Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D86C7EE22
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 12:59:59 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.15752.1683723590555705637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 05:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pwjQ3-004OuZ-LD; Wed, 10 May 2023 15:59:47 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pwjQ3-00HI1A-CZ; Wed, 10 May 2023 15:59:47 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/3] qemurunner: support serial console login via qemu stdout
Date: Wed, 10 May 2023 15:59:33 +0300
Message-Id: <20230510125935.4120156-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230510125935.4120156-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 12:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181108

runqemu script works with qemu machines which provide login
and serial console to the qemu process stdout. Add the same support
to qemurunner so that testing with testimage.bbclass is possible.

Default qemu machines provide serial console boot logs and login via
socket to qemu process but I don't see a reason why qemu process stdout
should not be supported too since they work with runqemu as well.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 6734cee48d..3b7398b872 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -451,7 +451,7 @@ class QemuRunner:
         self.logger.debug("Waiting at most %d seconds for login banner (%s)" %
                           (self.boottime, time.strftime("%D %H:%M:%S")))
         endtime = time.time() + self.boottime
-        socklist = [self.server_socket]
+        filelist = [self.server_socket, self.runqemu.stdout]
         reachedlogin = False
         stopread = False
         qemusock = None
@@ -459,24 +459,32 @@ class QemuRunner:
         data = b''
         while time.time() < endtime and not stopread:
             try:
-                sread, swrite, serror = select.select(socklist, [], [], 5)
+                sread, swrite, serror = select.select(filelist, [], [], 5)
             except InterruptedError:
                 continue
-            for sock in sread:
-                if sock is self.server_socket:
+            for file in sread:
+                if file is self.server_socket:
                     qemusock, addr = self.server_socket.accept()
-                    qemusock.setblocking(0)
-                    socklist.append(qemusock)
-                    socklist.remove(self.server_socket)
+                    qemusock.setblocking(False)
+                    filelist.append(qemusock)
+                    filelist.remove(self.server_socket)
                     self.logger.debug("Connection from %s:%s" % addr)
                 else:
                     # try to avoid reading only a single character at a time
                     time.sleep(0.1)
-                    data = data + sock.recv(1024)
+                    if hasattr(file, 'read'):
+                        read = file.read(1024)
+                    elif hasattr(file, 'recv'):
+                        read = file.recv(1024)
+                    else:
+                        self.logger.error('Invalid file type: %s\n%s' % (file))
+                        read = b''
+
+                    data = data + read
                     if data:
                         bootlog += data
                         if self.serial_ports < 2:
-                            # this socket has mixed console/kernel data, log it to logfile
+                            # this file has mixed console/kernel data, log it to logfile
                             self.log(data)
 
                         data = b''
@@ -493,8 +501,8 @@ class QemuRunner:
                         # no need to check if reachedlogin unless we support multiple connections
                         self.logger.debug("QEMU socket disconnected before login banner reached. (%s)" %
                                           time.strftime("%D %H:%M:%S"))
-                        socklist.remove(sock)
-                        sock.close()
+                        filelist.remove(file)
+                        file.close()
                         stopread = True
 
         if not reachedlogin:
-- 
2.34.1


