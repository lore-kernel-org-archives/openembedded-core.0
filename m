Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C61C433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 17:22:08 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.40149.1638724927165959976
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 09:22:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=piIe9D7/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id o4so7935037pfp.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 09:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RrDqPF7dk0YPOV3L/YC5t4VE5k8J84HHH3N/4Hbjub8=;
        b=piIe9D7/ynIW3qhuL8s6jBI7cbzfEkQ6x8m/QKDCzJehdEm5BMMHLzFU1QwDm9eD85
         gXzcCer/Wl8b5ISmok9E6gEtmixJdBsFt51JsBRREinfc2dn68KIDcqcRwSgzECgu3BL
         sgsm4IUllMUrPvxu+BNqIMHu7HIGGnRAqkLdhdEZGhTbqRuySWg1Y5Im5IOj0O6PVQm3
         3PZDY08qgPRwvB57yLFYw6KCssllMvugBOF1nzsLBh9nfIqTvrZYXDwcfyYxaar/JH7s
         DZa55vw99QshVCAwtylfNeHFgafG12GKmMY6LnnnQEQY2oOj5xcUDGcKGSeapEByFW8P
         iQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RrDqPF7dk0YPOV3L/YC5t4VE5k8J84HHH3N/4Hbjub8=;
        b=FezEjHe9MmPqs4ncrsYLDhqrKei4xpgIVopyq7fEAbEkSrHxTRWXXdZpRIqMUWVnVp
         3fYZIWQvt7F25DeyDu95O/quu7B3Dz0Lms5RVIvcM7rEm4g603HNKxIS+pvAepVKOHeE
         X016rOYXes0MucXqKQnPFiR68I6BeojH9zQyaZ+4YbdI4JexOtLlUGDOG4B9LbF3tl24
         EhkgLvlCunHRkuXhrxm/282eWWb9vA62ZxN2KXR5RGT7yowWSTTrH01w75xJSe5TXB8P
         2BBieVvCdkjETw6NthMPcKXjuUcGMgfeajngWjoOLUannu6bz/qapFMqyM7RM1GiNWL/
         PvDA==
X-Gm-Message-State: AOAM530HURuts3Qjk5CDfEwe9LdHLAq4zHq0U0DrZgNl1z8ktKPkKg5r
	uSDXQK24snqWmWx5Qzc1KQD/QWgODYIr1NdPvds=
X-Google-Smtp-Source: 
 ABdhPJy6bP1EAuxwUyGqFhj+dvAb19MXSbPSepBDkcm7XPGHNvkZZYsg80Dy1LywYBc/RzgA08SzGg==
X-Received: by 2002:aa7:8b18:0:b0:4a7:ef66:3b6d with SMTP id
 f24-20020aa78b18000000b004a7ef663b6dmr31514484pfd.13.1638724925749;
        Sun, 05 Dec 2021 09:22:05 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 j16sm7532466pga.32.2021.12.05.09.22.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 09:22:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][dunfell][hardknott][honister] cve-extra-exclusions:
 add db CVEs to exclusion list
Date: Sun,  5 Dec 2021 07:21:47 -1000
Message-Id: <20211205172147.21371-1-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 17:22:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159197

Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index a6f52b5de7..e02a4d1fde 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -44,7 +44,14 @@ CVE_CHECK_WHITELIST += "CVE-2010-4756"
 # exposing this interface in an exploitable way
 CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
 
-
+# db
+# Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
+# supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.
+CVE_CHECK_WHITELIST += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 \
+CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 \
+CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
+CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
+CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
 
 #### CPE update pending ####
 
-- 
2.25.1


