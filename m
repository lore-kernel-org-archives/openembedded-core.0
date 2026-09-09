Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE88EC79FB9
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 19:08:19 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20457.1788980894002163518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 12:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZEABlzOr;
 spf=pass (domain: gmail.com, ip: 74.125.225.140, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso6884425e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 12:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980892; x=1789585692; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fMI7Edog3/J5iq0vVg3vZOM5QTr83nxsXReoivlAxQo=;
        b=ZEABlzOrkJzbJeBPsx/zfey4lbkSyD1LXg1VUPLLEENlwRlRF21c1tfjgcq1mGsUAd
         w+GP0wQFy4eOumKKs2RuZpeTziveZw38bI+u+FYHNV+/u/UXSyck5q2R1i4ivxKEGpgz
         oYukQrPrlJwiuAQTMhmDy8dHDxVwXU4kc9z7iJPtDac5O73GCG5F4UTAIdrP1ySStES8
         VUF31II1qRGKDxYA0DyW64/rz5W9Ofd/iYtAt93CKIdUoOZvioj+boDY5ClCOJ+/UCrR
         o90VIm0VkczqJAoYQ6xYtX0A+NDf2MTtCo6AkPHGNY4Vuz20sJyzRHHfoALTeVUe9RVv
         e7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980892; x=1789585692;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fMI7Edog3/J5iq0vVg3vZOM5QTr83nxsXReoivlAxQo=;
        b=NOTV5ZG6m1d436AbjnX0xksF3PHHmuu6bnqQN7WlN++1xCvl08dl1Gp0EO+Sj+o0V5
         Yki1x15ZLyZXppQBX5NGnIyRLCwXdZxv+Pbpr+PYowYNtrLs4z34sgH/uBB+fP1cTPp+
         foAh93BdD/mSS2NGNIaTrfQUY5qCZkgFuojocmr76Mo+kBp6sXpFqkxmXe2w5geCjoJa
         4lvtuxrETacWSi8TvfXH/xob8DWQuHf2Fgd6kIHjNcLfOopaFwdM5hoHYiwBbBi571QP
         jT1YeCVP8HtjACPhTLKvkWrWBa2ReUbPH5ITK/3n4wTyPax4HT6xidvp472fus2bL0Ts
         aGTA==
X-Gm-Message-State: AFuF++kP/rEfMXXS5bK6n5/Y6oZFvCjGgrlAnLbQw7ZWMTX8NTZmVBlU
	YGXngbS7NEIIkbl4RWo9ujwCsJOWdT7pzCT7n6THJwsEBHKpZbIredDq
X-Gm-Gg: AYBFou1QfTGTJJca0G/nx3wcDWwTODBqFeLjKYcnFfn1HFZOudssGQYXwpZ+KoiTF1A
	cBgpNEzy9onHBVBKlJYL6pza/ylnM+Jq28Ij7NrZpaX3VY9twlzuLYI6XPk3t/QMM0zcuuWiX87
	M8NKPjSjQ0w+QInkMS7neuLI5JI+rCBhEuk9ftm6htzFZEwEkao+79tlpx6rMhqN5tfOJ8zB9Eb
	OOKi4TdVihzFZB/llQSjnklEkLw889DsEKg0wrek/GG5Blg5UeT2G6lNfjAAiwzwk2+XFQoikkx
	SML6B6wklXYaiuDqhznJ7EBPQSIMq8FKMmdOaedfUbdDtkCZidpH5XJ7lek8mOR6F8Wdf+mY0tA
	4orRfb0DFV4G65EFioaGibrotnkKJS9/vuMOwDQWi1dY27C4HCqXEs1oDPdO8LZaRl8Su+AgZnD
	6WeTZzorUndR9xC43Q8vD7J+h9LKXn3Q/fIRPRQgEABoN6LBkiQXwNx1DqftBWpglSeB5VoVe6V
	no/vTkSBp0uIkO+jcxQtCF0kXrMemhNS0YE2eeZiF/eTK/N
X-Received: by 2002:a05:600c:524d:b0:49d:577:532f with SMTP id 5b1f17b1804b1-49d25947ec0mr53586235e9.15.1788980891939;
        Wed, 09 Sep 2026 12:08:11 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bdbb02sm10801365e9.3.2026.09.09.12.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:08:11 -0700 (PDT)
Message-ID: <13e27d0dd254337f30ada3542eb8c785ce046c25.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] uboot-sign: keep the SPL BSS padding when
 reassembling the SPL binary
From: adrian.freihofer@gmail.com
To: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 09 Sep 2026 21:08:11 +0200
In-Reply-To: <CAA_5youCKSC_=QGGwnMAvcqXEAf1aWn=27ekMzYL_S8RdeC9Ag@mail.gmail.com>
References: <20260905224403.152831-1-ricardo.salveti@oss.qualcomm.com>
	 <ca796be26f7848304079f52c3a17f42aef210114.camel@gmail.com>
	 <CAA_5youCKSC_=QGGwnMAvcqXEAf1aWn=27ekMzYL_S8RdeC9Ag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 19:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245492

On Tue, 2026-09-08 at 17:12 -0300, Ricardo Salveti wrote:
> Hi,
>=20
> On Mon, Sep 7, 2026 at 1:28=E2=80=AFPM <adrian.freihofer@gmail.com> wrote=
:
> >=20
> > On Sat, 2026-09-05 at 22:44 +0000, Ricardo Salveti via
> > lists.openembedded.org wrote:
> > > concat_spl_dtb() rebuilds the SPL as a plain concatenation of the
> > > nodtb
> > > image and the signed device tree. U-Boot only assembles it that
> > > way
> > > with
> > > SPL_SEPARATE_BSS; otherwise BSS is part of the image and it pads
> > > between
> > > the two, so that clearing BSS cannot overwrite the appended
> > > device
> > > tree.
> > > Platforms loading the SPL as one contiguous image, such as
> > > Qualcomm
> > > SoCs,
> > > need that layout: without the padding the device tree ends up
> > > inside
> > > BSS
> > > and spl_early_init() finds none, before the console is up.
> > >=20
> > > Reassemble at the offset U-Boot used, taken from its own image as
> > > SPL_WITH_DTB_BINARY, and fall back to the current behaviour when
> > > it
> > > did
> > > not pad.
> > >=20
> > > AI-Generated: Uses Claude Code
> > > Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> > > ---
> > > =C2=A0meta/classes-recipe/uboot-sign.bbclass | 20 +++++++++++++++++++=
-
> > > =C2=A01 file changed, 19 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/classes-recipe/uboot-sign.bbclass
> > > b/meta/classes-
> > > recipe/uboot-sign.bbclass
> > > index 236d19925e..4743b86dd4 100644
> > > --- a/meta/classes-recipe/uboot-sign.bbclass
> > > +++ b/meta/classes-recipe/uboot-sign.bbclass
> > > @@ -57,6 +57,8 @@ SPL_DTB_SYMLINK ?=3D "u-boot-spl-${MACHINE}.dtb"
> > > =C2=A0SPL_NODTB_IMAGE ?=3D "u-boot-spl-nodtb-${MACHINE}-${PV}-${PR}.b=
in"
> > > =C2=A0SPL_NODTB_BINARY ?=3D "u-boot-spl-nodtb.bin"
> > > =C2=A0SPL_NODTB_SYMLINK ?=3D "u-boot-spl-nodtb-${MACHINE}.bin"
> > > +# The SPL image as assembled by U-Boot, before signing.
> > > +SPL_WITH_DTB_BINARY ?=3D "u-boot-spl-dtb.bin"
> >=20
> > This looks like a MACHINE specific variable. Should it default to
> > empty
> > string and be assigned only in machine conf files which need it?
> > And
> > then...
>=20
> The file itself exists for every configuration with an SPL device
> tree, so while it depends on the configuration used by the machine,
> it
> is generic and widely used.

To be honest, I did not look into all these details. I'm trying to
understand if this new variable can have a negative impact on other
MACHINEs. Usually the review is easy if the code looks like:

NEW_VARIABLE ?=3D ""

...

if [ -n "${NEW_VARIABLE}" ] ; then
    new opt-in feature...
fi

Sure, there's no logic or rule that says new features can always be
implemented that easily and well isolated. But we also need to prevent
from commits that potentially have a negative impact on existing
boards.

If I correctly understand your response, I do not understand that you
are 100% sure the this is 100% always right and there is no risk for
other MACHINEs. Or am I misunderstanding?

>=20
> From u-boot sources (depends on OF_REAL and OF_SEPARATE /
> OF_HOSTFILE,
> and this class already depends on OF_SEPARATE for signing support):
> https://github.com/u-boot/u-boot/blob/main/scripts/Makefile.xpl#L323
>=20
> > > =C2=A0# U-Boot fitImage description
> > > =C2=A0UBOOT_FIT_DESC ?=3D "U-Boot fitImage for
> > > ${DISTRO_NAME}/${PV}/${MACHINE}"
> > > @@ -249,7 +251,23 @@ deploy_dtb() {
> > >=20
> > > =C2=A0concat_spl_dtb() {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e "${SPL_DIR}/${SPL_NODTB_BINARY=
}" ] && [ -e
> > > "${SPL_DIR}/${SPL_DTB_BINARY}" ] ; then
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 cat ${SPL_DIR}/${SPL_NODTB_BINARY}
> > > ${SPL_DIR}/${SPL_DTB_SIGNED} > "${SPL_BINARY}"
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 # U-Boot pads behind BSS before appending the
> > > device
> > > tree
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 # ($(SPL_BIN)-pad.bin in scripts/Makefile.xpl);
> > > keep
> > > that offset.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 nodtb_size=3D$(stat -Lc %s
> > > ${SPL_DIR}/${SPL_NODTB_BINARY})
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dtb_offset=3D${nodtb_size}
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if [ -e "${SPL_DIR}/${SPL_WITH_DTB_BINARY}" ]; then
> >=20
> > ... this -e could fail fatal if the variable is non-empty string
> > and
> > the file does not exist rather than fail silently?
> >=20
> > Further, would it be less risky if all the special handling of
> > SPL_WITH_DTB_BINARY would be in the if block?
>=20
> A board that does not define OF_SEPARATE would cause issues even
> before this function is executed, but we can separate into another if
> block if preferred, something like:
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if [ -n "${SPL_WITH_DTB_BINARY}" ] ; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ ! -e "${S=
PL_DIR}/${SPL_WITH_DTB_BINARY}"
> ] ; then


I think we should not write -e in bitbake code. There are many reasons
why a file can be there by accident (e.g. previous build with different
configuration) or not there by accident (e.g. a bug that the file is
just not built). In general it's more robust if the code looks like:

if [ -n "${NEW_VARIABLE}" ] ; then
    test -e "${SPL_DIR}/${SPL_WITH_DTB_BINARY}" || bbfatal "file not
there".
    ...
fi

Regards,
Adrian

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bbfatal "${SPL_WITH_DTB_BINARY} not
> found in ${SPL_DIR}. Set SPL_WITH_DTB_BINARY to the SPL image U-Boot
> assembled, or to an empty string if it builds none."
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # U-Boot pads =
behind BSS before appending the
> device tree
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # ($(SPL_BIN)-=
pad.bin in
> scripts/Makefile.xpl); keep that offset.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image_size=3D$=
(stat -Lc %s
> ${SPL_DIR}/${SPL_WITH_DTB_BINARY})
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dtb_size=3D$(s=
tat -Lc %s
> ${SPL_DIR}/${SPL_DTB_BINARY})
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset=3D$(exp=
r ${image_size} - ${dtb_size})
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ ${offset}=
 -gt ${nodtb_size} ] ; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dtb_offset=3D${offset}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 fi
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if [ ${dtb_offset} -gt ${nodtb_size} ] ; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp ${SPL_DIR}/=
${SPL_NODTB_BINARY}
> "${SPL_BINARY}"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 truncate -s ${=
dtb_offset} "${SPL_BINARY}"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat ${SPL_DIR}=
/${SPL_DTB_SIGNED} >>
> "${SPL_BINARY}"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat ${SPL_DIR}=
/${SPL_NODTB_BINARY}
> ${SPL_DIR}/${SPL_DTB_SIGNED} > "${SPL_BINARY}"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 fi
>=20
> Let me know what you think and I can send a v2.
>=20
> Thanks,
>=20
> Ricardo

