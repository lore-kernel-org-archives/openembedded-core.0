Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE85FC001DF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 13:18:30 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.73250.1690723109579349850
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 06:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=GS5LrKLW;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.42, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-63d1238c300so17570436d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690723108; x=1691327908;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v41TjdILPmsnVh+ANY1d6HX6uQrFdUvmAI5RwHOlsZg=;
        b=GS5LrKLW+ExcBLt+TsTZuHi+SZEFg9SpUX7BUdT3TKjhk9ssA7gbZWtWSI2AXLCuY3
         wHJ5fut9/8B9lTAe8MNutbIaavgIKTCBeSVShRVPkdi8/ltW+0osoj8YLgxyII6PD7W0
         jHf8Tai82VlhaSHuQajQ6xWgiUm06S+ZL8M8XEpM8H598PRm3Nb5wisbyd+xSui9eES9
         XQyWOcf+0hOlnFMICspilj49SgSS/HY6gh+lNlK/ENR3667/3JOl4bJxhxrOi0nTewiH
         UzbFG7KDfbcTGtRboG0WOs89CgYnYJCCD/Bgg9EUYY4MWK0oaIfKPmzo3xMbVwTDXqBy
         GwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690723108; x=1691327908;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v41TjdILPmsnVh+ANY1d6HX6uQrFdUvmAI5RwHOlsZg=;
        b=EFmrsQQtC11jOwamzEwZilWUER0P8nBk8SlCkpRqzulTpHyXa94QAWlqnSA8HseAX2
         2wY4bfqjOfVur6I8eMLWaw32AbI+9u4l/AjqLz3Rwe1MwpYBid4bO495X+HtjIbpeqQh
         5d968titDpgb1L+ZzNvUIYqmibDjZAe8cPHKDNQulSaXefIDjV/wj5uIskzWKz1XDcYN
         gDN5CYmrtlkd3ANJ0XY8OL6bIHvgpI5FKCfOrojQbMQ8gVghE3GQXGU3CAGsyKTtyuWz
         y0bSzQo10LWj2d47/c/Lrouql9T31QrCB2LC5A2/PeFZ/4v+p0JfCocD9XyGMn6mueqf
         6lmA==
X-Gm-Message-State: ABy/qLaeLCvug5pk9HQDac4abqCMtK/9aN/Ml3LIObYL95eMb3kU2WhT
	VNz7lRGagwgGxNr3zVsoUFE6nFbYApZhHj76Grnzzw==
X-Google-Smtp-Source: APBJJlE9Qpv+slo4zAiD2rMYF4qLzOadGlEuzW65stzJDoWZc7txCzqUGdZYa/DaTxX/FOcdteiZ/g==
X-Received: by 2002:a0c:8dc9:0:b0:63d:1d8:fa3 with SMTP id u9-20020a0c8dc9000000b0063d01d80fa3mr465947qvb.36.1690723108275;
        Sun, 30 Jul 2023 06:18:28 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id g2-20020a0ce4c2000000b006301d31e315sm2864582qvm.10.2023.07.30.06.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 06:18:27 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 934F710702B; Sun, 30 Jul 2023 03:18:26 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 30 Jul 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 30 Jul 2023 03:18:26 -1000
Message-Id: <20230730131826.934F710702B@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 13:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185071

Branch: kirkstone

New this week: 6 CVEs
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3563 *
CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3637 *
CVE-2022-41409 (CVSS3: 7.5 HIGH): libpcre2:libpcre2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41409 *
CVE-2023-2975 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2975 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *

Removed this week: 1 CVEs
CVE-2023-36664 (CVSS3: 7.8 HIGH): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36664 *

Full list:  Found 40 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3563 *
CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3637 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3964 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3964 *
CVE-2022-3965 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3965 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-41409 (CVSS3: 7.5 HIGH): libpcre2:libpcre2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41409 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-26965 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26965 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-2829 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2829 *
CVE-2023-2908 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2908 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-29406 (CVSS3: 6.5 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29406 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-2975 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2975 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *
CVE-2023-3316 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3316 *
CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3354 *
CVE-2023-3618 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3618 *
CVE-2023-36632 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36632 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

