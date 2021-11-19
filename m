Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BF7C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:34:59 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.7635.1637321698022255256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kvw0jHJ0;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id v1so8063163edx.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fwT3/TNMNT5syff5olxi0JDnqIHc3mXZiSoNUeojmcA=;
        b=kvw0jHJ0Rrh/JATRdJeSlubw8bJXG4j0/2tDJlxq1SyeksbxftTQ/zF7A9yeoovYdl
         ChXdRdZD/hfJaYNc5yJbSXyap0wcDNTqne4mVGKzgYqlLtlieMhvW0ziVs5Zzv0dzkfp
         i93z4khi9foAMvo1YKV2Z0LVA1MvrVHGmnn/Ixs4D9RNOP6c1n+jEmH4CvnU2g3zWxwn
         PxcyG5v3HRDTjQHex4kbWy/7Fh1tC0snoFU6TSBVhiQ9UGBOp5Y/PNua1T5dNFBDsuLN
         pbAdHRDn3QY5L83u8Gt7KIkfdRnXONpW+jKp8TcQ51CLEToKdBRcK5pVR8J3ZejUFTWE
         8PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fwT3/TNMNT5syff5olxi0JDnqIHc3mXZiSoNUeojmcA=;
        b=4L2QJMTNEyqoXm8Vr4o7c5aDbS5oq7IwFEqT9N2ip2hqckoEQy8P+TTa02zOCARp71
         1DxB0RJqh3yAVrNB8YeoNP9S57GrlJEdIHtuItzmv+GV8/9TR2NRwFjT4YJJ6EW7aP1T
         GNMYcyD8iweEZNuk/RiKyUFAyItgYpKLjFTIMLEAxfceA51rnGIDZYTXEK3l2lJ8+7HK
         klIDQofwB8nTHJ8HjoGqu+/+RCMs+G6SkuofOCYM9cmT20Cgv9QmkQURKSmZz5khk8LK
         M7MEODHlVCd8j3sqV6VT9IILDblwLtoeKg8gp9gorJ4GNyhsTlY6JAi/F39SNQ2f5lSD
         LIZw==
X-Gm-Message-State: AOAM531Rt27QW3UhmJyq8wb37V93I2LcuZ1eC8DpBXaiEJ91DFCTRmH0
	BQhhIHo1IyIq0hlyDInXipr0mi7FEciOpA==
X-Google-Smtp-Source: 
 ABdhPJwq85JdMFcvOvZBjxJhH2G4Dx1ouqx4QnKNQt0uRxOpASw53oWm6jJemp/09Mx5Uf3m+BGxbQ==
X-Received: by 2002:a05:6402:d09:: with SMTP id
 eb9mr23286966edb.216.1637321696243;
        Fri, 19 Nov 2021 03:34:56 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 he17sm1058176ejc.110.2021.11.19.03.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 03:34:55 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH v2 6/7] os-release: add nativesdk
Date: Fri, 19 Nov 2021 11:34:28 +0000
Message-Id: <20211119113429.502652-6-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119113429.502652-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <20211119113429.502652-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:34:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158512

From: Luca Boccassi <luca.boccassi@microsoft.com>

Required to build systemd tools

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/os-release/os-release.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 8847fe30c3..2f2aa66c46 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -51,3 +51,5 @@ do_install () {
 }
 
 FILES:${PN} += "${nonarch_libdir}/os-release"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.30.2


