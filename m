Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DF0C5B555
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 18:31:27 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.2686.1748889080673185735
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 11:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WRqT8jvG;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fa980d05a8so45116546d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 11:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748889080; x=1749493880; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIOODJRizWNKMsjZxEoOx+tJajUw3ohxRfkXBGPHiNo=;
        b=WRqT8jvGAkKP5kAxsvXFJTGHQZFvROV94R9z5aM3y1tg2414kMR4TZQAhXIKj2+tay
         M0KhfYHTVlAkOYMA+xZE8xtQwMEn1e/XCdVM+e5S+8sSDirkf4JiA9jGTJuLKyf48JI+
         vOX7DYVhxkgpUNAbdvXcOMpfhNpN3DNFNARLZu7vzlUQJ7gzX4eoN7TbmQenNDXg1fGG
         OXFu3jzEJO69ZmoAxZfoRdst2HILU6yEEZsVss6GNKzu2f1W5Hc0xK71kh3wGJ5QawYG
         ZI3m1jeHtCBoD+F2zUM41Vj9Lw6YL+4FsNu4p8arOJS81bXsf83Q9aL0bAtVsLDvvPuB
         qYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748889080; x=1749493880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIOODJRizWNKMsjZxEoOx+tJajUw3ohxRfkXBGPHiNo=;
        b=SeSblrXxaxZsvZGsvT66Pr/KAFb8IBvDwDhnNUPsANMHrUiEiCb9nDFj/JwUyxY8g1
         pzeBZu0UGCmeGxbCElLF3Ftk2qO8ii7ZO/7NrBIX8+76upGntnJGEN1vBKdENpCYrTzV
         oY060yozW2o7nSDn8hipNxNVCjUO1y0LgWSXRlfFMKbA+v8iucb00vpkZ4hbR1QQO4Y1
         OVP42O7TFrshFvpVvPFvzltYU9YToyTiZus5PmnGbI1AnVFMozHspJjetR/7gAPpuTdC
         Kj9kHBep1HybagPz1yeid+bBojoEPlU1ys1W+fW6QeSY6dck5vX3VppP9pGFLx7+8K4B
         Iv3w==
X-Gm-Message-State: AOJu0YyjI8Fvm1utDpcd611/WjqkYlW7kg5MLwz5I/47MYTFR/EBBF1B
	VFGJFeLOMLG9zS6VUSz3FRYO+aGg1VBRTgGiFPT1ahD/7nl+2wFGe96x
X-Gm-Gg: ASbGncvtlaluuL4DxC2cRoTS40B6byaXIbdizmLFs5b+2jb//zHTAAqH6/TEqB0QS1F
	pGTBZDX/Kd+l5F4HNM4VGoAw0Lw2lxHMO0x5qtb2or5RBWeJUHALYYNn7dv+WDtq25Gf/SzbQMk
	V6WKsBJEVRCP+NZhLTzTzkMt1tA0n0Mk4SKISTfhvDuoVX5OY8RvrQdNGpy2ixixEIfcb4SPckb
	Q9Z+kpxjK1jEk4XZl3r0aA8AeOcRPh9yQ1XYfXMoqQp9/yhCldwHveqcAJtyNhJvim8W5gGcoVQ
	tgvj0yQ5w1wXiJs0Q62yTtJsc2Qh6vcgkifHafRT9XP8hrpCo+AFYm/Ften4AbeCy3KApO2tfg/
	9OCHNOZov98SjFYOYYkfpx5jGj1v1hNB4yZgjSnbs
X-Google-Smtp-Source: AGHT+IFSW12ilGW425pTzs0bTxq7NsGYTgO7XnlpYWs39oMIkqgwayxWqTzK/wgx11jv+IC1hmc5+w==
X-Received: by 2002:a05:6214:3003:b0:6e8:9b52:7a1d with SMTP id 6a1803df08f44-6faceb61a70mr243732556d6.8.1748889079493;
        Mon, 02 Jun 2025 11:31:19 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00b78sm64555496d6.75.2025.06.02.11.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 11:31:18 -0700 (PDT)
Date: Mon, 2 Jun 2025 14:31:17 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org, marex@denx.de,
	a.fatoum@pengutronix.de
Subject: Re: [OE-core] [PATCH v6 01/21] devicetree: minor improvements
Message-ID: <aD3t9YToWyRP9JDH@gmail.com>
References: <20250602075714.32122-1-adrian.freihofer@siemens.com>
 <20250602075714.32122-2-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602075714.32122-2-adrian.freihofer@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 18:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217725

In message: [OE-core] [PATCH v6 01/21] devicetree: minor improvements
on 02/06/2025 Adrian Freihofer via lists.openembedded.org wrote:

> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> - Do not use the ${} bitbake syntax for shell internal variables
> - Fix shellcheck SC2045 warning:
>   Iterating over ls output is fragile. Use globs.
> - Improve error handling for dtc. Print the output, not only the exit
>   value.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes-recipe/devicetree.bbclass | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
> index 1806cb62cbf..0d0583c13a0 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -109,7 +109,11 @@ def devicetree_compile(dtspath, includes, d):
>          ppargs.append("-I{0}".format(i))
>      ppargs += ["-o", "{0}.pp".format(dts), dtspath]
>      bb.note("Running {0}".format(" ".join(ppargs)))
> -    subprocess.run(ppargs, check = True)
> +    try:
> +        subprocess.run(ppargs, check=True, capture_output=True)
> +    except subprocess.CalledProcessError as e:
> +        bb.fatal(f"Command '{' '.join(ppargs)}' failed with return code {e.returncode}\nstdout: {e.stdout.decode()}\nstderr: {e.stderr.decode()}\ndtspath: {os.path.abspath(dtspath)}")
> +
>  
>      # determine if the file is an overlay or not (using the preprocessed file)
>      isoverlay = devicetree_source_is_overlay("{0}.pp".format(dts))
> @@ -125,7 +129,11 @@ def devicetree_compile(dtspath, includes, d):
>      dtcargs += ["-o", "{0}.{1}".format(dtname, "dtbo" if isoverlay else "dtb")]
>      dtcargs += ["-I", "dts", "-O", "dtb", "{0}.pp".format(dts)]
>      bb.note("Running {0}".format(" ".join(dtcargs)))
> -    subprocess.run(dtcargs, check = True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
> +    try:
> +        subprocess.run(dtcargs, check=True, capture_output=True)
> +    except subprocess.CalledProcessError as e:
> +        bb.fatal(f"Command '{' '.join(dtcargs)}' failed with return code {e.returncode}\nstdout: {e.stdout.decode()}\nstderr: {e.stderr.decode()}\ndtname: {dtname}")
> +
>  
>  python devicetree_do_compile() {
>      import re
> @@ -144,14 +152,14 @@ python devicetree_do_compile() {
>  }
>  
>  devicetree_do_install() {
> -    for DTB_FILE in `ls *.dtb *.dtbo`; do
> -        install -Dm 0644 ${B}/${DTB_FILE} ${D}/boot/devicetree/${DTB_FILE}
> +    for dtb_file in *.dtb *.dtbo; do
> +        install -Dm 0644 "${B}/$dtb_file" "${D}/boot/devicetree/$dtb_file"
>      done
>  }
>  
>  devicetree_do_deploy() {
> -    for DTB_FILE in `ls *.dtb *.dtbo`; do
> -        install -Dm 0644 ${B}/${DTB_FILE} ${DEPLOYDIR}/devicetree/${DTB_FILE}
> +    for dtb_file in *.dtb *.dtbo; do

The behaviour on no dtb and dtbo files is different between
the two.

Is that a situation we should detect and throw a useful error
message ? It may end up not being possible to happen, but since
this patch is about improving the handling of the other commands,
I thought it might be relevant.

Bruce

> +        install -Dm 0644 "${B}/$dtb_file" "${DEPLOYDIR}/devicetree/$dtb_file"
>      done
>  }
>  addtask deploy before do_build after do_install
> -- 
> 2.49.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217689): https://lists.openembedded.org/g/openembedded-core/message/217689
> Mute This Topic: https://lists.openembedded.org/mt/113424423/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


