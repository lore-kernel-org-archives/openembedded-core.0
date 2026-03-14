Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894BA10706C1
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 10:00:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6914.1773482415201758898
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 03:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b3JDbzBR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so12855845e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 03:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773482413; x=1774087213; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4N8DPgI30RwvLLkGJIXbiq05x58xcpNvMy8UsfySzck=;
        b=b3JDbzBRIm81/Bk6iI/VmV+dX6CrhxPoXPW+K+M6hseSOB97jXOHk3q69ThYQBG/Ps
         HGkE0v6QaL9xuCnqaXiGA71SBkHsZIB+oMNpZMrxywq/aSSMreCtT/4iVuKHOZaDcCOM
         sr07IYpcP4fDfc1XvxWGhIENXx4Nwx+cNUNGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773482413; x=1774087213;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4N8DPgI30RwvLLkGJIXbiq05x58xcpNvMy8UsfySzck=;
        b=XtD/lqepkgFWela28Pro1WogZtJVgTNj69syMGlFvN3OCSUHDpB+eTgoMFxlvOgIKu
         Zu7Eubc06Du29Z2Ol4aJ4OT21tlR0DCcFp0UFcBIH5E/xgidmjnQ9kJCoP2B2rrGD0oS
         AagnILBHE/gGTtqBpO3F6VmQkGr9xMr3MeXKr8TbOyv9tsnLIasU38gcekGcqgicLpUC
         nqutwQSggSZcIfmXYJQG6W/JDzL8cQZPaNDy+Wvg3DgA9fVDw6gFr6ErtPIJrfdiNmbE
         K3yptO1s7rbOi6m6CxBk4ipDpZz4m4hf/Ij9klQa/lAXoaj4KFnpOddHwnXkGZpPabgq
         tCjA==
X-Gm-Message-State: AOJu0YxuhFOlyotI1rpFNZfUSLdLLs0fKGc7xPPhhvuXYueTzcppKqBS
	ejmYw38zT6s2E16FlXjIIcF9RIKAnB9WODhp7JWkc2Sx4TvUGl6fetZOobL+GToW84XEKSQKy+D
	Q2rqnOsM=
X-Gm-Gg: ATEYQzxGi+QNFI5RV1sDAeoKGSjGsegtwFMqR0oBdZqYohkI0HdhxNc+3iqloRRTMSz
	sD376M8PO73dKmRS3SCewNUepcmuxBlLs+7SCHFaAky08v3dH+jCFoZP8Hko2ebiaTrVHcf80nx
	8wkjJCcpA2aQg4hEh2pwVmz+k8Wu5OMffj07My96kD+dRO75ZSQJ/O2x01uPtR99sDuy59C167v
	Ui7MBp9UqQRFm8PEH7KR/pnKtKasK8zYJIWjY4CF4ZhMBfaA7uhRIEHI9JEpq9LU3xpTtJZ4VjS
	2jgTBR5OWGl0vVCDKH/fVKYFScHxwxvkXausJGMUgDO3a74ExxlbrPjU3I7YDZbXPwO2w3A4S+W
	3lu0GL1m4UQyPlYCkAV1eCbFm60XndI1WYhP4+lxaIAYGlnuvobr6T6Dt61exhOkgGLo0KuLHmJ
	R6oNbbJYY6oNUaVRGxv1qjPzzf8QAmsaYkUe262LonOk8XvEZP+hi/vPbE9g7gG2jzDBOSfVN0E
	3si9ZlkIOgGXrc=
X-Received: by 2002:a05:600c:3590:b0:485:3b34:2f61 with SMTP id 5b1f17b1804b1-485566c9464mr112774535e9.7.1773482412635;
        Sat, 14 Mar 2026 03:00:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1366:c81f:8eb8:9990? ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854e2537c3sm271050815e9.15.2026.03.14.03.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 03:00:11 -0700 (PDT)
Message-ID: <64d89dc312e87a607ca8516ad90ea36707c56fe6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/5] meta/dummy-sdk-package: Improve SDK dummy
 package handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org, Joshua Watt
 <JPEWhacker@gmail.com>,  Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 14 Mar 2026 10:00:09 +0000
In-Reply-To: <189CAC32AB5A06DA.1508127@lists.openembedded.org>
References: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
	 <189CAC32AB5A06DA.1508127@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 10:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233081

On Sat, 2026-03-14 at 09:47 +0000, Richard Purdie via lists.openembedded.or=
g wrote:
> Currently, the dummy SDK packages are re-running for different SDKMACHINE=
 values
> when they should not. The usage of allarch is broken and not triggering t=
he right
> PACKAGE_ARCH value due to the deferred nature of nativesdk. This was prob=
ably
> broken when we switched to add deferred classes.
>=20
> To try and make this all more explict and less prone to breakage, switch =
to calling
> oe.utils.make_arch_independent() directly.
>=20
> Add the 'special' package architecture values to SSTATE_ARCHS so the syst=
em cna properly
> track them.
>=20
> Remove the pointless tasks we don't need from the dummy recipes, mark the=
 packagedata
> as machine independent and then remove from the conflict list in sstate.b=
bclass.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This patch fixes real issues with the way the dummy recipes are
currently being handled. Unfortunately this change still isn't without
issues, this is shown by the failure in meta-virtualization it
introduces. It is starting to feel like I'm somehow targeting Bruce
recently, sorry!

The failure this patchset triggers in meta-virtualization is here:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/3215

The reason is that it is doing this:

recipes-core/meta/container-dummy-provides.bb:require recipes-core/meta/dum=
my-sdk-package.inc

which is fine, I hadn't realised layers were using that but it should
be something you can do. At first glance, the fix looks easy, just add:

DUMMYSDK_PKGDATA_VARNAME =3D "PKGDATA_DIR"
DUMMYSDK_EXTRASTAMP_VARNAME =3D "MACHINE"

to the recipe. That doesn't account for the sstate.bbclass and
sstatesig.py changes this patch is making though.

I've never been happy at having to add these individually to the "feed"
lists in the first place and another layer trying to do this
illustrates why.

I'm at a bit of a loss on what to do from here. Options could be:

a) move the recipe to core and add another entry to
sstate.bbclass/sstatesig.py . That doesn't help it anyone else does
this

b) Create some layer.conf variables which allow these to be
defined/added generically. That would need careful manipulation of the
hash variable dependencies to stop things rebuilding like crazy.

c) Find a way for the core not to need this list hardcoded. That would
be nicer and removes what looks like a horrible scaling issue we have
right now I don't know how to do that.

d) Something else

I'm open to ideas, these changes are needed to unblock the spdx
changes.

Cheers,

Richard

