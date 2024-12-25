Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3EDE7718B
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 15:33:45 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.8646.1735140820843278399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Dec 2024 07:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QIXUyy8k;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401c52000dso6726548e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 07:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735140819; x=1735745619; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=agQzXicqtNIbZF8EyPwU3SyFiImRTCKQmAYlHjYk3k4=;
        b=QIXUyy8kz5tlcQwUXnR6Wwo93a++HXWiRpCv71d3BXgrkaEEXa0rTnYjfe8L55hdkd
         gm8Gs4kUVF0BrL9EgLqcvRnD64KCoCakSUl60QtkSdZPWBzj+92BPpEIZFRix1MfE/Xi
         2aG0o0wNkmFk4MNKPvfJQ1/w8e4jXXHSdccc5Clv2TvUyGd0bGejFgLEup79QGP+CbpQ
         1h0FxGsFJxakw1D2IceUItnFpMJ/q5RlvPb6PSiDJyYCZiJQ8bjhIhdzPb+bbtlYuQcT
         6HTrl1+RYxnfmnfDcVQQ6w1qXcAy3AgyRjabhlq3myXqo8Gc+HJREG78pXCmChZitsZ2
         OR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735140819; x=1735745619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agQzXicqtNIbZF8EyPwU3SyFiImRTCKQmAYlHjYk3k4=;
        b=RBCNAfUOfG69fACEJ2vz2suYEUH+zF/qA4e6W6fiikvqw0/MnCLdaty4nbAXjLMU5q
         4hnoFbSA37IHEjpLvl77i+t4+PHnSZPOnyv6Vxg9bA/gq9LKRMlQ4isi1z9nyCG0ckob
         sKukl2iB7yDo7f0qk805P2/kbabrU5fWrMD5UBPVGZKc8/Td8XzdtMc1UGXMnmXeYngP
         Ypd8xTL/QPtULcEN+mGmenA7+2S/5alTQMEHQY07tCIMTeSXb+/fdn0+WabJr2pVc6sD
         f+o/0w6CAnIl0ZsFnLDnMQ/QUmzTdPiGKbAov8J6ydoFX0QrgUTO3Z2KIUCsI2zsO7N2
         PlVw==
X-Forwarded-Encrypted: i=1; AJvYcCXAIk+UWezb7bh3RhKnNchSp7jmzoog39TOGTVUyoufL6Pv9atDQ0pNZ5BLsUilbcvbtXxhKFwYk4HmypRr0wPMvQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxEJYgfUHC513lAUAJ9UH0RrvUTk6+7m/AX+56hU5gd/jSqyBY7
	9SvQNDvAuJjtVEsSoiGuQuPcKM5aSukOzP6anFk9efT1J0agHsmkrs13t9noxrYkShDOSDeE9N4
	M/KN2ft6NahB9jxiVV43iCMKGylo=
X-Gm-Gg: ASbGncsTxJtaaBV+Q1wvK0orA4WidwdNj7/u6qHRSmarjGIAU34xXkpmhpwVDqWGdNo
	XyY5CppLX7mMYgL8sH3g9v9V2BHyv4ZW53/KhC8SwyM0BntkYmk8eWDdO9TIZgl2WTjlZr8Y=
X-Google-Smtp-Source: AGHT+IHkJdApgYvctumb723ptD0W3qNoxHhRaJ0NNjvv+cTylOwXlgnzHMMEzUoiM/L/AxXRWfPf83Soev7e3rzLTHQ=
X-Received: by 2002:a05:6512:690:b0:540:2fbb:476c with SMTP id
 2adb3069b0e04-542295300aemr5903503e87.15.1735140818366; Wed, 25 Dec 2024
 07:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
 <20241118162643.1423409-3-alex.kanavin@gmail.com> <c799588bada27abdf2b412115868c5b84c24a0e2.camel@linuxfoundation.org>
 <CANNYZj_ONOGam=9um4qqqAc_D0gQHrQML3a9eXBEgHLCiRtM1A@mail.gmail.com>
 <4254d23ae9ad100e70f199fa4949ce00bfe7063c.camel@linuxfoundation.org>
 <CANNYZj-Ox6t8yV7Bh2NePmseYCW843Z5ozq50y2Tyoa=GeDPyg@mail.gmail.com>
 <1647f808543a0851f5a1a17e293f1a68970f7c0e.camel@linuxfoundation.org>
 <CAJdd5GYwyLGFs_nreXDNV6F8_GAiTBMhWOe6V_TiO9aw+MCOng@mail.gmail.com> <CANNYZj8_OShX4sPqhGpb3HSbN0quMKUcoFtKhLrcGTLtG1d-Qw@mail.gmail.com>
In-Reply-To: <CANNYZj8_OShX4sPqhGpb3HSbN0quMKUcoFtKhLrcGTLtG1d-Qw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 25 Dec 2024 08:33:26 -0700
Message-ID: <CAJdd5GbRf731WsnMZujR3SUCVUhm080f=F_iZsFTuZxt1kQH=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000001d38fa062a19f492"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 15:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209083

--0000000000001d38fa062a19f492
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm, ok, I'll try again.

On Wed, Dec 25, 2024, 8:29=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmail=
.com>
wrote:

> On Fri, 20 Dec 2024 at 18:39, Joshua Watt <jpewhacker@gmail.com> wrote:
> > 1) bitbake-config-build is way too aggressive in the files it looks
> > for as fragments. My editor (vim) creates hidden temporary files that
> > I kept having to manually delete or the tool would attempt to parse
> > them and fail. I would recommend that it only consider non-hidden
> > files that end in .conf as valid fragments.
> > 2) It would be convenient if `bitbake-config-build enable-fragment`
> > and `bitbake-config-build disable-fragment` could take more than one
> > fragment, as this would make scripting in CI more straight forward.
>
> I see the patches for these have been sent, thanks.
>
> > 3) The biggest problem I had with this is that I can't set variables
> > like MACHINE/DISTRO etc. in fragments, I think this is due to how
> > deferred the evaluation of this is. Without being able to do this, I'm
> > not sure how useful this system will be for me (or at least, it won't
> > be able to replace any of the current mechanisms I use). I think what
> > users are generally after here is that they can really easily share a
> > configuration in source control (which this does well), but if it
> > can't control everything it's of limited use.
>
> I tried this locally with poky and adding DISTRO/MACHINE to one of the
> selftest fragments, and it works properly, so if you can provide a way
> to reproduce this problem I'd appreciate. Or there's something else on
> your side that gets in the way.
>
> Here's the output of bitbake -e (DISTRO is similarly adjusted as expected=
):
>
> #
> # $MACHINE [3 operations]
> #   set /srv/storage/alex/yocto/build-64/conf/local.conf:38
> #     [_defaultval] "qemux86-64"
> #   set /srv/work/alex/poky/meta/conf/documentation.conf:279
> #     [doc] "Specifies the target device for which the image is built.
> You define MACHINE in the conf/local.conf file in the Build
> Directory."
> #   set
> /srv/work/alex/poky/meta-selftest/conf/fragments/test-fragment.conf:5
> #     "qemuarm"
> # pre-expansion value:
> #   "qemuarm"
> MACHINE=3D"qemuarm"
>
> Alex
>

--0000000000001d38fa062a19f492
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hmm, ok, I&#39;ll try again.</div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Dec 25, 2024, 8:29=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Fri, 20 Dec 2024 at 18:39, Joshua Watt &lt;<a hre=
f=3D"mailto:jpewhacker@gmail.com" target=3D"_blank" rel=3D"noreferrer">jpew=
hacker@gmail.com</a>&gt; wrote:<br>
&gt; 1) bitbake-config-build is way too aggressive in the files it looks<br=
>
&gt; for as fragments. My editor (vim) creates hidden temporary files that<=
br>
&gt; I kept having to manually delete or the tool would attempt to parse<br=
>
&gt; them and fail. I would recommend that it only consider non-hidden<br>
&gt; files that end in .conf as valid fragments.<br>
&gt; 2) It would be convenient if `bitbake-config-build enable-fragment`<br=
>
&gt; and `bitbake-config-build disable-fragment` could take more than one<b=
r>
&gt; fragment, as this would make scripting in CI more straight forward.<br=
>
<br>
I see the patches for these have been sent, thanks.<br>
<br>
&gt; 3) The biggest problem I had with this is that I can&#39;t set variabl=
es<br>
&gt; like MACHINE/DISTRO etc. in fragments, I think this is due to how<br>
&gt; deferred the evaluation of this is. Without being able to do this, I&#=
39;m<br>
&gt; not sure how useful this system will be for me (or at least, it won&#3=
9;t<br>
&gt; be able to replace any of the current mechanisms I use). I think what<=
br>
&gt; users are generally after here is that they can really easily share a<=
br>
&gt; configuration in source control (which this does well), but if it<br>
&gt; can&#39;t control everything it&#39;s of limited use.<br>
<br>
I tried this locally with poky and adding DISTRO/MACHINE to one of the<br>
selftest fragments, and it works properly, so if you can provide a way<br>
to reproduce this problem I&#39;d appreciate. Or there&#39;s something else=
 on<br>
your side that gets in the way.<br>
<br>
Here&#39;s the output of bitbake -e (DISTRO is similarly adjusted as expect=
ed):<br>
<br>
#<br>
# $MACHINE [3 operations]<br>
#=C2=A0 =C2=A0set /srv/storage/alex/yocto/build-64/conf/local.conf:38<br>
#=C2=A0 =C2=A0 =C2=A0[_defaultval] &quot;qemux86-64&quot;<br>
#=C2=A0 =C2=A0set /srv/work/alex/poky/meta/conf/documentation.conf:279<br>
#=C2=A0 =C2=A0 =C2=A0[doc] &quot;Specifies the target device for which the =
image is built.<br>
You define MACHINE in the conf/local.conf file in the Build<br>
Directory.&quot;<br>
#=C2=A0 =C2=A0set /srv/work/alex/poky/meta-selftest/conf/fragments/test-fra=
gment.conf:5<br>
#=C2=A0 =C2=A0 =C2=A0&quot;qemuarm&quot;<br>
# pre-expansion value:<br>
#=C2=A0 =C2=A0&quot;qemuarm&quot;<br>
MACHINE=3D&quot;qemuarm&quot;<br>
<br>
Alex<br>
</blockquote></div>

--0000000000001d38fa062a19f492--

