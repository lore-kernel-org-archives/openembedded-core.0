Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABFCC54EF1
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:21 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9368.1672830362190792853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bLsRE8z4;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id d17so12823981wrs.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKJESiaZp4w65Vh/DatBAGD7N0+vJEC9UsDUG3ZUDJo=;
        b=bLsRE8z4jF6CvXMZOeg53V0GxqEtJU9wazI4BBawjlZazmwxN+tqCDuqK/T5leaZbh
         lcNF5LwA58FgGsAvg4+L668pezVOAJJqeT2Z/Q6J1dPZuNdvpZ0mjv9wskO3pOetX/NJ
         0UgX07NNwSbwZMQvM+kinjJKfN4oe/qGHDR3KgdsHoa7EhIZv5HgaA/CQ7EaLr2PTuVI
         gfhPk8WGFwwett1ec09jH9274EKwDyUMzxCoLLfujyTqeCiBxfgW3Om7uAG1ZN6t1JYK
         FuEhVSMtPrW+1KHSJuawXhqnLvK+G8DR24iwQxLF8Ea8t/PEBmhu9KwAP7X2pHqpaL+A
         FHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKJESiaZp4w65Vh/DatBAGD7N0+vJEC9UsDUG3ZUDJo=;
        b=AizuLWtQvRaY2Mh31EPyZH7KUCzStGSiVs9IdIe5Em4kSyzGgkkhX4SVDhDbMwlVRG
         v2sD7/g+uoY2MDQPwcmaBiPzKSFCbUPtN69bfljtnSEkp3uA+uqNByrSZIMK3swhdBxq
         l3W6kuWjSIYJsBMnUChwildJN19+iB2MksYfPwpgCTLhuMYUVz4rXt9/ZfvBkG9l6ARg
         cMXzK6ChuJC1POUW8Ap9VlLCpAeXu2xjvxZ+oBqLIt5ftjXM1p80gUVk5j4AUrXWjPc8
         YGXN6Br0JDJvEJfKXXnZRtWR1x2LFU44mOPBQ2YjL1Dwf97S6G61c623vZkF6k4cdu47
         c7PQ==
X-Gm-Message-State: AFqh2kpNnavg7aVlrDVeIymgRM1kNxjNiN01KyD6oy8QPvr+kRhu+1Z6
	eb9SEYqbHrE0o8miJR5EejHOwHoawCY=
X-Google-Smtp-Source: AMrXdXvLGpe49yAglx9LTDpXEVSJG/I++lhgQgUlcOz+GmVDhfEw1IWOJUlWqMh1bTV4kp+KE7+FhQ==
X-Received: by 2002:a5d:5649:0:b0:276:ef1:db9c with SMTP id j9-20020a5d5649000000b002760ef1db9cmr22640131wrw.30.1672830378073;
        Wed, 04 Jan 2023 03:06:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/77] logrotate: upgrade 3.20.1 -> 3.21.0
Date: Wed,  4 Jan 2023 12:05:04 +0100
Message-Id: <20230104110548.2537259-33-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175418

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../logrotate/{logrotate_3.20.1.bb => logrotate_3.21.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.20.1.bb => logrotate_3.21.0.bb} (97%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.20.1.bb b/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
similarity index 97%
rename from meta/recipes-extended/logrotate/logrotate_3.20.1.bb
rename to meta/recipes-extended/logrotate/logrotate_3.21.0.bb
index 034c37b429..4e4ea10628 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "742f6d6e18eceffa49a4bacd933686d3e42931cfccfb694d7f6369b704e5d094"
+SRC_URI[sha256sum] = "8fa12015e3b8415c121fc9c0ca53aa872f7b0702f543afda7e32b6c4900f6516"
 
 # These CVEs are debian, gentoo or SUSE specific on the way logrotate was installed/used
 CVE_CHECK_IGNORE += "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
-- 
2.30.2


