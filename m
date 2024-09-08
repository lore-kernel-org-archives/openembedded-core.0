Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63510E6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 12:19:55 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.29037.1725797994092907979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Sep 2024 05:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=13kWnuqn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-710d861eb56so634057a34.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 05:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725797993; x=1726402793; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SUgRSAW4cCGQPkfGepd6J7igpZbsMeuseHmPOhB76Y=;
        b=13kWnuqn6825Zk2lbr1ZBtOhSe893g3zdvedcvE9llD7jq63cMbQ9eLG5cyrWiXC9i
         ZuVc1du3X8JufU9LF8n3waI0CxAme36MilF8bPrQCoI6C2Hq6T0IZvxaHgU+jA6w4r/W
         FMxZnxAQkrJysXmx3jjzgK1LIoaud5ZPS5FffF1PG1pe+usCSGdJDaY8ZnXJTV/ZdS7U
         LiEzm0mxSC1ny3AwaDMbkg7Fj4cVFYwpkf18WGdJCaeEUd+UzQr1X/8kHtcLfsMZ4iTQ
         LNU1oYVADra2pSGJYZgwbWJp1IW+HKNZcb+TdL4ExRXEj86VMrRmdzEdDWbfCY4QU1lW
         VrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725797993; x=1726402793;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+SUgRSAW4cCGQPkfGepd6J7igpZbsMeuseHmPOhB76Y=;
        b=GKqzwXU+UuHLEajlf5Uh5K1RdxkynxUPdsHy39TzVXPlmWdZKj+oQbflCZgwH+mKTm
         twn0SVeXLTNTSjTn6NhRQiEPQwZ693f63dCHLl+iYyzd6aL77r9+Q8XMyt6jv04oThAj
         sm7MroEUTmov3R7TILJ+bVMIqKD+98JaMxS7g5BW2YqNYk2Frtdzj3sViwdGQdMtaaeb
         VIvx+7EfIuyGDU08AiBYbyKzPwfUZc8L2KKr39nvE7zxfMK5KbJ1Hh5u2n1mfDE01iBQ
         6jfGspVcS6o+00FKqZ6xHcQX9jPBdd8nFh0C8JCWe61eFXiHRToaACqGjn6huqC0NVVX
         V5tA==
X-Gm-Message-State: AOJu0YwNrDxf+tBUtrXv+780Y/xHNDqwHTqTN3cm/K7I3UlHV0vjNN5s
	9Yy1rab0AKoCR/Y2xFpB3f+3z4KlFMHvS+0LtLy8l05Pi7aSWg2xUOpG9Nn9OPKCzGgYsDXTh03
	ETm4=
X-Google-Smtp-Source: AGHT+IFWrebHqS/VFYnZIwoqpJPrI1uJAWkwRuO4Rg46G032qpB/1l7kv0KIHMa1w4c48hyydl7pDQ==
X-Received: by 2002:a05:6358:3102:b0:1b8:33e2:8e32 with SMTP id e5c5f4694b2df-1b84bdfff20mr602735755d.11.1725797992903;
        Sun, 08 Sep 2024 05:19:52 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a7995dd5sm125558085a.71.2024.09.08.05.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 05:19:52 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 69C02100367; Sun,  8 Sep 2024 02:19:51 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 08 Sep 2024 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  8 Sep 2024 02:19:51 -1000
Message-Id: <20240908121951.69C02100367@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 12:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204297

Branch: kirkstone

New this week: 11 CVEs
CVE-2023-41993 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-41993 *
CVE-2024-45490 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-45490 *
CVE-2024-45491 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-45491 *
CVE-2024-45492 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-45492 *
CVE-2024-6232 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6232 *
CVE-2024-7537 (CVSS3: 5.5 MEDIUM): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7537 *
CVE-2024-7538 (CVSS3: 7.8 HIGH): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7538 *
CVE-2024-7539 (CVSS3: 7.8 HIGH): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7539 *
CVE-2024-7540 (CVSS3: 3.3 LOW): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7540 *
CVE-2024-7541 (CVSS3: 3.3 LOW): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7541 *
CVE-2024-7542 (CVSS3: 3.3 LOW): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7542 *

Removed this week: 6 CVEs
CVE-2024-32928 (CVSS3: 5.9 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-32928 *
CVE-2024-35325 (CVSS3: N/A): libyaml:libyaml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35325 *
CVE-2024-35326 (CVSS3: N/A): libyaml:libyaml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35326 *
CVE-2024-41957 (CVSS3: 5.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41957 *
CVE-2024-41965 (CVSS3: 4.2 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41965 *
CVE-2024-7264 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7264 *

Full list:  Found 56 unpatched CVEs
CVE-2020-14409 (CVSS3: 7.8 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14409 *
CVE-2020-14410 (CVSS3: 5.4 MEDIUM): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14410 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-36648 (CVSS3: 10.0 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36648 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-28198 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28198 *
CVE-2023-28204 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28204 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3164 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3164 *
CVE-2023-32370 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32370 *
CVE-2023-32373 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32373 *
CVE-2023-37450 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37450 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-39323 (CVSS3: 8.1 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39323 *
CVE-2023-4001 (CVSS3: 6.8 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4001 *
CVE-2023-40397 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40397 *
CVE-2023-41993 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-41993 *
CVE-2023-42916 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42916 *
CVE-2023-42917 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42917 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-47470 (CVSS3: 7.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47470 *
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *
CVE-2023-52355 (CVSS3: 7.5 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52355 *
CVE-2023-52425 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52425 *
CVE-2023-5380 (CVSS3: 4.7 MEDIUM): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5380 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *
CVE-2024-1048 (CVSS3: 3.3 LOW): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-1048 *
CVE-2024-22860 (CVSS3: 9.8 CRITICAL): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22860 *
CVE-2024-22861 (CVSS3: 7.5 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22861 *
CVE-2024-22862 (CVSS3: 9.8 CRITICAL): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22862 *
CVE-2024-24790 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24790 *
CVE-2024-29508 (CVSS3: 3.3 LOW): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-29508 *
CVE-2024-45490 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-45490 *
CVE-2024-45491 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-45491 *
CVE-2024-45492 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-45492 *
CVE-2024-6232 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6232 *
CVE-2024-6505 (CVSS3: 6.8 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6505 *
CVE-2024-7272 (CVSS3: 8.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7272 *
CVE-2024-7537 (CVSS3: 5.5 MEDIUM): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7537 *
CVE-2024-7538 (CVSS3: 7.8 HIGH): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7538 *
CVE-2024-7539 (CVSS3: 7.8 HIGH): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7539 *
CVE-2024-7540 (CVSS3: 3.3 LOW): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7540 *
CVE-2024-7541 (CVSS3: 3.3 LOW): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7541 *
CVE-2024-7542 (CVSS3: 3.3 LOW): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7542 *
CVE-2024-7592 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7592 *

Summary of CVE counts by recipe:
  webkitgtk: 9
  ffmpeg: 6
  go: 6
  ofono: 6
  qemu:qemu-native:qemu-system-native: 5
  expat:expat-native: 4
  python3:python3-native: 3
  rpm:rpm-native: 3
  tiff: 3
  gnupg:gnupg-native: 2
  grub:grub-efi:grub-native: 2
  libsdl2:libsdl2-native: 2
  cpio: 1
  ghostscript:ghostscript-native: 1
  pixman:pixman-native: 1
  xserver-xorg: 1
  xwayland: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

