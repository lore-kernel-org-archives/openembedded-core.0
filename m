Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.409.1610625846123519542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 04:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O8Th97Gk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id c5so5497769wrp.6
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 04:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=UkalohFMzy1kRAi2xQkpp20RJqWuT2FttvunWvnNiyE=;
        b=O8Th97GkrZZeJbUbs0tcS/fnjyMFS2a+jWbWE/RqkVbgD2R0sNHvCGTxmRiO3fTAM3
         /wEAC4jKt6pnjsESb1VOHgnyXRws+EGNGJjw01s8V3DtzTFZWuuPusNyJrcdnan6kh4N
         hJY8Q3vMzRcj7K2DLIQbri0MZi2+F1yYsWSIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UkalohFMzy1kRAi2xQkpp20RJqWuT2FttvunWvnNiyE=;
        b=LcMyW28Gfn8/JuCLNttdrBvSuP96Xx2eai/A7oK94XYycsnvimWfSiklYfCm4TWd4b
         mTD6PmNZ1up+zyuRCvwnf/SxoZHaoElVsFXl2UvQiFrj0wA+Bn6YOE7FkTnMUj9yKfQZ
         Mw02yMYqQHE1XJVZ+7MeYU5BW49BD+o+KnClVcUBpGa1BEb7Q2a+0WLMZ72mzUC5uBHq
         7/rJGPfBZklZDCle7VrHDc/pAz1sUuMfK8+oro+2911Fhdz6Iv+jz79hQEh7oe4iI17H
         qILqa+vW7AuTytivEoGAxhaJOEExLBbouUYNrI4nu/V7n2Z78Kgu8UOb9lCPUo+WFF7+
         z8JA==
X-Gm-Message-State: AOAM532afwGiiqd+f0uEoXm7Dgevykm10Zr5G/AD6HDtC815jYnHLR1G
	BcQNO7CNe6eZpYKoLv5F4yMG2A==
X-Google-Smtp-Source: ABdhPJzyKEELV4KdL8BAVZrn2g2T5awNBSJLuIA3Lr+XdZdKogO86m+KmBc7KtFoh7U1FWdNH5EcQQ==
X-Received: by 2002:adf:a1d5:: with SMTP id v21mr7598546wrv.24.1610625844463;
        Thu, 14 Jan 2021 04:04:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b0e3:c052:eb93:5c3? ([2001:8b0:aba:5f3c:b0e3:c052:eb93:5c3])
        by smtp.gmail.com with ESMTPSA id w21sm7618509wmi.45.2021.01.14.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 04:04:03 -0800 (PST)
Message-ID: <01f36254e19849396ad43d6eed745b178f2080fd.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] classes: Introduce intermediate-deploy.bbclass
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Diego Sueiro <diego.sueiro@arm.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2021 12:04:01 +0000
In-Reply-To: <830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
References: 
	<830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-14 at 08:06 +0000, Diego Sueiro wrote:
> The intermediate-deploy class is to be inherited by recipes that
> install intermediate artifacts which are not present in the filesystem
> to be further processed by other recipes.
> 
> The INTERMEDIATE_DEPLOY_DIRS variable is a space separated list of dirnames
> from ${D} which include the intermediate artifacts.
> 
> Change-Id: I314987587c1cf0e4cdb28fbf11463f1feb37504b
> ---
>  meta/classes/intermediate-deploy.bbclass | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta/classes/intermediate-deploy.bbclass

I think I should have been clearer about what I was thinking, sorry.

I was wondering about an "intermediate-deploy" directory within the
existing SYSROOT_DIRS, so the sysroot could contain an "intermediate-
deploy/boot/" and "intermediate-deploy/firmware".

I'm not particularly liking the name. Maybe "unpackaged/boot" or "non-
target/boot"? I'm open to ideas.

The idea is to make it really clear these are files which are not part
of the target rootfs though...

Cheers,

Richard

