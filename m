Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368D7C46467
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:00 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.27912.1650196947922047074
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 05:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=aNvw/HH1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso11884981pjj.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 05:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=BoAftdmOl6ZZ0d6puRUD6xWzvPIPz8izilj4I0hQBts=;
        b=aNvw/HH1KNL5y44/UiJrKepO5Sr3DfEH+D/1WV1YU8TC2hu9kUrNDz9laIlMVfzC+m
         d/DSl+rNb2cB7prjJQc6hNmBP1FyXOOswcdtDIgb0exh7DUILvUM47Vz0HtS2V4cPekK
         nYULIR4WnIA5FQSaqwQTbIdNtKYf86VoBzEJHvmVE/zb/hCBIzd+a99mCXn4tWSL5ojL
         3AUhq9VbFbgMEdEhi/wWHtriOfn31jLYXXdirbvZX67K2m+Fq/uodJZ9EhrWn3xcbFoW
         HL82dVUEzk5yy6QzQDJYSejTK9vx4LGsO7jX6FkyE5Z3JlSH1aRKhUSS6r9Xj6y5dBla
         PLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=BoAftdmOl6ZZ0d6puRUD6xWzvPIPz8izilj4I0hQBts=;
        b=sKd/ciYOIw4t/LHCSeuE9MhUdrXxXj3/s8n3S0Be13+CzFrTKpoM3YyGAgYENUATIl
         ZtLV6UHIEsMaylfMCypvl0IEI4kHmdGx+HXSJoiW4aDdTr2TOPgv4/f+9EYsdekVWxsX
         cUKBDzirnIX6sJEGBi/YN7cuAB444wLlsWTajhGKE5I5w9hYQu0hGbUZ9gcxr7K4lRAb
         +omhWtniJ4MmyBgN7KGtXBZKOXZIvAJQ8WD8FbBkv8itAnQ1aKi95MkLg30O25kQxGuD
         6z4Qdvu03A33QSJGW27b4pkJ7SHNw4mxzVe5VUEhnUDzVs01CewofCgfYhcUxFpeLohi
         aP9Q==
X-Gm-Message-State: AOAM530bnF9q0+LTDt2bejOSOiXCfIAIh7TLm0B02/yBTKMNuZlEeMvk
	h0i6WiC4aimZGKfnmAEneF7Kl2OsfaQjlDxjLxI=
X-Google-Smtp-Source: 
 ABdhPJxuqBGckWD5twWq5+l2LQZJJ3E/bIK63k+d2/NgVhTmExFDOqGEfsn3ejC/LKNSGhOV5rBYEg==
X-Received: by 2002:a17:902:868b:b0:156:7afb:2ce2 with SMTP id
 g11-20020a170902868b00b001567afb2ce2mr6575232plo.27.1650196946501;
        Sun, 17 Apr 2022 05:02:26 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g14-20020a63200e000000b0039d9816238fsm9685120pgg.81.2022.04.17.05.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 05:02:25 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id DEA9D960780; Sun, 17 Apr 2022 02:02:22 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 17 Apr 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220417120222.DEA9D960780@nuc.router0800d9.com>
Date: Sun, 17 Apr 2022 02:02:22 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164571

Branch: master

New this week: 3 CVEs
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *
CVE-2022-28805 (CVSS3: 9.1 CRITICAL): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28805 *

Removed this week: 6 CVEs
CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *
CVE-2021-44647 (CVSS3: 5.5 MEDIUM): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1056 *
CVE-2022-24975 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-26280 (CVSS3: 9.1 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26280 *

Full list:  Found 9 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-27191 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *
CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *
CVE-2022-28805 (CVSS3: 9.1 CRITICAL): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28805 *


