Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7040DE77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:55 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.21454.1733334886673452223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kBwio8Ne;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so57258a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334886; x=1733939686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGoBZwPKYWLZGl+gFI0fsPV8j+YBgvYrZ1RZ4VApPzg=;
        b=kBwio8NeEUj+988ePSAMobTM1dKVwX1V4EXEMpZkAGOZ/xqyIzQmT6WzwWaPOCixjl
         wxykXlD0JTfUElriuKLR8GOIRkxzbCCQy7Fv+xbmtUF98IkzkmcSxaUbyGcTVjXHWzy6
         Sv0Wi33X7S4yCCf4BI0oc4XN8Dj8Lw6wnWV3QxggdfUPghL19+PhAdMXm29PGeR6BAxo
         /JEgsBYjb6d9kcBCaBMensa4GRCNvNoigvNV/0WM1JDGTXzGDpQO2BBUU2uJO/c5FPkD
         aFdiVv2JGKy99SEJzFz/NXw0djsuRuhPlY+EJvl1yj0gAWDB9GhMEyxmPOu6fZGc2Qmr
         kf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334886; x=1733939686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGoBZwPKYWLZGl+gFI0fsPV8j+YBgvYrZ1RZ4VApPzg=;
        b=AGzCelnKHowtFFG0PuPsgdDaZOYJrUVjRMcxjnDLh55pFLi803geiBFbuX7IrE9H3T
         KGkIZUc49VZaI/tnde3eVEKmcagrpDsVGkw+XgluAPG7wzJtDRCZ6ucT4dYuqQlS1Yjc
         Gf44Va6yjNOkjXkNWIk6oxVtju3vfO17OQqEXiblUGTq6/MsjbZItqBOEW48vrNaoHC8
         byz85i33H46mAetsls5KHBQRAu7wLvlus/DO71E2Uj/EFpy5kIi9wOhfPle08jKCjJCF
         uR99XZsjoy4hVnPyAftSRQacxViqXwUPdm8OUNVBJIoQrEfCxUpgUUDDZmmeLsMcLRtp
         ZC2A==
X-Gm-Message-State: AOJu0YxGVKWKYCqLm0mToPONa0DWdZOnQV5MQINeAkKeYKjOqcGhyhZ4
	h4CiZNZ5mjqwkCUihHUeJMxJQkSIZvduLarLYA7tMPK0AAJZP/xb7T2DouPyZghm18QHi9nt5Io
	V
X-Gm-Gg: ASbGncuNxDlPmz/NXXWr8+dYZPX7zrzcWtpQSt3wp0CKyPDRS4BEoqHH7ML8fYneIqh
	QxPAmo3c19d326JxuZa4Z9qLuQy2mQ9Trir/3CN8OIhM6Kewv8dvAxjiHatUhVMo8IDjtZinVc+
	6+CbI7l1stVCAS0HuGlWsmvVqJ7ogw1zrP2Exsag5mAMIGbdydaLHjSQrr2htua5bHiAlDXOuCN
	BocXX/+tk8DXbHn14QL3+yuVPodVuhsgME2/88=
X-Google-Smtp-Source: AGHT+IGMIFCsPEPzikx3Nup1X4cz+psT5p/ZfFYj6MAr9Q8KtYnlkJHjnHADrADOvosY9Hsx+g1oPQ==
X-Received: by 2002:a05:6a20:7f8f:b0:1db:eb56:be7c with SMTP id adf61e73a8af0-1e1653f333bmr11485022637.35.1733334885949;
        Wed, 04 Dec 2024 09:54:45 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/38] gnupg: ignore CVE-2022-3515
Date: Wed,  4 Dec 2024 09:53:45 -0800
Message-Id: <12007a6d19db220e6540948de9818332192ecde1.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208301

From: Peter Marko <peter.marko@siemens.com>

This is vulnerability of libksba and we use fixed libksba version
(currently 1.6.4).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/gnupg_2.3.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.3.7.bb b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
index 7a29a5659a..7075a61898 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
@@ -87,3 +87,5 @@ lcl_maybe_fortify:mipsarch = ""
 
 # upstream-wontfix: Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993
 CVE_CHECK_IGNORE += "CVE-2022-3219"
+# cpe-incorrect: this is vulnerability of libksba and we use fixed libksba version
+CVE_CHECK_IGNORE += "CVE-2022-3515"
-- 
2.34.1


