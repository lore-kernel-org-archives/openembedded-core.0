Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 73B5E792FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:18:35 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id r69-v6so1916012oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n+XJYaNNOtjkIAIuNA0fvAuCtF/8vRWIuGbq0VTrmC8=;
	b=EhRUunfYYhkQBmCpNZuRejMD1Rbgw/LSOGzh2VNeD2Y5u3tSbeWDddzjtvDXes3Nb3
	hR+7pNd4jaTsbRJdn9kfnTg2vw8DLoMY+9aA5UwFTgytZ392WsdrQig49PUspdK/vEDG
	rdb9L483XQHuaoLkOrc/hPn4o5f0D8ldWbqhmt3NjuumOAwKcZ2nw60bANgQUe/7ENY/
	W6oPE2lV6WxycsEqSzAKGD38RE/IUpyV26/oo99DI6PIcirHlNhXK0r8foCrqbVQ3/2X
	0MdgPW67XLZnXwPqEGKirY+HoZTlIvwFcZeaa6RnJSuLcjTG3ZdwiNHjSxE7fYs63eah
	XZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n+XJYaNNOtjkIAIuNA0fvAuCtF/8vRWIuGbq0VTrmC8=;
	b=oZN8/ejbfBZqXHO90tZ44X28UwUSkiGzxeEq0C8+Cq6+jJD8syGgKmH11nHTt6i0Ew
	xuiCj/CVgpnFhq/E5OFyEFb82sypfojb9/HdeOPysFE7N2KbthHZnCrAvy0/odPbkvld
	ICBIg22B9AkoCfx7ffWvrejyiAJaeZaMOrO9X5LChvlSBLLBSZPSVJcbJ3+7vPICfbxr
	oj+pxhVA73pQAXnB2y/jMtFhSm4S/mam4TAxGqHs6HZa3fpE36S5n2yai1+2q42aaXAt
	hUtBPA5iNH2fql1lUuOkwDuRwIP9Fsskkq+U5OoX5p0vDnX1ZIBYXpxTZffFUxcMMWll
	60qA==
X-Gm-Message-State: APzg51AXm3VygBtIzEVGCH97vwf7BPQsWP1NQOWD92gdKuZ8Fo/CqCOG
	cQCw3ENsiMuc9+3h4ssUhw3iDj9P/h8=
X-Google-Smtp-Source: ANB0VdaewH8UBVETOx/cojCeiqnGrA9rpyIdDD4zSbYyyAQhjv6v33NMNED37lqI3ly69UyS8zGbgw==
X-Received: by 2002:aca:e2c7:: with SMTP id
	z190-v6mr3670307oig.262.1534936716201; 
	Wed, 22 Aug 2018 04:18:36 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.18.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:18:35 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:45 +0530
Message-Id: <1534936692-11736-7-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 07/34] gdk-pixbuf: CVE-2017-1000422
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
X-List-Received-Date: Wed, 22 Aug 2018 11:18:35 -0000

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


