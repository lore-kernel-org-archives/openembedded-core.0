Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TZ2W3-0008UG-7i
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 17:42:11 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so1321677lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 08:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=L/Q2559pEf0MFj2hW7xCITUMfzhN2SrBkn14QbA/Rqw=;
	b=U4AGBMfVbEHSeJjDZjUQSyPHevd4aKXdEhayY0S7sefktN7pbyTB4B2Jptj1HavDs3
	583HixKfqy3TzBrW9CvjKZ6O4wxxyg+fxLM7RPT5d0PRV0/hpSHgRwTm6ykgBzVSlBUb
	Nyc6i0OhBnEuAA64eID8XZsYOxxuqm2ndDvoHe66EznmZA1WuP04GwsG4ZZtyXm+VIYC
	y7N3Z1ehqw8fYZe4ZSwU8hJBH67VxUghK74XIn0Oyqz/YbDnj+969z6Q0NSHsF8heO3n
	zNd0sDGMjRtayIJl6PG3cm2kpuUV7QtxOUzxckQAECgqkGtrXv2z8tU6aYOE5xotL+Ve
	n10w==
Received: by 10.112.31.194 with SMTP id c2mr790207lbi.44.1352996894038; Thu,
	15 Nov 2012 08:28:14 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.18.239 with HTTP; Thu, 15 Nov 2012 08:27:52 -0800 (PST)
In-Reply-To: <20121115161907.GC17521@jama.jama.net>
References: <1351077301-7744-1-git-send-email-Martin.Jansa@gmail.com>
	<1352964649-31187-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZAN=W_E+Qtox5XF7nBcMY9tN4vCCA51vcy=Hx1GDVGMwVbQ@mail.gmail.com>
	<20121115161907.GC17521@jama.jama.net>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 15 Nov 2012 09:27:52 -0700
X-Google-Sender-Auth: kD1_jIZeoBKXm4BKst-7U1oH46M
Message-ID: <CABcZANn1VVzpKrRiRCoBgvodnrDKKmrA5wBa2T2rjbzhey39tw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Thu, 15 Nov 2012 16:42:12 -0000
Content-Type: multipart/alternative; boundary=f46d04016951405a9104ce8b23af

--f46d04016951405a9104ce8b23af
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 15, 2012 at 9:19 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Thu, Nov 15, 2012 at 08:25:20AM -0700, Chris Larson wrote:
> > On Thu, Nov 15, 2012 at 12:30 AM, Martin Jansa <martin.jansa@gmail.com
> >wrote:
> >
> > > * it's not very universal, but works with default oe-core setup and
> > >   shows basic HOW-TO. It can be improved later.
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  V2: added .pyo to WHITELIST
> > >      shorter filenames
> > >      TMPDIR
> > >      added duplicates but not shown
> > >
> > >  V3: use also populate-sysroot.MACHINE, manifest name for
> populate-sysroot
> > >      was changed in febeaf3d1b8917b660c7279b008d8b03337568e9
> > >
> > >  V4: dropped eglibc-initial work around, it was fixed in oe-core
> > >
> > >  scripts/sstate-sysroot-cruft.sh | 34
> ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >  create mode 100755 scripts/sstate-sysroot-cruft.sh
> > >
> > > diff --git a/scripts/sstate-sysroot-cruft.sh
> > > b/scripts/sstate-sysroot-cruft.sh
> > > new file mode 100755
> > > index 0000000..ca23dcf
> > > --- /dev/null
> > > +++ b/scripts/sstate-sysroot-cruft.sh
> > > @@ -0,0 +1,34 @@
> > > +#!/bin/sh
> > > +
> > > +# Used to find files installed in sysroot which are not tracked by
> sstate
> > > manifest
> > > +# Update BASE
> > > +
> > > +BASE="/OE/oe-core"
> > >
> >
> > This seems interesting, but I have a few comments/concerns.
> >
> > 1) don't hardcode BASE, figure out the path relative to the script's
> > location, e.g. BASE="$(cd $(dirname $(dirname $0)) && pwd)"
> > 2) output files shouldn't go into oe-core directly, as oe-core isn't
> > guaranteed to be writable, and it's more common to expect output from a
> > script like this to go relative to the current directory, or a temp
> > directory
> > 3) extract TMPDIR from bitbake -e, rather than hardcoding that, as that
> > breaks for any distros or users which separate their tmpdirs by distro,
> or
> > set TCLIBCAPPEND = ""
>
> Ah in this case BASE is not directory with oe-core layer but one above.
>

Still trivial to determine relative to the script's location. Adding an
extra call to dirname, or an extra '/..' isn't particularly tough.

I didn't want to use bitbake -e, so that this script can be executed
> when some other bitbake process is running.
>

I don't see having to hardcode assumptions about the environment as a net
win, personally. At least make them arguments, or add an argument to
optionally use bitbake -e, or let it take vars from the environment.

As said it's not really universal (I wrote it just to confirm something
> and then shared it to find if someone else finds it also usefull to
> improve it).
>

If it can't be used in a wide variety of circumstances, I'd argue against
its inclusion in oe-core until such time that it's ready. The subject of
this thread didn't include "RFC' ;)
-- 
Christopher Larson

--f46d04016951405a9104ce8b23af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, Nov 1=
5, 2012 at 9:19 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</spa=
n> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"h5">=
On Thu, Nov 15, 2012 at 08:25:20AM -0700, Chris Larson wrote:<br>
&gt; On Thu, Nov 15, 2012 at 12:30 AM, Martin Jansa &lt;<a href=3D"mailto:m=
artin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;wrote:<br>
&gt;<br>
&gt; &gt; * it&#39;s not very universal, but works with default oe-core set=
up and<br>
&gt; &gt; =C2=A0 shows basic HOW-TO. It can be improved later.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gm=
ail.com">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0V2: added .pyo to WHITELIST<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0shorter filenames<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0TMPDIR<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0added duplicates but not shown<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0V3: use also populate-sysroot.MACHINE, manifest name for po=
pulate-sysroot<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0was changed in febeaf3d1b8917b660c7279b008d8b=
03337568e9<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0V4: dropped eglibc-initial work around, it was fixed in oe-=
core<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0scripts/sstate-sysroot-cruft.sh | 34 ++++++++++++++++++++++=
++++++++++++<br>
&gt; &gt; =C2=A01 file changed, 34 insertions(+)<br>
&gt; &gt; =C2=A0create mode 100755 scripts/sstate-sysroot-cruft.sh<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/scripts/sstate-sysroot-cruft.sh<br>
&gt; &gt; b/scripts/sstate-sysroot-cruft.sh<br>
&gt; &gt; new file mode 100755<br>
&gt; &gt; index 0000000..ca23dcf<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/scripts/sstate-sysroot-cruft.sh<br>
&gt; &gt; @@ -0,0 +1,34 @@<br>
&gt; &gt; +#!/bin/sh<br>
&gt; &gt; +<br>
&gt; &gt; +# Used to find files installed in sysroot which are not tracked =
by sstate<br>
&gt; &gt; manifest<br>
&gt; &gt; +# Update BASE<br>
&gt; &gt; +<br>
&gt; &gt; +BASE=3D&quot;/OE/oe-core&quot;<br>
&gt; &gt;<br>
&gt;<br>
&gt; This seems interesting, but I have a few comments/concerns.<br>
&gt;<br>
&gt; 1) don&#39;t hardcode BASE, figure out the path relative to the script=
&#39;s<br>
&gt; location, e.g. BASE=3D&quot;$(cd $(dirname $(dirname $0)) &amp;&amp; p=
wd)&quot;<br>
&gt; 2) output files shouldn&#39;t go into oe-core directly, as oe-core isn=
&#39;t<br>
&gt; guaranteed to be writable, and it&#39;s more common to expect output f=
rom a<br>
&gt; script like this to go relative to the current directory, or a temp<br=
>
&gt; directory<br>
&gt; 3) extract TMPDIR from bitbake -e, rather than hardcoding that, as tha=
t<br>
&gt; breaks for any distros or users which separate their tmpdirs by distro=
, or<br>
&gt; set TCLIBCAPPEND =3D &quot;&quot;<br>
<br>
</div></div>Ah in this case BASE is not directory with oe-core layer but on=
e above.<br></blockquote><div><br></div><div>Still trivial to determine rel=
ative to the script&#39;s location. Adding an extra call to dirname, or an =
extra &#39;/..&#39; isn&#39;t particularly tough.</div>

<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
I didn&#39;t want to use bitbake -e, so that this script can be executed<br=
>
when some other bitbake process is running.<br></blockquote><div><br></div>=
<div>I don&#39;t see having to hardcode assumptions about the environment a=
s a net win, personally. At least make them arguments, or add an argument t=
o optionally use bitbake -e, or let it take vars from the environment.</div=
>

<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
As said it&#39;s not really universal (I wrote it just to confirm something=
<br>
and then shared it to find if someone else finds it also usefull to<br>
improve it).<br></blockquote><div><br></div><div>If it can&#39;t be used in=
 a wide variety of circumstances, I&#39;d argue against its inclusion in oe=
-core until such time that it&#39;s ready. The subject of this thread didn&=
#39;t include &quot;RFC&#39; ;)</div>

</div>-- <br>Christopher Larson<br>
</div>

--f46d04016951405a9104ce8b23af--
