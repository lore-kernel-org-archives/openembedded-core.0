Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 299AB60167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 22:52:32 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id i50so11104500qgf.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 14:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ooLGVdnX3LDZRULbczXtaipxT4wNxM3OWIE+NLAULyI=;
	b=Rx9grEWuVGWN58xZVs5PaeBcSo21fEbVeJZHQEaliJ4CM5V/RodgWgkJqnvNzdtr4K
	X+nPXEsW85m9dTDr94NRsyUIMTmS07lCTmWmqUg71u2+v48GAiIC4998UYj2aEceqeGh
	3ZwONQK7luVTxF2wQGXdJvQChqSvWlsP7esHFklRrJxcF0QseA4xbSXu+ECzYaeQ62vK
	+Uhaojx8qXwB3NHqxnjkL95Au/khJwNdHQzZ67g7Lb7vWWaWuPx9xjTxhoEcemtbxbuW
	IZ9zBbsPQBiNDnriafzOb6+EQmPfX2TW6hq0fEqn1qfUXgyHew4lIcwup3QjX8VYGT5h
	dxOw==
X-Gm-Message-State: ALoCoQnCAWf9i/Ii+AkjcUKzBo6O3g6wnDXdv5ITJ8Wpgc8MKDBbDhjIxsZ6KPRTq1WZd0vQg9A8
X-Received: by 10.229.224.201 with SMTP id ip9mr6628726qcb.5.1415919153227;
	Thu, 13 Nov 2014 14:52:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Thu, 13 Nov 2014 14:52:12 -0800 (PST)
In-Reply-To: <CA+92fu_s_2_MzGSEuJKCEvKqE+GG61QANvb_Nb4jgavspT_KDg@mail.gmail.com>
References: <1415832933-372-1-git-send-email-wrobell@pld-linux.org>
	<CAJTo0LbHecBh1J3MqhpXzsrXmUv_963LS+VDD0Vrg_rzFukynQ@mail.gmail.com>
	<CA+92fu_s_2_MzGSEuJKCEvKqE+GG61QANvb_Nb4jgavspT_KDg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Nov 2014 22:52:12 +0000
Message-ID: <CAJTo0LZgHYJbttvB86MOf1_idnz-B+PQBDsDFNX8Quv44XTyog@mail.gmail.com>
To: Artur Wroblewski <wrobell@pld-linux.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Replace Python 3.3.x with Python 3.4.2
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
X-List-Received-Date: Thu, 13 Nov 2014 22:52:41 -0000
Content-Type: multipart/alternative; boundary=001a1135ef1e28c3290507c55ecf

--001a1135ef1e28c3290507c55ecf
Content-Type: text/plain; charset=UTF-8

On 13 November 2014 20:23, Artur Wroblewski <wrobell@pld-linux.org> wrote:

> > Personally I'd prefer to see a working Python 3.4 integrated in one go
> > instead of having a broken 3.4 integrated for an unknown about of time.
> > Hopefully anyone else who is interested in 3.4 can step up and work on
> the
> > outstanding issues now that this patch is public (which is another good
> > reason to have a public repo with this in).
>
> If you specify some exit criteria for this, then I can try to improve
> the patch. But
> please keep in mind that Python 3.3 in Yocto is broken to such extent that
> it
> crashes due to missing essential modules.


 The exit criteria would be a patch to upgrade to 3.4 that doesn't come
with the caveat that seven of the patches need to be updated.  3.3 being
broken is a separate issue to upgrading to 3.4 and we should probably fix
3.3 first, backport that fix to dizzy, and then upgrade to 3.4.

I've filed a bug about the startup problem with just python3 installed
(#6967). Note that whilst this is a bug it's not fundamentally broken as
installing just python3-core (which python3 is an alias for - more on that
in a minute) won't pull in the bulk of the runtime library.  Installing
python3-core and python3-modules brings in the entire runtime, and the
interpreter starts up fine.

You could argue that whilst splitting out the core library is reasonable so
that minimal installs are possible, having "python3" not be the full Python
experience isn't reasonable.  I'd be inclined to agree here, and think that
python3 should be a meta-package that depends on all of Python.

Ross

--001a1135ef1e28c3290507c55ecf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
3 November 2014 20:23, Artur Wroblewski <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:wrobell@pld-linux.org" target=3D"_blank">wrobell@pld-linux.org</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span>&gt; Personally I&#3=
9;d prefer to see a working Python 3.4 integrated in one go<br>
&gt; instead of having a broken 3.4 integrated for an unknown about of time=
.<br>
&gt; Hopefully anyone else who is interested in 3.4 can step up and work on=
 the<br>
&gt; outstanding issues now that this patch is public (which is another goo=
d<br>
&gt; reason to have a public repo with this in).<br>
<br>
</span>If you specify some exit criteria for this, then I can try to improv=
e<br>
the patch. But<br>
please keep in mind that Python 3.3 in Yocto is broken to such extent that =
it<br>
crashes due to missing essential modules.</blockquote><div><br></div><div>=
=C2=A0The exit criteria would be a patch to upgrade to 3.4 that doesn&#39;t=
 come with the caveat that seven of the patches need to be updated. =C2=A03=
.3 being broken is a separate issue to upgrading to 3.4 and we should proba=
bly fix 3.3 first, backport that fix to dizzy, and then upgrade to 3.4.</di=
v><div><br></div><div>I&#39;ve filed a bug about the startup problem with j=
ust python3 installed (#6967). Note that whilst this is a bug it&#39;s not =
fundamentally broken as installing just python3-core (which python3 is an a=
lias for - more on that in a minute) won&#39;t pull in the bulk of the runt=
ime library.=C2=A0 Installing python3-core and python3-modules brings in th=
e entire runtime, and the interpreter starts up fine.</div><div><br></div><=
div>You could argue that whilst splitting out the core library is reasonabl=
e so that minimal installs are possible, having &quot;python3&quot; not be =
the full Python experience isn&#39;t reasonable.=C2=A0 I&#39;d be inclined =
to agree here, and think that python3 should be a meta-package that depends=
 on all of Python.</div><div><br></div><div>Ross</div></div></div></div>

--001a1135ef1e28c3290507c55ecf--
