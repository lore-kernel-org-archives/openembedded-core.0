Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09C4C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 22:37:30 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.26235.1738795046961697704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 14:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UhpbyTsS;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e42ba364f1so3192596d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 14:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738795046; x=1739399846; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B6skfooWIHnE94aLYT77MjPNZEtnNtU94/Zvxfg8/Cw=;
        b=UhpbyTsSGK38+OS6lP7C0/Y/NoFM1HpcR14BXwsy2eaC6+HFRk4Kvejhyvy5+f31nK
         YijhlezFE8Z4ywRb21kKpGLc/GznBvuhguYrxvoNWkyC1tHSsHIQw2rINeFSMfUleKFX
         mCklx0c0DxvfnOT+u7TWGtO8Zd8R7MjSdGTGL+y71wXqaIUvFwZ8MEsJAaiFKzctbUvP
         cBmyF0EkXxp+rKRuo/LF4qhZn6m+ni2FqpR39qbfUEgFgO02N8+f3HMgANeun1U2F56t
         ttx3hOOprUP8dlJhSF1iQt6KkLVXkMMCZZ47vdzRYCb5DQczdsB8b05DQkHrs6xrBcBV
         VOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738795046; x=1739399846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6skfooWIHnE94aLYT77MjPNZEtnNtU94/Zvxfg8/Cw=;
        b=fy9ogfRhbCree3e+YXxQuc61Azp9wJWASC8ny6iyNUZDpnJUebzf9l1dVkcyJH2jsV
         UjwoBP8CjTGUAD/1ND+A8kCnLpmSF8LZuCCSNArV89OedODDmy+ZyfmrU1I8xvTC0ZqG
         U4EievEIs/skPJvd6PwEcyM04cV/yxAoabQ+IFlQoHBrOTFQN/qhLV3nfRz2QY/nOQNn
         BJ/Y0LWJLI9yI9zY8ImMpwsj8ako1yhTUFlK16nmScscQwrP0dPyo71/HEs9sKiCw0Pg
         3tyrO22ri0i48J7jRx9C3UfRHlfE4/Hxuji2K7XPKkFvjjUwf8vb5DtO9Kfbo83MJ95J
         d7Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWgvBElFOxauFABXhFRZzagok4YD0SV9nQmiiLO0r+xt5P9h+SLvDOpKxda5RlIY/BTnUf4MNQ2JImhmV/fAkv1Ww==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQpfcm1Ms5sHril6t66MsEFQxx7jO6UHFd/5eB3y7t395ad6q/
	9rH9nzgHivXhEUAeLEEw6N2FgUmCqpvFQeIWFUH4Eh2/l6/qD8cNRTw1p1jkhSH8vB3Zs/gFrLw
	F5UoetSR68CIlm88BzMTl6z3jeHc=
X-Gm-Gg: ASbGncuaw6WCTmj3lr+s+QkzMhMC6l8RS3pUAxsfkl8rA8hFH/QACt1zTRzOui0jY/F
	WtGiT1MWtYm9BIW/T0xKOiHFLyZWAA3bOPbwriPpotQ0dwAGaNTnrjH2irQwAEX/ear9Y9XJKdw
	bKa4CtI9vwtAQBEREgreBRhxWvS0k=
X-Google-Smtp-Source: AGHT+IFr89J2w+dhOwG2rXN1mcSt0ZvQwhe2SXOy2OJhecsDKjGaX8HdWqIzNvgghstWXd9UFhZ2NrmHZfie1I1NOxQ=
X-Received: by 2002:a05:6214:5d06:b0:6e2:43d1:5fed with SMTP id
 6a1803df08f44-6e42fc4d90emr67900986d6.39.1738795045925; Wed, 05 Feb 2025
 14:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20250205212427.2044310-1-JPEWhacker@gmail.com>
 <CANNYZj9Ca6cQcFcb_moABSKX5=HtdRAzvL_ayyCg2cnkuEKcqw@mail.gmail.com>
 <CAJdd5Ga3VU_CW_Dw2TTacOEsACgMJE9i4SnVo4mrZ=tGMwc95A@mail.gmail.com> <1821704A9FA6415C.752@lists.openembedded.org>
In-Reply-To: <1821704A9FA6415C.752@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Feb 2025 23:37:15 +0100
X-Gm-Features: AWEUYZlGJAdoDZT9-o3t9XxuI6FS-yWndo5_k_ranrq8c7jym92MmgFFJ7y_JH4
Message-ID: <CANNYZj-+4QBtgpvQLUEJ1qvqbqgQHQO4fQBC7eE79X7-mjaa1g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Include fragments before local.conf
To: alex.kanavin@gmail.com
Cc: Joshua Watt <jpewhacker@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000cbc3b062d6cc584"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 22:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210883

--0000000000000cbc3b062d6cc584
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Btw the other option for overriding fragments would be to use direct
require statement with a path to them in local.conf, followed by tweaks.
It=E2=80=99s not too horrible. And using a fragment variable can then be se=
en as
=E2=80=98immutable=E2=80=99 fragment enabling which could be beneficial pre=
cisely because
users can=E2=80=99t mess with it.

Alex

On Wed 5. Feb 2025 at 23.26, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> One could conceivably want to ship a local.conf.sample template with
> fragments already enabled in it, or hand edit local.conf to enable
> something via fragment. We can=E2=80=99t force users to use fragment tool=
ing.
>
> It would be equally surprising to find out that setting fragments this wa=
y
> doesn=E2=80=99t actually have any effect.
>
> I understand your argument, it=E2=80=99s just that we=E2=80=99ve taken th=
e least worst
> option. Consider fragments as extensions of distro and machine
> configurations - both come after local.conf and can=E2=80=99t be tweaked =
from it.
>
> Alex
>
> On Wed 5. Feb 2025 at 22.55, Joshua Watt <jpewhacker@gmail.com> wrote:
>
>> On Wed, Feb 5, 2025 at 2:36=E2=80=AFPM Alexander Kanavin <alex.kanavin@g=
mail.com>
>> wrote:
>> >
>> > We have discussed this before. With this change, users will no longer
>> be able to set fragments from local.conf, as addfragments would be
>> processed before that file. You need to use ?=3D in fragments instead fo=
r
>> things that are meant to be overridden.
>>
>> Is there need to set fragments from local.conf? IMHO, not being able
>> to override a fragment in local.conf is "surprising" behavior, and I
>> don't think it's going to necessarily be possible to alway use ?=3D in a
>> fragment; all of the ad-hoc "fragment" management systems I've used
>> before have allowed local.conf to be the final source of truth, so it
>> will also make migration to use config fragments harder if they don't
>> follow suite.
>>
>> Anyway, maybe some other users of "fragment" like systems can chime in
>> if they have an opinion.
>>
>> >
>> > Alex
>> >
>> > On Wed 5. Feb 2025 at 22.24, Joshua Watt <jpewhacker@gmail.com> wrote:
>> >>
>> >> Per some usability assessment and offline discussion, one of the usef=
ul
>> >> use cases of config fragments is that they allow the "default"
>> >> configuration for some device to be committed to source control and
>> >> easily selected and used by the end users. However, when doing this,
>> >> there is still the desire that the user can "override" the provided
>> >> fragments for their local builds in local.conf
>> >>
>> >> As a practical example, the configuration for a product can be captur=
e
>> >> as a config fragment, and an empty local.conf will reproduce the
>> >> standard build for the product. If the user wants to make "tweaks" to
>> >> the standard build, they can do so in local.conf
>> >>
>> >> As such, move the config fragments to be loaded before local.conf
>> >>
>> >> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> >> ---
>> >>  meta/conf/bitbake.conf | 3 ++-
>> >>  1 file changed, 2 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> >> index 8b607088c6e..d0154044f5a 100644
>> >> --- a/meta/conf/bitbake.conf
>> >> +++ b/meta/conf/bitbake.conf
>> >> @@ -826,12 +826,13 @@ FILESOVERRIDES =3D
>> "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDE
>> >>  require conf/abi_version.conf
>> >>  include conf/site.conf
>> >>  include conf/auto.conf
>> >> -include conf/local.conf
>> >>
>> >>  OE_FRAGMENTS_PREFIX ?=3D "conf/fragments"
>> >>  OE_FRAGMENTS_METADATA_VARS ?=3D "BB_CONF_FRAGMENT_SUMMARY
>> BB_CONF_FRAGMENT_DESCRIPTION"
>> >>  addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS
>> OE_FRAGMENTS_METADATA_VARS
>> >>
>> >> +include conf/local.conf
>> >> +
>> >>  require ${@"conf/multiconfig/${BB_CURRENT_MC}.conf" if
>> "${BB_CURRENT_MC}" !=3D "" else ""}
>> >>  include conf/machine/${MACHINE}.conf
>> >>  include conf/machine-sdk/${SDKMACHINE}.conf
>> >> --
>> >> 2.47.1
>> >>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210881):
> https://lists.openembedded.org/g/openembedded-core/message/210881
> Mute This Topic: https://lists.openembedded.org/mt/111021218/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000cbc3b062d6cc584
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Btw the other option for overriding fragments would be to=
 use direct require statement with a path to them in local.conf, followed b=
y tweaks. It=E2=80=99s not too horrible. And using a fragment variable can =
then be seen as =E2=80=98immutable=E2=80=99 fragment enabling which could b=
e beneficial precisely because users can=E2=80=99t mess with it.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed 5. Feb 2025 at 23.26, Alexander Kanavin via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mai=
lto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)"><div dir=3D"auto">One could conceivabl=
y want to ship a local.conf.sample template with fragments already enabled =
in it, or hand edit local.conf to enable something via fragment. We can=E2=
=80=99t force users to use fragment tooling.=C2=A0</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">It would be equally surprising to find out that =
setting fragments this way doesn=E2=80=99t actually have any effect.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">I understand your argument, it=
=E2=80=99s just that we=E2=80=99ve taken the least worst option. Consider f=
ragments as extensions of distro and machine configurations - both come aft=
er local.conf and can=E2=80=99t be tweaked from it.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed 5. Feb 2025 at 22.55, Joshua Wa=
tt &lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker=
@gmail.com</a>&gt; wrote:<br></div></div></div><div><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-col=
or:rgb(204,204,204)">On Wed, Feb 5, 2025 at 2:36=E2=80=AFPM Alexander Kanav=
in &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kan=
avin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; We have discussed this before. With this change, users will no longer =
be able to set fragments from local.conf, as addfragments would be processe=
d before that file. You need to use ?=3D in fragments instead for things th=
at are meant to be overridden.<br>
<br>
Is there need to set fragments from local.conf? IMHO, not being able<br>
to override a fragment in local.conf is &quot;surprising&quot; behavior, an=
d I<br>
don&#39;t think it&#39;s going to necessarily be possible to alway use ?=3D=
 in a<br>
fragment; all of the ad-hoc &quot;fragment&quot; management systems I&#39;v=
e used<br>
before have allowed local.conf to be the final source of truth, so it<br>
will also make migration to use config fragments harder if they don&#39;t<b=
r>
follow suite.<br>
<br>
Anyway, maybe some other users of &quot;fragment&quot; like systems can chi=
me in<br>
if they have an opinion.<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Wed 5. Feb 2025 at 22.24, Joshua Watt &lt;<a href=3D"mailto:jpewhac=
ker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Per some usability assessment and offline discussion, one of the u=
seful<br>
&gt;&gt; use cases of config fragments is that they allow the &quot;default=
&quot;<br>
&gt;&gt; configuration for some device to be committed to source control an=
d<br>
&gt;&gt; easily selected and used by the end users. However, when doing thi=
s,<br>
&gt;&gt; there is still the desire that the user can &quot;override&quot; t=
he provided<br>
&gt;&gt; fragments for their local builds in local.conf<br>
&gt;&gt;<br>
&gt;&gt; As a practical example, the configuration for a product can be cap=
ture<br>
&gt;&gt; as a config fragment, and an empty local.conf will reproduce the<b=
r>
&gt;&gt; standard build for the product. If the user wants to make &quot;tw=
eaks&quot; to<br>
&gt;&gt; the standard build, they can do so in local.conf<br>
&gt;&gt;<br>
&gt;&gt; As such, move the config fragments to be loaded before local.conf<=
br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.=
com" target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/conf/bitbake.conf | 3 ++-<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt;&gt; index 8b607088c6e..d0154044f5a 100644<br>
&gt;&gt; --- a/meta/conf/bitbake.conf<br>
&gt;&gt; +++ b/meta/conf/bitbake.conf<br>
&gt;&gt; @@ -826,12 +826,13 @@ FILESOVERRIDES =3D &quot;${TRANSLATED_TARGET=
_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDE<br>
&gt;&gt;=C2=A0 require conf/abi_version.conf<br>
&gt;&gt;=C2=A0 include conf/site.conf<br>
&gt;&gt;=C2=A0 include conf/auto.conf<br>
&gt;&gt; -include conf/local.conf<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 OE_FRAGMENTS_PREFIX ?=3D &quot;conf/fragments&quot;<br>
&gt;&gt;=C2=A0 OE_FRAGMENTS_METADATA_VARS ?=3D &quot;BB_CONF_FRAGMENT_SUMMA=
RY BB_CONF_FRAGMENT_DESCRIPTION&quot;<br>
&gt;&gt;=C2=A0 addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENT=
S_METADATA_VARS<br>
&gt;&gt;<br>
&gt;&gt; +include conf/local.conf<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 require ${@&quot;conf/multiconfig/${BB_CURRENT_MC}.conf&quot=
; if &quot;${BB_CURRENT_MC}&quot; !=3D &quot;&quot; else &quot;&quot;}<br>
&gt;&gt;=C2=A0 include conf/machine/${MACHINE}.conf<br>
&gt;&gt;=C2=A0 include conf/machine-sdk/${SDKMACHINE}.conf<br>
&gt;&gt; --<br>
&gt;&gt; 2.47.1<br>
&gt;&gt;<br>
</blockquote></div></div><div><div class=3D"gmail_quote"></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210881): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210881" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/210881</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111021218/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111021218/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000cbc3b062d6cc584--

