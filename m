Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5EE976B4C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 18:27:18 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id o7so3607765lbv.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=fQyI5zavpFc5+Iin1BO7E9M4gAHViPys7ImQ9/VEXbM=;
	b=zoDprz9DefCwDxZfKFwE8HDpMoeKXjRXTwVnPbwYqlmUzspbIHUhGGTdkglQBX209w
	3ufz0FYBhaMqhVi44yDR9GMXCdpfHFcehKHlgQw8aZBghyEYa85A0GvuEdC5it5labwi
	Ld56MtzgpyDFxcqSe5LrclC5LQ0vmhOhdhGWTEbS46iOFUPySH1CmaLxb7A57g3K4E0d
	LVdsfv1T4TYvJotGxvedtblE4kT2OlbOvxdnqCYEpXH7XyFNMWddjnaqKuWe9fPAz0DT
	NKvSCzyn+kNzkDLuEzAcfgbT3YGEotNXpP3jk4sU3VyEbe2utpBTCKhvD1+ffvnyCFrP
	BABQ==
X-Received: by 10.112.60.129 with SMTP id h1mr4645414lbr.12.1375208838167;
	Tue, 30 Jul 2013 11:27:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Tue, 30 Jul 2013 11:26:58 -0700 (PDT)
In-Reply-To: <CABcZANn+uBWBLLqoTUc0KSD6YtWsyuMgMUXX7EfQuGJqJOQmNg@mail.gmail.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
	<51F092C5.3060906@windriver.com>
	<CABcZANn+uBWBLLqoTUc0KSD6YtWsyuMgMUXX7EfQuGJqJOQmNg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 30 Jul 2013 11:26:58 -0700
X-Google-Sender-Auth: d8zOVZR0hnb9uR7MTssvlJjScjQ
Message-ID: <CABcZANkzrC9D4CR5cp6VWV9goF0bWKDP_0GJLiNt18AfoMuU0Q@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Tue, 30 Jul 2013 18:27:18 -0000
Content-Type: multipart/alternative; boundary=e89a8f9219c24a82f604e2bec2c1

--e89a8f9219c24a82f604e2bec2c1
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 30, 2013 at 11:17 AM, Chris Larson <clarson@kergoth.com> wrote:

> - Next steps, from my perspective:
>
>     - We need to agree on a pattern to follow for the read only rootfs
> support for individual pieces of recipes, as we need to work through them
> individually. Currently we have two possibilities on the floor, the
> /etc/default/readonly/ approach advocated by Chen Qi, and the overriding
> the volatiles/tmpfiles.d config file approach advocated by myself.
>     - We need a plan of attack to avoid the need to duplicate tmpfiles.d
> and volatiles configuration. I was leaning toward using systemd-tmpfiles
> for both sysvinit and systemd, but others have advocated moving to
> tmpfiles.d configuration but using a homerolled script to implement it.
> Either would be a step in the right direction: moving away from volatiles
> config files in favor of tmpfiles.d config files.
>     - We need a coherent, consistent mechanism for the user to choose
> whether a given file or files will be pregenerated at build time (e.g. ssh
> host keys, machine id) or generated every time at boot, for applicable
> cases.
>

I forgot to mention, we also need to focus on improving the oe-core systemd
support, and the feature parity between sysvinit and systemd images. Some
are missing systemd support at all still (e.g. dropbear's service files are
still in meta-systemd), and others don't behave the same between the two.
For example, were we to pull over those dropbear service files, the
dropbear sysvinit script would behave differently than the service files,
and dropbear would behave differently than openssh.

I don't know if that's a priority for the Yocto 1.5 release, but it
probably should be.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--e89a8f9219c24a82f604e2bec2c1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jul 30, 2013 at 11:17 AM, Chris Larson <span dir=3D"ltr">&lt;<a href=3D=
"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&gt;<=
/span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">- Next steps, fro=
m my perspective:</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">

=C2=A0 =C2=A0 - We need to agree on a pattern to follow for the read only r=
ootfs support for individual pieces of recipes, as we need to work through =
them individually. Currently we have two possibilities on the floor, the /e=
tc/default/readonly/ approach advocated by=C2=A0Chen Qi, and the overriding=
 the volatiles/tmpfiles.d config file approach advocated by myself.</div>


<div class=3D"gmail_extra">=C2=A0 =C2=A0 - We need a plan of attack to avoi=
d the need to duplicate tmpfiles.d and volatiles configuration. I was leani=
ng toward using systemd-tmpfiles for both sysvinit and systemd, but others =
have advocated moving to tmpfiles.d configuration but using a homerolled sc=
ript to implement it. Either would be a step in the right direction: moving=
 away from volatiles config files in favor of tmpfiles.d config files.</div=
>


<div class=3D"gmail_extra">=C2=A0 =C2=A0 - We need a coherent, consistent m=
echanism for the user to choose whether a given file or files will be prege=
nerated at build time (e.g. ssh host keys, machine id) or generated every t=
ime at boot, for applicable cases.</div>

</blockquote></div><br>I forgot to mention, we also need to focus on improv=
ing the oe-core systemd support, and the feature parity between sysvinit an=
d systemd images. Some are missing systemd support at all still (e.g. dropb=
ear&#39;s service files are still in meta-systemd), and others don&#39;t be=
have the same between the two. For example, were we to pull over those drop=
bear service files, the dropbear sysvinit script would behave differently t=
han the service files, and dropbear would behave differently than openssh.<=
/div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I don&#39;t=
 know if that&#39;s a priority for the Yocto 1.5 release, but it probably s=
hould be.<br>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Fou=
nder - BitBake, OpenEmbedded, OpenZaurus<br>

Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--e89a8f9219c24a82f604e2bec2c1--
