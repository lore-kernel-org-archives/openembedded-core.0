Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60F5EEC2B5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21273.1771943103408992704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Lqll265T;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-482f454be5bso60196825e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943101; x=1772547901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMQtRkSTZOWMnX+ZBWDCiU6Gvfi8nGLHuhNS87jjVL0=;
        b=Lqll265T3/02Q6uyvZJWkh4+v/i7hEojPCk7eEDy8bUEKnz26dsNIEx4RAeA+25/+e
         T5jU463vAESzZF4WgjDfn5XAWC/eIkEyKx4DP+eZN7rBCHk4rWrG2nxW6ctWaTAAB/Qv
         gBaEYDtkJX/hu52vfLmtT4G8znFLXb9sjJcr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943101; x=1772547901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jMQtRkSTZOWMnX+ZBWDCiU6Gvfi8nGLHuhNS87jjVL0=;
        b=LB42vbemRfRlTrnEw8FGDSBXk9HkT6mIyZ5eacvV4/fYfwi6oV36xweAj1m/6Na85O
         VtHRQ1kDVp8qbLqLTrm+9/1ZiDiNpcCEoTY4gGW46RPRbhsK/QBh4hZPgqDYmayHldeB
         xWYm/XyUDsgGbpJ5NSv+22rOvfwQj7lBRg3JiDzK88Ger7m07v35dQt1C1F8TqMlnWCT
         vkjpYxP0KeRXGIW0vBadyxIEjQPOgxKRYoNF75NL7jcGAzesyRDQCMC4yBtAEbqHswHF
         IWhlD8Udis1dwpNG07rq8v4ZIVCNGfrmiew8pFMXByP0vUe1e8m+sq4KbkRWpJcIVLXt
         hO5A==
X-Gm-Message-State: AOJu0YzUmXxjB3pITh7wpBnejbyKHJC/i/EVFX+9ZAQ+qFFZi+MoNq0u
	v+sxEjPLM0kvbgD05xjRgSEKx74ncLFuDI7exhnvWVmmHp4FEUXgMtGBr2aMVZx+603T5HvMrrj
	qd66v
X-Gm-Gg: AZuq6aLc8yDSqSuK/16TmM2zgSwQkmR5MkQW/v2lPYcM0OSUTlU4Br7CLRYEtttPn/I
	obIj3hkYY2Bz6mgSe4XZqBp2y3uKKv5nptDu1w5oAR4RBdsSBUlDenzohYxXrW7irJo6EeIkRgr
	0ziXgEz+CDOA8mvmkiqgzgymGfsLLvH2u2qCFUd2rfhb1oBN0Iy+3o4/uH7QckbTszYDoCOEKS+
	e7xvfQwZUpzvtHXbgO4+E5z8XPakJzLIUYDZDwFJwOpo9FJOO3UTK8SDajTjO1wD/BwK2A3dEgM
	r7zhv3FmkQ9/JeCEWtJwp/W8wBYSgBbMmYetIy+ArquxC6JR1ae+TdUF4lhbVsU3Prp1Rob7zOI
	adcEPz/aVgSjwkFlooQSu9JQ+wOl08dnbnwv+GWCGdtEjOk37yU5R20gEpAAv0Z/6X0biVkkWrS
	x3ydj09mTI8qNk/NSh1jNt/iA6f4+0jg01jdKbM99YIhm4IrVTklmC2GAXp5yN5c0o0Bo4T7sgO
	Si1qJnapwyQD3hT7gEou70OZDFp1OFK1h43Wpe0BpLB
X-Received: by 2002:a05:600c:314a:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-483bd7429acmr2505725e9.9.1771943101533;
        Tue, 24 Feb 2026 06:25:01 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:00 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/38] scripts/install-buildtools: Update to 4.0.32
Date: Tue, 24 Feb 2026 15:24:03 +0100
Message-ID: <80338fa36501670fe2c63086ed11f5ece6a851d1.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231777

From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>

Update to the 4.0.32 release of the 4.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 2c9f3f25c65..c105dfe4623 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.31'
-DEFAULT_INSTALLER_VERSION = '4.0.31'
+DEFAULT_RELEASE = 'yocto-4.0.32'
+DEFAULT_INSTALLER_VERSION = '4.0.32'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

