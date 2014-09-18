Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6AC71223
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 20:51:23 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id b17so1952693lan.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 13:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=5sZKjpRBAWg+sdoI+lyVZXaAEl63j1kInmFaHb79obI=;
	b=PJECOBedfQf6l2LAObLXXOyDZh4WQgrpnpwL2hUsH4J+20NlCRRBBL5HxFVL2Im5KF
	lfX9tjE6rXGw7tVHG12pnwitdsyxwwQmWP5cGh/RXfcg9D0O1hI1m6mNY3bZXnyTbXxQ
	O0HKZCVgJjeZUK4IR5G320ttd/ZvV1wHfXUuGBisgk1gMJ+R9N+U87nlXn75j3X8yXsG
	eN60rSewDxBZVTDRMvaM4el4yBngN9X4PMaLw47Uq9UIfOw4zMayIjGPSpEAL/Q9XpSC
	/iDppsS8drfpHOf4Zj6K5Vnh15C6vjHIN3ZFYVXp/3TdGC8B0qwcAJEPgRB0rS2ozYKx
	F1Xg==
X-Received: by 10.152.20.1 with SMTP id j1mr2151012lae.57.1411073484287; Thu,
	18 Sep 2014 13:51:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.236 with HTTP; Thu, 18 Sep 2014 13:51:04 -0700 (PDT)
In-Reply-To: <541A890A.8070709@gmail.com>
References: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
	<1410916622-26204-7-git-send-email-kergoth@gmail.com>
	<541A890A.8070709@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 18 Sep 2014 13:51:04 -0700
X-Google-Sender-Auth: gCXSVg2Ra52pOpMb0Ak80AmrIoI
Message-ID: <CABcZANkTvHcwwrswK324f=tFYgqcptGXWQkC-6sopSD3HAXVmQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 6/8] blktrace: obey LDFLAGS for btrecord
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
X-List-Received-Date: Thu, 18 Sep 2014 20:51:29 -0000
Content-Type: multipart/alternative; boundary=089e013d1d4cc8717005035d256d

--089e013d1d4cc8717005035d256d
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 18, 2014 at 12:26 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On 9/16/14 6:17 PM, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  meta/recipes-kernel/blktrace/blktrace/ldflags.patch | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
> b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
> > index b9c7c20..037d161 100644
> > --- a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
> > +++ b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
> > @@ -59,8 +59,12 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> >   INCS        = -I. -I.. -I../btt
> >   OCFLAGS     = -UCOUNT_IOS -UDEBUG -DNDEBUG
> >   XCFLAGS     = -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
> > -@@ -35,7 +36,7 @@ btrecord: btrecord.o
> > -     $(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
> > +@@ -32,10 +33,10 @@ clean: docsclean
> > +     $(CC) $(CFLAGS) -c -o $*.o $<
> > +
> > + btrecord: btrecord.o
> > +-    $(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
> > ++    $(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
> >
>
> aren't you passing LDFLAGS to compile step as well here ?


I don't think so. This rule creates btrecord from btrecord.o, it doesn't
compile btrecord.c to btrecord.o, that's an entirely different rule.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013d1d4cc8717005035d256d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Sep 18, 2014 at 12:26 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"">On 9/16/=
14 6:17 PM, Christopher Larson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/blktrace/blktrace/ldflags.patch | 8 ++++++--=
<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch b/met=
a/recipes-kernel/blktrace/blktrace/ldflags.patch<br>
&gt; index b9c7c20..037d161 100644<br>
&gt; --- a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch<br>
&gt; +++ b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch<br>
&gt; @@ -59,8 +59,12 @@ Signed-off-by: Fahad Usman &lt;<a href=3D"mailto:fa=
had_usman@mentor.com">fahad_usman@mentor.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0INCS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D -I. -I.. -I../btt<br>
&gt;=C2=A0 =C2=A0OCFLAGS=C2=A0 =C2=A0 =C2=A0=3D -UCOUNT_IOS -UDEBUG -DNDEBU=
G<br>
&gt;=C2=A0 =C2=A0XCFLAGS=C2=A0 =C2=A0 =C2=A0=3D -D_GNU_SOURCE -D_LARGEFILE_=
SOURCE -D_FILE_OFFSET_BITS=3D64<br>
&gt; -@@ -35,7 +36,7 @@ btrecord: btrecord.o<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(CC) $(CFLAGS) -o $@ $(filter %.o,$^)<br>
&gt; +@@ -32,10 +33,10 @@ clean: docsclean<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(CC) $(CFLAGS) -c -o $*.o $&lt;<br>
&gt; +<br>
&gt; + btrecord: btrecord.o<br>
&gt; +-=C2=A0 =C2=A0 $(CC) $(CFLAGS) -o $@ $(filter %.o,$^)<br>
&gt; ++=C2=A0 =C2=A0 $(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)<br>
&gt;<br>
<br>
</div></div>aren&#39;t you passing LDFLAGS to compile step as well here ?</=
blockquote></div><br></div><div class=3D"gmail_extra">I don&#39;t think so.=
 This rule creates btrecord from btrecord.o, it doesn&#39;t compile btrecor=
d.c to btrecord.o, that&#39;s an entirely different rule.<br>-- <br>Christo=
pher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedde=
d, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Gra=
phics
</div></div>

--089e013d1d4cc8717005035d256d--
