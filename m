Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F07C55160
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 12:44:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10854.1785415479285778211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 05:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=cFQwyGx2;
 spf=pass (domain: snapchat.com, ip: 209.85.221.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso1814816f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785415477; cv=none;
        d=google.com; s=arc-20260327;
        b=sVeEHIJgmPBOJ90St8TZxc3A0mBCZac03kAYdYA5NZva3biPTiyWnSaK3SXM+7xop+
         uIwqbEM+EKqM/5uZMdy90uCzC8NK+07rjnSiGvnhFbaW2MZIxsJnX4jvsDDhXsml7Oj4
         gwDzTc3fupY9RwuVe2JfNLySRdBD1K1s56+GuvikCSma8Uc16sA4WaxJC9l0lsDyRN00
         UYENUln4xIfPi6cr1rjuTUCo7052RkjbFhbEhAtQaY7WQeMSppXR1g4yCI5+lSC6fPiU
         Maa79lwl80gMTvys2FuwBiOJO7zfJnVrHzDwib8C4bcTOfOKnTRGpnJj9y1qFidKzFeQ
         hRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CSnTiP1yInwdNQSy22821SRf42dr7n5dASjIkzD58v4=;
        fh=E22hnrDeFOhblX6O88lo3ne3xDOhxPQXcBK1pwgmqrY=;
        b=cw/uTmBaeyh/SqwVQOGRTPcnLSnGm+U1NU+giHOcwVqL85kODTQC5svYyglGRt5u6e
         sbO9JBTmilkcND/kXm1eglBrKb1Z78bxXou3/9VLxlkqN9HitSqxO0rI6NqaLK+KJMSH
         CNZWfSpQw8WDgtsmeYStMqpHSFGolqSsXvrb6fzvi2T1B9pCswpE/FM/6mkHCCz04sSY
         qSE6Pk8H7ttpUr7zkSswpcVOLh+iOkjSzd8V95z6albd8cOfkr2rG8v5opefbEROZ0T/
         SPwZN9R8b7trLo2EbCz51Z4hI+qGP7/oYNONQ+NSwOVu6dqvEXU226hTU4/amXDGwYmy
         +XGg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1785415477; x=1786020277; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSnTiP1yInwdNQSy22821SRf42dr7n5dASjIkzD58v4=;
        b=cFQwyGx2by6818k/kOV0f//Cc/0VtZxodts5CIzuV9jKyj2xudeOF4IrP4d+oT1/5K
         idk30z1CJVyXzDyZyjdft52VuUJqGJ/vM3erAw2jsAok+y1H/Iy+WfC97Kfp4DjtjCit
         VJ+eGfKeYCZocz/Vdh1Zk2Cg48bjUHoJjA5qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785415477; x=1786020277;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CSnTiP1yInwdNQSy22821SRf42dr7n5dASjIkzD58v4=;
        b=B1SbCcb/CnaWDSg6U0x8PaUPLdR235l2b6japK8wWzDylS8CftzaICQo1xwJKrF1Tm
         UKBYF03CjmkApsXmgsOIeUyjz7X/0CCpAxcsJ+Kpi61y8KT8H3v+8BH4UiCEcj0gY6V+
         YoO1bC2ICpP3E6YDL6kFDt61EhZFqg4/8s010OrBjfiJwPI49UZFSyDVf3wyG+veBxL1
         XZ6g6cB6S6cwGiq6a8rv046cwnBENK9KA0J2gzO3TxYLu0qXkGrvirxowQ/m5vJbcEJh
         dMX4PSZLV8fntAPBsZwmeRiljHC8pSmBRFh7hao2BT879xluMO6tU2Ebkj7zCAVnNe5v
         DFcw==
X-Gm-Message-State: AOJu0Yxvb5A09MMdzj8aupJg09AxNo/i4QyWBrmsKs0HSBHmVBz3f7NU
	HHJCXXTU7PzoV5b4pftEVWsE1GV212sfp+/2K5kxjSCCZAQNgOWToPFUdyhokR/+qctHnbf3dxb
	/Vf2E8ccLYudxdE02iS1x0EP5V/+IL6S+Hmfu6cTThfQ098DqMVMhFgNgBQ==
X-Gm-Gg: AR+sD11/wnMjxu/ufWL0E+80l8NvzXpQieL8gSGghq9TdUwmCuTmCjbicG0tpzVIv46
	nEFNdob4NaGPAKYo1eFuXpwWODcYGPglk1q+cuWHseg3ZIFW6ssR0GezerCN3A+FwlnpxLeB3QS
	HmyzwhDxVCYaXCS+LlFzjrd9m08ozerlphMbMIyvS4fe/seoMlWodAWnYhzJBnhyjYiLOCKj43H
	nYJkewywBTf71y5RRFqgWzqcxaQqlwff5OrUFDA823uw5g4ZhlqYRetj9k6hCz9aL7GM9Fxjs70
	epZYSH3qudGo4Ibs6XJhvwj2tUxHO2uJW3HMZFsD1s486YR8974MW9H28LvEFdTMmHFMMJSilmL
	v
X-Received: by 2002:a05:6000:481c:b0:47f:9661:6766 with SMTP id
 ffacd0b85a97d-47fc84375efmr3691527f8f.61.1785415477413; Thu, 30 Jul 2026
 05:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260730091017.171702-1-ecordonnier@snap.com> <e2d0d98e8347500b444140ff9775d84f06ad0fef.camel@pbarker.dev>
In-Reply-To: <e2d0d98e8347500b444140ff9775d84f06ad0fef.camel@pbarker.dev>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 30 Jul 2026 14:44:26 +0200
X-Gm-Features: AUfX_mzBtgVT30i5zLLRF2K7wEEirYPzUjw5nYoIlb8vGi67UqwdwMw6ylyMRhc
Message-ID: <CAHUKmYZPJ4R9PRA0E+ym0aatN4OcBON18m4uA-vPEE8XjuLDOg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 1/2] package_manager/ipk: skip checksums for
 unsigned local feeds
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004ef9100657d36fb0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242348

--0000000000004ef9100657d36fb0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,
my understanding is that my change does not impact the package feed.
Checksums are still always calculated for the normal package feed after my
change. There are two different code paths:

1. do_package_index (package-index.bb -> generate_index_files() ->
OpkgIndexer(d, DEPLOY_DIR_IPK).write_index()): operates on the global
DEPLOY_DIR_IPK. This is the feed that can be published, externally signed,
or served over a network. This path is not touched by this commit: it still
always writes checksums.
This is the write_index() call at
meta/lib/oe/package_manager/__init__.py:579

2. do_rootfs (OpkgPM.write_index()): operates on WORKDIR/oe-rootfs-repo, a
throwaway local copy of packages assembled exclusively for the current
rootfs build. This directory is never published or signed. This is the only
path the commit changes.
This is the write_index() call
at meta/lib/oe/package_manager/ipk/rootfs.py:281

Or are you saying that there is a use-case where
e.g. core-image-minimal/1.0/oe-rootfs-repo gets published over the network,
rather than build/tmp/deploy/ipk? I was referring to yocto_docs where the
example given is publishing packages from tmp/deploy:
$ cd bitbake-builds/build/tmp/deploy/rpm
$ python3 -m http.server

=C3=89tienne

On Thu, Jul 30, 2026 at 1:51=E2=80=AFPM Paul Barker <paul@pbarker.dev> wrot=
e:

> On Thu, 2026-07-30 at 11:10 +0200, Etienne Cordonnier via
> lists.openembedded.org wrote:
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > Computing checksums in the opkg Packages index requires reading every
> > .ipk file in full.  For a large image with 7000+ packages (including
> > multi-gigabyte debug packages), this adds 150-300s to every do_rootfs
> run.
> >
> > Checksums in the Packages index are only meaningful for signed feeds
> > (PACKAGE_FEED_SIGN=3D1): the GPG signature covers the Packages index
> > which contains the SHA256Sum of each .ipk, forming a chain of trust
> > that prevents tampered packages being swapped on a remote feed.
> >
> > For unsigned local file:// feeds the packages are installed directly
> > from the build host filesystem where there is no tampering risk.  Skip
> > all checksum generation in that case by passing no --checksum flags to
> > opkg-make-index (the tool's default behaviour when given no flags).
> > Pass --force-checksum to opkg so it does not error on the absent
> > checksum fields.
> >
> > On a test image with 7000+ packages (including a 2.3 GB debug
> > package): write_index time reduced from ~180s to ~22s (8x speedup)
> > when opkg-make-index is configured to produce no checksums by default.
> >
> > See
> https://git.openembedded.org/openembedded-core/commit/?id=3De462f47489f35=
902b6972f9837d9adfa542fc796
> > ("Enable sha256 checksums in opkg indexer", 2019) for the original
> rationale.
> >
> > AI-Generated: Claude Sonnet 4.6
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>
> Hi,
>
> The package feed may be made available over a network and/or externally
> signed after it has been generated, so I don't think we should disable
> writing checksums into the feed by default.
>
> How about adding a variable to control this? It can be enabled by
> default in OE-core and you can disable it in a local or distro config if
> you know the signatures won't be needed in your use case.
>
> Best regards,
>
> --
> Paul Barker
>
>

--0000000000004ef9100657d36fb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul,<br>my understanding is that my change does not im=
pact the package feed. Checksums are still always calculated for the normal=
 package feed after my change. There are two different code paths:<br><br>1=
.=C2=A0do_package_index (<a href=3D"http://package-index.bb">package-index.=
bb</a> -&gt; generate_index_files() -&gt; OpkgIndexer(d, DEPLOY_DIR_IPK).wr=
ite_index()): operates on the global DEPLOY_DIR_IPK. This is the feed that =
can be published, externally signed, or served over a network. This path is=
 not touched by this commit: it still always writes checksums.<br>This is t=
he write_index() call at meta/lib/oe/package_manager/__init__.py:579<br><br=
>2.=C2=A0do_rootfs (OpkgPM.write_index()): operates on WORKDIR/oe-rootfs-re=
po, a throwaway local copy of packages assembled exclusively for the curren=
t rootfs build. This directory is never published or signed. This is the on=
ly path the commit changes.<br>This is the write_index() call at=C2=A0meta/=
lib/oe/package_manager/ipk/rootfs.py:281<br><br>Or are you saying that ther=
e is a use-case where e.g.=C2=A0core-image-minimal/1.0/oe-rootfs-repo gets =
published over the network, rather than build/tmp/deploy/ipk? I was referri=
ng to yocto_docs where the example given is publishing packages from tmp/de=
ploy:<br>$ cd bitbake-builds/build/tmp/deploy/rpm<br>$ python3 -m http.serv=
er<br><br>=C3=89tienne</div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 30, 2026 at 1:51=E2=
=80=AFPM Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev">paul@pbarker.d=
ev</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Thu, 2026-07-30 at 11:10 +0200, Etienne Cordonnier via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; <br>
&gt; Computing checksums in the opkg Packages index requires reading every<=
br>
&gt; .ipk file in full.=C2=A0 For a large image with 7000+ packages (includ=
ing<br>
&gt; multi-gigabyte debug packages), this adds 150-300s to every do_rootfs =
run.<br>
&gt; <br>
&gt; Checksums in the Packages index are only meaningful for signed feeds<b=
r>
&gt; (PACKAGE_FEED_SIGN=3D1): the GPG signature covers the Packages index<b=
r>
&gt; which contains the SHA256Sum of each .ipk, forming a chain of trust<br=
>
&gt; that prevents tampered packages being swapped on a remote feed.<br>
&gt; <br>
&gt; For unsigned local file:// feeds the packages are installed directly<b=
r>
&gt; from the build host filesystem where there is no tampering risk.=C2=A0=
 Skip<br>
&gt; all checksum generation in that case by passing no --checksum flags to=
<br>
&gt; opkg-make-index (the tool&#39;s default behaviour when given no flags)=
.<br>
&gt; Pass --force-checksum to opkg so it does not error on the absent<br>
&gt; checksum fields.<br>
&gt; <br>
&gt; On a test image with 7000+ packages (including a 2.3 GB debug<br>
&gt; package): write_index time reduced from ~180s to ~22s (8x speedup)<br>
&gt; when opkg-make-index is configured to produce no checksums by default.=
<br>
&gt; <br>
&gt; See <a href=3D"https://git.openembedded.org/openembedded-core/commit/?=
id=3De462f47489f35902b6972f9837d9adfa542fc796" rel=3D"noreferrer" target=3D=
"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3De462f4=
7489f35902b6972f9837d9adfa542fc796</a><br>
&gt; (&quot;Enable sha256 checksums in opkg indexer&quot;, 2019) for the or=
iginal rationale.<br>
&gt; <br>
&gt; AI-Generated: Claude Sonnet 4.6<br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
Hi,<br>
<br>
The package feed may be made available over a network and/or externally<br>
signed after it has been generated, so I don&#39;t think we should disable<=
br>
writing checksums into the feed by default.<br>
<br>
How about adding a variable to control this? It can be enabled by<br>
default in OE-core and you can disable it in a local or distro config if<br=
>
you know the signatures won&#39;t be needed in your use case.<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div>

--0000000000004ef9100657d36fb0--

