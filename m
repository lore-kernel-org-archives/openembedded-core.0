Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6338073AE0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 16:06:00 +0000 (UTC)
Received: by padet14 with SMTP id et14so12434620pad.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 09:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=RYznIy/D8MeefS1hT4bWbw/ZRS5XCS/fGevwJg0hF0w=;
	b=vyLTdZ6/2rBI36I8YFVMYUmbHd8bShXa9Q7mn3D2QLYi7TzmtPclofkghw+RXCJOoQ
	hCP8socVIV+9d1gXiBH/WrJMdx9f6wrXFZMKVD1XjDpkg3sXlx4/o+xpG2ADKBcePD0i
	8bkOWC8mKNDRC8BcwVeec4rFBkcQGGPUXEBP+YxJPpvGUFufrdB4vgo4zHTcMB0La7QA
	zOWH3mGL26jkEXLGK0qgacGDA7CdScGmWAiFVqwBg0aG0JJit25bUaXY4czdexSzd4OG
	G4rzXhsNTZdSC9LYiiB/lz6kM68ht2rAJJQCTtRStw4i+oxYu8iBCjkds8UqdaDpqSji
	kk/g==
X-Received: by 10.70.126.225 with SMTP id nb1mr80129477pdb.40.1426089961587;
	Wed, 11 Mar 2015 09:06:01 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:6588:5f61:c664:8bb4?
	([2601:9:3580:84c:6588:5f61:c664:8bb4])
	by mx.google.com with ESMTPSA id tr8sm6860736pab.4.2015.03.11.09.06.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Mar 2015 09:06:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1soiYrSG_MARzY0hLj+WbvHnBci5MmupLhdps6oo9=UkVg@mail.gmail.com>
Date: Wed, 11 Mar 2015 09:05:58 -0700
Message-Id: <5AB39215-4BA4-4082-A529-B6059FBA01ED@gmail.com>
References: <1426062809-1844-1-git-send-email-raj.khem@gmail.com>
	<1426069160.9114.41.camel@linuxfoundation.org>
	<CAMKF1soiYrSG_MARzY0hLj+WbvHnBci5MmupLhdps6oo9=UkVg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] var/volatile: Mount it if doing ro-rfs
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
X-List-Received-Date: Wed, 11 Mar 2015 16:06:01 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_DD09D06F-6FB4-4B52-B5BD-1060392130F5"

--Apple-Mail=_DD09D06F-6FB4-4B52-B5BD-1060392130F5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Mar 11, 2015, at 7:53 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
>=20
> On Wednesday, March 11, 2015, Richard Purdie =
<richard.purdie@linuxfoundation.org =
<mailto:richard.purdie@linuxfoundation.org>> wrote:
> On Wed, 2015-03-11 at 08:33 +0000, Khem Raj wrote:
> > - Do not mount /var/volatile to be tmpfs always only when generating
> >   readonly rootfs
> > - Generate var-volatile.mount unit when using system in =
readonly-rootfs
> >   to mount /var/volatile as tmpfs
> > - for sysvinit, mount /var/volatile to be tmpfs if its not already
> >   mounted so
> > - Use RequiresMountsFor instead of After=3D, so systemd figures out =
the
> >   needed dependencies for making /var/volatile accessible for =
journald
> >   and not us.
> >
> > Change-Id: I0b176b3e1c1e88e84d2c93154aac04cef565d8ea
> > Signed-off-by: Khem Raj <raj.khem@gmail.com <javascript:;>>
> > ---
> >  meta/classes/image.bbclass                                          =
   | 1 +
> >  meta/recipes-core/base-files/base-files/fstab                       =
   | 1 -
> >  =
meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh | =
2 +-
> >  meta/recipes-core/systemd/systemd/journald-volatile.conf            =
   | 2 +-
> >  4 files changed, 3 insertions(+), 3 deletions(-)
>=20
> Which combinations has this been tested with? Given the time the patch
> has existed for, I'm sceptical all the combinations we need have been
> tested, I'd love to be wrong.
>=20
> This is a pretty major change of behaviour and given the problems
> previous changes have caused, I'm very very very nervous about what
> issues this is going to cause :(.
>=20
> Systemd in both ways but not sysvinit=20


Just when you think all is well, I just sent a V2, that seemed to work =
on x86 emulator, but due diligence is better I don=E2=80=99t have =
sysvinit setups, its fine if it doesn=E2=80=99t go in,
the fact that patch is out there folks can always back port after =
release.=20

>=20
> Cheers,
>=20
> Richard
>=20


--Apple-Mail=_DD09D06F-6FB4-4B52-B5BD-1060392130F5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Mar 11, 2015, at 7:53 AM, Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" class=3D"">raj.khem@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><br =
class=3D""><br class=3D"">On Wednesday, March 11, 2015, Richard Purdie =
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" =
class=3D"">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 2015-03-11 at =
08:33 +0000, Khem Raj wrote:<br class=3D"">
&gt; - Do not mount /var/volatile to be tmpfs always only when =
generating<br class=3D"">
&gt;&nbsp; &nbsp;readonly rootfs<br class=3D"">
&gt; - Generate var-volatile.mount unit when using system in =
readonly-rootfs<br class=3D"">
&gt;&nbsp; &nbsp;to mount /var/volatile as tmpfs<br class=3D"">
&gt; - for sysvinit, mount /var/volatile to be tmpfs if its not =
already<br class=3D"">
&gt;&nbsp; &nbsp;mounted so<br class=3D"">
&gt; - Use RequiresMountsFor instead of After=3D, so systemd figures out =
the<br class=3D"">
&gt;&nbsp; &nbsp;needed dependencies for making /var/volatile accessible =
for journald<br class=3D"">
&gt;&nbsp; &nbsp;and not us.<br class=3D"">
&gt;<br class=3D"">
&gt; Change-Id: I0b176b3e1c1e88e84d2c93154aac04cef565d8ea<br class=3D"">
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"javascript:;" =
onclick=3D"_e(event, 'cvml', 'raj.khem@gmail.com')" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D"">
&gt; ---<br class=3D"">
&gt;&nbsp; meta/classes/image.bbclass&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 1 +<br =
class=3D"">
&gt;&nbsp; meta/recipes-core/base-files/base-files/fstab&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | 1 -<br class=3D"">
&gt;&nbsp; =
meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh | =
2 +-<br class=3D"">
&gt;&nbsp; =
meta/recipes-core/systemd/systemd/journald-volatile.conf&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 2 +-<br class=3D"">
&gt;&nbsp; 4 files changed, 3 insertions(+), 3 deletions(-)<br class=3D"">=

<br class=3D"">
Which combinations has this been tested with? Given the time the =
patch<br class=3D"">
has existed for, I'm sceptical all the combinations we need have been<br =
class=3D"">
tested, I'd love to be wrong.<br class=3D"">
<br class=3D"">
This is a pretty major change of behaviour and given the problems<br =
class=3D"">
previous changes have caused, I'm very very very nervous about what<br =
class=3D"">
issues this is going to cause :(.</blockquote><div class=3D""><br =
class=3D""></div><div class=3D"">Systemd in both ways but not =
sysvinit&nbsp;</div></div></blockquote><div><br class=3D""></div><div><br =
class=3D""></div><div>Just when you think all is well, I just sent a V2, =
that seemed to work on x86 emulator, but due diligence is better I =
don=E2=80=99t have sysvinit setups, its fine if it doesn=E2=80=99t go =
in,</div><div>the fact that patch is out there folks can always back =
port after release.&nbsp;</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br class=3D"">
Cheers,<br class=3D"">
<br class=3D"">
Richard<br class=3D"">
<br class=3D"">
</blockquote>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_DD09D06F-6FB4-4B52-B5BD-1060392130F5--
