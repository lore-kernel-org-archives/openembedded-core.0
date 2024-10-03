Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC150CF34CC
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 21:46:29 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.8679.1727991988381215851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 14:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GI+x6lZg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37ccc600466so830737f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 14:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727991987; x=1728596787; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2maAOtdoQFtx7L8kTD+/kfQjlLUUrw6gmi4l83EZbo=;
        b=GI+x6lZgAUkaEH8okN8JryArigippULesgKvYYRMGQ/yhDHyfbd7Ul4UhZIaawGzQ/
         mNYNK1CpTeSVSQip5H/8Kt5XN6I+owyddp0e1ZhrPKUgFt6k46yPPjSSy2hTIHmP2TWm
         ysPHsaRFnq0DS1Btr2v6Cp+74ftXNTIIq38t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727991987; x=1728596787;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S2maAOtdoQFtx7L8kTD+/kfQjlLUUrw6gmi4l83EZbo=;
        b=uRwDfTu4qVbwa7TCgUxPoCmvLn4G9COqs2Gsy2JbW5D6qM7UjROD5khF7mdKbSBJyh
         Rg/1bgCEtEI92Iv5rMTaTrY/NKNwceqs1NAFp051aL2cwYVsOfvW7cSfPXJzIe7WblP0
         sE+XDwO2Wub9uTUAX7WCp5bYAerER8BTsLgJlnwLeiBvlwkLY9JYeZpCfgWukJujPLij
         YgYkXvuHgY7pOnrYuFRe260E0nr8v+EW5x6lxcdfTQVjYItvzSa2iwFHyHetl90Jgkhb
         U+jFmn3ZJ3mqnYWmw4VTToaLxlp3b+MROfD1SJyGZe+G4fd9BDPHtfV9h7bzjulN3YVk
         4M5A==
X-Forwarded-Encrypted: i=1; AJvYcCURgg8xpyFwRYmMV8jFbl5uuTsCMTjOQENfh6CEP9Yw3+5yjiH1wnoBC0hBpBliKWdclVStECJSPMGBxHUz6DlVqQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YysjFEVa5uo4jnImpcnTjUrbAvk2pu6D0uju5HyoPgglE6R0CFc
	aFu9AJ2FjhwZ67vyJeSGnEX6mBEb5zkJ3MacToLw7xIiL2uhEwtadhZgGCLGirY=
X-Google-Smtp-Source: AGHT+IEMtXA14t1AcE/RZ4HVjtMoXtquytLQlkF8yJ54Ll6OGXEGo+9f/reINedOVSXF69IQ0QON/w==
X-Received: by 2002:a5d:5582:0:b0:37c:cc01:f7e with SMTP id ffacd0b85a97d-37d0e8d98e0mr397055f8f.58.1727991986751;
        Thu, 03 Oct 2024 14:46:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:353c:2dbf:4add:7461? ([2001:8b0:aba:5f3c:353c:2dbf:4add:7461])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082d231dsm2034457f8f.105.2024.10.03.14.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:46:25 -0700 (PDT)
Message-ID: <9182e8a9fe4467a84a2c611d84c8999dbde27826.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest: automatically unset
 SANITY_TESTED_DISTROS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: chris.laplante@agilent.com, openembedded-core@lists.openembedded.org
Date: Thu, 03 Oct 2024 22:46:24 +0100
In-Reply-To: <20241003213726.2518832-1-chris.laplante@agilent.com>
References: <20241003213726.2518832-1-chris.laplante@agilent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 21:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205217

On Thu, 2024-10-03 at 17:37 -0400, Chris Laplante via lists.openembedded.or=
g wrote:
> From: Chris Laplante <chris.laplante@agilent.com>
>=20
> It always has to be done, so just do it.
>=20
> [YOCTO #11933]
>=20
> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> ---
> =C2=A0meta/lib/oeqa/selftest/context.py | 7 +++----
> =C2=A01 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/c=
ontext.py
> index acc3b073bd..3b507d747e 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -129,6 +129,9 @@ class OESelftestTestContext(OETestContext):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Set SSTATE_DIR to matc=
h the parent SSTATE_DIR
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subprocess.check_output(=
"echo 'SSTATE_DIR ?=3D \"%s\"' >> %s/conf/local.conf" % (sstatedir, newbuil=
ddir), cwd=3Dnewbuilddir, shell=3DTrue)
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Unset SANITY_TESTED_DISTROS
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subprocess.check_output(f"ech=
o 'SANITY_TESTED_DISTROS =3D \"\"' >> {newbuilddir}/conf/local.conf", cwd=
=3Dnewbuilddir, shell=3DTrue)
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.chdir(newbuilddir)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def patch_test(t):
> @@ -337,10 +340,6 @@ class OESelftestTestContextExecutor(OETestContextExe=
cutor):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.tc.logger.error("Please unset PRSERV_HOST in order to run oe-selftest"=
)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
raise OEQAPreRun
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if "SANITY_TESTED_DISTROS" in=
 self.tc.td:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.=
tc.logger.error("Please unset SANITY_TESTED_DISTROS in order to run oe-self=
test")
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise=
 OEQAPreRun
> -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _add_layer_libs()
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.tc.logger.info("Che=
cking base configuration is valid/parsable")
>=20

You might want to leave the test since there are ways you could set
this which will make it hard to disable :(

A simple example would be:

SANITY_TESTES_DISTROS:poky =3D "x y z"

which is why this wasn't automated.

Cheers,

Richard



