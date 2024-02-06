Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67635C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 12:05:55 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.19845.1707221150926635055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 04:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=Wii4ad3K;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40fc654a718so35668825e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 04:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707221149; x=1707825949; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:cc:organization:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5fMQmBb8SlQAG+lk7gPeCX+jORUM7wwufsqklmVMfxo=;
        b=Wii4ad3Kmwh7uP+k8YWVSacHcPSpuZWOUi02VxM0dSwZDM5pzzDtn9pgu7hH0Yelwy
         EQH7BIDJuLMThgulRtMTcFQVRXdxVmXOMrO5L0GkoeEWdLsS7ySiDDGr6PR9r3DHY2pV
         NlG39WveQ/Q+3piGi/66n053YHVJFyivOMyD/GJowrO49ynzvu4PW2DcxKxesnHk/SeD
         +2a14x7SvdOQayxPKDeVGMO6nKa6UEmdkVoD0dIiaVNPHbmwiESStpDzaxDpCoUxo/NL
         Bd/msnlmwMEKkQayPZh1kbHQ5uAOIyufZTV6zmzNSK/jmy1/oLeq6z4zwBbkWuQ0c7LM
         sSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707221149; x=1707825949;
        h=content-transfer-encoding:in-reply-to:cc:organization:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fMQmBb8SlQAG+lk7gPeCX+jORUM7wwufsqklmVMfxo=;
        b=hwPw0uGQTPZpN8iyURc0wyqIjyrKnQ7WIXBwt9ZBXgfDC8UOf67KrVo43CbU++fEym
         EgU/7gQSDvIojW7PlZ6EuDSSRK8YhKur/1zgcHjIc4Zhq/FOthr4brwJ3bqmrl2zLzt8
         s26hlplAxzErfBpnAjVUOSK0nWvEpIxqjIY5andssEO+6mW99XLhh3mwh73sDG9lE9jz
         6f2psweobigH90VBpKJ2XR74SGvVzEgMmQTvpVANo49EGD9neebSVgrlHMya7neKfq+z
         G37HCH3AVh3YxfBFwxjk++89HsZrVVoCcCegLoQBhnSrUt8Zn8X9bb85nO4thz8jdnzY
         VMfA==
X-Gm-Message-State: AOJu0Yxbo1L9PWYsQYUz2a1MLD1jHxMhenoYTLyosSXX08AQqCYUrO+2
	h+qIi9Nb8MAAOv3HWTTQymioUo2sAlX6Wq6x9T9DqSqw+X1tA/edKt9MbgdRZuMP8mlO81ikRCo
	qRFCvaA==
X-Google-Smtp-Source: AGHT+IGdOyDXN4OA7hrLjboMDuOqiEI1WFG01EEbMKc0xrJ2Sxz3c5LgpwaQd+iqlxYmAE2B4MgS4g==
X-Received: by 2002:a05:600c:3554:b0:40f:c3ca:713c with SMTP id i20-20020a05600c355400b0040fc3ca713cmr1882235wmq.36.1707221148780;
        Tue, 06 Feb 2024 04:05:48 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWGxK3dc2tsRcO5sEudq12iW0nx8k6/znYZ05ucV/m7OA0iuchi/6NkZBxe4n/cqbrhfVosi6ntRt3D0/5zH6+f/Qwq8OFrm3cmnxvId/o20pIARq0HnlJc
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b0040e813f1f31sm1827493wmf.25.2024.02.06.04.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 04:05:48 -0800 (PST)
Message-ID: <88efbec2-64a3-48bd-b8e6-f892e93a36d2@smile.fr>
Date: Tue, 6 Feb 2024 13:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 04 Feb
 2024 01:00:01 AM HST
Content-Language: en-US
To: yocto-security@lists.yoctoproject.org,
 openembedded-core@lists.openembedded.org
References: <20240204111915.5CBD9106938@builder.sakoman.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
Cc: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>
In-Reply-To: <20240204111915.5CBD9106938@builder.sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 12:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194990

Hi,

Here is my analysis of this list of CVEs
(except linux-yocto which is well handled by Ross's script)

I've marked my planned actions with "=>" (I've got 2 days available for this).
Ping me (here or on IRC (@yocton) ) if you want to help :)

Le 04/02/2024 à 12:19, Steve Sakoman a écrit :
> Branch: master
> 
> Full list:  Found 52 unpatched CVEs
That's 24 !linux-yocto CVEs

> CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
Ticket still open upstream https://dev.gnupg.org/T5993 => Patch in review https://dev.gnupg.org/D556

> CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
Ticket still open upstream https://bugzilla.nasm.us/show_bug.cgi?id=3392814

> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
Note: Redhat attributed a 3.3 LOW CVSS3 score.
This vuln depends on a config (CONFIG_NET_9P) not enabled in linux-yocto guests (This is a paravirtualized file-system)
Upstream bug is https://github.com/v9fs/linux/issues/29 (still open, no patch)

> CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25584 *
Merged fix in https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=77c225bdeb410cf60da804879ad41622f5f1aa44
Present in binutils >=2.40, gdb 13.1, 13.2, 14.1
OE-Core : binutils = 2.42, gdb 14.1
=> Ping NVD + CVE_STATUS?

> CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
fixes merged :
https://github.com/qemu/qemu/commit/9050f976e447444ea6ee2ba12c9f77e4b0dc54bc
https://github.com/qemu/qemu/commit/7d0fefdf81f5973334c344f6b8e1896c309dff66
Present in >= 8.2.0 (OE-core qemu = 8.2.1)
=> Ping NVD + CVE_STATUS?

> CVE-2023-3164 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3164 *
Upstream issue https://gitlab.com/libtiff/libtiff/-/issues/542 closed as ""wontfix-unmaintained""
Only affect the tiffcrop tool not compiled by default since 4.6.0 (OE-Core = 4.6.0)
=> Ping NVD + CVE_STATUS?

> CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
Fix https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=d81b82c70bc1
Present in >= 10.02.0 (OE-core ghostscript = 10.02.1)
=> Ping NVD + CVE_STATUS?

> CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
Upstream bug still open https://bugs.busybox.net/show_bug.cgi?id=15865
> CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
Upstream bug still open https://bugs.busybox.net/show_bug.cgi?id=15868
> CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
Upstream bug still open https://bugs.busybox.net/show_bug.cgi?id=15871 
> CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
Patch available (not merged yet) : 
Attachment 9697 Details for Bug 15874 – [PATCH] awk.c: fix CVE-2023-42366 (bug #15874)
https://bugs.busybox.net/attachment.cgi?id=9697&action=edit

> CVE-2023-4692 (CVSS3: 7.8 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4692 *> CVE-2023-4693 (CVSS3: 4.6 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4693 *
(In NTFS support) Fix merged : e58b870ff926415e23fc386af41ff81b2f588763 + 6 parents , released in 2.12
OE-Core grub = 2.12
=> Ping NVD + CVE_STATUS?

> CVE-2023-48795 (CVSS3: 5.9 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
> CVE-2023-51384 (CVSS3: 5.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51384 *
> CVE-2023-51385 (CVSS3: 6.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51385 *
Fix in OE-core is in review : https://lists.openembedded.org/g/openembedded-core/topic/103546397#193372

> CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5088 *
Fix merged https://github.com/qemu/qemu/commit/7d7512019fc40c577e2bdd61f114f31a9eb84a8e 
Present in >=8.2.0 (OE-core qemu = 8.2.1)
=> Ping NVD + CVE_STATUS?

> CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
"openssh: authentication bypass via row hammer attack""
Upstream bug : https://bugzilla.mindrot.org/show_bug.cgi?id=3656 
Real-world impacts seem quite low

> CVE-2023-52355 (CVSS3: 7.5 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52355 *
Upstream issue https://gitlab.com/libtiff/libtiff/-/issues/621
Closed with a doc patch only
=> This one is here to stay? (Dev & security people don't seem to agree on what constitute a vulnerability)

> CVE-2023-52356 (CVSS3: 7.5 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52356 *
Fix https://gitlab.com/libtiff/libtiff/-/commit/51558511bdbbcffdce534db21dbaf5d54b31638a (no release yet)
=> backport?

> CVE-2023-6246 (CVSS3: 7.8 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6246 *
Fix posted on OE-Core nanbield (but not master?) https://lists.openembedded.org/g/openembedded-core/message/194527 
=> update stable branch + CVE_STATUS + Ping NVD?

> CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6683 *
Patch posted : [PATCH] ui/clipboard: avoid crash upon request when clipboard peer is no
https://lists.nongnu.org/archive/html/qemu-devel/2024-01/msg02382.html
not merged yet

> CVE-2023-6693 (CVSS3: 5.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6693 *
Fix merged https://gitlab.com/qemu-project/qemu/-/commit/2220e8189fb94068dbad333228659fbac819abb0 
not released yet
=> backport?

> CVE-2024-0727 (CVSS3: 5.5 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0727 *
Fix already merged https://git.yoctoproject.org/poky/commit/?id=670bc40b695dcafc14832ccb318044d08e832aac

-- 
Yoann Congal
Smile ECS - Tech Expert

