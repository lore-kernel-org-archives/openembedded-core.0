Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1757D536
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:49 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id s15so6506566wra.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nQZZmz1TERh6F9CfhadCjeN2qocp7U1t8XZe89rhutw=;
	b=I6FUns4bOayWgFtjmh9E5H2L46LKQmQxi9piEKlpImwRdNk07MrCs5kY1A9JYcHtjh
	7711y2ShpaJJ8jkL1sXUK5YIij7nQSeCayhCTrma+k6j805Q+YBvL34W3GLCzD5VycuK
	XsK7+/eyEyVyJ3gNJrF91mihGP0KHQcyMDRFah/3od+kKCdw68esmyJs/ZPdm6fkuuaG
	B4sfrnXPBq1a/H6C4tyF89d2vdUl9NZy9D9mKFEe0VLK0H6DbP3mpUJQUjgiQgojv+4U
	YJlqNnCjnE09aRQe5PWpmN1anOUkSXZXo0L8xgI2GIJ959jnq/tykz1Rpy4jQCqF18gy
	jP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nQZZmz1TERh6F9CfhadCjeN2qocp7U1t8XZe89rhutw=;
	b=jHn3jic/uzj+i6MBJ3TJEc3sdDgcgPDqk4Kys5bNLqxkmg7xzqjumLOjLF/zMNSjBS
	wpC0AOpdQaY6IOH/s/mH96sZH2G7XHOgLtK2/13krgQFelmzJrqlnOHZVGhlyy2LglQ2
	VpP1wuq5gfp18AuAa7nn2PFbQhy2tlQccAwQd72C4Y7MpKXzbbg5EtYQdCRlzPik3O69
	WNzwovFFeiZdABQjDEj48KM+K4ewKe+YmQF1FX4ivz7cyXImBguwqwNYGVOg7oBpptxM
	4GK3KWALqZEu5bzGvfriVEDtomxM9rXFBH5o1FkDNRML3P24gJG7BetcIs7ckHQpeAs3
	g/cQ==
X-Gm-Message-State: APjAAAUqBmzpxSKEr+Q0I4ib0LFhlmrS5GSmfiOqfYZMOZAN2DhZwAPf
	eqz/2SHPCbhRl2Y//svgSAKN7ci2
X-Google-Smtp-Source: APXvYqzBZfjhRaWBmiXs2RpmFIB8U8QsYpH/BbrXw/QV6H3sO0dgSig7rRf2OaJof4u4LdNdL5Kpmw==
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr7185357wru.161.1554446270640; 
	Thu, 04 Apr 2019 23:37:50 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:27 +0200
Message-Id: <20190405063736.29750-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/13] gdk-pixbuf: use gobject-introspection.bbclass on/off mechanism
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
X-List-Received-Date: Fri, 05 Apr 2019 06:37:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
index c5de7a92a5..e423b99687 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
@@ -37,13 +37,7 @@ inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even
 GTKDOC_ENABLE_FLAG = "-Ddocs=true"
 GTKDOC_DISABLE_FLAG = "-Ddocs=false"
 
-GI_ENABLE_FLAG = "-Dgir=true"
-GI_DISABLE_FLAG = "-Dgir=false"
-
-EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
-                                                                                       '${GI_DISABLE_FLAG}', d)} "
+GIR_MESON_OPTION = 'gir'
 
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
                                                                                      '${GTKDOC_DISABLE_FLAG}', d)} "
-- 
2.20.1


