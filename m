Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DC5FB519E
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 06:36:16 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75296.1775543769005623687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 23:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uu5TWKx0;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38cc0b91b01so37433321fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 23:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775543767; x=1776148567; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JFo62vR3YF5DvWvmWoltK+p/BPOgfJnyXyOzkECuVmQ=;
        b=uu5TWKx0ZuavYOWyKPWDWoKSfy4uxIh0eN/2TAiesq3MIjqMcQ3OuU9dwtDapkttz7
         rLWqyxg9Un2zGYo/pI9YUdnLZNbOzyIrjd38hA8ffomdClOReQsk7Ry3il8GfVe1mxNe
         JWDV605KoxvvooNbrEpFEpFodQnV0MAtkbjGT5j1OR7XgniHkd/0gJLFWMkm9PnkC71b
         MhfeFGrgGGmwE4Z5n2Jufd43cwCbjqSF4SZOgdg27sty3gXxSNeEVFeAqiW8rfrP0UCd
         lCGyuF6TGwr53DIazzwrERPnj3QCRD59CkbzkkECoebmdUtVhnnuSmCsPHK/JkGy3rAf
         ArYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775543767; x=1776148567;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JFo62vR3YF5DvWvmWoltK+p/BPOgfJnyXyOzkECuVmQ=;
        b=GTTb2fa3UVqhOLbDfgL5vLYDhV/kGX1SUjVhrGc9tsgG/e7rYYritRwBMIGedA8cuc
         yIGSVSRPmkxj2zyzsURaZzrQ2xZ3jNVlhs2LoM5bnoNYL4RbxVUZzqIeUxXL6Nf0b2Eq
         WLTfZpOCVwWUdGjozgBO1ycVFuQQIBkkn191YkZ6JBY11JEuNT3my64/VufM6/kKq6UC
         ouS/OprCFGv0q/Id6f+Ka0nyq1BEHjtlGT4ipGG88teZtqfjHEfdpIxlWTe+p2HGpmtC
         Ugr1w+Sn5KPRutSmE0RWhNIud3ph7PCl3hiWDl5DzmQQo1IekEGHN+S9sZPjX3kDb/g5
         DOuQ==
X-Gm-Message-State: AOJu0Ywut2CIDyV2lHDJQ+zPHFRQmsXMfACaqA42eOOVZGfeVNw+NFKo
	YrE7ZnbQmhb+R0OkBKQCapoSkHSmSBLUU1oO3rdnPPigSdz/dgqzDp8P3qI8DriqUAI=
X-Gm-Gg: AeBDiesXrJjkjRESuQpPfeKP7os1bG53BBeKFofQqkl/NplE3LnQ1hk+sg6pOJqgPQF
	RsucviA3Dh30bE1VPki+63aDetbJZnIfZ/UB4nSf6zky7tz9qcSqxb4hUQO/6aug75/4XDumziq
	dlpw0grHLPphJkhoIsMSNXiOKBsr7DF+usgGkB40MoSdkZGms2MqQMYbXiVWwrYEXFlfhNrX8av
	Sz/blaZCrNGHb3Vg0Wig9Ae31kB+INMn2GWFLRXmArsmSXESUq7QGuQxjImR7B/7wxdzHZBwtyJ
	sWsjx0doxnYUQIK0EW4O+nyBUXb7zii3LVO6fTx5W+SkBuBm6FosH9VCF0O6U7Ai0n8MaLuONP/
	NZTj3Bz/1uWrHvtIath4jvBowPSTeOAgE7IhZxaSLj86wiK+t93tzlI0NuF6U54WSb02aAywrF9
	R87a1D86fuO3EcXt1zGPYps8HOB0j+2lW55/fWQBB/fvtEH83Z8ClKrvaV
X-Received: by 2002:a05:651c:1b06:b0:38c:e16a:439f with SMTP id 38308e7fff4ca-38d91c1b354mr45966291fa.23.1775543766984;
        Mon, 06 Apr 2026 23:36:06 -0700 (PDT)
Received: from nuoska (85-131-124-233.bb.dnainternet.fi. [85.131.124.233])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2108a4fsm34479701fa.23.2026.04.06.23.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 23:36:06 -0700 (PDT)
Date: Tue, 7 Apr 2026 09:36:07 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Pavel =?iso-8859-1?Q?L=F6bl?= <pavel@loebl.cz>
Cc: openembedded-core@lists.openembedded.org,
	Michelle Lin <michelle.linto91@gmail.com>
Subject: Re: [RFC PATCH] uki.bbclass: add multi-profile UKI support
Message-ID: <adSl17-9aexGWVq_@nuoska>
References: <20260402202616.3177283-1-pavel@loebl.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402202616.3177283-1-pavel@loebl.cz>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 06:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234697

Hi,

On Thu, Apr 02, 2026 at 10:25:29PM +0200, Pavel L�bl wrote:
> Allow generating multi-profile UKI [1]. This is quite usefull for
> dual slot A/B deploymets with secureboot active.
> 
> Currently only .cmdline sections are supported. But can be easily
> extended with others.
> 
> [1] https://uapi-group.org/specifications/specs/unified_kernel_image/#multi-profile-ukis

In addition to what Paul mentioned, please extend
meta/lib/oeqa/selftest/cases/uki.py to cover this feature. Maybe
even boot the target qemu machine with both profiles, if possible.

Cheers,

-Mikko

> Signed-off-by: Pavel L�bl <pavel@loebl.cz>
> ---
>  meta/classes-recipe/uki.bbclass | 48 +++++++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
> index d16f3c95561e..c2d21304c793 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -59,6 +59,17 @@
>  #   - see efi-uki-bootdisk.wks.in how to create ESP partition which hosts systemd-boot,
>  #     config file(s) for systemd-boot and the UKI binaries.
>  #
> +#   - to generate multi-profile UKI (currently only supports .cmdline section)
> +#
> +#     UKI_PROFILE[0] = "TITLE=Recovery boot"
> +#     UKI_PROFILE_CMDLINE[0] = "rootwait recovery"
> +#
> +#     UKI_PROFILE[1] = "TITLE=Boot from slot A"
> +#     UKI_PROFILE_CMDLINE[1] = "rootwait root=LABEL=root_a"
> +#
> +#     UKI_PROFILE[2] = "TITLE=Boot from slot B"
> +#     UKI_PROFILE_CMDLINE[2] = "rootwait root=LABEL=root_b"
> +#
>  
>  DEPENDS += "\
>      os-release \
> @@ -109,21 +120,46 @@ python do_uki() {
>      import glob
>      import bb.process
>  
> -    # base ukify command, can be extended if needed
> -    ukify_cmd = d.getVar('UKIFY_CMD')
> +    def generate_profiles(ukify_cmd):
> +        join_profiles = ""
> +        profile_num = 0
> +        while (profile := d.getVarFlag("UKI_PROFILE", str(profile_num))):
> +            ukify_cmd += " --profile='%s'" % (profile)
> +
> +            cmdline = d.getVarFlag("UKI_PROFILE_CMDLINE", str(profile_num))
> +            if cmdline:
> +                ukify_cmd += " --cmdline='%s'" % (cmdline)
> +
> +            profile_file = "%s/uki-profile%s.efi" % (d.getVar('DEPLOY_DIR_IMAGE') , profile_num)
> +            ukify_cmd += " --output=%s" % (profile_file)
> +            join_profiles += " --join-profile=%s" % (profile_file)
> +
> +            bb.debug(2, "uki: running command: %s" % (ukify_cmd))
> +            out, err = bb.process.run(ukify_cmd, shell=True)
> +            bb.debug(2, "%s\n%s" % (out, err))
> +
> +            profile_num += 1
> +
> +        return join_profiles
> +
>  
>      deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
>  
> +    # base ukify command, can be extended if needed
> +    ukify_common_cmd = d.getVar('UKIFY_CMD')
> +
>      # architecture
>      target_arch = d.getVar('EFI_ARCH')
>      if target_arch:
> -        ukify_cmd += " --efi-arch %s" % (target_arch)
> +        ukify_common_cmd += " --efi-arch %s" % (target_arch)
>  
> -    # systemd stubs
> +    # systemd stubs, required even for UKI profile generation
>      stub = "%s/linux%s.efi.stub" % (d.getVar('DEPLOY_DIR_IMAGE'), target_arch)
>      if not os.path.exists(stub):
>          bb.fatal(f"ERROR: cannot find {stub}.")
> -    ukify_cmd += " --stub %s" % (stub)
> +    ukify_common_cmd += " --stub %s" % (stub)
> +
> +    ukify_cmd = ukify_common_cmd
>  
>      # initrd
>      uki_fstype = d.getVar("INITRAMFS_FSTYPES").split()[0]
> @@ -185,6 +221,8 @@ python do_uki() {
>      if cert:
>          ukify_cmd += " --secureboot-certificate='%s'" % (cert)
>  
> +    ukify_cmd += generate_profiles(ukify_common_cmd)
> +
>      # custom output UKI filename
>      output = " --output=%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('UKI_FILENAME'))
>      ukify_cmd += " %s" % (output)
> -- 
> 2.53.0
> 

