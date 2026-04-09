Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1601F36B96
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:53 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145082.1775776307566162620
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xPleAZKh;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so9442665e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776306; x=1776381106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7WGJo+r4HFWOocOezDDbAgVUcH9E73x0W7UiWaboFc=;
        b=xPleAZKh3cX7hrTK6Wu5MHBJqg9OcvVRO/tJ0oF/oyV/7VTsD0aLcJOPnNw/pub3x5
         eqczTWO1uoiTCbbTzB9W4v8gIzke5frVFK4YlHQ9fyVKJrAl0NJAuPiwkYCQTK+zsc6+
         Xx4UmoljGID7g4Gp0n5p4kg5CAhIfnttzUeKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776306; x=1776381106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7WGJo+r4HFWOocOezDDbAgVUcH9E73x0W7UiWaboFc=;
        b=kaaurn1BiCMCRI3eZVk6L9pxON5ra71z8v0RSFdrr+VMRMs7jJlIrsGzoA+YQORdqe
         WV62B6gpVYafCLjedNOf2qwWbT4At6mxtc94ZTCdNCsHFgy79J4xqlvT96+AlDB3UbKH
         /0NQ7QfUv8bs1wloa+ZNWlaC4BI5FVIv+Fp9U0gX1mq7jmHnhJeP9WIVfGaDTMpOtls2
         sonp6ZFoAQpazZsWiYUewnG7oxeZ0pnZyRW0PZNe8qadIfKPQvHEEIoNMJupjyGswrvR
         a5e7r/j8KkykE/UbNSXOa1aKH2ZtpRQ4TFv5Rz5f+GEcLW0//PgMdxF96V0yOt2o+AFr
         raGA==
X-Gm-Message-State: AOJu0Yydlv6tFsijsnm+7LCKsV12TIhP2iGltzFG5bkBMwT6u3m2PWav
	wqTPcI4oosBLXMROc82mjpCA7kWTKvUNlSK+6Pp3jvps6ElbelFAkQ5KQwlBVFd/DL8/gcSaA3x
	QPvBJvxmPl1Kr
X-Gm-Gg: AeBDieuswT2bS5Smb09vRCNm3KwZsnn4DhdlBiVTJc47qmQwYLQXZ5VRz48y5BNWswZ
	gPPTrLV/L9sau25ET49z5CquSvjnRWMD7pD7zWT/DF8rQQsIm1Qfa8LTgEjKeDnY0axheKJIVk8
	ZUpjSiyLAfzKCixsZsyvfCWjkMoabRM2f3YtzPzAKX2ERWZKteoC2/SNWkkDDdWBfjn+CmrnEXa
	amc5EMLOgu9mjz3kwBjNJFS2W8CUO7QfF1NOjCKQaOO6rTtTEEPQ1awwF1dUGS8gXTHNzQC+K4o
	ehbo7j9iUuKUrv7VwAO9rYcdOvruzJCM7TIv1HQv6UsVeeOoFMYqIu759M6zyiiYfIeMll9isGN
	dcD4WlHsNtIawgQnffjl6e0/gXVGWPp2g0MFClN3MyKwl68cyavYN3HVSVy5+goTh4U3T4Uss6+
	Tb3Pd3/mE8sn8Es3a4QKHSfjW5ZEhyQutUO/cSFppyZtObn7AjdU24o9pHU66jPEnh/KSZ5Ina/
	VtV/885z/B5T+vxjJv9gpToLmoI
X-Received: by 2002:a05:600c:3ba4:b0:488:c6e9:1e0c with SMTP id 5b1f17b1804b1-488d6847de9mr7796825e9.5.1775776305700;
        Thu, 09 Apr 2026 16:11:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 30/30] scripts/install-buildtools: Update to 4.0.34
Date: Fri, 10 Apr 2026 01:10:30 +0200
Message-ID: <f2bc121f821f684a541b1f4e317078c50d29c389.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234989

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 4.0.34 release of the 4.0 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 6a1762c14b3..8754f2d773e 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.33'
-DEFAULT_INSTALLER_VERSION = '4.0.33'
+DEFAULT_RELEASE = 'yocto-4.0.34'
+DEFAULT_INSTALLER_VERSION = '4.0.34'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

