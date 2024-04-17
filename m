Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06897C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 09:13:12 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.8331.1713345190361506746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 02:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YTO1emJk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.182, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d8743ecebdso53576301fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 02:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713345188; x=1713949988; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8dT1XWl3B7RVBzgrfqSPb8nBShxwFxKC6UYjxiQWPc=;
        b=YTO1emJkR0DlxDnMguZ4Qss+5S693HxLo9cbnDGJSxO6sG1zYg7AmhJHyS287mtp6a
         r9WsDKBGwhfi7kyRzk5qM94P6E+O4AC6hCCO+oJ2Qii4UaTse1K9ITVSruTq6a6Yj8Zm
         4s2QDh81gTiEJoU3ZJMmBnIzJCLoBLDsCW+0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713345188; x=1713949988;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8dT1XWl3B7RVBzgrfqSPb8nBShxwFxKC6UYjxiQWPc=;
        b=GkCIWOrJ9F7+CEcmnq2wMNnvUaIyDSG9l/bSIPsyrQN+dQv97C8LLaDm5x9u8Y/fD9
         IDtMWg15pyOEkI7bWMh7mJNN17BZoJqKd6cDHcWK1xMzPDrmlctKjMoDBXbO+xXTw6Zy
         kb9Xqn3NY1LrhSiJqueDDdPHC6P7bvZZnx14pvGVWoc9kn0ZMXfj08SH+DBEGKGIX7f0
         cpkghmdk+d8iDgi8mNULrBGmrPWjMEmEa9uIVKxOqnt+qwgOrJBqPFqtvsckBQHpgzob
         k+gXJkVxtPBjZBKWdeeUGyz9tF3pVgsQF0dGmM+nUrTf2GwnQHEw1RcYAA2TNHYLtLSh
         e6zg==
X-Forwarded-Encrypted: i=1; AJvYcCVRewVULBlTSI6IOdCEkrRhteJx+wacSLmVxE9I8Fl52CYSnwmuG2W6jyIsr5bRtNMzeblh69tomh7DGikSW3l+X4dm7RrqT14k69iKOy0kMNUTAv//AY6t
X-Gm-Message-State: AOJu0YwQUJ1ftsZt69dAYgeqCmlJ9307RFcVemGId7BkEiwNqa+gaurS
	p/AKG+lFPjuqTTHFAE/pNMnv7ExRfwSfLw0HjraNGCZWrF7fuLzYr0rF/eRyBhw=
X-Google-Smtp-Source: AGHT+IEGgBJDOLbsp9aKsOWaFy4n0nmy7O2Pg66KKaN+6Vf9RoyaKRdMTge8VZK4lCG7ztb1YOZTBg==
X-Received: by 2002:a2e:8554:0:b0:2d9:e54d:81eb with SMTP id u20-20020a2e8554000000b002d9e54d81ebmr10514792ljj.12.1713345188146;
        Wed, 17 Apr 2024 02:13:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a0de:b0fb:f1c3:a752? ([2001:8b0:aba:5f3c:a0de:b0fb:f1c3:a752])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c1d8900b00417e4add806sm1986398wms.7.2024.04.17.02.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 02:13:07 -0700 (PDT)
Message-ID: <37a6ea276baa63db767a95cd4c3cc6cc091a0fac.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base.bbclass: make do_fetch depends on
 PREMIRRORS MIRRORS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>,
 changqing.li@eng.windriver.com,  openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2024 10:13:07 +0100
In-Reply-To: <eee97336-9137-446c-b37f-c4b5bc0f9604@windriver.com>
References: <20240415083019.1867284-1-changqing.li@windriver.com>
	 <7440987a5a3496bd4f88931728c7d7f686099c62.camel@linuxfoundation.org>
	 <eee97336-9137-446c-b37f-c4b5bc0f9604@windriver.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 09:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198461

On Tue, 2024-04-16 at 09:48 +0800, Changqing Li wrote:
> On 4/15/24 18:05, Richard Purdie wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the
> > sender and know the content is safe.
> >=20
> > On Mon, 2024-04-15 at 16:30 +0800, Changqing Li via
> > lists.openembedded.org wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > >=20
> > > When there are tarballs in local mirror file://, do_fetch=C2=A0will
> > > create symlink under DL_DIR, eg:
> > > pseudo-prebuilt-2.33.tar.xz ->
> > > /project/path/to/localmirrorA/pseudo-prebuilt-2.33.tar.xz
> > > after user update path from localmirrorA to localmirrorB, because
> > > do_fetch don't depends on PREMIRRORS/MIRRORS, do_fetch will not
> > > be rerun, so the symlink will not update to:
> > > pseudo-prebuilt-2.33.tar.xz ->
> > > /project/path/to/localmirrorB/pseudo-prebuilt-2.33.tar.xz
> > > then, do_upack will failed since the tarball cannot be found.
> > >=20
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > ---
> > > =C2=A0 meta/classes-global/base.bbclass | 1 +
> > > =C2=A0 1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/meta/classes-global/base.bbclass b/meta/classes-
> > > global/base.bbclass
> > > index 0999b42daa..5094a1540e 100644
> > > --- a/meta/classes-global/base.bbclass
> > > +++ b/meta/classes-global/base.bbclass
> > > @@ -139,6 +139,7 @@ do_fetch[file-checksums] =3D
> > > "${@bb.fetch.get_checksum_file_list(d)}"
> > > =C2=A0 do_fetch[file-checksums] +=3D "
> > > ${@get_lic_checksum_file_list(d)}"
> > > =C2=A0 do_fetch[prefuncs] +=3D "fetcher_hashes_dummyfunc"
> > > =C2=A0 do_fetch[network] =3D "1"
> > > +do_fetch[vardeps] +=3D "PREMIRRORS MIRRORS"
> > > =C2=A0 python base_do_fetch() {
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src_uri =3D (d.getVar('SRC_URI') or ""=
).split()
> > >=20
> > Changing PREMIRRORS or MIRRORS should not change the output of the
> > task, ever, so do_fetch shouldn't depend upon them.
>=20
> The failure case I met is like this:
>=20
> I have a project with PREMIRRORS setting, and the tarballs are under
> it.
>=20
> PREMIRRORS:append =3D "file:///project/path/to/localmirrorA"
>=20
> after first bitbake pseudo-native, there will a symlink under DL_DIR:
>=20
> pseudo-prebuilt-2.33.tar.xz ->=20
> /project/path/to/localmirrorA/pseudo-prebuilt-2.33.tar.xz
>=20
> Then, Since all the tarballs are moved to
> /project/path/to/localmirrorB
>=20
> I changed PREMIRRORS:append =3D "file:///project/path/to/localmirrorB"
>=20
> Then bitbake pseudo-native again,=C2=A0=C2=A0 do_fetch=C2=A0 will not rer=
un since no
> signature change.
>=20
> do_unpack rerun since one dependency=C2=A0 change, it will try to unpack=
=20
> ${DL_DIR}/pseudo-prebuilt-2.33.tar.xz,
>=20
> but since do_fetch not rerun, ${DL_DIR}/pseudo-prebuilt-2.33.tar.xz=20
> still point to localmirrorA, but localmirrorA not exist
>=20
> since localmirrorB replace it.=C2=A0 Then will cause do_unpck failure:
>=20
> NOTE: Unpacking /build/downloads/pseudo-prebuilt-2.33.tar.xz to=20
> /build/tmp-glibc/work/x86_64-linux/pseudo-native/1.9.0+git xz:=20
> /build/downloads/pseudo-prebuilt-2.33.tar.xz: No such file or
> directory
>=20
> So this is why I want to add this depends,=C2=A0 and want to make do_fetc=
h
> rerun and resymlink to /project/path/to/localmirrorB

The question is if the fetch reruns, does it correct the path?

do_fetch should definitely not depend on PREMIRRORS or MIRRORS as those
can be set by local users for local setups. The idea is that result
would be the same regardless, else the fetch checksums (or git
revision) would not match. I will therefore not take any patch changing
that.

Also, despite what Alex said, the fetcher does only make symlinks for
local files, it does not copy every file into DL_DIR.=C2=A0It does this for
efficiency, both time and disk usage.

If you start moving files around locally, you're expected to fix up the
links too. I believe that if you manually run the fetch task, it will
update correctly so the only issue is it not automatically triggering
but I don't believe it should trigger.

So whilst I can see how you have an unfortunate build failure, it was
of your own making by moving mirror directories around.

Cheers,

Richard




