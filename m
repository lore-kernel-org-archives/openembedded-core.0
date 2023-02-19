Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EE3C05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 14:09:29 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.32869.1676815764314808481
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 06:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tjkYHfCf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id mg17-20020a17090b371100b00229ca6a4636so744728pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 06:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q57+4ngCLsOPJPuEPM1YgUuI5t72blkCuylONx49ceY=;
        b=tjkYHfCfmgT3AAKku6lL6fP1QFFUJmqcsON1imEErceCW709PRkhxmK/gE37TQcR16
         xtsKRYdnxvOTPk0zhF8ycN4YccndADA5DhnF3sZBkVXq8LgEnjp8ihntWaNlgPiDChox
         zMLqosg+VJWJP8LB5UzfWiOzAsDhkYwyn8ifacZitZi11eMPW02I2acQSNLKWj8KxmPC
         sBY+NjwNaj/AkiFlCe44lERRFi0mud2n7n/PKJIy3Ok+O/UbGdkXBoHID5HO/cIAMtZU
         h9Pi2lECt3PzUUkR9/W0s+pmJYjXks0JqAKM9VH5k8+C+CHViBOGRtBYZ2biTZ5Y9oGW
         0/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q57+4ngCLsOPJPuEPM1YgUuI5t72blkCuylONx49ceY=;
        b=WfPJ926JLw/QS/rhur3vBqand2NMb79KvGLvAVq/f6yrU83QOMi6RwLc081GBs434t
         CyPdUa54Nxrso+7S39sskB+hkJhzby7si3yhMBh1zVidrbwHvmXQK0pj52zhLbb0h814
         biXe30eyLm3m3IeaLhe5fx77wFvMWsWMAl30enjykJQtUPBFEj4yFWxGJ9Ax+FMmdT3I
         TbaROtxtlrK890pT+sZh2hLEaejmkve3JpVHu3qCvoCrip2A2IxaR9WF9AvKC4E+tmzi
         0pqTbuBe2Yj7TK+7BnaDtT8b7Mt9SjZ/W+wXKm1MaR7gQ3L8ANIlPt4vb3YKMR4c4iFC
         xAEA==
X-Gm-Message-State: AO0yUKV5qM8yUORVAAZhO+wNFuI4WHuEviAmqr76N/qw6ySQC9uXtwfe
	Nj3cp7ZegCMcN3lTICxZ2FuZ1VxMyl8PyVm2sIQ=
X-Google-Smtp-Source: AK7set8Xn7m5vPPzp2Zg6VbnwunbficImyEuEJX29l+WAfsj5qrJBel95gcvP5HZ8XnG9oW7dPif3g==
X-Received: by 2002:a17:902:f98f:b0:196:790a:8bae with SMTP id ky15-20020a170902f98f00b00196790a8baemr1308663plb.43.1676815762832;
        Sun, 19 Feb 2023 06:09:22 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b0019607aeda8bsm1140589pld.73.2023.02.19.06.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 06:09:22 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 711D49602F3; Sun, 19 Feb 2023 04:09:18 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 19 Feb 2023 04:05:17 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 19 Feb 2023 04:09:18 -1000
Message-Id: <20230219140918.711D49602F3@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 14:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177328

Branch: master

New this week: 8 CVEs
CVE-2022-4450 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4450 *
CVE-2022-46663 (CVSS3: 7.5 HIGH): less https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46663 *
CVE-2023-0215 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0215 *
CVE-2023-0216 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0216 *
CVE-2023-0217 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0217 *
CVE-2023-0286 (CVSS3: 9.1 CRITICAL): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0286 *
CVE-2023-0401 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0401 *
CVE-2023-25193 (CVSS3: 7.5 HIGH): harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25193 *

Removed this week: 3 CVEs
CVE-2022-48303 (CVSS3: 7.8 HIGH): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48303 *
CVE-2023-0433 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0433 *
CVE-2023-0512 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0512 *

Full list:  Found 12 unpatched CVEs
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4450 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4450 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2022-46663 (CVSS3: 7.5 HIGH): less https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46663 *
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2023-0215 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0215 *
CVE-2023-0216 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0216 *
CVE-2023-0217 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0217 *
CVE-2023-0286 (CVSS3: 9.1 CRITICAL): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0286 *
CVE-2023-0401 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0401 *
CVE-2023-25139 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25139 *
CVE-2023-25193 (CVSS3: 7.5 HIGH): harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25193 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

