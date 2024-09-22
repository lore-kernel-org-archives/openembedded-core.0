Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B59CF9C69
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 08:17:44 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.11457.1726993054518054683
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 01:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MaCes/5E;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-536748c7e9aso4192122e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 01:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726993053; x=1727597853; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cdpkwwnxDVQ6qyM7S3YEW4PguzCuwplaUl3beKxW3LQ=;
        b=MaCes/5EZ4cCC/fT9rhl6YLqp/uD8di7abKmPARRegeTYRtaxWwQr46lfDOVqIo5dh
         yJD2TlVdMpRKcAFmp3zZ7AwCKXdPBTJvn/Ij4u87xulypCGu3IDCBAMGPHbIzDfRy1XB
         3WrkuK7QGKxwPdDoUncNZljsuW36YeU0YZXAg44iq1ZTmXb85bUZic3+kNFk67+19KuA
         scq0vUynXmqhi7/uBoTyIQV1M64c+Imk8Eqza9Hj78TMXW+4SiLmE68v2CjQgoVnv0p2
         egMmKujK30KJT6hRApFqRP0Am7VKGgnGASRY8bN0RBGwMRfrVd/HsmScg1j+ZvDDgdud
         tDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726993053; x=1727597853;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdpkwwnxDVQ6qyM7S3YEW4PguzCuwplaUl3beKxW3LQ=;
        b=i2wwrCp+fd5JcGGfNM1DgH3WH14Ud9raoPd8leZZX5wLaUF8yiX7/AzOmLBVOQO01i
         CdspIYY4M4Dvm+xCexaakRLtF9ojPN5wyOWQwVUhUe9L3bleJmhKtiDYlyyiEfffk8pe
         3xuSGouGpEVM51TLCvDTcGNSKWioJYZXKd6EYwdEVKPVuMT3GiO+JZ81K3DULWyT0/0C
         S978uD02FRiN1/zyxJuRdgDCHH33q2YV30I8EGDlP/yfWrvBJqz9wlxOyRhIAXIL06bP
         UYcqq84rzg+XUJ6iJS5X8CVV0o35IDGs13GQrZbDEI+3A4qnWQhQZbkSJOuIV/eLhKKz
         GU6w==
X-Gm-Message-State: AOJu0YyXQYUYI6N6ZtnDjb9qIsQa2uFRFZWjc9N7kFewL0gm0FWqTETl
	AEUhkGTQlU3+G3PmEtFc1yZkePSO2gUaG8LlxAz9NubouNC32MNKi+OrihUwVOoFvSXBHQUcbsV
	AFLg=
X-Google-Smtp-Source: AGHT+IE3msNs6cdX/edWEG2+MiybsHtcoVmnMuU/DaXmDm81k6onjEgRzAmmlXCNUmjZtV+fnN46Eg==
X-Received: by 2002:a05:6512:1393:b0:52c:86d7:fa62 with SMTP id 2adb3069b0e04-536ac2e5b85mr3500788e87.23.1726993052395;
        Sun, 22 Sep 2024 01:17:32 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870968dcsm2852904e87.166.2024.09.22.01.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:17:30 -0700 (PDT)
Date: Sun, 22 Sep 2024 11:17:29 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 00/12] systemd uki support
Message-ID: <Zu_SmUhLMEpRd6oq@nuoska>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
 <6c93960c9a6461991a3d8b6d98f2419b3b66d699.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c93960c9a6461991a3d8b6d98f2419b3b66d699.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204771

Hi,

On Fri, Sep 20, 2024 at 08:26:30AM +0100, Richard Purdie wrote:
> On Thu, 2024-09-19 at 17:36 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > These changes enable building systemd uki images which combine
> > kernel, kernel command line, initrd and possibly signatures to
> > a single UEFI binary. This binary can be booted with UEFI firmware
> > and systemd-boot. No grub is needed and UEFI firmware and/or
> > systemd-boot provide possibilities for boot menus.
> > The uki binary can also be signed for UEFI secure boot
> > so the secure boot extends from firmware to kernel and initrd.
> > Binding secure boot to full userspace is then easier since for example
> > kernel command line and initrd contain the support needed to mount
> > encrypted dm-verity etc partitions, and/or create partitions on demand
> > with systemd-repart using device specific TPM devices for encryption.
> > 
> > Tested on qemuarm64-secureboot machine from meta-arm with changes to
> > support secure boot. Slightly different configuration tested on
> > multiple arm64 System Ready boards with UEFI firmware, real and firmware
> > based TPM devices. Tested with ovmf firmware on x86_64 with selftests but
> > without secure boot which seems to be harder to setup in ovmf.
> > 
> > Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu and
> > wic.Wic2.test_expand_mbr_image, failing when executing all wic selftests
> > on a build machine with zfs filesystem. Will investigate this further.
> > The issue seems to be in mkfs.ext4 producing broken filesystem, and partially
> > in the tests which don't run the correct rootfs file (.ext4 vs .wic).
> > Will debug this further and it is IMO unrelated to these changes since
> > they reproduce on pure master branch without this series.
> > 
> > v3: rebased, fixed and added more sefltests, removed wic plugin side uki
> > support
> > 
> > v2: https://lists.openembedded.org/g/openembedded-core/message/204090
> > 
> > Michelle Lin (1):
> > � uki.bbclass: add class for building Unified Kernel Images (UKI)
> > 
> > Mikko Rapeli (11):
> > � python3-pefile: add recipe from meta-openembedded
> > � maintainers.inc: add python3-pefile
> > � systemd-boot-native: add runtime dependency to python3-pefile-native
> > � image_types_wic.bbclass: set systemd-boot and os-release dependency
> > ��� for all archs
> > � wic bootimg-efi.py: keep timestamps and add debug prints
> > � wic bootimg-efi.py: change UKI support from wic plugin to uki.bbclass
> > � oeqa selftest uki.py: add tests for uki.bbclass
> > � oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
> > � oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi
> > ��� test
> > � oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
> > � oeqa selftest wic.py: support UKIs via uki.bbclass
> > 
> > �meta-selftest/wic/test_efi_plugin.wks�������� |�� 5 +-
> > �meta/classes-recipe/image_types_wic.bbclass�� |�� 5 +-
> > �meta/classes-recipe/uki.bbclass�������������� | 197 ++++++++++++++++++
> > �meta/conf/distro/include/maintainers.inc����� |�� 1 +
> > �.../oeqa/selftest/cases/efibootpartition.py�� |� 11 +-
> > �meta/lib/oeqa/selftest/cases/uki.py���������� | 138 ++++++++++++
> > �meta/lib/oeqa/selftest/cases/wic.py���������� |� 58 ++++--
> > �.../systemd/systemd-boot-native_256.5.bb����� |�� 2 +
> > �.../python/python3-pefile/run-ptest���������� |�� 3 +
> > �.../python/python3-pefile_2023.2.7.bb�������� |� 28 +++
> > �.../wic/canned-wks/efi-uki-bootdisk.wks.in��� |�� 3 +
> > �scripts/lib/wic/plugins/source/bootimg-efi.py | 187 +++++------------
> > �12 files changed, 481 insertions(+), 157 deletions(-)
> > �create mode 100644 meta/classes-recipe/uki.bbclass
> > �create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
> > �create mode 100644 meta/recipes-devtools/python/python3-pefile/run-ptest
> > �create mode 100644 meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
> > �create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
> 
> In addition to the other recipe issue, I also noticed selftest failing:
> 
> https://valkyrie.yoctoproject.org/#/builders/35/builds/142/steps/14/logs/stdio
> 
> "runqemu - ERROR - Can't handle two unknown args: None qemux86-64"
> 
> (all the selftest targets failed, this is one example)

Sorry about this too. Will add an 'or ""' to the amended runqemu variables.

Cheers,

-Mikko

