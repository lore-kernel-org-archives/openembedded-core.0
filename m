Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F034CA9ED9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:18 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23564.1791708069285868406
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tU6oOnvl;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b042c0759so656214f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708067; x=1792312867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TrsbDjNhTpr6m+6ftGT3SA1Jkb0yZRMl++FkGQRQuu4=;
        b=tU6oOnvlqJZmiZanQV6aVtRIHdh/JVJT9rSmj5z2ayGf0m4I9gqj7DBO6BPH+uLNSj
         gmC1yjZkXrGNPvLrN9NAZ6XhX0N2gh4JkvCu9+/hfhktGM/WG5auY7hCOjl24DFBWBlk
         tz+cOMmIc6YrZg1M+KEoK+6mRzMCeFhvpOz9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708067; x=1792312867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TrsbDjNhTpr6m+6ftGT3SA1Jkb0yZRMl++FkGQRQuu4=;
        b=l8YtuCrztBDNjhJXD9raMD4kWc9FwZbNBGX3nn6n5mx7vG+UJkQ0YL+G0iw0WGK5gd
         TXufUoCgl5nlQfD720ZInLmz5gNm9RqjovMD+k/l55s2AhthEWMZ4jdyfHlAc6+a9tpg
         FXXtcedRkHAVpVbB6JVUUjz2rXSzFdOqMmRamKOF7JGJHARxXg1ONJNOg4YHwtBtAKxy
         n8iIVjh4h1Tzgzh9oPGq0h+hs3SGW/WX7vgtlXFsYBuAUKrl0v0Z2nq+mQrBFXwubYlj
         GO/qvwtLmK3SRZ9hTBCYFVclIDR8c3OqQ/gaPXPMqMze1K+8GLRVRUIFqyFS+d8awZPX
         7+1w==
X-Gm-Message-State: AFq9FYISACt6/9x45bqhNBrdIwsnXJjX3NR7f362LnHOJXHe1ECEAZ+r
	LrUG+8/Uz7tMev/Qla8kTIf06wGTeOrG4G+5gWk444GBSJb5TGMRqni5jLIdd9kjdu4ZTMQBcc5
	CGh6p/y8=
X-Gm-Gg: AYBFou1xk/kv+b7MCHEE3yH81rervHjw8URstpzZcGhrhm07zMoObb0cBKkRI12yHW6
	v0gUG0aJ+q/w34YShFEdyD5Do4+Lgvn6sbf7Zi18nYxNl4rC4xAdMerKBOlsWJm1WVgNHgGjiT5
	/OfA6HGaZVVGpJ0094teIbCyWtZPCms+bR1PSqtaFPd/rk+U/H0WB2FmI9bWUwBjSoNqXLzNMgv
	Vbp5hspVUPejxA/QTKRkozUPit5sO9sBxcAo32p8aMCjNWi4oBgQb7uQdsq1PvnireH5jj3c+rw
	MTAwhJOeDvDAlgCHx4xHacpZnWG0uhCpRUOEKk+3cPP2OC560Hdaf/PgB2VsYvyWzmQ00TRq0Dj
	dzL/q3shpjELo/SuP/NOpgOW6HjNoRu4kO3cTJzaDO3B82Coqify5UaiysvoybVx4B8xaLZF9Qv
	D4tx1pPcYx1JDw7gSxF6+0+sbQY1Uk7n7QMvJYN5Nd0MqFXq6wF3HE1ln8E52n/ZHANjH5/59o/
	gnFLvp0DOWepYsKTPoRQjmCLwY0byPu1T44V51knUAvr5AYHavxtLeombvVh/qstRPkatGkZkwZ
	YRVQrBmh
X-Received: by 2002:a05:6000:400d:b0:48b:10c8:2183 with SMTP id ffacd0b85a97d-48dbacdd2afmr10015500f8f.32.1791708067449;
        Sun, 11 Oct 2026 01:41:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/60] graphene: set status for CVE-2026-81281
Date: Sun, 11 Oct 2026 10:39:46 +0200
Message-ID: <577e328f76acd93025b54329d8aec72ddfbe38f7.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247522

From: Peter Marko <peter.marko@siemens.com>

Per description in [1] and also per [2] this is CVE is for WordPress
theme.

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/81xxx/CVE-2026-81281.json
[2] https://security-tracker.debian.org/tracker/CVE-2026-81281

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 41cfe5df728cfeef3adac69f0bbdace70c339e78)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index 7aa72b4a78f..0d526d3d76f 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -28,3 +28,4 @@ FILES:${PN} += "${libdir}/graphene-1.0"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2024-1984] = "cpe-incorrect: issue in a WordPress theme"
+CVE_STATUS[CVE-2026-81281] = "cpe-incorrect: issue in a WordPress theme"

