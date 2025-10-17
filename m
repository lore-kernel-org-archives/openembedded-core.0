Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89B6CCD1AA
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:33 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.3121.1760733571467092711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mt7OZ0I/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781010ff051so1833357b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733571; x=1761338371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrGmyQ5G+KuhnL45dCzVpfpOweq1tsqbC8uhGS5lxNI=;
        b=mt7OZ0I/Oc6JrehH/NHzzxeBxo3p66qmFQtRyTa4oQOJQT9fips4u4xwA+43ipGF2e
         17fRNMyi+Cv9+hyaCbderhVLtYS2glzYAFdqH0rdNdyF6BDS6fG/5qZb2oD6jWii9+xN
         mjaoAJCKQeR8/3uP3abDalkDEqK7w7slDw78gut6F2U0BwrI4Uwi2gTOgL87YI7lZjvl
         5hyoKE8+TuwRoiOEUs/5C7LuSBwDbFXCyM5aqsGd/E0rLTfhR/WmDbopUjfEPcHlUw5r
         ccwbpdlmSE9wsu/A4dh2p4Oynkk39ZxnFkAzPDkwVBuswZWSAHuVgrj394puOOZ/Y0Mm
         qwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733571; x=1761338371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrGmyQ5G+KuhnL45dCzVpfpOweq1tsqbC8uhGS5lxNI=;
        b=U7yC85zjrnUiR7VFzQg3Mcp6EM91BGiRZrMMKH2zf7zDO43KwZujsY9+/8ctdvBqkl
         SVjOUpNzx9UkQy8uF25R3jnnBffKk6a34P7jmvtwj+1NrAF/ymOygyk1bKOrJjPKMYiX
         KwUkfVuGrHL1oEL3cKlyqPMHJ6OERpTLVRugiBv4T4g2/0b4Tp3P4GyOEKYXR7xMK5Py
         tH0IZtG5Vu6M5qraCIIvl7z7Vjeru86y2RZhG1IyMrn40PF9FozSPBo2Q/DNnHnRlwBH
         GFOc/J7swL5D1Sauk7apM38htgfkB3q71pE7ITQTA48fXEV55o+IgMbp4KTW8TUEfR2p
         AI3A==
X-Gm-Message-State: AOJu0Yw5QzlBOrBoPDhAx83e+845RhY35aRz2K9TE8YrQCk4VS92rIu2
	04fxnSm+nn/XrtVYQ2V9ODaWE1ARpgU7cGPcyj0pXCvvqfDR4RFgs7njLpmt1gKde2W+NPgf4kP
	LAySE39Q=
X-Gm-Gg: ASbGncuNLRMIcvtd8N7LEylDyTJpFVdp98H7HZQYQU9/utUp6Ds7Jn6BtrqG3f6bx7x
	R50dQJ+tMN2WNlOJrMVIdtoZi7CHQyGHYauvOpIhZ84G8nqcjrJkCwsFs9P/TYTbC+MJ9zpmuSe
	nay6TANqtCvTNzGToPBmhkyRERkKoEMPag9f8lCXDpuhu++t7V3vEDHsI8ngOcx+i/UPR/Vd7O8
	qNvclqR+t61Ddp6uC9BKgVAOwedIi5vra4Fd9JTfXRFeKsH3rVKYIKur5kHvjjbGttd8ccHfswc
	+3ay6QODYgw9qEPfXq+B3S1s4F1lwnKNAt0uvxa0A1idx0sPjYKMGn3AlCYWnDNNCuWl+UHAwVc
	RDmEGJFTEqw5sP+TxsTrHCJGgqgzY6WthxVRS6i2swWKztdQC4dMF30lE30M4SRSp44WE6mQwnm
	oS
X-Google-Smtp-Source: AGHT+IHArZEskPcy8QOT0Fy/X8iwYdk35eUFvHZccIcm2+Uicl0RQKz9VS7wu6IRUIZkADXEMjt3Vw==
X-Received: by 2002:a05:6a00:2d8d:b0:781:187f:48d1 with SMTP id d2e1a72fcca58-7a220a58497mr6289120b3a.1.1760733570661;
        Fri, 17 Oct 2025 13:39:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/26] gnupg: mark CVE-2025-30258 as patched
Date: Fri, 17 Oct 2025 13:38:48 -0700
Message-ID: <88fe1eaa4bcd7c838902d8cdc067276c5f32624d.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225039

From: Peter Marko <peter.marko@siemens.com>

Per NVD report [1] this CVE is fixed by [2].
This commit was backported to 2.4.8 via [3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-30258
[2] https://dev.gnupg.org/rG48978ccb4e20866472ef18436a32744350a65158
[3] https://gitlab.com/freepg/gnupg/-/commit/da0164efc7f32013bc24d97b9afa9f8d67c318bb

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/gnupg_2.4.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
index 9c5de263c5..a6e777abf8 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
@@ -82,3 +82,4 @@ BBCLASSEXTEND = "native nativesdk"
 lcl_maybe_fortify:mipsarch = ""
 
 CVE_STATUS[CVE-2022-3219] = "upstream-wontfix: Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993"
+CVE_STATUS[CVE-2025-30258] = "cpe-stable-backport: fir for this CVE was backported to version 2.4.8"
-- 
2.43.0


