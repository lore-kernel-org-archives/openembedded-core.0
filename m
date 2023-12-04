Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A781EC46CA3
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:59:52 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.73097.1701705583979718006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=fUUXEtSA;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40bd5eaa66eso26736035e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701705582; x=1702310382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETVTJ5File0JK0UXg/b/p+iziwLzQW1xU1GCRisKjB4=;
        b=fUUXEtSAv3+uTrf624Qa9jA6qDL+7QomsInMQ3f9BMDnZs9rqo9lhyxxrtP/PVHDUs
         kyfjpPYEevdHvl6HEnMhqF59VaIR1mdXvs+Snz+N9SMANsrafIlrDcO+g2kWOSiuWITa
         MRz7X5ioqXnAMlfnu6gZWuDAYybgF0hkI0qgEQEjhC3+V+wCAuZ2ri1VDaQXhPqrEb0/
         Q48XlkpjTBZcYPBTJknCl7ONEbybLJ7R6r8ciGGPHxjncNaYwfYhwj5GLVLIsJppsTIV
         6aTo7n06Qxmtafnor7AGYlS9Nb4O6Nl6HRIENESpxpUInAHBBRF6AZH1upd+op7l2stm
         xUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705582; x=1702310382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETVTJ5File0JK0UXg/b/p+iziwLzQW1xU1GCRisKjB4=;
        b=g3f0gmKCX/dDhWxIzupO67FnSo8p66Ji3E96vovz6xIVZAEQIA9PLTc2PsnTwAjv7Z
         GRpJSAgVKciwnnccsmoxX6FdW7VIEW0Owr8RQKUZIokWUmU5gWf4cgOLiFWR54/EDPtq
         ndIlQ3yzW2sBRnRBPsb+irWrfCTg5r90Hwk1l5vjiS/WFJsBiFqiXm+MWADOT+VcBrhV
         ObTwdQSBOjSqUFRw5CuM/XkacuO3jlOSOEJV9bI28Qet/MJRY+BQdtrKiKPRHevYm9Ex
         B/RRwy397ApkvBOfVpIqlfEHSfgcytFYW2zOc/yhvrwg8NQzV+NxkG509ZEoQxjh4Xx4
         Yr6g==
X-Gm-Message-State: AOJu0YxVy0fVuULq76zchVO/kYfOn7qRQhSSc/jaXIkeONQoKHNHaTOi
	0z+GYJPf7MLHHBLENEfcLNwDD0a0ACM6aZkQKE0GEA==
X-Google-Smtp-Source: AGHT+IGd0D2pHsjgDPObbXjqvpdh0PwiyRxurclSVd4+/5qpGj8CDD+GGbPfKc+SeKnJLcqeumoiDA==
X-Received: by 2002:a05:600c:3545:b0:40b:4520:45af with SMTP id i5-20020a05600c354500b0040b452045afmr2662929wmq.23.1701705581996;
        Mon, 04 Dec 2023 07:59:41 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c4ed000b0040b47c53610sm15479595wmq.14.2023.12.04.07.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:59:41 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RESEND][PATCH 1/7] bitbake: utils: remove spaces on empty lines
Date: Mon,  4 Dec 2023 16:59:28 +0100
Message-ID: <20231204155934.836992-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204155934.836992-1-jstephan@baylibre.com>
References: <20231204155934.836992-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191754

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 bitbake/lib/bb/utils.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
index b401fa5ec7a..61ffad92ce3 100644
--- a/bitbake/lib/bb/utils.py
+++ b/bitbake/lib/bb/utils.py
@@ -50,7 +50,7 @@ def clean_context():
 
 def get_context():
     return _context
-    
+
 
 def set_context(ctx):
     _context = ctx
@@ -212,8 +212,8 @@ def explode_dep_versions2(s, *, sort=True):
             inversion = True
             # This list is based on behavior and supported comparisons from deb, opkg and rpm.
             #
-            # Even though =<, <<, ==, !=, =>, and >> may not be supported, 
-            # we list each possibly valid item. 
+            # Even though =<, <<, ==, !=, =>, and >> may not be supported,
+            # we list each possibly valid item.
             # The build system is responsible for validation of what it supports.
             if i.startswith(('<=', '=<', '<<', '==', '!=', '>=', '=>', '>>')):
                 lastcmp = i[0:2]
@@ -347,7 +347,7 @@ def _print_exception(t, value, tb, realfile, text, context):
         exception = traceback.format_exception_only(t, value)
         error.append('Error executing a python function in %s:\n' % realfile)
 
-        # Strip 'us' from the stack (better_exec call) unless that was where the 
+        # Strip 'us' from the stack (better_exec call) unless that was where the
         # error came from
         if tb.tb_next is not None:
             tb = tb.tb_next
@@ -746,9 +746,9 @@ def prunedir(topdir, ionice=False):
 # but thats possibly insane and suffixes is probably going to be small
 #
 def prune_suffix(var, suffixes, d):
-    """ 
+    """
     See if var ends with any of the suffixes listed and
-    remove it if found 
+    remove it if found
     """
     for suffix in suffixes:
         if suffix and var.endswith(suffix):
@@ -1001,9 +1001,9 @@ def umask(new_mask):
         os.umask(current_mask)
 
 def to_boolean(string, default=None):
-    """ 
+    """
     Check input string and return boolean value True/False/None
-    depending upon the checks 
+    depending upon the checks
     """
     if not string:
         return default
-- 
2.42.0


