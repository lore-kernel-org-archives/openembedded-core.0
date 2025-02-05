Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F54C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 22:26:40 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.26153.1738794396721987453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 14:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MhDgE+kJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e4277e4791so1948536d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 14:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794396; x=1739399196; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sxlb4Uli5GnKaS1IK3Fg44t6QgLWu4N0g9ynmGvQCWI=;
        b=MhDgE+kJw4PyJZ+kC9edfEK1W4k8dt7PfuXiqjXo4ZJwLk81KiTLhJrX4/ARe+3WNg
         oSFFTeoSSwWsq28iuxu0TvhtF2Oq5PAo3DIsNAYR8Vo6QPDtzWmjdnDHR4VF0DwyshY3
         TWoZIs08+z9ag8AMidk+Vb1Ys0sosY7FPJEXn4Qiw6sudJhSxtw1QVgNbiJ0zV11aEi6
         NnXf+RjiZX1/8BNnMFG8jdCS0O8x7XuWLxX/os0rDi5PPihhtUljgv7sAvvt6kRYHLS1
         tPkw9SZbfrYaNG6RydDOoCUAQjx6TYCdPV4/pU0pzZA2gnvnc2un0hb2E2njGPSdfrYo
         sgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794396; x=1739399196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxlb4Uli5GnKaS1IK3Fg44t6QgLWu4N0g9ynmGvQCWI=;
        b=Hl3d1Jie7UaLFlOzVax9uXFxxQ5mNllTw4G2QTS529qvuXCcXOGWVr8+19m1QEGsbi
         9NNOrNC/UkcX6vL0CFonIeBN8Ll6q0Xi1Xr6T7i5zmgG4Swtf2hd3oT5cvhXUXlvO3pN
         8CgdTXhLC3xw5rndY5hZtA6CIr03sHTfISDUnODCfpGpIhkRvnO8fS4BR1ijnyyRzqes
         azoYmF/qBcpZPx82jFQFeeMu/mAJHKdFoS+Ts3aw9SgwZ0fYeIUGG1foW1lEtDazsacZ
         B65zx6QXD24qiGrkzvQXKGSZTe5/6ab6bXHJwtEvBsOW6EMlFuK+kDYccj0YU8z+sDbW
         cwgw==
X-Gm-Message-State: AOJu0Yy4BJkA/0/1b1zCrk0FCwwnd9pnAtUOXz+8/JFOHvkSJhZs8qYU
	O8xsfglV/zGFEzy0594fsg9NOnX08n5MQeKkWH+3m+Iv+WpqLI7Fc2HEX2OFtaeRbfFJcUB7R+I
	dx0uFuOeAVnK+ZVKFRd7cqu1TaZA=
X-Gm-Gg: ASbGncsKKJ/x5llxvleVh7S8o578WhqrJy7EEFsQ/SfFQSa/ojDuP/gfYvTGUWKZoMb
	uUymAfiB05HJvZ/4/kabDftTdQwPCsiMK6vjAZM4FIQ5d02LH21KekalkEMOrWEngIN5344cupx
	sOpVuv3yZS7jPvOA+AAQqZsFdj0DQ=
X-Google-Smtp-Source: AGHT+IFgvkNIyT5kYRvsr388Sv1CAVpf0QHUQmPL9vKEvLtA5WpxwbfrfNcv5Qo2O9pNOCPM5bD0xAdufdp2Uf3Sur4=
X-Received: by 2002:a05:6214:4a89:b0:6d9:2e46:dc35 with SMTP id
 6a1803df08f44-6e42fc05f31mr80931626d6.25.1738794395673; Wed, 05 Feb 2025
 14:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20250205212427.2044310-1-JPEWhacker@gmail.com>
 <CANNYZj9Ca6cQcFcb_moABSKX5=HtdRAzvL_ayyCg2cnkuEKcqw@mail.gmail.com> <CAJdd5Ga3VU_CW_Dw2TTacOEsACgMJE9i4SnVo4mrZ=tGMwc95A@mail.gmail.com>
In-Reply-To: <CAJdd5Ga3VU_CW_Dw2TTacOEsACgMJE9i4SnVo4mrZ=tGMwc95A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Feb 2025 23:26:25 +0100
X-Gm-Features: AWEUYZnGeWyQHyklHtHxaToQPECQUoSvt-_XPQTgPA1nIXr0MWjcr1Zq0EAW0sU
Message-ID: <CANNYZj-OZGfU8m-CG=M_tD50hcbzJyyyhopML61r44KFBEJ93g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Include fragments before local.conf
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004aa956062d6c9ec7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 22:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210881

--0000000000004aa956062d6c9ec7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One could conceivably want to ship a local.conf.sample template with
fragments already enabled in it, or hand edit local.conf to enable
something via fragment. We can=E2=80=99t force users to use fragment toolin=
g.

It would be equally surprising to find out that setting fragments this way
doesn=E2=80=99t actually have any effect.

I understand your argument, it=E2=80=99s just that we=E2=80=99ve taken the =
least worst
option. Consider fragments as extensions of distro and machine
configurations - both come after local.conf and can=E2=80=99t be tweaked fr=
om it.

Alex

On Wed 5. Feb 2025 at 22.55, Joshua Watt <jpewhacker@gmail.com> wrote:

> On Wed, Feb 5, 2025 at 2:36=E2=80=AFPM Alexander Kanavin <alex.kanavin@gm=
ail.com>
> wrote:
> >
> > We have discussed this before. With this change, users will no longer b=
e
> able to set fragments from local.conf, as addfragments would be processed
> before that file. You need to use ?=3D in fragments instead for things th=
at
> are meant to be overridden.
>
> Is there need to set fragments from local.conf? IMHO, not being able
> to override a fragment in local.conf is "surprising" behavior, and I
> don't think it's going to necessarily be possible to alway use ?=3D in a
> fragment; all of the ad-hoc "fragment" management systems I've used
> before have allowed local.conf to be the final source of truth, so it
> will also make migration to use config fragments harder if they don't
> follow suite.
>
> Anyway, maybe some other users of "fragment" like systems can chime in
> if they have an opinion.
>
> >
> > Alex
> >
> > On Wed 5. Feb 2025 at 22.24, Joshua Watt <jpewhacker@gmail.com> wrote:
> >>
> >> Per some usability assessment and offline discussion, one of the usefu=
l
> >> use cases of config fragments is that they allow the "default"
> >> configuration for some device to be committed to source control and
> >> easily selected and used by the end users. However, when doing this,
> >> there is still the desire that the user can "override" the provided
> >> fragments for their local builds in local.conf
> >>
> >> As a practical example, the configuration for a product can be capture
> >> as a config fragment, and an empty local.conf will reproduce the
> >> standard build for the product. If the user wants to make "tweaks" to
> >> the standard build, they can do so in local.conf
> >>
> >> As such, move the config fragments to be loaded before local.conf
> >>
> >> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> >> ---
> >>  meta/conf/bitbake.conf | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >> index 8b607088c6e..d0154044f5a 100644
> >> --- a/meta/conf/bitbake.conf
> >> +++ b/meta/conf/bitbake.conf
> >> @@ -826,12 +826,13 @@ FILESOVERRIDES =3D
> "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDE
> >>  require conf/abi_version.conf
> >>  include conf/site.conf
> >>  include conf/auto.conf
> >> -include conf/local.conf
> >>
> >>  OE_FRAGMENTS_PREFIX ?=3D "conf/fragments"
> >>  OE_FRAGMENTS_METADATA_VARS ?=3D "BB_CONF_FRAGMENT_SUMMARY
> BB_CONF_FRAGMENT_DESCRIPTION"
> >>  addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS
> OE_FRAGMENTS_METADATA_VARS
> >>
> >> +include conf/local.conf
> >> +
> >>  require ${@"conf/multiconfig/${BB_CURRENT_MC}.conf" if
> "${BB_CURRENT_MC}" !=3D "" else ""}
> >>  include conf/machine/${MACHINE}.conf
> >>  include conf/machine-sdk/${SDKMACHINE}.conf
> >> --
> >> 2.47.1
> >>
>

--0000000000004aa956062d6c9ec7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">One could conceivably want to ship a local.conf.sample te=
mplate with fragments already enabled in it, or hand edit local.conf to ena=
ble something via fragment. We can=E2=80=99t force users to use fragment to=
oling.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">It would be=
 equally surprising to find out that setting fragments this way doesn=E2=80=
=99t actually have any effect.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">I understand your argument, it=E2=80=99s just that we=E2=80=99ve tak=
en the least worst option. Consider fragments as extensions of distro and m=
achine configurations - both come after local.conf and can=E2=80=99t be twe=
aked from it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div>=
<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed 5. Feb 2025 at 22.55, Joshua Watt &lt;<a href=
=3D"mailto:jpewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-colo=
r:rgb(204,204,204)">On Wed, Feb 5, 2025 at 2:36=E2=80=AFPM Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kana=
vin@gmail.com</a>&gt; wrote:<br>
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
</blockquote></div></div>

--0000000000004aa956062d6c9ec7--

