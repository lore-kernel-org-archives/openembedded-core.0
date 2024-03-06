Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A250AC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:24:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.16309.1709742232465350000
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:23:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aHIpxTFR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-413007fe6a3so2335495e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 08:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709742231; x=1710347031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iybBcQ0GKJ+psV6itqeztAqdDC2QHW4yKR1p8Jupa6c=;
        b=aHIpxTFRtyfaW/kfdZKgcFqWwobb1vjp1l1eP2umpQnowmku166gycfygelO3NRFvv
         H0zTl0G0kiazaJGnWwR6uwgFsKMFVbLDIH0TTsA1n1YtF5pemx6jyHbYKRfvFVH2Zof0
         olOXQhSt1J4yXqdCIsSMgzEWmAfSataZYwE28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742231; x=1710347031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iybBcQ0GKJ+psV6itqeztAqdDC2QHW4yKR1p8Jupa6c=;
        b=nr9t+XHmb/j42M1r8SJX0MYMC3R6XHLmafvdzg36C9/ET/UP2Cvvfs641phTGzzNQn
         3HWRux2yXLW3AT8Rwy3FZXbFpaojAytxp+PX5wkDtFTGZF+OUgqjb6eqhRr/SaK3rzlP
         2RY+VzidW0Tq87eCatkdeRUrogVenhJCDlm7+YpwUzvNfs8TmTLe7wM3jguiDC6SV+Jc
         dSnH6QPGngQuO1CDZ9jHtQf4UrQKY5iHHO1yFp8XCY11uduLfArXH6apVQ0x5oU1f/np
         tjYp4dX/oXeajr0FAwVY6clOKrvcbibwohJUjSQ+5kfzuobg5OIfdbS7NwD/u21ohxB1
         QjtQ==
X-Gm-Message-State: AOJu0YyIiwWObI47lNgp8k9sQDzprFjbmY+hoi+mrdoRYp7rUgus0qh1
	SGN4QObaHb2C8a55eL7OC4s1cCrsC2OaXaJGk525xIbglAdrK/Ku8YI+227XLIEBsQXzS/nY/Sl
	j
X-Google-Smtp-Source: AGHT+IFw6pP77739ZvIS5pLWLTdwGOjDNwGEUINKQxPpuLbmvdkPsGZO48ZEwyo5kZwmxP3kLEfsZA==
X-Received: by 2002:a05:600c:19d1:b0:412:b53f:99e4 with SMTP id u17-20020a05600c19d100b00412b53f99e4mr10362620wmq.40.1709742230766;
        Wed, 06 Mar 2024 08:23:50 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f9c:b564:4f14:a0ea])
        by smtp.gmail.com with ESMTPSA id k34-20020a05600c1ca200b00412f81ba413sm1929791wms.11.2024.03.06.08.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 08:23:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 9/9] sstatetests.py: Add testing for correct sstate permissions
Date: Wed,  6 Mar 2024 16:23:41 +0000
Message-Id: <20240306162341.2267587-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
References: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 16:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196744

From: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>

This patch adds to run_test_sstate_creation so that it also tests
that sstate directories don't accidentally pickup umask permissions
from the user upon creation.

[RP: Python style tweaking]
Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 28 ++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 56dfcdb0f39..031c2266ace 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -79,7 +79,7 @@ class SStateBase(OESelftestTestCase):
                         result.append(f)
         return result
 
-    # Test sstate files creation and their location
+    # Test sstate files creation and their location and directory perms
     def run_test_sstate_creation(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True, should_pass=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
 
@@ -88,6 +88,19 @@ class SStateBase(OESelftestTestCase):
         else:
             bitbake(['-ccleansstate'] + targets)
 
+        # We need to test that the env umask have does not effect sstate directory creation
+        # So, first, we'll get the current umask and set it to something we know incorrect
+        # See: sstate_task_postfunc for correct umask of os.umask(0o002)
+        import os
+        def current_umask():
+            current_umask = os.umask(0)
+            os.umask(current_umask)
+            return current_umask
+
+        orig_umask = current_umask()
+        # Set it to a umask we know will be 'wrong'
+        os.umask(0o022)
+
         bitbake(targets)
         file_tracker = []
         results = self.search_sstate('|'.join(map(str, targets)), distro_specific, distro_nonspecific)
@@ -104,6 +117,19 @@ class SStateBase(OESelftestTestCase):
         else:
             self.assertTrue(not file_tracker , msg="Found sstate files in the wrong place for: %s (found %s)" % (', '.join(map(str, targets)), str(file_tracker)))
 
+        # Now we'll walk the tree to check the mode and see if things are incorrect.
+        badperms = []
+        for root, dirs, files in os.walk(self.sstate_path):
+            for directory in dirs:
+                if (os.stat(os.path.join(root, directory)).st_mode & 0o777) != 0o775:
+                    badperms.append(os.path.join(root, directory))
+
+        # Return to original umask
+        os.umask(orig_umask)
+
+        if should_pass:
+            self.assertTrue(badperms , msg="Found sstate directories with the wrong permissions: %s (found %s)" % (', '.join(map(str, targets)), str(badperms)))
+
     # Test the sstate files deletion part of the do_cleansstate task
     def run_test_cleansstate_task(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
-- 
2.40.1


