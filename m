Return-Path: <net147@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9D1719B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 12:13:41 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 67so5707637itx.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 05:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5iqnCBAoYUYy9TBTWrmJhz4dyRf7NzujtuEuGw6grK8=;
	b=mi3yNiR3ZhuRo0ZqWku/5EaiVGOMlcwAJFD6kl0W0gOX1j9fmRMHTNjSpriNIVonf9
	8p4j5SBLvvGpNVr51g8yUZ7Ca/uWHGnOyQXQuN64puxSpGnIAXYTsfzJvWlVthTOb9EU
	eVjFsjoBCXXHL9RgRmfcJsGPOom0twA4QoSpRbC1GeQfUSYWVT1srwGqwmibLoo8EvhA
	isaCjbK27U7Bv1R29oWNmdvcxMY4wWuJPadppdJLa7S8Hh7UkGV+DuPIt9Jd+TARVzfs
	Pg0aGWqGy064oZsDPvHRgpka2651TgmM8BCm2M9TEktXxKX9KbKpmNSfao724WY/c49l
	0gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5iqnCBAoYUYy9TBTWrmJhz4dyRf7NzujtuEuGw6grK8=;
	b=ON1cMnEXZKiqGFCRr2Qa7Eg2IhgA+CxTKq2TyCyyKR9dxiJryQB/It2EJBbRCj9NiK
	YhaQX1k90x8qEYor0fk+eKy9akYNMHoN/UJjg/AlZJ9v9lS0gOCFx1DgSIMJ0MwvLqWY
	lq3rV7T6n3LyX3nhThVm9K+RnyV0FK1U03PC3FD0NLuTLNeViDHEC3LulxGG9Es4PB3s
	76fnRbdGEJjIN+b8nKjb0jr+TaRNuYrkV4/IRiYv3o3sqEaGorUVqQaLaphRbkoNaPKN
	TXN2SOHg6iTlXQ/CwG+hLq1ah2cQFkILYRRjT726nSu5LxyknJM5ETXqnJYCYbAV1mkB
	Zg8Q==
X-Gm-Message-State: AODbwcApoa8hl3bgNn/VRAVJgZOB3W0k89s91xPvL3XDVgaJgfUyLqBD
	Un+vKpMKOyKaqg==
X-Received: by 10.99.16.65 with SMTP id 1mr918706pgq.60.1496319222604;
	Thu, 01 Jun 2017 05:13:42 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	n24sm35575827pfb.14.2017.06.01.05.13.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Jun 2017 05:13:41 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 22:14:18 +1000
Message-Id: <20170601121418.27740-1-net147@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Thu, 01 Jun 2017 12:13:41 -0000

If ASSUME_PROVIVES contains libsdl-native, we need to add sdl-config
to HOSTTOOLS to allow access to the host sdl-config.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e4f4bbb56..3ad905c917 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -471,6 +471,9 @@ HOSTTOOLS += " \
 # Tools needed to run testimage runtime image testing
 HOSTTOOLS += "ip ping ps scp ssh stty"
 
+# Link to sdl-config if using host SDL
+HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDES', 'libsdl-native', 'sdl-config', '', d)}"
+
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
 
-- 
2.12.2


