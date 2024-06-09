Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2628C27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 12:19:44 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.16349.1717935575483125068
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jun 2024 05:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=olNtKNhT;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.52, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6af4fcb45ccso37753356d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717935574; x=1718540374; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBy+6XwYDhwH0PKgM5Ul7Z1pXM6MgW8TUGoA6xrYhnI=;
        b=olNtKNhTjbajiVkHmfyz2KSrRrfaNAIgt1lq8eQaDaG4gCTU3pU0q8CYX3baLxF6ly
         Ffz4n2HwYEFli99DCWFUTzHAnuiOcrP+6JRIzVrglw0wjUTNtMmBNUtEEosFdGLzx9IW
         wyiLn/7IudAOmQIySlcEz/MV9kyQAhKqqmHoYTuvR3ZjYFWjqW7hJepDhdj8BCTLew01
         SJqvif3POkbV3p54KN2pRaFQsfzHtn42NXPMLbK85xVBguBlb48WSq1v8nQkUBUzGZRn
         TD1ixWzD7OaVx6DtCCsvj4JjR5dF3Dx4oADSfS67ac1Yr0eqO2ukVEB5tw1JtBKDmpmt
         4ZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717935574; x=1718540374;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gBy+6XwYDhwH0PKgM5Ul7Z1pXM6MgW8TUGoA6xrYhnI=;
        b=sr6dOue/TYrKZSofQTuGUi8nPADGkJ1oDTTO1JzMRUrf4fUTnX5JR6LVctM0qEOUSp
         5rRbqw9xte8VV6o6NxY2Wepe3fzcTe3e3hEgv9FmNxjolTEwhpHXF6EMrrWtVDZKifiU
         5ckH78GQaL2T5+Wue9IfmprPzZz67qsn2WtSPJRkZhry06J/U89mvbuitPaI7PSzoqfv
         XBPU1TLOCprMhkTBDvfOMmAZLHYCGu4t+a6BURqZmMRmblU+89TLvymLWTq7j4xQHAUZ
         dvMs+RG788eQXc/1XXkDFhdDfE5kFdjt18QUePE4hSneaN6JCbWviq/WFo/K3Fgkl9fN
         da5g==
X-Gm-Message-State: AOJu0YxPIRNPdKtxha1dInyPnrJbJT/2yx5tQhYdXDarlicROMtiVLLx
	WAQMy+4kFyy+VuAMzqqoO5kR2njxyXy1qxU/06cUjjXjKRUbOTegemPVl+i8Ysq8MYeEhpoJEED
	132U=
X-Google-Smtp-Source: AGHT+IEEB1L/8H0JneyJUwqBY9093nzybKHeNvQdjfXgjixMq2OylHpQqXzQhP4+5w0JhTHiz18RxA==
X-Received: by 2002:a05:6214:d64:b0:6b0:3f23:fe00 with SMTP id 6a1803df08f44-6b04bed9908mr179608326d6.5.1717935574221;
        Sun, 09 Jun 2024 05:19:34 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f623710sm36352496d6.4.2024.06.09.05.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 05:19:34 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id E6C1510038B; Sun,  9 Jun 2024 02:19:32 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 09 Jun 2024 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  9 Jun 2024 02:19:32 -1000
Message-Id: <20240609121932.E6C1510038B@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 12:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200458

Branch: kirkstone

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 33 unpatched CVEs
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
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3164 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3164 *
CVE-2023-32370 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32370 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-39323 (CVSS3: 8.1 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39323 *
CVE-2023-4001 (CVSS3: 6.8 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4001 *
CVE-2023-40397 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40397 *
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

Summary of CVE counts by recipe:
  ffmpeg: 5
  go: 5
  qemu:qemu-native:qemu-system-native: 4
  rpm:rpm-native: 3
  tiff: 3
  webkitgtk: 3
  gnupg:gnupg-native: 2
  grub:grub-efi:grub-native: 2
  cpio: 1
  expat:expat-native: 1
  pixman:pixman-native: 1
  python3:python3-native: 1
  xserver-xorg: 1
  xwayland: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

