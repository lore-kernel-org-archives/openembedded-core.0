Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 148406144F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:47:09 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b9so7802081pgk.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fMSjHORG3lr+5yfDIZ1sWc0PQ9SMv/DJnc7DtHjuDwo=;
	b=GTsVd+8MrO5+ZgJksLwfk/2LQawDwCJgsk3tMvrs62/dzVPBL5dTBxLDvoCfyqotIj
	QiIQxj6ovNMBbQhfXZZ4K6J7LdJkWDv66Q/zt29AftQSJq++Qs50GQtBuyGga91dWgIc
	XGRh6pU6ZsUofUTRh3inMp6F78/rjH1YrZGao6UvUxxO25JrA4RYYWzKmW3QP3TSWy8L
	hpeplUAQq5UGZNstWTNjMw40/fz9+4ALR0DPfGjO85GNSZK66JEWxBKO3Wdn85LEQy6U
	0QnOEykOyCiKalQl1Eih4N6gnWonKif1+tka/FHoRNiaDRGzMOj/dY5B2GrRScAUDq4T
	XxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fMSjHORG3lr+5yfDIZ1sWc0PQ9SMv/DJnc7DtHjuDwo=;
	b=nN/mEKWJmIVlPnnUf8PS8TZYqdIznOhWRcc6egMUbU8jsCm0b/0UskrzbFqFk/BmCe
	toxbC0s5a2VT3Yhcw8juHg1tgx8xtDGYdgRnwsZY2vDfFwpY3HZEf5PGVB6gXoQcRKSL
	hEA/YMdz+OevxzVEcfUV6qpq3W//TkEjSXJWcZqVlGIxVap9MLd7AQFdEnl2YWkJQbP5
	Xlt5AFAIG29RSjifgMYCZx7iZGT8GyGme/L/wT6rNhnzJwTs+yUsjs1YdKekUDum0XYg
	kv2k4SOSVsxbORVdOzD0zjeCgi9aapysYdWgQawnMy8GQ5TlauRABH1aMOI03K4xcYS0
	z/SA==
X-Gm-Message-State: APjAAAVEjXGAU9YjZXSGvHc+Qrk6iuv3Py1/hXvh+upiX89mEKjjz1St
	0ldFJwzQQg43jZKcqSEwCh8P/dFnTlI=
X-Google-Smtp-Source: APXvYqzdDnKTY2VJdvdtWhcc0i3Q3bzQwxZgfPJQugd2myuKzt9DKttOWfghSngSGaD9rX7kMfiwbg==
X-Received: by 2002:a63:591f:: with SMTP id n31mr14292611pgb.108.1581886030840;
	Sun, 16 Feb 2020 12:47:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	m12sm13877924pfh.37.2020.02.16.12.47.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 12:47:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 12:47:08 -0800
Message-Id: <20200216204708.7179-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216204708.7179-1-raj.khem@gmail.com>
References: <20200216204708.7179-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-gnome][PATCH 7/7] gimp: Depend on libexecinfo for musl
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
X-List-Received-Date: Sun, 16 Feb 2020 20:47:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

musl does not have internal backtrace implementation like glibc
but we can use external library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
index 045958d0a6..30f0579e2d 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
@@ -29,6 +29,7 @@ DEPENDS = " \
     libmng \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)} \
 "
+DEPENDS_append_libc-musl = " libexecinfo"
 
 inherit features_check gnomebase gtk-icon-cache gtk-doc mime-xdg
 
-- 
2.25.0


