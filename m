Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4F6C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 19:04:12 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.24296.1750878245215032900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 12:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E1PzU91K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so103451f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 12:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750878244; x=1751483044; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X0m9nf05MD2dLQAN0oJ+zzYfofmx479B51Blqo8zH4=;
        b=E1PzU91K7CVpqIXyGzUoNmXZJ4KPe6do4ChAX0z31BFeJ4PB4ad1lEQe+yZKEDszeq
         Hibh0I2fa6ofNGONFqnFnMauJLfVkje1V5Xo1FRUkpXjEoyG4lUnOhDiGV6k1TrFipAU
         ZYxOcZN9kTyTxfZ0pSRkxvW2rZW1TEsBnuc+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750878244; x=1751483044;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4X0m9nf05MD2dLQAN0oJ+zzYfofmx479B51Blqo8zH4=;
        b=fPkQgebNgYEpX4NTKVByJWrs7kjXtZ3x6JWrVEWbu1qblQm54s3/6b6JIwaMCNiFlp
         aXYQGk0GzfVpPDQQTJVOFSRIqPf/GzZOvQPjPcsjSn35FUEw8NghUwz3L6PY77z1kCt2
         5KxPCaq7SzKBroxPFu/UCno27Lr/b/B88PZYcingZ1Sq22ifghgNzos0Jz0rlK5yheLw
         3qMEjvV0IsgtRrmpG+5B8tGyMorEyM4ZLxGxB1ry7u02aNzi7tYLcOcCCV7/zK5K6vFC
         YFE7b8ThbAn/5I25fRLtAmrTq9eZllSU72YJkGRC54J779RCSd2Z+UWTLSuP9lxfdpS7
         +9ww==
X-Forwarded-Encrypted: i=1; AJvYcCW9aWS1uNzO277h0o7OrfJrC5RAnpd2CWo4gNhu2DTJFabujwrSRdVDCibVnX6/ALFsRCCBqeBJrPedOmLzm6n7VQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRaypuLUSUql8zkWCJlqGvhku8A1c+IJCf1jb6XdOMVVQBafBN
	KOlRgFL2uPGGKl8OjRv/Jp4GwPuOvvp2zkpHW2PHAW3jBL4xBkmTuU7yf21N9zfdgcM=
X-Gm-Gg: ASbGncu9Y0A4GRUO+T9rRf2F6G7c5EIPcW4jTMy5nAPMbgYKEGcG9YWlKsK+KCR5lEs
	iKRT+RKT0pX/DFJRrmGP+Sucn7MbgQaKAZamFX9dfIIQVvttuB8kYcEj9lYHsum+DTWJheNSMJy
	lf8a93d8oZbogVhcsQ7yJrM2gYYZojqYtxBX8PpBtQEjL8b3zONVpkSQrHniACcG0lYrBTmWtVK
	IyFHoni2cGh3SIDaE2lbWrnNXiJjH6y0CRrXFdFcKbPA50/4itoJKMujg5VlsKd2lDlGkjUp+kZ
	xvrV5W+GsDZGWW1SZGbjUw450d2rq326z5Z3Wy7JqdqYdpG4MKh86cAysWvRtuULzn8Iz/Qdd4k
	eiNPnF+KqK840CDAH78FEkjl6GItp8uA6W3ddfRoX8Kcr4VDnicXdTeQdawDIuQ==
X-Google-Smtp-Source: AGHT+IFka1VYcpjZ1FZO8poitcBGu04Pa5DtIrRRKQ+P/qB4yP1w42p8QHsw7un68cn2I52pZ8+1wA==
X-Received: by 2002:a5d:6b81:0:b0:3a5:3517:de3e with SMTP id ffacd0b85a97d-3a6ed6420cdmr3245687f8f.35.1750878243385;
        Wed, 25 Jun 2025 12:04:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1c1:2228:ff4c:9514? ([2001:8b0:aba:5f3c:f1c1:2228:ff4c:9514])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e811724bsm5164012f8f.100.2025.06.25.12.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 12:04:02 -0700 (PDT)
Message-ID: <328d3d6f05c1e8f4acb2fbb43602bd248f3f955e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 8/8] psmisc: fix runtime version when using
 git shallow tarball
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 25 Jun 2025 20:04:01 +0100
In-Reply-To: <515c93ba-5b3d-4007-a4a6-a5dffc1df668@windriver.com>
References: <20250624104155.559827-1-yi.zhao@windriver.com>
	 <20250624104155.559827-9-yi.zhao@windriver.com>
	 <47b30bbd84054b6ff891f6d7e74d582c9374f7fe.camel@linuxfoundation.org>
	 <515c93ba-5b3d-4007-a4a6-a5dffc1df668@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 19:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219331

On Wed, 2025-06-25 at 18:22 +0800, Yi Zhao wrote:
>=20
> On 6/25/25 16:19, Richard Purdie wrote:
> > On Tue, 2025-06-24 at 18:41 +0800, Yi Zhao via
> > lists.openembedded.org wrote:
> > > The runtime version of psmisc is generated by 'git describe'
> > > command in
> > > misc/git-version-gen. But when using git shallow tarball,
> > > git-version-gen can not get the correct version due to missing
> > > git
> > > tag/commit messages. This actually breaks reproducibility, since
> > > the
> > > generated binaries should be consistent regardless of the source
> > > code
> > > packaging format.
> > >=20
> > > Add a .tarball-version file in source directory. Then get-
> > > version-gen
> > > can determine the version through this file instead of 'git
> > > describe'
> > > command.
> > >=20
> > > Before the fix:
> > > root@intel-x86-64:~# pslog -V
> > > pslog (PSmisc) UNKNOWN
> > >=20
> > > After the fix:
> > > root@intel-x86-64:~# pslog=C2=A0 -V
> > > pslog (PSmisc) 23.7
> > >=20
> > > Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > > ---
> > > =C2=A0=C2=A0meta/recipes-extended/psmisc/psmisc_23.7.bb | 1 +
> > > =C2=A0=C2=A01 file changed, 1 insertion(+)
> > Does adding the tag parameter to the url fix this?
>=20
> I have tested it. But it doesn't work.

I was curious why not and I had a look myself. The trouble is that the
way the shallow cloning works, it squashes out references so "v23.7"
becomes just that, not "refs/tags/v23.7".

I'm not 100% convinced the fetcher is doing the right thing here. If we
could convince the fetcher to preserve the refs/tags piece, then this
probably would work...

At the very least I wanted to document why it didn't work.

After writing this, I did dig a bit further. If I change the fetcher
like this:

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 0af8070080b..e7b030998c0 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -634,7 +634,7 @@ class Git(FetchMethod):
             all_refs.append(line.split()[-1])
         extra_refs =3D []
         if 'tag' in ud.parm:
-            extra_refs.append(ud.parm['tag'])
+            extra_refs.append("refs/tags/" + ud.parm['tag'])
         for r in ud.shallow_extra_refs:
             if not ud.bareclone:
                 r =3D r.replace('refs/heads/', 'refs/remotes/origin/')


it does work. Perhaps we should do that.

Cheers,

Richard



