Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48536F8E495
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:38 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28285.1776378810999882085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kUgA+t8h;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so567245e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378809; x=1776983609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAd0/5j1V5xgW4q/pId9w5+bSBm8u0tp0yA30KouV0A=;
        b=kUgA+t8h+ymfdy2nTIAsKM/7Y5rpho++ocy5YjxYVGNyPyZjl1RZ5O84hU2e46VE9c
         /AIIb8Zj+/IBPU/ORg3y5grCCXw4MlS5mG1KSJgxBYJL/PrM90OoRsbX1/fLjvl+eGYO
         UCYHDxUiVa3qlxFpUX2z4D8HyD2GbicqMMf2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378809; x=1776983609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xAd0/5j1V5xgW4q/pId9w5+bSBm8u0tp0yA30KouV0A=;
        b=SKI5SfELDA8E3yHhIJiBCqXopFkOCMMkj5KxAcLLsRfT9Lfh8hqNaIRM8K98Qnef4c
         gqX1Iab81NdELL19+ifuC842F2w+NMXG0fLiDcHFp/Ud17RnbvmCUQqvwyPzShV51w05
         OFa9NOd8Rc4G6FVv3ZePIjRKf1bsK2QTnVWDDbBeaN584SjK9DvJZ8LRoJ/PvBATrSSa
         +c9CYl/oJJCnNtIyWgf5/Ibg24mZtGgirtQM8Jt5bqr5eceJ6/QSmuPxOlI4URC12Lnj
         d/5mhP5QY+ozdabes4YJgPiaNf4j2bCV+2jpr56iJUs0BC4XHRaAi9I3QlcK0JYxTNGa
         CvCw==
X-Gm-Message-State: AOJu0YzqoBfp/vq2Vl2itj7xd8Dqx30NGPaVeTeKwgNz8v5qCKNSQm1/
	vmswsLON1omahfXvfn3ygBnLm1bEgXvItCBIkB5baeQPFNnaLwYt6VCb8wEYYdbewWJ17pe3ioy
	E0E4le35Xvoko
X-Gm-Gg: AeBDiettqTr9gGWYeajmUaxin2D6l9GWn8Ra6ibD52FWcLB7qz5ael8VFVTAUQL1vjh
	p+w4NRaAIml7QZ8ZznPBlsVqie/sfNlNm+7LnHcVrexdBqHF68Vcg+YXaEK5f3yBZvyoJmPs9ja
	oSbdRw1Dw2Z2lgzULBsyFUDTn16ac8EWFkRtt4YVJ8274CSRDwtoDPXERy8dYlu50ngcAUXmoMV
	f4rTgMy+1Anku6N61KlFzJ6w4oJBakdfCaimEK5Tba3x6yzFt35xlrvDxHTd6bKTghVqvoVnVMt
	skFlZDO5NsLZe2peREkrXN5XRQJfuu5EZTJ20NLhpezyKCCmBD2/3TVqnUus1SaDynidsTDHtfL
	jAdJv60RdEGWgRkPBDMVl2izepLQHE1e/zuPAG7uRKvlMgc3KPh3xVDpfzQhlW2nz5RyhXcHiIf
	j4m077zUJxWuPXoOil+qngjYafQm+AaLpbn56SGEcqpxeaSVvucMUiPeiYiWAYAqqcLVcz44Q+H
	sexJkVkEl0Yeth+Glf4FMVDDbxUselAgSbaTQ==
X-Received: by 2002:a05:600c:8183:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-488fb765b1dmr5036075e9.15.1776378809189;
        Thu, 16 Apr 2026 15:33:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 47/51] scripts/install-buildtools: Update to 5.3.3
Date: Fri, 17 Apr 2026 00:30:30 +0200
Message-ID: <a32170957862f5683ef7489797b4a5ba57d54d4a.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235476

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 5.3.3 release of the 5.3 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index b9c008a2ecd..7807bde910a 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.3.2'
-DEFAULT_INSTALLER_VERSION = '5.3.2'
+DEFAULT_RELEASE = 'yocto-5.3.3'
+DEFAULT_INSTALLER_VERSION = '5.3.3'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

