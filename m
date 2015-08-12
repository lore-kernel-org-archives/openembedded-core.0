Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1C0607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 17:51:46 +0000 (UTC)
Received: by iodv127 with SMTP id v127so12003006iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 10:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=CCBWjS7mGzn0vp4IGOPoU8+tSIPaBa0O9k9jteMBewU=;
	b=dzS6h6vmtr8PD+L/tN/3Zx9xpDrqnf8ujiBrG9wM4LC2w39XgT1cb/tIOhPgSP6oNZ
	DgDCGU3COL8xxviD5bGUEAISV2gfnnuUE4Dnq7M0/GV/Sdz7T1NMPlY1JTkQz84tfCTU
	vO282MWs2KicaPNHfVPbt/1Db5ZWkzdDIkNzQgyF4ih3f/js5YGn96ZHKP8dLDV/I9GA
	BxFCfa9FoD/8TGJU7B/JukykBISGEndqiv5iQtbWvo5RceJzVWCCRYZhYCxTlnKkw2ap
	vHIJ5z75HWFVsz/NQLRkBNNtSCrOjK8wiNzGXPEsfGupnC2cBYerLczuuEySoT0iMnO1
	qboA==
X-Received: by 10.107.132.169 with SMTP id o41mr3426937ioi.155.1439401906331; 
	Wed, 12 Aug 2015 10:51:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.199 with HTTP; Wed, 12 Aug 2015 10:51:26 -0700 (PDT)
In-Reply-To: <CABcZANmtCK18u2m2R51SmZN3Xrq7+FxY8PXMXJ4Y6-WVA3tGMQ@mail.gmail.com>
References: <1439303596-18965-1-git-send-email-ed.bartosh@linux.intel.com>
	<1439372011-26268-1-git-send-email-ed.bartosh@linux.intel.com>
	<20150812094953.GL6102@loska>
	<CAMKF1squ7h9gzvrX8u3m2_K_BeO7gto_ji5f4UBdJxnuNMyLZA@mail.gmail.com>
	<CABcZANmtCK18u2m2R51SmZN3Xrq7+FxY8PXMXJ4Y6-WVA3tGMQ@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 12 Aug 2015 10:51:26 -0700
X-Google-Sender-Auth: 2_Qunhf380QthkP_TZIqOAZUZ0g
Message-ID: <CABcZANkHBUNH5Zo3opKT-uwfneMYghTBTJCV8awOm-6D_0SK1w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: shell script guidelines in oe-core? (was Re: [PATCH v4] create-pull-request: cleanup bashisms)
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
X-List-Received-Date: Wed, 12 Aug 2015 17:51:49 -0000
Content-Type: multipart/alternative; boundary=001a113f398250e913051d20df5e

--001a113f398250e913051d20df5e
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 12, 2015 at 10:46 AM, Christopher Larson <clarson@kergoth.com>
wrote:

> On Wed, Aug 12, 2015 at 9:56 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Wed, Aug 12, 2015 at 2:49 AM,  <Mikko.Rapeli@bmw.de> wrote:
>> > This reminded me of the problems I've seen with various oe-core shell
>> scripts:
>> > they are missing systematic error handling.
>> >
>> > IMO using bash and 'set -euxo pipefail' are a good approach to catch
>> errors
>> > early in shell scripts. Manually checking for $? is error prone and
>> things
>> > like pipes can hide them. Using undefined variables is another thing
>> > which should fail early before things go horribly wrong. And in build
>> automation
>> > I'd rather see output of -x since things can fail in mysterious ways.
>> > And then there's quoting....
>> >
>> > One useful guide is to use shellcheck as static analysis tool for shell
>> scripts.
>> >
>> > I guess internally bitbake uses at least set -e.
>> >
>> > Comments?
>>
>> all these are good suggestions, I would recommend to open bugs for all
>> of these some of them might need
>> to cite the scripts which need fixing.
>
>
> Agreed, it's important to check the behavior of shell scripts is kosher
> and standards-compliant. shellcheck is extremely useful, I recommend it as
> well, but combined with the vim syntastic plugin, so every time you save
> the file all the errors and warnings are identified :) Makes it harder to
> ignore or forget about.


That reminds me, there's a shell portability issue / standards-complaince
issue that's not identified by shellcheck. Typically, to negate a  bracket
expression in a regular expression, one uses ^, e.g. [^a-z] is everything
that isn't in the range a to z, but that's not the case in shell, e.g. at a
prompt or in a ${foo#<pattern>}:

    "[...]a bracket expression as in XBD *RE Bracket Expression* , except
that the <exclamation-mark> character ( '!' ) shall replace the
<circumflex> character ( '^' ) in its role in a non-matching list in the
regular expression notation"

So in shell, you'd want [!a-z] rather than [^a-z]. Nearly all shells handle
both, but the behavior of the latter is actually unspecified according to
the standard:

    "A bracket expression starting with an unquoted <circumflex> character
produces unspecified results."

I recently got bitten by this with one of my shell scripts on a system
running dash.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113f398250e913051d20df5e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Aug 12, 2015 at 10:46 AM, Christopher Larson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><div=
 class=3D"gmail_quote">On Wed, Aug 12, 2015 at 9:56 AM, Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>=
On Wed, Aug 12, 2015 at 2:49 AM,=C2=A0 &lt;<a href=3D"mailto:Mikko.Rapeli@b=
mw.de" target=3D"_blank">Mikko.Rapeli@bmw.de</a>&gt; wrote:<br>
&gt; This reminded me of the problems I&#39;ve seen with various oe-core sh=
ell scripts:<br>
&gt; they are missing systematic error handling.<br>
&gt;<br>
&gt; IMO using bash and &#39;set -euxo pipefail&#39; are a good approach to=
 catch errors<br>
&gt; early in shell scripts. Manually checking for $? is error prone and th=
ings<br>
&gt; like pipes can hide them. Using undefined variables is another thing<b=
r>
&gt; which should fail early before things go horribly wrong. And in build =
automation<br>
&gt; I&#39;d rather see output of -x since things can fail in mysterious wa=
ys.<br>
&gt; And then there&#39;s quoting....<br>
&gt;<br>
&gt; One useful guide is to use shellcheck as static analysis tool for shel=
l scripts.<br>
&gt;<br>
&gt; I guess internally <span><span class=3D"il">bitbake</span></span> uses=
 at least set -e.<br>
&gt;<br>
&gt; Comments?<br>
<br>
</span>all these are good suggestions, I would recommend to open bugs for a=
ll<br>
of these some of them might need<br>
to cite the scripts which need fixing.</blockquote></div><br></span>Agreed,=
 it&#39;s important to check the behavior of shell scripts is kosher and st=
andards-compliant. shellcheck is extremely useful, I recommend it as well, =
but combined with the vim syntastic plugin, so every time you save the file=
 all the errors and warnings are identified :) Makes it harder to ignore or=
 forget about.</blockquote></div><br>That reminds me, there&#39;s a shell p=
ortability issue / standards-complaince issue that&#39;s not identified by =
shellcheck. Typically, to negate a =C2=A0bracket expression in a regular ex=
pression, one uses ^, e.g. [^a-z] is everything that isn&#39;t in the range=
 a to z, but that&#39;s not the case in shell, e.g. at a prompt or in a ${f=
oo#&lt;pattern&gt;}:</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 &quot;[...]a bracket expression as in XBD <i=
>RE Bracket
Expression</i> , except that the &lt;exclamation-mark&gt; character ( <tt>&=
#39;!&#39;</tt> ) shall replace the &lt;circumflex&gt;
character ( <tt>&#39;^&#39;</tt> ) in its role in a non-matching list in th=
e regular expression notation&quot;</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">So in shell, you&#39;d want [!a-z] rather tha=
n [^a-z]. Nearly all shells handle both, but the behavior of the latter is =
actually unspecified according to the standard:</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 &quot;A bracket exp=
ression starting with an unquoted &lt;circumflex&gt; character produces uns=
pecified results.&quot;</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">I recently got bitten by this with one of my shell script=
s on a system running dash.<br>-- <br><div class=3D"gmail_signature">Christ=
opher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedd=
ed, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Gr=
aphics</div>
</div></div>

--001a113f398250e913051d20df5e--
