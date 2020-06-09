Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.3699.1591696011586503810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 02:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EUbrq/0j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id r9so2180450wmh.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=z4CCcCp1xcwn9tGYnNVqfgTEUc9i/jD1sPN+70bjNZY=;
        b=EUbrq/0j82d7EP4gUoicvjqY7AK5Am1WDQC3uvBJivQ/Czt8nAnvSYcBWn1jGos20a
         hGcZWcMoDrwZM7m4ebcVomdeVld4Tzp0E/iigQSarJZJsKodLaAdivyalmM3y2tbLWke
         L9PwuXcWOwyNR4hnG8TbroS9/LT+BmSns00jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=z4CCcCp1xcwn9tGYnNVqfgTEUc9i/jD1sPN+70bjNZY=;
        b=CD5f6ztPabqtBAKeKhH1uMyBhGkqLsX8YYPBN9bLQYE0cT2cUKV2unDgSV5iSvd19t
         V69mh/T1dp3ozfqdDUZBwuvAMjRotRCWUQ+wrfcZjXllutsB7rg/xyQapO8bEKYekdJm
         35TIUipZjtdCgC5VBiZYT/ynQOO8ut1NzB9V1JOp8er1TQ16YrUy/51/LnS3Mc7CxrKv
         /WLd0HjCLVvgKd3o2Hwwo7yAvYGjb1FdCkL18qgYtgREda43crQzw+YehFyyeKf2uVHj
         sNJfTRTUATRSozsSuFs9/S42xcIUtgzNbvVLlYn2oEeXVjtK+DLzjgvTAKdyWwcHZ80T
         5QDQ==
X-Gm-Message-State: AOAM5310+lMpK3Beut9DPU1S4qpDwmdU57k3juNq4Ob5ebNgNNzm+Iro
	R/08H5cSHsvvNwx+ipsC+kuz8Q==
X-Google-Smtp-Source: ABdhPJyOOemZJ4hEoTmuJwilZZ5vaA2B4Q6KO1fUt2PefeoKbM8XpI7UPsDPFHGc2FaMigcoQJvYRQ==
X-Received: by 2002:a1c:4009:: with SMTP id n9mr3168931wma.104.1591696009952;
        Tue, 09 Jun 2020 02:46:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id f11sm2703654wrm.13.2020.06.09.02.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 02:46:48 -0700 (PDT)
Message-ID: <46a2f1527c6b547df37ed040c30369975c188f90.camel@linuxfoundation.org>
Subject: Re: [OE-core] devtool and multiconfig: Bug or feature?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda <ricardo.ribalda@gmail.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Jan Lorenzen <jl@newtec.dk>
Date: Tue, 09 Jun 2020 10:46:47 +0100
In-Reply-To: <CAPybu_2pgXgLsvdgLhn60emg5Qh8krRQRNKzQbB5LHfec_YUDQ@mail.gmail.com>
References: 
	<CAPybu_2pgXgLsvdgLhn60emg5Qh8krRQRNKzQbB5LHfec_YUDQ@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-08 at 16:40 +0200, Ricardo Ribalda wrote:
> Hi
> 
> I am trying to use devtool in combination with multiconfig for the
> first time, so probably I am doing something wrong.
> 
> I have created a very simple multiconfig
> 
> cat build/conf/multiconfig/arm.conf
> MACHINE = "qemuarm"
> 
> And then I want to modify bash:
> devtool modify multiconfig:arm:bash
> 
> If then I try to run:
> devtool build multiconfig:arm:bash
> NOTE: Starting bitbake server...
> ERROR: No recipe named 'multiconfig:arm:bash' in your workspace
> 
> So I run:
> devtool build bash
> 
> But that builds for x86 instead of for arm...
> 
> Simply patching check_workspace_recipe does not do the trick:
> @@ -145,6 +145,8 @@ def check_workspace_recipe(workspace, pn,
> checksrc=True, bbclassextend=False):
>      is present.
>      """
> 
> +    pn = pn.split(":")[-1]
> +
>      workspacepn = pn
> 
>      for recipe, value in workspace.items():
> 
> 
> Any idea or documentation to follow?

I think this is something which hasn't been tested before. Its a bug
but nobody has probably tested or fixed devtool to work with
multiconfig.

Cheers,

Richard

