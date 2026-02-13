Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E254EF48FA
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67230.1770970230322839346
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qvBnB6rO;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so5263505e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970228; x=1771575028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTlovskpzJNoJ/3q+mu4EZ2CzmdwLFZ9YxnaC5oUDuA=;
        b=qvBnB6rOErxj5/aw9fM0jTwis31kVkzKvKyE+hpeh+GHPzjr/j/6hLbDjh87cWRI6j
         tGBk1r27jjG523mwY8YDAWw2uzoaRhVqDPmb+yf+evhlGonwsilS3m5X/R51QKbkx//R
         t1TPbin8biQF6yUOb4kQJMg/sj52jq3GebtHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970228; x=1771575028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LTlovskpzJNoJ/3q+mu4EZ2CzmdwLFZ9YxnaC5oUDuA=;
        b=fB9lpbEdYMP7zpICvcvfybFwJbDUCn5OoYZY8GBc8H8TL3RZNnMVIf9yUgF1S1Ijhj
         TIT2Aie18biVMfl0ZhQkZ8NoEL4Y8ay1Sh6tqeXrf5zaADixCpf9/Ot7yjAdrJQhZHhn
         3VpG1Y+w4yU6YtLhcOGxbROewWryVKshXrxt4L/X/c725sTVWLsjeH8sWFbepoKWevyk
         4t2BAoqZwb2+VUv8dZQo+UUDkXS+RqhTY5xCn4tv453Ytwa7JVLLExzLRxbAHYCC67vF
         xQ71TJViMllRpOLg9qOd3eR75P/FNnLjcR+JScpIWx9Jk68CYFI5hofEBTVWaWmUbaFv
         /ksQ==
X-Gm-Message-State: AOJu0YxJdWBpbqDERt8GAmzcOf3EG6qnLvLfPYWa9lNNyx7P8tFpr8Rp
	d8HAmgheU6hkP3NSyQ7as8XnI4HcL+S+b/umLGnZN+hY1KAaYaki049RfYwelS/tJ3deBpDzVNb
	tkPSG
X-Gm-Gg: AZuq6aLyzGW6N6helg7DnJbgoxJx8fr7zK5XAXmA7xjDt7Q+2p5SPTyMhJ+2lMptP6G
	lCxShaCjdRJyrS7/SdECZMc5MOgpxrhmOA/qhSjcv9gb+hj4dqzV/S5MO5Z4DmqOop++vrJeM6n
	tCrI4VZL2zQbRnJYbMeQUN9S+Lr62sWR22sraLI5Le/O2dYiACgkseb3LEgTA4IttgLaM3xj+p0
	G+ci074eVqLleXifSDi2UVad+k6abViwql0iiFQXPWE6zvxnCFiPBwqNLzlKWuHL+7MbEzA4utL
	YJjkgaNa2InFbDrtcDwmcm91wJDijKGbLxp3YcLJS3sa20cw7BfMyoL9HZVl3gqURU8E3DmVq1T
	QXE90al8abuDLSfSc7bkxnXurotUFpphoYeMzj2GnWEFRJObLmzQ0YLhwNmCc/gUcjSg5m9CLEP
	GnfGfH54OBRfYyXt9oqvXmW9PkgDBu5Th7ZyRF7Zp8r4Y/LHybH3OKRdhOF9z/cEPt5TZrUdvci
	dTMTaBDZ4DgxHASX507H/J8hNY=
X-Received: by 2002:a05:600c:450d:b0:483:a21:774c with SMTP id 5b1f17b1804b1-48373a44430mr13270405e9.25.1770970228262;
        Fri, 13 Feb 2026 00:10:28 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:27 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 16/19] scripts/install-buildtools: Update to 5.3.1
Date: Fri, 13 Feb 2026 09:08:34 +0100
Message-ID: <ebb3138e86b8ed197228afbc546e2325ef03472a.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231099

From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>

Update to the 5.3.1 release of the 5.3 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 93f3e2d678f..c3f257ff931 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.2.3'
-DEFAULT_INSTALLER_VERSION = '5.2.3'
+DEFAULT_RELEASE = 'yocto-5.3.1'
+DEFAULT_INSTALLER_VERSION = '5.3.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

