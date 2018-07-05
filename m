Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6B491754C2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 07:15:33 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id y17-v6so1076617ljy.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dFu0MhxbzCP1xpweHQJyzeJwJlGdhkcJHfYqOhpUD4I=;
	b=NBUL8xnjQM3smCWomtfJlsChGHPWPuXH/I2O7LUWjUwgvcsa6ErusRm21rgUF4qErY
	FabGFaKxRn7BGzAAVNMS6J+vuKdKe88BOB/atly1nEKD+tJVQQIQ632QbZ2RjUpbWPKv
	mHkrZTrPLxAa4CMFzXOEybFLBP9JxGPVFFG/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dFu0MhxbzCP1xpweHQJyzeJwJlGdhkcJHfYqOhpUD4I=;
	b=NO/juEfqyCbS8UDgEPGG5DbeK0Z7lFIo1qphctwMmff8ofsM96BjKGcxQtXhWPv2cu
	CB4itQXNoC8G32o65gelGBCLSO+x3t0mYCyD8tH/x21OixPCGUZ5XqdnZA9DXiNFl5um
	cQ7l84pHyl5cNyZVQbGzjR4djpDN8KoLU6H4YDzP7gJELAaMYrZtDs8ktsGcT4y+W58t
	B8DTIwZM0VuFRXnyF3HZStLiSukN/pPklO/pUoggcuVBYuFO4lDavsZbDA0RF/hL8/nw
	qjhu/Hxx2eQVTJRp9WqyVdrn+WCWxATLMqaGqTyvV0ibHh+0mrYwmaYLc67HxWoDPHcX
	w11g==
X-Gm-Message-State: APt69E3eSOkAGapGWAtBLHrcQ5BBsZ2V3i9/k2WN0Sw7BrJy8pNMiJS+
	GX1k6mtY0DlVOGBlo7sEYxEexax4d7N8BJJhNSnp6A==
X-Google-Smtp-Source: AAOMgpc7db6d2l6wDbpoQIQgKlzo5LTxRC4FPfYi3aEtNE20NzdO7I39fYuQzbUcRXT6f7nUxKISVtg9PRscFjOfc1M=
X-Received: by 2002:a2e:9105:: with SMTP id
	m5-v6mr3135061ljg.121.1530774933955; 
	Thu, 05 Jul 2018 00:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180704200654.285-1-Martin.Jansa@gmail.com>
In-Reply-To: <20180704200654.285-1-Martin.Jansa@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 5 Jul 2018 09:15:22 +0200
Message-ID: <CAP71Wjwy0T-s7-D+aRDRwcH+w0nBD0gSV_HN3hFi6qpYnWfnkw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel-devicetree: Corrected normalize_dtb"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2018 07:15:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 4, 2018 at 10:07 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> This reverts commit 2e7f3b2b9318d1e5395ad58131eafb873f614326.
>
> It was breaking quite common use case that the dtb files are in
> some subdirectory and then kernel build fails to build them.
>
> As reported by khem:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-July/152578.html
> me:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-July/152579.html
> on raspberrypi3 build:
>
> make[3]: *** No rule to make target 'arch/arm/boot/dts/dwc2.dtbo'.  Stop.
> arch/arm/Makefile:345: recipe for target 'dwc2.dtbo' failed
> make[2]: *** [dwc2.dtbo] Error 2
> Makefile:146: recipe for target 'sub-make' failed
>
> and trevor on the IRC:
> 20:35:49 < tlwoerner> the recent 2e7f3b2b9318d1e5395ad58131eafb873f614326 commit in oe-core seems to cause dragonboard-410c's kernel to fail to build
> 20:36:26 < tlwoerner> for the dragonboard-410c, KERNEL_DEVICETREE is set to "qcom/apq8016-sbc.dtb" but the build failure is:
> 20:36:37 < tlwoerner> *** No rule to make target 'arch/arm64/boot/dts/dts/qcom/apq8016-sbc.dtb'.  Stop.
> 20:36:44 < tlwoerner> i.e. the "qcom/" is getting removed
> 20:37:08 < tlwoerner> oops!!
> 20:37:33 < tlwoerner> wrong copy&paste, the actual error is:
> 20:37:36 < tlwoerner> *** No rule to make target 'arch/arm64/boot/dts/apq8016-sbc.dtb'.  Stop.
> 20:37:53 < tlwoerner> i.e., the "qcom/" is being stripped out
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Thanks! As reported by Trevor, it's needed for meta-qcom..

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>  meta/classes/kernel-devicetree.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
> index 7faa869493..9c5e125981 100644
> --- a/meta/classes/kernel-devicetree.bbclass
> +++ b/meta/classes/kernel-devicetree.bbclass
> @@ -13,8 +13,8 @@ normalize_dtb () {
>         dtb="$1"
>         if echo $dtb | grep -q '/dts/'; then
>                 bbwarn "$dtb contains the full path to the the dts file, but only the dtb name should be used."
> +               dtb=`basename $dtb | sed 's,\.dts$,.dtb,g'`
>         fi
> -       dtb=`basename $dtb | sed 's,\.dts$,.dtb,g'`
>         echo "$dtb"
>  }
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

