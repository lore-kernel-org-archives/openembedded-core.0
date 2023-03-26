Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6CCC761AF
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 13:03:03 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.9449.1679835777602900525
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 06:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cR8PM+Zt;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso9055099pjf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679835776;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjeVdpJLPiOKS0Q+jUs6Rsqpvqv5XSnbwt9Lzm2Vh9k=;
        b=cR8PM+ZtJgSlqPvmMgl6HufeL97JNVtb1xK7JPbtb0VvsKppwkQ9mFJQ4Hlsf/tHVM
         CqwBIMEyWyxiMWQgAe0Ofp61Kxm3pBrJqtKccXt9M/z5GMSFqsBWihXci+5fnIOZA/00
         tqizWg9AXqRLjbv2K5IibbNVR6P+1EquvEmG9B3e6CcTPqN9mSp+7zgrBxVCUiMcVsmc
         pLFoao0UyG73NGJXRx6fec9f7bwbcxZanBmcqs5g/SmhVuzhW2X8IXwD99eyV4JjbYUa
         MJ7NfdA7HDOVVvqkA4uORRa4C/rPS5jFJ8MX2tReZiN/vsxcF0r6/faLmY36vtfiJChN
         JfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679835776;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NjeVdpJLPiOKS0Q+jUs6Rsqpvqv5XSnbwt9Lzm2Vh9k=;
        b=Qv0tMNoNnsTIkQSaF+6RHlSFNnehkxG1QekzJxCtzVilwWQVHwcH1Qce6LabknY/9j
         ErQu2lDpLcTPL3qtCA6YyCFR8qAGI8Bq9fYVcj1zVscCC2tmWzweLf1qZEMvbcNR0LtI
         8KhISi11gBrOU/NNvAde5iFcdFnYuDsir7bp6f4oAswFE0JFQ7YKUsRShkrbEAWj0K+I
         0VBoIk4iJwus6k480YzQOi32j9qoQrqZp3PQIj5PA7h4oZuSGAjzDS2ml5DeJi1AXWHk
         Nk1Rw7JQ5JHjwhNlGzMT16SWXbsagACEZDUmYWiSEZVVGkjQyRoPEF2dgMgWdG1XOrzo
         Wl1g==
X-Gm-Message-State: AAQBX9eTOYFAwct8vBA+yTX3/vGfB/1+zJFNOZ5GjQZyPpXgGBXYQVLH
	wPWLy5yS8ZZHZ2qPiqooea7AJIBerH0/2lXevJI=
X-Google-Smtp-Source: AKy350Z+Y/rXQQNdL3EMLoithKm3XBEeMohoXZ23s0x7WrO7pIJlSvmR99vF8OGXHhcgzxL8SP6YJA==
X-Received: by 2002:a17:902:ea06:b0:1a2:7d:17ea with SMTP id s6-20020a170902ea0600b001a2007d17eamr10902886plg.56.1679835776425;
        Sun, 26 Mar 2023 06:02:56 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b0019cad2de86bsm17364379pli.156.2023.03.26.06.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 06:02:56 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 631DF9604A9; Sun, 26 Mar 2023 03:02:54 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 26 Mar 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 26 Mar 2023 03:02:54 -1000
Message-Id: <20230326130254.631DF9604A9@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 13:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179119

Branch: kirkstone

New this week: 1 CVEs
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *

Removed this week: 16 CVEs
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2023-0800 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0800 *
CVE-2023-0801 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0801 *
CVE-2023-0802 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0802 *
CVE-2023-0803 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0803 *
CVE-2023-0804 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0804 *
CVE-2023-1127 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1127 *
CVE-2023-1170 (CVSS3: 6.6 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1170 *
CVE-2023-1175 (CVSS3: 6.6 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1175 *
CVE-2023-1264 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1264 *
CVE-2023-1355 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1355 *
CVE-2023-24329 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24329 *
CVE-2023-25193 (CVSS3: 7.5 HIGH): harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25193 *
CVE-2023-26081 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26081 *
CVE-2023-27320 (CVSS3: 7.2 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27320 *
CVE-2023-27371 (CVSS3: 5.9 MEDIUM): libmicrohttpd:libmicrohttpd-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27371 *

Full list:  Found 32 unpatched CVEs
CVE-2005-1796 (CVSS3: N/A): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-1796 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-41722 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41722 *
CVE-2022-41723 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41723 *
CVE-2022-41724 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41724 *
CVE-2022-41725 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41725 *
CVE-2022-44617 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44617 *
CVE-2022-46285 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46285 *
CVE-2022-4645 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4645 *
CVE-2022-4883 (CVSS3: 8.8 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4883 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-22743 (CVSS3: 7.3 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22743 *
CVE-2023-22795 (CVSS3: 7.5 HIGH): ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22795 *
CVE-2023-23914 (CVSS3: 9.1 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23914 *
CVE-2023-23915 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23915 *
CVE-2023-23916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23916 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

