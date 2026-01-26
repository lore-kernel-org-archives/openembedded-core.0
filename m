Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C38CCF65DA
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 10:28:26 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16746.1769423289638692738
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 02:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XhvfvgQ0;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso3755626b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 02:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769423289; x=1770028089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6p+gmgZDgdC54l3eh9em3aFfWbPzRflvDu07SWYFT4=;
        b=XhvfvgQ0Hua43us8PQMUqq5Rr2YWmWsd7WFkfiV5B3cbZC8mdmIRPdUH5hKJ22xhyv
         7ev5u8Ep2XxHR0JZqJOSVhApngpj6NOz/jyAFTjPGbfsL8/3WJFDu/vTcI+jMQ8ZCbVY
         MUuiJGhNvF0NnB73fPVBG66xRMCu7lGjUJI7tm9LQcHmtbaDJOpt5IjNQJVH1I5GVg7J
         DtUx/EWNdcRu2X3lADThtbrOANOuLfxDn99Cay4HiOyBoWsYPJ/fY5jXFhWtgnXLCXNT
         eF45N0FlKIxvLDuEY+bVpfJmvoua5U2xRR8BY3PrmVAxOtaG7txHApFuZfN2bXt3/SN6
         wDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423289; x=1770028089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y6p+gmgZDgdC54l3eh9em3aFfWbPzRflvDu07SWYFT4=;
        b=dmeS7RmkjTdKzIOpPz7HdfhxGtwWuV3/ftWrUFLB46AFOmtPdV/YqHAaYXmHP2erc8
         6koBzTAGhi2luxfpo+Ue4t8nPW7KmUC5LpNz1H4vZtnqYWAa9052VTQKho8FSZCth4cJ
         foYK2X7h2iX+k6tYU+4xF9SCV55fIR/bc6wlpRKGV1mzasuOzuJaVIm4qxLPRx5tSBwJ
         WUwd5pNRFgW0C5rA2Fj3DEr+xcaWX+bq8Nc6qlO0IS/wWG8NSQW84Dyff6T35g0zEDG1
         cKPFE+smCw86VdzxZ2ddn+GrrxCbgGsALQReGH46SPYyIHqn5Rns1pPHpTcCkbUzWmk5
         eePg==
X-Gm-Message-State: AOJu0YzCWSvVQPeLvP+/6IzSUfAPq6BbrlpENnFYj2sc8Q2D8kBkvjYS
	PrIuAFPPPt2+72diDzbnMGUmOfkKAG7bmzU5xeePlB4asoco+GInuOtzNbhN673r
X-Gm-Gg: AZuq6aJkN4Djq6PSxMT9Ud1DkYQaUOlSICSvR+m4HPIwYpO1VBWQj0zJ+cAE7Ig2lqY
	zvkCtblv4de6mDsDAbXZfrTAcZhcWRmPlJz4Hkt23VlCZOiremYv6isvFId4Rk5TnTwco6xiGZv
	2kGPhNKPCnezRKgNIQVr79XMXShHoElDjxBF+KTRtJilMyRE26u0mTNSKsx9dhB9euWD7ZCvVl9
	eGdCuNIOPHDxZWeYS1Sa4kBQlqk6N8R02bQBpn8f88F+MvDKYNM7FqXi4YaIK/q6N69Ig7NFmfF
	9H26FiNbRXhBER1GqVLzJ7Bnoe778qt0VVIg95/mUS0AUzaZSMpbjRMJQUENRMtElFl7AVy6BO9
	78+AV01r7ZQMZexJzKU6Tz/wzNMZbARxWg8KxSGROb1da6GrF1ztAjBVRiKicFVU/cykPGB6Ttz
	rToTmdKKV5IHmCcU1UkBtwE4L6
X-Received: by 2002:a05:6a00:6f58:b0:823:5270:ef48 with SMTP id d2e1a72fcca58-8235270f071mr1216518b3a.33.1769423288785;
        Mon, 26 Jan 2026 02:28:08 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318644989sm8880357b3a.13.2026.01.26.02.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:28:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 3/4] stress-ng: update 0.19.06 -> 0.20.00
Date: Mon, 26 Jan 2026 23:27:46 +1300
Message-ID: <20260126102747.1077552-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126102747.1077552-1-ankur.tyagi85@gmail.com>
References: <20260126102747.1077552-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 10:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229981

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.20.00

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../stress-ng/{stress-ng_0.19.06.bb => stress-ng_0.20.00.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.19.06.bb => stress-ng_0.20.00.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.19.06.bb b/meta/recipes-extended/stress-ng/stress-ng_0.20.00.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.19.06.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.20.00.bb
index a5418ad9c7..9302a21db5 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.19.06.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.20.00.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV}"
-SRCREV = "310c900f697028dce78fea82c2b1d28a244c86c2"
+SRCREV = "dcd2902c888c1eac1d958785b13cf232f46894a0"
 
 DEPENDS = "coreutils-native libbsd"
 

