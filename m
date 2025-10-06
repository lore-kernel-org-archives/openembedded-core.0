Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319EACCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 23:12:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.6157.1759792372580010126
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 16:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F4BEAwuL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e52279279so37079415e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 16:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759792370; x=1760397170; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IalI5uZ/TB2cWJzsUs5rT+UuGRBY2gHIrWOvQrkNPaA=;
        b=F4BEAwuL5MPcB8lIqDEXGDL+5wMChJ34vvPuiVHGzWsNOWj7g+YEfkoHna9Fm9Xnjv
         tnmqEcvBaB9w/xwTlvf0bXqDK2PD1D5Lo9NAPIbKk3kbl1rnQ2DGvSDwBDz8XH5lr3Mu
         EJTXEmwWcnk8EXo/Mbi1sbep8JpU5GzeYdcT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759792370; x=1760397170;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IalI5uZ/TB2cWJzsUs5rT+UuGRBY2gHIrWOvQrkNPaA=;
        b=AYloZFkBwWjqdgtewfv15QKdTL7S1/H2XVDY974DxCskYRPPuU/IldRXEniYX7KlP8
         AsGqcBnxB8BJGg/Oy75Qkt96O4f1LV6C4YRAjHC5i6SuuAgUUfuD59kVUQktMGU/bYR+
         6+jRECyGmiXyNU8RV75DFZCqmwAwszphuk1ocw6jmK5RIyu3E1zwA1Lfsu5zxDEVa0Jp
         EnY4HQxDytzoZoMsHyPUmmmn6hAKGKlIHQDB7ZCJQAbMx5gTFEUOhmjqauouBpofuUei
         njLz7kaHFUURbabSU0EGbDON9CWFMprxI3Yt4TMQziSE6qiozAb9RDleP6Tr9V0LcoGF
         hiIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6pdoWIL81Jxrbf3UE8fb7F6+SCHI6ekKVZoI/jLKGQDy1RYte3U+2AmQ3WmWS+kjiQP+/UQVG0BtrfcACCy4PHQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6PfUTXd4hne9QCjz1RWC8VO7VA+iC+JFu0ATvdvsxRKyxxVFr
	rJv8kDqCnucEKZChlCP9gkOwlcEqyWbLRhedZNnvlFWwG5Wj2WSOGhQV86U5ZYSncRY=
X-Gm-Gg: ASbGncvtIedYdHCufT3UB/KHknPTQ28pma7ngShn00TDGwm5u2KeCPuByLYAxy9F1mc
	rDOtc53m4m/Q6Nbk9Iz+eAhKFI+mrekaHYfEPRY3I2lJjpILWk3+luLO4+m082TYFTZyzrWipyG
	nUQmB5NnU3eSyg5WUbrWL4XiG2Z0z86Hra+lc+NwOSTh6vlL6kQ1RinjvbqXq8hKUOpuFJw0CMa
	wHu4Z/CnvKshkMppRtVtBPwsiEXuA16x5LntOnAsDsGGptjj0dLk6syy/1KuQloERjt/CYSH3t2
	Ponw0ep+KD6H+iLTQO+mL0t2PvUwJeuP2Mzrb/Wypzn7pt9sWF+JWWqLm7EkoX8b/z4M3VXFBBp
	duEqoO4xarVOqe7BfuAEKgO6AgmpZ4qVi7pAOiHrrlq0ekjGyPwDYWlKGs4MWbhdsSxW/acFsno
	b8KyDHyFO6DREXTHo/UthoIGR+bR4P0CXVOhc=
X-Google-Smtp-Source: AGHT+IFomX4aIus90FxCSgmmrBTBJXbqd3ob9BSd3Xcmz0+gF0oKZ54j5iy5OZ06LOXnvgj7U1XbdQ==
X-Received: by 2002:a05:600c:3505:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-46e71109eeamr86516495e9.11.1759792370546;
        Mon, 06 Oct 2025 16:12:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8b4a:4bca:6299:1557? ([2001:8b0:aba:5f3c:8b4a:4bca:6299:1557])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a18b76sm281050615e9.18.2025.10.06.16.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:12:49 -0700 (PDT)
Message-ID: <810b6c235ccbd74e6b0fcf295ab2db9ca21583e0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest: Fix single threaded race issue
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 07 Oct 2025 00:12:49 +0100
In-Reply-To: <ff5c5818-a596-4f5b-8a50-dfda83a3664e@cherry.de>
References: <20251006130902.846106-1-richard.purdie@linuxfoundation.org>
	 <ff5c5818-a596-4f5b-8a50-dfda83a3664e@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 23:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224510

On Mon, 2025-10-06 at 18:56 +0200, Quentin Schulz wrote:
> Hi Richard,
>=20
> On 10/6/25 3:09 PM, Richard Purdie via lists.openembedded.org wrote:
> > oe-selftest sets up separate build directories to run the tests in.
> > To to this, environment paths pointing at the previous build directory
> > are updated. In the multi-threaded case this is fine as the thread is
> > destroyed and the parent remains unchanged but in the single threaded
> > case, the environment is broken afterwards. This can mean we try and ac=
cess
> > a directory which is in the process of being deleted (e.g. by clobberdi=
r).
> >=20
> > Restore the environment afterwards regardless to ensure the single thre=
aded
> > case doesn't try and access the build directory which is now being dele=
ted.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0 meta/lib/oeqa/selftest/context.py | 4 ++++
> > =C2=A0 1 file changed, 4 insertions(+)
> >=20
> > diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest=
/context.py
> > index 16f82c6737d..c9eb4817253 100644
> > --- a/meta/lib/oeqa/selftest/context.py
> > +++ b/meta/lib/oeqa/selftest/context.py
> > @@ -44,9 +44,13 @@ class NonConcurrentTestSuite(unittest.TestSuite):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.bb_vars =3D=
 bb_vars
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def run(self, result):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 origenv =3D os.environ.copy=
()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (builddir, newbu=
ilddir) =3D self.setupfunc("-st", None, self.suite)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D super().=
run(result)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # In forks we don't have to=
 restore but in a single process, restore cwd and the env
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.chdir(builddi=
r)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for e in origenv:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.=
environ[e] =3D origenv[e]
>=20
> Wondering if we cannot replace the loop with
>=20
> os.environ.update(origenv)
>=20
> which should have the same behavior?
>=20
> Note that keys that didn't exist in origenv but exists in os.environ=20
> after the copy() will stay there (in the update() and suggested implem=
=20
> in the patch). If you want to really have the same one, I'm wondering if=
=20
> os.environ =3D origenv[:] would work, but I'm assuming there's a reason
> you didn't go for that that I am missing. Another option could be to=20
> delete/pop all keys that do not exist in both, e.g. with (not tested)
>=20
> del_keys =3D set(os.environ.keys()) - set(origenv.keys())
> for del_key in del_keys:
> =C2=A0=C2=A0=C2=A0=C2=A0 del os.environ[del_key]
>=20
> Though I'm wondering if we cannot simply call os.environ.clear() before?=
=20
> Not sure what the side effects could be, I have a feeling this=20
> os.environ is a bit more than a dict :)

os.environ is magic and I've been burnt by trying to be too clever with
it in the past, it is definitely not a dict. It has been massively
improved since I was burnt by it too but the memories make me want to
just treat it carefully and clearly.

Cheers,

Richard


