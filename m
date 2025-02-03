Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B93AC02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.92670.1738600921442089202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aigGRlm9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso33174435e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600919; x=1739205719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VuiTMLE40CpGsau6AwD9RBkyJxks0wKdWhY9lUXl2k=;
        b=aigGRlm9ioTKMfYS76RojmqHqM5TKclAhA8Ui9ltgZI/hpkJMnnZRshbNBOJ47RMnR
         mfzIoSSCR0O621TzV86cywZHnjnh+K3e5aighoR7Uh+VtnK07ZIYBy6wTtyVoozoDuDo
         p2a7X2m6kfgFb140oyDAmx4/SBCCvjqOTXQKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600919; x=1739205719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VuiTMLE40CpGsau6AwD9RBkyJxks0wKdWhY9lUXl2k=;
        b=ZB8g25Fub4l4u+3RnF1SAhOWTArLZkA9Aw+8XYfoCaWUN9ibYP92KqykogL5MYbjtw
         JmbgFFufLHLIBmlXEEVMB9ky3cyYqJM2dcaRSAqobPcWySA9mGFWDmSRRED1weIRxS0K
         gNn6iX0104pBZWXeWqn35hebA7XspzgvCAfefdHVovzbhMvd2UwnfF+jy+kGqammQ40+
         rdSuR3e0wCe1GKGDN6PkjxvnnacojKbDUjWSeYsfrsbtzGlPNZ5bPYatWN/m5XpiFu3B
         E7fZyW2DB9AbqyYyWlnygDWrB9QIiWBnN3ny90Mch6GCIdv99YE4l7FD8PC2GXI2hWgd
         4gJg==
X-Gm-Message-State: AOJu0Yy8VlNcjf7cvmS5eGJQ0Hf2j6aL2BbRrEt69hPG5UWE6Jahttn9
	xujWjDgFuLoz4Ll4RoraGKR0mVZxq1r983aZJOj144s3ZbusEGPI03XyOiVNZynMscQUbKVybVn
	r
X-Gm-Gg: ASbGnctF8cHYNSDqmgQORCvQD1b6BTiiXXf+BL9H8ThO8oQCnWumpZXNh856NoKUlpK
	IchrBGZxs4O0dwXiC9AZtDDjdhDLET7/S3VT/zt5tKpoXlvDqO/gNZ9DU2KbzfI5XOQHwNvDCDf
	e6Us8KSLV5MkLAVqkzHVME2FHfLh3lgDV/G9r4MddCTzzwbDZkMKZDezH3nMNVJtAdKWWgG+BU0
	nBY4r3MEHmFmDKqfD8++BfPXy0wYEj/yYgXWqwbq8xeechf1VHYQ+zbkOQQvEFBPKG/BDEyOOXL
	0QVSgJJ+PRgwIzooQRM7iDQi5TjiyEysqSADceGQMBfs
X-Google-Smtp-Source: AGHT+IFBEaFNoC97SeTlZtgSVOMbCHZ0yMq6IPfTugvvUyelc+5/Qi7hjQY/BXRCB+/Sz1y70DW7PA==
X-Received: by 2002:adf:f4d2:0:b0:382:5aae:87c7 with SMTP id ffacd0b85a97d-38c51b5d898mr15324301f8f.31.1738600919421;
        Mon, 03 Feb 2025 08:41:59 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 27/46] python3-attrs: upgrade 24.3.0 -> 25.1.0
Date: Mon,  3 Feb 2025 16:41:11 +0000
Message-ID: <20250203164130.3403325-27-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210700

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-attrs_24.3.0.bb => python3-attrs_25.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_24.3.0.bb => python3-attrs_25.1.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-attrs_24.3.0.bb b/meta/recipes-devtools/python/python3-attrs_25.1.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-attrs_24.3.0.bb
rename to meta/recipes-devtools/python/python3-attrs_25.1.0.bb
index 91fa418e7ce..852c546bb32 100644
--- a/meta/recipes-devtools/python/python3-attrs_24.3.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_25.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "8f5c07333d543103541ba7be0e2ce16eeee8130cb0b3f9238ab904ce1e85baff"
+SRC_URI[sha256sum] = "1c97078a80c814273a76b2a298a932eb681c87415c11dee0a6921de7f1b02c3e"
 
 inherit pypi ptest-python-pytest python_hatchling
 

