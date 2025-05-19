Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D5DC3ABDD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 16:54:54 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.269.1747673688036284302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 09:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KwUZ8W3R;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2e41064e247so1120503fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 09:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747673687; x=1748278487; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx6x2Jhh4mHlqtSKOPSqZA/VTTL3Vspup5su73Rdgew=;
        b=KwUZ8W3RowletRw1YRyp93Ybjiph+qAICVcuNeEtgFBlYUeMFxgnctR36o05oR03iB
         0MU9L4+zXdk5Rqz4fxvwMpeHxYkiiThRd9Wvo3liytNutXA//Qg+ttJWLJsjbNPFSgjf
         /0NrYOtSbGgVx7T4WsVW02ym6IpnpfWB35hi8jLhQ+a56niwqQSHOWt1Wqi9R9LwZws+
         gdr3zmlxFg8oWXEWxNhdwCaU6PlWtuh9Gzgq3ifJS491ME8rRhoI00dAcFiDw5mxe6V/
         BAGDnSiE/NNVSGgAAUhVGAslYQ6aYlCKE4agL0n3xzYTfEr7URfyHewwUH+jZHJpNR77
         P2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747673687; x=1748278487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dx6x2Jhh4mHlqtSKOPSqZA/VTTL3Vspup5su73Rdgew=;
        b=wgiWONosf3kGh9TDGWsp/+a0iyUUQZlbsjLoAdUxFG1OHbjKN7uHad+TnlYZAqAsFz
         lkYVgYLDZNLSBdRVPx8JpCkDWCza71dj8Q8HwaH63y6d9cKhklRbTcrwEgYLjjxP0A/5
         7qeEfu99d0EwD//3JXdPy2pg7QsNNhLJ4RwARWoc9ABQ3DgU0f+WrJKaz4ysKNiHaQF1
         2dq5WzkIwi4UGwObTBZg2bbVFAqpE6jVTz1a2/4KiDDqQy7iYrK0TUYcFwAaO1R0KEA5
         gpIfUtYgPkVkDWzZdeQ/iHfzPqddDrCqtVqfeo3v1YhJgoHSSIho+i1apiOOW85OEl73
         Z+Ng==
X-Gm-Message-State: AOJu0Yz/eM6eE2px7vP5w/kcVge+8oh5oDpsjZfkvtob+m57cxY/15VN
	cIE5Sl3ctgczzs2HxhO/fxvTgQF1T9JSITAFX6dupmIjmHlhprb+ixXE9BjfaXAsntuOQ+RjKLo
	cdplegrkFajcPY3+Ff+KyX1AO8t6DDdQ=
X-Gm-Gg: ASbGncs917L9+OzL43F7mCXFFABeBDhWiBmo/4VPOyxIKGgP2THCzhzGcsxKoOFJIcI
	44KZM3Uf14qR5lrt92MUiXZ50gl9pPJ+QN/sMlvPQWey/vZwkrDhwYHAVJdWOsae+NydE+b9wqJ
	R6KMRB3v3tNE//RtAO/GWPsQMMc2IePJOc
X-Google-Smtp-Source: AGHT+IFBNXyVoh6jR8VAXslG/Oskfx2i81ojT2xzkduyGlbyLONyimkFRY0UqhqP8WShlQ4+Y5w1dqWszy8AmaHPoqA=
X-Received: by 2002:a05:6871:3a21:b0:2d4:d9d6:c8cf with SMTP id
 586e51a60fabf-2e3c1b7060dmr8480539fac.5.1747673686960; Mon, 19 May 2025
 09:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250517212855.349153-1-raj.khem@gmail.com> <CAJdd5GZ4QcX_PgdKCQBPh5--7=4vMjwr4PP2o+X2XzVbyBVntg@mail.gmail.com>
In-Reply-To: <CAJdd5GZ4QcX_PgdKCQBPh5--7=4vMjwr4PP2o+X2XzVbyBVntg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 May 2025 09:54:21 -0700
X-Gm-Features: AX0GCFuFFkJSa3RwbO4w9LmTeXwgLt5XbDjx2iy5dUX6R_-PwNHyU1M-t8dMSHo
Message-ID: <CAMKF1sprPNPHVB6pSNvoF-Yu1JPcuOomYFK_uBoMtmA8WpHBRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Use patchelf in place of chrpath to edit rpaths
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 16:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216863

On Mon, May 19, 2025 at 9:50=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> I don't think patchelf-uninative is available if uninative is not in
> use. Probably better to DEPENDS +=3D "patchelf-native" instead
>

there was another place in rust recipe using patchelf from uninative
but this perhaps makes sense.

> On Sat, May 17, 2025 at 3:29=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > chrpath has limitations e.g. the original rpath in ELF have to bigger i=
n size
> > than the one being edited into it by chrpath, some toolchains do not us=
e RPATH
> > but emit the RUNPATHs into ELF files and chrpath is not able to handle =
the
> > runpaths, this is the case with mips and pp32 build of rust, especially
> > when using clang compiler to build them.
> >
> > patchelf can do more:
> >
> > Modify RUNPATH entries
> > Add RPATH/RUNPATH where none existed
> > Set longer paths than the original
> > Convert between RPATH and RUNPATH
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/rust/rust_1.85.1.bb | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/rust/rust_1.85.1.bb b/meta/recipes-d=
evtools/rust/rust_1.85.1.bb
> > index dc4f5648552..3b7226ae408 100644
> > --- a/meta/recipes-devtools/rust/rust_1.85.1.bb
> > +++ b/meta/recipes-devtools/rust/rust_1.85.1.bb
> > @@ -207,9 +207,9 @@ rust_runx () {
> >          mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
> >          cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH=
}
> >          if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
> > -            chrpath -r \$ORIGIN/../../../../../`basename ${STAGING_DIR=
_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
> > +            patchelf-uninative --set-rpath \$ORIGIN/../../../../../`ba=
sename ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
> >          else
> > -            chrpath -d ${RUST_ALTERNATE_EXE_PATH}
> > +            patchelf-uninative --remove-rpath ${RUST_ALTERNATE_EXE_PAT=
H}
> >          fi
> >      fi
> >
> > @@ -266,7 +266,7 @@ rust_do_install:class-nativesdk() {
> >      install -d ${D}${bindir}
> >      for i in cargo-clippy clippy-driver rustfmt; do
> >          cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/relea=
se/$i ${D}${bindir}
> > -        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
> > +        patchelf-uninative --set-rpath "\$ORIGIN/../lib" ${D}${bindir}=
/$i
> >      done
> >
> >      chown root:root ${D}/ -R
> > @@ -301,7 +301,7 @@ rust_do_install:class-target() {
> >      install -d ${D}${bindir}
> >      for i in ${EXTRA_TOOLS}; do
> >          cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/relea=
se/$i ${D}${bindir}
> > -        chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
> > +        patchelf-uninative --set-rpath "\$ORIGIN/../lib" ${D}${bindir}=
/$i
> >      done
> >
> >      install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#216772): https://lists.openembedded.org/g/openembed=
ded-core/message/216772
> > Mute This Topic: https://lists.openembedded.org/mt/113168136/3616693
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
JPEWhacker@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

