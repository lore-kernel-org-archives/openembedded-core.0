Received: from mail-lb0-f176.google.com ([209.85.217.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1U10Ou-0005pm-Du
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 21:06:26 +0100
Received: by mail-lb0-f176.google.com with SMTP id s4so3798696lbc.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 11:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=jaSaaVCGb+vdWv7R9jiac372a7aEH0icpyxrFZhU+Ss=;
	b=f2iQmCyXUJgjq5RJmnnhUQ/g7pdMA0QT5r8Yn0KwgAvfMG+ePvYAlXzxw57F56N+XF
	Jf2LAciTYk9pIf2CuC4d8tvP2qJm/xQ6HkiKy8hjF+5us1p/YwUNpUq/xmzM7I5hB03J
	rWSRNTbWQiO4kTSPIDQJJ5Dw1vc8yyoAzbhGnmT5YXbR6MeQjJkz8nSunqpx2TplRXbW
	rQNQ3ad0HwqzD/m280bNtWn6HDhnU++ivIV3eD9ZrYah+4ympLsEvpbFrg3IzlsT62lI
	N6rnqz0sw1eRXq7kuhS/EDrHSgLdgO9NqTQFP/Cm94PP9yad8BREAJFWt9yB2/Gp1XXR
	W+xQ==
X-Received: by 10.112.40.71 with SMTP id v7mr3836587lbk.32.1359661841181; Thu,
	31 Jan 2013 11:50:41 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Thu, 31 Jan 2013 11:50:21 -0800 (PST)
In-Reply-To: <1359659480-8210-1-git-send-email-sgw@linux.intel.com>
References: <1359659480-8210-1-git-send-email-sgw@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 31 Jan 2013 12:50:21 -0700
X-Google-Sender-Auth: 7TSZECL3-RqxfD25S7k7DsuIZOs
Message-ID: <CABcZAN=FjHhd6Xp8758qzq2pPS=tQn8yd+EXUha=G3YsjnYD9g@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache: Fix rdepends construction
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2013 20:06:33 -0000
X-List-Received-Date: Thu, 31 Jan 2013 20:06:33 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe31880eeb7d04d49af1c6

--e0cb4efe31880eeb7d04d49af1c6
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 31, 2013 at 12:11 PM, Saul Wold <sgw@linux.intel.com> wrote:

> -        rdepends = d.getVar('RDEPENDS_%s' % pkg, True)
> -        rdepends = rdepends + ' ' + d.getVar('MLPREFIX') +
> "hicolor-icon-theme"
> -        d.setVar('RDEPENDS_%s' % pkg, rdepends)
> +        rdepends = ' ' + d.getVar('MLPREFIX') + "hicolor-icon-theme"
> +        d.appendVar('RDEPENDS_%s' % pkg, rdepends)
>

The new version isn't using a getVar of the old rdepends at all, so it's
just replacing it every time. Is that really what you intended here?
Wouldn't a getVar() or '' be a better approach? Further, the '' +
d.getVar('MLPREFIX') is pointless if you aren't including the original
value, as it adds a separator to the beginning when there's nothing to
separate.
-- 
Christopher Larson

--e0cb4efe31880eeb7d04d49af1c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jan 31, 2013 at 12:11 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=
=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&g=
t;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":i0">- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0rdepends =3D d.getVar(&#39;RDEPENDS_%s&#39; % pkg, True)<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0rdepends =3D rdepends + &#39; &#39; + d.getVar=
(&#39;MLPREFIX&#39;) + &quot;hicolor-icon-theme&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;RDEPENDS_%s&#39; % pkg, rdepends=
)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0rdepends =3D &#39; &#39; + d.getVar(&#39;MLPRE=
FIX&#39;) + &quot;hicolor-icon-theme&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;RDEPENDS_%s&#39; % pkg, rdepe=
nds)</div></blockquote></div><br>The new version isn&#39;t using a getVar o=
f the old rdepends at all, so it&#39;s just replacing it every time. Is tha=
t really what you intended here? Wouldn&#39;t a getVar() or &#39;&#39; be a=
 better approach? Further, the &#39;&#39; + d.getVar(&#39;MLPREFIX&#39;) is=
 pointless if you aren&#39;t including the original value, as it adds a sep=
arator to the beginning when there&#39;s nothing to separate.<br>

-- <br>Christopher Larson</div></div>

--e0cb4efe31880eeb7d04d49af1c6--
