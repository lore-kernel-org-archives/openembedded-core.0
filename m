Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF085C54EFC
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:32 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7151.1785054627036495154
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YFUnqmGN;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so13930275e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054625; x=1785659425; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0pjw6kR5NHhqrhjq/hQipYXI03U1dMLr3aOGRROc84=;
        b=YFUnqmGNgIJieEIWF1HCysrTWeHbCpP45XnkYd5DAqQABt9Vwo/M269pX7+C+9pLMj
         bvHSHEBB3fobPTMNH4stOcK2zIFu0kyDfkr8QruAmlN92Kjp0V5qllD7YnnKzHqZYEq3
         8yv4Y2EiCIQBrTFqtIY5VZFQ4hXIqd/hVyEwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054625; x=1785659425;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0pjw6kR5NHhqrhjq/hQipYXI03U1dMLr3aOGRROc84=;
        b=kWlpWY3gDtylkFaf5/RS8F5Xj4chRUx/nVHwMz57rGZNBJ/h4+IpbbUxCKapsAp4VA
         g/7rpzeN4dpZnTRQqAO6fksfXrZ4AYNz4bMHS+DvW5ita9AT8FCm4jGCW7Jxn5eXuSBQ
         IjAUOPLN6TpeShmP8IFG6Qs3HLz5ZsmtveqExPSNJyS+H5GC2TLQx7ciIgWRt4M7a56E
         I5BxQoC/XbKsSKQw0WxlcESAF4gxuw+y75ipXgIYzP9qip+y3CZ+PDfKqM7C7T/HOQsA
         P/7uS0vrCcXVNHc00hIQJp+GoEtPlVa1nGPa0uvcuYiqA5xamzJHccbdmT1CGagA2jdu
         Iw2Q==
X-Gm-Message-State: AOJu0YzNC3GFVY3OUCGopHAfgpJzjDpWuRHLsmR2EIEOaaL14aS3Ih4r
	Y0TOk69iTjZ7WimEseJi2fgyD0C6HKO0YlBiwA1mte/HArOVDk3XDsol19bC2JQZ7yg2dsnLFoU
	nvbTfRf0=
X-Gm-Gg: AR+sD11VwyTZ6eAvbN8qQJQwfvmAjOBK6XpCYG1x/wkeVFxECBUnqc959HV8+wp8d6w
	oTuD3yUP1LHxeY/rLWXTcP9DWRi+fLtWsHWvZZ1LhA0lzroTOOLDgkkP0rO2u7aXvjsRkBDHiLM
	1tfrQfx4/I6b+iib1uZWaQDlq0LoT1NZfYjWdatn9lEYl2z5Q0RGLhKpH4AOFRWWD3OHTCk0HWo
	jNed6a6CS0sFOpIEVIQTRkpFlCcp9JkghRrupRMaQfbWEf8xQrOIiSD4k5WV672czVhawDVfoZm
	/fj5ChCPzYeeRu4MVITzamfqHRaD77lu5TQyXH+qRSk2itPXbF3T2W85WOWWVRASD+JQ8O+A7qP
	Y4MI0fwSUdH+EdgAbl4j/v+hCL9dQjMSCR66c6HSuYLkqIhj8Acx2XsI+esSZeu7FuDcCiNkl5w
	EqHtQZGK02oSSTFV6+STeUZwfpfDg4A3+aqAdb70E6SBN2Mx4+g8afIwHPCCYGLMRTkoL2epcJe
	zWNtg==
X-Received: by 2002:a05:600c:c48f:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-496b5b53259mr55260405e9.7.1785054625183;
        Sun, 26 Jul 2026 01:30:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/31] glib-2.0: fix CVE-2026-58011
Date: Sun, 26 Jul 2026 10:29:50 +0200
Message-ID: <a5fe21f357fc41de52e16ef918a737068b0f47e7.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242008

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.86.5 backport for
CVE-2026-58011. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/ae27363f025ffc131e2d75ee88a5cd8320dffe3b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58011

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-58011.patch    | 78 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58011.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58011.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58011.patch
new file mode 100644
index 00000000000..a8d31c1270c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58011.patch
@@ -0,0 +1,78 @@
+From 371dbccb6b9a9a42b93c4b371214b159e7e94792 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Sun, 29 Mar 2026 23:46:17 +0100
+Subject: [PATCH] gdatetime: Add missing range validation to
+ g_date_time_add_full()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Otherwise it’s possible to create a non-`NULL` but invalid `GDateTime`,
+which breaks all kinds of internal assumptions.
+
+Spotted by linhlhq as #YWH-PGM9867-191. Thanks to them for providing a
+suggested fix and a test case, which I have adapted and validated.
+
+Fixes: #3917
+
+CVE: CVE-2026-58011
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ae27363f025ffc131e2d75ee88a5cd8320dffe3b]
+
+Backport Changes:
+- Used the target branch's existing literal day bounds because it does
+  not have upstream's MIN_DAYS/MAX_DAYS helper macros.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit ae27363f025ffc131e2d75ee88a5cd8320dffe3b)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ glib/gdatetime.c       |  4 +++-
+ glib/tests/gdatetime.c | 18 ++++++++++++++++++
+ 2 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gdatetime.c b/glib/gdatetime.c
+index 2640e3b24..73eea643b 100644
+--- a/glib/gdatetime.c
++++ b/glib/gdatetime.c
+@@ -2024,7 +2024,9 @@ g_date_time_add_full (GDateTime *datetime,
+   new->days = full_time / USEC_PER_DAY;
+   new->usec = full_time % USEC_PER_DAY;
+ 
+-  /* XXX validate */
++  /* Validate it’s still in the range 0001-01-01 to 9999-12-31 */
++  if (new->days < 1 || new->days > 3652059)
++    g_clear_pointer (&new, g_date_time_unref);
+ 
+   return new;
+ }
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index 49390c900..527d61a11 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -1117,6 +1117,24 @@ test_GDateTime_add_full (void)
+   TEST_ADD_FULL (2010,  8, 25, 22, 45, 0,
+                     0,  1,  6,  1, 25, 0,
+                  2010, 10,  2,  0, 10, 0);
++
++#define TEST_ADD_FULL_ERROR(y,m,d,h,mi,s,ay,am,ad,ah,ami,as) G_STMT_START { \
++  GDateTime *dt; \
++  dt = g_date_time_new_utc (y, m, d, h, mi, s); \
++  g_assert_null (g_date_time_add_full (dt, ay, am, ad, ah, ami, as)); \
++  g_date_time_unref (dt); \
++} G_STMT_END
++
++  TEST_ADD_FULL_ERROR (     1, 12,  1,  0,  0, 0,
++                           -1,  0,  0,  0,  0, 0);
++  TEST_ADD_FULL_ERROR (     1, 12,  1,  0,  0, 0,
++                        10000,  0,  0,  0,  0, 0);
++  TEST_ADD_FULL_ERROR (  9999, 12,  1,  0,  0, 0,
++                       -10000,  0,  0,  0,  0, 0);
++  TEST_ADD_FULL_ERROR (     1, 12,  1,  0,  0, 0,
++                            0,  0, 3660001,  0,  0, 0);
++  TEST_ADD_FULL_ERROR (  9999, 12,  1,  0,  0, 0,
++                            0,  0, -3660001,  0,  0, 0);
+ }
+ 
+ static void
+-- 
+2.35.6
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 54691690117..a2de973e218 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -50,6 +50,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
            file://CVE-2026-58010.patch \
+           file://CVE-2026-58011.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

