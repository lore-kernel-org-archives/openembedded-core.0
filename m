Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CF3C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 10:18:17 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.18711.1677665895205998210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 02:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fZir2pyG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id e13so1131346wro.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 02:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vwraxaOTI0f0Uowu+mwtWkouAJXTtQm5Mw+uHHTIrt0=;
        b=fZir2pyGUxxPmu13iij+cKB1ZOC06fX0dqjYMTaTnTJzsosnfOinPVD9Fzac5nR/hA
         XIK7fPHIc64/l4kObX4+wP25QlJOfd1IGMUxiWxubHdtm15mxw8A2EzD/CsK5HPKP3Ww
         vgze5eMBSeNrTjuTMpfp7ntekXAnE6kfDkOOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vwraxaOTI0f0Uowu+mwtWkouAJXTtQm5Mw+uHHTIrt0=;
        b=o6knm+G9onJAekDETEXttx26GGFcncl4maesmoi6fDRt3jvWRlEOSeYYfpIZw9dVm1
         MkI9S2r97CWpdhLmxn3pqgsvdy3qnhkPL9H76b2Zcy6BiWwGt1dOONcxCtfbEuMO8GC5
         2c04xJ7qhG4T6oPZyXETUq4OVt+3VbwbSoWABMs4VoCJ8P4QBdIpB1WKDaUShxcEGz0C
         ph8lskAWGqlj55yYlXy/SdkSQUblFexQgkVTtpxuBh54IPcRRbawPRhh8EB4FyYuS2TZ
         AnQiZlxnLleK8kmZlAFQmxaLN5GkZEgxVadrzvQydbYcjrs7nvnciktIahjAO2gZAcDk
         BLxQ==
X-Gm-Message-State: AO0yUKWUPO+K7omPafl8RRYgxrEcCKeb//gWFr3HxGUCm1zD2pfJawDL
	MPVgT5kwRHOyayC8wdRZeymdhw==
X-Google-Smtp-Source: AK7set/yAFw+b3unIbWDtYspFBXNhtN2v1EPCPbB4dmW1d+ZyqBMrydkbSRFW5ut+4L3M0ZYDu55uA==
X-Received: by 2002:a5d:6a8e:0:b0:2c7:145c:68f2 with SMTP id s14-20020a5d6a8e000000b002c7145c68f2mr4398111wru.58.1677665893524;
        Wed, 01 Mar 2023 02:18:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c? ([2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c])
        by smtp.gmail.com with ESMTPSA id m7-20020adfe947000000b002c70f5627d5sm12028289wrn.63.2023.03.01.02.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 02:18:13 -0800 (PST)
Message-ID: <2f16fcecb9cd27461415cb135f1beee5061be1b1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [pseudo][PATCH 1/1] pseudo_util.c: Open file with
 O_CLOEXEC to avoid fd leak
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: Pavel Modilaynen <pavelmn@axis.com>, Mingli Yu <mingli.yu@windriver.com>
Date: Wed, 01 Mar 2023 10:18:12 +0000
In-Reply-To: <20230301000302.93660-2-yoann.congal@smile.fr>
References: <20230301000302.93660-1-yoann.congal@smile.fr>
	 <20230301000302.93660-2-yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 10:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177881

On Wed, 2023-03-01 at 01:03 +0100, Yoann Congal wrote:
> From: Pavel Modilaynen <pavelmn@axis.com>
>=20
> Use close-on-exec (O_CLOEXEC) flag when open log file to
> make sure its file descriptor is not leaked to parent
> process on fork/exec.
>=20
> Fixes [YOCTO #13311]
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  pseudo_util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/pseudo_util.c b/pseudo_util.c
> index 64636b7..b58036f 100644
> --- a/pseudo_util.c
> +++ b/pseudo_util.c
> @@ -1611,7 +1611,7 @@ pseudo_logfile(char *filename, char *defname, int p=
refer_fd) {
>  		}
>  		free(filename);
>  	}=09
> -	fd =3D open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT, 0644);
> +	fd =3D open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT | O_CLOEXEC, 064=
4);
>  	if (fd =3D=3D -1) {
>  		pseudo_diag("help: can't open log file %s: %s\n", pseudo_path, strerro=
r(errno));
>  	} else {

Thanks. I've put this on the oe-core-next branch in the pseudo repo.
I'm hoping Alexandre could run a test build please?

Cheers,

Richard

