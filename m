Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3584BC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 22:00:01 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.725.1657231189784519954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 14:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iy0Tr/Mq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id o15so11982778pjh.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 14:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p7gA1KMRNYU7ErM432O0JfKwXgp6eFlLFqm+lnZU2/s=;
        b=iy0Tr/MqfoNgElbSDiq1L5/ipGwNL38DW4xU+HCbSynTZQggou3eqD3xQf+zwbNppH
         xClXW0TYHZo364QNe6diQP10oL6znq1FM/OgVFTchEcwiGP9d7VkrbDGkpFaswk4r4LY
         5plmmM8afmhlgQX3v/DWIh2BsGR+L8wSBSgT6zLDKzdA6fk5ysHHT/qi0UnF+K2Fsy9U
         NlJd/RvwxTHS0nffoNwnl5xB/oeCqpw39eHZOFYlVQUG1MAAmzpVcx9fktQZbCIv2+Ul
         nWT/ZXephWup00sDGh5T8rxJSO6JdLj8lL77nDlS0/hR7u9ekDCLXgw2j+Hx0JVmFkOz
         uIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p7gA1KMRNYU7ErM432O0JfKwXgp6eFlLFqm+lnZU2/s=;
        b=tBkjrFRShgxRutk00Q/TVTHaOjZWasqkBGj7iLAvppiDR5ijRtN7bX9EnopRbFsi9j
         5nzhqD7St1SMHoMmsbhVbepHLeWh1ow5TNnizeMY92TTRgGVDeHQv9cqDkUx7SZxblYy
         xhZVS6OVOsMnFrrQKxihoTeMLM5aTmSMQe/ynTo9Op/4a6/8iGtIlmfBO9FRrYLJyPkU
         vmo0PAvkXWt3NSRIIZ47y/fiH7t3mAnfq6M8kOu5wtA6PMBJMJOGcFevAEe2bHXOjnMG
         SD+qlTrhjQHrzwuZG6L69iFWMa1QKO6s1iE909IcJiBmDoN+QObYR1Brgi0k/SuXS7c+
         +yXw==
X-Gm-Message-State: AJIora+k2nFON/QLYZzvAQJwD1Q2nDnMHEDrA+bTguH6gFI3KhtuOasf
	3tffQsclwB3hL6yj4Q4UR4M9RhPlaFfUjFgt
X-Google-Smtp-Source: 
 AGRyM1vALoKWAg6qnNjOCzUyi1j4IdTS6k7R1DSfAe0haAx2+ECUhoy6G8c3vidW5eM8XB/hJjc3Jw==
X-Received: by 2002:a17:902:f381:b0:16b:d6e0:bfeb with SMTP id
 f1-20020a170902f38100b0016bd6e0bfebmr179189ple.66.1657231195661;
        Thu, 07 Jul 2022 14:59:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.14.59.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:59:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/14] cve-check: hook cleanup to the
 BuildCompleted event, not CookerExit
Date: Thu,  7 Jul 2022 11:59:24 -1000
Message-Id: 
 <ee3270709158aff463fec6798f3b8968268b4d4b.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 22:00:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167800

From: Ross Burton <ross.burton@arm.com>

The cve-check class writes temporary files to preserve state across the
build, and cleans them up in a CookerExit handler.

However, in memory-resident builds the cooker won't exit in between
builds, so the state isn't cleared and the CVE report generation fails:

NOTE: Generating JSON CVE summary
ERROR: Error adding the same package twice

Easily solved by hooking to BuildCompleted, instead of CookerExit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fccdcfd301de281a427bfee48d8ff47fa07b7259)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index d0f6970db8..1688fe2dfe 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -164,7 +164,7 @@ python cve_check_cleanup () {
 }
 
 addhandler cve_check_cleanup
-cve_check_cleanup[eventmask] = "bb.cooker.CookerExit"
+cve_check_cleanup[eventmask] = "bb.event.BuildCompleted"
 
 python cve_check_write_rootfs_manifest () {
     """
-- 
2.25.1


