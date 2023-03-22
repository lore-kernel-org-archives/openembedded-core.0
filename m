Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B96EC6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 19:00:45 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.52699.1679511641067748551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 12:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout12.t-online.de (Postfix) with SMTP id 03DC91543B;
	Wed, 22 Mar 2023 20:00:39 +0100 (CET)
Received: from [192.168.178.74] ([79.219.238.67]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pf3hL-1z0uUi0; Wed, 22 Mar 2023 20:00:36 +0100
Date: Wed, 22 Mar 2023 20:00:48 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <CHRXRR.A1NILQGNBS7P1@t-online.de>
In-Reply-To: 
	<CANNYZj-ZHjZ9nihVrLeNgf_eeT-+k2uAGuZQEku8YAF_a2vd3Q@mail.gmail.com>
References: <20230317060202.385862-1-f_l_k@t-online.de>
	<dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
	<9FONRR.ZLSABXKTP67E@t-online.de>
	<a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
	<B0EORR.JWJ884MGYK8G2@t-online.de>
	<CANNYZj-ZHjZ9nihVrLeNgf_eeT-+k2uAGuZQEku8YAF_a2vd3Q@mail.gmail.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-JY42yY0w25ppBMhPy1MT"
X-TOI-EXPURGATEID: 150726::1679511636-98D4DC79-D7CE1991/0/0 CLEAN NORMAL
X-TOI-MSGID: e883f9df-3e62-4ca2-a87a-1d6ffa64fec0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 19:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178953

--=-JY42yY0w25ppBMhPy1MT
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

After a turbulent week I finally have some time for the hobby again.=20
However, there is a hardware problem with my build machine. The CPU fan=20
failed and for some reason the warning for it was disabled in the bios.=20
I didn't notice it until the machine just crashed with an overheated=20
CPU while compiling. Cost me some sstate cache and I have to get a=20
replacement for the fan. I had done some tests with sysvinit and this=20
commit before. So far it looks like busybox/sysvinit has no major=20
problems with the change. However, it is of course possible that such=20
an invasive change could affect workflows that I didn't think of or=20
overlooked to change one or the other line.

In case the commit message gave the wrong impression, I would like to=20
explain that it was not my intention to push a change here just because=20
I like systemd. My logic was something like this:

Glib-2.0 uses ptest to ensure that /tmp is not a symlink. I am inclined=20
to believe that this is intended and not a bug in the test. Based on=20
this assumption, there are not many options. You could either make sure=20
that no symlink is created for ptests, which I don't think is a good=20
idea. Strictly speaking, this would undermine the test by creating a=20
different environment for it than exists on the target. It would be=20
more honest to simply ignore the test for that case.

So I thought it would be best to fulfill glibs needs and remove the=20
/tmp symlink everywhere. That's when systemd came into play because I=20
thought if you have to make such an invasive change anyway, you should=20
first see how systemd would expect it.  That would be correct if you=20
agree that systemd should set the default.

If not, I could also send a variant where only the /tmp symlink is=20
replaced by a directory  that has a  mounted tmpfs but doesn't remove=20
/var/volatile/tmp. That might be a bit less invasive, but we would have=20
the problem that directory structure under sysvinit is fundamentally=20
different from that under systemd. In any case, even with this=20
approach, I couldn't 100% rule out that it could affect=20
sysvinit/busybox or even systemd based images or one or the other=20
workflow. But at least I tried my best not to break sysvinit.

If I need to run any specific tests I can do that as soon as my CPU=20
cools down again

On Fri, Mar 17 2023 at 07:10:36 PM +0000, Alexander Kanavin=20
<alex.kanavin@gmail.com> wrote:
> I think it would help to at least take this through a-full so we have=20
> a higher degree of knowledge in what breaks and what doesn=FFt.
>=20
> I didn=FFt look at the patch in detail and won=FFt be able to for a=20
> few more days. We definitely need to understand how it affects other=20
> init systems, but it is totally doable, there is only a limited=20
> number of them and how they handle tmp directories and what they=20
> expect from them is tractable research. As long as no one expects RP=20
> to do that.
>=20
> Alex
>=20
> On Fri 17. Mar 2023 at 17.31, Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>> Am Fr, 17. M=E4r 2023 um 11:53:17 +0000 schrieb Richard Purdie=20
>> <richard.purdie@linuxfoundation.org=20
>> <mailto:richard.purdie@linuxfoundation.org>>:
>>> It would help me if adverse effects are mentioned in commit=20
>>> messages.
>>> In this case I can spot it easily enough but I don't always=20
>>> know/spot
>>> all the issues.
>>=20
>> It would be too harsh to say that I don't care about sysvinit. Of=20
>> course, if something breaks as a result of this commit, I'm willing=20
>> to take care of it if I can help. It's just that I don't personally=20
>> use it, so I haven't identified any other issues that might be=20
>> relevant to sysvinit. Other than the obvious that anything that=20
>> would write directly to '/var/volatile/tmp' would break.
>> At least I checked that sysvinit images could still boot. I have=20
>> successfully run core-image-ptest-glib-2.0 with this patch applied.=20
>> If I knew of any problems with sysvinit I would have pointed them=20
>> out, but unfortunately I have no further findings yet
>>=20
>>=20
>>=20


--=-JY42yY0w25ppBMhPy1MT
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>After a turbulent week I fina=
lly have some time for the hobby again. However, there is a hardware proble=
m with my build machine. The CPU fan failed and for some reason the warning=
 for it was disabled in the bios. I didn't notice it until the machine just=
 crashed with an overheated CPU while compiling. Cost me some sstate cache =
and I have to get a replacement for the fan. I had done some tests with sys=
vinit and this commit before. So far it looks like busybox/sysvinit has no =
major problems with the change. However, it is of course possible that such=
 an invasive change could affect workflows that I didn't think of or overlo=
oked to change one or the other line.</div><div><br></div><div>In case the =
commit message gave the wrong impression, I would like to explain that it w=
as not my intention to push a change here just because I like systemd. My l=
ogic was something like this:</div><div><br></div><div>Glib-2.0 uses ptest =
to ensure that /tmp is not a symlink. I am inclined to believe that this is=
 intended and not a bug in the test. Based on this assumption, there are no=
t many options. You could either make sure that no symlink is created for p=
tests, which I don't think is a good idea. Strictly speaking, this would un=
dermine the test by creating a different environment for it than exists on =
the target.&nbsp;It would be more honest to simply ignore the test for that=
 case.</div><div><br></div><div>So I thought it would be best to fulfill gl=
ibs needs and remove the /tmp symlink everywhere. That's when systemd came =
into play because I thought if you have to make such an invasive change any=
way, you should first see how systemd would expect it. &nbsp;That would be =
correct if you agree that systemd should set the default.</div><div><br></d=
iv><div>If not, I could also send a variant where only the /tmp symlink is =
replaced by a directory &nbsp;that has a &nbsp;mounted tmpfs but doesn't re=
move /var/volatile/tmp. That might be a bit less invasive, but we would hav=
e the problem that directory structure under sysvinit is fundamentally diff=
erent from that under systemd. In any case, even with this approach, I coul=
dn't 100% rule out that it could affect sysvinit/busybox or even systemd ba=
sed images or one or the other workflow. But at least I tried my best not t=
o break sysvinit.</div></div><div><br></div><div>If I need to run any speci=
fic tests I can do that as soon as my CPU cools down again</div></div><div =
id=3D"geary-quote" dir=3D"auto"><br>On Fri, Mar 17 2023 at 07:10:36 PM +000=
0, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote t=
ype=3D"cite"><div><div dir=3D"auto">I think it would help to at least take =
this through a-full so we have a higher degree of knowledge in what breaks =
and what doesn=FFt.&nbsp;</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">I didn=FFt look at the patch in detail and won=FFt be able to for a few m=
ore days. We definitely need to understand how it affects other init system=
s, but it is totally doable, there is only a limited number of them and how=
 they handle tmp directories and what they expect from them is tractable re=
search. As long as no one expects RP to do that.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Alex</div></div><div><div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 17. Mar 2023 at 17.31, =
Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_=
k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)"><div id=3D"m_-383799=
5915579694033m_3953888058158191395geary-body" dir=3D"auto">Am Fr, 17. M=E4r=
 2023 um 11:53:17 +0000 schrieb Richard Purdie &lt;<a href=3D"mailto:richar=
d.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundat=
ion.org</a>&gt;:<br><blockquote type=3D"cite"><div style=3D"white-space:bre=
ak-spaces" dir=3D"auto">It would help me if adverse effects are mentioned i=
n commit messages.
In this case I can spot it easily enough but I don't always know/spot
all the issues.</div></blockquote><div><br></div><div><div>It would be too =
harsh to say that I don't care about sysvinit. Of course, if something brea=
ks as a result of this commit, I'm willing to take care of it if I can help=
. It's just that I don't personally use it, so I haven't identified any oth=
er issues that might be relevant to sysvinit. Other than the obvious that a=
nything that would write directly to '/var/volatile/tmp' would break.</div>=
<div>At least I checked that sysvinit images could still boot. I have succe=
ssfully run core-image-ptest-glib-2.0 with this patch applied. If I knew of=
 any problems with sysvinit I would have pointed them out, but unfortunatel=
y I have no further findings yet&nbsp;</div></div></div>
<br>
<br>
<br>
</blockquote></div></div>
</div>
</blockquote></div>
--=-JY42yY0w25ppBMhPy1MT--


