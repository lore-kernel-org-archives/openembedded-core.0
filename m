Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8A6C021AE
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 10:47:20 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.16647.1739875637109929923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 02:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gXkbQTLH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43964e79314so48622545e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 02:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739875635; x=1740480435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7fqVsp0+npXpHEWW6VAoAYQpfDG8wEUeUeG4PI6SX8=;
        b=gXkbQTLHPkIz5GuWazJluyMohjfVPftI712pQ8/Oqr/NIuf90avkyyMGeZrBQTeD2e
         SB5UKNNmAQd8cz8EDvrzphdlRN8Y12NNd5GIkz5qRUeOAtCoW4HC1ItMpo+wK/0Z7LMG
         3S/QAxm+Ils/Z81uMar0hVxPxxQVxryEw9fXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739875635; x=1740480435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7fqVsp0+npXpHEWW6VAoAYQpfDG8wEUeUeG4PI6SX8=;
        b=IDA4zOea3YCZuSX8nlqW/CyXAQX6XA0PNobBjadE+tNTyjf6XltX5axvzfTPwvDbu5
         fWCWC2+Qj2Hq6N9pohmt7//TeaSqwmTn7itO5oQ8CAhBNdsr8mKhHfDzLz6zcBYVMiSR
         1Vp0xgYiLsFTk8pEcVQGEGm8ofsLDiUclf2C+A6dMSnHZ4zfxV69uHNYG816EEVCaBm0
         rgNTlqScDKLRlkXrrXv1aQZPmtTIjz+2DIjEhA4INI82vG+mZQF7SumCqQ6uvvbTe0EZ
         D5BxKcrVtjKRLqvD7MPmmxX+oUk29DxABoDRoz+IxzJZcjQzmeD9O1G9Cz8UbaekeXBx
         Yflw==
X-Gm-Message-State: AOJu0YyaN8O9CKIXsmRYWe7hAI4hCcyRDq3eBtlA5p6ZdQejeRKjiHCm
	SmL3KE7B3tw6aiszIHR8t7etLjAWoPajuTO7gxitV80rcwsHU5Dx13Efp4c9wxK95qpaWCis9qX
	G
X-Gm-Gg: ASbGnctBdV5+ZtMd5C+oD0/OsmkD7rq1iog3fKMOMA+phr+X2xjT8yoPLpmCOuMBkad
	FYul8BbNAyYAqZJGlIYUVPIYzieZELbY3ExzNSPLjXKPvi0/lDxDBObdmGbFr7Nyzcd9cwGBSKR
	KgaUSTZYJUio//T2p1dKHk9GjxpzCoMnbI2RKYabm/jSN9wNT/cbtlko+U/eYtfseiQH2iTgG3U
	1aDnu3BQdTaLW0gcYVzCJ72NBFRgKQIMTivFR3ElzPY/a/Rhq8wP1P1NZoJaxwUuY12sMJrXPoK
	xiB3VHvFwqjzsX7xEAgC5n6X9hD/cEOB5EBBfHVx1Q==
X-Google-Smtp-Source: AGHT+IHp0c7L30iKlEnid92QTbSX2rBRtEdlXItNOxRWjiLoVIkFj88/ZajLz2BezNDA6VZQ0LiE4A==
X-Received: by 2002:a05:600c:1c9e:b0:439:88bb:d013 with SMTP id 5b1f17b1804b1-43988bbd395mr55709695e9.7.1739875635184;
        Tue, 18 Feb 2025 02:47:15 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a6c8:42:fd4f:69d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b432asm14364490f8f.6.2025.02.18.02.47.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 02:47:14 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] udev-extraconf: Switch from ifconfig to ip
Date: Tue, 18 Feb 2025 10:47:10 +0000
Message-ID: <20250218104712.1362661-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250218104712.1362661-1-richard.purdie@linuxfoundation.org>
References: <20250218104712.1362661-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 10:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211601

ifconfig is obsolete, drop the call and replace with ip instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/udev/udev-extraconf/network.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/network.sh b/meta/recipes-core/udev/udev-extraconf/network.sh
index ace38808cd5..500e60ae61c 100644
--- a/meta/recipes-core/udev/udev-extraconf/network.sh
+++ b/meta/recipes-core/udev/udev-extraconf/network.sh
@@ -11,7 +11,7 @@ export PATH
 if grep -q "iface \+$INTERFACE" /etc/network/interfaces; then
   case $ACTION in
     add)
-    	ifconfig | grep -q "^$INTERFACE" || ifup $INTERFACE
+    	ip addr show dev "$INTERFACE" up | grep -q "$INTERFACE" || ifup $INTERFACE
     	;;
     remove)
     	ifdown $INTERFACE

