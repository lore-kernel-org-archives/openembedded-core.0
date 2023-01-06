Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C53C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 09:20:09 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.10133.1672996799348752956
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 01:19:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=amZgDd7T;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id q2so909269ljp.6
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 01:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdL75anCkXlLFaU/hc/FuyGu1r8tjrVs4ZM8Hnyp86A=;
        b=amZgDd7TGNASQdOuFkiOtwqQgiLRnlrwyIs8qiwdi0yWC95Z2ZHJEHdoK+4oFx2oA/
         4c4Qw+txcoIZFe/WEcNwjTwlgMJAKkEDWR3z3rWiMmlh9cB6TxawBx36C3vxhJUTaPIZ
         C8S+NWLIB3vIJzrPApyb6ytaikVaDMnFzEaoOTzlqOqjCaoIY/ID32ksYgSOACZEB/5Q
         1zuQ2TQJFFV2xMadYZhUaFhEBWKVRMCNaPD06KTjifx1nu1LU7PolO5BrDKNuSatXaT8
         asPSZ3d288MMdc55mT8m/+AaopHwtN0SgUTd51A4AmDm42kAcP2ujGwzvVsbX/Q+J9OE
         1PDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdL75anCkXlLFaU/hc/FuyGu1r8tjrVs4ZM8Hnyp86A=;
        b=v1bUCGYLyu1O2y+KGbAPUd0hC5bN0zDGTxZNf9tv5DMVYY0Jl9xkbe34kBiL3gau//
         xIDgpwcd40vtlTt9SR6TqK+/ianipyzRjS2EgolZpnRqTl2dw+I5qvPoUaF4Ka6CajXt
         smHh/szkGfagzdZ4xjz3ZtW03cVkoPtXgr0wcUVrS57BvExnajGmMQI9YPXOdwV5O8WJ
         s4vQhTh3lC3txfzMvWk+swuI7BAqW3zvFlTSsZT5t/y8Zg4pKJBLAkOfWRNOFXiOhlrg
         VDanF2vpXmUifZP5NI2PJ87SIPh9bXJUGiTHx1yS/1QE32BgAmRfisNkh1ljPjjbHIMM
         KhLQ==
X-Gm-Message-State: AFqh2kpzn78nlQTlk/oxRsOS1owyUlwlQAOhRjwwDJTfOOIvihsXXfxh
	BXcoMDOjpy3ngEKbgcRldWF1uRvic2nnHxwoS46HFpC/
X-Google-Smtp-Source: AMrXdXsEczIFhfQArK48Gtkv8fzI3OV/9NWITXpDp/ZXYOrEeLwUv5kI6Gu42SUrQ9qcLkmDpSHXLbfilDTYbXBauuU=
X-Received: by 2002:a2e:9d4f:0:b0:27f:f286:15e9 with SMTP id
 y15-20020a2e9d4f000000b0027ff28615e9mr1277519ljj.403.1672996797063; Fri, 06
 Jan 2023 01:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20221223093229.823322-1-mingli.yu@eng.windriver.com>
 <CANNYZj-iY82hN76qV6DZSfMHobF30hM7rKRXkVwFUYGDV1AkJw@mail.gmail.com>
 <CO1PR11MB50090C2DFF0949D0B90ED483F1FA9@CO1PR11MB5009.namprd11.prod.outlook.com>
 <CANNYZj9GAPNapBr3PyxAmj-JaiGRV=EnR1YqZnPXA5Yuf+_02A@mail.gmail.com> <CO1PR11MB5009A23CA03A78D7FB67DA2EF1FB9@CO1PR11MB5009.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB5009A23CA03A78D7FB67DA2EF1FB9@CO1PR11MB5009.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jan 2023 10:19:45 +0100
Message-ID: <CANNYZj-BCH5XkMMcYMQSAdKSk-YGYLf5xk-pBbt6ekC6qPaa3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <Mingli.Yu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 09:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175567

I understand where it comes from, and that's not what I'm trying to
express. Why do we need to insert those REQUIRED_DISTRO_FEATURES lines
into every recipe that, directly, or indirectly depends on an opengl
implementation, even when the component itself uses nothing from the
opengl stack?

With gtk4 becoming one of those items, this really does become a
maintenance burden.

What would happen if we instead drop them all, and keep
REQUIRED_DISTRO_FEATURES only in the opengl provider itself, which
would be mesa?

Alex

On Fri, 6 Jan 2023 at 10:11, Yu, Mingli <Mingli.Yu@windriver.com> wrote:
>
> Hi Alex,
>
> The gtk4 depends on libepoxy [1] which needs opengl  DISTRO_FEATURES and =
it makes gtk4 require opengl  DISTRO_FEATURES too. And it also introduces t=
he opengl DISTRO_FEATURES requirements for other recipes which depend on gt=
k4, please help to check.
>
>
> [1] https://git.openembedded.org/openembedded-core/tree/meta/recipes-grap=
hics/libepoxy/libepoxy_1.5.10.bb
>
> Thanks,
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Thursday, January 5, 2023 14:55
> To: Yu, Mingli <Mingli.Yu@windriver.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURE=
S
>
> CAUTION: This email comes from a non Wind River email account!
>
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
> But does this mean we now have to insert required distro features stateme=
nt into everything that depends on gtk4? That doesn=E2=80=99t seem useful; =
it should be enough to say that only in the recipe where the requirement or=
iginates.
>
> Alex
>
> On Thu 5. Jan 2023 at 3.10, Yu, Mingli <Mingli.Yu@windriver.com> wrote:
>
> Hi Alex,
>
> Yes,  The setting REQUIRED_DISTRO_FEATURES =3D "opengl" is in gtk4 recipe=
. Apart from that, gtk4 depends on libepoxy which also needs opengl distro.
>
> Thanks,
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Friday, December 23, 2022 17:43
> To: Yu, Mingli <Mingli.Yu@windriver.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURE=
S
>
> CAUTION: This email comes from a non Wind River email account!
>
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
> Is OpenGL really mandatory for gtk4?
>
> Alex
>
> On Fri 23. Dec 2022 at 10.32, Yu, Mingli <mingli.yu@eng.windriver.com> wr=
ote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fixes:
>   $ bitbake gcr
>   ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/oe-core/meta/recipes-=
gnome/gcr/gcr_4.0.0.bb DEPENDS on or otherwise requires it)
> gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO=
_FEATURES)
>   ERROR: Required build target 'gcr' has no buildable providers.
>   Missing or unbuildable dependency chain was: ['gcr', 'gtk4']
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-gnome/gcr/gcr_4.0.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb b/meta/recipes-gnome/gcr=
/gcr_4.0.0.bb
> index 264069ffd1..22edd386fc 100644
> --- a/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> +++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> @@ -20,6 +20,8 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
>  inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-versi=
on-is-even vala gobject-introspection gettext mime mime-xdg
>  UPSTREAM_CHECK_REGEX =3D "gcr-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
>
> +REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x=
11', 'opengl', '', d)}"
> +
>  SRC_URI +=3D "file://0001-meson.build-correctly-handle-disabled-ssh_agen=
t-opti.patch"
>  SRC_URI[archive.sha256sum] =3D "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9=
864341c0161e171173dcec7c"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174976): https://lists.openembedded.org/g/openembedde=
d-core/message/174976
> Mute This Topic: https://lists.openembedded.org/mt/95842308/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

