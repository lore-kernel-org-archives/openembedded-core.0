Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0FEB1739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 15:52:10 +0000 (UTC)
Received: by qkdl129 with SMTP id l129so14469104qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=J17J0dqxtjxl9d7NsYcHVgQvfWlrJ0iOZpyqLWYzq2A=;
	b=aSdAkX5raMeTTMbWCVbD3VL/K6K+KkfvSW3bERjc8x6cvXckIjO9pOvLZ3C1SPv3aC
	yG+2VKrj3fRKdvHOkwhtPT9u+hEeNJHysrthsQQBpwHsW5nyS27woeRF3atw/Sf/Mr3O
	yZsppLdlINPWqYe1AP3Yv0Dz4qKEL6iaUeNBb1PrLsuNKhQ/X4ff+si0TkWzZBWxNk8d
	KrLo9vbKA0zfbTpIyOU7Oyp71m2TvB6I3M+9V/SzPUV2QoF1nO56CN5Tkrv6nrqpbUNH
	pdI/H9/+OH6gVe3D6TljtRR7zqfijZ/f6RQuXBlKveY2GXx85cTrCvjsRLUB7hkn+Iek
	3joA==
X-Received: by 10.55.31.40 with SMTP id f40mr24208912qkf.18.1436802730695;
	Mon, 13 Jul 2015 08:52:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.55 with HTTP; Mon, 13 Jul 2015 08:51:51 -0700 (PDT)
In-Reply-To: <CAEGpDuYVEB0Y5T+SqybCfagCkO1rA1A66toZdYz_EMWGEc87aw@mail.gmail.com>
References: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
	<CAJTo0LbpxBHh8mv7qqKMkVmBcoQ=ckjt3+4ipahMwtqUUkZr1A@mail.gmail.com>
	<CAEGpDuYVEB0Y5T+SqybCfagCkO1rA1A66toZdYz_EMWGEc87aw@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 13 Jul 2015 08:51:51 -0700
X-Google-Sender-Auth: Ir86Cxc7bELZLWmY0ORF8H2VRSo
Message-ID: <CABcZAN=z8xMuAABa54A8L2uFhC9fjRbZ36iszxSTJOpWcnFypw@mail.gmail.com>
To: Pau Espin Pedrol <pespin.shar@gmail.com>
Cc: Pau Espin Pedrol <pau.espin@aweurope.be>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pulseaudio: add systemd to PACKAGECONFIG if enabled in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 13 Jul 2015 15:52:11 -0000
Content-Type: multipart/alternative; boundary=001a114780b8602072051ac3b4f5

--001a114780b8602072051ac3b4f5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2015 at 3:23 AM, Pau Espin Pedrol <pespin.shar@gmail.com>
wrote:

> I am not sure which is the behavior with those paths right now and how
> it should be.
>
> I just checked this:
>
> http://www.freedesktop.org/software/systemd/man/systemd.unit.html#Unit%20=
Load%20Path
>
> So, it seems according to documentation that system services should be
> installed under /usr/lib/systemd/system, but currently they are
> installed in /lib/systemd/system in my generated image. Is that a
> expected behaviour? Shouldn't we try to follow documentation? I see
> that sometimes /lib/systemd/system path is appended to the dirs in
> systemdsystemunitpath, but it's not stated in the documentation,
> that's a bit strange.
>

Depends on the distro. Ubuntu, for example, uses /lib/systemd.


> For user services, /usr/lib/systemd/user is already being used as
> stated in docs.
>
> Now, when multilib comes in, I get lost. If I understand correctly,
> with multilib enabled we have too /lib64 and /usr/lib64. Are then
> systemd service files suppoused to be installed in /usr/lib/systemd/
> or in /usr/lib64/systemd/ ? If I undersood correctly your comment you
> meant they should still be going into /usr/lib/systemd right?
>

Yes, we don=E2=80=99t want arch-independent files going into arch-specific =
dirs.

Now, talking about bitbake.conf. I see there's already a line with the
> following:
> export systemd_unitdir =3D "/lib/systemd"
>
> So, apart from your nonarch issue, I think it would also be a good
> idea to split systemd_unitdir into system and user, as done by
> provided pc in systemd (src/core/systemd.pc.in):
> 1- If still want system services to be in /lib and user services to be
> in /usr/lib:
> export nonarch_libdir =3D "${prefix}/lib"
>
> export systemd_system_unitdir =3D "${nonarch_base_libdir}/systemd/system"
> export systemd_user_unitdir =3D "${nonarch_libdir}/systemd/user"
> or
> export systemd_system_unitdir =3D "${nonarch_base_libdir}/systemd"
> export systemd_user_unitdir =3D "${nonarch_libdir}/systemd"
>
>
> 2- If you want both in /usr/lib:
> export nonarch_libdir =3D "${prefix}/lib"
>
> export systemd_system_unitdir =3D "${nonarch_libdir}/systemd/system"
> export systemd_user_unitdir =3D "${nonarch_libdir}/systemd/user"
> or
> export systemd_system_unitdir =3D "${nonarch_libdir}/systemd"
> export systemd_user_unitdir =3D "${nonarch_libdir}/systemd"
>

I don=E2=80=99t really see why one would want some of their service files i=
n one
libdir and the rest in another. Is there a reason to not just obey
systemd_unitdir in pulseaudio?
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114780b8602072051ac3b4f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jul 13, 2015 at 3:23 AM, Pau Espin Pedrol <span dir=3D"ltr">&lt;<a =
href=3D"mailto:pespin.shar@gmail.com" target=3D"_blank">pespin.shar@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":b2" =
class=3D"a3s" style=3D"overflow:hidden">I am not sure which is the behavior=
 with those paths right now and how<br>
it should be.<br>
<br>
I just checked this:<br>
<a href=3D"http://www.freedesktop.org/software/systemd/man/systemd.unit.htm=
l#Unit%20Load%20Path" rel=3D"noreferrer" target=3D"_blank">http://www.freed=
esktop.org/software/systemd/man/systemd.unit.html#Unit%20Load%20Path</a><br=
>
<br>
So, it seems according to documentation that system services should be<br>
installed under /usr/lib/systemd/system, but currently they are<br>
installed in /lib/systemd/system in my generated image. Is that a<br>
expected behaviour? Shouldn&#39;t we try to follow documentation? I see<br>
that sometimes /lib/systemd/system path is appended to the dirs in<br>
systemdsystemunitpath, but it&#39;s not stated in the documentation,<br>
that&#39;s a <span class=3D"il">bit</span> strange.<br></div></blockquote><=
div><br></div><div>Depends on the distro. Ubuntu, for example, uses /lib/sy=
stemd.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":b2"=
 class=3D"a3s" style=3D"overflow:hidden">For user services, /usr/lib/system=
d/user is already being used as<br>
stated in docs.<br>
<br>
Now, when multilib comes in, I get lost. If I understand correctly,<br>
with multilib enabled we have too /lib64 and /usr/lib64. Are then<br>
systemd service files suppoused to be installed in /usr/lib/systemd/<br>
or in /usr/lib64/systemd/ ? If I undersood correctly your comment you<br>
meant they should still be going into /usr/lib/systemd right?<br></div></bl=
ockquote><div><br></div><div>Yes, we don=E2=80=99t want arch-independent fi=
les going into arch-specific dirs.=C2=A0</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div id=3D":b2" class=3D"a3s" style=3D"overflow:hidden">
Now, talking about <span class=3D"il">bitbake</span>.<span class=3D"il">con=
f</span>. I see there&#39;s already a line with the<br>
following:<br>
export systemd_unitdir =3D &quot;/lib/systemd&quot;<br>
<br>
So, apart from your nonarch issue, I think it would also be a good<br>
idea to split systemd_unitdir into system and user, as done by<br>
provided pc in systemd (src/core/<a href=3D"http://systemd.pc.in" rel=3D"no=
referrer" target=3D"_blank">systemd.pc.in</a>):<br>
1- If still want system services to be in /lib and user services to be<br>
in /usr/lib:<br>
export nonarch_libdir =3D &quot;${prefix}/lib&quot;<br>
<br>
export systemd_system_unitdir =3D &quot;${nonarch_base_libdir}/systemd/syst=
em&quot;<br>
export systemd_user_unitdir =3D &quot;${nonarch_libdir}/systemd/user&quot;<=
br>
or<br>
export systemd_system_unitdir =3D &quot;${nonarch_base_libdir}/systemd&quot=
;<br>
export systemd_user_unitdir =3D &quot;${nonarch_libdir}/systemd&quot;<br>
<br>
<br>
2- If you want both in /usr/lib:<br>
export nonarch_libdir =3D &quot;${prefix}/lib&quot;<br>
<br>
export systemd_system_unitdir =3D &quot;${nonarch_libdir}/systemd/system&qu=
ot;<br>
export systemd_user_unitdir =3D &quot;${nonarch_libdir}/systemd/user&quot;<=
br>
or<br>
export systemd_system_unitdir =3D &quot;${nonarch_libdir}/systemd&quot;<br>
export systemd_user_unitdir =3D &quot;${nonarch_libdir}/systemd&quot;</div>=
</blockquote></div><br>I don=E2=80=99t really see why one would want some o=
f their service files in one libdir and the rest in another. Is there a rea=
son to not just obey systemd_unitdir in pulseaudio?</div><div class=3D"gmai=
l_extra">-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarso=
n at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Main=
tainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a114780b8602072051ac3b4f5--
