Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3318EC79F80
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 06:01:34 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7877.1788501691192155328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 23:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OhUiGRMZ;
 spf=pass (domain: mvista.com, ip: 209.85.218.48, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2544ff970dso82406166b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 23:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788501689; cv=none;
        d=google.com; s=arc-20260327;
        b=Msvjuhu5gBCCZbXzoSd9gN8KJH6CpmCbDggWt00hEMLI/DTXibcal+PqmLJoDU4418
         XagL/3p/CB5XLnhrjoKkXFF2feTG8spQvzbk8THDkPBjztpVmrcyjKqzGXRkiBND6/P8
         iWAPFdqOxuVFN487GXnib9qyvmmZak6e7HBjrmggwBq7wfHYmRyDLC9KBsFzcGwHlD7D
         5NmGz46lzIDleOCC4PKDTL6PM9O+yUAm42TGf6L9fzpMbN0YOPB7Uvn+3SEkIYWvZQPk
         ubI8bQ0FQSVAygdV/hIgpyfi4XuYm3aRv2ifGK89inUdYeW3S2o39d0UPPGa8AW0obMm
         C8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uiN0lyPC0vQkEdRqlOM5NroJOiR5TDfnHu6+bsr/XIY=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=KRHJ0TjBmoCL0LldAaVDN6YcGBWY5wSzfyL0c/CpZQvEkPQ8jY+fyBKhMZulx3YIFl
         MUZhXYacGOQo/utN60DUinkFtM1v6Yvws5+LbVit3yuf9pB6hg15wfQBcKJPVgHwnBL/
         h91UdLp6eZF2voVFryC2Y9B4aggU3EI9r5574HV6lHnezepNpuA0PDu7jMwFDfKQPh7z
         FVXlCilPWSp4J98KhoAgCgeowqDcbAYdyOqmRL+kS9kSNSCpHe2hT6WUslyRXay2IYB8
         vuIHbEEebFC066PlKv2KAERpE/0ECkpzX09DNNwQQwjNVNAwN1nFW0HLVH/GPDcSD3gX
         i40Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788501689; x=1789106489; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uiN0lyPC0vQkEdRqlOM5NroJOiR5TDfnHu6+bsr/XIY=;
        b=OhUiGRMZF+Cj3I4iNzfAljWdtMkhHEiAJmbwwrkIlu4sRG/9GTltQKdJRK0JmlPd7r
         ULK5a7gCweMpHoQEqSztZq3i3DP8QkM0ltZKru20KUaRg5sifLRv1k/YYRrH4KA3gDKh
         j9W0Lmy1epV24dAcU1MP1VuQnJLbdBVxia6VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788501689; x=1789106489;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uiN0lyPC0vQkEdRqlOM5NroJOiR5TDfnHu6+bsr/XIY=;
        b=hH8jsenL/LU0pEGS/LKn9y9Lrw3xRF38wbX7TainFUESZpl1nLwEpP4heo5Xh3Zjq3
         w+lXXqx3X33pBhT8kLc4rO69SWUW4RxR9655gZjK6EEsCo/VITo01M/pbvQFa6Fd+sWw
         kvZ3Jhx7YPn9PG0XWukmBthg2t8Ge+4Zk9YnT7BJJTGgR4abxGrvgIAwf6CeGREQXHqm
         VBkTDeo5jbIdPnTZSl956wcwHXyZWBd4OKVlTtUj5t7PhoO1jFrm6tU5Qq2+A/aKqauY
         QBtc8XgCtcBwZX0Rb0qDOt5HH2xZSGaxlFEpz54cLWVM5EkOhLJ56bmt5rDgImSG4p0q
         y3HA==
X-Gm-Message-State: AFuF++nl9N+6tumbl3H8KmhnJQua5jzbMKr4+PClDnXn2gzsG1EaUoQi
	PbFWMsJE0vAAc/fB80zEQrrfhp27eQWH1SBiiNhGcv9Lkz49JlhEZMrss2+NjAPVYjGPWWNdRhJ
	F60ulyZ+/q1CqmV3q9mvC9MqRYj3kcpz2MnJA7itKrw==
X-Gm-Gg: AYBFou0AJlpw9LtkQLRlw2hu2S6SRzargqiKVfjQAcw9GY4ljsL1VtLMWYDSrCmEx1m
	GUVrlhxL3sfIseuUzMUt44DfSkMDg2P1XvSaC3ts/KCyvQh/Uqj0nhss/U2cXpMeBQZEEajWjSU
	eJVbsJoyD7g0pgg6jTWQ9gt875WFXqzmTNevJcQCskIL+8nD/jYHUpTUVx7qEyg2fMYwiZJLeRj
	BwlUOLQ9ZJBhgIxZpDmcRDdEWLfdi3Ie/Y5pJZM1/BkMXmjKnRQRnxweaF7FpTY7Hxg1L/f41jg
	xPwyrVHCm/J5v8HU1i/rkEr4XkA7G5VCVYQtwRDjN3FzSKp5EBAuT0ud98EkoMxTGA9PsCXSNwH
	aPw==
X-Received: by 2002:a17:907:ea90:b0:c26:1649:47ab with SMTP id
 a640c23a62f3a-c26164956dcmr51330966b.33.1788501689173; Thu, 03 Sep 2026
 23:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260824064944.29802-1-vanusuri@mvista.com> <DL5ZNN0ND074.3UFP77OL4YV24@smile.fr>
In-Reply-To: <DL5ZNN0ND074.3UFP77OL4YV24@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 4 Sep 2026 11:31:15 +0530
X-Gm-Features: AcwNN1WcQYFPRnNEktYQbOuenGVWVVfFNoIZH6mxYFQk1AQ_Cl7hqk7efatMMRU
Message-ID: <CANQUz1_WittegyDFtgyzJvmhKzoteK36s7+8JHcZymXSfSawVA@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch 1/3] libxfont: Fix CVE-2026-56001
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dd1e05065aa1ff22"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 06:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245063

--000000000000dd1e05065aa1ff22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the review.

I added #include <stdint.h> because SIZE_MAX is used in bitscale.c. Without
this include, the build fails with the following error:

error: 'SIZE_MAX' undeclared (first use in this function)
note: 'SIZE_MAX' is defined in header '<stdint.h>'; this is probably
fixable by adding '#include <stdint.h>'

For v2, I'll add a note explaining the reason for adding <stdint.h>, and
I'll also fix the indentation change to keep it consistent with upstream
and make future backports easier.

Thanks & Regards,
Vijay


On Fri, Sep 4, 2026 at 2:41=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr>=
 wrote:

> On Mon Aug 24, 2026 at 8:49 AM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > Pick patch according to [2]
> >
> > [1] https://nvd.nist.gov/vuln/detail/CVE-2026-56001
> > [2] https://security-tracker.debian.org/tracker/CVE-2026-56001
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../xorg-lib/libxfont/CVE-2026-56001.patch    | 84 +++++++++++++++++++
> >  .../xorg-lib/libxfont_1.5.4.bb                |  3 +
> >  2 files changed, 87 insertions(+)
> >  create mode 100644
> meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
> >
> > diff --git
> a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
> b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
> > new file mode 100644
> > index 0000000000..506a2dc22a
> > --- /dev/null
> > +++ b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
> > @@ -0,0 +1,84 @@
> > +From be0b08e2d354138d3222b4490e2a77c6ee42f778 Mon Sep 17 00:00:00 2001
> > +From: Peter Hutterer <peter.hutterer@who-t.net>
> > +Date: Mon, 1 Jun 2026 16:46:10 +1000
> > +Subject: [PATCH] bitscale: fix integer overflow in BitmapScaleBitmaps
> > + bytestoalloc
> > +
> > +bytestoalloc is declared as unsigned int (32-bit). When the sum of
> > +per-glyph byte counts exceeds 2^32, the value wraps around and calloc(=
)
> > +allocates a buffer that is too small. The subsequent ScaleBitmap loop
> > +then writes past the end of the allocated buffer.
> > +
> > +Change bytestoalloc from unsigned int to size_t to match the actual
> > +allocation size type, and add an explicit overflow check in the
> > +accumulation loop to bail out if the total would exceed SIZE_MAX.
> > +
> > +This vulnerability was discovered by:
> > +Anonymous working with TrendAI Zero Day Initiative
> > +
> > +CVE-2026-56001/ZDI-CAN-30558
> > +
> > +Assisted-by: Claude:claude-opus-4-6
> > +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > +Part-of: <
> https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/34>
> > +
> > +Upstream-Status: Backport [import from debian libxfont1 1.5.2-4+deb9u1
> > +Upstream commit
> https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/be0b08e2d354138=
d3222b4490e2a77c6ee42f778
> ]
> > +CVE: CVE-2026-56001
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>
> Hello,
>
> This patch (and also the other ones in this series) was non-trivially
> changes without a comment explaining why.
>
> > +---
> > + src/bitmap/bitscale.c | 24 +++++++++++++++++++++---
> > + 1 file changed, 21 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/src/bitmap/bitscale.c b/src/bitmap/bitscale.c
> > +index 13ed924..c87fa96 100644
> > +--- a/src/bitmap/bitscale.c
> > ++++ b/src/bitmap/bitscale.c
> > +@@ -38,6 +38,7 @@ from The Open Group.
> > + #include <X11/fonts/bitmap.h>
> > + #include <X11/fonts/fontutil.h>
> > + #include <math.h>
> > ++#include <stdint.h>
>               ^ This is new: I suppose to get size_t but that should be
>                             explained. Also, "man size_t" tells me that
> size_t in
>                                 stddef.h not stdint.h.
> > +
> > + #ifndef MAX
> > + #define   MAX(a,b)    (((a)>(b)) ? a : b)
> > +@@ -1459,7 +1460,7 @@ BitmapScaleBitmaps(FontPtr pf,          /* scale=
d
> font */
> > +             opci;
> > +     FontInfoPtr pfi;
> > +     int         glyph;
> > +-    unsigned    bytestoalloc =3D 0;
> > ++    size_t      bytestoalloc =3D 0;
> > +     int             firstCol, lastCol, firstRow, lastRow;
> > +
> > +     double  xform[4], inv_xform[4];
> > +@@ -1486,8 +1487,25 @@ BitmapScaleBitmaps(FontPtr pf,          /*
> scaled font */
> > +     glyph =3D pf->glyph;
> > +     for (i =3D 0; i < nchars; i++)
> > +     {
> > +-    if ((pci =3D ACCESSENCODING(bitmapFont->encoding, i)))
> > +-        bytestoalloc +=3D BYTES_FOR_GLYPH(pci, glyph);
> > ++    if ((pci =3D ACCESSENCODING(bitmapFont->encoding, i))) {
> > ++        size_t glyphsize =3D BYTES_FOR_GLYPH(pci, glyph);
> > ++        if (bytestoalloc > SIZE_MAX - glyphsize) {
> > ++            fprintf(stderr,
> > ++                    "Error: bitmap allocation overflow for scaled
> font\n");
> > ++            goto bail;
> > ++        }
> > ++        bytestoalloc +=3D glyphsize;
> > ++    }
> > ++    }
> > ++
> > ++    /* Reject unreasonably large bitmap allocations that could result
> > ++     * from malicious fonts with extreme scale factors.  256 MiB is
> > ++     * far beyond any legitimate scaled bitmap font. */
> > ++#define BITMAP_SCALE_MAX_ALLOC      (256 * 1024 * 1024)
> > ++    if (bytestoalloc > BITMAP_SCALE_MAX_ALLOC) {
> > ++    fprintf(stderr,
> > ++           "Error: scaled bitmap size %zu exceeds limit\n",
> bytestoalloc);
> > ++       goto bail;
>          ^ This line has been reindented from upstream, that might make
>                  future backports needlessly harder.
>
> Can you send a v2 with the changes either removed or explained in the
> patch message?
>
> Thanks!
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000dd1e05065aa1ff22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-isSelectedEnd"><span>Hi Yoann,</span></p=
><p class=3D"gmail-isSelectedEnd"><span>Thanks for the review.</span></p><p=
 class=3D"gmail-isSelectedEnd"><span>I added </span><code dir=3D"ltr"><span=
>#include &lt;stdint.h&gt;</span></code><span> because </span><code dir=3D"=
ltr"><span>SIZE_MAX</span></code><span> is used in </span><code dir=3D"ltr"=
><span>bitscale.c</span></code><span>. Without this include, the build fail=
s with the following error:</span></p><pre dir=3D"ltr"><code dir=3D"ltr"><s=
pan>error: &#39;SIZE_MAX&#39; undeclared (first use in this function)
note: &#39;SIZE_MAX&#39; is defined in header &#39;&lt;stdint.h&gt;&#39;; t=
his is probably fixable by adding &#39;#include &lt;stdint.h&gt;&#39;</span=
></code></pre><p class=3D"gmail-isSelectedEnd"><span>For v2, I&#39;ll add a=
 note explaining the reason for adding </span><code dir=3D"ltr"><span>&lt;s=
tdint.h&gt;</span></code><span>, and I&#39;ll also fix the indentation chan=
ge to keep it consistent with upstream and make future backports easier.</s=
pan></p><p><span>Thanks &amp;=C2=A0Regards,</span><br><span>Vijay</span></p=
><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Fri, Sep 4, 2026 at 2:41=E2=80=AFAM Yoann Con=
gal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mo=
n Aug 24, 2026 at 8:49 AM CEST, Vijay Anusuri via <a href=3D"http://lists.o=
penembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.or=
g</a> wrote:<br>
&gt; Pick patch according to [2]<br>
&gt;<br>
&gt; [1] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-56001" rel=3D=
"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026-56=
001</a><br>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-56=
001" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/CVE-2026-56001</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../xorg-lib/libxfont/CVE-2026-56001.patch=C2=A0 =C2=A0 | 84 +++=
++++++++++++++++<br>
&gt;=C2=A0 .../xorg-lib/<a href=3D"http://libxfont_1.5.4.bb" rel=3D"norefer=
rer" target=3D"_blank">libxfont_1.5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
&gt;=C2=A0 2 files changed, 87 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2=
026-56001.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.pa=
tch b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..506a2dc22a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch<br>
&gt; @@ -0,0 +1,84 @@<br>
&gt; +From be0b08e2d354138d3222b4490e2a77c6ee42f778 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Date: Mon, 1 Jun 2026 16:46:10 +1000<br>
&gt; +Subject: [PATCH] bitscale: fix integer overflow in BitmapScaleBitmaps=
<br>
&gt; + bytestoalloc<br>
&gt; +<br>
&gt; +bytestoalloc is declared as unsigned int (32-bit). When the sum of<br=
>
&gt; +per-glyph byte counts exceeds 2^32, the value wraps around and calloc=
()<br>
&gt; +allocates a buffer that is too small. The subsequent ScaleBitmap loop=
<br>
&gt; +then writes past the end of the allocated buffer.<br>
&gt; +<br>
&gt; +Change bytestoalloc from unsigned int to size_t to match the actual<b=
r>
&gt; +allocation size type, and add an explicit overflow check in the<br>
&gt; +accumulation loop to bail out if the total would exceed SIZE_MAX.<br>
&gt; +<br>
&gt; +This vulnerability was discovered by:<br>
&gt; +Anonymous working with TrendAI Zero Day Initiative<br>
&gt; +<br>
&gt; +CVE-2026-56001/ZDI-CAN-30558<br>
&gt; +<br>
&gt; +Assisted-by: Claude:claude-opus-4-6<br>
&gt; +Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@wh=
o-t.net" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/xorg/lib/libxf=
ont/-/merge_requests/34" rel=3D"noreferrer" target=3D"_blank">https://gitla=
b.freedesktop.org/xorg/lib/libxfont/-/merge_requests/34</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [import from debian libxfont1 1.5.2-4+deb9u=
1<br>
&gt; +Upstream commit <a href=3D"https://gitlab.freedesktop.org/xorg/lib/li=
bxfont/-/commit/be0b08e2d354138d3222b4490e2a77c6ee42f778" rel=3D"noreferrer=
" target=3D"_blank">https://gitlab.freedesktop.org/xorg/lib/libxfont/-/comm=
it/be0b08e2d354138d3222b4490e2a77c6ee42f778</a>]<br>
&gt; +CVE: CVE-2026-56001<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Hello,<br>
<br>
This patch (and also the other ones in this series) was non-trivially<br>
changes without a comment explaining why.<br>
<br>
&gt; +---<br>
&gt; + src/bitmap/bitscale.c | 24 +++++++++++++++++++++---<br>
&gt; + 1 file changed, 21 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/bitmap/bitscale.c b/src/bitmap/bitscale.c<br>
&gt; +index 13ed924..c87fa96 100644<br>
&gt; +--- a/src/bitmap/bitscale.c<br>
&gt; ++++ b/src/bitmap/bitscale.c<br>
&gt; +@@ -38,6 +38,7 @@ from The Open Group.<br>
&gt; + #include &lt;X11/fonts/bitmap.h&gt;<br>
&gt; + #include &lt;X11/fonts/fontutil.h&gt;<br>
&gt; + #include &lt;math.h&gt;<br>
&gt; ++#include &lt;stdint.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ This is new: I suppose t=
o get size_t but that should be<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 explained. Also, &quot;man size_t&quot; tells me t=
hat size_t in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stddef.h not stdint.h.<br>
&gt; + <br>
&gt; + #ifndef MAX<br>
&gt; + #define=C2=A0 =C2=A0MAX(a,b)=C2=A0 =C2=A0 (((a)&gt;(b)) ? a : b)<br>
&gt; +@@ -1459,7 +1460,7 @@ BitmapScaleBitmaps(FontPtr pf,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* scaled font */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opci;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0FontInfoPtr pfi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glyph;<br>
&gt; +-=C2=A0 =C2=A0 unsigned=C2=A0 =C2=A0 bytestoalloc =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 bytestoalloc =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0firstCol, lastCol, firstRow, lastRow;<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0double=C2=A0 xform[4], inv_xform[4];<br>
&gt; +@@ -1486,8 +1487,25 @@ BitmapScaleBitmaps(FontPtr pf,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* scaled font */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0glyph =3D pf-&gt;glyph;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; nchars; i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 if ((pci =3D ACCESSENCODING(bitmapFont-&gt;encoding, i=
)))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bytestoalloc +=3D BYTES_FOR_GLYPH(pci, g=
lyph);<br>
&gt; ++=C2=A0 =C2=A0 if ((pci =3D ACCESSENCODING(bitmapFont-&gt;encoding, i=
))) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t glyphsize =3D BYTES_FOR_GLYPH(pci=
, glyph);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytestoalloc &gt; SIZE_MAX - glyphsi=
ze) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Error: bitmap allocation overflow for scaled font\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto bail;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 bytestoalloc +=3D glyphsize;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* Reject unreasonably large bitmap allocations that c=
ould result<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* from malicious fonts with extreme scale factor=
s.=C2=A0 256 MiB is<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* far beyond any legitimate scaled bitmap font. =
*/<br>
&gt; ++#define BITMAP_SCALE_MAX_ALLOC=C2=A0 =C2=A0 =C2=A0 (256 * 1024 * 102=
4)<br>
&gt; ++=C2=A0 =C2=A0 if (bytestoalloc &gt; BITMAP_SCALE_MAX_ALLOC) {<br>
&gt; ++=C2=A0 =C2=A0 fprintf(stderr,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Error: scaled bitmap =
size %zu exceeds limit\n&quot;, bytestoalloc);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0goto bail;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^ This line has been reindented from upst=
ream, that might make<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0future backpo=
rts needlessly harder.<br>
<br>
Can you send a v2 with the changes either removed or explained in the<br>
patch message?<br>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000dd1e05065aa1ff22--

