Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08735C47DA9
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 13:18:20 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.36667.1706447896683935493
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jan 2024 05:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rpVWbBAA;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.173, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-42993124fa1so20354401cf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 05:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706447895; x=1707052695; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaKaHHSQe027NW9xShS79lneZ1YY83VifHSaXTQ1res=;
        b=rpVWbBAAT+HSy0e/ZakemHBY18r02UxHQ6o4EdX9VC15Ql7ovSAY47Fgf4aQ0tm3ZJ
         tcTObH/n58rvb4nSNxgmNPtDtrDGwOS1Pfpw1jF1EbNet1PG/XJZt1aD6FP0oHah5GZu
         EBTLTCZmKRv+juuw8LarUC9KOiQ6i3SmUktTOR6zPCYVRtTo/mAV8qmuXpEHmjBgPaSb
         AXBQFrsyjOdeTiIn2MmAJQ6Izs4ZgwuChnCCoKzh/KAheAxsq2+atgD18tGkgXp92Ttd
         /64M6kqGHiJIBd7v0sou2/XWZrv6QhyNJLTAdzVVgTa1Wii6ZtRhvPUu3sa61hhkmlJg
         S6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706447895; x=1707052695;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RaKaHHSQe027NW9xShS79lneZ1YY83VifHSaXTQ1res=;
        b=lpjz+pEg8JYWW9K5CCfTw5Jm6KEtR3B86wiKRRbnL5elaH11ngW5iwMmKu4seU9c9L
         eLKJSt19Iv3EXzekypxSFil9tZqUehUUaF75qN1yg6uu5JCi117dupCCKhRJPZseyIyi
         B26muyqLBRKAwuYAT0RuC41GyCDFG2HbvUXwE1dzuBNvllOaZJ7zViuceR8kMRt/Rz6p
         4N6eVjvr4lZ4kUi4IlOoNqUcDWfYnGMb9hbom4Nr1JlcqYTM2G7DRCaOv3QID0JZ6w/7
         W5pXAysmvlfjt7xs1h0S2nLk2Qx92s+WvOat+pUhTOcxibnsXvO63rA+L9ngeap6yByE
         6x5g==
X-Gm-Message-State: AOJu0YxhRMbKCcbfQJSaoSEBDfHhndyc9WanjF6Q9TNL49OM9Vi1+f9U
	3KQCeDutmAnwu2rIFBytv82U3/llOTDWSTy6X1AnjoI7TXptPXftk73+VaYfnrYf/CdfjPEmddY
	Z8sk=
X-Google-Smtp-Source: AGHT+IFh6w3qbn/w9q3NI2GChYfkNEoAZmLBXz5lEBzpTdZ+4pR5jIcvAQQFcduw6w83xEWxa9GcLw==
X-Received: by 2002:a05:622a:199a:b0:42a:a4c3:4268 with SMTP id u26-20020a05622a199a00b0042aa4c34268mr190557qtc.43.1706447894856;
        Sun, 28 Jan 2024 05:18:14 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id kb8-20020a05622a448800b004280cad48basm2548959qtb.77.2024.01.28.05.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 05:18:14 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 4B56A1068EA; Sun, 28 Jan 2024 03:18:13 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 28 Jan 2024 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 28 Jan 2024 03:18:13 -1000
Message-Id: <20240128131813.4B56A1068EA@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 13:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194441

Branch: kirkstone

New this week: 5 CVEs
CVE-2023-4001 (CVSS3: 6.8 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4001 *
CVE-2023-48795 (CVSS3: 5.9 MEDIUM): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6683 *
CVE-2023-6816 (CVSS3: 9.8 CRITICAL): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6816 *
CVE-2024-0232 (CVSS3: 5.5 MEDIUM): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0232 *

Removed this week: 4 CVEs
CVE-2023-48795 (CVSS3: 5.9 MEDIUM): dropbear:libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
CVE-2023-6228 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6228 *
CVE-2023-6992 (CVSS3: 5.5 MEDIUM): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6992 *
CVE-2023-7104 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7104 *

Full list:  Found 41 unpatched CVEs
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
CVE-2023-32370 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32370 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-39323 (CVSS3: 8.1 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39323 *
CVE-2023-4001 (CVSS3: 6.8 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4001 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-40397 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40397 *
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go:nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-45285 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45285 *
CVE-2023-45287 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45287 *
CVE-2023-45803 (CVSS3: 4.2 MEDIUM): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45803 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-47100 (CVSS3: 9.8 CRITICAL): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47100 *
CVE-2023-47470 (CVSS3: 7.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47470 *
CVE-2023-48795 (CVSS3: 5.9 MEDIUM): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-5380 (CVSS3: 4.7 MEDIUM): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5380 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-6277 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6277 *
CVE-2023-6377 (CVSS3: 7.8 HIGH): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6377 *
CVE-2023-6478 (CVSS3: 7.5 HIGH): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6478 *
CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6683 *
CVE-2023-6693 (CVSS3: 5.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6693 *
CVE-2023-6816 (CVSS3: 9.8 CRITICAL): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6816 *
CVE-2024-0232 (CVSS3: 5.5 MEDIUM): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0232 *
CVE-2024-22195 (CVSS3: 6.1 MEDIUM): python3-jinja2:python3-jinja2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22195 *

Summary of CVE counts by recipe:
  qemu:qemu-native:qemu-system-native: 7
  go: 6
  xwayland: 4
  rpm:rpm-native: 3
  webkitgtk: 3
  ffmpeg: 2
  gnupg:gnupg-native: 2
  tiff: 2
  gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial: 1
  go:nghttp2: 1
  grub:grub-efi:grub-native: 1
  libssh2:libssh2-native: 1
  openssh: 1
  perl:perl-native: 1
  pixman:pixman-native: 1
  python3:python3-native: 1
  python3-jinja2:python3-jinja2-native: 1
  python3-urllib3: 1
  sqlite3:sqlite3-native: 1
  xserver-xorg: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

