Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F23AC021A3
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 22:07:04 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.1175.1738966023343243579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 14:07:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1YAmv4JK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fa21145217so3038285a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 14:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738966022; x=1739570822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbRbIkBXaexix201pgmR9UwXbgn5I5hAvrwHU+OCvX0=;
        b=1YAmv4JK3H3PvK3wCkhRHoslE4Fcz7gHavV2rZISpKtNUfynfqKAAQu17YCMVh5wT+
         F0EKu1kyZMYKPuEdVF/hFP5Xat9sSyka9MRwOPS7IlBjPtWRu5P0q/uQdM2xARPxkKBd
         FYmHTSE6E9LzNA9TTQx1Fu34NCAGC0WhwdLNZl5o9/tpsZtAdIK8jTamRpqdCSL8zmt3
         y5Q+WNgXXy3N6VYzXtoplsr/aed3OATevUybOtSSXcjegdssyEIChEj/7yy0NqrQzzxX
         VQHBVSfeSmZ7oXZWqUUubliPeVDkGQbBqaMGF1VtH1SqLVUtax4k62wxFtORkJ7oUY43
         UxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966022; x=1739570822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbRbIkBXaexix201pgmR9UwXbgn5I5hAvrwHU+OCvX0=;
        b=WOYcGhhUMiasmyhcuzT2igQw5M101+UyOFxE28dfIxCmMC+5glslmUrl4YiM/nO/vP
         nMqsIWDIkzMDPYtxHYWcAIY84XODma8LYGYlqNqmwvljX0Q9+PjZXykvpAGU8iEDet5o
         xYPlXo9WXD3wNxXOVNkVmIG9mS/RpOszb1+TD4CWFbp9AmZT/E+q/9j10csRVnOXXv+u
         90ErP0f/tgAB9Dvw3qnoA6vJx3WnXU9MDTOlruwPTHAHU0eJBj0PaxFKUqQjAQS++cB8
         Mu7vfXSxksx4gVlSUB8TG591ch5knlh6/y3zaLZ/+WFuF9G3hsJdvKfpEkosDnYs6rE5
         sSkQ==
X-Gm-Message-State: AOJu0Yzr4sm3JCMyxD75cFVtxq7iHRknYgmy9LS3jmIH6MTnmk8ixT6o
	uvnviLKQpcUSUnl2Oy/DaEbaBkki5SCfQtoofqf2wNZKvECWDYoRVS+//K8hQBNgzrPZVBjkP41
	u
X-Gm-Gg: ASbGncv0Dk+rVzmvLYHwI/S1zl6mjDuvbUiVXiPvFrvbh+t7N4LCsQlpP/s/u8qIq2w
	37p9TVM8r4AfOPcTQN2T7N8Xb/7e2oAgVHOJOJRUI3jxl4XMyZNILHC+KRQJE/SM1WqmAlYEleu
	7qWZrtPZ4dhWxRyXEeE6sqs/xWLjMYoaNjPPHTDh5ypkLBOkPkcqCEjiaAA1Dwlnq7HCr4ROk35
	g9xpkrF+3M5hEK2UtZM62Q9VFP2FYKRUH82siceEKjbLbRhN5hOEktRvmVP5SAG8AIOMpOHUT2o
	+e7k
X-Google-Smtp-Source: AGHT+IGDuk2W8ZUaewtDl49eJugiAKlo29Ed9yo5Li1cUZuubjNNlYdn2/KyeQUT2cBTKH/jcK1Yyw==
X-Received: by 2002:a05:6a00:3e0b:b0:72a:bc54:84f7 with SMTP id d2e1a72fcca58-7305d481396mr8200718b3a.12.1738966022603;
        Fri, 07 Feb 2025 14:07:02 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af65a31sm3586737a12.53.2025.02.07.14.07.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:07:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 04/12] systemd: set CVE_PRODUCT
Date: Fri,  7 Feb 2025 14:06:45 -0800
Message-ID: <d92c1ca1c89f140a731aec9f3389c2dad2f59829.1738965898.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738965898.git.steve@sakoman.com>
References: <cover.1738965898.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 22:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211003

From: Mikko Rapeli <mikko.rapeli@linaro.org>

systemd.inc is used by systemd, systemd-boot and
systemd-tools-native recipes so make sure all
match to "systemd" product in CVE database. The
split between systemd, systemd-boot and
systemd-tools-native is specific to oe-core and
upstream just refers to systemd. Not limiting
to "systemd_project" vendor since multiple
vendor names have been used in the past.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb46ad379170f0a80ac2d061fa02c118f5ed1d31)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 83dcd65a83..4e75725caf 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -20,3 +20,5 @@ SRCBRANCH = "v256-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
+
+CVE_PRODUCT = "systemd"
-- 
2.43.0


