Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E574E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 13:03:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.18878.1736341406096488660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 05:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UuS/sHkz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e0e224cbso8372665f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 05:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736341404; x=1736946204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g02P5Wq8xhDhbh7eQa/wKNsCJHQF1R8XQiA/FKMX9QI=;
        b=UuS/sHkzVe8TOaeKAyoAK4sKPc+9gM0VinFxCYbWagJ9OHcu16nPgZNF6RkAtDEk8U
         NIGjXRx9WLwImVQ4AHkmumw8FzwaarxOWamrXUyvNUsyfTceWTNQGgbd/ytJz1zF54nY
         YoWXcaOku2tKcNUr3T4YDuSi8xiv6KB+USLrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736341404; x=1736946204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g02P5Wq8xhDhbh7eQa/wKNsCJHQF1R8XQiA/FKMX9QI=;
        b=W8JKk0TXdFRioGxTGGEpV8BHKsPNuraHKnHhayVjwRnepDXZvI1N1ntyeyUUPBIM/B
         powxOjq1Wd5WQRi+6xQpHCGzYoYovGhlV7nOaIgnl62uH0AdKgg2J2yXaj349uu9NFkv
         KR8anG0vOCrE5UhfGC/Q5ljBEG4cVp1bBPFjlb33o6MVQQZTmlBiM+4Hbtqv+tSNuSHz
         E3GN36iYwRvvDJk6vcFGh592PR2cagX/QM0Q4BJyx0Ax/TCuTLz2duFAOYEyo/cuEqR3
         1br8VbCH2O80wZyBIcLWQRIxoYLwSWay2oqEniQKNBW8UG492S0dodiezm5X+CWtbXGd
         PIRQ==
X-Gm-Message-State: AOJu0Ywb/y+VjuDZdSFbkBu+0lW9n75b5b0/uUU+tyMJLAD3thtaBCOd
	cfq+rMWi9I5ERVpHDgQn0f2iB9t8p2OzrveLXr0MvRi3hJMpiU/C2rSZWMSoUMiaoRjF9Nk8Na2
	NOdc=
X-Gm-Gg: ASbGnctRZvANg41Xfw2XiQ5ZPPvDmYskqSSMCwtPpK3BrTWKOiqOzSqVtMwNSEtTuJb
	cVQoQwAUNqHBUk9ZvktE4cGU3s7XHCzswJJZwstnKmBSKM11UNiU/ERICXOgqqSvYOZuGSIMqZ1
	P4FAJwtXFkbZb3ljGS80d9XFqzHewmB+B2QPQVbn9afeu5pVmspgxGSAKyRCMua9BkZuQYc+hAU
	3rmbiZWVPAY/OVxRWRZhztMamCFUe7K5XhEl+ksOURhkWMz/6yUHtxqlDRP/tr+kKpSIHUXs8TP
	PqA4MyYX7g==
X-Google-Smtp-Source: AGHT+IHS5TTFd1RdJI2uApHswxjEmYstBOhZ8TJplmEsJzJ/ni+UKpWwL22IeyoiyGR6mU7T/cECjA==
X-Received: by 2002:a05:6000:1448:b0:385:decf:52bc with SMTP id ffacd0b85a97d-38a872ea782mr1924983f8f.32.1736341403776;
        Wed, 08 Jan 2025 05:03:23 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:906a:f5af:b180:de5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm52189044f8f.92.2025.01.08.05.03.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:03:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] conf/distro/defaultsetup: Use include_all for maintainers.inc
Date: Wed,  8 Jan 2025 13:03:22 +0000
Message-ID: <20250108130322.3589522-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209558

Being able to set maintainers is really a "per layer" configuraiton item. Use
include_all so that such maintainer information would be added for all configured
layers, if the layer chooses to have such information in a
conf/distro/include/maintainers.inc file in a given layer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/defaultsetup.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index e6369dcec4b..80de23f517a 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -1,7 +1,7 @@
 include conf/distro/include/default-providers.inc
 include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
-include conf/distro/include/maintainers.inc
+include_all conf/distro/include/maintainers.inc
 include conf/distro/include/time64.inc
 require conf/distro/include/tcmode-${TCMODE}.inc
 require conf/distro/include/tclibc-${TCLIBC}.inc

