Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id D091960F4C
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:24 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9so1785471plo.11
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iURVD5W3EJOnGr1yYwLHexktOwqKHKXB0FcGMhbFv6w=;
	b=BweYN1rwy1bmsdzDRUG/ireKpcs+UmJgLtEOHcarHnUN8/9+0sqrPOfqKDA3FvMjp9
	uKmHr/zX2p25ydf7ucfq24vt4Jf7h75mM91+hnA4S+kOOAQ4rTuHr28QJ9jFsvdZJ7ny
	4oz2LQ3dL5w/HX33a12I+nbj8yxwOfpr5qK+guvu7XV/Hr3CBx4RteOpPc6ctRRPMgvm
	Jy2SiZl3YhgfLceMeA2AtGNjV1xokuLgUgsxyk0c0dPL1Ao+J1Tt8bVCy0vPZYZ37bTG
	e5Ml3DzKCdmbYRC6TDI3xEZH8SNum9UWxS2jUiu8BLcLbwPlgn+1ho8/NlIQW0Rja0nz
	HG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iURVD5W3EJOnGr1yYwLHexktOwqKHKXB0FcGMhbFv6w=;
	b=BRof1yfQOu4vhGGS0cXM1ulDzZ6xj0a8a89n0+KvlZNcWsWBRzWl2X5qzE7HQX13Rz
	8UcL9ee2iACsSIwRgJI3dvZp28k+IM2FNBYhabQ9Tz5ReE85Tma13jCi/cywXf7IhWeQ
	GMTTXwQqRi+578umRMFiG4JkmVwF0e3qpKWhIwEUuSRve5TMoKR2iAScr7hjlpC8HjcU
	I77lhwrqo9La9BbVwd8EBj0u4y2OWmenZFvHrbpD27N6nTX6Fuvl8MSyE74BuOmxsn2G
	eLcrRON15JLyz77dz4GsOvjIQ41EuF36s819/skQORyH2dL3NEkT1dyX5+vOg4BWGw/j
	W7Eg==
X-Gm-Message-State: APjAAAX27PU0WnvHTk4XzMC8MpiDBHlGgNBJQ6X2ELKCiHRkayFR0xWN
	gk8BH9XwoxWyGUI7gNrSGIQ6bk7y
X-Google-Smtp-Source: APXvYqya5Z5ZetAFyBqv4aGg5PJ/fV8ybWRHYyy5MTBAByQ283K8xSPChRF5qxOo2LNzH9dKE0xeWg==
X-Received: by 2002:a17:902:7244:: with SMTP id
	c4mr8573907pll.49.1581264625730; 
	Sun, 09 Feb 2020 08:10:25 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.24
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:55 -0800
Message-Id: <116ac91d4acd1c90d02184c4deb3ab6fbc84d1c4.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 27/29] sysvinit: Fix Reproducibility issue
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:25 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

With a sequence like:

bitbake sysvinit
bitbake sysvinit -c clean
bitbake sysvinit -c package_write_ipk -f

then the resulting package has two files with group "root/70" rather
than "root/shutdown". The issue is that of do_package is a setscene
task, base-passwd isn't present. This patch fixes that dependency
but there may be other cases of this problem around.

[YOCTO #13776]

(From OE-Core rev: 0227e929021263c51d2e7db36224000fecb01f1c)

(From OE-Core rev: cbcba43c18d67aea0ba41f019b357fbec6570ee1)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index bfc1283f73..39f612be1f 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -31,6 +31,7 @@ B = "${S}/src"
 
 inherit update-alternatives distro_features_check
 DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
+do_package_setscene[depends] = "${MLPREFIX}base-passwd:do_populate_sysroot"
 
 REQUIRED_DISTRO_FEATURES = "sysvinit"
 
-- 
2.17.1


