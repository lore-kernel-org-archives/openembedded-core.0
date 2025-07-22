Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA80DC83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 13:55:03 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.13283.1753192501440078032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 06:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gpW80xyO;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23602481460so53325655ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 06:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753192501; x=1753797301; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ap7jD00GsDcio9kT2LrYEkROSMzUHkFgvpB0r5NZ/ec=;
        b=gpW80xyOLojbpnw+tDHkR08mlMyl7g17mKROnIANIexqIj64ITNgjMHC1/HOS2Nh+u
         fncyCk9j/7T8E+LgOuwhhcwIAjoXoAlGwnzZFRBcpQOAAAnogZ4R4nuitcPQlCoAK5t4
         imTWyT33/YtvZ3frQ7qfHpEEeQngBRg4Mci8t7JYzsETPZ4zw/zUGUeYIv5Jkjp21yaF
         IDYpup2l0YZYhD5yyWLrPFAQ1tNWDVoVxn+bEdW+YLmnkPH1ko/hytUbXJ1Fb1Wdq80q
         wcxGhCyyPwVns/zoGmLPtCcgxsiX8bWfQESUhKTOQplqpKhhLtcKCqSju6NDuZLacrdR
         wPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753192501; x=1753797301;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ap7jD00GsDcio9kT2LrYEkROSMzUHkFgvpB0r5NZ/ec=;
        b=peaZSZAoFkoGY8CIimP6geI5NXj0Y374VyFk7jDv4qwgs2CeYDHigV4W7rsAYfsK6w
         oHoZpEuYk/4lfgPA/uB+tBTEYHi2dkJRK/EhLx34P0HQ+T+/NtvWrCVecnP56jS5HYcR
         rkk9RfOgcF5RIorZ6BugxvqBOTHIxGZR5paTeHiU8LPJTd6T8xsYpm3NrAiJpDerdaqg
         QaB2D7Vz8igfRor8dSp8EHzRJ0mhOywhWw8Ef9gDcqHgjl80z6GJG25FQIJhuYLnueCY
         R4FLMBUGUv/xMhs/Quu/QMGlKsMwTKltvA91i0sfWQp8aaktdniFiokHrdw3eVguM4+x
         qxfg==
X-Gm-Message-State: AOJu0YzncGw8yNXZj4C5A9BfAClEZV++lA/qZ+JAL64GCTcB0f7KJuQ6
	aPLpAjRvYjNBucC1xkyDBAy9EWlWxiWH8+WK8WrGXXQ/v0zSR0r9+zrw
X-Gm-Gg: ASbGncuD5vjzbaYKuxp1PnXi30eNdGS2m8xed3P2dRbz6tEB8N8RXcRBZtiKdjqmR3m
	GYWyVU4y8Yd6uNcYujyuK9j0aEWhQfGBwI6XncKLALN2R7pffu+rVHnT3ec703B0+PDDg9ACZl+
	qUFdltTe0frziie8AO4OE/WxyE9EB4tnorJ+5LQ1h05EP+6xenZh8k5VaPvsCwsHDjGNKTGdf9x
	ayqWtCEyyr9NKDfMmtfyXZA3ijFD9U6a0QxEly9BxVAc4vSC4PJQEetfrPAZyYUWXrqWKkXrxlL
	UL341x3UL4s4GvKzjdryL8tVtlVnp7f+u3tfeGMGUrhKEZKuIz3bgPHaE02p/9AmJ2eHCoH3WBi
	RDDt/GPHKxhmCtJjw8R8=
X-Google-Smtp-Source: AGHT+IG5nx6cU04ViJOEUmf52ioS+1400s0lB6CImkHN/ldGQgfwoxgzOjw9O84GbSWLfuc8gKTiwQ==
X-Received: by 2002:a17:902:c943:b0:223:4537:65b1 with SMTP id d9443c01a7336-23e24fe8b00mr309856775ad.36.1753192500508;
        Tue, 22 Jul 2025 06:55:00 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b708b22sm77414105ad.235.2025.07.22.06.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 06:54:59 -0700 (PDT)
Date: Tue, 22 Jul 2025 10:54:56 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	Chen Qi <Qi.Chen@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH v2 1/2] systemd: drop build dependency on
 util-linux
Message-ID: <20250722135456.5aalhsjnjlrxveqe@hiagonb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EC140605-9289-4B3C-933A-BBDB36A6860E@arm.com>
 <0EF31473-A2CE-4FE1-B920-777048FFE49F@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 13:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220748

Hi Ross,

On Mon, Jul 21, 2025 at 05:50:25PM +0000, Ross Burton wrote:
> On 17 Jul 2025, at 22:16, Hiago De Franco via lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> > 
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > The libmount dependency was made optional on systemd upstream [1]. By
> > backporting this upstream change, we can drop util-linux as a build
> > dependency for systemd, making it only as a runtime dependency.
> > 
> > This is important to fix a circular dependency between util-linux and
> > systemd when util-linux is built with the systemd PACKAGECONFIG enabled.
> > Without this change, each recipe depends on the other, triggering the
> > circular dependency error.
> 
> How did you test this?  If I disable the libmount PACKAGECONFIG the build fails in do_install.

I did a mistake on my test when I first send this patch, I am sorry.

I was able to reproduce the do_install failure and this is fixed by
backporting patch a292b55980d6 ("meson: Don't fail install script if
file doesn't exis"). I will update this in the next revision.

Also, there is one more issue with util-linux which I will also have to
fix:

ERROR: util-linux-2.41-r0 do_package: QA Issue: util-linux:
Files/directories were installed but not shipped in any package:
/usr/lib/sysusers.d
/usr/lib/systemd/system/uuidd.socket
/usr/lib/systemd/system/uuidd.service
/usr/lib/systemd/system/lastlog2-import.service
/usr/lib/tmpfiles.d/lastlog2-tmpfiles.conf
/usr/lib/tmpfiles.d/uuidd-tmpfiles.conf
/usr/lib/sysusers.d/uuidd-sysusers.conf

> 
> Also your patch moves the util-linux-mount and util-linux-umount RDEPENDS from PN to be dependent on this packageconfig. Is that correct - does disabling the use of _libmount_ also mean that systemd will _never_ call mount/umount?  That sounds unlikely.
> 
> My understanding of the intention behind the upstream change, and how it’s implemented here, do not match in the slightest.

Got it, I will also check systemd for the umount/mount and move it back
to RDEPENDS then.

> 
> Ross

On Tue, Jul 22, 2025 at 01:05:25PM +0000, Ross Burton wrote:
> On 17 Jul 2025, at 22:16, Hiago De Franco via lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> > Introduce new PACKAGECONFIG options in systemd for both libblkid and
> > libfdisk [1][2].
> > 
> > Set blkid as enabled by default because the bootctl command depends
> > on it to be built. For example, images like core-image-sato-sdk rely on
> > bootctl and have specific tests for it.
> > 
> > Previously this worked implicitly because the upstream Meson option
> > defaulted to auto, which enabled the dependency if libblkid was present.
> > Now, without explicitly enabling it via PACKAGECONFIG, the feature would
> > be disabled, which triggers testimage errors.
> 
> Before this commit:
> 
> Run-time dependency fdisk found: YES 2.41.0
> Run-time dependency blkid found: YES 2.41.0
> 
> So fdisk should be enabled too.
> 
> Further digging reveals that systemd itself will no longer call the blkid and fdisk binaries and simply uses the libraries, so the util-linux-blkid and util-linux-fdisk RDEPENDS are redundant.
> 
> Also, systemd links against libblkid and libfdisk directly so there’s no need to add RDEPENDS for those, especially not to just the systemd package when the actual linkage is in other places such as libsystemd.
> 
> I’ve sent a revert pending an iteration on these patches.

Got it, thanks for the patch and for the review. I will make sure I fix
the other issues as well to propose a new version.

> 
> Ross

Best regards,
Hiago.

