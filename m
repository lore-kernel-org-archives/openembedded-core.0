Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABEAC3DA7D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 13:02:24 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.10431.1672578141112654792
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 05:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=YqKiisVw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id c9so12298152pfj.5
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 05:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owOfd63svCKffwZH1SyoB/UVydKo2mIAWnzt4spjDCc=;
        b=YqKiisVwOPaLyA0izk71J+58Ew5P080kWIOjPddAvVJOs/l1C98FJ5OL6Nl1q174Ys
         OLDjD9paZ2TbavKGe++he56u7JfRArj1umU81p98c4OZFBrFfOdCrxnvQ4tPcCYxJfr1
         /hfjc/po4kDRUEpM3zes91KFzA5P7v2TOzrZ401BNQ/nMeLob8Ij+N8doTG9v2EqgDDK
         3hOLk90Vjeo6uExZbQsPu6/KaWAWRYiQi8jXTf9jyVT01B685gmOvm2w0M0mCoAWkKyq
         gWdgxdnh7aXRXQ3EXQfHf/Om36SaJRhZtSZmjTj7pcolXfwkoo9kQgWE/CD5+6wtKPRh
         XPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owOfd63svCKffwZH1SyoB/UVydKo2mIAWnzt4spjDCc=;
        b=gClZP6gdwnEpTFK9FZs1Dz2LV8xv7lAphJZLIEZXZGfTHsWjfgpaFPG6fnu2pt91tl
         sAoGdN9qDU0DzBMKbkMAyKctjifazouOL3+aU1aGzi0c9j6dwD4QmBHBTxOyLXldPwbU
         9y1MHgJ7l6fNZ2kzYA7lSPkghtMualE3s6BP9wfiKWAVcgtPZG8O1ovxJSoZfRJ0shhs
         DwvmvdFnGoKpOZls6VINbsUiyIqQwrpWfK2FpE4ZJvznVr3+Rd3TojpGEymbOVjimRB+
         elZpO/S1cEuHIYWyHyhaR9DJXp+qjnZ8YCZaqVUiXQP0LTH4tc8gzBt04OksaV+XxGFD
         PanA==
X-Gm-Message-State: AFqh2kr+LT9gcyeNZ/emR+Eupr214ioAPfa0KpBK2GQHPwCRXf3J8jbO
	DPHG50RsHKA3ioQv3Ir1HMdk9YQkdhpLicZ82X8=
X-Google-Smtp-Source: AMrXdXtBZSzmg8bsReWJhCJR8cFsDv3MvLeUcycEmsWYOTJwA5wzl7hxzzORew/HQA8AmnEzfuqElQ==
X-Received: by 2002:a62:1852:0:b0:580:ff90:325a with SMTP id 79-20020a621852000000b00580ff90325amr29969330pfy.8.1672578139868;
        Sun, 01 Jan 2023 05:02:19 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i127-20020a625485000000b005769cee6735sm16712962pfb.43.2023.01.01.05.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 05:02:19 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id AF20D960350; Sun,  1 Jan 2023 03:02:17 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 01 Jan 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230101130217.AF20D960350@nuc.router0800d9.com>
Date: Sun,  1 Jan 2023 03:02:17 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 13:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175184

Branch: kirkstone

New this week: 1 CVEs
CVE-2022-40897 (CVSS3: 7.5 HIGH): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *

Removed this week: 0 CVEs

Full list:  Found 15 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-40897 (CVSS3: 7.5 HIGH): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

