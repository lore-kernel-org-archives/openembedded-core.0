Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 70FE160664
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 22:44:10 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id t13so968395lbd.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 15:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=YBf9eIRQPNKLoOHmW+6n/l82tnlhigyvk8m8xM2psis=;
	b=tVXVR7wA74tfy728t4bFctveDJktSoWI5563MA5tonB0bi7FqB1gbAVUe2kyCmepUp
	Cmr1gr5HQTe762nqL8w4kAQ5l2Kmn6clkOZ8VzdoCdIn4yqg7XwwOKElFMugJJdkcDP8
	jmswmS/EeNdraMX5uP97lHgq0ki4bP/o5PrFIhe7uWqovRdncE0Ro6RgsnwhKWqmU/VU
	STJnbijrsnYgB22DJVOUm3VqZyXdfkDf62HlJAp6k1PnKcpr/xiLX2Q2VaKmnGvFknnN
	qUHqwuQrylSR90cL9FHxouBye/3L+fS0UTcK6ISNOoBPVUJara6xZdDr8YZrLKOm1avz
	OKsg==
X-Received: by 10.152.1.134 with SMTP id 6mr18026975lam.16.1374705850429; Wed,
	24 Jul 2013 15:44:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Wed, 24 Jul 2013 15:43:50 -0700 (PDT)
In-Reply-To: <1374702425.15230.29.camel@localhost>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
	<1374702425.15230.29.camel@localhost>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Jul 2013 15:43:50 -0700
X-Google-Sender-Auth: afQLmJLZTA9n1KMmUp3etGl5swg
Message-ID: <CABcZANn_kL0vk1dyRQ1dmLDAACkx5WAq_zWN06bgF=zqRag8bA@mail.gmail.com>
To: Colin Walters <walters@verbum.org>
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
X-List-Received-Date: Wed, 24 Jul 2013 22:44:10 -0000
Content-Type: multipart/alternative; boundary=e89a8f234e85e2b68d04e249a56c

--e89a8f234e85e2b68d04e249a56c
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 24, 2013 at 2:47 PM, Colin Walters <walters@verbum.org> wrote:

> On Wed, 2013-07-24 at 11:54 -0700, Chris Larson wrote:
>
> >   - Patched in --sysroot= support for systemd-tmpfiles, to facilitate
> > running it up front against the filesystem at do_rootfs time the way
> > read_only_rootfs_hook does with populate-volatiles
>
> How are you handling /run?  Is it still a tmpfs in your model?  If so
> are you excluding tmpfiles.d snippets which reference /run at rootfs
> time?
>

Still a tmpfs, yes. I haven't excluded them at this time, which means right
now it ends up with the tmpfs paths populated with content that won't be
seen at runtime, due to being under the tmpfs mount. I'm not certain
whether that's a problem or not, but it's absolutely something to think
about.

It strikes me that a less invasive way to achieve readonly rootfs is
> to symlink /var -> /run/var.  Or are you doing that already?
>
> Then you'd probably want to just run through any tmpfiles which
> reference /etc and /usr.
>

That's not a bad idea, and I haven't tried that yet myself. One concern
with this is, with the current setup, retaining existing regenerated bits
in the filesystem would be just a matter of tweaking the tmpfiles
configuration, whereas doing so if you link the entirety could be more
troublesome. One example of a file that lives in /var but isn't volatile is
the asound.state file shipped by alsa-state for some machines. Another is
the package management database, which while r/o if the rootfs is r/o, can
still have value.

>
> > - Implemented a prototype configuration for dbus which uses this to
> > support read-only-rootfs.
>
> Err...for what?  /var/run/dbus/system_bus_socket?  You should just
> have /var/run -> /run, and that's solved.
>

or-core already has /var/run -> /run, so indeed, that's not an issue.


> If it's for /var/lib/dbus/machine-id, likewise that should on modern
> systems just be a symlink to /etc/machine-id.
>
> Though you do need to figure out whether you want a statically
> configured machine ID, or to have one generated dynamically at boot.
> These both have tradeoffs; basically, whatever you're doing for the
> random seed you should probably also do for the machine ID.


It was indeed for the machine-id. I didn't really look closely at exactly
what was being dealt with, as I just wanted an example to show that the
approach with the additional -volatile package with the override config was
going to pan out. :)

Personally, I think that the best approach is for such things to generate
on boot every time, and treat shipping pre-generated content (possibly just
to improve boot time) as a separate task which a distro could take on. That
way everything works, and isn't exposed to any downsides of using
pregenerated content which is the same for all devices by default, unless
opted in. Another example of this would be the ssh host keys. I'm certainly
open to discussing the tradeoffs of the alternatives, though.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--e89a8f234e85e2b68d04e249a56c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 24, 2013 at 2:47 PM, Colin Walters <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:walters@verbum.org" target=3D"_blank">walters@verbum.org</a>&gt=
;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, 2013-07-24 at 11:5=
4 -0700, Chris Larson wrote:<br>
<br>
&gt; =C2=A0 - Patched in --sysroot=3D support for systemd-tmpfiles, to faci=
litate<br>
&gt; running it up front against the filesystem at do_rootfs time the way<b=
r>
&gt; read_only_rootfs_hook does with populate-volatiles<br>
<br>
</div>How are you handling /run? =C2=A0Is it still a tmpfs in your model? =
=C2=A0If so<br>
are you excluding tmpfiles.d snippets which reference /run at rootfs<br>
time?<br></blockquote><div><br></div><div style>Still a tmpfs, yes. I haven=
&#39;t excluded them at this time, which means right now it ends up with th=
e tmpfs paths populated with content that won&#39;t be seen at runtime, due=
 to being under the tmpfs mount. I&#39;m not certain whether that&#39;s a p=
roblem or not, but it&#39;s absolutely something to think about.</div>

<div style><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
It strikes me that a less invasive way to achieve readonly rootfs is<br>
to symlink /var -&gt; /run/var. =C2=A0Or are you doing that already?<br>
<br>
Then you&#39;d probably want to just run through any tmpfiles which<br>
reference /etc and /usr.<br></blockquote><div><br></div><div style>That&#39=
;s not a bad idea, and I haven&#39;t tried that yet myself. One concern wit=
h this is, with the current setup, retaining existing regenerated bits in t=
he filesystem would be just a matter of tweaking the tmpfiles configuration=
, whereas doing so if you link the entirety could be more troublesome. One =
example of a file that lives in /var but isn&#39;t volatile is the asound.s=
tate file shipped by alsa-state for some machines. Another is the package m=
anagement database, which while r/o if the rootfs is r/o, can still have va=
lue.</div>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im"><br>
&gt; - Implemented a prototype configuration for dbus which uses this to<br=
>
&gt; support read-only-rootfs.<br>
<br>
</div>Err...for what? =C2=A0/var/run/dbus/system_bus_socket? =C2=A0You shou=
ld just<br>
have /var/run -&gt; /run, and that&#39;s solved.<br></blockquote><div><br><=
/div><div style>or-core already has /var/run -&gt; /run, so indeed, that&#3=
9;s not an issue.</div><div style>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">


If it&#39;s for /var/lib/dbus/machine-id, likewise that should on modern<br=
>
systems just be a symlink to /etc/machine-id.<br>
<br>
Though you do need to figure out whether you want a statically<br>
configured machine ID, or to have one generated dynamically at boot.<br>
These both have tradeoffs; basically, whatever you&#39;re doing for the<br>
random seed you should probably also do for the machine ID.</blockquote></d=
iv><br>It was indeed for the machine-id. I didn&#39;t really look closely a=
t exactly what was being dealt with, as I just wanted an example to show th=
at the approach with the additional -volatile package with the override con=
fig was going to pan out. :)</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Personally,=
 I think that the best approach is for such things to generate on boot ever=
y time, and treat shipping pre-generated content (possibly just to improve =
boot time) as a separate task which a distro could take on. That way everyt=
hing works, and isn&#39;t exposed to any downsides of using pregenerated co=
ntent which is the same for all devices by default, unless opted in. Anothe=
r example of this would be the ssh host keys. I&#39;m certainly open to dis=
cussing the tradeoffs of the alternatives, though.</div>

<div class=3D"gmail_extra">-- <br>Christopher Larson<br>clarson at kergoth =
dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tsli=
b<br>Senior Software Engineer, Mentor Graphics
</div></div>

--e89a8f234e85e2b68d04e249a56c--
