Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D60C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 08:21:19 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2872.1788423328036553775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 01:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@exein.io header.s=google header.b=j0nsfG9Z;
 spf=pass (domain: exein.io, ip: 209.85.218.46, mailfrom: thomas@exein.io)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c25fbcf5d44so27854566b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 01:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788423326; cv=none;
        d=google.com; s=arc-20260327;
        b=Dh7Yt8vPJmH4y0bo5AselXwA2CyFQv1tRAWM8tVdrs4HSnuRfhzkqvlpfEDKMOlmOu
         iI7NMOYoWziTZEJNeSNtn/1qVpc/OFPluJPuNIbWiWvP0duB3WWUZO4moqADzE+yIB/g
         cPUSE1WaXXLUDtxTN5j29/ayffUickO0k6Dg64Ly++rOAD5i5p8iL8SkvhidDHRAxrxW
         IdASKTNeWZ3aCB71RnnsSCnm3QAbjG7qaWgXioMfkBHHh9p8btKz4sz4IT2Y2ZwtBqyR
         H3rIcruyKY5z+9DBctsaUVfbHL4xshB+HhUb6RW+4hiBjyqA16fbs5TJIPaFvEHRGc8L
         fasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sTUHFdM9KCeCgp1x1M+AP5uG8HTuZeLvxHuweo2eGgg=;
        fh=E22hnrDeFOhblX6O88lo3ne3xDOhxPQXcBK1pwgmqrY=;
        b=XR/ohcjVlwAvxpyTYiBEJ0ow7hOAzi0DJ+TKm3F36utLy0zFdzllrErTirxftfLgko
         NrAhQddDp30oXa9FnvOe4LKQpNGdhfX0u5kvs3GjBaauCax193v1yw8rdg9X+BV+Z/rP
         Hu7gCsHLiQcCiFS3uUZcbZaRL3ibm8Ur4UeC238pM6WUkJNWFWHk/TQhS1KYDC7EOi2N
         pk67Jwv5YlFeFRgbFRA2NfglAM7PI+6gUwwIpHS1gkqMy+Irh/fOMPAYY4Qeh/yYchmM
         J9d4Cn8TBNlj+Qpe8rB/h69qn+0KXVYnEDupOFnG/L1Gn5HIYHM9ZvidNdSWsKMtTgBq
         X54w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exein.io; s=google; t=1788423326; x=1789028126; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTUHFdM9KCeCgp1x1M+AP5uG8HTuZeLvxHuweo2eGgg=;
        b=j0nsfG9ZR3M5i6V6/mO5rLeGoQXNeg2bSgIDfa1Q9yL0QrRn/9G6b5xQYR2uJJ3JZ5
         eo0yxWOgdQ0kfMdM4CZHe00hALPw2WX8063M5EAqeydUvYqKmBaQQY4METhbSqh9VXov
         o+hZK0ieO9qtZsNm2sf0VZmgORQpSz8Z5fx8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423326; x=1789028126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sTUHFdM9KCeCgp1x1M+AP5uG8HTuZeLvxHuweo2eGgg=;
        b=MuuhxpGJAVAup+8rvY8NlB0lv7xvzMCdr92Qt9E5iWs+fH/lQG6CyzxiK5VVZrmhCn
         9FDJzGlP2n/oHNHz0DXsqAq6cauRelVGqxXp1xNShK5o701jNE0XDA41Z3/T/V4iTANl
         mQmk3BcIFx30i0/11QrD91GJNFwkHBBcUfj9aitM+9hv+F0P33Mjfhc3MV8YO+8xJlfg
         eaJOUk87QpTEn3UBjvX+eM8LnB8YVFOy/59kFtdA5MSqYaHTwI9zZ1q53UEX6CbjZteo
         blftSXPkGywHWZI7ulAN79g2M6zAzHR1RXWRGRqY6AGOCBpSjo6Va5gmZ2IoHRAluFuI
         E2xw==
X-Gm-Message-State: AFuF++la8djv7G1gGty9+9xJHGHe5Voue7wo1LRQO9ZBBcbL5g/jzjGa
	sXB6fScXycBt8QHuZ1aa9mTnaDnv9Af8ECs/Qzdjbls0aNWUUH5poORSNl01rseCewbo+PtqYyq
	kzrdc1BqHpsZsCiVs0MSSUz2egQLnb768opGaCFxemB6WDKXbQphneIB6ww==
X-Gm-Gg: AYBFou0nTX86EjREhEpHGutFLGZLcxjhRNjitPMd9Ww36CbKVDENVPkXDTpy/fGrEkg
	GTNq+FNLORUI41mCJlgu9LmGP7XO+eCZ2XzA4Y07eeucfjzw2xftC+9/kff27950nUXoZHnM/Mq
	XbhUyC362TaCcpE096y0JpWk2YyVtqszCfh4vVl1oC4i72DMBBfkNswejhBDkCegD3D1WRwnKGZ
	oQRAqwM6eL2emld69EFxSfLNKggqPkH80KBwxFu5KO9MmmIrHOIG3I5qIrxj0mJiZWSp6BRzfP/
	EWpAUgyPNPDrxPvXGKZQ2aZ39IU9xQG7huf+uo1VgreDFwR3p+VrlZWiv1pZNFDfb7LT+h5dBi0
	43A==
X-Received: by 2002:a05:6402:21cf:b0:6a6:32f9:e9f1 with SMTP id
 4fb4d7f45d1cf-6a682c2e0damr7021758a12.20.1788422867118; Thu, 03 Sep 2026
 01:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <483e1f11846c0941d287a3a9228bd759a1310bdd.camel@pbarker.dev>
 <20260819062208.680468-1-roosesweb@gmail.com> <9dbbe54a8b97a1ac82315b4c5f5da210e6294de3.camel@pbarker.dev>
In-Reply-To: <9dbbe54a8b97a1ac82315b4c5f5da210e6294de3.camel@pbarker.dev>
From: Thomas Roos <thomas@exein.io>
Date: Thu, 3 Sep 2026 10:07:36 +0200
X-Gm-Features: AcwNN1WDCIWjqTt7K_0k_0aSHctbMS65M2wl9fiX_P8iRQYkjvVRKBw_e9C2eZI
Message-ID: <CAPgnmdwEg_0dQca=2gtD4wpQcA1tqLsdCuf2Z7-FhZvCy+yLeA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Handle an empty IMAGE_LINK_NAME consistently
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b3f99f065a8fa577"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 08:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245018

--000000000000b3f99f065a8fa577
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Retested the original do_sbom_cve_check bug.
If you enable the sbom_cve_check class after a successful build it fails as
do_create_image_sbom_spdx stays cached from the earlier build and its
output keeps the old build's DATETIME. Result:

  sbom-cve-check: error: [Errno 2] No such file or directory:
    '.../core-image-minimal-qemux86-64.rootfs-20260902135131.spdx.json'

Before: path built as ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.spdx.json as
IMAGE_NAME carries DATETIME, so it only matches the SBOM written in the
same bitbake run.

After: build path from IMAGE_LINK_NAME instead (link_name or image_name,
falls back when link name empty). IMAGE_LINK_NAME is the stable,
non-timestamped symlink do_create_image_sbom_spdx maintains pointing at the
current SBOM. create-spdx-image-3.0.bbclass keeps it updated to the latest
build's file. Reading through it means do_sbom_cve_check finds the SBOM
regardless of which invocation wrote it, since the symlink always points
at the current one, not just this run's timestamp.

bitbake core-image-minimal                            # build once, class
not yet enabled
bitbake-config-build --set-fragment sbom-cve-check   # or add fragment
manually
git checkout 1a32e30~1 -- meta/classes-recipe/sbom-cve-check.bbclass   #
pre-fix code
bitbake core-image-minimal                            # ENOENT on
do_sbom_cve_check
git checkout HEAD -- meta/classes-recipe/sbom-cve-check.bbclass        #
restore fix
bitbake -c sbom_cve_check core-image-minimal -f                        #
succeeds

The pattern is pre-existing, not part of this series,  it was already
established:

  - meta/classes-recipe/testexport.bbclass:52 (testexport_main()) =E2=80=94
d.getVar('IMAGE_LINK_NAME') or d.getVar('IMAGE_NAME')
  - meta/classes-recipe/testimage.bbclass:228 =E2=80=94 same IMAGE_LINK_NAM=
E or
IMAGE_NAME fallback, reading testdata.json back

Plus the empty-guard pattern (skip symlink creation rather than fail):

  - meta/classes-recipe/image.bbclass:610 (create_symlinks) =E2=80=94 if no=
t
link_name: return
  - meta/classes-recipe/rootfs-postcommands.bbclass:402,479
(write_image_manifest) =E2=80=94 if ... and link_name
  - meta/classes-recipe/qemuboot.bbclass:147 =E2=80=94 if
d.getVar('IMAGE_LINK_NAME'): before writing the symlink
  - meta/classes-recipe/kernel.bbclass:804 =E2=80=94 if [ -n
"${KERNEL_IMAGE_LINK_NAME}" ] before the kernel symlink
  - meta/classes-recipe/license_image.bbclass:300 =E2=80=94 same link_name =
guard
pattern
  - meta/classes-recipe/baremetal-image.bbclass:73 =E2=80=94 same

I'm not dying if these series are not merged, I just think this fix is
useful and there are already places using the same pattern!
Please correct me if I'm wrong, also agree on not adding more code
complexity. May a central place is better, but I do not know one!

Cheers, Thomas



Am Do., 27. Aug. 2026 um 17:37 Uhr schrieb Paul Barker <paul@pbarker.dev>:

> On Wed, 2026-08-19 at 08:22 +0200, Thomas Roos wrote:
> > v1 fixed the sbom-cve-check input path. Paul noted that 2a80840a4fe0
> > ("sbom-cve-check: Fix breakage with empty IMAGE_LINK_NAME") had already
> > touched this class, and that other classes make the same assumption. Th=
at
> > commit guarded the export symlinks; the input path is separate and stil=
l
> > built from IMAGE_NAME. Patch 1 now uses the shape Paul suggested, and
> > patches 2-4 fix the other sites found by auditing meta/classes*,
> > meta/lib/oe and meta/lib/oeqa.
> >
> > Read and write sites need opposite handling of an empty value: read sit=
es
> > fall back to IMAGE_NAME, write sites skip the link. A central default
> (pin
> > IMAGE_LINK_NAME to IMAGE_NAME when empty) does not work, as
> create_symlinks
> > and multiubi_mkfs have no link !=3D target check and IMAGE_NAME is itse=
lf
> > derived from IMAGE_LINK_NAME.
> >
> > Tested on qemux86-64, each fix confirmed in both directions. Patch 5
> covers
> > patches 2-4 in one build; patch 1 was checked by hand, as a selftest
> would
> > need the sbom-cve-check databases (~8.7G of git).
> >
> > AI-Generated: Uses Claude Opus 5
>
> Hi Thomas,
>
> I discussed this with Richard, we want to avoid increasing the
> complexity of the code unnecessarily.
>
> IMAGE_LINK_NAME is intended to always be valid, we need the link because
> IMAGE_NAME is dependent on the date and time that an image was built. Do
> we really need to support the case where IMAGE_LINK_NAME is unset?
>
> If we don't need to support IMAGE_LINK_NAME being unset then perhaps we
> should just print a better error message in that case and give up.
>
> Best regards,
>
> --
> Paul Barker
>
>

--000000000000b3f99f065a8fa577
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul,<br><br>Retested the original do_sbom_cve_check bu=
g.<br>If you enable the sbom_cve_check class after a successful build it fa=
ils as=C2=A0<br>do_create_image_sbom_spdx stays cached from the earlier bui=
ld and its output keeps the old build&#39;s DATETIME. Result:<br><br>=C2=A0=
 sbom-cve-check: error: [Errno 2] No such file or directory:<br>=C2=A0 =C2=
=A0 &#39;.../core-image-minimal-qemux86-64.rootfs-20260902135131.spdx.json&=
#39;<br><br>Before: path built as ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.spdx.js=
on as IMAGE_NAME carries DATETIME, so it only matches the SBOM written in t=
he same bitbake run.<br><br>After: build path from IMAGE_LINK_NAME instead =
(link_name or image_name, falls back when link name empty). IMAGE_LINK_NAME=
 is the stable, non-timestamped symlink do_create_image_sbom_spdx maintains=
 pointing at the current SBOM. create-spdx-image-3.0.bbclass keeps it updat=
ed to the latest build&#39;s file. Reading through it means do_sbom_cve_che=
ck finds the SBOM regardless of which invocation wrote it, since the symlin=
k always points at=C2=A0the current one, not just this run&#39;s timestamp.=
<br><br>bitbake core-image-minimal =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build once, cl=
ass not yet enabled<br>bitbake-config-build --set-fragment sbom-cve-check =
=C2=A0 # or add fragment manually<br>git checkout 1a32e30~1 -- meta/classes=
-recipe/sbom-cve-check.bbclass =C2=A0 # pre-fix code<br>bitbake core-image-=
minimal =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# ENOENT on do_sbom_cve_check<br>git checkou=
t HEAD -- meta/classes-recipe/sbom-cve-check.bbclass =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# restore fix<br>bitbake -c sbom_cve_check core-image-minimal -f =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# succeeds<br><br>The pattern is pre-existing, not part of this serie=
s,=C2=A0 it was already established:<br><br>=C2=A0 - meta/classes-recipe/te=
stexport.bbclass:52 (testexport_main()) =E2=80=94 d.getVar(&#39;IMAGE_LINK_=
NAME&#39;) or d.getVar(&#39;IMAGE_NAME&#39;)<br>=C2=A0 - meta/classes-recip=
e/testimage.bbclass:228 =E2=80=94 same IMAGE_LINK_NAME or IMAGE_NAME fallba=
ck, reading testdata.json back<br><br>Plus the empty-guard pattern (skip sy=
mlink creation rather than fail):<br><br>=C2=A0 - meta/classes-recipe/image=
.bbclass:610 (create_symlinks) =E2=80=94 if not link_name: return<br>=C2=A0=
 - meta/classes-recipe/rootfs-postcommands.bbclass:402,479 (write_image_man=
ifest) =E2=80=94 if ... and link_name<br>=C2=A0 - meta/classes-recipe/qemub=
oot.bbclass:147 =E2=80=94 if d.getVar(&#39;IMAGE_LINK_NAME&#39;): before wr=
iting the symlink<br>=C2=A0 - meta/classes-recipe/kernel.bbclass:804 =E2=80=
=94 if [ -n &quot;${KERNEL_IMAGE_LINK_NAME}&quot; ] before the kernel symli=
nk<br>=C2=A0 - meta/classes-recipe/license_image.bbclass:300 =E2=80=94 same=
 link_name guard pattern<br>=C2=A0 - meta/classes-recipe/baremetal-image.bb=
class:73 =E2=80=94 same<br><br>I&#39;m not dying if these series are not me=
rged, I just think this fix is useful and there are already places using th=
e same pattern!<br>Please correct me if I&#39;m wrong, also agree on not ad=
ding more code complexity. May a central place is better, but I do not know=
 one!<br><br>Cheers, Thomas<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</di=
v><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">Am Do., 27. Aug. 2026 um 17:37=C2=A0Uhr schrieb Paul=
 Barker &lt;<a href=3D"mailto:paul@pbarker.dev" target=3D"_blank">paul@pbar=
ker.dev</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Wed, 2026-08-19 at 08:22 +0200, Thomas Roos wrote:<br>
&gt; v1 fixed the sbom-cve-check input path. Paul noted that 2a80840a4fe0<b=
r>
&gt; (&quot;sbom-cve-check: Fix breakage with empty IMAGE_LINK_NAME&quot;) =
had already<br>
&gt; touched this class, and that other classes make the same assumption. T=
hat<br>
&gt; commit guarded the export symlinks; the input path is separate and sti=
ll<br>
&gt; built from IMAGE_NAME. Patch 1 now uses the shape Paul suggested, and<=
br>
&gt; patches 2-4 fix the other sites found by auditing meta/classes*,<br>
&gt; meta/lib/oe and meta/lib/oeqa.<br>
&gt; <br>
&gt; Read and write sites need opposite handling of an empty value: read si=
tes<br>
&gt; fall back to IMAGE_NAME, write sites skip the link. A central default =
(pin<br>
&gt; IMAGE_LINK_NAME to IMAGE_NAME when empty) does not work, as create_sym=
links<br>
&gt; and multiubi_mkfs have no link !=3D target check and IMAGE_NAME is its=
elf<br>
&gt; derived from IMAGE_LINK_NAME.<br>
&gt; <br>
&gt; Tested on qemux86-64, each fix confirmed in both directions. Patch 5 c=
overs<br>
&gt; patches 2-4 in one build; patch 1 was checked by hand, as a selftest w=
ould<br>
&gt; need the sbom-cve-check databases (~8.7G of git).<br>
&gt; <br>
&gt; AI-Generated: Uses Claude Opus 5<br>
<br>
Hi Thomas,<br>
<br>
I discussed this with Richard, we want to avoid increasing the<br>
complexity of the code unnecessarily.<br>
<br>
IMAGE_LINK_NAME is intended to always be valid, we need the link because<br=
>
IMAGE_NAME is dependent on the date and time that an image was built. Do<br=
>
we really need to support the case where IMAGE_LINK_NAME is unset?<br>
<br>
If we don&#39;t need to support IMAGE_LINK_NAME being unset then perhaps we=
<br>
should just print a better error message in that case and give up.<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div>

--000000000000b3f99f065a8fa577--

