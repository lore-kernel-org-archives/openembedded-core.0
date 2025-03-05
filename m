Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BB8C282DE
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:04 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.16701.1741190337946481430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ncczN74t;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22359001f1aso161139645ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190337; x=1741795137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Yb3eqoUe9GC7QHGUVL5+wDSpEnZerSbqoioQeD6nm8=;
        b=ncczN74tRvl2F0littzs4Czg6TH3gzQYxqqqru4AoUc+WsdKWjYYZs4qsASyWYXsWg
         y13zuiy8czxRG4HijZo1Pfib7E/XcCAKQizBJCGbgaRSez24Vqg6xKqDMaO9ydqyw9GZ
         GWhMFGRsjWEfsmvNbRpL6aPl1t/HauEYGGeLl3TzRNYdGoNc+iT1Wj94sSBzsbxRjoz7
         RviKZJrhgb2eQyM56RYvyrjOgwIKtnr3uIhO70HPpNSoFBn0HyPrwVa+EPuhluOcihMW
         mM1Rlf104U9RGDLDnjLMyH4DFAtxHsFiRjEyY3w98+5TSg68zNX67JXDs3jw/hB4i0OH
         3JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190337; x=1741795137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Yb3eqoUe9GC7QHGUVL5+wDSpEnZerSbqoioQeD6nm8=;
        b=iT3+TSf3kksa85aTZDzotNii0UmrlUhWuYMQgl+Mpfkp/bCjRVJ42S7s4L1hjOzv6x
         astUKal9fKUiihf6Zlb6woAuBr153iPeUyrcMwBLMU+YDDh/lo6g8FSLAqTJE9KgU+8F
         CsJRa36Ne/JD/6j3QP10R8nLjzksDsK/rHMwyICnARzPSTFt7mvW/B25hfxFsgbvXX8V
         T9n6o7T9DPsVsJFtjGdonH9Q1d7xwK1vvXp2Fh3V6tmKlTeGoKfsxcuzOJnkljQtRlRz
         GnPZaMRf6jSZLx9vTM7aHgMCUEq+PefXyF1MI874NY5lBS0mY3DGmjC3i7qphOXhygMg
         wyVA==
X-Gm-Message-State: AOJu0YzelqxsP0G3Qgd1hLIRsSpwg/1eKntAY+T1t59iKOSrjbBkRZwm
	5NjlvAbG1BdsFgXBVFgzfe6kxsIHcJSYWOY0s6hINJ7YDPSPL17vFaRs6XU/JJoSeheXePP7FX9
	o
X-Gm-Gg: ASbGncvYtfG4cohX26i2hmHrygpu0qEgJkkuOBYcInrJaSquemxinwMBFr8SzfZUOk9
	c0y6bNzgWIzYBCy6JASQQ5hZJuICIvO9vsYlt3jqri4yjDnk7dBPoJ3iWiBRSQL3rOwbLFHqQ+R
	67P4s9SzJ3vN3ZSlRoCGsjfXvnuhZPXQzYVKTnapndSkPLMs96VWz9RZWdmp7nZQCtizYJvSDqV
	aLaBA3c9JZVt0OVckpdkT168/pdjKi/5KIPXlCgywEWE5kSQ5sCUpG+3FZnXq6WFZOvfg05rfpC
	gtw1xD9A2Dp160hrWkNOoW1pNpzSk8z9Hp0=
X-Google-Smtp-Source: AGHT+IHTocIJb7T/uywTjr9TJV1CFNFi7Pw5+7EJLt6UWVPlSmLZtUDhh+uXqNC60aHI4tniKGnDXg==
X-Received: by 2002:a17:902:f541:b0:21f:52e:939e with SMTP id d9443c01a7336-223f1caf82amr64485895ad.28.1741190337118;
        Wed, 05 Mar 2025 07:58:57 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.58.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:58:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/16] xwayland: Fix CVE-2024-21885
Date: Wed,  5 Mar 2025 07:58:31 -0800
Message-ID: <4b0f6aaa994eeab5d18211ace8034ec8b92b7419.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212324

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/4a5e9b1895627d40d26045bd0b7ef3dce503cbd1

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2024-21885.patch    | 113 ++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-21885.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-21885.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-21885.patch
new file mode 100644
index 0000000000..7c8fbcc3ec
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-21885.patch
@@ -0,0 +1,113 @@
+From 4a5e9b1895627d40d26045bd0b7ef3dce503cbd1 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Thu, 4 Jan 2024 10:01:24 +1000
+Subject: [PATCH] Xi: flush hierarchy events after adding/removing master
+ devices
+
+The `XISendDeviceHierarchyEvent()` function allocates space to store up
+to `MAXDEVICES` (256) `xXIHierarchyInfo` structures in `info`.
+
+If a device with a given ID was removed and a new device with the same
+ID added both in the same operation, the single device ID will lead to
+two info structures being written to `info`.
+
+Since this case can occur for every device ID at once, a total of two
+times `MAXDEVICES` info structures might be written to the allocation.
+
+To avoid it, once one add/remove master is processed, send out the
+device hierarchy event for the current state and continue. That event
+thus only ever has exactly one of either added/removed in it (and
+optionally slave attached/detached).
+
+CVE-2024-21885, ZDI-CAN-22744
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/4a5e9b1895627d40d26045bd0b7ef3dce503cbd1]
+CVE: CVE-2024-21885
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/xichangehierarchy.c | 27 ++++++++++++++++++++++-----
+ 1 file changed, 22 insertions(+), 5 deletions(-)
+
+diff --git a/Xi/xichangehierarchy.c b/Xi/xichangehierarchy.c
+index d2d985848d..72d00451e3 100644
+--- a/Xi/xichangehierarchy.c
++++ b/Xi/xichangehierarchy.c
+@@ -416,6 +416,11 @@ ProcXIChangeHierarchy(ClientPtr client)
+     size_t len;			/* length of data remaining in request */
+     int rc = Success;
+     int flags[MAXDEVICES] = { 0 };
++    enum {
++        NO_CHANGE,
++        FLUSH,
++        CHANGED,
++    } changes = NO_CHANGE;
+ 
+     REQUEST(xXIChangeHierarchyReq);
+     REQUEST_AT_LEAST_SIZE(xXIChangeHierarchyReq);
+@@ -465,8 +470,9 @@ ProcXIChangeHierarchy(ClientPtr client)
+             rc = add_master(client, c, flags);
+             if (rc != Success)
+                 goto unwind;
+-        }
++            changes = FLUSH;
+             break;
++        }
+         case XIRemoveMaster:
+         {
+             xXIRemoveMasterInfo *r = (xXIRemoveMasterInfo *) any;
+@@ -475,8 +481,9 @@ ProcXIChangeHierarchy(ClientPtr client)
+             rc = remove_master(client, r, flags);
+             if (rc != Success)
+                 goto unwind;
+-        }
++            changes = FLUSH;
+             break;
++        }
+         case XIDetachSlave:
+         {
+             xXIDetachSlaveInfo *c = (xXIDetachSlaveInfo *) any;
+@@ -485,8 +492,9 @@ ProcXIChangeHierarchy(ClientPtr client)
+             rc = detach_slave(client, c, flags);
+             if (rc != Success)
+                 goto unwind;
+-        }
++            changes = CHANGED;
+             break;
++        }
+         case XIAttachSlave:
+         {
+             xXIAttachSlaveInfo *c = (xXIAttachSlaveInfo *) any;
+@@ -495,16 +503,25 @@ ProcXIChangeHierarchy(ClientPtr client)
+             rc = attach_slave(client, c, flags);
+             if (rc != Success)
+                 goto unwind;
++            changes = CHANGED;
++            break;
+         }
++        default:
+             break;
+         }
+ 
++        if (changes == FLUSH) {
++            XISendDeviceHierarchyEvent(flags);
++            memset(flags, 0, sizeof(flags));
++            changes = NO_CHANGE;
++        }
++
+         len -= any->length * 4;
+         any = (xXIAnyHierarchyChangeInfo *) ((char *) any + any->length * 4);
+     }
+ 
+  unwind:
+-
+-    XISendDeviceHierarchyEvent(flags);
++    if (changes != NO_CHANGE)
++        XISendDeviceHierarchyEvent(flags);
+     return rc;
+ }
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index f639088b25..c7e5c7bd81 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-0229-2.patch \
            file://CVE-2024-0229-3.patch \
            file://CVE-2024-0229-4.patch \
+           file://CVE-2024-21885.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


