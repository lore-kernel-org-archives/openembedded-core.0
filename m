Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6571AEB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 16:54:31 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.45352.1689008065410817118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 09:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=d8UUYCvP;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.169, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-767ca28fb32so77709085a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 09:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689008064; x=1691600064;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x21ggrddpYwehrV17LjIm1iwQTBpwJrPd2HStRQO51k=;
        b=d8UUYCvPXsAeBlBuSbivM9uOsjFGyBFhJeVu1P44Ln2tL5mkEGCikKeQZq/EACu6Hp
         Otmv3Ocn+eP/h6WRJbAEzroLSKwQQN4rzMNfKzNVNn8OrbPpwoqbbon059CmwC9UgjpJ
         sIjm0GNolP5W9NtDfrQN9M/wz5hd7DyJA7nG9AzliF3F7QKbEChXd0hlwmByKrOC7LH+
         XCvDpFYWGXpOZnzW0PFuEQt56HRa+MwgXdmLq5huQvuqG1dYiaL4w7CMLPqEdpkMrSj+
         q0haQUm1mPdNVOs8Ub6WN1UOaC5QlmztgHEV5UW0NjMgeZSsT+w4re4QIlilp9JzpReW
         g35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689008064; x=1691600064;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x21ggrddpYwehrV17LjIm1iwQTBpwJrPd2HStRQO51k=;
        b=CbaexJgHljEybSX5Kf6a+AsWxZG2VWyVmeHplF/X2nvot0GvXfWc5hoIiZ4fpEqkMF
         aRWXdhga5Ec8vlbFg1BRTRmFHcUPj4iO3eEVJBN9bD4d28f97xuRnXAC2WB9SOOb58yN
         1Enq0sYIH4YSs2/EpT+K5VWIZo7/xFLJSv+tM3n9q2PqOLrl+LRg91Ruvi8LMiHcOVWr
         QfJurxQtu3DulXK45o4Mk8qI6l/6/1OAaQdtfJCdnrvVLZxhEqpMDMUsfjMMMTs+VhGw
         k38qQraFR4LQSZIB9wVZ/+4+goA+2uyxTZw7FxPMZ/S/wQzmcADJr07KoZhNyf6BPqLm
         zUKA==
X-Gm-Message-State: ABy/qLbEeMGSBkJlGXQT63gcfmfItO0XmnjyDeNQ5owbPvE4d2+KFwur
	wSouhXaZK9cDyuV6FRjsTqRV2ZL3In/lmIDhBQmBEg==
X-Google-Smtp-Source: APBJJlEUpN6uL6zNe3+DNGueQUAHUy4aHLIitZDZVcIw7mJiEwIdusdJxR8eGRcljoeVPYFyvBKVBA==
X-Received: by 2002:a0c:f546:0:b0:626:c17:8b55 with SMTP id p6-20020a0cf546000000b006260c178b55mr15706314qvm.25.1689008064139;
        Mon, 10 Jul 2023 09:54:24 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id o8-20020a0cf4c8000000b0063007ccaf42sm15061qvm.57.2023.07.10.09.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 09:54:23 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id B61921045BD; Mon, 10 Jul 2023 06:54:22 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Mon 10 Jul 2023 06:53:15 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Mon, 10 Jul 2023 06:54:22 -1000
Message-Id: <20230710165422.B61921045BD@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 16:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184088

Branch: kirkstone

New this week: 8 CVEs
CVE-2023-1999 (CVSS3: 7.5 HIGH): libwebp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1999 *
CVE-2023-2828 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2828 *
CVE-2023-2829 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2829 *
CVE-2023-2911 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2911 *
CVE-2023-3138 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3138 *
CVE-2023-3316 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3316 *
CVE-2023-36632 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36632 *
CVE-2023-36664 (CVSS3: 9.8 CRITICAL): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36664 *

Removed this week: 0 CVEs

Full list:  Found 39 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3964 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3964 *
CVE-2022-3965 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3965 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-1999 (CVSS3: 7.5 HIGH): libwebp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1999 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-2603 (CVSS3: 7.8 HIGH): libcap:libcap-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2603 *
CVE-2023-2609 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2609 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
CVE-2023-26965 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26965 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-2828 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2828 *
CVE-2023-2829 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2829 *
CVE-2023-2911 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2911 *
CVE-2023-29400 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29400 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *
CVE-2023-3138 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3138 *
CVE-2023-3316 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3316 *
CVE-2023-34241 (CVSS3: 7.1 HIGH): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-34241 *
CVE-2023-36632 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36632 *
CVE-2023-36664 (CVSS3: 9.8 CRITICAL): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36664 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

