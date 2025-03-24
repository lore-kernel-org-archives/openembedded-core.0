Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70FAC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 17:42:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.45531.1742838170230030051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 10:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Symgcm+T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso4457476f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742838168; x=1743442968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9zqbhyyIOJ5jonBHIH8baXuSZvLt+0n0f09baDkk3Nw=;
        b=Symgcm+T5LgYauu0ZGrbmTSlg6hixRhJ2FM0zMzJhNSa4cp1uuKS1MTQn/QjFMiI+S
         wvRJXlHV8CRRn0ZpqUql689uVJ0WyFxDx3By1UC2mCDXMDL97tFJBXCLDAuPmY/ypMFE
         namXvycz5jxd5TBWjrmj6CTVdrWCrs1E2waR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742838168; x=1743442968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9zqbhyyIOJ5jonBHIH8baXuSZvLt+0n0f09baDkk3Nw=;
        b=eGM9gb7C3xot1WkhG3jWemIwvW9aiEoDR/JbeYlm15kB7ZJHxUHpXN3LCjbhn8Wqm/
         knk9HMFqSTV3G8dKhSbs2lHYIvFIq9ilvmu7K9C8jaNbT/LCruJsNBYEFzUjvy9i6Umf
         vN3XzwpLRrxhRtjGPefqzvEVEX0BMlvs6/kStZwcAiwmVBmctdgRzNmREeHSFrmfik5x
         TIvojTGNTRM/LfKsycVT2vvYpkX5+ZRutUtHshrnwGPR6Fme77QGlyBk3S5R1Pdr6O8v
         Lr9jh0gHBexJSy3WR3g794n7NCMwZxvU2/qZo5WR1EPS50K0VvBQ/C3xkLU2xoiUyG0O
         fmoQ==
X-Gm-Message-State: AOJu0YxNJN0/sLnYVUUg+U+wAhzt9lLvAVhRS608nES4jAVvzJ/GxUdU
	l/IXImOck2UyWQqFRclXTXT5+l1YNeiTN8asn2LEoC+fItUOasjr5Rchf5ShCuB3jiK8COuxMrL
	w
X-Gm-Gg: ASbGncvOxtEtRAyCAUWvPOuq94YjPguVn1eG0Vw8PEOpq5wQUInVQEezhbN4ZXwiYVl
	xiTBngHs81BSgMF++hrwP+suSn/JA7hQMnPUU3N4ZMpFE+PHclNSEHKy2VDA9pYZ+oMCZL/SJAN
	8YTYAlNueDQuahwQoq1gXuTvfmAjrEwsR9fcLxXreMN50mnEpg4cEPIpUk4eOiTOQCNPVgtt6FD
	lOHE8tDhAQODsaOXWlByNbLSoZVOBD5a9ROUNNnqN7TtYzWa34smetrPRtrGeApOoDEcvIpir97
	5WOcQb+avDcFIETpNzEfTUuJN8PXUAstbX7R215vraNgBCrRYa6zZBN/I1Mw0HkUnw13VwFL
X-Google-Smtp-Source: AGHT+IGOCKTzZuOEBTIDO0FiqMhz7lEXVNuW9NTJnkhHhbBNopgBoWjz/4h+wj5vJst2Q4wO7etzDQ==
X-Received: by 2002:a05:6000:1f86:b0:391:4743:6de4 with SMTP id ffacd0b85a97d-3997f940e28mr11306728f8f.50.1742838167913;
        Mon, 24 Mar 2025 10:42:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24f9:315d:dc7:9e14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d42b8fcd4sm108373515e9.1.2025.03.24.10.42.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 10:42:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity.conf: Require bitbake 2.9.2
Date: Mon, 24 Mar 2025 17:42:46 +0000
Message-ID: <20250324174246.401636-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 17:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213567

We need a version of bitbake with the fetcher revision changes in it,
update the minimum version accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 02775970aee..5f8da8baac9 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.9.1"
+BB_MIN_VERSION = "2.9.2"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 

