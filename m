Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0D7C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 13:58:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.74222.1705931900137075900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 05:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IuOeYOTz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40eb033c192so3686745e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705931898; x=1706536698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTZP4rWPRNaWfLFCZ8Sys7FTA/NCI/BifJtPPOaZluw=;
        b=IuOeYOTz5XOQQJ3FVq1Jji+/kbk1rq/Uk40mhWhfOFFZ7pnA/cxa7wXKEYIwb0bcl4
         +P5dA/jLwn6M2FszkfF4lVSVwdE1LAaZj8hU/N19lSyzcADfuLKLuZZMUqbQs86py+RW
         GC5/fKJZ9rtJ2bL5ald/r/P9hZXuFuoRev9oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931898; x=1706536698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OTZP4rWPRNaWfLFCZ8Sys7FTA/NCI/BifJtPPOaZluw=;
        b=GLuesx9boRV8/2grRdv+c6VjYJ0B+fnX2I2EwIQ1Wq6lp44zlzYibzbd+pVl8A8cip
         BMIvJTnemWPBYjDQgrmsvaADWpo5u0A2R//PwUSmw6ygEEkKhUSi1f/koozz4Ip6whmM
         r0yelxR9tP1Ud8mbAYQMJCKDAGmas0AJqVNTWyc8Ow+p6s+7zln0lJO/3to1Whwm7WWi
         d//bXJ0xk5SPlgHjv8QLjXr7Hjt1gWeg4dIkau2XzoISYV+r5MqyiMSzzs3tjESj7e3L
         uCSE16MQ1cmEJg4XdTZXWZqZs4tA94iUoeAxGYRgpwPkIHjxteROV9G+hnmHrXSRSk6V
         pigA==
X-Gm-Message-State: AOJu0YwUmL5J3x6cXSrLo8MVtjldNqrXyzR1CWni1A6eaR+SMzBtNOjR
	jF65YONfBOdyS4YaldFMeW+/dSCdDphBO3wjXZXb5vwqkioqDDXV6b230plOB3PW0O5MsnKQKVx
	+
X-Google-Smtp-Source: AGHT+IHYdrti5ToFOV54o5P24CmaSSAE9g0td0z+tV4sSwwUyQnTT54wiJrGBznNerRmHm15VeHuwg==
X-Received: by 2002:a05:600c:3b18:b0:40e:b1f3:a350 with SMTP id m24-20020a05600c3b1800b0040eb1f3a350mr288333wms.17.1705931897995;
        Mon, 22 Jan 2024 05:58:17 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a57c:4d56:a1d0:e701])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c0a0a00b0040e486bc0dfsm43607481wmp.27.2024.01.22.05.58.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:58:17 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xev: Drop diet libx11 related patch
Date: Mon, 22 Jan 2024 13:58:16 +0000
Message-Id: <20240122135816.486911-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 13:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194148

We dropped diet-libx11 back in 2019 in 1a502765db2093e573c9e3ecd6c1bc7621476963.
Drop the patch we don't need from xev to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-app/xev/diet-x11.patch               | 114 ------------------
 meta/recipes-graphics/xorg-app/xev_1.2.5.bb   |   2 -
 2 files changed, 116 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-app/xev/diet-x11.patch

diff --git a/meta/recipes-graphics/xorg-app/xev/diet-x11.patch b/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
deleted file mode 100644
index 361369b2910..00000000000
--- a/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From b9b2b8d1af283a13cdccea55562cf332de48dcb9 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross@openedhand.com>
-Date: Wed, 28 Mar 2007 16:10:50 +0000
-Subject: [PATCH] Add xev
-
-Upstream-Status: Inappropriate [disable feature]
-
----
- xev.c | 64 +----------------------------------------------------------
- 1 file changed, 1 insertion(+), 63 deletions(-)
-
-diff --git a/xev.c b/xev.c
-index ea69234..6d5eb30 100644
---- a/xev.c
-+++ b/xev.c
-@@ -175,17 +175,6 @@ do_KeyPress(XEvent *eventp)
-     nbytes = XLookupString(e, str, 256, &ks, NULL);
- 
-     /* not supposed to call XmbLookupString on a key release event */
--    if (e->type == KeyPress && xic) {
--        do {
--            nmbbytes = XmbLookupString(xic, e, buf, bsize - 1, &ks, &status);
--            buf[nmbbytes] = '\0';
--
--            if (status == XBufferOverflow) {
--                bsize = nmbbytes + 1;
--                buf = realloc(buf, bsize);
--            }
--        } while (status == XBufferOverflow);
--    }
- 
-     if (ks == NoSymbol)
-         ksname = "NoSymbol";
-@@ -220,16 +209,6 @@ do_KeyPress(XEvent *eventp)
-     }
- 
-     /* not supposed to call XmbLookupString on a key release event */
--    if (e->type == KeyPress && xic) {
--        output(Indent, "XmbLookupString gives %d bytes: ", nmbbytes);
--        if (nmbbytes > 0) {
--            dump(buf, nmbbytes);
--            output(NewLine, " \"%s\"", buf);
--        }
--        else {
--            output_new_line();
--        }
--    }
- 
-     output(Indent | NewLine, "XFilterEvent returns: %s",
-            XFilterEvent(eventp, e->window) ? "True" : "False");
-@@ -1211,7 +1190,7 @@ parse_event_mask(const char *s, long event_masks[])
-             if (s)
-                 return True;
-         }
--    }
-+	}
- 
-     if (s != NULL)
-         fprintf(stderr, "%s: unrecognized event mask '%s'\n", ProgramName, s);
-@@ -1361,37 +1340,6 @@ main(int argc, char **argv)
-         fprintf(stderr, "%s:  XSetLocaleModifiers failed\n", ProgramName);
-     }
- 
--    xim = XOpenIM(dpy, NULL, NULL, NULL);
--    if (xim == NULL) {
--        fprintf(stderr, "%s:  XOpenIM failed\n", ProgramName);
--    }
--
--    if (xim) {
--        imvalret = XGetIMValues(xim, XNQueryInputStyle, &xim_styles, NULL);
--        if (imvalret != NULL || xim_styles == NULL) {
--            fprintf(stderr, "%s:  input method doesn't support any styles\n",
--                    ProgramName);
--        }
--
--        if (xim_styles) {
--            xim_style = 0;
--            for (i = 0; i < xim_styles->count_styles; i++) {
--                if (xim_styles->supported_styles[i] ==
--                    (XIMPreeditNothing | XIMStatusNothing)) {
--                    xim_style = xim_styles->supported_styles[i];
--                    break;
--                }
--            }
--
--            if (xim_style == 0) {
--                fprintf(stderr,
--                        "%s: input method doesn't support the style we support\n",
--                        ProgramName);
--            }
--            XFree(xim_styles);
--        }
--    }
--
-     screen = DefaultScreen(dpy);
- 
-     attr.event_mask = event_masks[EVENT_MASK_INDEX_CORE];
-@@ -1446,16 +1394,6 @@ main(int argc, char **argv)
-         printf("Outer window is 0x%lx, inner window is 0x%lx\n", w, subw);
-     }
- 
--    if (xim && xim_style) {
--        xic = XCreateIC(xim,
--                        XNInputStyle, xim_style,
--                        XNClientWindow, w, XNFocusWindow, w, NULL);
--
--        if (xic == NULL) {
--            fprintf(stderr, "XCreateIC failed\n");
--        }
--    }
--
-     have_rr = XRRQueryExtension(dpy, &rr_event_base, &rr_error_base);
-     if (have_rr) {
-         int rr_major, rr_minor;
diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.5.bb b/meta/recipes-graphics/xorg-app/xev_1.2.5.bb
index 0e3def6eee4..1d2e66b7b48 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.5.bb
@@ -12,8 +12,6 @@ PE = "1"
 
 DEPENDS += "libxrandr xorgproto"
 
-SRC_URI += "file://diet-x11.patch"
-
 SRC_URI[sha256sum] = "c9461a4389714e0f33974f9e75934bdc38d836a0f059b8dc089c7cbf2ce36ec1"
 
 SRC_URI_EXT = "xz"
-- 
2.40.1


