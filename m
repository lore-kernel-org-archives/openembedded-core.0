Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF59C4332F
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 13:32:58 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.29520.1671370369720980457
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 05:32:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=HjH2gYMX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id u5so6663605pjy.5
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 05:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4y9p3FwPRHxKZLX3dXyjklub+whJrPoWuY30Hv/YZ2E=;
        b=HjH2gYMXCQ5VnWkwtf9JsbEqRe19eYITTyTIrVdqibYbwXklH+bpjbtLTYyL13e1xA
         A9+d3+12OY28ejU4jbtR7s/sX0E95D0MOMXRgrdTbKrNAiaD2oq8PhJF3hG9wH49Hv5E
         5F2vzbs5uEgaUezbtbVgxrJsT5ORBQOl41d3DlIbl10Us5XOIdzF9al8hzA04wjqraaI
         R7Dp8kh79NhFHqkO3UsKkiDvTTlS3JIJ4n2PKzyNcFFLqmCX1LBjJO3M4uhl9YKXNk+R
         Gb4R2G7IswWW7J9G81xMcACLiWj/nZ6++3KByBsicuvfLpMlg4dg1z63fxAxGEE3GM/K
         dAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4y9p3FwPRHxKZLX3dXyjklub+whJrPoWuY30Hv/YZ2E=;
        b=5aauoc8nLUL2bCLjpP3xZJd+kRy16jhKfSBsPGbJUIfxrvh05pmpbJRi5gzpWmj3TG
         ZC+vq2/xpzWhvQqho6DeLXP/Sk554hTABTQsocM4+NDFGgR96UhDSNBneFQvtrkhTAvA
         QE5KmL88ZVkl2UdPgr8yaMSHzwSO07/pPOa88DXi263MoUcFqYw4GqQLMXhTYCuJyHCT
         RW/SE/fgOHiH29lEEVfk8WapL2U1jhuZu9oyZkPUg6rPzWFD4H4QN9gJDaPqs/FV1CV5
         wIAiyuwQTUtLDzQ4woh2YvdIePGQgWBKG1XEksyAAcpcMJx63vdczwSlrFxsJtuvq5Y+
         l58A==
X-Gm-Message-State: ANoB5pnhjlZVPtJI0Xw3cbTf6GrS6Roj4yT8yDX6OAoDhscQJAOuyFTo
	kpBh6Nuix/AMJYqnYXE6IcnsOBOBw371M5sjJ50=
X-Google-Smtp-Source: AA0mqf4wb+62SJ2r+h/OESqjy4OWx/eswWnh1tAP/L0SZ5vriQy9Rw21j0dfhij88sk/F3JGxEvwJQ==
X-Received: by 2002:a17:902:f602:b0:187:4920:3a3c with SMTP id n2-20020a170902f60200b0018749203a3cmr41800482plg.33.1671370368367;
        Sun, 18 Dec 2022 05:32:48 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v20-20020a170902ca9400b001708c4ebbaesm5043985pld.309.2022.12.18.05.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 05:32:47 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 26A6B960367; Sun, 18 Dec 2022 03:32:46 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 18 Dec 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221218133246.26A6B960367@nuc.router0800d9.com>
Date: Sun, 18 Dec 2022 03:32:46 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 13:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174786

Branch: langdale

New this week: 5 CVEs
CVE-2022-2601 (CVSS3: 8.6 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2601 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-46908 (CVSS3: 9.8 CRITICAL): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

Removed this week: 0 CVEs

Full list:  Found 18 unpatched CVEs
CVE-2022-2601 (CVSS3: 8.6 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2601 *
CVE-2022-36227 (CVSS3: 9.8 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36227 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4141 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4141 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-4292 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4292 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-46908 (CVSS3: 9.8 CRITICAL): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

