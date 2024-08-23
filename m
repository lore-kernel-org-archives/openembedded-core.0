Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11171C52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 16:15:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.418.1724429748093908186
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 09:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RZLyYhup;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so17904445e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724429746; x=1725034546; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WHcUJ5s45hy2sNWxfCjylvEEcFPZqWBZnWjorkHer5s=;
        b=RZLyYhupS9c9o25vUos2ZehZQG/55OPBaZFfxRBRc8mMF+vALjpE8NHcksEapvyoCn
         9PeG4xpLnCVfAb4lMreyFkqEJr5qjj7b8QE/CEUZ+tkLeraWW/cCZzf16iqaxJWNkeQK
         4Q6lPYCIqSj8n6dq1IB2qpr8S6Xu+a81nakdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429746; x=1725034546;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WHcUJ5s45hy2sNWxfCjylvEEcFPZqWBZnWjorkHer5s=;
        b=MDCs+QpzdgD2O/Mi5PLbiKFZnE0FCAffOENt9+t8YH6YVyJVrXgEDydrj3WstpuyBS
         iGeh8Demgvdk3lFBTuS9ROQpT7NnlJZ5Ipgj8sMaM2q968vGtttcreVlas1skOSIl5hc
         0EwmGpexlG1xgvLhMXWcOt+gCuN/T6beJ/WFE3gGAO8ArukQRor3SzuF+0R+zktwiSMu
         3A4BNzqf9Bc2bg30DrGhyQXs/nXiao2V3tu053pWOB5guZwlb+IsKHQ0oFvd0GAtdptT
         JGBpMf99KCWhHjtZagOvc3cgjj6zlSjvCtHvfSRZ2Rh4WKOkbFXGiP+E/uVTMty4u73W
         /gKA==
X-Forwarded-Encrypted: i=1; AJvYcCUT12AVwL2qu4lxgYjKODlcrxaaWT62/idSDDFLoe31meT+niX2ooAq5Ys3EhgACEP4oo7gaKukCzbXXkO6hxrIpg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxpQgAFW5erhCmYlUIhl4/Q4xUUezSM6fFQqLGdc7cLgag9CBJU
	nwD5+7Jn4Ji52da3HPitm2OSq+6HghLIn8GHJTMktpXpWWMAaEDJEtNMxa3/dnY=
X-Google-Smtp-Source: AGHT+IH9RDyalH3idv3d+CH/WdKt/ytdg4EjeoK1jqN1Af7jZO5wjbit89IY+UG4dY+lW8iwB9T60w==
X-Received: by 2002:a05:600c:3b89:b0:426:614b:1a72 with SMTP id 5b1f17b1804b1-42acc8e1392mr22017425e9.17.1724429746105;
        Fri, 23 Aug 2024 09:15:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4f5:df28:3cf9:5842? ([2001:8b0:aba:5f3c:f4f5:df28:3cf9:5842])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee8c2dbsm99797135e9.21.2024.08.23.09.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 09:15:45 -0700 (PDT)
Message-ID: <7da981cc3652bd5ff14b288e1a7ecfbb56365661.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] VOLATILE_TMP_DIR: Extend to specify the
 persistence of /var/tmp
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@eng.windriver.com, openembedded-core@lists.openembedded.org
Cc: "Qi.Chen" <Qi.Chen@windriver.com>
Date: Fri, 23 Aug 2024 17:15:44 +0100
In-Reply-To: <20240530090243.3927412-1-changqing.li@windriver.com>
References: <20240530090243.3927412-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 16:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203697

On Thu, 2024-05-30 at 17:02 +0800, Changqing Li via lists.openembedded.org =
wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> Currently, set VOLATILE_TMP_DIR to "no", only make /tmp as persistent.
> This patch extends VOLATILE_TMP_DIR to also specify the persistence of
> /var/tmp by following changes:
>=20
> * change FILESYSTEM_PERMS_TABLES to remove symlink /var/tmp -> /var/volat=
ile/tmp
> =C2=A0 for the packaging process
> * update base-files to create /var/tmp as a dir not symlink to /var/volat=
ile/tmp
>=20
> Here is an use case:
> Steps:
> 1. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
> 2. docker run -it --rm poky:latest /bin/sh
> 3. /var/log /var/tmp are deadlinks, and cause "No such file or directory"=
 errors
>=20
> Root cause:
> By default, /var/tmp links to /var/volatile/tmp, and /var/volatile/tmp
> usually created by initscript(sysV) or systemd-tmpfile.d(systemd) during
> boot up, but for container, initscript/systemd-tmpfile.d will not be
> executed, so /var/volatile/tmp is not created.
>=20
> This patch provides an option for user want to use container, set
> VOLATILE_TMP_DIR to "no" can resolve above case.
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>

Sorry it has taken me so long to get to this. I agree we should try and
fix the issues you raise here but I don't think the patch is quite the
best way to do it. What I'd propose is that we keen the new fs-perms
files you're creating but change the tables variable to simply be:

FILESYSTEM_PERMS_TABLES ?=3D  " files/fs-perms.txt \
                              files/fs-perms-volatile-log.txt \
                              files/fs-perms-volatile-tmp.txt \
                            "

The other references can then simply work along the lines of:

${@bb.utils.contains("FILESYSTEM_PERMS_TABLES", "files/fs-perms-volatile-lo=
g.txt", "log", "", d)}

and we drop the VOLATILE_*_DIR variables.

I'd suggest two patches, one separating out fs-perms-volatile-log.txt
and the other adding fs-perms-volatile-tmp.txt.

Cheers,

Richard


