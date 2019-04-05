Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 92A8F6BE2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:55 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 4so5462138wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GPpJgqdjjKG06uT99z742ltNemkZIjwFcYVE/ekKVh0=;
	b=SWhRtNc260c5aGPLA4xJ52mcCUMVWZolZpM1LlBmGm91LQND/k0Rpro1fKVLPLxcXp
	CUJcIufchUKAMfP7wwCAGoxwbOxyLxESfviYb1Tc8zcDmEtvns30oHus24U5tBgCZ4KM
	ZZz80G+MI/oY500VR89m82hFaP6ga/5l1DnBLoMqqDAh5aBn+9Q1UIEEGCGlSh8ybKz3
	PalAsr4qOQMX7XT356HwZdO+DhDnozGKrHh/wLfRTvlalfk1zBUG6S1JGGUCKo2VoBpI
	Kp1UpS0Wu+Uy/6G9GSEKLl2yAU9CNlOlg9rWCtnaPbWAxZse0DBPw7eM/vPR/yvALVIe
	rhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GPpJgqdjjKG06uT99z742ltNemkZIjwFcYVE/ekKVh0=;
	b=bvl+OK2e9FjLQDYc9Kw6p8vvUDlqzgQ/ecUY8lMfTn5QW3i6SFErM7jF9DX6/oi52h
	sak86pJ3rch8oX52x/gctzFcZBzHFXzSKLK8cPXgeXz8p92VrFE4OgDrr+8bvB8ZGnOx
	lo7Gf+JRqRSOpKEKQ+Z8WKOusqVOzhYHsPoIxVcwZKQTozML9P5uvLgujGgyZ57T3CkK
	iGIQepib+Sj/BlgQKsiM8yMhVJAHApXvSzvM3xZXN3gRkBY1wuhPsDq6sIWBmMXqV5Jb
	pZS6UnJrkkY1WSrRAwQVU5qe+/ZVBD+q3ykhXPJswqqsxeCyuPUXfkjqJVcJ8qs6Z5Ba
	l3bQ==
X-Gm-Message-State: APjAAAWGuYNGUTnRrOJ23YW3oRdsRHIH3NyzGfQW8LWE5vv231tCRxC1
	5n8XtyUYkupG6cEdw+eiRJ7EXOe3
X-Google-Smtp-Source: APXvYqw8rCpxAO3ZKpW9HlQQJsGarYLXZAS85c2nsfs+XTHj7tbQhYtZvOnQDVBKm6L6yy7+6K7uoQ==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr6891250wmj.121.1554446276200; 
	Thu, 04 Apr 2019 23:37:56 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:32 +0200
Message-Id: <20190405063736.29750-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/13] at-spi2-core: use gobject-introspection.bbclass on/off mechanism
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
X-List-Received-Date: Fri, 05 Apr 2019 06:37:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-support/atk/at-spi2-core_2.30.0.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
index d0b567a5e5..06fb7195b6 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
@@ -24,15 +24,13 @@ EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
 GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
 GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
 
-GI_ENABLE_FLAG = "-Denable-introspection=yes"
-GI_DISABLE_FLAG = "-Denable-introspection=no"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
-                                                                                       '${GI_DISABLE_FLAG}', d)} "
-
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
                                                                                      '${GTKDOC_DISABLE_FLAG}', d)} "
 
+GIR_MESON_OPTION = 'enable-introspection'
+GIR_MESON_ENABLE_FLAG = 'yes'
+GIR_MESON_DISABLE_FLAG = 'no'
+
 FILES_${PN} += "${datadir}/dbus-1/services/*.service \
                 ${datadir}/dbus-1/accessibility-services/*.service \
                 ${datadir}/defaults/at-spi2 \
-- 
2.20.1


