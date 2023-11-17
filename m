Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEC6C5AE4B
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 11:12:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.9054.1700219559532038603
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 03:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=nUsfhsyk;
 spf=pass (domain: baylibre.com, ip: 209.85.128.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40906fc54fdso15768295e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 03:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700219557; x=1700824357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETVTJ5File0JK0UXg/b/p+iziwLzQW1xU1GCRisKjB4=;
        b=nUsfhsykuTHh+bspXgmGN/pqhUqzEX1z0Gx2NBjdCuCt1ecn5Dqk/cyYkJz0gCtODd
         0bk/WhOfukUGz1BlSI+IJYK5+ST+6UlebnhsAJraKweZR1Yqh6FmJeQ21QgVMivA6e6A
         bMyEqeZX4E9ETrKiQcqMN7+we+cFHOfaW0dTK1Fzf3WvQxroT+M4sM/lO/Lcu0WN/tkM
         I2bNI72DBNSx5y1xPCXisHDdFkwgJBsQkP1AAATuj4UsdiaZDwT1+aEBSmgtgwUnG7oG
         4+jflcZY973d2pT45dQZfFGtz9V/bXQxOgJtFGP9zO0JD6tYBqT5D2APhsnqBMFOeHBf
         lwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700219557; x=1700824357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETVTJ5File0JK0UXg/b/p+iziwLzQW1xU1GCRisKjB4=;
        b=xUcPaenxXggPFW+dXb9BXLLSsEEjlr75dtrtIubWkLRxdRRP2toTEn6QSrUbGaKAAW
         44R2AVWwkTMMlChHQWELxtK87dQYYlCFdg/lx9aW2LkF4EbaAHuwJIjqFBv7dgi2Qs6b
         3CDZhd6Y7wQcXKGQ1KDc0MQxvbEgJ4NspqgsZ4E4qHWOYJ/8++bkkC/mJZeKnH+N6Tp4
         3ENmQZfqVHMyecYaqAEPNFfzqssojpgjGs5nCATdV9x1bpx7T+YzGz0S9uDWvBtHB85v
         T6VoTEiSC/myWW03K8JCjqR36VjY9vJuNcMldDxTBAW9G2PKAKz0WMv5890gjIAH5SW7
         c9Wg==
X-Gm-Message-State: AOJu0YwkMg3IyidFCZzVdP9tX9SvaU+a1I0vPRBmMCtDH4oG8ZZIcHg+
	PFxNmxeympAc28p254RWIUbdeDMx9Gpnh8HektpzDw==
X-Google-Smtp-Source: AGHT+IEbrm+vAypHT8HLW6sZ3x2baeFAgY1bwwOa2Nk9aMwngkTScP9TYcgrvASThAJNqEuLdzlQ9Q==
X-Received: by 2002:a5d:6d06:0:b0:32d:857c:d51c with SMTP id e6-20020a5d6d06000000b0032d857cd51cmr15869399wrq.43.1700219556795;
        Fri, 17 Nov 2023 03:12:36 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id z5-20020adff745000000b0032d829e10c0sm1982440wrp.28.2023.11.17.03.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 03:12:36 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 1/7] bitbake: utils: remove spaces on empty lines
Date: Fri, 17 Nov 2023 12:12:12 +0100
Message-ID: <20231117111218.3344066-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117111218.3344066-1-jstephan@baylibre.com>
References: <20231117111218.3344066-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 11:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190837

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


