Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68DAC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 09:32:48 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.2660.1663061566113376592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 02:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UsBdHRA4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id h8so12808697wrf.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 02:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=LVmWAOaTIbY2ClO2bP3WC0GJGJb7kmKefk/WgQ3s5+E=;
        b=UsBdHRA4Oa1rvabufOo9MK0VkEIBdLVKhPD5D7DFWtFyiy9x67dUWMy4A5c1LeWqBj
         OlSw3xwipcjhkDq4Z/rH/RwEWGWrXUXrZATdQk2DDKQ7I0BLIfPzAUZLGCJkEgXCe5r/
         6PIpcH4lpE8Uo+uemaVIxKErjHZznGZBxND+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=LVmWAOaTIbY2ClO2bP3WC0GJGJb7kmKefk/WgQ3s5+E=;
        b=nHvID5S+MU9Be2MFVaNFt66SO5MkUL782ISUAYLndzf5vfuFmZPcrMPYY+s9euAWPo
         JHiWgAFIuaprCGsONhFvPWOM465bHXnIKjENLJ495IlkcytWlQKfF6QolbgwIiCNcvqJ
         6RwLvWA/y1cneszS6WsiwrVDFc2wk8bbSaT/m6La5QLuPQaKiZK4bt5eCYRpCVPd0Jz6
         TwNIKQmn5jVx9njc4C52YJG5F4irGiTr4lzgsgEDSMVj+q3qnTWkfkJqr1n42XPyj1v+
         IDOdsGFWOzkybBetSd0unnLSAPSH8pMAdcZvT+eQLd4h4afnwzMlCFgsYo991uWzMLJ+
         fR2g==
X-Gm-Message-State: ACgBeo2WORHvCYt47CpbaH3O8mG5LlJQzm3GgMzKZLuqQpOjYU513Dna
	wL4980jK/kwTYiQPBFYqZA5yRJfKAXPzoQ==
X-Google-Smtp-Source: 
 AA6agR5l+qGDgMItx+UeaRiEMGjq4IBnLwfZRtwTMiyaIcHe+3Sf2X6fwNPiUIxC/X9c+AX9oOyz5w==
X-Received: by 2002:a5d:6da5:0:b0:222:4634:6a4e with SMTP id
 u5-20020a5d6da5000000b0022246346a4emr18029196wrs.172.1663061563908;
        Tue, 13 Sep 2022 02:32:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b740:75b6:5b77:5982])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a5d5648000000b00228bf773b1fsm9894954wrw.7.2022.09.13.02.32.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 02:32:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/qemurunner: Work around possible control character
 contamination
Date: Tue, 13 Sep 2022 10:32:42 +0100
Message-Id: <20220913093242.952083-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 09:32:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170561

Using a binary string as the login banner search expression is fraught with
risks. We've seen cases on the autobuilder where "login:" is clearly shown
but the code hasn't triggered. The most likely cause is hidden control characters
in the output causing the search to fail.

Take the opportunity to remove the horrible binary string search, at the expense of
decoding the bootlog multiple times.

Tweak the logging so we can know which log was printed (self.msg or bootlog)
just in case this isn't the issue and we need more information in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testimage.bbclass |  6 +-----
 meta/lib/oeqa/utils/qemurunner.py     | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 8d2fab21dff..819c7d2bf4c 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -189,11 +189,7 @@ def get_testimage_boot_patterns(d):
                     search_login_succeeded,search_cmd_finished\n Make sure your TESTIMAGE_BOOT_PATTERNS=%s \
                     contains an accepted flag.' % d.getVar('TESTIMAGE_BOOT_PATTERNS'))
                     return
-                # We know boot prompt is searched through in binary format, others might be expressions
-                if flag == 'search_reached_prompt':
-                    boot_patterns[flag] = flagval.encode()
-                else:
-                    boot_patterns[flag] = flagval.encode().decode('unicode-escape')
+                boot_patterns[flag] = flagval.encode().decode('unicode-escape')
     return boot_patterns
 
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 948f8adc9f1..6a85f57e498 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -85,7 +85,7 @@ class QemuRunner:
         accepted_patterns = ['search_reached_prompt', 'send_login_user', 'search_login_succeeded', 'search_cmd_finished']
         default_boot_patterns = defaultdict(str)
         # Default to the usual paterns used to communicate with the target
-        default_boot_patterns['search_reached_prompt'] = b' login:'
+        default_boot_patterns['search_reached_prompt'] = ' login:'
         default_boot_patterns['send_login_user'] = 'root\n'
         default_boot_patterns['search_login_succeeded'] = r"root@[a-zA-Z0-9\-]+:~#"
         default_boot_patterns['search_cmd_finished'] = r"[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#"
@@ -109,12 +109,15 @@ class QemuRunner:
             sock.close()
             raise
 
+    def decode_qemulog(self, todecode):
+        # Sanitize the data received from qemu as it may contain control characters
+        msg = todecode.decode("utf-8", errors='ignore')
+        msg = re_control_char.sub('', msg)
+        return msg
+
     def log(self, msg):
         if self.logfile:
-            # It is needed to sanitize the data received from qemu
-            # because is possible to have control characters
-            msg = msg.decode("utf-8", errors='ignore')
-            msg = re_control_char.sub('', msg)
+            msg = self.decode_qemulog(msg)
             self.msg += msg
             with codecs.open(self.logfile, "a", encoding="utf-8") as f:
                 f.write("%s" % msg)
@@ -468,7 +471,9 @@ class QemuRunner:
                             self.log(data)
 
                         data = b''
-                        if self.boot_patterns['search_reached_prompt'] in bootlog:
+
+                        decodedlog = self.decode_qemulog(bootlog)
+                        if self.boot_patterns['search_reached_prompt'] in decodedlog:
                             self.server_socket = qemusock
                             stopread = True
                             reachedlogin = True
@@ -488,10 +493,10 @@ class QemuRunner:
                 self.logger.warning("Target didn't reach login banner in %d seconds (%s)" %
                                   (self.boottime, time.strftime("%D %H:%M:%S")))
             tail = lambda l: "\n".join(l.splitlines()[-25:])
-            bootlog = bootlog.decode("utf-8")
+            bootlog = self.decode_qemulog(bootlog)
             # in case bootlog is empty, use tail qemu log store at self.msg
             lines = tail(bootlog if bootlog else self.msg)
-            self.logger.warning("Last 25 lines of text:\n%s" % lines)
+            self.logger.warning("Last 25 lines of text (%d):\n%s" % (len(bootlog), lines))
             self.logger.warning("Check full boot log: %s" % self.logfile)
             self._dump_host()
             self.stop()
-- 
2.34.1


