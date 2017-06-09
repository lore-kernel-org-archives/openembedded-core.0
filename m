Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id F36D678322
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 22:42:47 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id a2so45491567oth.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PlEKB/e9O0oVRI6e0aF6vgs6NTxJ2ZJuchD5RLvjV6Q=;
	b=ShxQLtQ7J06qjZEJMr7MnDW8OrDNEA9NxLTW62Sm4YK3WYkNF2cFIF1tuzkR8nIZs1
	zYZrYHNMjMldPqYxnjtijNQEI0FYVajrMRZ62ay55EuMmp7IR0hWHsILL2LuscUyr5vm
	0jW/nqnWlzeMQf53UdZunYCvifHmzbQb6W75hylXJvun1SAmoGAm3mv8x+NL1oW9zJXi
	XZU9PNYjymJTa9zVfdWThihKtIxXrM/29Uu0XOuOWBqdf47shP1rNIvxcBVZBeMAts5w
	Zf/bq1OLCXilCeb74nzNt1pwrpH72XEVKiEmQYB//5IHxmwoDNpf3GvoTqtyR6oZztrZ
	nRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PlEKB/e9O0oVRI6e0aF6vgs6NTxJ2ZJuchD5RLvjV6Q=;
	b=Ji5IRLEVTHAFO7/MAmXmvJIQX8Xw+u2SD/5p8Z09T0fA2QwFm7qTDSRmiLBHpwCRZd
	kuDDslqyHxwrVAJffTMvM1rKTy80trIIf34yixQj7Kb1Iy0f96ILBL2MoaG17+54ppCc
	uDTd8DaUVyN3dOmN9zbcBndQ77Sw1tClKquATuzNbgumZKF7uCIR+8L81iWXboE22yEG
	jKt7HzX/GAyRMIenhxRqRH6FQUgb4tKVAhbKafvDULbfn8SeNgUILNFGRue5NHv1Ejny
	5HQL80n7rRH9U2roC9+RhL77Bg2emEvoO4KPegpxiUBzJZnHF0WDbz2ICcZAMbh9iMgn
	V1oQ==
X-Gm-Message-State: AODbwcBKsUHX/GiwKn3KTt3Me2bsnuaqo6CqBpwIRzpAHREepzkmEA5N
	a5pFEr2rE6sCJjd85lr4XNgvt9kj6A==
X-Received: by 10.157.58.102 with SMTP id j93mr16252430otc.147.1497048168536; 
	Fri, 09 Jun 2017 15:42:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.30.230 with HTTP; Fri, 9 Jun 2017 15:42:28 -0700 (PDT)
In-Reply-To: <1497033695-138298-1-git-send-email-denis@denix.org>
References: <1497033695-138298-1-git-send-email-denis@denix.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 9 Jun 2017 15:42:28 -0700
Message-ID: <CABcZANmLwHK_ub07QaRtqybdXfRp78hS9hsH6DED4BgvJkYtJA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uboot-config: check UBOOT_CONFIG variable, not flags, for error conditions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Jun 2017 22:42:48 -0000
Content-Type: multipart/alternative; boundary="001a11493d3a4c22c205518eb022"

--001a11493d3a4c22c205518eb022
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 9, 2017 at 11:41 AM, Denys Dmytriyenko <denis@denix.org> wrote:

> +    ubootconfig =3D (d.getVar('UBOOT_CONFIG') or "").split()
>
> -    if not ubootmachine and not ubootconfigflags:
> +    if not ubootmachine and len(ubootconfig) =3D=3D 0:
>

There=E2=80=99s no need for len() here, just `if not ubootmachine and not
ubootconfig:` should do, since a string is falsy when it=E2=80=99s empty.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a11493d3a4c22c205518eb022
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jun 9, 2017 at 11:41 AM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1i7" class=3D"a=
3s aXjCH m15c8e2a2eea5f7e5">+=C2=A0 =C2=A0 ubootconfig =3D (d.getVar(&#39;U=
BOOT_CONFIG&#39;) or &quot;&quot;).split()<br>
<br>
-=C2=A0 =C2=A0 if not ubootmachine and not ubootconfigflags:<br>
+=C2=A0 =C2=A0 if not ubootmachine and len(ubootconfig) =3D=3D 0:</div></bl=
ockquote></div><br>There=E2=80=99s no need for len() here, just `if not ubo=
otmachine and not ubootconfig:` should do, since a string is falsy when it=
=E2=80=99s empty.<br>-- <br><div class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Lar=
son<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZau=
rus<br>Senior Software Engineer, Mentor Graphics</div></div></div></div>
</div></div>

--001a11493d3a4c22c205518eb022--
