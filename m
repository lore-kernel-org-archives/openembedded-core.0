Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FCFFB5EA1
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:46 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65370.1773705821459580877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e0+I1WaK;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6611f41eebcso6881297a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705820; x=1774310620; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsxFsFSxDiT7lKS3iSmZWYcgf5tUkqLE/rmRetGcm1U=;
        b=e0+I1WaK70fNIqEBgKtVrPbtfJroReQNnOhWn9If9+bD/x48ZUV3Hv6Ud63iHJfhUE
         wWpvs/h1dJsxP16AEsF/88byThdsx9ek/vAzVa7DE8UZk6ZwoVWNgD/P0eVAacsD+x+r
         CbT15NdIEg+QeJjD5AjMomZggNYa8Q7QDqliuXJGGO9Vn8HxU45jquqI56K569Xl2w+y
         Mf4sIgnas+iIuZDj6AFnIVtG1w+Nz3INy/5ILvY25BIk5EWwldBbQTXx+gRjAN0F7U9t
         ++gwARtUddVy4aNxLggmUWr+nMr3JViN/XjeIzx37QsHdULt7f/gMjStEFgbDgUyaStG
         nHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705820; x=1774310620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bsxFsFSxDiT7lKS3iSmZWYcgf5tUkqLE/rmRetGcm1U=;
        b=J9BqOYPV3AXjvOpG0Jq5j0SU242RFSu/8YExOPkwWVqkgcpgnSMmUvVj8OjvYd5Y8y
         q7qIq/Qtih0fKe6Zp9pXUnc30f8Gj0dICu/2F9jIqo9yZtuAzfGTQ+a0Tv0xUkNilf9N
         ppHV+fDujKM0+OxtvSimvSy1PMkjFdrv6mHW+9oaiawWx0/6DeAxBGh4bXqsvKZKI/zI
         pql1b9hAFrigQeBwGXO6sF38HMzM41CSqFExf2dBODj1NRJKDgogkz8A/SZQD3mAf3Kw
         Wa8280wQcYdpaDtk9OKUT/0p8MW04Po81tg8kDCIjct88RU7ZhikBRXrTSGEeeoXOrV7
         J+9A==
X-Gm-Message-State: AOJu0YyLFrH5ca16fZnDxwQk4BMpc5vjntlywUvz502JeIjoTboSUFPt
	Y2zhTzGYo2CWzYD7espOUffftSDBMngRc8n2OMn0WFJWonK1/KtCkTII
X-Gm-Gg: ATEYQzxerJDigDyvVgAFRFNLNgmEX4ICediRm69C43XEaJA+1WRlAMkiUOdTSWD9/h5
	BLeR75yGsFLOG1pvaCfB2zZRRBLIxePkexfmEJU+6/Sbf/NqSBG6CoRViSatGC9D+reEPqF88jO
	D+5xuy6oRRO3//kF7iQM+UC3J89wVVu0CQjnoLzsk8C4uPpGk6PrVpVRZ+dcP6jdG41kDw+6nUg
	+drfIkpFbDnqt+RlbaCmtXBkMh7p/MS9FHxCY0FlyIh6usv7THP27sTTTV8ZMKjEZConLh24re8
	tGqicfXJPZ5UkL3XVeKMAaFRazg2a3MOx4enLd/M7nrw0dr4VD2GclTUXShtUi0935Pm5rdzY69
	ONjtZ4xBqVOEOWBbaWkxjtx2m1yAAIktjal7ugLlWxh2ghtSswWp17kXTUGVdXyIofqDKK3rokn
	grVcEnVCHXNNG0mOpK0wM+q5MBjaLnSue6xey/LYzcPBLgtaq0VvmPQXM=
X-Received: by 2002:a17:907:72c6:b0:b97:87e4:7f40 with SMTP id a640c23a62f3a-b9787e480fcmr665783366b.27.1773705819627;
        Mon, 16 Mar 2026 17:03:39 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:39 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 01:03:14 +0100
Subject: [PATCH v2 10/12] dnf: Convert confusing append to override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v2-10-5c65ae5787d9@gmail.com>
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233283

While in this case `RRECOMMENDS:${PN}:class-target +=` wouldn't result
in any unwanted override, there is no guarantee there won't be a change,
which would be hidden by this override. To avoid any surprises in the
future let's use `:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.24.0.bb b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
index d40b85c4b0..832b96c929 100644
--- a/meta/recipes-devtools/dnf/dnf_4.24.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
@@ -55,7 +55,7 @@ RDEPENDS:${PN} += " \
 
 RDEPENDS:${PN}:class-native = ""
 
-RRECOMMENDS:${PN}:class-target += "gnupg"
+RRECOMMENDS:${PN}:append:class-target = " gnupg"
 
 # Create a symlink called 'dnf' as 'make install' does not do it, but
 # .spec file in dnf source tree does (and then Fedora and dnf documentation

-- 
2.53.0


