Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413DBC3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 19:53:00 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.25501.1702842777141307692
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 11:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hcy1eAcF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3363aa1b7d2so2161224f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 11:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702842773; x=1703447573; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3fiCzSU7ZhdOYpfMVLDspF+WKwUQHoHWrurO7uFeKk=;
        b=hcy1eAcF7Xovh/OCO08ste8vLB01KJNqfvm4SaO+oqg45XMXx40xjB8lPxs6yfrq8/
         UzFpEKOPcs6jnalHUXKxhxPyMXyDJZLgPk0yRdcXgJY5WTn0ul8UiHWRvQUhTXZj4i3W
         mUx6FYH37N2u+/nhDzvNm1rwBWUogdfNY2UTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702842773; x=1703447573;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3fiCzSU7ZhdOYpfMVLDspF+WKwUQHoHWrurO7uFeKk=;
        b=Rds9zy2nIUriF007DRrSqMV8/w91vxD4q6XmWCm66FLrLCa3blxuZGNfqsvkz78A57
         b21v1Z+wKhnvA7ObvsKzJLdXZvoYJK5ZNaYnDfyM9yWy6vosgw5g9tZ8lK5G3E9yNKCg
         vMWENYg3HMKf23HBpcYxtsvTWgKbVXixd5mLhdlvFunE6iPyZsQ0ugO8MP9p5lVUWW29
         SySU+l4MmmNwggwLiygESl+1KF6WTNkfWM9DFtdwBlLCoGnomDxxscI5B2siOratpyyw
         dEm5JWMZDevU5+cCU/fk19ZK/Br5htA2AY8ZBnxMlSIxzJg49QygqjayxGHvE3DnJhZH
         v5JQ==
X-Gm-Message-State: AOJu0Yz2uZaqOPWEeIcyDrpy9gCiniH+nxYRhpgHBtdApvQ54J1wxn2d
	3EP7Y/7EOQ8m9nHnZyAZB/khig==
X-Google-Smtp-Source: AGHT+IGG/sgRFsVyyOskvSQAV6AsycACYPobKds7womePjZDOoKrAPE04tgf/RipP5ildO2ajQRkIw==
X-Received: by 2002:adf:ed08:0:b0:336:5cfd:9c7e with SMTP id a8-20020adfed08000000b003365cfd9c7emr1063538wro.165.1702842773480;
        Sun, 17 Dec 2023 11:52:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c690:9059:96b:687e? ([2001:8b0:aba:5f3c:c690:9059:96b:687e])
        by smtp.gmail.com with ESMTPSA id u23-20020adfa197000000b0033666096650sm1917827wru.42.2023.12.17.11.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 11:52:52 -0800 (PST)
Message-ID: <34bee488217f82e9575f52dff15447474bf63d00.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: make do_symlink_kernelsrc
 reentrant
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Date: Sun, 17 Dec 2023 19:52:50 +0000
In-Reply-To: <20231216135306.188070-1-ecordonnier@snap.com>
References: <20231216135306.188070-1-ecordonnier@snap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 19:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192591

On Sat, 2023-12-16 at 14:53 +0100, Etienne Cordonnier via
lists.openembedded.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>=20
> The function do_symlink_kernsrc is not reentrant in the case where S is d=
efined
> to a non-default value. This causes build-failures e.g. when building lin=
ux-yocto, then updating
> poky to a commit which modifies kernel.bbclass, and then building linux-y=
octo again.
>=20
> Bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15325
>=20
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 9ff37f5c38..130bedd901 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -194,6 +194,11 @@ python do_symlink_kernsrc () {
>              os.symlink(s, kernsrc)
>          else:
>              import shutil
> +            if os.path.islink(s):
> +                # this happens for instance when a poky update forces sy=
mlink_kernsrc to run again
> +                # after s was already moved to kernsrc
> +                bb.warn("%s is already a symlink! Not symlinking kernel =
sources" % s)
> +                return 0
>              shutil.move(s, kernsrc)
>              os.symlink(kernsrc, s)
>  }

Usually what we recommend is that the first pass does something if "if
not exists X.org; cp X X.orig; fi", then you can always copy from
X.orig.

As Bruce says, it definitely shouldn't be a warning, this can happen
quite normally.=20

Cheers,

Richard

