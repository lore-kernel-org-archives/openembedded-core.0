Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 586C270656
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 16:44:16 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id z11so6272927lbi.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=8uYedTD+/iWO8w1jx7qtw6n/OJzroYT1bmu7nvezmMM=;
	b=teBEnnoHxhfrL6s73miE/u4E8ZEqZFyAu6lkuxSBs7FGw1YOP0fEBGDxZCgRL7AqA8
	KGnlVC/iCXd008+Thtk9uwvc3UeKgVXo3tv+Tw2M16AVnzRJ5yXaM4GZQxSgz1ucSppz
	Gp1fj71kIOkTEYJOUweERJhnlVcgBDDnJRlrZ/f7QCQf4VRTSElpjp86Z04860SH8Tyq
	ekUo4QRTtQgySLNsKviBgAyhoV9e8hEvy3YM5n3NbC0eGDunu8zwT0LeyOSAH3fLlutl
	xcHMBY0GHunpOPeaWC7aU8sQQKkTYDCcyUX6478ccB9bAQzegI6o4Kta0pMqO/Tv73AJ
	EdYQ==
X-Received: by 10.112.144.104 with SMTP id sl8mr33869097lbb.52.1406047457323; 
	Tue, 22 Jul 2014 09:44:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.63.72 with HTTP; Tue, 22 Jul 2014 09:43:57 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407221229210.8547@localhost>
References: <alpine.LFD.2.11.1407221229210.8547@localhost>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 22 Jul 2014 09:43:57 -0700
X-Google-Sender-Auth: OH4lmIHCAqfezLz_5lanPwdVzsg
Message-ID: <CABcZAN=XYZTXYRuR1AdaD_NdeYwzDv8DyvrQaSnyqbtLC_OC7A@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: why conditional assignment of DEPLOY_DIR_IMAGE in bitbake.conf?
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
X-List-Received-Date: Tue, 22 Jul 2014 16:44:18 -0000
Content-Type: multipart/alternative; boundary=047d7b3441ec3b324804fecaef80

--047d7b3441ec3b324804fecaef80
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 22, 2014 at 9:36 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   quite possibly another silly question, but i'm perusing poky's
> version of bitbake.conf and i see this:
>
> DEPLOY_DIR ?= "${TMPDIR}/deploy"
> DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
> DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
> DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
> DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
> DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
> DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
>
>   now, what is the value of using "?=" to set DEPLOY_DIR_IMAGE, rather
> than just "=". i know what "?=" represents, but i normally expect to
> see it in a context where someone might have set it earlier to some
> other value, but this is in bitbake.conf, before any of the "include"
> or "require" directives to pull in any of the other .conf files. so in
> the midst of all those other DEPLOY_DIR_* hard assignments, why is the
> images directory a conditional install?
>

s/install/define/

If there's a ?= done before any includes in bitbake.conf, either its
position in the file has changed, or it's set that way to allow the user to
add those variables to the env whitelist and set them in the environment,
as the env is set before bitbake.conf is parsed.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b3441ec3b324804fecaef80
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jul 22, 2014 at 9:36 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":9j" class=3D"a3s" style=3D"overf=
low:hidden">=C2=A0 quite possibly another silly question, but i&#39;m perus=
ing poky&#39;s<br>


version of bitbake.conf and i see this:<br>
<br>
DEPLOY_DIR ?=3D &quot;${TMPDIR}/deploy&quot;<br>
DEPLOY_DIR_TAR =3D &quot;${DEPLOY_DIR}/tar&quot;<br>
DEPLOY_DIR_IPK =3D &quot;${DEPLOY_DIR}/ipk&quot;<br>
DEPLOY_DIR_RPM =3D &quot;${DEPLOY_DIR}/rpm&quot;<br>
DEPLOY_DIR_DEB =3D &quot;${DEPLOY_DIR}/deb&quot;<br>
DEPLOY_DIR_IMAGE ?=3D &quot;${DEPLOY_DIR}/images/${MACHINE}&quot;<br>
DEPLOY_DIR_TOOLS =3D &quot;${DEPLOY_DIR}/tools&quot;<br>
<br>
=C2=A0 now, what is the value of using &quot;?=3D&quot; to set DEPLOY_DIR_I=
MAGE, rather<br>
than just &quot;=3D&quot;. i know what &quot;?=3D&quot; represents, but i n=
ormally expect to<br>
see it in a context where someone might have set it earlier to some<br>
other value, but this is in bitbake.conf, before any of the &quot;include&q=
uot;<br>
or &quot;require&quot; directives to pull in any of the other .conf files. =
so in<br>
the midst of all those other DEPLOY_DIR_* hard assignments, why is the<br>
images directory a conditional install?</div></blockquote><div><br></div><d=
iv>s/install/define/ <br></div></div><br></div><div class=3D"gmail_extra">I=
f there&#39;s a ?=3D done before any includes in bitbake.conf, either its p=
osition in the file has changed, or it&#39;s set that way to allow the user=
 to add those variables to the env whitelist and set them in the environmen=
t, as the env is set before bitbake.conf is parsed.<br>

</div><div class=3D"gmail_extra">-- <br>Christopher Larson<br>clarson at ke=
rgoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer =
- Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--047d7b3441ec3b324804fecaef80--
