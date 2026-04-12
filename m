Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56519E937E5
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 14:18:27 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.244997.1776003503864895160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 07:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YylBDNLs;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: adam.blank.g@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4232323a7daso1928181fac.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 07:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776003503; cv=none;
        d=google.com; s=arc-20240605;
        b=g3WL38zLicGbbO0kLgOIunoL/0CvoMqeO2b/WZJD92B2bFCIQVG9uByJwsSZRdCPUh
         VRjNIfmU76w4EwJJYl9c13SHPUtcNdQzcXp6ky9P2u7FDEvBtdnwmC7Z3fjBVSIdi2nu
         TLep7ENakis/AcK4kW0nmpvYLbJ0xsat3WyqVPOzoBH9kaiGT139YlTmYs9ad+wlQajZ
         uR2ymxt2xhHkUfnTZfu3RIUS7nGLCxtoJW2uTTSicoh8PBgOqNNQ19qQvqZM2dv+2hhJ
         ENJpW8212oaYfQeadQIMgtIJXV1itMCFNE9gBSfybBusXmriGeJpwKrNEpwmGOHJDo34
         UWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G+pUP7AsadwGbAWv3priCO2PkJ3qmiVnwI7wqi458Y0=;
        fh=9fJVPSUOfsC2mBYmauNMhrdbVNJminiXqY7j/3EB8F0=;
        b=ZDUm+0ysCYJ+xOq139H2QrZw98F4owT45dFEpm+GZ3084QiTEQgE9qxTLR6KapFwSc
         FwgcyScbkJjTkEmIUiQWoStExtpr88lXtxSDHacKfntiQKyYeAW8VOWqXBov1P2x39se
         Z/WmqBuFcwp5B0lh/wDjI/giuoX5hb2/NeIYilpQl1oTNIqtM3vU5ojBre17ocFYAXs4
         l8xAFgU+0pavsmn34PVumFGpb8QlJR4TWhD/pAe4AuvybqMqTt7uUwy8m3G1W9BD2JMs
         nRcXHvl+Nt5N3+A5aBavNnEWI9OypegQ/ADLxh70xlQpRPV+oCMmP/LG/J51TMWjRg6t
         3tUA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776003503; x=1776608303; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G+pUP7AsadwGbAWv3priCO2PkJ3qmiVnwI7wqi458Y0=;
        b=YylBDNLs4CVJa9VAHuuxrqQyQtGKXFvLx1i17T9RRXFO/ILFh5xobFEoLTAsWBGJ41
         jHEFt4f3w4aZUWB0wJa/IOAwDOtdTVEWYqxE8rtubs/B/mIokihVjhIF6GeeCOgPAJ16
         KCbar/gI1JxuhB4Q+eyiUogiPfJwUwmR6CSvlDarYyia1w+nbOQlvMza5k6v7F3+PPKO
         iXJM4sjiH7lt3qoEYz9E1bPiClQ+dlLMBBeoDPl5wR+vyYTFbvsnM53ONWbhbsPTBMHj
         GN8ByTiG+QL8NYskDhO1M/24hHfJJCZTAmiFa9Kwpq9MkoEqeeMaYtgVLGzxPknlF/Sx
         YQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776003503; x=1776608303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+pUP7AsadwGbAWv3priCO2PkJ3qmiVnwI7wqi458Y0=;
        b=EIbL1u3UJyECWUWjCBCTb6DXXvNpKN8dAeGkggmX+1y4ZGhUi/VuMArcM33VRnZLRg
         7HJ/DKTCdsEjRPDyzGU9cGJZ+zScV+qxn7uppvea4hdDVwqn2SPhBv9s+f8Ti/hmGXrH
         7hNhlGlPq5miHveset+BtyCibRbWO96mZqK8NYJrt6r8t8Zl41ZDEujSsIa/ET1G+4E+
         qDOuZ+j0kT6AmGcoxN2Ooz1X0H+oVAmyLOImZLAyWpPzoDn2sVeYlP+CJrAsHW+33piB
         9hU1pIVohIT/a3yny4U1ussCn78B15KMwm6RRhJjl7iRZYAHryQa46StNurIQUGm/4P3
         RvhA==
X-Gm-Message-State: AOJu0Yx5pAviAYKscmTJ/flLxsrNrOZaVdvYTm44xCAL3W5pztAQCL4Z
	w3BHYZG9lalDlpAn2Hh+TgHB6O/d0QnckezeGQi4tw2gq/7EcKB+YoLIpUTjXaqzZmJ3hSyTpA5
	yaIk1twMfvbY5lftiGirnnFktYhsQX58=
X-Gm-Gg: AeBDievetfcnxGQHfRsFjMfYt5++HTZs+tnDNUpJDpt/qs8nleukRGWPBV9HUaqJJNE
	VN+qWzKWO8iN5xe6Mdkc1xFIKboBcQfin9bUloLfccAzWebM7XR1STN1OuqsI6ZkbZTJ0/cIXnv
	ffbgM7RZ5+y9PZS0bSTO2jodLQLRM+Ilm6ptdDZH92mchtqCBFFk3NGvFDGSynFjiUUA8Nk/HD1
	fF+TZtajRt5Z/gqaX0FXyFZvXdd5cEhUGi7lLfmaGTPURGbJ9jM719PAJkRQ2dgVdXaySJYiZzb
	VdDjoKj4YXDAGDTXX6C/9TPAJa1kOhUyHV/LCnowEA==
X-Received: by 2002:a05:6870:45aa:b0:417:64ba:82cc with SMTP id
 586e51a60fabf-423e113b98emr4897203fac.43.1776003502873; Sun, 12 Apr 2026
 07:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
 <20260402-dead_code_and_unification-v2-2-259169372299@gmail.com>
 <DHJD0XSTONE6.2ZXL04SBPR664@bootlin.com> <CAFAffzx7EdXXEudpQGCgSA-1M7aDDwMuRLW+Dta5urcmVx_yWg@mail.gmail.com>
 <DHJHIMYYUTH6.16YUU1V7MJZY@bootlin.com> <CAFAffzzW9r43AE5hKbXihkXqZTWeO=sQGctTkmL4Eg+U9X31AA@mail.gmail.com>
 <DHMXQQX9N8S2.2XR0GJ6ALH1O3@bootlin.com>
In-Reply-To: <DHMXQQX9N8S2.2XR0GJ6ALH1O3@bootlin.com>
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sun, 12 Apr 2026 16:18:10 +0200
X-Gm-Features: AQROBzCA9QmxDGsPP9l921P-vqSRA2HSN3etxPmhDNPLeStaOyjl1uoeJlpTM5w
Message-ID: <CAFAffzwtCKC7HGtRptDoTDFUyCg4kYfkTGmYUCy3Atn-2TqWXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/4] package_pkgdata: fix typo to stop
 calling undefined function
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e89f5c064f4409d0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 14:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235067

--000000000000e89f5c064f4409d0
Content-Type: text/plain; charset="UTF-8"

I've dug some more, as I couldn't come to terms with it ;-)

I've got a fix and a reasoning behind it: when the typo is fixed, a new
callable function is identified and treated as a dependency of
'do_package'. This in turn pulls in its dependency on 'PACKAGE_EXTRA_ARCHS'
and the test must fail.
The fix is simply about making sure, that 'package_populate_pkgdata_dir'
has 'PACKAGE_EXTRA_ARCHS' and a few other variables in its 'vardepsexclude'.

What bothered me was something else though. I could clearly see, how this
part of code in 'package.bbclass' was based on 'staging.bbclass'. There is
an identical chain of dependencies:
- do_prepare_recipe_sysroot -> extend_recipe_sysroot
-> staging_populate_sysroot_dir (referencing 'PACKAGE_EXTRA_ARCHS')
- do_package -> package_prepare_pkgdata -> package_populate_pkgdata_dir
(referencing 'PACKAGE_EXTRA_ARCHS')

I couldn't believe that somehow 'do_package' had this issue, but
'do_prepare_recipe_sysroot' didn't (for no apparent reason). After an
extremely long chase, I found 'extend_recipe_sysroot' in
'BB_BASEHASH_IGNORE_VARS'... Since this was more unexpected to me than the
Spanish Inquisition, and has been there since 2017, I'd like to ask:

- Is it truly justified for 'extend_recipe_sysroot' to have this sort of
globally unique, special treatment?
- Wouldn't it be better for it to be handled using the same mechanism that
are applied to other functions?

Thanks,
Adam


On Tue, 7 Apr 2026 at 14:52, Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Sat Apr 4, 2026 at 7:14 PM CEST, Adam Blank via lists.openembedded.org
> wrote:
> > On Fri, 3 Apr 2026 at 13:31, Mathieu Dubois-Briand <
> > mathieu.dubois-briand@bootlin.com> wrote:
> >
> >> On Fri Apr 3, 2026 at 12:32 PM CEST, Adam Blank wrote:
> >> > Hmmm, can't see any connection between those tests and this particular
> >> > patch...
> >> > The thing is, that since the patch fixes a call to an undefined
> function,
> >> > there could not have been a test covering this case in the first place
> >> ;-)
> >> > In addition, the function call takes place only in the 'bitbake -b'
> >> case...
> >> >
> >> > Where can it be found, which other changes took place in those builds?
> >> >
> >> > On Fri, 3 Apr 2026 at 10:00, Mathieu Dubois-Briand <
> >> > mathieu.dubois-briand@bootlin.com> wrote:
> >> >
> >>
> >> The tested branch can be found here:
> >>
> >>
> https://git.yoctoproject.org/poky-ci-archive/log/?h=oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3579
> >>
> >> But I confirm git bisect points to this commit, and the error is gone
> >> after a revert. You can easily reproduce the issue on your side:
> >> oe-selftest -r
> sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs
> >>
> >>
> > I've run this test with my change cherry-picked onto the master, and have
> > got some inconclusive, partially random results... Here's what I did:
> > - the test started FAILING (as in the autobuilder)
> > - I replaced the corrected function invocation with an exception throw
> and
> > nothing changed (this proves, that this branch does not take part in this
> > test)
> > - I limited the packages built during the test to only some of the ones
> > failing - the test started PASSING
> > - I started restoring the original package list, and finally restored its
> > original state - the test kept PASSING
> > - I restored the original state of the workspace - master + my commit
> (the
> > exact same configuration that I started with) and the test kept PASSING
> > - I rerun the test a few times, each time in a new, fresh build, and
> after
> > about 3 FAILING runs it suddenly PASSED 2 times, before it started
> FAILING
> > again - all the time in the same state of the workspace
> >
> > I did confirm, that the signatures differed indeed in the failing runs. I
> > chased it for a while, looked here and there (e.g. found it suspicious
> that
> > native, nativesdk, cross-canadian, etc. clear
> > out do_packagedata[stamp-extra-info] and allarch does not) but I cannot
> > even dream of the type of free time I'd need to familiarise myself
> > sufficiently with BitBake's hashing machinery.
> >
> > I think the way to go now is to file a bug - what do you think?
> >
> > Thanks,
> > Adam
> >
>
> Thanks for taking the time to make these tests.
>
> I am not familiar either with these bitbake parts, so yes, except if
> someone else comes with an explanation, opening a bug entry is probably
> the best move here.
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000e89f5c064f4409d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div dir=3D"ltr"><div class=3D"gmail_def=
ault" style=3D"font-size:small">I&#39;ve dug some more, as I couldn&#39;t c=
ome to terms with it ;-)</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
I&#39;ve got a fix and a reasoning behind it: when the typo is fixed, a new=
 callable function is identified and treated as a dependency of &#39;do_pac=
kage&#39;. This in turn pulls in its dependency on &#39;PACKAGE_EXTRA_ARCHS=
&#39; and the test must fail.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">The fix is simply about making sure, that &#39;package_popul=
ate_pkgdata_dir&#39; has &#39;PACKAGE_EXTRA_ARCHS&#39; and a few other vari=
ables in its &#39;vardepsexclude&#39;.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">What bothered me was something else though. I could clearly s=
ee, how this part of code in &#39;package.bbclass&#39; was based on &#39;st=
aging.bbclass&#39;. There is an identical chain of dependencies:<br>-=C2=A0=
do_prepare_recipe_sysroot -&gt;=C2=A0extend_recipe_sysroot -&gt;=C2=A0stagi=
ng_populate_sysroot_dir (referencing &#39;PACKAGE_EXTRA_ARCHS&#39;)</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">-=C2=A0do_package -&gt=
;=C2=A0package_prepare_pkgdata -&gt;=C2=A0package_populate_pkgdata_dir (ref=
erencing &#39;PACKAGE_EXTRA_ARCHS&#39;)</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small" dir=3D"auto"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small" dir=3D"auto">I couldn&#39;t believe that someho=
w &#39;do_package&#39; had this issue, but &#39;do_prepare_recipe_sysroot&#=
39; didn&#39;t (for no apparent reason). After an extremely long chase, I f=
ound &#39;extend_recipe_sysroot&#39; in &#39;BB_BASEHASH_IGNORE_VARS&#39;..=
. Since this was more unexpected to me than the Spanish Inquisition, and ha=
s been there since 2017, I&#39;d like to ask:</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small" dir=3D"auto"><br></div><div class=3D"gmail_d=
efault" style=3D"font-size:small" dir=3D"auto">- Is it truly justified for =
&#39;extend_recipe_sysroot&#39; to have this sort of globally unique, speci=
al treatment?</div><div class=3D"gmail_default" style=3D"font-size:small" d=
ir=3D"auto">- Wouldn&#39;t it be better for it to be handled using the same=
 mechanism that are applied to other functions?=C2=A0</div><div class=3D"gm=
ail_default" style=3D"font-size:small" dir=3D"auto"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Thanks,</div><div class=3D"gmail_=
default" style=3D"font-size:small">Adam</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div></div></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 7 Apr 2026 at 14:52,=
 Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.=
com" rel=3D"noreferrer" target=3D"_blank">mathieu.dubois-briand@bootlin.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Sat Apr 4, 2026 at 7:14 PM CEST, Adam Blank via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
&gt; On Fri, 3 Apr 2026 at 13:31, Mathieu Dubois-Briand &lt;<br>
&gt; <a href=3D"mailto:mathieu.dubois-briand@bootlin.com" rel=3D"noreferrer=
" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; On Fri Apr 3, 2026 at 12:32 PM CEST, Adam Blank wrote:<br>
&gt;&gt; &gt; Hmmm, can&#39;t see any connection between those tests and th=
is particular<br>
&gt;&gt; &gt; patch...<br>
&gt;&gt; &gt; The thing is, that since the patch fixes a call to an undefin=
ed function,<br>
&gt;&gt; &gt; there could not have been a test covering this case in the fi=
rst place<br>
&gt;&gt; ;-)<br>
&gt;&gt; &gt; In addition, the function call takes place only in the &#39;b=
itbake -b&#39;<br>
&gt;&gt; case...<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Where can it be found, which other changes took place in thos=
e builds?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Fri, 3 Apr 2026 at 10:00, Mathieu Dubois-Briand &lt;<br>
&gt;&gt; &gt; <a href=3D"mailto:mathieu.dubois-briand@bootlin.com" rel=3D"n=
oreferrer" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt; wrot=
e:<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; The tested branch can be found here:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://git.yoctoproject.org/poky-ci-archive/log/?h=3Do=
ecore/autobuilder.yoctoproject.org/valkyrie/a-full-3579" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://git.yoctoproject.org/poky-ci-archive/=
log/?h=3Doecore/autobuilder.yoctoproject.org/valkyrie/a-full-3579</a><br>
&gt;&gt;<br>
&gt;&gt; But I confirm git bisect points to this commit, and the error is g=
one<br>
&gt;&gt; after a revert. You can easily reproduce the issue on your side:<b=
r>
&gt;&gt; oe-selftest -r sstatetests.SStateHashSameSigs2.test_sstate_allarch=
_samesigs<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; I&#39;ve run this test with my change cherry-picked onto the master, a=
nd have<br>
&gt; got some inconclusive, partially random results... Here&#39;s what I d=
id:<br>
&gt; - the test started FAILING (as in the autobuilder)<br>
&gt; - I replaced the corrected function invocation with an exception throw=
 and<br>
&gt; nothing changed (this proves, that this branch does not take part in t=
his<br>
&gt; test)<br>
&gt; - I limited the packages built during the test to only some of the one=
s<br>
&gt; failing - the test started PASSING<br>
&gt; - I started restoring the original package list, and finally restored =
its<br>
&gt; original state - the test kept PASSING<br>
&gt; - I restored the original state of the workspace - master + my commit =
(the<br>
&gt; exact same configuration that I started with) and the test kept PASSIN=
G<br>
&gt; - I rerun the test a few times, each time in a new, fresh build, and a=
fter<br>
&gt; about 3 FAILING runs it suddenly PASSED 2 times, before it started FAI=
LING<br>
&gt; again - all the time in the same state of the workspace<br>
&gt;<br>
&gt; I did confirm, that the signatures differed indeed in the failing runs=
. I<br>
&gt; chased it for a while, looked here and there (e.g. found it suspicious=
 that<br>
&gt; native, nativesdk, cross-canadian, etc. clear<br>
&gt; out do_packagedata[stamp-extra-info] and allarch does not) but I canno=
t<br>
&gt; even dream of the type of free time I&#39;d need to familiarise myself=
<br>
&gt; sufficiently with BitBake&#39;s hashing machinery.<br>
&gt;<br>
&gt; I think the way to go now is to file a bug - what do you think?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Adam<br>
&gt;<br>
<br>
Thanks for taking the time to make these tests.<br>
<br>
I am not familiar either with these bitbake parts, so yes, except if<br>
someone else comes with an explanation, opening a bug entry is probably<br>
the best move here.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000e89f5c064f4409d0--

