Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 90AB5793B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:18 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id r69-v6so2573629oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n+XJYaNNOtjkIAIuNA0fvAuCtF/8vRWIuGbq0VTrmC8=;
	b=VSZTyjRg6wh92HwLQkBs/1AkFlq2pM2ofHAFXmDHrC19XMYJd3dljPRnxMH4zYgiSB
	BVdbYc3gGXjbpn69zKjaAmBtS3kS5IUbwhkE3ruKJy4QkPkvxPgTbmtDuXOBeONV6uCz
	SNR78YbaTzlUtPz484ec84j1hRkBITER3l5IkPvvfz1wt7R9VarERkZ9UR/X4QtmYEs7
	X3oLofIYZHK9rhEoZvbRSoAIuXgXw8QEOn8hMXz5UlwBMQl/ad2UdaRZDJ4nS/JUlxpD
	RnVqwGi0Ds/U6JKvi+yHB1rPeh5aeG1Qd35PqQ4Bv6FyE8RWpQZQM5g4BOaFSOsE6ZJ/
	2xOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n+XJYaNNOtjkIAIuNA0fvAuCtF/8vRWIuGbq0VTrmC8=;
	b=SSeRmKOgdx+RysyBr1G2q9kE1/ZG/Y/ZsIofSCsIPxs0C/1NMnmDguWdPOdVD70Wh0
	wMKSTv0gmaczuv66volwLmm5d68wIu2SAlt9x4MGP74WvG2vNVyq9P4sg6ZHa3nR26Xy
	EN+i0mEnL4vxlUd0XNG+zFLp63+Z/zEWXNcWwIdBkEzyP3qxoCkD6+AHYvQh9zhpBJKL
	hUvvCMGij+1Xb/ihwDlmyYumgEv8/vEO+L+ux97sbzn6iapY/ySeNWD0X8vLw9lHc+En
	PRamu3dCrGhwRwvbauEg+SNwWzA9iChzhqdXEeKFOxrmWVIl5+f2E4zdIXYyNABNUBfr
	S1lA==
X-Gm-Message-State: APzg51DxYrdHtMd/vNaZg6EDB9fn+9NvB0pkpNDPsXYeFacL+/9sHq1G
	dnEODuvkrDvIg00hnv8Mh6+xwMW8B8c=
X-Google-Smtp-Source: ANB0VdatJG0Jye80PASvMAT8Mv2ZOk+jd9ZapoCsBWZTawYPQWc+zEG3HpJkefa4Gp8kARhPwOg+UQ==
X-Received: by 2002:aca:2c02:: with SMTP id
	s2-v6mr4257672ois.305.1534944979364; 
	Wed, 22 Aug 2018 06:36:19 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:18 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:13 +0530
Message-Id: <1534944940-21566-7-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 07/34] gdk-pixbuf: CVE-2017-1000422
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:18 -0000

io-gif: Fail quickly when image dimensions are too big

Fail quickly when the dimensions would create an image that's bigger
than MAXINT bytes long.

See https://bugzilla.gnome.org/show_bug.cgi?id=765094

https://bugzilla.gnome.org/show_bug.cgi?id=785973

Affects gdk-pixbuf <= 2.36.8

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../gdk-pixbuf/gdk-pixbuf/CVE-2017-1000422.patch   | 65 ++++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2017-1000422.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2017-1000422.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2017-1000422.patch
new file mode 100644
index 0000000..0638c99
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2017-1000422.patch
@@ -0,0 +1,65 @@
+From 0012e066ba37439d402ce46afbc1311530a4ec61 Mon Sep 17 00:00:00 2001
+From: Bastien Nocera <hadess@hadess.net>
+Date: Wed, 23 Aug 2017 18:02:41 +0200
+Subject: [PATCH] io-gif: Fail quickly when image dimensions are too big
+
+Fail quickly when the dimensions would create an image that's bigger
+than MAXINT bytes long.
+
+See https://bugzilla.gnome.org/show_bug.cgi?id=765094
+
+https://bugzilla.gnome.org/show_bug.cgi?id=785973
+
+CVE: CVE-2017-1000422
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/commit/0012e06]
+
+Signed-off-by: Bastien Nocera <hadess@hadess.net>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ gdk-pixbuf/io-gif.c | 30 +++++++++++++++++++++++-------
+ 1 file changed, 23 insertions(+), 7 deletions(-)
+
+diff --git a/gdk-pixbuf/io-gif.c b/gdk-pixbuf/io-gif.c
+index 057960c..ef10017 100644
+--- a/gdk-pixbuf/io-gif.c
++++ b/gdk-pixbuf/io-gif.c
+@@ -851,13 +851,29 @@ gif_get_lzw (GifContext *context)
+                                 pixels[2] = 0;
+                                 pixels[3] = 0;
+                         }
+-                } else
+-                        context->frame->pixbuf =
+-                                gdk_pixbuf_new (GDK_COLORSPACE_RGB,
+-                                                TRUE,
+-                                                8,
+-                                                context->frame_len,
+-                                                context->frame_height);
++                } else {
++                        int rowstride;
++                        guint64 len;
++
++                        rowstride = gdk_pixbuf_calculate_rowstride (GDK_COLORSPACE_RGB,
++                                                                    TRUE,
++                                                                    8,
++                                                                    context->frame_len,
++                                                                    context->frame_height);
++                        if (rowstride > 0 &&
++                            g_uint64_checked_mul (&len, rowstride, context->frame_height) &&
++                            len <= G_MAXINT) {
++                                context->frame->pixbuf =
++                                        gdk_pixbuf_new (GDK_COLORSPACE_RGB,
++                                                        TRUE,
++                                                        8,
++                                                        context->frame_len,
++                                                        context->frame_height);
++                        } else {
++                                context->frame->pixbuf = NULL;
++                        }
++                }
++
+                 if (!context->frame->pixbuf) {
+                         g_free (context->frame);
+                         g_set_error_literal (context->error,
+-- 
+2.7.4
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
index 8c35904..cf06a85 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
            file://0001-queryloaders-Make-output-more-reproducible.patch \
+           file://CVE-2017-1000422.patch \
            "
 
 SRC_URI[md5sum] = "e0aaa0061eb12667b32b27472230b962"
-- 
2.7.4


