Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAD1CD3430
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 11:33:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36677.1777980774601809336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 04:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kljeyd4/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso37479515e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777980773; x=1778585573; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i33Z8t0Ark/49M1mdVywqWWdEcLEMlI6NgU7o3FhL7w=;
        b=Kljeyd4/PkePDbbIP0fbY0HjeVAShpYR6AoLySgvVItSTj5DhySzMjkl7qxdArdPnb
         i3VzELeRJQXGiiYIMTxTfUWNHbPEsE9MuQCmJLMeB6m+QgbRAzqHIg/fkiSWc+AeQC9b
         x4dufvhTMvV/5fIgg4jG7Wcm0O7eLi1lwiNlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777980773; x=1778585573;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i33Z8t0Ark/49M1mdVywqWWdEcLEMlI6NgU7o3FhL7w=;
        b=M07MzS4q2L2R5sHCWLd3WJKWcDpkw4Zq47dKEhLyaSLfHmpxLVWxFoHJsHJhJ6+V2B
         hqxBMwwFVO6sC+B9DHQe8O/alUyJqbc1X2VC8OL9dWEb5InG2e0HKdC6f86RnEW6P1k5
         +3fvQQn+yGkX/wEzthQy8O4xAhyHeC7oFympaBGU89AF6STimZvs/kOuwSXUv22VnGl/
         MdswR9Cs90mXaZ2v9AACV3ACCEI9HORCXZhAzFgKIOV3uW9vVm+Ei0TOf9kIKdDmihEC
         wOAIrsCPMqaOM+zmdxXD/+gISuG//BwJHfdxwcWyfj54QxEaYsj5EUkVVatHTAzROiUD
         kb9w==
X-Forwarded-Encrypted: i=1; AFNElJ/C4TseW6ztUrsdU34eoDIjwN5JfGMKbZ6qS4N2GC0Bte9SwEPujIsxqFfJxUnySX1HI/Jqi4lyHDJZsuSqr51NeQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyaQAPxtIBjIABxZ5T7Qu+bMm/atizKHWka5vo4xMB/vkbf1oWT
	coQFh9sQW/w3G5eyuQpahSfmNtxoYBHPf9xumx+eK2Ncx1HRwk7IAq+fKg5dybzusxE=
X-Gm-Gg: AeBDieugy0RORTf3770Dd6tuou0632VDlcN6DCVQ6/82G2CmpjGYFjV44iEYOXqBmYN
	RQLbOgLhfEZApJKBSNUSSHMrZHEqZHsz5uvsO5asMo1KC1BpP2ZL2rMLCB4DT9XryzDJ+FCyMSj
	1zJiyMCtn+tC8wi9P85LZOvAVO2XpOXriIcE5klGj1wFky8/MPWqfVuW51ri11xy+h8VM4ijUna
	CvNtkkrgRL2FUveiWuJMCb8+NxqJ1owFUf9/KVlbEYKRrG3qwLcP+b/gBA1inyn0RRY47IrpYfx
	XPhvyjDNsaOj62kjWKnYFI+8OZWtUaUP8WoyrB5kR9kz27W3NJkHSQX36xGM80XrBf+hIQK8hSl
	yLLLRjVQvR3gb2vgKEa4vHmKcgXAN1j8BlwHrzJM4iK+K600AVuv+D10sbTt7XDWEkKPsxjUgEs
	lKVUOJOZ3RwlC0yCIpBc5Zp2nEyH84B2izSSqodUl6wbzIEdJgjEMJfXEva3jqoPF5UhPSUSCxL
	0gB2h0Pv7NyLUBIG+4ABs53DJo=
X-Received: by 2002:a05:600c:a46:b0:48d:112c:f582 with SMTP id 5b1f17b1804b1-48d112cf94emr105258855e9.11.1777980772777;
        Tue, 05 May 2026 04:32:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8349:ba09:9e5a:e125? ([2001:8b0:aba:5f3c:8349:ba09:9e5a:e125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960fd6sm4208292f8f.31.2026.05.05.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:32:52 -0700 (PDT)
Message-ID: <9912ca030e57c91d018ccce24a33474c9f297e65.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/5 v5] rust: Fix rust build failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, mathieu.dubois-briand@bootlin.com
Date: Tue, 05 May 2026 12:32:51 +0100
In-Reply-To: <728dc8cc-eed1-47c0-b07d-0d255a4966c4@windriver.com>
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
	 <20260505081625.849368-6-Deepesh.Varatharajan@windriver.com>
	 <fdd844616b3283408f9190ca26ccfe13390358ad.camel@linuxfoundation.org>
	 <16853c1f-d823-4b87-b81a-ed9607e9aa5c@windriver.com>
	 <535902c12a1567ab2d551fa72713685e537566e3.camel@linuxfoundation.org>
	 <728dc8cc-eed1-47c0-b07d-0d255a4966c4@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 11:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236484

On Tue, 2026-05-05 at 16:29 +0530, Deepesh Varatharajan wrote:
>=20
> On 05-05-2026 15:36, Richard Purdie wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >=20
> > On Tue, 2026-05-05 at 15:26 +0530, Varatharajan, Deepesh via lists.open=
embedded.org wrote:
> > > On 05-05-2026 15:06, Richard Purdie wrote:
> > > > CAUTION: This email comes from a non Wind River email account!
> > > > Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.
> > > >=20
> > > > On Tue, 2026-05-05 at 01:16 -0700, Varatharajan, Deepesh via lists.=
openembedded.org wrote:
> > > > > From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> > > > >=20
> > > > > Target LLVM tools are installed in the sysroot because they are n=
eeded
> > > > > for llvm-lit to run tests. However, this leads Rust to pick up a =
target
> > > > > llvm-config that cannot run on the host. Overwrite it with the na=
tive
> > > > > llvm-config so Rust can execute it correctly.
> > > > >=20
> > > > > Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriv=
er.com>
> > > > > ---
> > > > > =C2=A0=C2=A0 meta/recipes-devtools/rust/rust_1.94.1.bb | 5 +++--
> > > > > =C2=A0=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/meta/recipes-devtools/rust/rust_1.94.1.bb b/meta/rec=
ipes-devtools/rust/rust_1.94.1.bb
> > > > > index 3eb2a36406..e4a9f20e27 100644
> > > > > --- a/meta/recipes-devtools/rust/rust_1.94.1.bb
> > > > > +++ b/meta/recipes-devtools/rust/rust_1.94.1.bb
> > > > > @@ -238,9 +238,10 @@ rust_runx () {
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Copy the natively built ll=
vm-config into the target so we can run it. Horrible,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # but works!
> > > > > -=C2=A0=C2=A0=C2=A0 if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D $=
{RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
> > > > > +=C2=A0=C2=A0=C2=A0 if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D $=
{RUST_ALTERNATE_EXE_PATH} ]; then
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdi=
r -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp ${RUST_ALTERNATE_E=
XE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f ${RUST_ALTERNAT=
E_EXE_PATH}
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -f ${RUST_ALTERNAT=
E_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patc=
helf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > > This appears to be a consequence of the new install in "clang: Enab=
le
> > > > cmake flags for llvm, clang, lld tests". Perhaps we should just not
> > > > install llvm-config there if it is going to cause problems and need=
 to
> > > > be overwritten?
> > > Yes, this is due to the new installations. We now need the target
> > > llvm-config to run the Clang
> > > family test suite inside QEMU for the target. Previously, we didn=E2=
=80=99t
> > > install LLVM target tools,
> > > but running the Clang test suite for the target requires these tools =
to
> > > be present in bin so
> > > that llvm-lit can use them.
> > >=20
> > > Also, the existing check is somewhat odd. Even if llvm-config exists =
in
> > > ${RUST_ALTERNATE_EXE_PATH},
> > > it can=E2=80=99t be used for building Rust because that version is bu=
ilt for the
> > > target. Therefore,
> > > overriding it with the native llvm-config makes sense.
> > We simply can't mix target and native binaries like this.
> >=20
> > Think about what happens if you take target sstate built on x86-64 and
> > reuse it on an aarch64 host system.
> >=20
> >=20
> Yes, I see your point about mixing native and target binaries and the
> potential impact on sstate reuse.
>=20
> However, this behavior already existed before this change. We were=20
> copying the native llvm-config into
> the target sysroot when the paths differed. The only difference here is=
=20
> that we now always overwrite it
> instead of skipping when a file already exists.
>=20
> With the recent Clang changes, a target llvm-config is now installed,
> which causes the previous conditional
> check to skip the copy. That leads to Rust picking up a target-built=20
> llvm-config, which is not usable for
> building Rust.
>=20
> So this change doesn=E2=80=99t introduce new mixing. It ensures we consis=
tently=20
> use the native llvm-config, which
> is what the original logic intended. Did I misunderstood something ?

Looking at the code, it is in rust_runx and that code us used during
compile/install so it only affects things locally, it doesn't change
the sstate objects. I was thinking this was changing installed files,
sorry.

The check for files existing is probably there due to the fact the
function can be called multiple times and we want to copy the first
time only.

I still have to wonder why we are installing something which we then
have to overwrite though. If we have to overwrite it, we shouldn't be
installing it in the first place?

Does the llvm test suite actually use the llvm-config target binary?

Cheers,

Richard

