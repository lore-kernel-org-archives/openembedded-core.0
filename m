Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBFCE83EEE
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 08:11:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15440.1770192662937180329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 00:11:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m+o/eXcZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-435f177a8f7so5221921f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 00:11:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770192661; cv=none;
        d=google.com; s=arc-20240605;
        b=gUOJCWOeFsazdaZfYXBFiTrxfRp+JKy2SU+EAwXoo0UdEK9CxIasNMF4L9Ow6uxVw+
         z1BzgjXrtNM2iqQjzHR9kes9ZqIq9GNsG4HO79LEHKfnt93CYbWQZ7qlO56r19ApLBa6
         7dKI45nsr0Gc3/afIqVTjxEvZcSKgPE/8JP+nVC1nDKmg8tZD7esXqDnWxrtjRZoPc0O
         qj0dnTBcn8i6b9w688wuuP15UR+F/xSXqms9kN+fTb8Z9LZNsKmADR1I2ETSnpK6Y/Cq
         g7f3r3dWus/2hlmOBtmu47BubxT/Rbz37fgK9++e8y9KQuor9kt30gy6XcBjFGU8mGgm
         8EfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=csHXAjHqUKknr7mWDB0lmCptBsUhnRdKBLfdEzC5lsc=;
        fh=kyrcx/wGdP1K8AcZ1t5dlAg43e9Kck6gc8gLfroTQbI=;
        b=FsqbceAmk61jGekhQ6c/lMPnm6Kue1Iwn9rOA4dGpa/Bd27e5ZShIW69aW59YyjjmR
         YjnpUzonblZIPqukHoz4WqyBYSU+JYhjAUe7UOVt4yIaepKq1GDGhE7i43v1pLpiVlzg
         07OGQqaS2+55L06mc/25kYcbsMZwjhvtTL/b+7/R0fy2d6qtiRrqOyOMMeIYF7RBXV3c
         tdJz/19vlfO0LMMy9yoZce2gE9F/Kc1D+Y6d6Xav9LqQtUZHn1CameboMGVHyiuc/ngV
         5oM/zLAg0s6z+bGkRvD5Bo6OmK+1VyM51/sAd5l4h7X+/TtHc8H0FQHpuLmP7bdW8Fr0
         YLSQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770192661; x=1770797461; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=csHXAjHqUKknr7mWDB0lmCptBsUhnRdKBLfdEzC5lsc=;
        b=m+o/eXcZd9Qb9i3r/78VqnMoF3ZB8UKsbQu4+XgRBpwzCCFoDCkjsZKygz76gNZNpI
         q/qHq2pNHr4oClR/DChQHK7U9C/v6HdXGVyEODifnmqUzjVQgcYw6WHs3bHDInMCJtAU
         YUdQ7fXiHz1CX4ecNjMfbfNeGpeXS2+g9nHBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770192661; x=1770797461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csHXAjHqUKknr7mWDB0lmCptBsUhnRdKBLfdEzC5lsc=;
        b=YfkFXJiHOTUDX3R1fa5HH3eYFlT14zwdjkBlysY8jCGonphUXcZxKMHhimxzjv43yT
         0lxPF34wgv3b2HSHeuXeohxZ1dke+kXfDhi14SdgqZhqi0MzuJEyK5sETuJs3GDfFoz1
         bZ0n5GE6+Bxlz4aY+gvRwekhNouDxmLQ5pm0nGhcp1ostdweRQehOGrU4umxcCJI05FY
         SFyfyFQqIRpaDdFEo0iP3jqEF4vrEEv0lfZBbJ8f5KcjB6FrFvLRsNSNq/OwLZjJ4uxS
         7lcyOiIOaEBGo5Z9nlYITFH1TR7d0+CgR/IxehwE/3NswIfvlh4fnoYlfmCQ7O9LY2/J
         yfwg==
X-Gm-Message-State: AOJu0YzTsC0ngGzD6H6LahhD79nlxQPtOfZZAdq04GoyERUvUx8yhEfD
	bEsKcVfi8mKDbfRlWu9NjhyauUbJrnp8SEs0T0Ti+tBiZwgoiOZ6DJq/btyfg1PjO8K2Ri8fIeV
	JCid37ffcsrk1Q5GsfNafL5CFL0b8vLw3LCp14UassA==
X-Gm-Gg: AZuq6aKlSjFdAaM8HTYuxLahNJlwAg4QN0LkDtrfKeUwhuX0goKIfJXSSYa/MZwYBJ9
	CBAJbcK7dVos6FOShlC7FVnH5MAUU6ljJmJhDD7/CL9uAu+T59AZf06YiDf0He3mxAe620tTli+
	3/n46rbdZv2w7DPt9+qkZlFg0xJoAGN97lG2fOheQnTYl4sMJX1rZB7sAXQUnVA9Ftvqp+PYocq
	RrnIV5dyW7IBsZcqPuPYDjOOmS9myBUr1pV7xKY79hKX5F7RO3B8xnpBbZXOG83kAvZlyKml0kO
	Jl1vFCwCmxeq1UiRGo/LkDrkSL8K1iok6HxhSyI=
X-Received: by 2002:a05:6000:2289:b0:435:a4a9:6f79 with SMTP id
 ffacd0b85a97d-43617e39046mr2580869f8f.8.1770192660966; Wed, 04 Feb 2026
 00:11:00 -0800 (PST)
MIME-Version: 1.0
References: <188ABFD65FF0FAD4.2595076@lists.openembedded.org> <AS1PR10MB5697871977535CBCA31A32FAFD98A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697871977535CBCA31A32FAFD98A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 4 Feb 2026 09:10:34 +0100
X-Gm-Features: AZwV_QiaAnYPvKrbJRNOZCvqbkK7NYN1ERReLyiglfZQ3x9CoLQy73l-94pM-kc
Message-ID: <CAMSfU+4Om1W6T5gURnPHra=RmcYhw=oGqjREWiP2eDV3US+_GQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] libpng: patch CVE-2026-22695
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bdd12f0649fb187c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 08:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230501

--000000000000bdd12f0649fb187c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 4 f=C3=A9vr. 2026 =C3=A0 08:23, Marko, Peter <Peter.Marko@siemens.c=
om> a
=C3=A9crit :

> Gentle ping for this series
>

Thanks, I had missed it,
I've now added it to the series under test/review.


> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Marko via
> > lists.openembedded.org
> > Sent: Thursday, January 15, 2026 1:25
> > To: openembedded-core@lists.openembedded.org
> > Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: [OE-core][scarthgap][PATCH 1/2] libpng: patch CVE-2026-22695
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Pick commit per [1].
> > This CVE is regression of fix for CVE-2025-65018.
> >
> > [1] https://security-tracker.debian.org/tracker/CVE-2026-22695
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  .../libpng/files/CVE-2026-22695.patch         | 77 +++++++++++++++++++
> >  .../libpng/libpng_1.6.42.bb                   |  1 +
> >  2 files changed, 78 insertions(+)
> >  create mode 100644
> meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
> >
> > diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
> > b/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
> > new file mode 100644
> > index 00000000000..6456b6c4917
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
> > @@ -0,0 +1,77 @@
> > +From e4f7ad4ea2a471776c81dda4846b7691925d9786 Mon Sep 17 00:00:00 2001
> > +From: Cosmin Truta <ctruta@gmail.com>
> > +Date: Fri, 9 Jan 2026 20:51:53 +0200
> > +Subject: [PATCH] Fix a heap buffer over-read in
> `png_image_read_direct_scaled`
> > +
> > +Fix a regression from commit 218612ddd6b17944e21eda56caf8b4bf7779d1ea.
> > +
> > +The function `png_image_read_direct_scaled`, introduced by the fix for
> > +CVE-2025-65018, copies transformed row data from an intermediate buffe=
r
> > +(`local_row`) to the user's output buffer. The copy incorrectly used
> > +`row_bytes` (the caller's stride) as the size parameter to memcpy, eve=
n
> > +though `local_row` is only `png_get_rowbytes()` bytes long.
> > +
> > +This causes a heap buffer over-read when:
> > +
> > +1. The caller provides a padded stride (e.g., for memory alignment):
> > +   memcpy reads past the end of `local_row` by `stride - row_width`
> > +   bytes.
> > +
> > +2. The caller provides a negative stride (for bottom-up layouts):
> > +   casting ptrdiff_t to size_t produces ~2^64, causing memcpy to
> > +   attempt reading exabytes, resulting in an immediate crash.
> > +
> > +The fix consists in using the size of the row buffer for the copy and
> > +using the stride for pointer advancement only.
> > +
> > +Reported-by: Petr Simecek <simecek@users.noreply.github.com>
> > +Analyzed-by: Stanislav Fort
> > +Analyzed-by: Pavel Kohout
> > +Co-authored-by: Petr Simecek <simecek@users.noreply.github.com>
> > +Signed-off-by: Cosmin Truta <ctruta@gmail.com>
> > +
> > +CVE: CVE-2026-22695
> > +Upstream-Status: Backport
> > [
> https://github.com/pnggroup/libpng/commit/e4f7ad4ea2a471776c81dda4846b769
> > 1925d9786]
> > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > +---
> > + AUTHORS   | 1 +
> > + pngread.c | 4 +++-
> > + 2 files changed, 4 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/AUTHORS b/AUTHORS
> > +index 26b7bb50f..b9c0fffcf 100644
> > +--- a/AUTHORS
> > ++++ b/AUTHORS
> > +@@ -23,6 +23,7 @@ Authors, for copyright and licensing purposes.
> > +  * Mike Klein
> > +  * Pascal Massimino
> > +  * Paul Schmidt
> > ++ * Petr Simecek
> > +  * Philippe Antoine
> > +  * Qiang Zhou
> > +  * Sam Bushell
> > +diff --git a/pngread.c b/pngread.c
> > +index e3426292b..9d86b01dc 100644
> > +--- a/pngread.c
> > ++++ b/pngread.c
> > +@@ -3270,9 +3270,11 @@ png_image_read_direct_scaled(png_voidp argument=
)
> > +        argument);
> > +    png_imagep image =3D display->image;
> > +    png_structrp png_ptr =3D image->opaque->png_ptr;
> > ++   png_inforp info_ptr =3D image->opaque->info_ptr;
> > +    png_bytep local_row =3D png_voidcast(png_bytep, display->local_row=
);
> > +    png_bytep first_row =3D png_voidcast(png_bytep, display->first_row=
);
> > +    ptrdiff_t row_bytes =3D display->row_bytes;
> > ++   size_t copy_bytes =3D png_get_rowbytes(png_ptr, info_ptr);
> > +    int passes;
> > +
> > +    /* Handle interlacing. */
> > +@@ -3302,7 +3304,7 @@ png_image_read_direct_scaled(png_voidp argument)
> > +          png_read_row(png_ptr, local_row, NULL);
> > +
> > +          /* Copy from local_row to user buffer. */
> > +-         memcpy(output_row, local_row, (size_t)row_bytes);
> > ++         memcpy(output_row, local_row, copy_bytes);
> > +          output_row +=3D row_bytes;
> > +       }
> > +    }
> > diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
> b/meta/recipes-
> > multimedia/libpng/libpng_1.6.42.bb
> > index 6dc7ffe2722..fe99e5df092 100644
> > --- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
> > +++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
> > @@ -21,6 +21,7 @@ SRC_URI =3D
> > "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
> >             file://CVE-2025-65018-02.patch \
> >             file://CVE-2025-66293-01.patch \
> >             file://CVE-2025-66293-02.patch \
> > +           file://CVE-2026-22695.patch \
> >  "
> >
> >  SRC_URI[sha256sum] =3D
> > "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
>


--=20
Yoann Congal
Smile ECS

--000000000000bdd12f0649fb187c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mer. 4 f=C3=A9vr. 2026 =C3=A0=C2=
=A008:23, Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">Peter=
.Marko@siemens.com</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quo=
te gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Gentle ping for this series<br></blockquote><div><br></div><div>Thanks, I =
had missed it,</div><div>I&#39;ve now added it to the series under test/rev=
iew.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Peter Marko via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Thursday, January 15, 2026 1:25<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko@s=
iemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; Subject: [OE-core][scarthgap][PATCH 1/2] libpng: patch CVE-2026-22695<=
br>
&gt; <br>
&gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" targe=
t=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; <br>
&gt; Pick commit per [1].<br>
&gt; This CVE is regression of fix for CVE-2025-65018.<br>
&gt; <br>
&gt; [1] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-22=
695" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/CVE-2026-22695</a><br>
&gt; <br>
&gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.c=
om" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../libpng/files/CVE-2026-22695.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 77 +++++++++++++++++++<br>
&gt;=C2=A0 .../libpng/<a href=3D"http://libpng_1.6.42.bb" rel=3D"noreferrer=
" target=3D"_blank">libpng_1.6.42.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 78 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026=
-22695.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch=
<br>
&gt; b/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..6456b6c4917<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch<br>
&gt; @@ -0,0 +1,77 @@<br>
&gt; +From e4f7ad4ea2a471776c81dda4846b7691925d9786 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Cosmin Truta &lt;<a href=3D"mailto:ctruta@gmail.com" target=3D"=
_blank">ctruta@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 9 Jan 2026 20:51:53 +0200<br>
&gt; +Subject: [PATCH] Fix a heap buffer over-read in `png_image_read_direc=
t_scaled`<br>
&gt; +<br>
&gt; +Fix a regression from commit 218612ddd6b17944e21eda56caf8b4bf7779d1ea=
.<br>
&gt; +<br>
&gt; +The function `png_image_read_direct_scaled`, introduced by the fix fo=
r<br>
&gt; +CVE-2025-65018, copies transformed row data from an intermediate buff=
er<br>
&gt; +(`local_row`) to the user&#39;s output buffer. The copy incorrectly u=
sed<br>
&gt; +`row_bytes` (the caller&#39;s stride) as the size parameter to memcpy=
, even<br>
&gt; +though `local_row` is only `png_get_rowbytes()` bytes long.<br>
&gt; +<br>
&gt; +This causes a heap buffer over-read when:<br>
&gt; +<br>
&gt; +1. The caller provides a padded stride (e.g., for memory alignment):<=
br>
&gt; +=C2=A0 =C2=A0memcpy reads past the end of `local_row` by `stride - ro=
w_width`<br>
&gt; +=C2=A0 =C2=A0bytes.<br>
&gt; +<br>
&gt; +2. The caller provides a negative stride (for bottom-up layouts):<br>
&gt; +=C2=A0 =C2=A0casting ptrdiff_t to size_t produces ~2^64, causing memc=
py to<br>
&gt; +=C2=A0 =C2=A0attempt reading exabytes, resulting in an immediate cras=
h.<br>
&gt; +<br>
&gt; +The fix consists in using the size of the row buffer for the copy and=
<br>
&gt; +using the stride for pointer advancement only.<br>
&gt; +<br>
&gt; +Reported-by: Petr Simecek &lt;<a href=3D"mailto:simecek@users.noreply=
.github.com" target=3D"_blank">simecek@users.noreply.github.com</a>&gt;<br>
&gt; +Analyzed-by: Stanislav Fort<br>
&gt; +Analyzed-by: Pavel Kohout<br>
&gt; +Co-authored-by: Petr Simecek &lt;<a href=3D"mailto:simecek@users.nore=
ply.github.com" target=3D"_blank">simecek@users.noreply.github.com</a>&gt;<=
br>
&gt; +Signed-off-by: Cosmin Truta &lt;<a href=3D"mailto:ctruta@gmail.com" t=
arget=3D"_blank">ctruta@gmail.com</a>&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2026-22695<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D"https://github.com/pnggroup/libpng/commit/e4f7ad4ea2a47177=
6c81dda4846b769" rel=3D"noreferrer" target=3D"_blank">https://github.com/pn=
ggroup/libpng/commit/e4f7ad4ea2a471776c81dda4846b769</a><br>
&gt; 1925d9786]<br>
&gt; +Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.=
com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; +---<br>
&gt; + AUTHORS=C2=A0 =C2=A0| 1 +<br>
&gt; + pngread.c | 4 +++-<br>
&gt; + 2 files changed, 4 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/AUTHORS b/AUTHORS<br>
&gt; +index 26b7bb50f..b9c0fffcf 100644<br>
&gt; +--- a/AUTHORS<br>
&gt; ++++ b/AUTHORS<br>
&gt; +@@ -23,6 +23,7 @@ Authors, for copyright and licensing purposes.<br>
&gt; +=C2=A0 * Mike Klein<br>
&gt; +=C2=A0 * Pascal Massimino<br>
&gt; +=C2=A0 * Paul Schmidt<br>
&gt; ++ * Petr Simecek<br>
&gt; +=C2=A0 * Philippe Antoine<br>
&gt; +=C2=A0 * Qiang Zhou<br>
&gt; +=C2=A0 * Sam Bushell<br>
&gt; +diff --git a/pngread.c b/pngread.c<br>
&gt; +index e3426292b..9d86b01dc 100644<br>
&gt; +--- a/pngread.c<br>
&gt; ++++ b/pngread.c<br>
&gt; +@@ -3270,9 +3270,11 @@ png_image_read_direct_scaled(png_voidp argumen=
t)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 argument);<br>
&gt; +=C2=A0 =C2=A0 png_imagep image =3D display-&gt;image;<br>
&gt; +=C2=A0 =C2=A0 png_structrp png_ptr =3D image-&gt;opaque-&gt;png_ptr;<=
br>
&gt; ++=C2=A0 =C2=A0png_inforp info_ptr =3D image-&gt;opaque-&gt;info_ptr;<=
br>
&gt; +=C2=A0 =C2=A0 png_bytep local_row =3D png_voidcast(png_bytep, display=
-&gt;local_row);<br>
&gt; +=C2=A0 =C2=A0 png_bytep first_row =3D png_voidcast(png_bytep, display=
-&gt;first_row);<br>
&gt; +=C2=A0 =C2=A0 ptrdiff_t row_bytes =3D display-&gt;row_bytes;<br>
&gt; ++=C2=A0 =C2=A0size_t copy_bytes =3D png_get_rowbytes(png_ptr, info_pt=
r);<br>
&gt; +=C2=A0 =C2=A0 int passes;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Handle interlacing. */<br>
&gt; +@@ -3302,7 +3304,7 @@ png_image_read_direct_scaled(png_voidp argument=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 png_read_row(png_ptr, local_row, N=
ULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Copy from local_row to user buf=
fer. */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(output_row, local_row, (siz=
e_t)row_bytes);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(output_row, local_row, copy=
_bytes);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output_row +=3D row_bytes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; diff --git a/meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1=
.6.42.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.42.bb</a> b/meta/=
recipes-<br>
&gt; multimedia/libpng/<a href=3D"http://libpng_1.6.42.bb" rel=3D"noreferre=
r" target=3D"_blank">libpng_1.6.42.bb</a><br>
&gt; index 6dc7ffe2722..fe99e5df092 100644<br>
&gt; --- a/meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.42.b=
b" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.42.bb</a><br>
&gt; +++ b/meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.42.b=
b" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.42.bb</a><br>
&gt; @@ -21,6 +21,7 @@ SRC_URI =3D<br>
&gt; &quot;${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.t=
ar.xz<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-65018-0=
2.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-66293-0=
1.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-66293-0=
2.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-22695.patch =
\<br>
&gt;=C2=A0 &quot;<br>
&gt; <br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D<br>
&gt; &quot;c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450=
&quot;<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000bdd12f0649fb187c--

