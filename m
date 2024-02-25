Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BAEC47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 13:18:19 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.38572.1708867095755256861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 05:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G1uZKY0J;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.175, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-787a843003eso164857385a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 05:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708867095; x=1709471895; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obqj38qEsGLNntP+2yl7Oa5JjMzkqEDhG4c4DLeZQxQ=;
        b=G1uZKY0J97Lx+gHSwmxEzAiXONnJYpnCrFi0rY0ANgySZmvWw2LuF2xdBAY3anujh3
         UuoQEpTMC8IWeuzhyx3POtHjRzD78nhrswKpXP7cbUW0P12vjuvC5KtXWF0+q6DrURmh
         TCp0FjWeF/knDosffYQZkzgD+VVKa4CzbIqMQSaQoKmwCkXj0LYL05mFx9VjqtqoBLSc
         yoRNReMRujekT+pvRTXey5qmqxk3SMBuWW9b7/C95QVPO0J9qypn6IwWi86sFUmEbwIg
         pgKWx4F377iCEyihgzpfjH56rNGJ6EZw1gAbYh7IxwOm4vBNqDoKzVe+O/88i1wVVScL
         7lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708867095; x=1709471895;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=obqj38qEsGLNntP+2yl7Oa5JjMzkqEDhG4c4DLeZQxQ=;
        b=Ax27h+asaoaiL+nefpPileLw/uEYjUPJs7n38VOjM0Vv4Dc2U7UO3vIc22Bz8Yg7WB
         obXAKKmAMgwGfrErXrXHqAjcSJBgBDWVBDpmFJ5NpoYlwvUhlzz4KGaKn3iRjP0TBqWf
         NdNBnm9LqSbCN+Q2PudaygLOYUTWiQS8XR3pX8Gj7sEa4DQ9kofSkEcVNHBp8c7CGIwv
         7YAmB9Pdwq0kt57j0goUMEMKkA7CsJyYvwpk0tTDsjXiUR+/re4V8Q5r921l8UNzbfW4
         TQEx1HbYgKsc3G5ozZWxGbKZ987TOvtf7PiYX9rFXukRDnCn3TOUc3/iWiyf7ptCk3o6
         QqQA==
X-Gm-Message-State: AOJu0YwXl/04Ce0OQfF7lyTUjBmhfTA7AiI054q/B+aiAGChw/XOV0cV
	tcTVsh8aQrPFmxNgKVA9eHzTTamu47CfLb/wXkAIiZ2WVXdOYdDvUkMNZ0EcYcs3+Yp60mZieMW
	AO+s=
X-Google-Smtp-Source: AGHT+IFe7KztReL9o9FRCWcN/0zxSQBHRsbwtcFd3nW1PWonBE8wsgf1Kph6cgztxQYsbU2E8KT7AQ==
X-Received: by 2002:a05:620a:56c5:b0:787:2ba4:c546 with SMTP id wh5-20020a05620a56c500b007872ba4c546mr6027172qkn.58.1708867094605;
        Sun, 25 Feb 2024 05:18:14 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id vq18-20020a05620a559200b00787c4a07c41sm1306065qkn.42.2024.02.25.05.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 05:18:14 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 166C71068A9; Sun, 25 Feb 2024 03:18:13 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 25 Feb 2024 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 25 Feb 2024 03:18:13 -1000
Message-Id: <20240225131813.166C71068A9@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196140

Branch: kirkstone

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 50 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-36648 (CVSS3: 10.0 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36648 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0687 *
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
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go:nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-45803 (CVSS3: 4.2 MEDIUM): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45803 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-47100 (CVSS3: 9.8 CRITICAL): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47100 *
CVE-2023-47470 (CVSS3: 7.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47470 *
CVE-2023-48795 (CVSS3: 5.9 MEDIUM): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *
CVE-2023-50387 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-50387 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-52355 (CVSS3: 7.5 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52355 *
CVE-2023-52356 (CVSS3: 7.5 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52356 *
CVE-2023-52425 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52425 *
CVE-2023-52426 (CVSS3: 5.5 MEDIUM): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52426 *
CVE-2023-5380 (CVSS3: 4.7 MEDIUM): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5380 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-6277 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6277 *
CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6683 *
CVE-2023-6693 (CVSS3: 5.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6693 *
CVE-2023-6779 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6779 *
CVE-2023-6816 (CVSS3: 9.8 CRITICAL): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6816 *
CVE-2023-7216 (CVSS3: 8.8 HIGH): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *
CVE-2024-0408 (CVSS3: 5.5 MEDIUM): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0408 *
CVE-2024-0409 (CVSS3: 7.8 HIGH): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0409 *
CVE-2024-1048 (CVSS3: 3.3 LOW): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-1048 *
CVE-2024-22667 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22667 *
CVE-2024-22860 (CVSS3: 9.8 CRITICAL): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22860 *
CVE-2024-22861 (CVSS3: 7.5 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22861 *
CVE-2024-22862 (CVSS3: 9.8 CRITICAL): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22862 *

Summary of CVE counts by recipe:
  qemu:qemu-native:qemu-system-native: 7
  ffmpeg: 5
  tiff: 5
  go: 4
  xwayland: 4
  rpm:rpm-native: 3
  webkitgtk: 3
  expat:expat-native: 2
  glibc: 2
  gnupg:gnupg-native: 2
  grub:grub-efi:grub-native: 2
  bind: 1
  cpio: 1
  go:nghttp2: 1
  libssh2:libssh2-native: 1
  openssh: 1
  perl:perl-native: 1
  pixman:pixman-native: 1
  python3:python3-native: 1
  python3-urllib3: 1
  vim: 1
  xserver-xorg: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

