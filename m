Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.5138.1602526330932469208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 11:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cdtV33pq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id k18so18453419wmj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/kBgafezEU8X2jebQQRJIZCWYRH0kh/qF9/vp+hKKQU=;
        b=cdtV33pq6J2NhgFZbRfmw/UkP7ma3lRLc5k9kpfl2XuDapu77wXyz2JQtlbhE/HbeN
         9XSpYhIpWAaZB8xZXgcAMWihxf/dfRip3oMvlKOXviJ/Qbd/iPluj12QtCGXMy+xDNmK
         v0oSEPCWeaRazUBNrl5wkVRUJVOrkVd2rH5vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/kBgafezEU8X2jebQQRJIZCWYRH0kh/qF9/vp+hKKQU=;
        b=PgOD/aQrvb/2i6hY3527UpBUJ+m8ATu8OYE+eJk4niBhJzbo3TbNWeUoNJTaU9cm+h
         xuCk9wR9heBbPaN4rl1Tp2ck+uzjouK8r6lUcCpLg4Qeud8DAHWKygM9L3XIGLb6HJev
         Ku0oykdir6GIegbF62uZcteLw23JM7cBg9l5nadv2CDzGtMo/XjPFvppAsaiTIaZ58PL
         vfoLh2bplPTO/Cj2M3OFXEmqAFWdUNg6HeaGLs8QofkBz3lgvVCifZJslsnVA75JnRN2
         q5Lg0/kx4aiiSxcFjAuFscnMr6IyzXgnyJAgSTu5vGJozw9+AFU+FLdu+hRsjalrg+q4
         FKXA==
X-Gm-Message-State: AOAM533/C+4W4l6SCnEANZJdxXH70996a8P3oV23/1r9/zZpZwncNZNH
	LkOsQLLQAsFeKzeRblP1nspZlQ==
X-Google-Smtp-Source: ABdhPJwAX9w0O3WDDDWW/JpqiyU98kqdbXRcpDdDIX7K60Wvi5afiiC4Neq4mTTCcmPmlM8P47RMCg==
X-Received: by 2002:a1c:3d86:: with SMTP id k128mr12160887wma.153.1602526329140;
        Mon, 12 Oct 2020 11:12:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id d2sm15901892wrq.34.2020.10.12.11.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 11:12:08 -0700 (PDT)
Message-ID: <5139e0e5374c61913563c9cbc1d4d80fa13bc350.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] externalsrc: No single-task lock if S != B
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Douglas Royds <douglas.royds@gmx.com>, 
	openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Date: Mon, 12 Oct 2020 19:12:06 +0100
In-Reply-To: <20201012013141.473-1-douglas.royds@gmx.com>
References: 
	<CAFimOt5fQ=0JKpteCCAbDg14u-itABV7MEULuQEm3dUTFj89Lg@mail.gmail.com>
	 <20201012013141.473-1-douglas.royds@gmx.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-12 at 14:31 +1300, Douglas Royds wrote:
> From: Douglas Royds <douglas.royds@taitradio.com>
> 
> Allow different recipes to build things from the one external source tree in
> parallel, but only if the build is happening outside the source tree.
> 
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/classes/externalsrc.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> index 3618b99a86..88408add71 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -86,7 +86,7 @@ python () {
>              if task.endswith("_setscene"):
>                  # sstate is never going to work for external source trees, disable it
>                  bb.build.deltask(task, d)
> -            else:
> +            elif os.path.realpath(externalsrc) == os.path.realpath(externalsrcbuild):
>                  # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
>                  d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")

Failed in testing unfortunately, looks like these can be None:

https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/1893/steps/8/logs/step1c

Cheers,

Richard

