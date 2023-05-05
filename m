Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B265BC77B7D
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 18:32:10 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.2456.1683311521293053140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 11:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HQbZt9II;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f00d41df22so17767657e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683311519; x=1685903519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=loOcTmjjssGO+QYc1dFnS84C45yvt/8vwtlvCKUf/q0=;
        b=HQbZt9IIWhzP8sCyUvtvTzUddU0/3k247x0qPJeanyEYQnkvtupot1tPmneCWei866
         6wX74PyqQGhXMvtRDG/ctmYVdVp9rmYYZXfIY3ubMAQLWV/Wv8qqHdx79Ls+kDXV16Fl
         achTn3dYVyUKkIbrX0AjVk2usCSBog4j1lPPcInv8SSqpyi37saWImBDn2D+TnkPTDgt
         yP77RDoBKb3TX8Z4Ok88ylBQvXuSbMX7bW/yPt5RHyl+7zR6PvX8LMckna13ezj0zHHZ
         /2aCnDWMrMC0BJoFK3o5L8wQJ7pRUQciHctCGRNwK9XP1uaKPfcWRzJR9/v4sDY/BH+N
         yhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683311519; x=1685903519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loOcTmjjssGO+QYc1dFnS84C45yvt/8vwtlvCKUf/q0=;
        b=MfcVkCq5fnqmHOfxEbDL//6N0C2tOwH6jYuHb+x2CTwahDt9LtLx8NIvv2XQhqRAWe
         ImKgW6uDo+IcWCv4mXkenbApxTkTSaD8OhBV21L3OlRsT+dw8mmIEBXQ4YPV0pcPDXZR
         sCnlKx6fClVYrtjleul+doQhIEaNPqchwCwZdR+KUW9ig/Dv71hXVEjVG5rsAhkHhDJN
         YY5CouxxqZlC8nru0FyREpjWTgjIlZqY7Y9bnd2MTI2Pe/Ll7d/XCWDmO1NRxPqXnEQi
         /9q739W8UND8d7zycPQr8UYxHIMml7EHE53XtdCX3MHXI54pdgfwSxtGRIK/74pVzb2n
         PUlg==
X-Gm-Message-State: AC+VfDx65pf4VJbEQJkMWxSQ9imqGu6BqfU/151fDcEPaHbUJfgTfbBC
	XFjAtigTGoUVT0XZ2xdiwRuOWTrmzhLiNmLWNCzREA5E
X-Google-Smtp-Source: ACHHUZ66p5wXqJbB+w9jXFM90gfyYgfVLRpkV+M76qmhEnxrllu1VMI9KLwuUbviKvKgwbPk2BzjMaMXXlK3m7st7jo=
X-Received: by 2002:a05:6512:3d8f:b0:4e2:7ab6:15cd with SMTP id
 k15-20020a0565123d8f00b004e27ab615cdmr2919364lfv.30.1683311519193; Fri, 05
 May 2023 11:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
 <CANNYZj-q+5jxDxWDp_4B2kD4NVqWA-Fok2wuTUiLzzsO_5iYYw@mail.gmail.com> <ce83564a-1362-f45d-8c4d-e33e68a72d27@baylibre.com>
In-Reply-To: <ce83564a-1362-f45d-8c4d-e33e68a72d27@baylibre.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 5 May 2023 20:31:47 +0200
Message-ID: <CA+cAkersaTEgB7zzvAHrr9nhicFT=Rtz30GQ_GaEHwNbSEQ5-Q@mail.gmail.com>
Subject: Re: [OE-core] Contributing, how it works?
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000025dee205faf681c2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 18:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180967

--00000000000025dee205faf681c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 5 mai 2023, 20:21, Trevor Gamblin <tgamblin@baylibre.com> a =C3=A9c=
rit :

>
> On 2023-05-05 13:37, Alexander Kanavin wrote:
> > There is
> > http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> > and some additional pages linked from it:
> > http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > http://www.openembedded.org/wiki/Styleguide
> >
> > The wiki is not great, and needs improvements, but the problem is it's
> > difficult to write an authoritative and comprehensive answer to the
> > questions you ask because there's just so many possible things one
> > could check with any change to yocto. If you touch a recipe, you
> > should of course check that 'bitbake recipe' still completes without
> > an error. But that's obvious, isn't it? Beyond that... it depends. And
> > requires a bit of intuition and experience, or advice from someone who
> > knows the specific item better.
> >
> > We generally don't expect people to learn 'the rules' upfront - just
> > write some code, and if you're not certain how to test it properly or
> > whether it even makes sense, submit the patch as RFC and ask to take a
> > look. If it fails in integration testing, you'll hear about it too,
> > and that's normal and expected for anything more complex than a typo
> > fix. My patches appear 'perfect' only because I pre-test them myself
> > on the autobuilder :)
> >
> > Where we would *greatly* appreciate help is a special bot called
> > patchtest that used to check mailing list submissions for common
> > problems. That fell into disrepair due to lack of maintenance. Fixing
> > that would be fantastic - and people could run it locally too. That
> > could act as both a repository of rules-as-code, and a way to check
> > them automatically. It could also offer hints for testing, depending
> > on what the change touches. All sorts of nice things, if there is a
> > person looking after it.
>
> I'm actually working on getting patchtest running again, and I've
> assigned myself as maintainer :)
>
> To add to what Alex said, a good place for you to start might be looking
> at the Newcomer Bugs list:
> https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs
>
> Alternatively, watching AUH failures and figuring out broken upgrades,


What is AUH? Where I can see broken upgrades you talked about? And more
important to me, how can I replicate them to investigate on my side?


> or looking on the Bugzilla under terms like "ptest" could also be very
> useful, while providing better understanding of how recipes are written
> and being somewhat more accessible.
>
> You can also ask questions in the #yocto channel on the Libera.Chat IRC
> server if you need additional help.
>
> - Trevor
>
> >
> > Alex
> >
> > On Fri, 5 May 2023 at 19:17, Frederic Martinsons
> > <frederic.martinsons@gmail.com> wrote:
> >> Hello list
> >>
> >> I'm wondering if there are documentations on how contribution are
> managed for the project.
> >>
> >> I try to find some but didn't manage to. There are easily reachable do=
c
> about how to contribute of course (how to make patches, fixe your identit=
y,
> send mail via git... etc) but I didn't find what I usually find on other
> open source project (CONTRIBUTING.md file most of the time) like
> >>    - what are the tests do should I run before submitting (I learnt by
> practice about test image or bitbake selftest for example) ?
> >>    - is there a specific configuration that I should test before
> submitting (poky is ok, or should I also test another distro)?
> >>    - does some commit writing rules exist ? (some projects want commit=
s
> to begin with a prefix, usually the software component that is modified b=
y
> the patch for example)
> >>   - what are the coding rules you should follow, if any? (having commo=
n
> coding rules helps greatly the review of patches, pylint for python code
> for example, and I saw there are some bitbake recipes linter from meta-sc=
a
> layer)
> >>
> >> Long story short, I really would like to know what are the different
> steps a patch should go through before being merged into master (and as a
> side question, what are the steps for a patch to be backported into one o=
f
> the LTS branch).
> >>
> >> I'm deeply sorry if all these questions are obvious to you and have
> been already answered somewhere, in that case, please just give me the li=
nk.
> >>
> >> I recently started to contribute to yocto / oe and I think it will hel=
p
> me to make better contributions if I know more of how it works "under the
> hood".
> >>
> >> Best regards.
> >>
> >>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#180962):
> https://lists.openembedded.org/g/openembedded-core/message/180962
> >> Mute This Topic: https://lists.openembedded.org/mt/98710419/7611679
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> tgamblin@baylibre.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--00000000000025dee205faf681c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le ven. 5 mai 2023, 20:21, Trevor Gamblin &lt;<a href=
=3D"mailto:tgamblin@baylibre.com">tgamblin@baylibre.com</a>&gt; a =C3=A9cri=
t=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
On 2023-05-05 13:37, Alexander Kanavin wrote:<br>
&gt; There is<br>
&gt; <a href=3D"http://www.openembedded.org/wiki/How_to_submit_a_patch_to_O=
penEmbedded" rel=3D"noreferrer noreferrer" target=3D"_blank">http://www.ope=
nembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a><br>
&gt; and some additional pages linked from it:<br>
&gt; <a href=3D"http://www.openembedded.org/wiki/Commit_Patch_Message_Guide=
lines" rel=3D"noreferrer noreferrer" target=3D"_blank">http://www.openembed=
ded.org/wiki/Commit_Patch_Message_Guidelines</a><br>
&gt; <a href=3D"http://www.openembedded.org/wiki/Styleguide" rel=3D"norefer=
rer noreferrer" target=3D"_blank">http://www.openembedded.org/wiki/Stylegui=
de</a><br>
&gt;<br>
&gt; The wiki is not great, and needs improvements, but the problem is it&#=
39;s<br>
&gt; difficult to write an authoritative and comprehensive answer to the<br=
>
&gt; questions you ask because there&#39;s just so many possible things one=
<br>
&gt; could check with any change to yocto. If you touch a recipe, you<br>
&gt; should of course check that &#39;bitbake recipe&#39; still completes w=
ithout<br>
&gt; an error. But that&#39;s obvious, isn&#39;t it? Beyond that... it depe=
nds. And<br>
&gt; requires a bit of intuition and experience, or advice from someone who=
<br>
&gt; knows the specific item better.<br>
&gt;<br>
&gt; We generally don&#39;t expect people to learn &#39;the rules&#39; upfr=
ont - just<br>
&gt; write some code, and if you&#39;re not certain how to test it properly=
 or<br>
&gt; whether it even makes sense, submit the patch as RFC and ask to take a=
<br>
&gt; look. If it fails in integration testing, you&#39;ll hear about it too=
,<br>
&gt; and that&#39;s normal and expected for anything more complex than a ty=
po<br>
&gt; fix. My patches appear &#39;perfect&#39; only because I pre-test them =
myself<br>
&gt; on the autobuilder :)<br>
&gt;<br>
&gt; Where we would *greatly* appreciate help is a special bot called<br>
&gt; patchtest that used to check mailing list submissions for common<br>
&gt; problems. That fell into disrepair due to lack of maintenance. Fixing<=
br>
&gt; that would be fantastic - and people could run it locally too. That<br=
>
&gt; could act as both a repository of rules-as-code, and a way to check<br=
>
&gt; them automatically. It could also offer hints for testing, depending<b=
r>
&gt; on what the change touches. All sorts of nice things, if there is a<br=
>
&gt; person looking after it.<br>
<br>
I&#39;m actually working on getting patchtest running again, and I&#39;ve <=
br>
assigned myself as maintainer :)<br>
<br>
To add to what Alex said, a good place for you to start might be looking <b=
r>
at the Newcomer Bugs list: <br>
<a href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/=
wiki/Bug_Triage#Newcomer_Bugs</a><br>
<br>
Alternatively, watching AUH failures and figuring out broken upgrades,</blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><di=
v dir=3D"auto">What is AUH? Where I can see broken upgrades you talked abou=
t? And more important to me, how can I replicate them to investigate on my =
side?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"> <br>
or looking on the Bugzilla under terms like &quot;ptest&quot; could also be=
 very <br>
useful, while providing better understanding of how recipes are written <br=
>
and being somewhat more accessible.<br>
<br>
You can also ask questions in the #yocto channel on the Libera.Chat IRC <br=
>
server if you need additional help.<br>
<br>
- Trevor<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Fri, 5 May 2023 at 19:17, Frederic Martinsons<br>
&gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank"=
 rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;&gt; Hello list<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m wondering if there are documentations on how contribution =
are managed for the project.<br>
&gt;&gt;<br>
&gt;&gt; I try to find some but didn&#39;t manage to. There are easily reac=
hable doc about how to contribute of course (how to make patches, fixe your=
 identity, send mail via git... etc) but I didn&#39;t find what I usually f=
ind on other open source project (CONTRIBUTING.md file most of the time) li=
ke<br>
&gt;&gt;=C2=A0 =C2=A0 - what are the tests do should I run before submittin=
g (I learnt by practice about test image or bitbake selftest for example) ?=
<br>
&gt;&gt;=C2=A0 =C2=A0 - is there a specific configuration that I should tes=
t before submitting (poky is ok, or should I also test another distro)?<br>
&gt;&gt;=C2=A0 =C2=A0 - does some commit writing rules exist ? (some projec=
ts want commits to begin with a prefix, usually the software component that=
 is modified by the patch for example)<br>
&gt;&gt;=C2=A0 =C2=A0- what are the coding rules you should follow, if any?=
 (having common coding rules helps greatly the review of patches, pylint fo=
r python code for example, and I saw there are some bitbake recipes linter =
from meta-sca layer)<br>
&gt;&gt;<br>
&gt;&gt; Long story short, I really would like to know what are the differe=
nt steps a patch should go through before being merged into master (and as =
a side question, what are the steps for a patch to be backported into one o=
f the LTS branch).<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m deeply sorry if all these questions are obvious to you and=
 have been already answered somewhere, in that case, please just give me th=
e link.<br>
&gt;&gt;<br>
&gt;&gt; I recently started to contribute to yocto / oe and I think it will=
 help me to make better contributions if I know more of how it works &quot;=
under the hood&quot;.<br>
&gt;&gt;<br>
&gt;&gt; Best regards.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#180962): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/180962" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/18=
0962</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9871=
0419/7611679" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists=
.openembedded.org/mt/98710419/7611679</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner=
@lists.openembedded.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:tgambl=
in@baylibre.com" target=3D"_blank" rel=3D"noreferrer">tgamblin@baylibre.com=
</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div></div>

--00000000000025dee205faf681c2--

