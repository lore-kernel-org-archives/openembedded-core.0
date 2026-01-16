Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A58C982F7
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:13:07 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5023.1768590777573358065
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 11:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aqXpDdWR;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-502a7f20dd2so1436511cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 11:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768590776; x=1769195576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjxYzvvWf4Cu4hPx/VkxvgapdI94Oxv2FhCFriptyZY=;
        b=aqXpDdWRPO5K9sXbWzrv5bWc00Rgmxx2j9TfLb7MaNrBn1mkNmTbMtlrUPK+9kKT+8
         d9hxjeCr0fssNiS0s77A1NTHG0E5NrGrVypPT3Cq2k/PJH/PWirzeHak3cnNXrOnmHhr
         zTCIygec/BL7DVaVKQV+rEKR372AXFrL5xT5AVuTDRbs9gOrBgKkDaCQnk+r6ZcfE9BF
         D8tfjecJyDAKKp33G946fRyGyGP8xKsxVCUs2DhQD/Vx+OVpSspTelUTkMv/QiwAyeKP
         Gy9Zc662EDmTl29tIzxKCmVUo9BEtDIdwCvPrQtsJTOE+lFksZAroEhqvUEcbW2XWx3t
         VkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768590776; x=1769195576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zjxYzvvWf4Cu4hPx/VkxvgapdI94Oxv2FhCFriptyZY=;
        b=nKDnfRQcrk6nE8dMj8QZ1N3hYOFLPHeWjCRaTzHjRYg7ZI5CVBcUvh68TduuM6HPkZ
         F7HKpeGdnhlN7EPO6Z0TvPnfeCo5W+bUd6A6nn9Oo8d8Eg+Xm9Bcs2S9NStGpwjFMi9O
         MV37Gn7Ww/2RYvYf/KAx9IOJYSsS84QjO8ZrjpEzKa3+0SITDjfBLpuKTQ40wyNCHrBU
         SD+8uecJZJKE20p23gRVrbq19BbkVHTDT1htSdRKbQjm3fqAWaOVW7w71WaKUS0VcPSR
         NrCX7iMXuRAsP6d1SZMAQliwElORYlmrw6CVe/LQeFccmgmaqTe5LNzRNXI91GSuThL2
         RZRQ==
X-Gm-Message-State: AOJu0YyKrXTjk6exwYKwddlb5BFbWg6k10JSwRHSbs1IAPncxqNvmHWM
	cSCL6FFzq+YQUIghqWvrqWEfKtC5BFsm53+xgrVjbB60icMtTqboDzA3u7vzut9ffLQ=
X-Gm-Gg: AY/fxX5/qib3Z8HjKhwqsynhGOO+5eMDj4xU6zPBUiv4Ztl2IMFnFi9/P7bB5uUlKjZ
	TbDNfPQnnpGOZmgF/nV124UPLWqcZrZeRgJyKVjl3sJRHgDqs50FUCKdBJr+eXBi5VcDMK8qrBv
	Q3lT6CeURm//TDcDiEvPH6aV7EyzvtYvbOszjtm8oMgYvrUGFJSwcUBW/8CVoI7rRBeb2DraCe2
	vYnM30CbxoWFlR0Q9BnrgioDKFb+7cPq553Bl6ekkbCSnyeOOf/k1NNFUvqVEIKwuCgirwbn4se
	UAUzWPM7ETXTwfz5pqRVCFuqGZiYbUblr+mxB2/VraR6oQzzsYm+OHWQr+T+GvxAuE/SHC6Fv1n
	R2jLHzYVIEKDYhCq2Muyfnt0/XO0VD9/l6eUab4UQQpFaYNo3ZjwB1rjh8dhl+SM92lDOye03DI
	aidvya8iLabr1pmkR4E5Hu49RlPQivuE11D9MaC9iESnP5Bwll5pjo/bU=
X-Received: by 2002:a05:620a:1a1e:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c6a67d8224mr396474085a.11.1768590776533;
        Fri, 16 Jan 2026 11:12:56 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71bf2b0sm287446685a.12.2026.01.16.11.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 11:12:56 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	antonin.godard@bootlin.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v5 3/4] generate-cve-exclusions: Move python script
Date: Fri, 16 Jan 2026 14:05:19 -0500
Message-ID: <20260116190520.118714-5-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116190520.118714-1-valentin.boudevin@gmail.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260116190520.118714-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 19:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229561

The script should be located with other scripts in scripts/contrib
instead of staying in meta/classes/.

Update the new .bbclass to match this modification

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 .../linux => scripts/contrib}/generate-cve-exclusions.py          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta/recipes-kernel/linux => scripts/contrib}/generate-cve-exclusions.py (100%)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/scripts/contrib/generate-cve-exclusions.py
similarity index 100%
rename from meta/recipes-kernel/linux/generate-cve-exclusions.py
rename to scripts/contrib/generate-cve-exclusions.py

