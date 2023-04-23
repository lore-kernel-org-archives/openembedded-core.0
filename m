Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B23FC77B60
	for <webhook@archiver.kernel.org>; Sun, 23 Apr 2023 13:03:45 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.26637.1682255023529539197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Apr 2023 06:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=CUYLB3NF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1a6817adde4so40545595ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Apr 2023 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682255022; x=1684847022;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgzS0JbnfIk8ZWdgICrySIPH5HSYoxMv3B63Mauz6ks=;
        b=CUYLB3NFPqopBeZ2ZdXqe95rnAIWivJF5v5KGQVZplA9NcqttpL1RdSEXFp6Asqcm3
         dthYhnMD3WyGdsC0CgoaadbmCDu/yBkAk4b0+ICrNZeEYOQqYouAdK1s+Vlb1++Hja/X
         4hOSgyfdGybN01At85DLxb7dQJYHxz6cWdO/pUgakQJmVPItmO4y3ODBf+uaRfoXVxaR
         bmENkUdMX6hg0H9D737X65f1RMe2hbTAelcGpdUcVlcfiQhpt/UnjnW8xHDt3ZVSWU+M
         9TZ2FJ5mgGRz5dYGKnnMRnNYMi/7RnZXW3iGzPCrdpIWs0eoBV/pgqemIpNwjMlGEERG
         Lc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682255022; x=1684847022;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AgzS0JbnfIk8ZWdgICrySIPH5HSYoxMv3B63Mauz6ks=;
        b=W7t8qHZii6iLJlaGhZR5MuVTyakEgnXUQGBMVl64WzIbzb9UUlq7NIOe+LcinSTwy6
         fkNynxKCboNNpKAXmgZsuKuMychNO1QA0U4v0R1F5GuR28d63298Y4th0SQtAsXhzB8S
         UoAq1nq9bMWXD160Tbk3Y47vwgcBbec6IUI9Ct1VtLuBYm9fsB7PIa46sEpr5PFgwKZX
         GAuId+dhpxJre3jjWin7Amx7pO59DhMqy+C5qX4b0/sn0syvCOnwK+d3zYnZygNOECdB
         EL0hu4HjaEvFq2zOEUMxXpmvh+UgXyDfbM+poQAiiUYqCuA+/cKGdWd82HhLYg5F3pnP
         PF/w==
X-Gm-Message-State: AAQBX9dGA5rZTqs4z93obS8Uh+zpjo86hPWKBlX/SMMvd7g0ltC3josv
	bZJ2+vSvNt1BF7xcsRSikW5NTPO91IdwKe6PIPI=
X-Google-Smtp-Source: AKy350YfDBj07gfLzurnVJz83QbI9aj76kpO6D/M5Mv+28bVEf1E5Lrm1Cs/t2gMicm1YKj6mxYk8g==
X-Received: by 2002:a17:902:d4cc:b0:1a6:b971:faf8 with SMTP id o12-20020a170902d4cc00b001a6b971faf8mr13696400plg.53.1682255022550;
        Sun, 23 Apr 2023 06:03:42 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jk24-20020a170903331800b00194c90ca320sm5102787plb.204.2023.04.23.06.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 06:03:42 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 456D796044D; Sun, 23 Apr 2023 03:03:39 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 23 Apr 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 23 Apr 2023 03:03:39 -1000
Message-Id: <20230423130339.456D796044D@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Apr 2023 13:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180333

Branch: kirkstone

New this week: 7 CVEs
CVE-2023-1393 (CVSS3: 7.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1393 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-24534 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24534 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-24538 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24538 *
CVE-2023-28488 (CVSS3: 6.5 MEDIUM): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28488 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *

Removed this week: 5 CVEs
CVE-2022-41724 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41724 *
CVE-2022-41725 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41725 *
CVE-2022-4645 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4645 *
CVE-2023-27533 (CVSS3: 8.8 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27533 *
CVE-2023-27534 (CVSS3: 8.8 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27534 *

Full list:  Found 36 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41722 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41722 *
CVE-2022-44370 (CVSS3: 7.8 HIGH): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44370 *
CVE-2022-44617 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44617 *
CVE-2022-46285 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46285 *
CVE-2022-4883 (CVSS3: 8.8 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4883 *
CVE-2023-0664 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0664 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-1393 (CVSS3: 7.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1393 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24534 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24534 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-24537 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24537 *
CVE-2023-24538 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24538 *
CVE-2023-24626 (CVSS3: 6.5 MEDIUM): screen https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24626 *
CVE-2023-27535 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27535 *
CVE-2023-27536 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27536 *
CVE-2023-27538 (CVSS3: 5.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27538 *
CVE-2023-28488 (CVSS3: 6.5 MEDIUM): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28488 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *
CVE-2023-28879 (CVSS3: 9.8 CRITICAL): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28879 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

