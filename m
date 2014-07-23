Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id B621A6AC69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 16:17:07 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id w7so1118147lbi.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=wCbpiw+2tEHFbAp2XE0OT8d4Eso+nW1Umxd2FCk0R3Y=;
	b=Gm50WdNmgVgHt5W1Y9+XhQR+Ett5Wk7vS/xfFY1tKaUpzQ3CLVy0JUjpwtO5EWY3ND
	tmq2I6KfCkgVQ4jlj4G8QQqmoNSLO/K+lWS+LvT1d5WOyafilxPw/6VOB9OSBrQeLL57
	EdjlAtj4qvTl2b8eWkxQ6/AXinMRmG3ZSUHTONDdbSBeP0rz2iBLVMtmRRK6Y+vA8PGa
	DlmbmyUow176lHzrh9DOXgmowX+ugHS7smxFGnbstfXP5BzjUnMEicRdZKKsHdEmJyc8
	+tMh9p1heksQ5H4w6S4MsQUWrl7NApStLcuP9JMjLc1PhnxGOPXZcDjQAGoVF33vvfbB
	k3AA==
X-Received: by 10.112.255.36 with SMTP id an4mr2535571lbd.31.1406132227805;
	Wed, 23 Jul 2014 09:17:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.63.72 with HTTP; Wed, 23 Jul 2014 09:16:47 -0700 (PDT)
In-Reply-To: <1406130118.22985.124.camel@ted>
References: <1406126945-10647-1-git-send-email-ben.shelton@ni.com>
	<1406130118.22985.124.camel@ted>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 23 Jul 2014 09:16:47 -0700
X-Google-Sender-Auth: 7_8dtBTLroxnOW-KpxzHqPVzGyM
Message-ID: <CABcZANmPPfQgZyOZy4nB5UhLLpwsfB4bVrMoJN6Wr=-4F3im3g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: fix bashism in bootmisc.sh
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
X-List-Received-Date: Wed, 23 Jul 2014 16:17:18 -0000
Content-Type: multipart/alternative; boundary=001a1134d438f21ac204fedeab32

--001a1134d438f21ac204fedeab32
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 23, 2014 at 8:41 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2014-07-23 at 09:49 -0500, Ben Shelton wrote:
> > In the commit 'initscripts: save /etc/timestamp with seconds accuracy',
> > a bashism was introduced in the bootmisc.sh script in the code to set
> > the current date from the stored value in /etc/timestamp.  This causes
> > that operation to fail with the following message when /bin/sh is not
> > bash:
> >
> > /etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 73: syntax error: bad
> substitution
> >
> > Fixed by using 'cut' (standard under POSIX) rather than bash-specific
> > substring expansion.
> >
> > [YOCTO #6566]
> >
> > Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> > Tested-by: Maxin B. John <maxin.john@enea.com>
> > ---
> >  meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> > index ccc7f9f..923fa88 100755
> > --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> > +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> > @@ -70,7 +70,10 @@ then
> >       read TIMESTAMP < /etc/timestamp
> >       if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
> >               # format the timestamp as date expects it (2m2d2H2M4Y.2S)
> > -             date -u ${TIMESTAMP:4:8}${TIMESTAMP:0:4}.${TIMESTAMP:(-2)}
> > +             TS_YR=$(echo $TIMESTAMP | cut -c 1-4)
> > +             TS_SEC=$(echo $TIMESTAMP | cut -c 13-14)
> > +             TS_REST=$(echo $TIMESTAMP | cut -c 5-12)
> > +             date -u ${TS_REST}${TS_YR}.${TS_SEC}
> >               test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh
> stop
> >       fi
> >  fi
>
> We have tried hard to remove exec/fork/subshell calls from the init
> processes since each one does cost quite some time. The above introduces
> more than I'm comfortable with. Can we find some other way to do this
> please?


Hmm, worst case it looks like a single sed script would do, assuming
there's no way to get date -u to be more flexible.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1134d438f21ac204fedeab32
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 23, 2014 at 8:41 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"h5">=
On Wed, 2014-07-23 at 09:49 -0500, Ben Shelton wrote:<br>
&gt; In the commit &#39;initscripts: save /etc/timestamp with seconds accur=
acy&#39;,<br>
&gt; a bashism was introduced in the bootmisc.sh script in the code to set<=
br>
&gt; the current date from the stored value in /etc/timestamp. =C2=A0This c=
auses<br>
&gt; that operation to fail with the following message when /bin/sh is not<=
br>
&gt; bash:<br>
&gt;<br>
&gt; /etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 73: syntax error: bad =
substitution<br>
&gt;<br>
&gt; Fixed by using &#39;cut&#39; (standard under POSIX) rather than bash-s=
pecific<br>
&gt; substring expansion.<br>
&gt;<br>
&gt; [YOCTO #6566]<br>
&gt;<br>
&gt; Signed-off-by: Ben Shelton &lt;<a href=3D"mailto:ben.shelton@ni.com">b=
en.shelton@ni.com</a>&gt;<br>
&gt; Tested-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@enea.com">ma=
xin.john@enea.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh | 5 ++=
++-<br>
&gt; =C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh=
 b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh<br>
&gt; index ccc7f9f..923fa88 100755<br>
&gt; --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh<br>
&gt; +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh<br>
&gt; @@ -70,7 +70,10 @@ then<br>
&gt; =C2=A0 =C2=A0 =C2=A0 read TIMESTAMP &lt; /etc/timestamp<br>
&gt; =C2=A0 =C2=A0 =C2=A0 if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # format the timestam=
p as date expects it (2m2d2H2M4Y.2S)<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 date -u ${TIMESTAMP:4:8}${=
TIMESTAMP:0:4}.${TIMESTAMP:(-2)}<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TS_YR=3D$(echo $TIMESTAMP =
| cut -c 1-4)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TS_SEC=3D$(echo $TIMESTAMP=
 | cut -c 13-14)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TS_REST=3D$(echo $TIMESTAM=
P | cut -c 5-12)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 date -u ${TS_REST}${TS_YR}=
.${TS_SEC}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -x /etc/init.d/h=
wclock.sh &amp;&amp; /etc/init.d/hwclock.sh stop<br>
&gt; =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; =C2=A0fi<br>
<br>
</div></div>We have tried hard to remove exec/fork/subshell calls from the =
init<br>
processes since each one does cost quite some time. The above introduces<br=
>
more than I&#39;m comfortable with. Can we find some other way to do this<b=
r>
please?</blockquote></div><br></div><div class=3D"gmail_extra">Hmm, worst c=
ase it looks like a single sed script would do, assuming there&#39;s no way=
 to get date -u to be more flexible.<br>-- <br>Christopher Larson<br>clarso=
n at kergoth dot com<br>

Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics
</div></div>

--001a1134d438f21ac204fedeab32--
