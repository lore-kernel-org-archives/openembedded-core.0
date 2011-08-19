Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QuXMH-0002qI-W6
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 00:16:10 +0200
Received: by vxj14 with SMTP id 14so3186907vxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Uuj6Tg3j3ZOuaRAxsVbKPSKf2aUv2PEbrZXPXePLAks=;
	b=DB3/AcGm/ui+MFEjpDKUQkq2UJH5LfGuuQ+sI77BRvgXZ+rf5Z870ApbhkOpJ9PzbM
	movJoY5Yezo3rskvmiP1mRYaZDj7vqcFlbAHPgSgR4XOZ3F3WzernwE7Yi6V2Umr6Ylv
	/6EL7E6omMVXq8CvP8Kj9F+tRN9AO5YuIFuJI=
Received: by 10.52.176.97 with SMTP id ch1mr262872vdc.297.1313791888328; Fri,
	19 Aug 2011 15:11:28 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.108.229 with HTTP; Fri, 19 Aug 2011 15:11:08 -0700 (PDT)
In-Reply-To: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
References: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 19 Aug 2011 15:11:08 -0700
X-Google-Sender-Auth: QwFd_uuwvgSFXfT7xRFZuPi57bg
Message-ID: <CABcZAN=mt6HCmtMnX+P4-BAOkQwZZ3uCS_sT+uutziBu0VYv9w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
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
X-List-Received-Date: Fri, 19 Aug 2011 22:16:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2011 at 5:16 AM,  <martin.jansa@gmail.com> wrote:
> From: Martin Jansa <Martin.Jansa@gmail.com>
>
> * if there is multiple .bbappend files with FILESEXTRAPATHS_prepend :=3D =
"/:"
> =C2=A0then the one parsed last is causing trailing ':' and that's causing=
 empty element in
> =C2=A0path =3D extrapaths.split(:) + path
> * it's hard to keep all .bbappends from foreign layers to follow this rul=
e, so it's better
> =C2=A0to be able to handle trailing ':'
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =C2=A0meta/classes/utils.bbclass | =C2=A0 =C2=A05 +++--
> =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index 56abdd8..3c2e342 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -338,8 +338,9 @@ def base_set_filespath(path, d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# The ":" ensures we have an 'empty' override
> =C2=A0 =C2=A0 =C2=A0 =C2=A0overrides =3D (bb.data.getVar("OVERRIDES", d, =
1) or "") + ":"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for p in path:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for o in overrides.spl=
it(":"):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 filespath.append(os.path.join(p, o))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p !=3D "":
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for o in overrides.split(":"):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filespath.append(os.path.join(p, o))

You shouldn't use 'p !=3D "":'. Instead, use the fact that the empty
string is false in boolean context.  'if p:'.

Of course, you could also use filter. path =3D filter(None, path) --
filtering an iterable with a function of None results in it dropping
all false values. But then, there's a tendency nowadays to avoid
map/filter/etc, so that's probably not best :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


