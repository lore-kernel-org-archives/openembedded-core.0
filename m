Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71479C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 14:32:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.21790.1707316318310659391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 06:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=sagsqabl;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40fe282b8adso5400355e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 06:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707316316; x=1707921116; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u/N6pnwYkFRA4I+m9OmtoX7KP3yR+qtk9h/5e9LsKuE=;
        b=sagsqablQSRUpERLy/yHGGMMbjZTzbENXrUKbV3Vu4AYRbmmWekk49Bw/KV8HEV832
         rsgpw7Mad0KiiVou0DoCAbz+0guF+ELPdAqH7Qfpr50QmwSYoHqGYgy9qiG8UdHnCH3t
         3zaWs1VeOjSO1iEcERVWlDWJ1P8ila/mxhOcjrXDCdKbZBoMVJ2QiAsT3TFKEg7uzSR4
         +dnP3juRGmtvvgzdBtCrfXqAbswwmLBfG5SMBlTp40vv7TtFlbztKOEbd1e77qnuBDrT
         4tktaiDacfZPf8UFFvW2/TcJ6NOLg8ZGJ+Q19RgjS3ivs4A9uUpZPNdBoZLDesT1ZsRK
         SH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707316316; x=1707921116;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/N6pnwYkFRA4I+m9OmtoX7KP3yR+qtk9h/5e9LsKuE=;
        b=TsnjF9tW1E7fYdreXY2Cl5L0SLsHAK4pcgqEOXDWVftJkgQLc3Nx8Ga8g574n6a9SB
         vJEUKSHOZuNNg0SAi7HXhpZgZjL6uvQQcbQa+Ui0PVZT7rXM0BiuCAZfXKHe7X1ADvwb
         hgXt7IlowKgiR0PkvWBDUzgPs+9ApRgzdB+cpeY7CbO4S8ufKVyY5Urdqt7Fp5bwZ6A3
         WY2EVkGlC8q/iqqCIew1dhv+Xe/KsRpt6gYHetrak3FXNBuTUR4rIVVttwBPL4i6xKmX
         cahEgtdXK8CCEmCCl3bXYvFI0UzsZYm5fT8pNpLHeVng+yW0UjVcR41IE1mcZLYnllqd
         UNLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgLf8MF+UANKYMLU/KcDsyvSl+M7PVP+ilgze75GDSHwD0NqszSQG4YsBaimxMduOPpASIBlHsD+NArveT+uGgj4P1gjv0x0DBUPJgQcUn1AwzDrcNfDDo
X-Gm-Message-State: AOJu0Yw9CPM7kIQJ4+8GxvHxf+ACNWLSWMnPP9xtHm478RgwxEbBGSQ2
	L0XuJSBkuc1xE1NExaJT8DD54v0iJcAkuyX+FyEst21g3iDVDn14oOIsQ/7z9f0=
X-Google-Smtp-Source: AGHT+IEc4nCCjX97ItAWr1KlmUbJXlYvrtIZP7bU7DigJGPgJklijF92GMm//rtA3CbaVMCqTRP1Ig==
X-Received: by 2002:adf:f412:0:b0:33a:e51e:ddaf with SMTP id g18-20020adff412000000b0033ae51eddafmr3680069wro.27.1707316316095;
        Wed, 07 Feb 2024 06:31:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfgrUfa94SssiiQk26yP/oReZk4sq+TGAH3vm/AcY9gyJ71uWkrZOWpOEB5aW7MvRVwTu8JGAG+2W+AztAsK9deVH7t9fCpQkDqSc+36+pV8hcqr5l2Nk8nR+S6mwfkla79DgRL6tkOI7sM3iu
Received: from [10.1.8.13] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id b14-20020adfee8e000000b0033af4848124sm1626587wro.109.2024.02.07.06.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 06:31:55 -0800 (PST)
Message-ID: <416230d2-f5c2-4f0d-b809-bd21d2c383a0@smile.fr>
Date: Wed, 7 Feb 2024 15:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 04 Feb
 2024 01:00:01 AM HST
From: Yoann Congal <yoann.congal@smile.fr>
To: yocto-security@lists.yoctoproject.org,
 openembedded-core@lists.openembedded.org
Cc: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>,
 Ross Burton <Ross.Burton@arm.com>
References: <20240204111915.5CBD9106938@builder.sakoman.com>
 <88efbec2-64a3-48bd-b8e6-f892e93a36d2@smile.fr>
Content-Language: en-US
Organization: Smile ECS
In-Reply-To: <88efbec2-64a3-48bd-b8e6-f892e93a36d2@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 14:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195066

Hi,

Here is a status update on sunday's CVEs:

Ross, I've added relevant one to https://wiki.yoctoproject.org/wiki/CVE_Status

Le 06/02/2024 à 13:05, Yoann Congal a écrit :
> Hi,
> 
> Here is my analysis of this list of CVEs
> (except linux-yocto which is well handled by Ross's script)
> 
> I've marked my planned actions with "=>" (I've got 2 days available for this).
> Ping me (here or on IRC (@yocton) ) if you want to help :)
> 
> Le 04/02/2024 à 12:19, Steve Sakoman a écrit :
>> Branch: master
>>
>> Full list:  Found 52 unpatched CVEs
> That's 24 !linux-yocto CVEs
> 
>> CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
> Ticket still open upstream https://dev.gnupg.org/T5993 => Patch in review https://dev.gnupg.org/D556
> 
>> CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
> Ticket still open upstream https://bugzilla.nasm.us/show_bug.cgi?id=3392814
> 
>> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
> Note: Redhat attributed a 3.3 LOW CVSS3 score.
> This vuln depends on a config (CONFIG_NET_9P) not enabled in linux-yocto guests (This is a paravirtualized file-system)
> Upstream bug is https://github.com/v9fs/linux/issues/29 (still open, no patch)
> 
>> CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25584 *
> Merged fix in https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=77c225bdeb410cf60da804879ad41622f5f1aa44
> Present in binutils >=2.40, gdb 13.1, 13.2, 14.1
> OE-Core : binutils = 2.42, gdb 14.1
> => Ping NVD + CVE_STATUS?

NVD CPE update request sent

>> CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
> fixes merged :
> https://github.com/qemu/qemu/commit/9050f976e447444ea6ee2ba12c9f77e4b0dc54bc
> https://github.com/qemu/qemu/commit/7d0fefdf81f5973334c344f6b8e1896c309dff66
> Present in >= 8.2.0 (OE-core qemu = 8.2.1)
> => Ping NVD + CVE_STATUS?

NVD CPE update request sent


>> CVE-2023-3164 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3164 *
> Upstream issue https://gitlab.com/libtiff/libtiff/-/issues/542 closed as ""wontfix-unmaintained""
> Only affect the tiffcrop tool not compiled by default since 4.6.0 (OE-Core = 4.6.0)
> => Ping NVD + CVE_STATUS?

NVD CPE update request sent

>> CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
> Fix https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=d81b82c70bc1
> Present in >= 10.02.0 (OE-core ghostscript = 10.02.1)
> => Ping NVD + CVE_STATUS?

NVD CPE update request sent

>> CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
> Upstream bug still open https://bugs.busybox.net/show_bug.cgi?id=15865
>> CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
> Upstream bug still open https://bugs.busybox.net/show_bug.cgi?id=15868
>> CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
> Upstream bug still open https://bugs.busybox.net/show_bug.cgi?id=15871 
>> CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
> Patch available (not merged yet) : 
> Attachment 9697 Details for Bug 15874 – [PATCH] awk.c: fix CVE-2023-42366 (bug #15874)
> https://bugs.busybox.net/attachment.cgi?id=9697&action=edit
> 
>> CVE-2023-4692 (CVSS3: 7.8 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4692 *>> CVE-2023-4693 (CVSS3: 4.6 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4693 *
> (In NTFS support) Fix merged : e58b870ff926415e23fc386af41ff81b2f588763 + 6 parents , released in 2.12
> OE-Core grub = 2.12
> => Ping NVD + CVE_STATUS?

NVD CPE update request sent


>> CVE-2023-48795 (CVSS3: 5.9 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
>> CVE-2023-51384 (CVSS3: 5.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51384 *
>> CVE-2023-51385 (CVSS3: 6.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51385 *
> Fix in OE-core is in review : https://lists.openembedded.org/g/openembedded-core/topic/103546397#193372
> 
>> CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5088 *
> Fix merged https://github.com/qemu/qemu/commit/7d7512019fc40c577e2bdd61f114f31a9eb84a8e 
> Present in >=8.2.0 (OE-core qemu = 8.2.1)
> => Ping NVD + CVE_STATUS?

NVD CPE update request sent

>> CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
> "openssh: authentication bypass via row hammer attack""
> Upstream bug : https://bugzilla.mindrot.org/show_bug.cgi?id=3656 
> Real-world impacts seem quite low
> 
>> CVE-2023-52355 (CVSS3: 7.5 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52355 *
> Upstream issue https://gitlab.com/libtiff/libtiff/-/issues/621
> Closed with a doc patch only
> => This one is here to stay? (Dev & security people don't seem to agree on what constitute a vulnerability)
> 
>> CVE-2023-52356 (CVSS3: 7.5 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52356 *
> Fix https://gitlab.com/libtiff/libtiff/-/commit/51558511bdbbcffdce534db21dbaf5d54b31638a (no release yet)
> => backport?

Simone Weiß sent a patch (thanks!) : https://lists.openembedded.org/g/openembedded-core/message/195011

>> CVE-2023-6246 (CVSS3: 7.8 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6246 *
> Fix posted on OE-Core nanbield (but not master?) https://lists.openembedded.org/g/openembedded-core/message/194527 
> => update stable branch + CVE_STATUS + Ping NVD?

Fixed on glibc 2.39 and we updated this week :)


>> CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6683 *
> Patch posted : [PATCH] ui/clipboard: avoid crash upon request when clipboard peer is no
> https://lists.nongnu.org/archive/html/qemu-devel/2024-01/msg02382.html
> not merged yet
> 
>> CVE-2023-6693 (CVSS3: 5.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6693 *
> Fix merged https://gitlab.com/qemu-project/qemu/-/commit/2220e8189fb94068dbad333228659fbac819abb0 
> not released yet
> => backport?

Fix was backported upstream in 939a09575fff7048446e36ce438fa7be6e251d41 in v8.2.1
CPE change request sent to NVD

>> CVE-2024-0727 (CVSS3: 5.5 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0727 *
> Fix already merged https://git.yoctoproject.org/poky/commit/?id=670bc40b695dcafc14832ccb318044d08e832aac

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

