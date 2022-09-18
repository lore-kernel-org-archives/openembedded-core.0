Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ADCC32771
	for <webhook@archiver.kernel.org>; Sun, 18 Sep 2022 15:02:51 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.9617.1663513369059618107
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 08:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NtAtz0tx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id r23so16057837pgr.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 08:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date;
        bh=jnP7KK1prauYJWdcTCAt6M0Cr363yvM3YwPEr0c5cQQ=;
        b=NtAtz0txDu2Q3d+WbJNvBzwnYV9CKsQrrRyVw2pnQeEno8U4hCSq2lSTnCS4u6+GST
         1k2Rncf899npfSOChk/d+sNWSFqO894Jk4bAwGtggJw1zcNo/nkISS0u6LaBgFdfqLhU
         s0w9xk2mX6+HbOrtFGJ5lUdT2osMiNBCLNywpEBUsoGKk8oocsY+lo28BfZ6aVIuZfkC
         epCak0f5UhBqQkr5OuD+znpfQA603JNNSbC1J3CW/swNn0gudt6BB5hCRs/bI3h1o1kR
         qtzUNdWKrC8FDSsyW8YZy+K/GXQwd8kN4mumdYT6A5rY0ZM1LxsV2olg8d4QVbVnZWHJ
         G0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jnP7KK1prauYJWdcTCAt6M0Cr363yvM3YwPEr0c5cQQ=;
        b=HBcTNbIsIu5ktc+dnz17cmJjE8nujEusLDPdSFCXehVYbWugAiAUY47oTNrRsfxrut
         /q7xx/fvOabL+z/8YSzWgFvmXS7ILN24XywA7XNyQ954v2UhLn6u+bng3XnNNYuwKdfp
         aB0MfNNnr3oStqW7H9wXanz29KG0W0bnz0NneG4sppIi6rqYtrLzMHZDcfczzQRjBRXe
         quAtuTi34KKyERfOy9okl7uoQg410/IdI0j0yHhPw3MlpONCV1K1/D/9cFfPAQ1HqYNf
         5aG/503WCrOJUtSQ6kqSNuetm1sygPXey2f1dmb6Tjzbo2JiF8FQ039h9KqSr7nE5jt/
         7OtQ==
X-Gm-Message-State: ACrzQf16sOQEcXX9wz5nifYmv5Xn9tCeGb7QbibPNdv5FHgEEofnXMqc
	McV8sBfC+AL6UgYw/RO/4Oe3l0/5oYeP+1Yv
X-Google-Smtp-Source: 
 AMsMyM7zo6HWIDOgm4EfQm5Dbc8CQ9lUIkWVq+q72sMiO3Uz+JCaSQoA/+Q19EIiaFASnzEfibc4yw==
X-Received: by 2002:a05:6a00:1691:b0:53b:3f2c:3257 with SMTP id
 k17-20020a056a00169100b0053b3f2c3257mr14446460pfc.21.1663513367795;
        Sun, 18 Sep 2022 08:02:47 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i22-20020a17090a059600b002005fcd2cb4sm4907235pji.2.2022.09.18.08.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 08:02:47 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 662D5962353; Sun, 18 Sep 2022 05:02:45 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 18 Sep 2022 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220918150245.662D5962353@nuc.router0800d9.com>
Date: Sun, 18 Sep 2022 05:02:45 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Sep 2022 15:02:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170850

Branch: kirkstone

New this week: 1 CVEs
CVE-2022-40674 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40674 *

Removed this week: 9 CVEs
CVE-2022-2946 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2946 *
CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2980 *
CVE-2022-2982 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2982 *
CVE-2022-3016 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3016 *
CVE-2022-3037 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3037 *
CVE-2022-3099 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3099 *
CVE-2022-3134 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3134 *
CVE-2022-35737 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35737 *
CVE-2022-38533 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38533 *

Full list:  Found 16 unpatched CVEs
CVE-2018-25032 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2020-35538 (CVSS3: 5.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35538 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-27664 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27664 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-39028 (CVSS3: 7.5 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39028 *
CVE-2022-40674 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40674 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

