Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BD1C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 12:57:01 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.13943.1741870618115353404
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 05:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QuA/KVNX;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39130ee05b0so907889f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 05:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741870616; x=1742475416; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZBxg8J/Q26xrmXMAbxAUKkZJ1/2Aj5LVHW1aXZ0mKcU=;
        b=QuA/KVNXM++8f+bI+IwkTKIbTGiin0aH+IP4cp0Grf49y3+vw7na6NowxjCACtfuzl
         24E8DA7gNmFHup4QMphn0xND76MheKlBiInXjGQ1uK2Q3PBWOk9GNVXkqvhdKRc/EDa7
         xTlvlaFaiHJDdjY3xZtRuuERU2AObnBD14XuH3FPNlqfRFpiCA1pJc8EgJ9LmfWWWT1U
         7PcnIBSnI6wE+uC89pXcyVlWLGv05gkH10CfQrbljrWrk7i3Kt76crcy4wK41Uu7mrZ7
         lto94f54Iykqj+ivd00EkpqsFXWjmr568ASQQprXFh27WsBSMJcE8ByWQT4s3mavweCN
         ACsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741870616; x=1742475416;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBxg8J/Q26xrmXMAbxAUKkZJ1/2Aj5LVHW1aXZ0mKcU=;
        b=Sr+xdajI1pr8JLceoadMtaVdy9KBJ0/AEQ6rbfxDED622ujDARu6fkOYanLSEoaiWv
         QQSGzmh/PioZVjZxlqA/ZjsqftqqrxXWSjV43rluGYX2ufaQuFHFyF2Y32RY7dRpuiVK
         H5scouDXkqtQLRT8CMpMcwiqO+cjC7wHZwmv0oPHgpNRrK9vnxJde+0Ta3p24EslZCKV
         OZpp9YdVQJsLteaqpGaEaaxKMAnqCg4s2mWvcpGeFybC6eu3ImAMpG6uHej1XvHu2ySM
         n3r0njeeKRY7yZd5J9lCNX/VDsr+d8aVxKy2jnXDcJChfUAEYoGqpXuGrVXb/0Vh5CuH
         t4og==
X-Gm-Message-State: AOJu0Yyyl0fV1tj4nqrl0Sn7fva02JdkQdfTa/dU+AlBIVJpvIbSGL1t
	beEVYJaaN8wVqGAt8n6zEUfA/EJTLh2txSZFnUHA8AmSRDuL2T5s
X-Gm-Gg: ASbGncv+D3w9ugtljI7nHakl7yNeMQIgdy6vzjBpAZu5d8mQsTSagi5Rb4nKDkKYykO
	pKw7N70hiwPIESFqX7Jl2dOyT0FZgm5xse/XKnE46SWibmdV+K3LsTvyaxn1LbUcc7Ww5fGssU3
	gdJtrzlAmrIyzquaSnXdgmUjUP/aeDPpl+z4L9x2Lx0v1KwNOMSUvAgT0kBSLtCPiMaNJ49+bZ9
	2+ROacJZj8JkH5FlpomyoBSgnTfPbeyzKE+/13Jb79Yw6FB5HT7P2q6f0VSfZc0XrBIJs4+gqpn
	juFajiRnedzNYhD6nqwjdnNCNhTzjcpdHcS2PES1OOCJyx9RSCkR6sctmedF3FkW2myK4qzgEwc
	Lk39jUgFpuryiTf0RYg==
X-Google-Smtp-Source: AGHT+IGeMs/lk0xQNw4e2j6dI9vhh7aTFoBcDfnHQUDu/yACBKMXOxjtxV2/D/CUXfpyGgVA2NPUmg==
X-Received: by 2002:a05:6000:1448:b0:391:487f:280b with SMTP id ffacd0b85a97d-391487f29camr15108259f8f.10.1741870616220;
        Thu, 13 Mar 2025 05:56:56 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a731019sm54265495e9.2.2025.03.13.05.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:56:55 -0700 (PDT)
Message-ID: <65909b2c17714f9e880e3efbef89f141ac0347cc.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] oe-init-build-env: define umask
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 13 Mar 2025 13:56:55 +0100
In-Reply-To: <CAApg2=QPOhkVMQvKjKwNHaCrcjfkky3iuieZ+xRO6pCve4UDww@mail.gmail.com>
References: <20250310094753.1985294-1-adrian.freihofer@siemens.com>
	 <CAApg2=QPOhkVMQvKjKwNHaCrcjfkky3iuieZ+xRO6pCve4UDww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 12:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212769

On Thu, 2025-03-13 at 11:51 +0100, Marta Rybczynska wrote:
>=20
>=20
> On Mon, Mar 10, 2025 at 10:48=E2=80=AFAM Adrian Freihofer via
> lists.openembedded.org
> <adrian.freihofer=3Dgmail.com@lists.openembedded.org> wrote:
> > If umask is not suitable for bitbake it terminates with:
> > =C2=A0 ERROR:=C2=A0 OE-core's config sanity checker detected a potentia=
l
> > =C2=A0 =C2=A0 misconfiguration.
> > =C2=A0 =C2=A0 Either fix the cause of this error or at your own risk di=
sable
> > =C2=A0 =C2=A0 the checker (see sanity.conf). Following is the list of
> > potential
> > =C2=A0 =C2=A0 problems / advisories:
> > =C2=A0 =C2=A0 Please use a umask which allows a+rx and u+rwx
> >=20
> > Set the umask flags in the oe-init-build-env script to prevent from
> > this
> > error.
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> > =C2=A0oe-init-build-env | 2 ++
> > =C2=A01 file changed, 2 insertions(+)
> >=20
> > diff --git a/oe-init-build-env b/oe-init-build-env
> > index 82382f27078..5d830455f74 100755
> > --- a/oe-init-build-env
> > +++ b/oe-init-build-env
> > @@ -57,3 +57,5 @@ unset OEROOT
> >=20
> > =C2=A0[ -z "$BUILDDIR" ] || cd "$BUILDDIR"
> >=20
> > +# explicitly set relative umask to deal with security hardening
> > +umask u+rwx,g+rx,o+rx
> >=20
> >=20
>=20
>=20
> Hello Adrian,
> Could you explain what situation it is needed?

Hi Marta

Some host distributions or some build machines with additional
hardening policies set the system-wide umask more restrictively than
usual. This is not compatible with OE/bitbake. Bitbaking requires files
to be built with the umask u+rwx,g+rx,o+rx by default.

We've had this patch for a while now. There is already a check that
tries to protect the user from calling bitbake in such an incompatible
environment. That tells me we are not alone in this, as the check is
not from us, as far as I know. So why not just change the umask if a
user obviously wants to use a shell to invoke bitbake?

A more restrictive umask setting might make sense for other
applications where sensitive data is processed and even users who are
members of the group should not have access by default. But I don't see
any risk if we automatically switch to an umask configuration that is
useful for bitbake.

Kind regards,
Adrian

>=20
> Kind regards,
> Marta


