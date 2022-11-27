Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B790BC4321E
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 12:02:22 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.90166.1669550537809320666
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 04:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KpHSDSnL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id b11so7113456pjp.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 04:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHi8fiTVb48w7it37TbV+/yYlG+5XVrIfqJDo/lLuBs=;
        b=KpHSDSnLfLpkREqQA4cmvywRWWktrBoGDHzCBSeIO+fdNxekTc7C9IjoMAmUzUkOVV
         7NYjZhbZaLeOZ1Vb3Vio1ozZDLNJK+B6pwsjkBGGJytmDs+VRvfrLw5w/pn4/w8yB7Og
         Av3MXClRrB/OG195NhRK+oIJtfQCJalCqnpmesQJWDcdgHcdAtJkTElRBqNaec4er+Y9
         w3AFeuA+lO+8d7Y6zEKPp9/l9Y/4X82Gelivfc95kdVGGL01J9mVs0n9Zoz/jLjSkhWj
         Tp9Kt8bqxB9LgOxYtL51Mcf4uFUR6WThZwmxra6I/+/B38YEr9HHi7rX7GI8qPxR1pvz
         nRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHi8fiTVb48w7it37TbV+/yYlG+5XVrIfqJDo/lLuBs=;
        b=7GIrpItwi3uEoqPk5HeNvYl3TDlEXo/8npct1EB9BVchr9+1LAuR6Mf+oMX2JoeCM+
         ONbfpcwM9B6X9aUTyZi/5+AgA0RC2qPAbq2p3a8ZBeV7oDm5ba7YazoEmNl5ierHIVUk
         JBQqT2LkR7GhCkg5cmNhlBsml2/0BjzZUgjD5bwG1zhAJFKwVpfvnUX9wUEuWShuTOyW
         AnlZCTjwrK8BWXdzIIWLPt3XyaU/DuyvnQA2kL02qgsuiANxCwj9Ybcqgvhe1/bIAUZx
         eYjv9JwT3me+4Qht+dDXDrZwIehqhT8fa3dl6lf8pwsOP9stzSUWt+n0MKY/DxjNmm4O
         6I5w==
X-Gm-Message-State: ANoB5pm9DN/Fsj4o9a78hAJCTeDNVzrTCiiJ788W15RZoO2CNnCvK4ah
	tQ7MfuVQNI9dgch1xky3TUO9+vkflzAzve4Zjk4=
X-Google-Smtp-Source: AA0mqf43+nxhw/BiQBBmsl4qGgKMqmHRTOZYLkyCbMntA7Hp7c5cALYW+wpqYOyJ514m70GT1u/lZg==
X-Received: by 2002:a17:902:d2c8:b0:189:3e8f:fa37 with SMTP id n8-20020a170902d2c800b001893e8ffa37mr22527828plc.76.1669550536435;
        Sun, 27 Nov 2022 04:02:16 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r5-20020a170902be0500b001894881842dsm6694855pls.151.2022.11.27.04.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:02:15 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 079DE9602F7; Sun, 27 Nov 2022 02:02:13 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 27 Nov 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221127120213.079DE9602F7@nuc.router0800d9.com>
Date: Sun, 27 Nov 2022 02:02:13 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 12:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173838

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 4 unpatched CVEs
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3970 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

