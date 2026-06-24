Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31167CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 13:20:07 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6914.1782307203766882969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 06:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eMv7XUkd;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ad68a06541so1356583e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782307202; x=1782912002; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RbBdU+jwkTOSXUSxZbr60dYnyoCQgNdFpCklqVg7Ol0=;
        b=eMv7XUkdj8wcNxFWfMuQ0x4CMYCP889iIHhRPvPhu25BF/aVY8djdsy40f8nUiVEHz
         4hCchkmur1q6wqQ2LT94Y3sv1KYHr0t4SVs940WIhekkikB/v9xO35BdFH15015E81MX
         pUKDgNutBIontszT6jioeh1nTmUpat9Nb7ai2qui42Iwedl/grBjvB+qFc7GWyMIkZeJ
         0fD4VG6uzPQrCtML0yWQsMpZQywhPTTse5GfrqyAFaiQxYZ+nylL59QbhkEsGa7aKG94
         57PNjrxgX8KCmFrA9N4WyRkDhol1xS8RKpAMFM6PTUUv5nXf7ITHCwdzYv1U0Rh4EVux
         cv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307202; x=1782912002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbBdU+jwkTOSXUSxZbr60dYnyoCQgNdFpCklqVg7Ol0=;
        b=MGiqlcSMoVp4LUYUKfwdK6LQifZp4WOIfFGJKrJx+3sbqKJw2SyH9SB3neRT4Pcgjb
         XDoVF7TBWUDPYZkdUSLfiw0Ts0a5aPY6S4DYsoKY0t+gDE3ZqTISLxggN55MB8DIGBPr
         PskEoikjoDWPPGGs/5u2han+zVt9hTqIXL3MLQObpystn5diuz9DPhGCitBAeCNL+9yg
         YCIt8wTE0Ruv/5urgGhatWLlkvFS0fQE7rpDxVhOd0kEpi9f4T8oussYBLyT6iFGhJgr
         XEvAay4ImGrKYb4YKtok4tqA4GCM3jwc+Rom2eZOBdwXp8lHTdqfVgFLovluTFYJDOgZ
         ERtQ==
X-Gm-Message-State: AOJu0Yw6oxd5LkfMK6xfSR4/S/My6JLXOQUXVkn0K9oWBakB+pu0wSV+
	7jjxM7h16KkF+k10W0QTBjBEsqcKhQcCRkqK45FxINFddbGxucBM+mh1/ZtFmS3Ucnc=
X-Gm-Gg: AfdE7cmNpJArSqkCEU6nUVOHcpFXJBbeST5t9cP2ri4BszyiSWLhjUcCZCtAzW9JIvn
	qS+MTKyJL8KaL4sLxGGk4THs0YZnGmAzxAp6OlL9lmUD3T+kmxKfL8m7xlcr9o8yf5hvawz5cRx
	3ngtE+UypSjkyMPRSGCwb/ywjBM5OG0Em+gdN2zxGZnIC2EUOMItsGwllnH8An+x49DrFvmt0au
	3EhgzLDp5txVQAcSa3LA1C5faymmrWqkms82AmUWeqKER3tDXckHSY5H+yk8XiJp6NhoWTtMxQq
	8/NzhqHtj4HdsUIAtgBbLtKbKYgbBYDxADqfpVQePQeucxXL0SkRfQirJedQ+fmK3vheV4S5yOx
	JSYviEW7nKbyTUIEZvbg4L8RwtWnXhG1BRMFPzOBJOtXX2sWJ/5kR0ZVjqE6G6f2QgPZQZ5BFlR
	tLgC06rVhGcsuvYohUc+v0tT7D3Ue5DNbCEF6MxLvtYRBEp+MaCAY=
X-Received: by 2002:a05:6512:4501:b0:5aa:7078:4a12 with SMTP id 2adb3069b0e04-5ae9d588846mr816299e87.42.1782307201573;
        Wed, 24 Jun 2026 06:20:01 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ae9bbc49a6sm1151616e87.76.2026.06.24.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:20:01 -0700 (PDT)
Date: Wed, 24 Jun 2026 16:19:59 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: shoudil@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] uki.bbclass: add merge logic in dtb section
Message-ID: <ajvZfwJWv9T9hEp_@nuoska>
References: <20260624023506.1474514-1-shoudil@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624023506.1474514-1-shoudil@qti.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 13:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239505

Hi,

On Wed, Jun 24, 2026 at 10:35:06AM +0800, Shoudi Li via lists.openembedded.org wrote:
> For machine with multiple dtbs specified, we need to merge dtb overlays

Machine with main .dtb and multiple .dtbo overlay files.

Multi dtb is a different thing which is implemented with dtbauto sections
and mapping of HW identifiers to them which is not yet supported by uki.bbclass:

https://www.freedesktop.org/software/systemd/man/latest/systemd-stub.html

> to base and pass the merged dtb to ukify to create UKI.
> Walks UKI_DEVICETREE, splits entries into base_dtbs (.dtb) and overlays,
> and validates all paths exist. For each base DTB, finds matching overlays
> by checking whether the overlay filename starts with the base DTB name.

systemd-stub and thus uki/ukify currently support only full devicetrees and
dtb overlay files are not supported. This support may be added in the future
since other OS loaders do support them, for example Qualcomm bootloader XBL and
Android bootloader (ABL), both of which may use edk2 to implement this.

Thus I would currently just merge these .dtb and .dtbo files in the recipe which
compiles and provides them, e.g. the Linux kernel recipe. UKI images just consume
the dtb file so it feels wrong to merge dtb and dtbo files in uki.bbclass.

Cheers,

-Mikko
 
> If matches exist, runs fdtoverlay -i <base> <overlays…> -o <B>/<base>-merged.dtb
> and passes the merged file to ukify.
> If no overlays match, passes the base DTB directly — no change in behaviour for
> DTB-only boards.
> 
> Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
> ---
>  meta/classes-recipe/uki.bbclass | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
> index fa1c95603b..03eb9eafbd 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -61,6 +61,7 @@
>  #
>  
>  DEPENDS += "\
> +    dtc-native \
>      os-release \
>      systemd-boot \
>      systemd-boot-native \
> @@ -150,16 +151,39 @@ python do_uki() {
>      if cmdline:
>          ukify_cmd += " --cmdline='%s'" % (cmdline)
>  
> -    # dtb
> +    # dtb: separate base DTBs from overlays, merge each base with its matching overlays
>      uki_devicetree = d.getVar('UKI_DEVICETREE')
>      if uki_devicetree:
> +        base_dtbs = []
> +        overlays = []
>          for dtb in uki_devicetree.split():
>              # DTBs are without sub-directories in deploy_dir
>              dtb_name = os.path.basename(dtb)
>              dtb_path = "%s/%s" % (deploy_dir_image, dtb_name)
>              if not os.path.exists(dtb_path):
>                  bb.fatal(f"ERROR: cannot find {dtb_path}.")
> -            ukify_cmd += " --devicetree %s" % (dtb_path)
> +            if dtb_name.endswith('.dtbo'):
> +                overlays.append(dtb_path)
> +            else:
> +                base_dtbs.append(dtb_path)
> +
> +        fdtoverlay_bin = os.path.join(d.getVar('STAGING_BINDIR_NATIVE'), 'fdtoverlay')
> +        build_dir = d.getVar('B')
> +        for base_dtb in base_dtbs:
> +            base_name = os.path.splitext(os.path.basename(base_dtb))[0]
> +            # Overlays whose filename starts with the base DTB name
> +            matching_overlays = [o for o in overlays
> +                                  if os.path.basename(o).startswith(base_name)]
> +            if matching_overlays:
> +                merged_dtb = os.path.join(build_dir, "%s-merged.dtb" % base_name)
> +                fdtoverlay_cmd = "%s -i %s %s -o %s" % (
> +                    fdtoverlay_bin, base_dtb, " ".join(matching_overlays), merged_dtb)
> +                bb.debug(2, "uki: merging DTBs: %s" % fdtoverlay_cmd)
> +                out, err = bb.process.run(fdtoverlay_cmd, shell=True)
> +                bb.debug(2, "%s\n%s" % (out, err))
> +                ukify_cmd += " --devicetree %s" % merged_dtb
> +            else:
> +                ukify_cmd += " --devicetree %s" % base_dtb
>  
>      # custom config for ukify
>      if os.path.exists(d.getVar('UKI_CONFIG_FILE')):
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239475): https://lists.openembedded.org/g/openembedded-core/message/239475
> Mute This Topic: https://lists.openembedded.org/mt/119953784/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


