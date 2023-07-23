Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C852C001B0
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 13:22:45 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.25248.1690118555806126637
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 06:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=tpu1b2ir;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.169, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-765ae938b1bso328259385a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 06:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690118554; x=1690723354;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//EVpHgF/2SCj1NVoMWC0nSGnuxMzl9hREhFc4hA03g=;
        b=tpu1b2irJj9X6LYos7RAKtPdAHrh787nlU6MMA2c+2Sr+owYIOHoiadKWvpqBPYUg0
         qSUJc8+xgwiNtf02ntZ71tLDs70oUumVo1Zvq5Oc0cSQbi79Kyefuz4RfpiIYHvp7Yej
         aQ0tyoJ/Sm6Wc7PU5cDzhqHq0vylpQPE1azqfnri+RgHwiTXa3XBTUoNZH8Rvrcw9oQJ
         A1bO+7lECBSmRkpAZO46kQeSqyjrxF2VIyWLlNejaABDuBBfER6mNU2EMwhhSQjUiYsz
         BQBOHMRG8ll3FMrlqmRgOrOg//qNVef2xkFCdts4n5vX6ybaShF70d+BRk0cISmy4JVj
         v5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690118554; x=1690723354;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//EVpHgF/2SCj1NVoMWC0nSGnuxMzl9hREhFc4hA03g=;
        b=a39xl+iGTaZY9b0GEvRwfFee3KrJ9sMpaaYcglrP6++B71FmqqtrxwmTV5LAT41Sup
         Yjdfe73ESIP48WlgN31tmuxuVawAT0USI46vku4kiA4/CgLTG1PQ6WrpWfdiVWXGdlcx
         CyXykxvHwrcNYyOKcU19r1kTl9EWGDyMVW/PDkOXiIgPrcqtUmq4otE+bFzitZK3Esz9
         Vy8wI6b+nOy5g6iPe5zXKTYw2uOwfsVifvcvQm5Rm16hgk9WQwvllLYkRnaF8x7hadqc
         ROSdAGhzYKbleR1Ya6RmLHEufaimVSY+tVEKTx7nK+m6wnDZn0ZGD7Hz1jDTVaRGDe+/
         SEoQ==
X-Gm-Message-State: ABy/qLYJcYivvXExb7PUdVRAZwp3wbuSrldgtavWWi65VJFjp0QtJoLd
	i635ipTJtk0b0t3NqUNkdHYYMYc/++40Vl6jS5bhDQ==
X-Google-Smtp-Source: APBJJlGk7WQa0EGnAU43hKGkjD7IebrwJTEcw+LXbZM1w0eg50uIHZUrsJ9TAnCm63gpCAXAhetjVA==
X-Received: by 2002:a0c:9a9a:0:b0:63c:e8c4:e9c8 with SMTP id y26-20020a0c9a9a000000b0063ce8c4e9c8mr5405274qvd.16.1690118554341;
        Sun, 23 Jul 2023 06:22:34 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id h14-20020a0cf40e000000b0063cf8ae182esm570764qvl.60.2023.07.23.06.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 06:22:34 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id C0AC5107094; Sun, 23 Jul 2023 03:22:32 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 23 Jul 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 23 Jul 2023 03:22:32 -1000
Message-Id: <20230723132232.C0AC5107094@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 13:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184752

Branch: kirkstone

New this week: 4 CVEs
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2023-29406 (CVSS3: 6.5 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29406 *
CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3354 *
CVE-2023-3618 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3618 *

Removed this week: 6 CVEs
CVE-2023-1999 (CVSS3: 7.5 HIGH): libwebp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1999 *
CVE-2023-2609 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2609 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
CVE-2023-2828 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2828 *
CVE-2023-2911 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2911 *
CVE-2023-3138 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3138 *

Full list:  Found 35 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
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
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *
CVE-2023-3316 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3316 *
CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3354 *
CVE-2023-3618 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3618 *
CVE-2023-36632 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36632 *
CVE-2023-36664 (CVSS3: 7.8 HIGH): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36664 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

