Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE029C28B25
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 13:58:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.11555.1741355934981225305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 05:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=b99sQY0k;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22423adf751so24123235ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 05:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741355934; x=1741960734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zudmKu0O/1jApobdAOuA7+TnUZuFTt5A5V+SbucWJFk=;
        b=b99sQY0kFuEHJbAYwS+LSnK0qtU50tH6WnQK1MllXReIZ2N/nCOaiLA6qzj8pz9/mT
         jZPcyfSV2Dd2ZoJ9kNf+i3WpwnGELKhLjFJqM86NR8ZxZvaeELjBe4C1Hm6aiSJi1gv3
         UopwxSY57d59ZJR0SnFNCRP2mB3WqDl5elUF64qfHhLJOPIKghFQUlzNdp56H0XTliRR
         0kcv9JnLjv7PNz7IZ0+nacE1fLSp5uKW8ZPkzmfkOyM5alITA/a7F3oyKfCpRZmzqzFj
         cf3f9HFloUQKe+WTHU/dGn9LGUsoBRZQb3YaYaMg3tPyaWbOH6enRmRj2a7S/PbyvZwd
         V+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741355934; x=1741960734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zudmKu0O/1jApobdAOuA7+TnUZuFTt5A5V+SbucWJFk=;
        b=pUQDheKS3AIROqfXfRa9U83ael+r6B73VkdZolio/8WU4rSLs6J5yLohoVYO66pfHO
         3q5GJ5fzMbwI469Q5L+prz7cpBOQxItqjx5n9k9kY4I2L9Hcq1H7RbWZW0s36RuNtwfS
         mKS4yVrtx8lrV7Y2vRScStEtDTM0WxNtQPvmxhcw9ERGftaYEC++p11lCcfhhrpIfywA
         kebFKhZpc7BXEjhqzrKxzw/e2vZ02ZQR4V3QiY0omY+5V+P8vhcjsBQ8nTnuD7LqEX6w
         rxHM8AqXW46RhiWRH7bsS4FzDnU2O3jcwpkL3mu7kE2Zido2kAqjkBQ9nzGjE2pXHl7O
         3wXA==
X-Gm-Message-State: AOJu0Yx6XDNNsHaK1v7VOrRV5EioI6SIek382hyZIab1/ly7thyFSags
	jH5EwqVG1J6CV7Ak5P4QalMRc2Oy/ZdQLuQWGU8oM/tYGghnmDYD7mdfeY1BPTPRmS9pJ0+jhF+
	s
X-Gm-Gg: ASbGncs1weh/X1+CDKqcRbg+gNPf4huYB8V4c9VAFLeCQk6eqgdsK4aE6GW6AsiDow0
	ToFr2mvYNPFxdrvY7Rcd/N+nFGnsUoCrXG6eJskCM4dVpoXo5W7Rhnyzq2RjvbmXX8FWpS6mpEN
	5jWIZDVK5VUGVTQj291GQHq8BcATr2kTkp0Pu9D2/tI9epuuuUuL1AdFZCUPHtY6JA4+kIS8pGv
	QDrexK2y919VJHTRZeG6aAP+gpDSxexckSkbvr3XpGWkwTHqZ5bCH8UACXVULWoArgOfp75guwc
	FIsXI7gaOProgQi7i4QS4M7fu7ZC2uZO/Czj
X-Google-Smtp-Source: AGHT+IHNLdFpUzBg9ZVW9yQ8l6LOMaJPyIfgy7rZoRJJNk4CWXZp3+BjRq8y0vfvlJtiyKBnkMmy0g==
X-Received: by 2002:a05:6a00:2e17:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-736aa9f73d5mr5328856b3a.11.1741355934133;
        Fri, 07 Mar 2025 05:58:54 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:cfcd:40b4:f918:b895])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7369844cfeesm3230656b3a.77.2025.03.07.05.58.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:58:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 3/4] tzdata/tzcode-native: upgrade 2024b -> 2025a
Date: Fri,  7 Mar 2025 05:58:39 -0800
Message-ID: <a752a41ce11f3796861b303d28a39a40bd9b059b.1741355808.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741355808.git.steve@sakoman.com>
References: <cover.1741355808.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 13:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212441

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a15c4e6793c55c8084a61298ef3695e1db2f60cd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index adf095280f..f1dbd7ba81 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024b"
+PV = "2025a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
-SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
+SRC_URI[tzcode.sha256sum] = "119679d59f76481eb5e03d3d2a47d7870d592f3999549af189dbd31f2ebf5061"
+SRC_URI[tzdata.sha256sum] = "4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0"
-- 
2.43.0


