Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id CA7427E49C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:30:47 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id u8so2759197wmm.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jz7S85s2HKi2+kubAuZRHBYjIgsEMZU2+Ud/pjmU778=;
	b=NdfrJ4FHlaBR6EL+4bkHoqvsggCjfAR+5rDRjttbOdqSH0ZTyMDKBKdh+yAED/DOTm
	jLqEaVrU/zXHW3oiyhKwGzeVUosZ2iNxFnJedfDdi0CeBoEZQ8fGfHFjVZjSZ4xP42FO
	YLklkgGNmawwqHcFsDaUPflQ4wis13e5m6V3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jz7S85s2HKi2+kubAuZRHBYjIgsEMZU2+Ud/pjmU778=;
	b=sJyOdhX2XJpVhYdFfYBvxXRxzXjOd+b3iaWgzrpSns5kEEHRuUpNM3i3HD68vs3Zx1
	vm9c/wFRsQBD4WC1GRdx1fhTOxFjPPkPfQTOueG0ZiQcir4V9kOqDPagWlsIjruCgKya
	rNkevKI8xZffFDzWX5KBej4CzN+GxiHSX3oCdY/PAQTGIKOI1dq3LTsFwADy8K/QuiRA
	lbh19NtqKRlROYT2mG4VI3SnAYhu97nMVFhni9vwHBvwCrG8tfJHglF39GJsvlnAU7Lp
	7u6WMav/HpLWQUoZDnF0krCE3Ikl1e95r8ys3MphzJI7IOON2/XhUM/DMUcFEOLxi2lK
	WVHw==
X-Gm-Message-State: APjAAAUfMUc2CR+WThyD8HnFQJD4KI8AXl2OAFWuZlldeakkJnnhrnx8
	MfRnGhLAS4zQbVQ1IfiRkERN35ovimo=
X-Google-Smtp-Source: APXvYqy0yx4oCfe81WR9RsgTEPoPiE/lxWFP8cftcAmGTFmITQuPOhj5jRz8YUC3Gl5I2seTvwm7Qg==
X-Received: by 2002:a05:600c:20c3:: with SMTP id
	y3mr3437396wmm.3.1561566648195; 
	Wed, 26 Jun 2019 09:30:48 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s63sm1484460wme.17.2019.06.26.09.30.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 26 Jun 2019 09:30:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 17:30:41 +0100
Message-Id: <20190626163044.4606-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626163044.4606-1-richard.purdie@linuxfoundation.org>
References: <20190626163044.4606-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/5] oeqa/runtime/syslog: Improve test debug messages
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
X-List-Received-Date: Wed, 26 Jun 2019 16:30:48 -0000
Content-Transfer-Encoding: 8bit

Its useful to test whether the restart command returned an error code and
exit early from the test if so.

Also add different messages to tell if the syslog processes didn't
die or didn't restart.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/oe_syslog.py | 32 +++++++++++++++---------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index 0f79e5a0f38..f987dccfb1b 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -43,31 +43,38 @@ class SyslogTestConfig(OERuntimeTestCase):
     def restart_sanity(self, names, restart_cmd):
         status, original_pids = self.verify_running(names)
         if status:
-            return 1
+            return False
 
         status, output = self.target.run(restart_cmd)
 
+        msg = ('Could not restart %s service. Status and output: %s and %s' % (names, status, output))
+        self.assertEqual(status, 0, msg)
+
         # Always check for an error, most likely a race between shutting down and starting up
         timeout = time.time() + 30
 
+        restarted = False
+        status = ""
         while time.time() < timeout:
             # Verify the previous ones are no longer running
             status = self.verif_not_running(original_pids)
             if status:
+                status = "Original syslog processes still running"
                 continue
 
             status, pids = self.verify_running(names)
             if status:
+                status = "New syslog processes not running"
                 continue
 
             # Everything is fine now, so exit to continue the test
-            status = 0
+            restarted = True
             break
 
-        msg = ('Could not restart %s service. Status and output: %s and %s'
-               %(names, status, output))
-        self.assertEqual(status, 0, msg)
+        msg = ('%s didn\'t appear to restart: %s' % (names, status))
+        self.assertTrue(restarted, msg)
 
+        return True
 
     @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
     def test_syslog_logger(self):
@@ -88,13 +95,14 @@ class SyslogTestConfig(OERuntimeTestCase):
 
     @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
     def test_syslog_restart(self):
-        status = self.restart_sanity(['systemd-journald'], 'systemctl restart syslog.service')
-        if status:
-            status = self.restart_sanity(['rsyslogd'], '/etc/init.d/rsyslog restart')
-            if status:
-                status = self.restart_sanity(['syslogd', 'klogd'], '/etc/init.d/syslog restart')
-            else:
-                self.logger.info("No syslog found to restart, ignoring")
+        if self.restart_sanity(['systemd-journald'], 'systemctl restart syslog.service'):
+            pass
+        elif self.restart_sanity(['rsyslogd'], '/etc/init.d/rsyslog restart'):
+            pass
+        elif self.restart_sanity(['syslogd', 'klogd'], '/etc/init.d/syslog restart'):
+            pass
+        else:
+            self.logger.info("No syslog found to restart, ignoring")
 
 
     @OETestDepends(['oe_syslog.SyslogTestConfig.test_syslog_logger'])
-- 
2.20.1


