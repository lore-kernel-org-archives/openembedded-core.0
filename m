Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3EBC3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 12:24:25 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.74846.1746534262899516038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 05:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BnT0KC/b;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso51583101fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 05:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746534261; x=1747139061; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UfrJRPipMIqEo9JJA4WLIacVxV/ddiQZJnUqPPK1Jr4=;
        b=BnT0KC/bdBTpAi3uYjSUlCqPpf3M3QgyyRH8tV9bWnEnwudR3PrkzRtrMC1esOf3hT
         hS+SOjfxbjVkqke6a7MsSms5DGKPLxdxlsK1NwSx0jDOghnh5096Etg00msO/RXYNtNt
         x99lPSiOkvhi53Vq+3T0c6M9PdKL4ubhJ1sBxiO1IE94X6L9KF+SfXnuEoEEhLZzRGQC
         EdKb5GPg1tviCoUXy755cg3K16i40jJwMEcLkYpv/U4J2hd1isqwUtJGAaxhMm4iRvY8
         pMJgxrmRKLRSQQdXB6T91q6gW+Us3OssFPMUNjm0aV/bC/pIRggyyWXDV/1eCl6UehDh
         x3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746534261; x=1747139061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfrJRPipMIqEo9JJA4WLIacVxV/ddiQZJnUqPPK1Jr4=;
        b=m8yZxhPNtr+/jKGh77loDFpN/ZjQpXo9AtgDf5JT4pIqoatRdu7PeAY93gap+qpWAj
         WXXSZ+NgJjkVnT6B2jR+0CndAdmRIIBKBcooHLnvwq/WS7lanFNN8o8jV4wtOrqmNMwt
         bA4t6auEL1jL7eByoeRjJS4ysFaKgi3rJRj51z3IzXdAFOFnW1xgKsO1OYow4pladiyI
         VkiDy90RImOah4iuWksaPIJrOAYZyQcCy/mrvocIKv8wPqWMhct9/bSmECJUUiBBIpzS
         xP9y6Ku2/P1bpNkBsX05t51y9Fxm8ZHjzBvypVm29uwOgrvR68HATAz3OIwPUqTbuYE+
         nCrw==
X-Gm-Message-State: AOJu0YwA5ig9OFV7t5GUYFTmz4iHtMTI3WTRu5bqj+OHihzco551kXyg
	fU/CMukz6Ya91elEk8crxzipwGpF130R2Kbv7Qb7TBnftBBW+G/X7ifRzG5L+94=
X-Gm-Gg: ASbGncuX/BhlyDQn/ZYKp7fTM+xdTndQauuUY3MrAINeBV+3NhyoDHooqhEgjfeHxeG
	hP2ddy0li2w91lIiIhFuQqIPgqD6oGPwbAFo5Yx4Ud/1Nom0vD4QtXfEQ9i12O7hwceOdVlTPt7
	HA6+Twregz9oL40l7uY5o3IDZgQcDd0/TLSC7PxKAlBlTSBbkSd2EvAp0Q47dHggteOpHmRNx5p
	9a6w1ENvEHIaMloE9CaXcEcHp8dCySab/PA8vT2yxzJzuqbNjDFGlUJE/FMegz6Nwyt3mV7tHe4
	MNzLNYoAvJbsB8YWuUMC6sPTEf46Cr9p1yP4nQVfej/QM4Geumuh2LgJCD2n9uz9DRPE5i7BYUk
	LiyfSVRXF
X-Google-Smtp-Source: AGHT+IFQR4aQFuMvmqs4R6dRhCW6PQmwuQETU/iT8H/q9F7R4TcVI4QoQeAj9fox0z7hcPTKG9YbtA==
X-Received: by 2002:a05:651c:1a0c:b0:309:1fee:378d with SMTP id 38308e7fff4ca-3264f4feb79mr12266901fa.19.1746534260998;
        Tue, 06 May 2025 05:24:20 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89f33bsm21320101fa.72.2025.05.06.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:24:20 -0700 (PDT)
Date: Tue, 6 May 2025 15:24:18 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: sathishkumar.d.cbe@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64:
 gcs required
Message-ID: <aBn_ch15_MprrQyI@nuoska>
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23053.1746531517602060473@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 12:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216042

Hi,

On Tue, May 06, 2025 at 04:38:37AM -0700, Sathishkumar D via lists.openembedded.org wrote:
> Hi all,
> 
> I am also facing the same build issue. I tried to understand the issue. From build system for both openssl and systemd, -mbranch-protection=standard enabled. In fact the support this flag added long back, https://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc5ecd9672f5e86bf8a579 ( https://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc5ecd9672f5e86bf8a579 ) and tpm2 introduces additional dependencies for systemd as in commit https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/systemd/systemd_%25.bbappend?id=6eb3098e57881895e62fc811f714c2aa4ecfcf8f.
> 
> So something issue with gcc-15? or what makes openssl to loose gcs?

If you do not use TPM features in systemd to e.g. mount or create encrypted
file systems, then you can remove the PACKAGECONFIG
entries "cryptsetup cryptsetup-plugins efi openssl repart"
from systemd as a workaround.

Cheers,

-Mikko

