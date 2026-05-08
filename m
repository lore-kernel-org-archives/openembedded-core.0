Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAECCD37B3
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8246.1778224364394649698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wIqmKIaA;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1333748f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224362; x=1778829162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcA8VhQK6dZ2vT8dDQuwEFoSQ/atHnniPRJ9AH2RI4U=;
        b=wIqmKIaA+xkRJlSFkFrjA+AQfTLP9kmQyryGVhid23+4VUwBMuMpPNL2Z3on6wJDl5
         z7klIk5ht6ruVG1oo5fLF3Fbs+zbraVti8QeqDAngJxkcRfUPxXl2wPauSsXr2otPtOj
         0fsL68cXiiRPPzketAPYJD5o7G/LvJZAI/sB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224362; x=1778829162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AcA8VhQK6dZ2vT8dDQuwEFoSQ/atHnniPRJ9AH2RI4U=;
        b=bTQlCc8FKqICH98vjh3J8m231D+7Uc5dccO9KXYNiYQcXSMhgEN4huXEPzeuMI2M6J
         kuTTro74FifRPAO1muKubuThXLaubBSsIkW4FfzF0R3g51bbIjmtDn8MuEbbHuewxR3f
         w/LpC554UbaGayQbkjcE8UOLKWYJN7q/Zy9CLi0yvCRmrBJnDJNmXub3hHI+A0XbpdcK
         LMhjLGB01fdaMZBn3U3sG14GsDuff5XzQka0WAJDuHML7jk+PTsV+0CuvWmbJMMfIZOT
         bbLys1in4eduD7qPSE0Qmi4A9cH392Rc1xg7J17p6tD8pKno0KZ0fK8Wue8TCB1BOzyg
         DAGw==
X-Gm-Message-State: AOJu0YzQWGAYb6qPKyoEB1YflDDpP60gHpOHKfbOhhwHHeeGRntWTI9j
	7B+xdtEI5WhXHmITrAqV6wjf29eDLl0h3umfYtWVFZYgGEZRnx2CBjAmyR4d0/ODhMBsZc6bLrA
	kQBlw5jQ=
X-Gm-Gg: Acq92OHuMNzV3obCygCncFDgQZoPQGYAaNzSN7PygaGG+AD3ETgYaRCtWWGD38gHG8U
	IwhoJAlSQZqgwIAeHug+4R5vUZ0bSnpvg2D9WgW4De68kB4O3wgvpflqJrGaX0q6MN5Yx2dDPdJ
	5HjwtCWCkklfdp2YSG7Npxe8JgzEDRV6QQC/IR+AgsU+ljLxLfytA4FA9W09MFwtkIbKHFASdiD
	hSC4VdDN913/fkXDTYUHTn1WMYjdSqu95wLoCA4YgU2vknx3xxNbCz9Bfhz7YYpTv0J0VXV7JuY
	XY1/0NTVlF7yj1Z1awANqnFYxNPw/ndBruJlJnoUBCB0eEo/iNY0LB0i903eJ8AVV2DvztnoAT/
	v5MtLAhd7GPOCfx5ru9+9Pz/TZQgKLwfQmW8u/pZziWPyvWsaGdIf98qZyikhSo+fALNSLoPoH1
	dl3yfosumyUfLqT3bheBuKZZ4948qXNrZ0SNHg3fE1Yx0ioV9qXARyK2Qg1ARxFs06AtDyy2hO3
	+0WQEXiJrKBYEvawZ681AroJgg=
X-Received: by 2002:a05:6000:2910:b0:43f:ea25:20ff with SMTP id ffacd0b85a97d-4515d3dc31bmr17461636f8f.29.1778224362351;
        Fri, 08 May 2026 00:12:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 42/52] libsoup: set status for CVE-2026-2436
Date: Fri,  8 May 2026 09:11:35 +0200
Message-ID: <562802eab2a4880df62f26589d1d922e832b788b.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236684

From: Peter Marko <peter.marko@siemens.com>

Commit fixing this CVE is [2] (per [1]).
That was backported to 3.6.6 as [3].

[1] https://security-tracker.debian.org/tracker/CVE-2026-2436
[2] https://gitlab.gnome.org/GNOME/libsoup/-/commit/e9b681a5b23f8259a5e29c5351a5284ae5cd1189
[3] https://gitlab.gnome.org/GNOME/libsoup/-/commit/31052a2327c81fe3b7a3d4a66d8a7c9c1aaa47ca

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 83d00b9b4f89ba30cbac167575ca1ab4ad142b5d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/libsoup/libsoup_3.6.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index 9bc3f2f86fb..206daa091f2 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -62,4 +62,5 @@ BBCLASSEXTEND = "native nativesdk"
 CVE_STATUS[CVE-2026-1467] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-1536] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-1801] = "fixed-version: fixed in 3.6.6"
+CVE_STATUS[CVE-2026-2436] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2443] = "fixed-version: fixed in 3.6.6"

