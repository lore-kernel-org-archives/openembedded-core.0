Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AEDC433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 14:03:55 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.15308.1646575434492458517
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 06:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WtyfDkVS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so14398455pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 06:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=KAgzQpJSqfAAvBovKgn/0kwwVTIQHMW1WS7CkFGouGk=;
        b=WtyfDkVSnyscMISKNh3t/j66Efe2YD3W07AUtRbyb7iwM3cTFBYOEXqvkByDmMxej1
         prdGH4UdZXAxU3J4B059M+S2JZIacRjjqIol+EpEKLXYjGxw4P4Z/qKSTZTt3IdGU57R
         BbRrFTzNDS4Dn4y2Fve7TB9wOGYyt7cQ6CQm9cW5mFmbFVwu0wnU/DaN5JstXRDK6ML6
         vxFwDk/bQU+llE4FoY7YRtrNexpJ0f8poC+6t+yOJRfJQk4f+Ia6jsJUzwv59B6gO/kP
         SnCj+NF4navqGFu2/XQzi9q6j29uK/jTJHXvtRw7hGPocOofOFoe6UbTOuSAmYNfgDdQ
         F53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=KAgzQpJSqfAAvBovKgn/0kwwVTIQHMW1WS7CkFGouGk=;
        b=Mpq8Hns4HIGL7+vN6IdtYTnn9NAuUmSTiUrDKT/3mikovrJVrEG2eSZmybCpGTmbnc
         a1z032Vwzps2r4LloBymrVZGGp6RRFaehE7JNFA9rzl5S3xx86f0qWZg8HBLFlEk8/ZU
         ELx/f4oVMqksG40e3cvZ3g5F3i24dsHpMUR2QDL/cW1r4UuxxmihKETE4nu40qptuKoq
         XvqcmaHLEwctpGeE1VqxZepwBOely3Hc179jOa23PU86laGSU/3MMU3MMB7eOz/BtyKm
         D9W2Rl9aoZm6DIkQVtkWKP6sBjRziLHdw4rRDm6zVXmqo9Dd3ZkzSBWY/QXomyI19XE/
         +3xA==
X-Gm-Message-State: AOAM531IlKaFT6Q8B2tkPavt6r3nzm25d/ZmLbKnPVgf5VuD0GILzHj3
	haZOlPoYnkj7Ct6PXiEaLA6ED26dFnDI5ccLPp8=
X-Google-Smtp-Source: 
 ABdhPJy4EC6tGAFlyvsedV63mb1v0muJL/Xcv8HTdlckccJeGZ8xJFgHY7GST0J16EaF2CT/FVziYQ==
X-Received: by 2002:a17:903:41c8:b0:151:bf44:ba9d with SMTP id
 u8-20020a17090341c800b00151bf44ba9dmr7683078ple.160.1646575433449;
        Sun, 06 Mar 2022 06:03:53 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 f18-20020a056a001ad200b004bf321765dfsm12679999pfv.95.2022.03.06.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 06:03:52 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 1F9EB961F2E; Sun,  6 Mar 2022 04:03:49 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 06 Mar 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220306140349.1F9EB961F2E@nuc.router0800d9.com>
Date: Sun,  6 Mar 2022 04:03:49 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Mar 2022 14:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162785

Branch: master

New this week: 13 CVEs
CVE-2021-3930: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3930 *
CVE-2021-3947: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-44568: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44568 *
CVE-2021-44571: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44571 *
CVE-2021-44573: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44573 *
CVE-2021-44574: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44574 *
CVE-2021-44575: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44575 *
CVE-2021-44576: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44576 *
CVE-2021-44577: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44577 *
CVE-2022-0696: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0696 *
CVE-2022-0714: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0714 *
CVE-2022-0729: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0729 *
CVE-2022-25643: seatd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25643 *

Removed this week: 0 CVEs

Full list:  Found 20 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3930: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3930 *
CVE-2021-3947: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-44568: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44568 *
CVE-2021-44571: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44571 *
CVE-2021-44573: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44573 *
CVE-2021-44574: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44574 *
CVE-2021-44575: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44575 *
CVE-2021-44576: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44576 *
CVE-2021-44577: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44577 *
CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0696: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0696 *
CVE-2022-0714: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0714 *
CVE-2022-0729: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0729 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-25643: seatd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25643 *

