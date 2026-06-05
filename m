Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08E5CD8C95
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:26 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6138.1780698864150073563
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oi4OIvTk;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1378706f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698862; x=1781303662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XUav2G762Z+sFuoS7GNyo2+T0H4U2IiIes5mb9rwlY=;
        b=oi4OIvTkwt3PiYolN9LJrPIPo45qTJco0tkXEDvYi/gnNeRtNf3aclKUULYfz6Njno
         1A4SKilv99UFF3bHxRYLeGyhu+oQsJkez9vGP9K0ZHUdJjohsr447GkSnlVtADbU9Sx9
         T45OkLUYo/o84d3LNbg27FbIOg7dqY9PPGcwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698862; x=1781303662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8XUav2G762Z+sFuoS7GNyo2+T0H4U2IiIes5mb9rwlY=;
        b=bsaqeFMtQNHgc1ifkmg2HSZuwzuA810ZHeKX+bwGoxM5I1aLO9rgHA334t2mp3k8J6
         gnN5nG5AWRnPa/4TZ2evJz/vVq+ZVxypPxH1R1kcNeAZpcAxdeN/mVI56j5nWaghAksw
         W2OpD5iBGq4lEOPpeV/iCNTZi6sdS0J2TOh47ALPHic5fdrjRosanh6HxPnLnrTApwxP
         No03ruOoy0S54nsFVR6Yprf8nraUP/Jaa1vMNooFaCYx9WemECQvHBKDZubnGjHijneW
         rdr/VMD1J7vDl+/p1wXjmiguplB4TzAeTXnjqqCHEH2f/OP3LO1JWed5WfKiFduZbzcf
         e1jg==
X-Gm-Message-State: AOJu0YysiyI/jZGoxkResAwtxuenYdlS6iTBNO7TvVaRyE2vuhFw/Ov4
	mqlJHGCS6/tfHkUE0yR5XLSyknkIRxaNv8koQ9qs1QD6wMReihGJIHE9LipXrz+xWUmD/l1oADy
	APENz
X-Gm-Gg: Acq92OHnIOU+N87rg1aI+EqkZKLNdo2AjuT4aBPLEbhrn2VB+DyXcC6PMh9EiIQVA1C
	EDuN6Xx1CoBcl/bvRPjuc/tZvuktK61tQCYhhQMI8+zxkW1a5JBzH7xQ3mSUauX1gmsJUf7aE4Q
	nVcLtCsHwSouT6OmQJNXnKZMXSSi8cPTgw4kSyTfPQisX1yuwHh7zUxn3JzBoH7CAzBbNP3BuWc
	DBq/RvCtVHyPwHnrHFTV9rK8Kqbgos+B1LNy3FvVOhIaQnGYs8L1rItbpZcAWHEGs9hV3MdT+r9
	Nmq4wfO8ZRTVNhkyVvC12i+ygfENjRCvybdyA4XXRwsKBx1qiHpScHyJs+Cc/BfOhT6k/Afm8Q7
	hwMusxhHvV9natnaMEsqkNZRAuL1pbbXN5rpaoMtPWg2B1M93RbzPiHU8ICyReqR8sPhzff2cFV
	+8ZiHRLx2ucRSSz47sshFaCfFvPFrtz1/TI3A1UPOp71YYFmMmIiC+ADWExC91E1JxE5kKHBeHe
	XT4B6qAt5djvMxTcc435Nh6xFi8kgsiLB61DXI=
X-Received: by 2002:adf:e011:0:10b0:43c:ef4f:79e4 with SMTP id ffacd0b85a97d-4603063a15cmr6732092f8f.37.1780698862558;
        Fri, 05 Jun 2026 15:34:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/25] scripts/install-buildtools: Update to 5.0.18
Date: Sat,  6 Jun 2026 00:34:02 +0200
Message-ID: <7b2955ae65d4060aaa8f3eda9f3583750606a646.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238204

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 5.0.18 release of the 5.0 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index c874494f4ab..24cb3099453 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.15'
-DEFAULT_INSTALLER_VERSION = '5.0.15'
+DEFAULT_RELEASE = 'yocto-5.0.18'
+DEFAULT_INSTALLER_VERSION = '5.0.18'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

