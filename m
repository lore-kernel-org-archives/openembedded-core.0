Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44B6CD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:19:23 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5932.1780697956948833642
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xRUYj2bK;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso1266894f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780697955; x=1781302755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mkSxXQ9qIeu45wpZzzWJ6lwUKKuhhAiCr8E8OFmTvTA=;
        b=xRUYj2bKl21mqJxPvto8usu6LZxcFRAT3OkYtJCsO2dkI1aGksji0cV0+HQ8TCK6bF
         Uh40IRmwoz4kmqFTAJ91pzrpsnQW77C4FO/rLD5POgxQEjjA34AyQ4osjKsmokeQWxv+
         hIeNcMJebZKRgfr3N3sPbQOWpM23l9O4C+NbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780697955; x=1781302755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkSxXQ9qIeu45wpZzzWJ6lwUKKuhhAiCr8E8OFmTvTA=;
        b=mj4Wp1fwge1DCExY0ZScCykTEz7ltJbxBHe4SihXVfrOk5NfPuSBtOOFDEJ9+GQH85
         Mz1xaUXmRXJIs2hukdAsVZdtd4Ghbq+YF1tFJDR9oPLCsctB8TyP4tcGvRd8VDZ33rzJ
         11BSKhr8T+126N+LPvQdXGhInmUUpvQIJyIA59KKY4et9kyrchcSF7CjYVg/GXCiYpSm
         K5iUdDvmtFzXC1e0GqDNzeklP/NZTOu/TOK+/UJoqq5CnvPPV7V7jn9tosc9lvI6NpDd
         EdE2n00qpHR6rbosGga+yhGLWJAvYJ3rKgesdAESeXts8On9xIB5mjYArhki35MDKmCi
         Ssfg==
X-Gm-Message-State: AOJu0YwgiABTsUheCY6GRPeDqTmu01GcqdCXymhA4ncHDgWO3R7x6UP8
	ey+uQ+hjKp5VrbPC3cQXScWGbtFP1YgsMVeKw9uPnk6BGdh0eCtqItj0PTm0nPblYlGD3gebhmu
	MDMyu
X-Gm-Gg: Acq92OENk0Jxxqakkldaj3NfXsuiwaeoZgG0xftiHcr5CZcmf5phOgDp6/GRMddxkG6
	vGRDC6hV4D7I/ZyV83kxNzzX63IwjxEExwZX1UXtKlEh5daSWs1YYSKwSKZALMliC1xxkmd+F9l
	sYbcQG1fsC2/1AMPmQTbjJVXumWzKpjSe+IfFOwxPN5o1Xh//NOZuwhrdgG6SWIAzm+d9/Y7Rq9
	fELYk798Hg9Q1fzgnc+E5RYd8UsEV5rtjZFvdCpn3anyC0o/eDEIPmaLvt3bC0Xkl9pR5cwDc1W
	gyd9LwD53OxBx36MTXoms+wgYOky8r1httvASEQP13crTCugZiBH9iBF46/sV+t6jbAxfVwtz/v
	God3Rjnmi823kM9nrOkCdXV0BsVf1TUEOZSv7KVsu20MJqh/cq3aRhTDknR0gMc7I07E5YvZTtI
	3WgAjsIseBLafzhvYs4IemrLqWGYxaWFeXawlX673q154CQ9SufsERfHOL3bvVXcNd4D548rjyv
	fibev8U5G2qyQ9BHtF60uscFzXSxecciIrIml4=
X-Received: by 2002:a05:6000:189:b0:45e:df46:ba30 with SMTP id ffacd0b85a97d-46030630642mr6640854f8f.34.1780697955330;
        Fri, 05 Jun 2026 15:19:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm49148571f8f.27.2026.06.05.15.19.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:19:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 0/1] Patch review
Date: Sat,  6 Jun 2026 00:19:09 +0200
Message-ID: <cover.1780697739.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238185

Please review this patch for wrynose and have comments back by
end of day Tuesday, June 9.

Passed a-full on autobuilder with 2 AB-INT failures:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3934
* qemuarm64-ptest failed with #16241 – AB-INT PTEST: util-linux ptest failure: timeout
  -> retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/3760
* oe-selftest-fedora failed with #16308 – AB-INT: selftest: xterm: Xt error: Can't open display: :1
  -> retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/3832

The following changes since commit 06dd66e6220e5ce4ed4b9af4d8231ae5f0a8ce80:

  build-appliance-image: Update to wrynose head revisions (2026-05-21 20:42:48 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to 39d4d267906f8e18d44e1ba5da84acc4a5a85b61:

  pseudo: Update to version 1.9.8 (2026-06-05 12:59:40 +0200)

----------------------------------------------------------------

Mark Hatle (1):
  pseudo: Update to version 1.9.8

 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


