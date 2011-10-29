Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RJxKL-00028G-8U
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Oct 2011 03:03:16 +0200
Received: by wyg19 with SMTP id 19so4793652wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 17:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=2v249MxlaFQoTGYRlcm+EhThCKWZO8yBSHh3xxFElao=;
	b=NMq0ckvCrDocGxjY9a2WcGqgg1hbV7ZLsVVaj/jBAoW1MTXzYN69AAiYLqeM2Kc0e1
	aM47lbZllbQz0SW47gU49k0hW6xymfecDXzDhTqBhSFz6Y3i2ZUcORgbDEpmL1g5BZRr
	mYH1etW8fl9JWuI7LAW4x2NX54VOREQwBTVFw=
Received: by 10.216.140.223 with SMTP id e73mr1894830wej.9.1319849822255; Fri,
	28 Oct 2011 17:57:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.28.138 with HTTP; Fri, 28 Oct 2011 17:56:41 -0700 (PDT)
In-Reply-To: <988279ad6b90b50cf85426709540ce19b00745e6.1319844419.git.josh@linux.intel.com>
References: <cover.1319844419.git.josh@linux.intel.com>
	<988279ad6b90b50cf85426709540ce19b00745e6.1319844419.git.josh@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 28 Oct 2011 17:56:41 -0700
X-Google-Sender-Auth: XaQQOkYelmodXWSIEn8xfUdRN-g
Message-ID: <CABcZANkS9zDK-qLtMxHdn7SE29vTz+HPMwCUtf=yP-uuGV=Dtg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] lib/oe/terminal: add support for XFCE's terminal emulator
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Oct 2011 01:03:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2011 at 4:42 PM, Joshua Lock <josh@linux.intel.com> wrote:
> That's Terminal on Fedora and xfce4-terminal on Ubuntu/Debian... This
> could get interesting!
>
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
> =C2=A0meta/lib/oe/terminal.py | =C2=A0 21 +++++++++++++++++++++
> =C2=A01 files changed, 21 insertions(+), 0 deletions(-)
>
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 1455e8e..b90a1f2 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -57,6 +57,27 @@ class Gnome(XTerminal):
> =C2=A0 =C2=A0 command =3D 'gnome-terminal --disable-factory -t "{title}" =
-x {command}'
> =C2=A0 =C2=A0 priority =3D 2
>
> +class Xfce(XTerminal):
> + =C2=A0 =C2=A0def distro_name():
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0import subprocess as sub
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0try:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D sub.Popen(['lsb_release'=
, '-i'], stdout=3Dsub.PIPE,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0stderr=3Dsub.PIPE)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out, err =3D p.communicate()
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0distro =3D out.split(':').stri=
p()
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0except:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0distro =3D "unknown"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return distro
> +
> + =C2=A0 =C2=A0# Upstream binary name is Terminal but Debian/Ubuntu use
> + =C2=A0 =C2=A0# xfce4-terminal to avoid possible(?) conflicts
> + =C2=A0 =C2=A0distro =3D distro_name()
> + =C2=A0 =C2=A0if distro =3D=3D 'Ubuntu' or distro =3D=3D 'Debian':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0command =3D 'xfce4-terminal -T "{title}" -e =
"{command}"'
> + =C2=A0 =C2=A0else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0command =3D 'Terminal -T "{title}" -e "{comm=
and}"'
> + =C2=A0 =C2=A0priority =3D 2

The first problem I see with this is you're calling lsb_release at
module import time. Doing things like that is generally a no-no. I'd
suggest shifting it into the constructor. Set up the command there as
self.command, and be sure to call the superclass constructor as well,
after the command bits. The other thing is, and I'm sure you just
copied & pasted it from konsole, but we already import a fully
functional Popen -- it's the superclass of all the terminal classes.
So there's no need to pull in subprocess's version of it. And the
defaults of the Popen we use ensure the output is captured, so there's
no need for the sub.PIPE bits at all if you use that one. Simply do p
=3D Popen(['lsb_release', '-i']).

Thanks for adding this, I'm sure folks using stock Xubuntu and the
like will find this helpful (I'm an rxvt-unicode guy myself).
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


