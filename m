Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC36C55174
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 18:16:52 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2549.1785521801771834613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DWcIlViG;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93108a3c326so139985185a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 11:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521801; x=1786126601; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KDLx9pW+nMYPDFz8v+721vHl2s5HWTphOrH3N0Z3p+4=;
        b=DWcIlViGURAPPBJujy2WmJqTvQWtf6EnNpUChBdvQwcfdfDtTwx80xM52UFKtanjtF
         rANmBP+jOpPo9IT3Apz4oP8mLqOuYgoVRl52zfN8vX6/o1aSEZMhemYJ7dEB+NKrBoxI
         7zDd6QknyEy8eAySbePqDvqbD30gCLYhKHSaVwC1R/oUrxRuPEZH5ByAS/SbT9GvRPdk
         mrXL74S9Hb3xNYAU3dMWJWDcSt6X+gpIt4bxD1Vm+djaHzERaXQhamM+HjQXreic4xNA
         L+rm745bA0WY1pCTVV5Bnac2KZM1xVl0AbAwj/6kUfo4iU0TF84UJWPLtRkWKo2IWJM3
         tspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521801; x=1786126601;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KDLx9pW+nMYPDFz8v+721vHl2s5HWTphOrH3N0Z3p+4=;
        b=EMldxIRqkKbMLBgM0/gysYh5AxjsdtEBM2mqwrvsPEXsK0ysryV9oH2Qgp3ifS5uB1
         CdnSajtvdje4qS5ZJGK1wmZaSwFbQSPANQHImyxR8LeaS0ldpMMJ6Nd7QBja3x9ZijYW
         leKImuVmAfUnTHvpSuDaCS6ijgJFQ70gndKiRl60iPnuXH8tKyyuYy9w5wMdYdIHGPIN
         +eyc6uAA6TQzUf55p9SivCiXCSRDMO7kga2MfER/BSUUmHhhdxHuEbTUXzFAMrKZxQAH
         77CtpXlwxNj8ynDVyJWdN6WDqhMFRDrt0+ggQHcsK6EWq+rizFBDchOmWwLfhymv846H
         G+mw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2/L+LR9DKwlTtRkxRK+qaZAQhGnqGAittc7fakNhh1Ihyqjh0ZtOFh7pCtBNJskXpVkkBgV23bMAxKxQgsEwbyw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYBxY+KeELdw4an6wX/4o8hvLWGF8wf+OaE5uq26ya4e+ZVNDL
	JSN0t/gXQg+BL4LDnBgxl7IKqCocHHkafKBkILcng267yRftHhs2BO4VnDQ+5w==
X-Gm-Gg: AR+sD11jy3fusLL6nROSYVhunj0YtAr5ApI7HYM+du/nigbxwIbVnEO/VzvC//iwaGK
	ahaF5zKksmcMZHmkC6lRpCrBSLnPhZlBl6LYvPE3ByfNEmISxZohY8JFsNDwD6RMhYDE5Gu7763
	uFGrP7NMCPJGpGKkyOXcb9MCil2O3V+0u9afk388G+Ze8vo2FN7jYDt5y/8wT4yz4yGXTzO1G5K
	16m3PepY3O+YwYW0VU5c23Vp3nUq5DLNhKZe9dKTaL+j6dJmA1NYtxtyEmK3YBBcyNZo6x/EkaY
	5CXaEFWX/rYbugLyu10i2aJQve15RXdopyCkyVfpNIIX3Z/2SC7veOZPb4WEPor5dLlyglAgOuw
	mhw04f4QgBa1jm90boIjNjqgC++dvJcH8lk3TPC+v/W25ogAH51t6MZp1uyJpKTFKLQBSCXmWoU
	sroHnVmIpcTNrUXFSV4GShHikYdOwq+fWSNRwdsQNaZWwCCPPT5d+6JkCdUC1du27to4TVWBPsT
	w45twyAw4qk1a1ntk/4KBRBsvCipAUXOnrreWfaxw==
X-Received: by 2002:a05:620a:4104:b0:930:e628:319c with SMTP id af79cd13be357-934a113f7c5mr135912285a.20.1785521800608;
        Fri, 31 Jul 2026 11:16:40 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349bc6d810sm114406485a.21.2026.07.31.11.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:16:39 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:16:37 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org,
	Sundeep.Kokkonda@windriver.com
Subject: Re: [OE-core] [PATCH 4/4] populate_sdk_base: add kernel-devsrc via
 SDK_TOOLCHAIN_LANGS
Message-ID: <amzmhfDuP_gWGzid@localhost.localdomain>
References: <20260717121849.2163115-1-Harish.Sadineni@windriver.com>
 <20260717121849.2163115-4-Harish.Sadineni@windriver.com>
 <14897601110b73964d7403e143dd1fb4b1107fc7.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14897601110b73964d7403e143dd1fb4b1107fc7.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 18:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242453

On Thu 2026-07-30 @ 11:41:15 AM, Richard Purdie via lists.openembedded.org wrote:
> On Fri, 2026-07-17 at 05:18 -0700, Sadineni, Harish via lists.openembedded.org wrote:
> > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> > 
> > Add a new "kernel" value for SDK_TOOLCHAIN_LANGS that pulls
> > kernel-devsrc into TOOLCHAIN_TARGET_TASK. This allows kernel
> > development headers/sources to be included in the SDK populate_sdk_base:
> > add kernel-devsrc via SDK_TOOLCHAIN_LANGS
> > 
> > Users who want kernel module development support in their SDK can now
> > set SDK_TOOLCHAIN_LANGS = "kernel" explicitly.
> > 
> > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> > ---
> >  meta/classes-recipe/populate_sdk_base.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
> > index b427ff2761..1d9faecc16 100644
> > --- a/meta/classes-recipe/populate_sdk_base.bbclass
> > +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> > @@ -80,6 +80,7 @@ TOOLCHAIN_TARGET_TASK ?= " \
> >      ${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
> >      ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
> >      ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
> > +    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'kernel', 'kernel-devsrc', '', d)} \
> >      target-sdk-provides-dummy \
> >  "
> >  TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
> 
> There is a different thread where we are discussing adding
> SDK_FEATURES. I think this should become an SDK_FEATURE as part of that
> work. It should also probably be called "kernel-src" as "kernel" is a
> bit generic and could mean multiple things.

Message received!

> Cheers,
> 
> Richard

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242337): https://lists.openembedded.org/g/openembedded-core/message/242337
> Mute This Topic: https://lists.openembedded.org/mt/120313590/900817
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [twoerner@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


