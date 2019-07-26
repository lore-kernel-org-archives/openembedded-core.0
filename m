Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6E69E7C426
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 14:19:54 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id i11so53448527edq.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 07:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bM+RMvcWvd/doKoAEMml+ZEUQYOrT6ykGtH46pviu1w=;
	b=Kl6t520qgKck4rBEc03gsLTOmCBRp7aeRxZ3izGo6B4Xlay7la1phsjs2Q/rqCsPQl
	BYMB5TJYdV9Gl0ziMWhKAXP5hZ41S19wZxe7kjnw2EtrpAl3YRzlaeivAFGkivTyUREC
	E0NkNQ3PTcFmSdck2Cv3EygLUT1mbGHfRAqxaXlLd3hF8PjapHlYjYrv5vrXS103Xg+Q
	xy5pkhH0yjn4Kcpc8stp2Qm2bBhlBZshksBPtkzU9hLCYOeHZS3sk94EwI+OmXDZraRB
	cjINmON9ZKLewMkZwdBEwmgAy6cD12pHGQWjQnZoc2QXofo5PvkpPkdptMFVoHn2w/4R
	lDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bM+RMvcWvd/doKoAEMml+ZEUQYOrT6ykGtH46pviu1w=;
	b=DAeSwKy6QMWTTjfMYhhTlId8m40CMF7YmwP+WZb/A+ACh1dx3egVo0eBfsx//LVboc
	3iU+ntgZOpwKXtbWKoPtHWbFQ0uNImMeHw7s2U9b4t6/iBVtwryv1BSk9Ly2v+0LcKE4
	iAj0AtT1oBd9Kwcn598Buh1ft3G1UD7YYMozMIg7ehY6p94ZS0/grRvwgrWtht6YSXPT
	R8DztitKBXLdUanlnImfERbm/pmFxgCrkCzvEsDfEbsGAg4Heh8CiJs/0qpks0YF3rLs
	FCgWV+ZL1u5bIu/uT8YNPEB26QUczgoz8UkCZHjj31wFyIiTplmFzwPuSLmpdzH/nqyJ
	xfVw==
X-Gm-Message-State: APjAAAXqtGIvlAxMZvN2BcBaPTz0BKOUpxOxUvtUKDTQr7oTC3/Dwbht
	irRfRr1BsOzPsteRToSR2aUbAFOuEMs=
X-Google-Smtp-Source: APXvYqxuTW4Ay4SN/GieS2LiZZvQAkhx9c4o6gV8haKKO2zGX1qq/fpiyQNF3QuMz6DYCIS0o88rsQ==
X-Received: by 2002:a50:90c5:: with SMTP id d5mr84361784eda.28.1564150794856; 
	Fri, 26 Jul 2019 07:19:54 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.203.138])
	by smtp.gmail.com with ESMTPSA id
	x10sm14225727edd.73.2019.07.26.07.19.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jul 2019 07:19:54 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 22:19:38 +0800
Message-Id: <1564150780-18125-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <ming.liu@toradex.com>, stefan.agner@toradex.com,
	luka.pivk@toradex.com
Subject: [PATCH V3 0/2] Fix a libx11 compose data dependency issue
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
X-List-Received-Date: Fri, 26 Jul 2019 14:19:54 -0000

From: Ming Liu <ming.liu@toradex.com>

Changes in V3:
- As suggested by Ross Burton, introduce a new recipe
libx11-compose-data, it would be depended by libxkbcommon in the case
when x11 is not in DISTRO_FEATURES.

Ming Liu (2):
  libx11-compose-data: add recipe
  libxkbcommon: RDEPENDS on libx11 compose data

 .../0001-Drop-x11-dependencies.patch               | 86 ++++++++++++++++++++++
 .../xorg-lib/libx11-compose-data_1.6.7.bb          | 35 +++++++++
 .../xorg-lib/libxkbcommon_0.8.4.bb                 |  4 +
 3 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.7.bb

-- 
2.7.4


