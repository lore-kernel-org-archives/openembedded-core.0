Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F302AC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 09:32:07 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.18144.1742981524660817700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 02:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YME5lo9u;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c07cd527e4so611567585a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 02:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742981523; x=1743586323; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=COJmR38RDTej9bPfHU4XKQLzM47Q3sACj/vTwZOm1cY=;
        b=YME5lo9u3o7ZRw9lid6qKL5n7Ll5mAQmCD1x8tMN2WVBNXRq0pgWHs/RtOubnZUJq7
         rUtZjknfxIHXn1CAvRw2HbPJ8LSJ71+qyskdpj34gtxsGR28UdvZUYRHgdX+Upq0jis6
         gxIGy81VD4LdjCThuNgfXvblGKYblhTCTUMLgfOgRwf/cgPwPR9rbAkZfLRu60r0/FaT
         1ibFgvbE3LoljL6UKQTtpTb89pGXAsZ5pY3S61g/2z21vfMdyvCHdoAFQTy2jorM4d5A
         m2LxzNJZekNIZ/nm6Lw17YYJ/0cNgoF7Q4BZX9FuUbav6ZAxv1zVnstNR7v7IlIRsHAb
         Qy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742981523; x=1743586323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COJmR38RDTej9bPfHU4XKQLzM47Q3sACj/vTwZOm1cY=;
        b=c8wYK7zEs4RVY+AhVyQnBOa1ANfBODDy0SToPuvX+LiOnXQ/CzP+my5/EJ4C5bb2J+
         6AblNECUvKWAawGOdfFPK7v227wG1IA5Q0ts+ITC4eojDcniQcF9tsngToU3M1OXugev
         5piYWGE0Z2AhJzpSouwnnZpnEvatcSRJyH2NhNDfq7pYzlyR8F9MpL+TRw3yYsYNjWv0
         rlT1MPhB6fvdcH4mTH/Hosd7dCHpuHx3XZUdgDfF1eHrlHxvIlP9Ky1bQbeZ04EiZZHb
         Gr2O9hky4GxI2LYY7dYP2HHG4EVXFxsZZ4nAF1pAmDj6KTtNYbIdcobkwEEKGwx3MCIb
         jiMQ==
X-Gm-Message-State: AOJu0YzCEktBOtyD2tA7QaCIXlciXSJTj7OyQXLy7ceTdpOiF+vOBFfr
	igiWGCuhdOCCUK8Qw1feQvdGQn8VeD9cpLI9vNet0TXbuC3ehkyW80yv9qoMLj02bD6WojU1Dkw
	bVU6cgJED4WqAYtz0LurFdTuvmEg=
X-Gm-Gg: ASbGncsvo8gL/nYZ3zvSfa6UplRfQwN1ct7T+2c9pumIlRSKGkOZfw7+X614I6xx8zj
	wjIE5zDrdhmLQtNC4HjvaMXvll1PrMnRBkOWSp6m9P6epDFg4AmgpFWk5U25ji87kJkJUPMBElE
	SlpltJ5xa3lYehI3jK6VDSJiO6SEzh5sz3uQfmIe228i5S8MHLCAg3Brsq79at
X-Google-Smtp-Source: AGHT+IGfpwrvlMqY3iBb1VzCUROwtTZPEd4E7LQihWty85dgOsYSyHbxCNjPaLlGhxYNyO/xA4tVwzk3Hcz5oMkoO64=
X-Received: by 2002:a05:6214:2504:b0:6e8:ea29:fdd1 with SMTP id
 6a1803df08f44-6eb3f27ef5emr297083476d6.3.1742981523280; Wed, 26 Mar 2025
 02:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250325215001.643993-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250325215001.643993-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Mar 2025 10:31:52 +0100
X-Gm-Features: AQ5f1JpHLxEC1lNhxRQuhs1230gSR5FJwGhjU_R4s0xI-AOJlSVJ_ltDZSt8pEM
Message-ID: <CANNYZj8Xt0crJGTyg=mcgOjfvnkUPn7XmXa2d_m_HUkWT9XxoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] meta/conf: Start to populate autobuilder
 config fragments
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 09:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213642

Thanks for the split, I'm fine with this.

Alex


On Tue, 25 Mar 2025 at 22:50, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> This populates the fragments directory with:
>
> a) the default set of variables used in all autobuilder builds
> b) the default resource related variables used in all autobuilder builds
> c) three different multilib test configurations used by the autobuilder
>
> The aim here is to start to make some of the autobuilder configuration more
> visable and patchable by users, and to allow some test confiturations to
> be user selectable if appropriate and needed for debugging.
>
> The main aautobuilder fragment is probably not directly reusable by most
> users, it contains the resource limits as used on the autobuilder itself. I
> can see arguments both way for whether this should be included in OE-Core or not
> but having an example of how we configure this is probably useful.
>
> Not all configuration in the autobuilder is being moved, this set of variables
> is just a basic starting point. Some variables may ultimately make more sense
> being migrated elsewhere, perhaps updating the main defaults for poky or nodistro.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../autobuilder-resource-constraints.conf     | 26 +++++++++++++++++++
>  .../yocto-autobuilder/autobuilder.conf        | 13 ++++++++++
>  .../multilib-mips64-n32.conf                  |  8 ++++++
>  .../yocto-autobuilder/multilib-x86-lib32.conf |  6 +++++
>  .../yocto-autobuilder/multilib-x86-lib64.conf |  6 +++++
>  5 files changed, 59 insertions(+)
>  create mode 100644 meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf
>  create mode 100644 meta/conf/fragments/yocto-autobuilder/autobuilder.conf
>  create mode 100644 meta/conf/fragments/yocto-autobuilder/multilib-mips64-n32.conf
>  create mode 100644 meta/conf/fragments/yocto-autobuilder/multilib-x86-lib32.conf
>  create mode 100644 meta/conf/fragments/yocto-autobuilder/multilib-x86-lib64.conf
>
> diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf
> new file mode 100644
> index 00000000000..58cadd92b64
> --- /dev/null
> +++ b/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf
> @@ -0,0 +1,26 @@
> +BB_CONF_FRAGMENT_SUMMARY = "Resource constraint variables used on the Yocto Projects autobuilder"
> +BB_CONF_FRAGMENT_DESCRIPTION = "Resource constraint variables used on the Yocto Projects autobuilder"
> +
> +BB_NUMBER_THREADS = '16'
> +BB_NUMBER_PARSE_THREADS = '16'
> +BB_SERVER_TIMEOUT = '60'
> +PARALLEL_MAKE = '-j 16 -l 75'
> +BB_PRESSURE_MAX_CPU = '20000'
> +BB_PRESSURE_MAX_IO = '20000'
> +BB_LOADFACTOR_MAX = '1.5'
> +XZ_MEMLIMIT = '5%'
> +XZ_THREADS = '8'
> +ZSTD_THREADS = '8'
> +BB_TASK_NICE_LEVEL = '5'
> +BB_TASK_NICE_LEVEL:task-testimage = '0'
> +BB_TASK_IONICE_LEVEL = '2.7'
> +BB_TASK_IONICE_LEVEL:task-testimage = '2.1'
> +TEST_QEMUBOOT_TIMEOUT = '1500'
> +BB_DISKMON_DIRS ?= 'STOPTASKS,${TMPDIR},1G,100K STOPTASKS,${DL_DIR},1G STOPTASKS,${SSTATE_DIR},1G STOPTASKS,/tmp,100M,30K HALT,${TMPDIR},100M,1K HALT,${DL_DIR},100M HALT,${SSTATE_DIR},100M HALT,/tmp,10M,1K'
> +RUNQEMU_TMPFS_DIR = '/home/pokybuild/tmp'
> +BB_HEARTBEAT_EVENT ?= '60'
> +BB_LOG_HOST_STAT_ON_INTERVAL = '1'
> +BB_LOG_HOST_STAT_CMDS_INTERVAL = 'oe-time-dd-test.sh -c 100 -t 3'
> +BB_LOG_HOST_STAT_ON_FAILURE = '1'
> +BB_LOG_HOST_STAT_CMDS_FAILURE = 'oe-time-dd-test.sh -l'
> +
> diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> new file mode 100644
> index 00000000000..e3bac343390
> --- /dev/null
> +++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> @@ -0,0 +1,13 @@
> +BB_CONF_FRAGMENT_SUMMARY = "Default variables used on the Yocto Projects autobuilder builds"
> +BB_CONF_FRAGMENT_DESCRIPTION = "Default variables used on the Yocto Projects autobuilder builds"
> +
> +QEMU_USE_KVM ?= 'True'
> +INHERIT += 'report-error'
> +PREMIRRORS = ''
> +BB_GENERATE_MIRROR_TARBALLS = '1'
> +IMAGE_CLASSES += 'testimage'
> +SDK_EXT_TYPE = 'minimal'
> +SDK_INCLUDE_TOOLCHAIN = '1'
> +ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
> +SDK_TOOLCHAIN_LANGS += 'rust'
> +
> diff --git a/meta/conf/fragments/yocto-autobuilder/multilib-mips64-n32.conf b/meta/conf/fragments/yocto-autobuilder/multilib-mips64-n32.conf
> new file mode 100644
> index 00000000000..ec076b59f9f
> --- /dev/null
> +++ b/meta/conf/fragments/yocto-autobuilder/multilib-mips64-n32.conf
> @@ -0,0 +1,8 @@
> +BB_CONF_FRAGMENT_SUMMARY = "Enable a MIPS64 triarch multilib"
> +BB_CONF_FRAGMENT_DESCRIPTION = "Enable a MIPS64 triarch multilib"
> +
> +require conf/multilib.conf
> +MULTILIBS = 'multilib:lib64 multilib:lib32'
> +DEFAULTTUNE = 'mips64-n32'
> +DEFAULTTUNE:virtclass-multilib-lib64 = 'mips64'
> +DEFAULTTUNE:virtclass-multilib-lib32 = 'mips32r2'
> diff --git a/meta/conf/fragments/yocto-autobuilder/multilib-x86-lib32.conf b/meta/conf/fragments/yocto-autobuilder/multilib-x86-lib32.conf
> new file mode 100644
> index 00000000000..9b0e2578ac9
> --- /dev/null
> +++ b/meta/conf/fragments/yocto-autobuilder/multilib-x86-lib32.conf
> @@ -0,0 +1,6 @@
> +BB_CONF_FRAGMENT_SUMMARY = "Enable an x86 lib32 multilib"
> +BB_CONF_FRAGMENT_DESCRIPTION = "Enable an x86 lib32 multilib"
> +
> +require conf/multilib.conf
> +MULTILIBS = 'multilib:lib32'
> +DEFAULTTUNE:virtclass-multilib-lib32 = 'x86'
> diff --git a/meta/conf/fragments/yocto-autobuilder/multilib-x86-lib64.conf b/meta/conf/fragments/yocto-autobuilder/multilib-x86-lib64.conf
> new file mode 100644
> index 00000000000..1986b994e4b
> --- /dev/null
> +++ b/meta/conf/fragments/yocto-autobuilder/multilib-x86-lib64.conf
> @@ -0,0 +1,6 @@
> +BB_CONF_FRAGMENT_SUMMARY = "Enable an x86 lib64 multilib"
> +BB_CONF_FRAGMENT_DESCRIPTION = "Enable an x86 lib64 multilib"
> +
> +require conf/multilib.conf
> +MULTILIBS = 'multilib:lib64'
> +DEFAULTTUNE:virtclass-multilib-lib64 = 'x86-64'
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213620): https://lists.openembedded.org/g/openembedded-core/message/213620
> Mute This Topic: https://lists.openembedded.org/mt/111906583/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

