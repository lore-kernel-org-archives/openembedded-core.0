Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id C99D07E437
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:30:49 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id r16so3448130wrl.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=c0aSqhZCMJwEgY0QKU8ha/7arsUjMiNVDweGs+892Es=;
	b=HJ+eDYJxfTeEzb1OqjODC8uSmWuww7yJ8lon8JQ2AZsazlhJrJy5rdCaKtYcjkZLfs
	4ikoTYebNaIWDNEYlxKSeY2TCvMEoZM2Ul4iLZGRfe+BAPHlIN8QNPfJ6ILor9NdQujt
	JbLfwi+iOcGYqu3vXg7Nuc/lUuiZJjDLQ3CN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=c0aSqhZCMJwEgY0QKU8ha/7arsUjMiNVDweGs+892Es=;
	b=Y4XcYEfd2UgfAbp/KnJF7MARJNBGf2M0iP+Fux9DgasZMLG8m6uJ9uZs+GS9QWhfq9
	8EtwA7yJmBCux6BxzAzITOHGn3RHwxU9AlGLNOVclw491JipRAwn21W2eIRz4sRf3DFL
	5c9XFwkjOv+/7n1UZnttJpH/qaPOkaY54bTnmZe3AQVAMPD/NujITANdCvvpXNIMxXg/
	dnqh8Y0ICE+Z5Ma069+jcUJWL/qxuhgspRABR+2OB3LFcPpYK1CV1L/Sm58OggJNXNuF
	jwb/baeGc59hTrvG0qIGnv2vKubunZMR9n5nP+ImJejr/9QDNRijew53C6bHbDvk+5H9
	DJEg==
X-Gm-Message-State: APjAAAXFH88qkHWhm0zJSDphpXCXo7Pn5KZYCaNbO6PjTGQxnPN8J0W6
	DQTpy8PuvcWJQiePZiZRakQ/EXqls+w=
X-Google-Smtp-Source: APXvYqyVhRZnYJhiBLzOVnFHTdP/pBQFrCb0TfmeOxLbXCCe2Wk6VoP9Q3tahIVCz/iXpz154BSfZg==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr4199277wrm.68.1561566650298;
	Wed, 26 Jun 2019 09:30:50 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s63sm1484460wme.17.2019.06.26.09.30.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 26 Jun 2019 09:30:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 17:30:43 +0100
Message-Id: <20190626163044.4606-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626163044.4606-1-richard.purdie@linuxfoundation.org>
References: <20190626163044.4606-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/5] oeqa/runtime/oesyslog: systemd syslog restart doesn't change pid
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
X-List-Received-Date: Wed, 26 Jun 2019 16:30:50 -0000
Content-Transfer-Encoding: 8bit

The systemd-journald process doesn't restart/change the way syslog
does, don't test/error in this case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/oe_syslog.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index f987dccfb1b..449df233d13 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -40,7 +40,7 @@ class SyslogTestConfig(OERuntimeTestCase):
         return 0, pids
 
 
-    def restart_sanity(self, names, restart_cmd):
+    def restart_sanity(self, names, restart_cmd, pidchange=True):
         status, original_pids = self.verify_running(names)
         if status:
             return False
@@ -50,6 +50,9 @@ class SyslogTestConfig(OERuntimeTestCase):
         msg = ('Could not restart %s service. Status and output: %s and %s' % (names, status, output))
         self.assertEqual(status, 0, msg)
 
+        if not pidchange:
+            return True
+
         # Always check for an error, most likely a race between shutting down and starting up
         timeout = time.time() + 30
 
@@ -95,7 +98,7 @@ class SyslogTestConfig(OERuntimeTestCase):
 
     @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
     def test_syslog_restart(self):
-        if self.restart_sanity(['systemd-journald'], 'systemctl restart syslog.service'):
+        if self.restart_sanity(['systemd-journald'], 'systemctl restart syslog.service', pidchange=False):
             pass
         elif self.restart_sanity(['rsyslogd'], '/etc/init.d/rsyslog restart'):
             pass
-- 
2.20.1


