Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF1AD0BB73
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 08:55:16 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.10156.1729760114461267935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 01:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HnL+x3bO;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e690479cso675372e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 01:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729760112; x=1730364912; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hmw971Ke4J7vWXxrwr2m9HFSe/lreQzSDzQOOj2k60E=;
        b=HnL+x3bODGSUidDkrUgBbSjaztTTz2wgsaiaz2b/EffkoiB3WA9qGUrn4qQcuux0sT
         Q+AA0u04C0pX95CQ7PxWIVNG9Pf2OoRpvzhAxdPzi6LJNZnDQQsBSs//6pwZNLDQfnmG
         ElhPwk/Rvh6vpNzUM+OcWmvRK2HU/+dd5wrgWWkDKI+1MQo1oQDJgDAO/8/d6NDIj89t
         gW8gYW3CDX7ZtB+1GaHtyOWoGVK75JMJBw6X4L83QFiQYTLyDrCPdrJTzsJWPd69eQO4
         O6k8Q9JBf30gf/NHmlenNMIF3GgNKItPCiEurJYG9q8QC54l60Gn3jv37OZZA/auyoEc
         HDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760112; x=1730364912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hmw971Ke4J7vWXxrwr2m9HFSe/lreQzSDzQOOj2k60E=;
        b=v8OIxJZ6G/+6mMQCIMhUbt29i9IQBPTZp8FMgDB0xH1u0taFRsFRSqpq6X6HIb209w
         UZjK7wIbipFtcyIwLnsWO+vqyI6lmauWt1pw4OlXcEUT/wsCr2H171phtRcQbRNeYhaB
         TDxGc1sBXTeH+ql/Kuo+BYexiHWccxytYQ+PE3yCIPrZTWWNhkutQJiXp4CrLP8Ha89L
         hu7Hqoc/nrtpwZhiPLPYG3phmk7dgC9tt5CIVZyrqoivPAUSxd7VnZs4dlLr72Gd0ZuX
         iD1kieGNIKcCT1q/me8FdyxvTUCkPfiNtFFadSgwvBMSB/AanQ1hl219NQQcSvIkphdg
         zHqA==
X-Gm-Message-State: AOJu0YxgWivDHWfAyMbaIoieiAaQ/qMoxhKIoZ6ulWYakw5+1TP9AwJz
	vzbFBhqqE3OEn01S8k5TI+g2K6/ytBWosB9E6FXvureZJBEiWT25KkcukzphLcms9SBR/E28Y/M
	Z0qs=
X-Google-Smtp-Source: AGHT+IGTG8Nr04noruIbFgTfJUCF6sLdJwRc7nWkMjcOH9t5qKDuqZDlKL9vPrcc4WXhdnjOrNdtbw==
X-Received: by 2002:a05:6512:118a:b0:539:d428:fbd1 with SMTP id 2adb3069b0e04-53b1a375b3fmr2975564e87.55.1729760112396;
        Thu, 24 Oct 2024 01:55:12 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223eff63sm1300367e87.92.2024.10.24.01.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:55:11 -0700 (PDT)
Date: Thu, 24 Oct 2024 11:55:08 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v10 0/9] systemd uki support
Message-ID: <ZxoLbNm2VEkRw78N@nuoska>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
 <180122B0064457FF.13420@lists.openembedded.org>
 <180123793D1D4B45.13420@lists.openembedded.org>
 <b999ba968f3c9dea9d3a1ba03d73a1d5ae8d56a3.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b999ba968f3c9dea9d3a1ba03d73a1d5ae8d56a3.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 08:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206281

On Wed, Oct 23, 2024 at 07:39:51PM +0100, Richard Purdie wrote:
> On Wed, 2024-10-23 at 17:58 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2024-10-23 at 17:44 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Wed, 2024-10-23 at 15:08 +0300, Mikko Rapeli via
> > > lists.openembedded.org wrote:
> > > > These changes enable building systemd uki images which combine
> > > > kernel, kernel command line, initrd and possibly signatures to
> > > > a single UEFI binary. This binary can be booted with UEFI
> > > > firmware
> > > > and systemd-boot. No grub is needed and UEFI firmware and/or
> > > > systemd-boot provide possibilities for boot menus.
> > > > The uki binary can also be signed for UEFI secure boot
> > > > so the secure boot extends from firmware to kernel and initrd.
> > > > Binding secure boot to full userspace is then easier since for
> > > > example
> > > > kernel command line and initrd contain the support needed to
> > > > mount
> > > > encrypted dm-verity etc partitions, and/or create partitions on
> > > > demand
> > > > with systemd-repart using device specific TPM devices for
> > > > encryption.
> > > > 
> > > > Tested on qemuarm64-secureboot machine from meta-arm with changes
> > > > to
> > > > support secure boot. Slightly different configuration tested on
> > > > multiple arm64 System Ready boards with UEFI firmware, real and
> > > > firmware
> > > > based TPM devices. Tested with ovmf firmware on x86_64 with
> > > > selftests but
> > > > without secure boot which seems to be harder to setup in ovmf.
> > > > 
> > > > Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu
> > > > and
> > > > wic.Wic2.test_expand_mbr_image, failing when executing all wic
> > > > selftests
> > > > on a build machine with zfs filesystem. Will investigate this
> > > > further.
> > > > The issue seems to be in mkfs.ext4 producing broken filesystem,
> > > > and
> > > > partially
> > > > in the tests which don't run the correct rootfs file (.ext4 vs
> > > > .wic).
> > > > Will debug this further and it is IMO unrelated to these changes
> > > > since
> > > > they reproduce on pure master branch without this series.
> > > > 
> > > > v10: disabled kvm support in new tests since it breaks qemu boot
> > > > on
> > > > aarch64
> > > > ���� build machine, removed "testimage" from IMAGE_CLASS as well
> > > > since
> > > > ���� can end up testing qemu machine during build.
> > > 
> > > I hate to say this but
> > > wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64 is still
> > > failing:
> > > 
> > 
> > https://valkyrie.yoctoproject.org/#/builders/23/builds/320/steps/14/logs/stdio
> 
> and:
> 
> https://valkyrie.yoctoproject.org/#/builders/23/builds/323/steps/14/logs/stdio
> 
> which is clearer without the other failure.

Comparing x86_64 and aarch64 build host runqemu command lines from
wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64 selftest,
two things pop up.

aarch64 still enables KVM via "-enable-kvm". This is despite QEMU_USE_KVM = ""
in the bitbake build config. Oh, this is only applied to the build configuration
and bitbake build command but removed before runqemu is called. I can try to apply
this config also for runqemu. This pattern is used in several tests. Build config
is set temporarily and then removed before calling runqemu. I'll send a separate
patch to master-next to reduce spam.

aarch64 host uses "-cpu host" with qemu while x86_64 sets the CPU variant explicitly
to "-cpu cortex-a76". I can't see from build logs which CPU variant the
host really is. There are a lot of CPU variants in aarch64 world and I don't think
they are all compatible, or detect CPU features at runtime which can impact
things like firmware code badly. I don't know how to fix this.

Cheers,

-Mikko

