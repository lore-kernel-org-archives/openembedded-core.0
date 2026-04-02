Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED00CC6B1E
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 07:52:17 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10848.1775116336117713155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 00:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=herps5iz;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3878de20527so5251191fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 00:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775116334; x=1775721134; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HqDM/Hvg0DYw1Qcy7EkN8T5Fno2ZaPgosjWW9pvHNyE=;
        b=herps5izG5VK9h40RZ2RS7MENGboIAKqqUJVBOBLBZPERac3P89d6F/lhAak+pBXNy
         s3K9d7+HIs0MtbvbiVrBCkxztWElysAbTAW1iyEIh/2N6Ex2goLE6gZ955OiPCF4JmSr
         BGrM8UdGRP45fVAJqS2T7BsvhdJ6AlxkeXHOoCnMdEuR1LbkvXBu2NJsMX2NxH2rxdxR
         iWsz1IrrOjHhqs12dfrLNlneXDQXgwoqIBL2/LSURg7uJbU6lAyM8vg5T08LtahiJeQF
         z0sgehOJEU/h+TD91hmoMi4wLQbjKq5fBJsdvC/kwGFXuEqboMKIYvg8ki3igG7EhUOR
         +vVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775116334; x=1775721134;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqDM/Hvg0DYw1Qcy7EkN8T5Fno2ZaPgosjWW9pvHNyE=;
        b=Af60S1RwFP+i3gWiKHmidv7SUJuagJOmKSwfFNyE8agdTlFvwwvHforumg4honsz9T
         QZc0NAB7mSuMC8a9rYvLX0wHnzmlytlcEmU1Q9CBjSnz9OhsG7AMZejXPbt5u6ASMpcY
         PMWojbSxdToQLBi6SoGlxMnjVp/EspTLl1FBkbKLWFQKL6i/gRmUZ8mMlgaiUm2mwIPc
         4aQrN3VXOnU3itOtDmX820HzTZtJOdBTEtJYnM2m3OZAjPwBncbePlS3Az6PHSZIYZQG
         MWh7otNrv/Y7zC5ixTiXxLveXKvqYtm87mYYmlp0FCND9GR7hqEVqC+CDQgqYi4gCEER
         +UWA==
X-Gm-Message-State: AOJu0YzvJgXlVQ2Nv65dIuJ50Ba/Cbd7+QOrSe/AwYJp/B+ay4A4U6rE
	fv1llJHoxXoy0y/DJv6zFL/2+WnjhEb87g2BDsndMd8Dqy9jedaqcTtZCS0Ah5v8W4w=
X-Gm-Gg: ATEYQzxNCuoNIFYOzm6EdpqHd7MqEcl8t+14fXL1hmoSUsj1m0vRm/6IGkMnCm4qx5w
	GLSI4iI/ocBlbblbA8Mzsna8SMrtA/dBYExopjrApgjsh9geLg+Zn5VXR6avOQcYd0l4B7DJDGA
	XOCLbpFMudsQ8nznayIOR5e/RLXmzDYCsgxr8FBy0VrnaS1nbamaASKnWF4QiswOy0SkkbE+bGV
	sQGTX9kTWfksaiNuNssZZyXzUpMtTiCKxIVIxG1wGNml5nDzWf7rObjyu6+pWnoQT1IhzaDujTG
	Y+dnDGaW9+y+TECcrYKm4DloTOQizM0SlKCud7UQm/+JUDeCc76MmhOstRz7fSa3DpMSA462NFy
	VMAeqM3rh/SMkX7k+FgSNTLwQCpTRKisgZ6RzeZqKvuDeJEJdi32I+j7oWFEgr7sEyzA7x2oO50
	6fE7ky1w2IByOTCUQnQ0WFLJ4bXRYxAbGTKpjBLA8PNCpAvLeAetNMY7A=
X-Received: by 2002:a05:6512:ac9:b0:5a2:a568:65dc with SMTP id 2adb3069b0e04-5a2c1f248e3mr3178309e87.29.1775116333911;
        Thu, 02 Apr 2026 00:52:13 -0700 (PDT)
Received: from nuoska (37-136-126-76.rev.dnainternet.fi. [37.136.126.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc94csm501453e87.64.2026.04.02.00.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 00:52:13 -0700 (PDT)
Date: Thu, 2 Apr 2026 10:52:11 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Pavel =?iso-8859-1?Q?L=F6bl?= <pavel@loebl.cz>
Cc: openembedded-core@lists.openembedded.org,
	Michelle Lin <michelle.linto91@gmail.com>
Subject: Re: [PATCH] uki.bbclass: fix ukify arguments assembly
Message-ID: <ac4gK-MO4ZadNHHf@nuoska>
References: <20260402073331.2436504-1-pavel@loebl.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402073331.2436504-1-pavel@loebl.cz>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234504

Hi,

On Thu, Apr 02, 2026 at 09:33:15AM +0200, Pavel L�bl wrote:
> Missing space before --uname ukify option mangles the command line
> string when KERNEL_VERSION is set.

Thanks, this is a clear bug.

meta/lib/oeqa/selftest/cases/uki.py could be improved to cover this.
I would be interested to know if the kernel version autodetection
does not work since that is preferred by ukify.py and this KERNEL_VERSION
handling in uki.bbclass could be removed.

Reviewed-by: Mikko Rapeli <mikko.rapeli@linaro.org>

Cheers,

-Mikko

> Signed-off-by: Pavel L�bl <pavel@loebl.cz>
> ---
>  meta/classes-recipe/uki.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
> index 326697a06660..a89e92b77869 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -140,7 +140,7 @@ python do_uki() {
>          # not always needed, ukify can detect version from kernel binary
>          kernel_version = d.getVar('KERNEL_VERSION')
>          if kernel_version:
> -            ukify_cmd += "--uname %s" % (kernel_version)
> +            ukify_cmd += " --uname %s" % (kernel_version)
>      else:
>          bb.fatal("ERROR - UKI_KERNEL_FILENAME not set")
>  
> -- 
> 2.53.0
> 

