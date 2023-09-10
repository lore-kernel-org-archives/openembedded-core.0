Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F136EE57CD
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 11:18:27 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.34152.1694344704303657706
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 04:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ErNMVQhH;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.48, mailfrom: steve@sakoman.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7a505727e7eso1262439241.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 04:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694344703; x=1694949503; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLpz5IRmapFUfrmnol9Lf6FsQElMPLbNsZDmJb43TaI=;
        b=ErNMVQhHK2AiwKU4pYG1Xl8XsrMUrMb9r9jxf2ggiOomx0lDnrkq5msYgEgwHHe21z
         i2NM0UE7B7MfphSrlheBHJkFkACyRWcwbHakrnW6TaRZqj1tKWC4X0L+ixFkgkkOyYtM
         L6K7LLdblWuqZVNa+nvgcNP20h2+wnBUZvErodVGaX5fzuTKLXJ0mg3XD9WMwtBdDLFM
         ElKvluYfGPUsti70E9M0vbUf9JY5KymWBtmEkBOVYsWZR05jxSqYZUsG0JLZKEBxS/gM
         Kop2zUfIwLyoDDPI9if73LtCP6DkejRov6G1A2TuD9FfJYsgoJm+0KAd0zba+FRW9WsL
         T+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694344703; x=1694949503;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oLpz5IRmapFUfrmnol9Lf6FsQElMPLbNsZDmJb43TaI=;
        b=qf58IqmUW/67FUfEjOkVr0mbPWHC4IdlEH/1e8hNB9gX/MzuUUNBqvTfEJbpFTaltr
         ihkEHTZkg2ILJEjcaq3Z4rbv09AX+wGrk3OQgxnFhTxo67CkVlCwm7soPDSmrAADNZpK
         meaZDinKtpuq61d/43MKUQziUsuHST9B1Rm9ajExq9wzVyCWkkY55nTI/KLJ+TjeHrgc
         SRQpe/Fb+a3SF/e2p6W1E/Nyih/v+5s2/F8uY9s1KzI9WaGLm6sWchlEgz8YxTuCVbUj
         S7+CD8p+XnVfDinnvDCl3IcM6iaP421YD0XapMBkEwXHsYMT73EFhjj1sS0fc1kReDnI
         sW4A==
X-Gm-Message-State: AOJu0YzmRk8hjBb8QwC2h5Xw6GQuUDz/s2YvT6vCa65jF5AofUKukJRf
	l8U7YlrEogzIHxQgOxXGL1ant12bZtoVkKdbwK4=
X-Google-Smtp-Source: AGHT+IERXBVDFWsVOLhXz2GpyVASSVlcAgfTmsEXcXrqUKZmJObQb4XeF41eFdZ7KKEZmntbJbXhGw==
X-Received: by 2002:a05:6102:2846:b0:44e:9afe:c5b2 with SMTP id az6-20020a056102284600b0044e9afec5b2mr5945921vsb.27.1694344702668;
        Sun, 10 Sep 2023 04:18:22 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id n7-20020a0cfbc7000000b00655e4286056sm512699qvp.45.2023.09.10.04.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 04:18:22 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id F2D05106AA0; Sun, 10 Sep 2023 01:18:20 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 10 Sep 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 10 Sep 2023 01:18:20 -1000
Message-Id: <20230910111820.F2D05106AA0@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 11:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187452

Branch: master

New this week: 10 CVEs
CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3563 *
CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3637 *
CVE-2023-4733 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4733 *
CVE-2023-4734 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4734 *
CVE-2023-4735 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4735 *
CVE-2023-4736 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4736 *
CVE-2023-4738 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4738 *
CVE-2023-4750 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4750 *
CVE-2023-4752 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4752 *
CVE-2023-4781 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4781 *

Removed this week: 3 CVEs
CVE-2023-3772 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3772 *
CVE-2023-3773 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3773 *
CVE-2023-4128 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4128 *

Full list:  Found 36 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3563 *
CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3637 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0687 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-28736 (CVSS3: 6.7 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28736 *
CVE-2023-28938 (CVSS3: 4.4 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28938 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3180 *
CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3354 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-36664 (CVSS3: 7.8 HIGH): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36664 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-4569 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4569 *
CVE-2023-4611 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4611 *
CVE-2023-4733 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4733 *
CVE-2023-4734 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4734 *
CVE-2023-4735 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4735 *
CVE-2023-4736 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4736 *
CVE-2023-4738 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4738 *
CVE-2023-4750 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4750 *
CVE-2023-4752 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4752 *
CVE-2023-4781 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4781 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

