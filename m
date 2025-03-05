Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0E7C282EC
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:36 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.6373.1741212691944950560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=K79ga96b;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22337bc9ac3so140566485ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212691; x=1741817491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bCGD/6NyZ10nfpO/DzGfWKXOY3Rma9RrjkaVk9DTO4=;
        b=K79ga96bRTwvVSZoblj+y7Veb2RricG+c7OFH1yYPNhmIypGLK47INfA6pgEHFWcIO
         M8HL1I916AigSqiElPmU3eefMr744nVukj1wchw0y3jsoRSRINqTfzO5Vrjo+De/hyAB
         EvjPto6O8meJPm2u/Wa0gB9XHLg9IaxgYPbOLg+dZ76kYi4gProWWVYut9pf1STqd/vl
         ULKJHk5uXVuJYUQs+WF1B5/M4iNP9zusyE3gFEnm2V5jrG/1vW1LYUDA0hzZyk9ZvLPw
         es075MTnwCO+EUytOC8Xc3Mklt/mUryjLcpGIj0Pl3E7VSMkX7Q2JMdHdumjrrrGjnvV
         kNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212691; x=1741817491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bCGD/6NyZ10nfpO/DzGfWKXOY3Rma9RrjkaVk9DTO4=;
        b=Nihju8nfbpaofaI7oZek/fyuGIYR3xsdlPKptd+/ek8bdeT/ZlpwR7MS4RCUpCuz9w
         wddrCtjoGGBVnP7V46osALenGObLaeKvpMV3zjUPt5FoD87vn57EzRDoFH4f/wcB8ULv
         LHItZiraRSHoEamSnYW69lybVAu8WVi3rpk8UbOliTWg5lNFS7WaUxsHmdiawVuOdXwZ
         Zh+Z0d1yF1A0x/NAyoFljhAJRAek0QPw0QZptymhWKgXQ8V99PjXLYPOx4NsEAhg9wdQ
         tGaVD3lHdW31nSYFtHP1OLjglkOHXsS/stJiqlz0jiRaBX3fKhYy4tdXrOiyniuZ3qkq
         Jtow==
X-Gm-Message-State: AOJu0YyLk2HLL6eGaTtoaGNImMRvIkFFVQ9ipP9M7JD5tlZJPzq1pFes
	9kHe3FMQq8AcEsEb7y4Bl1mrzYMXxobd9iODe5uahT3bTjyBK1+iK5nABNRY/O6iHLrwEpp5PL0
	C
X-Gm-Gg: ASbGncuh3iLULb77WeEz1ejv1UeLXnoW1COYuDYNteFvrfWMkA0B+t1Cfxdoc2reubB
	0R0Q3ExxsojwxzuOBFb1JRQ0IsmWzhdNA/njT77nsaUoRDRTSnySFUp9eSQtSYQ73gIGAETAoUv
	Ag5EGoP4jEKJ8y4K0OfWFssB8DbTLRGME701+hBnwv1OLGr5JxUYBpPhuFI+UY9WQC2dUbrm05/
	E1cflhPwQPhituwnDhjPuSKSsM0QE9eUaV1hrv548useCMMCq6Us+XIW+D7Y/AxONfBC07pPrTN
	kn66ghlJKT8E7eRT38wsb7rGI5kv0lr48EI=
X-Google-Smtp-Source: AGHT+IEXXx+7C1sNM5a/YCoOci+11SqElRBs7jYfO4DUfSSZKFRh9OwedDU4DfTUWJUb9DLzs+r7bw==
X-Received: by 2002:a05:6a00:3a1b:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-7368c0f8a4dmr4374589b3a.22.1741212691142;
        Wed, 05 Mar 2025 14:11:31 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/16] xwayland: Fix CVE-2025-26594
Date: Wed,  5 Mar 2025 14:11:03 -0800
Message-ID: <f6af10075bc8bf7e8ffb9054500529608d3bb8ba.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212354

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/01642f26 & https://gitlab.freedesktop.org/xorg/xserver/-/commit/b0a09ba6

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-26594-1.patch  | 54 +++++++++++++++++++
 .../xwayland/xwayland/CVE-2025-26594-2.patch  | 51 ++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  2 +
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-2.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-1.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-1.patch
new file mode 100644
index 0000000000..f34a89e6ea
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-1.patch
@@ -0,0 +1,54 @@
+From 01642f263f12becf803b19be4db95a4a83f94acc Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 27 Nov 2024 11:27:05 +0100
+Subject: [PATCH] Cursor: Refuse to free the root cursor
+
+If a cursor reference count drops to 0, the cursor is freed.
+
+The root cursor however is referenced with a specific global variable,
+and when the root cursor is freed, the global variable may still point
+to freed memory.
+
+Make sure to prevent the rootCursor from being explicitly freed by a
+client.
+
+CVE-2025-26594, ZDI-CAN-25544
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+v2: Explicitly forbid XFreeCursor() on the root cursor (Peter Hutterer
+<peter.hutterer@who-t.net>)
+v3: Return BadCursor instead of BadValue (Michel Danzer
+<michel@daenzer.net>)
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Suggested-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/01642f26]
+CVE: CVE-2025-26594
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/dispatch.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/dix/dispatch.c b/dix/dispatch.c
+index 4602961..30b95c1 100644
+--- a/dix/dispatch.c
++++ b/dix/dispatch.c
+@@ -3107,6 +3107,10 @@ ProcFreeCursor(ClientPtr client)
+     rc = dixLookupResourceByType((void **) &pCursor, stuff->id, RT_CURSOR,
+                                  client, DixDestroyAccess);
+     if (rc == Success) {
++        if (pCursor == rootCursor) {
++	    client->errorValue = stuff->id;
++	    return BadCursor;
++	}
+         FreeResource(stuff->id, RT_NONE);
+         return Success;
+     }
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-2.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-2.patch
new file mode 100644
index 0000000000..6ebf540ab9
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-2.patch
@@ -0,0 +1,51 @@
+From b0a09ba6020147961acc62d9c73d807b4cccd9f7 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Wed, 4 Dec 2024 15:49:43 +1000
+Subject: [PATCH] dix: keep a ref to the rootCursor
+
+CreateCursor returns a cursor with refcount 1 - that refcount is used by
+the resource system, any caller needs to call RefCursor to get their own
+reference. That happens correctly for normal cursors but for our
+rootCursor we keep a variable to the cursor despite not having a ref for
+ourselves.
+
+Fix this by reffing/unreffing the rootCursor to ensure our pointer is
+valid.
+
+Related to CVE-2025-26594, ZDI-CAN-25544
+
+Reviewed-by: Olivier Fourdan <ofourdan@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b0a09ba6]
+CVE: CVE-2025-26594
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/main.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/dix/main.c b/dix/main.c
+index bfc8add..38e29ce 100644
+--- a/dix/main.c
++++ b/dix/main.c
+@@ -231,6 +231,8 @@ dix_main(int argc, char *argv[], char *envp[])
+             FatalError("could not open default cursor font");
+         }
+ 
++        rootCursor = RefCursor(rootCursor);
++
+ #ifdef PANORAMIX
+         /*
+          * Consolidate window and colourmap information for each screen
+@@ -271,6 +273,8 @@ dix_main(int argc, char *argv[], char *envp[])
+ 
+         Dispatch();
+ 
++        UnrefCursor(rootCursor);
++
+         UndisplayDevices();
+         DisableAllDevices();
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index c88fdb6e9f..3af0bb9012 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-9632.patch \
+           file://CVE-2025-26594-1.patch \
+           file://CVE-2025-26594-2.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


