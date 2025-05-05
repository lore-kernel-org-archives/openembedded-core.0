Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA32C369C2
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 07:14:45 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.44695.1746429275791212331
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 00:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ISYnOWd2;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54ac9d57173so4806583e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 00:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746429274; x=1747034074; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W43rHfdPg/C5IMOW3dpW9DSD/xXsX7P5rHzCI/L4xZ4=;
        b=ISYnOWd2vvGxQfyRQ+FKrjv4iJiBQpW6D6OwyYPKwXSbnkOfjBGGC01gSCkZY9kfP/
         uRgNMJa2m2Gakpv8YZB7FlFprdTzr6MDBb/So0XsbwY/dIyp1eUikk4Z5rao3WNp+3VR
         yFnGA1HKbYK381R2R7GhTop1qtjwYQjpmMkV+2rJO3f5FkElRBBoP93px0T4GW2geDGT
         q2cWFLQfGdRGOFqcRWYkmCpLQwJRSThp1XlLbbz4FpoW/AqMUeHFLTtpBA2kRtPl9LcC
         rKhAJQEjvm5i3U6pj3tNGTEJC6y4i9UGlBl6OHAW0NSRo1gZzNf3qRj3SofI6ffIQstV
         RArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746429274; x=1747034074;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W43rHfdPg/C5IMOW3dpW9DSD/xXsX7P5rHzCI/L4xZ4=;
        b=T9tSKwZy4q+rpe9mS4qXBSSOK+z2ah5y/6u+ftzDYXEsJYLt98ydgLBSfwd7nXDX3L
         R4XcEnF8b9nprjeNsnl3lF8FhlsBPL4pqloz9BYx2XQOE1MnTfu/Xob1aPMXP38tr6eN
         FGWXdBa5kyTpVzOUmSbE6qiHa+VmN4EKWCWI81oaR60QMnlVs6yNoNkMt/HgyOtk1RBE
         U9bOhcmdu5Ie8yC1C6xWssjMYd1gb2/U6nnnV62oWxayGCPjmpjGzt/bNt78ZbDr5iXX
         lGjrr1ELScZw4QCbfzEYC0GqwTe37oALc3O58490vhxiQmdBgv5ZpbITll3kO8c8WXjv
         8+bQ==
X-Gm-Message-State: AOJu0Yz+CQS5QsNVwO6CC5FtJdU+SDLxT8E3NsoiQnwqmDzoeixBZgjM
	c5kzd69RuKRGB0fwoaA5qCnmS8IZy1EaLqCnasxl9k4IadZgP1O2OreXj08E2Q07HybyFS9+Kx9
	iqQQ=
X-Gm-Gg: ASbGncsF7Tp/2tCVohRwsEgMFyPtZQSn9fiEqq2yTmouUOU7AZNK0viL5Z3wmQpX4/6
	SXMEB3wC3JaJW8ddoAZgyy5aBpndklu7zPL9Tt3NeCkSDPhW+KaW7vEE/Pb3wQ2PSvnNS+1FwkI
	FBfBaz1bm2ttzorZqS8jiHmybGz3ST/EmjOw2R7ceI3FLSDg0rnK/kjdhcpvnp9IeMHMEeqml9H
	k4L1u+RHTl3gtekGJzHQINIEuYRfGl3OEeBEDrJ7r+m+nH+GP9UUQ/eDXc26BbbcDhGYA2n/Gpr
	sEkSI94Q771GqvFn1Z3SCb4pEjRpm1hQIAfatG8WXsAmq5Y7SHGBoK9KMZFgapW22lZAthc0iQ=
	=
X-Google-Smtp-Source: AGHT+IHgTYFxyi5rcE+nhL1HckfWFJDxwDlDVMSM/htvxouedWwtnstD5502FdEvEKrHcVg6S7BzyQ==
X-Received: by 2002:a05:6512:10cc:b0:549:5769:6af6 with SMTP id 2adb3069b0e04-54eabeadccamr3019279e87.9.1746429273670;
        Mon, 05 May 2025 00:14:33 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b176dsm1585834e87.14.2025.05.05.00.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:14:33 -0700 (PDT)
Date: Mon, 5 May 2025 10:14:32 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] bitbake.conf: pseudo to ignore vim and less
 config files
Message-ID: <aBhlWHmuaH9DVRNj@nuoska>
References: <20250505064410.896233-1-mikko.rapeli@linaro.org>
 <24ec9d9d4bfe39a1d1e3f7d0d00e18cd11f41cfa.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24ec9d9d4bfe39a1d1e3f7d0d00e18cd11f41cfa.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 07:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215989

Hi,

On Mon, May 05, 2025 at 08:10:21AM +0100, Richard Purdie wrote:
> On Mon, 2025-05-05 at 09:44 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > vim and less always write to these files in users home directory.
> > Using vim and less via pseudo in "bitbake -c devshell recipe" and
> > outside of pseudo triggers pseudo aborts which makes interactive
> > use of devshell difficult. Fixes vim and less crashes and related
> > pseudo log entries:
> > 
> > inode mismatch: '/home/builder/.viminfo' ino 33270730 in db, 33269736 in request.
> > inode mismatch: '/home/builder/.lesshst' ino 33270625 in db, 33270730 in request.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/conf/bitbake.conf | 1 +
> > �1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index b1dae17267..9cb70ee999 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -748,6 +748,7 @@ PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysro
> > �PSEUDO_IGNORE_PATHS .= ",${TMPDIR}/sstate-control,${TMPDIR}/buildstats,${TMPDIR}/sysroots-components,${TMPDIR}/pkgdata"
> > �PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/deploy-,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/pkgdata-sysroot"
> > �PSEUDO_IGNORE_PATHS .= ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR},${S},${B}"
> > +PSEUDO_IGNORE_PATHS .= ",${HOME}/.vim,${HOME}/.less"
> 
> You can probably make this ${HOME}/. which would match all config files
> in $HOME and save us getting a load more of these being requested?
> 
> I'd hope nobody is doing builds in a directory starting with "."!

Ok, I'll do that instead.

Cheers,

-Mikko

