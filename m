Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47685CC6B2E
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 04:42:30 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32173.1792039346195135943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 21:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KQEOrfQd;
 spf=pass (domain: mvista.com, ip: 209.85.208.51, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so2400687a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 21:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792039344; cv=none;
        d=google.com; s=arc-20260327;
        b=IWIEEMszvLlNJdL0f95JvTvXopEml/VCoRHtJXm0NUFHPNTmJspQ60OoslGifKUvG9
         WmgZMfYqW735ifKvg5mYsIZL1eknDUGEto/rIcJxNYaWwGzRlEQcDRpcQCfQHj0X4CRA
         nw5qYJJlPI+UiSsjqRXpFwyQoyiHRzhNM353kalbEtKLFEuFD5uJ0GPuPwSg+J0ikB3C
         V7eHflQzst3+wLf/dXuHirUYSJ4nsdew9ndIxKnCfLZP+mJTr27Y2UuCSjPP3gayGVQb
         TqVN53jIImXzqjg7kDBnFWxuDG4yW0qF9x/R2wAyIASNy13zDxo3sgaIFMHQ+db9+a0z
         FgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H1nJTkrl3Uepv6nBvqDXWphg+bvSefEEHbAVFX1+QUA=;
        fh=68LoqYglmNvxcYOzvzGMR3xFqVE/vBd3RW3JNQ/9wxk=;
        b=p/YIgGKhBKrD4QLpVn5KJlj40Dn+iJQUTDvXI8dTHHvdb+mFTKv7EYzPH/0vEXu9ky
         mvAU/Pr7yd+RQqpOKWDSFL6AxR7ddRZApLPx2MnfnEPptYPS24nB6rhbgYQBSUp1xTMY
         GEECj7BCBvfPzcnD2gLYH5XKNUbLwBFab6C9NgfkHpc0suS1jOArrhjWcIlBDN5Hpx/L
         Whxu314hOXA9mvCs6cQo0k/ZKusf3oH3+DDsXGh5vDnQvvBmxtJj2WyJtokYiPyVhokt
         VX1R7SD0o6wojyaVTTN1ZUzv2uONEdS7xC/CrjjiPlLbIYPVMYDxjFX9jOC5p1PIkDpw
         fbjQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1792039344; x=1792644144; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1nJTkrl3Uepv6nBvqDXWphg+bvSefEEHbAVFX1+QUA=;
        b=KQEOrfQdEubhJyzu/z91iv+Knh113JyugyVLuCBQF+QWRrrD6PipMn1ryYVUJ4JY43
         f7fmyczIcNc3lFlQ3LBTDHsHmY6y9v3LYSE2WSRVXMtw4/4MinJEC4wBmxZkYAzz1kcp
         i9oJ5QNM2EiRvaOWRlkdAzWEK5eNJnDfQnJug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792039344; x=1792644144;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H1nJTkrl3Uepv6nBvqDXWphg+bvSefEEHbAVFX1+QUA=;
        b=1v+JcGuTofb94jk5FNO6EAlCnoWLYlmxAai0gD4lu2gTBd8OQkpszbNMxDJIMKzKNa
         SKYf9riNn1nPhquNzg4u0zmGFziqtyueGtHTA3+BfRh90UYMYQp09oIqLYT9TI5PokxR
         7MdHd5zmDU1gfva5EQtH0NAjhy16aWMmtJVwbGzuEOUUhZv0bx2UKtab15T2kgz2lTLN
         HKJ+0qIlTWSaPl83FYapKpNzpOFb/z2Gdf6mFXFXiHr/XsSjMrmiOZrI6YJhhHMghIUr
         FCUitk2qWA/kXfGsj2z6nCc+9IUbUgLAlqFvjfYGPLSmLFMD9gCNUalVfXkeiYSJKFrB
         DijQ==
X-Gm-Message-State: AFq9FYJ+nME9azd4MAvkCFGLNKOlTHzBSI9sQOFcyFzF8UF1UA5sq4if
	ZijMOpFAIuf0ekqxnbsJsNYGO/KzkVeLtOnrC2id1S/gOyty8HnzhMaWi4zZTZs9UJ9HKDcZl3F
	50L4T478UH79AZmk4eXaaX3cE8sSFvUeLAAKpLe2XUQ==
X-Gm-Gg: AYBFou3nrKR43QBc7eFMjdmAiPnT3skLLRqexM/sa+ZJWz3D8k/gMpfu2dcfwgCkYv7
	eoqZ9dQf18jtKwH4x6doGtPhfNa0uZsksSXVMOyvvmMOmjy1Wj7cgiq1MObJ1y80MM1mG9ApUs6
	aVRFyHB92qsbEspkeZBFyMqcyjj2hdBTmoMZBVI0RJh2rVEb0WHhA54ffqyg4152wfkdnBxbtfl
	QUP6SI6Djam/CCTGGsdTyLrDeXoLq/+FqjrgjLpSBUqHKCy5AeisRsuSNc8TrNHTYu6oGXo5qYC
	Pw9By8F/m8NwdE/ydgp18yITn20LtXYjU7e1h7Qrdv43TVFdVDqQqZjgZQ==
X-Received: by 2002:a17:906:1012:10b0:c34:c5e8:1dce with SMTP id
 a640c23a62f3a-c34c5e82101mr649849066b.18.1792039344039; Wed, 14 Oct 2026
 21:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20261008090135.1485765-1-vanusuri@mvista.com> <DM070UI0TERG.1A3WINVYE19HJ@bootlin.com>
 <7E3E512D-59C7-42EF-896C-257A336EFB0D@arm.com> <60CE1C5A-B892-472C-8F35-848E8D0C4791@arm.com>
In-Reply-To: <60CE1C5A-B892-472C-8F35-848E8D0C4791@arm.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 15 Oct 2026 10:12:12 +0530
X-Gm-Features: AclHuK9F9YEA2TWX7xP_KjtoM3PNXLyvXcRbUQPX4zCFvpxLDmZJUYg-XO57lsE
Message-ID: <CANQUz18J+UFKBu3t15b9bUyyj3BkCY9ouofUawG0uVKT-25Sbg@mail.gmail.com>
Subject: Re: [OE-core][patch] python3: upgrade 3.14.7 -> 3.14.8
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000867a80065dd9ace5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 04:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247797

--000000000000867a80065dd9ace5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Thanks for investigating this and filing the upstream issue.

I was also able to reproduce this issue with Python 3.14.8 on our musl
build.

Since the issue has been reported upstream, can we temporarily skip
test_append_limited_history until a fix is available?

Thanks & Regards,

Vijay


On Wed, Oct 14, 2026 at 10:48=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> =
wrote:

> On 14 Oct 2026, at 16:03, Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >> Are you willing to investigate this further? We need to understand if
> >> the test is failing because an issue in python code or because of a
> >> dependency we are using in oe-core.
> >
> > This is probably related to some libedit fixes that merged upstream, in
> an attempt to fix tests that were failing when libedit was being used:
> >
> >
> https://github.com/python/cpython/commit/e87da800b6103fd890841688da48e41e=
211be7b9
>
> I replicated and filed https://github.com/python/cpython/issues/159424
> upstream.
>
> Ross

--000000000000867a80065dd9ace5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p><span>Hi Ross,=C2=A0</span></p><p><span>Thanks for inve=
stigating this and filing the upstream issue.<br><br></span></p><p><span>I=
=C2=A0was also able to reproduce this issue with Python 3.14.8 on our musl =
build.</span></p><p><span>Since the issue has been reported upstream, can w=
e temporarily skip </span><code dir=3D"ltr"><span>test_append_limited_histo=
ry</span></code><span> until a fix is available?<br><br></span></p><p><span=
>Thanks &amp;=C2=A0Regards,<br></span></p><p><span>Vijay</span></p><br></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, Oct 14, 2026 at 10:48=E2=80=AFPM Ross Burton &lt;=
<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 14 Oct 2026, a=
t 16:03, Ross Burton via <a href=3D"http://lists.openembedded.org" rel=3D"n=
oreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;ross.burton=3D<=
a href=3D"mailto:arm.com@lists.openembedded.org" target=3D"_blank">arm.com@=
lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt; Are you willing to investigate this further? We need to understand=
 if<br>
&gt;&gt; the test is failing because an issue in python code or because of =
a<br>
&gt;&gt; dependency we are using in oe-core.<br>
&gt; <br>
&gt; This is probably related to some libedit fixes that merged upstream, i=
n an attempt to fix tests that were failing when libedit was being used:<br=
>
&gt; <br>
&gt; <a href=3D"https://github.com/python/cpython/commit/e87da800b6103fd890=
841688da48e41e211be7b9" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/python/cpython/commit/e87da800b6103fd890841688da48e41e211be7b9</a><br>
<br>
I replicated and filed <a href=3D"https://github.com/python/cpython/issues/=
159424" rel=3D"noreferrer" target=3D"_blank">https://github.com/python/cpyt=
hon/issues/159424</a> upstream.<br>
<br>
Ross</blockquote></div>

--000000000000867a80065dd9ace5--

