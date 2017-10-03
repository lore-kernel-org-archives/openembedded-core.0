Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 96ABA73119
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 01:19:30 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p5so5455080pgn.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 18:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FDAanq+8BMcml8HUczvC4Jt3vV8WWLQHR02NKh2ODEI=;
	b=lZczEnYDuH+GSfDxV1YMF8jOVpEsxT12w8W1ACOUYJ4zT0rLBiyrlzzPQ2woh9KhU3
	wI8eFghSoDUCNjVZTvOm4DlH3nV/f8rk3wt61YfmNpQkVZkGfnHIu0Stc9lAdXSBR8LY
	99HO1ClHOpvLe2ngBBPJm7EcfSvJzbYY6aiPW9LmDxo2lnaugmPfT7W2elpyKq5pQLlc
	5LMi4JC+jOmTm0y2WeCNaFFHfalShcA2MNat4/pMSN8Ni0IZ5VqB8/hSC+hGgT3A8Naq
	H8UdFqMBJeIKEM3mMzVvW9Jx8KP136IKCGRuCmu+Vn+DpGBh7WzJAiO+EaCX2V3FWKze
	VqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FDAanq+8BMcml8HUczvC4Jt3vV8WWLQHR02NKh2ODEI=;
	b=iJbYuA72jSRTeb29lnpuYQAbfzn7feBRqv1Vsn5ODd7RWKz08t1aRUWm9vgO2inEYw
	rXVm1R31/yklQCG4b37ptBEm+Wr9f/5MKIGFvSnZdTzuRnFEr/MhmdCsTxvVT9+WNxar
	yLW+E3UClGErEZoIdTmhiYoGy3rlW+5bt8mkNbeQcZcIGhjxUOxe3u9N34SiV5EHhwZQ
	tzIox3CqQ0uCb4JEM5bY1hutETKRHAGlxXFekKiXTw0wsl2q6b4YG+i4Z/xFjjRVFVzC
	B0sQcQxdsFjLcsxp69wD3dHGHK4w1R2uvMGMWEKvtsHo+DWyiCxnLpKKXC63jdLIjsSx
	fKuw==
X-Gm-Message-State: AHPjjUhPC5jDRtdIvl9tq4zWDQ+PArza8M6Az2e3RvlzTnmVb0L1JB6o
	cYP4kMb+VBGzoJ/2NTVOoylzaA==
X-Google-Smtp-Source: AOwi7QAqNFxCi7TKDZSKvV9VylFbqyCYUGi92ccYmhTAgRkYK1A49BY5KMqLfs6S6EKkbSwa+QeJ2w==
X-Received: by 10.98.75.92 with SMTP id y89mr15747278pfa.329.1506993571661;
	Mon, 02 Oct 2017 18:19:31 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	v10sm19769813pgf.8.2017.10.02.18.19.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Oct 2017 18:19:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Oct 2017 18:19:19 -0700
Message-Id: <1506993559-15731-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506993559-15731-1-git-send-email-armccurdy@gmail.com>
References: <1506993559-15731-1-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
Subject: [morty][PATCH 2/2] coreutils: fix musl compilation
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
X-List-Received-Date: Tue, 03 Oct 2017 01:19:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

As per the patch

Signed-off-by: André Draszik <adraszik@tycoint.com>
Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...-need-charset.alias-when-building-for-mus.patch | 44 ++++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/build-don-t-need-charset.alias-when-building-for-mus.patch

diff --git a/meta/recipes-core/coreutils/coreutils-6.9/build-don-t-need-charset.alias-when-building-for-mus.patch b/meta/recipes-core/coreutils/coreutils-6.9/build-don-t-need-charset.alias-when-building-for-mus.patch
new file mode 100644
index 0000000..2e0bfb7
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-6.9/build-don-t-need-charset.alias-when-building-for-mus.patch
@@ -0,0 +1,44 @@
+From 542811eecc05c6c43590bde3852598aa6277abf3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Thu, 23 Mar 2017 12:46:07 +0000
+Subject: [PATCH] build: don't need charset.alias when building for musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [required for coreutils 6.9 (GPLv2) recipe only]
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+---
+ lib/gnulib.mk | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/lib/gnulib.mk b/lib/gnulib.mk
+index e833d14..04b2b74 100644
+--- a/lib/gnulib.mk
++++ b/lib/gnulib.mk
+@@ -907,7 +907,11 @@ all-local: charset.alias ref-add.sed ref-del.sed
+ charset_alias = $(DESTDIR)$(libdir)/charset.alias
+ charset_tmp = $(DESTDIR)$(libdir)/charset.tmp
+ install-exec-local: all-local
+-	test $(GLIBC21) != no || $(mkinstalldirs) $(DESTDIR)$(libdir)
++	case '$(host_os)' in \
++	    linux-musl*) \
++	      : ;;\
++	    *) \
++	test $(GLIBC21) != no || $(mkinstalldirs) $(DESTDIR)$(libdir) ;\
+ 	if test -f $(charset_alias); then \
+ 	  sed -f ref-add.sed $(charset_alias) > $(charset_tmp) ; \
+ 	  $(INSTALL_DATA) $(charset_tmp) $(charset_alias) ; \
+@@ -918,7 +922,8 @@ install-exec-local: all-local
+ 	    $(INSTALL_DATA) $(charset_tmp) $(charset_alias) ; \
+ 	    rm -f $(charset_tmp) ; \
+ 	  fi ; \
+-	fi
++	fi ;\
++	esac
+ 
+ uninstall-local: all-local
+ 	if test -f $(charset_alias); then \
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 6bcf8de..d04edd8 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -27,6 +27,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
            file://fix_for_manpage_building.patch \
            file://loadavg.patch \
            file://no-man.patch \
+           file://build-don-t-need-charset.alias-when-building-for-mus.patch \
            "
 
 SRC_URI[md5sum] = "c9607d8495f16e98906e7ed2d9751a06"
-- 
1.9.1


