Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0787E95A82
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:26:02 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.27701.1696717562275547335
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qusAfFWz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-690d8c05784so2665674b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717561; x=1697322361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3m3jqFfBFYzHsqHD3QY8qn4scCEqbmii1wZJFtvEdE=;
        b=qusAfFWzjY+f4PbyLsELx3qvYCj5SmsnIBrLclLKX6YmFBxXxQ7MOeKSUy5JQuIPeP
         hxwk02WF4gcViSaQR/1zagirc2XOHkosoqPHoi8zGzsWza7CApQ6k7OsaAS2DKcqGhCa
         Z8wmxfNZUF4zcEZtY+Q7csm2CAcKUzH0/XcoIp3F/9Rk9qShJmiqbUFPzeQWWzmCRpXy
         838BxMKZg9ujKf5VpWtY+ltrvgZPSQSq7B+UUHItyWaowXhrIN0xes17LYE48VPECE29
         8Qkx8C77lmdiuIoicSe86z9DZercWKDYjlHNGUv934Lgtra67tlsScAPUBUwgmjDRzn4
         k+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717561; x=1697322361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3m3jqFfBFYzHsqHD3QY8qn4scCEqbmii1wZJFtvEdE=;
        b=Ls1B58yXTQBOCbZoCDTd7+jTVNBF2rH12uCOzVI7DBcGvLtL5WmHX1Qp6TtOOc0lqp
         TcyfyuZKY39Ub0yt49rnivE4GnOWK4CbTAeE1Nazx9eBpq9LUzWehp32eBXgUuGTIcuL
         LOCmJMe9htN59RPZyiAgcxgjYIASZ3feWgjLBXMk9G9cBhe0mhaQ4LIbb2o0v0HrYtQx
         egooabCxd+XyUSibPSsSBm3NTcvqhyVYt8TapdRKHc4sOgGmS7nol/rWeLhHh3pdYIDq
         8uCrB2ayuwXoKHW15qzUkENqekICywRRZ8FcPKXuxzLSVZZb9kljX9YJXHJY3W8hJDhH
         4png==
X-Gm-Message-State: AOJu0YzimpDUg+BQ5Kzz46vUjGE28CgBlsI0/ie4e9+trcBeBBtjerYU
	PXa2F+8BnEjaZciRoOmNYsBifaxWp6h8jCKBt84=
X-Google-Smtp-Source: AGHT+IG9MYM75MhDCOC16SPtmq7DG8sAY4G8fXPmGiAk0UT8rm59+LUvRfPxGwZ5mAidyep33NH2Ew==
X-Received: by 2002:a05:6a21:3291:b0:16b:f3b1:bd60 with SMTP id yt17-20020a056a21329100b0016bf3b1bd60mr5202881pzb.16.1696717561426;
        Sat, 07 Oct 2023 15:26:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.26.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:26:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/19] linux/generate-cve-exclusions: print the generated time in UTC
Date: Sat,  7 Oct 2023 12:25:15 -1000
Message-Id: <aa90e5ea1fe77c97e5915e5e9a69bbd0b9461d09.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188820

From: Yuta Hayama <hayama@lineo.co.jp>

Allow time comparisons to be made regardless of where the script was run.

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 018e74f2ce0b1a4c0614c99bc19f07f787d61123)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/generate-cve-exclusions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index b9b87f245d..ef47f39c1b 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -44,7 +44,7 @@ def main(argp=None):
 
     print(f"""
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at {datetime.datetime.now()} for version {version}
+# Generated at {datetime.datetime.now(datetime.timezone.utc)} for version {version}
 
 python check_kernel_cve_status_version() {{
     this_version = "{version}"
-- 
2.34.1


