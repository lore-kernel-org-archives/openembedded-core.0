Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 265D16041E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 18:26:38 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id w10so1173267lbi.21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 11:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=8MzI7Pbs/ycCEh56HBW0zPTqvkjOFgW7g4KB/fkm9wY=;
	b=Bkboihi4Fm28V4mBTtPZIVOcH1n3aTZWGsJfg1z7lNyBC1Di4PzO6d0eEQY/1Jukyi
	aY9yZNNGFN1UJTAXW/lZf+3lnoHM0s97ir1zWAHkyXzFfJabTIM6dknXM87iLWBaesM8
	ullsEuM3uNUQRVL/oWkZQBWzotoB6ZZc84nBdanOxeeIvhgPRY7Dtya1ol3JoTi/hvRs
	UQrRKqMLnk/+gEPFscU3Bq04CHZUD1akaZFOkfXwUblhG8X6H6CLJGN3AHl/VW+qzAzC
	QmtaI+xV+zRXUT8btDb3iiRH1eoY0OO2zkiab1QuEDFBiAA0xqv0hibLnpoSe2XjNr83
	15+A==
X-Received: by 10.152.20.227 with SMTP id q3mr4594304lae.16.1375554398883;
	Sat, 03 Aug 2013 11:26:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Sat, 3 Aug 2013 11:26:18 -0700 (PDT)
In-Reply-To: <CAP9ODKqjwDuMNM1aj6TgX6-S10fZC1qBU9O58RdCioTiV0XL-A@mail.gmail.com>
References: <1375395237-17840-1-git-send-email-otavio@ossystems.com.br>
	<CABcZANnvpMCNKyncpct+FTiHrcGid4_hpKQvH=DQ=YwD4LFYJA@mail.gmail.com>
	<CAP9ODKqjwDuMNM1aj6TgX6-S10fZC1qBU9O58RdCioTiV0XL-A@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 3 Aug 2013 11:26:18 -0700
X-Google-Sender-Auth: AG9DTBawh1mhfCu787n3esaRmlc
Message-ID: <CABcZANmU0=Pz7HzaifB1GOJuA2GC4ZQnEyiGy60=Veas9T3-RA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Lauren Post <lauren.post@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] distro_features_check.bbclass: Allow checking of required/conflicting features
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
X-List-Received-Date: Sat, 03 Aug 2013 18:26:39 -0000
Content-Type: multipart/alternative; boundary=089e0141a9ac5097e504e30f3761

--089e0141a9ac5097e504e30f3761
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 3, 2013 at 9:55 AM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Fri, Aug 2, 2013 at 6:16 PM, Chris Larson <clarson@kergoth.com> wrote:
> > On Thu, Aug 1, 2013 at 3:13 PM, Otavio Salvador <otavio@ossystems.com.br
> >
> > wrote:
> >>
> >> This add support to list required/confliting distro features for a
> >> recipe; this avoids user mistake when building recipes/images which
> >> would not work depending on DISTRO_FEATURES option set.
> >>
> >> Adding:
> >>
> >> ,----[ Use example ]
> >> | inherit distro_features_check
> >> |
> >> | REQUIRED_DISTRO_FEATURES = "x11"
> >> | CONFLICT_DISTRO_FEATURES_mx6 = "wayland"
> >
> >
> > I wonder if it would be worth doing this like PNBLACKLIST to let the
> recipe
> > provide its reasoning as a message, or if that would add too much
> overhead.
> > I don't know enough about this use case, but something to consider if it
> > hasn't been already.
>
> I did a look now on PNBLACKLIST and while I see the value of a custom
> message I didn't come up with a way to do it using overrides as well.
> So, as the example in the commit log, it'd be harder to make a mx6
> specific conflict.
>
> CONFLICT_DISTRO_FEATURES[wayland]_mx6 = "Vivante GPU driver for
> Wayland is incompatible with X11"
>
> Would the above work with current BitBake code?


That's a good point, unfortunately I don't think flags propagate for
overrides today :(. I think it would be something like
CONFLICT_DISTRO_FEATURES_mx6[wayland], but I don't think that folds into
the main variable when the overrides are applied (the semantics of that may
be unclear0. Oh well, nevermind :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0141a9ac5097e504e30f3761
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sat, Aug 3, 2013 at 9:55 AM, Otavio Salvador <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.co=
m.br</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Fri, Aug 2, 2013 at 6:1=
6 PM, Chris Larson &lt;<a href=3D"mailto:clarson@kergoth.com">clarson@kergo=
th.com</a>&gt; wrote:<br>


&gt; On Thu, Aug 1, 2013 at 3:13 PM, Otavio Salvador &lt;<a href=3D"mailto:=
otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; This add support to list required/confliting distro features for a=
<br>
&gt;&gt; recipe; this avoids user mistake when building recipes/images whic=
h<br>
&gt;&gt; would not work depending on DISTRO_FEATURES option set.<br>
&gt;&gt;<br>
&gt;&gt; Adding:<br>
&gt;&gt;<br>
&gt;&gt; ,----[ Use example ]<br>
&gt;&gt; | inherit distro_features_check<br>
&gt;&gt; |<br>
&gt;&gt; | REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
&gt;&gt; | CONFLICT_DISTRO_FEATURES_mx6 =3D &quot;wayland&quot;<br>
&gt;<br>
&gt;<br>
&gt; I wonder if it would be worth doing this like PNBLACKLIST to let the r=
ecipe<br>
&gt; provide its reasoning as a message, or if that would add too much over=
head.<br>
&gt; I don&#39;t know enough about this use case, but something to consider=
 if it<br>
&gt; hasn&#39;t been already.<br>
<br>
</div>I did a look now on PNBLACKLIST and while I see the value of a custom=
<br>
message I didn&#39;t come up with a way to do it using overrides as well.<b=
r>
So, as the example in the commit log, it&#39;d be harder to make a mx6<br>
specific conflict.<br>
<br>
CONFLICT_DISTRO_FEATURES[wayland]_mx6 =3D &quot;Vivante GPU driver for<br>
Wayland is incompatible with X11&quot;<br>
<br>
Would the above work with current BitBake code?</blockquote></div><br>That&=
#39;s a good point, unfortunately I don&#39;t think flags propagate for ove=
rrides today :(. I think it would be something like CONFLICT_DISTRO_FEATURE=
S_mx6[wayland], but I don&#39;t think that folds into the main variable whe=
n the overrides are applied (the semantics of that may be unclear0. Oh well=
, nevermind :)<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e0141a9ac5097e504e30f3761--
