Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBAAFF494A
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 06:00:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44894.1774850400479275637
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 23:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kDjwb45x;
 spf=pass (domain: mvista.com, ip: 209.85.208.51, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66aed966c7eso6466409a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 23:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774850399; cv=none;
        d=google.com; s=arc-20240605;
        b=bMtO44Qs61pWpE/MHRa7rlufv71eJppJt9WkFqr3K0VvnaBBFA2VQJQak7n3MxNRrc
         8z4eZuU0O2IEV0ETG8k/p6M50Spc6p2CZ8ts3UINyCeYne6ydFUmyEjCNkGblQ6YFniH
         57gUp3cF31L6CwLJVGOJYmEQPigx+jU07AiXsUlzBf5auwd2uMlsFLeVnCVPYhFjl+Hy
         dldxwo6bIsP0WWkZqm4g6s/wm98SH83cd+mpF0j05PexN7xTmRKPiyECWTVr1DV5RGQO
         XY+yemh7A6+eJKcA7cUHsi4PnszslK/9+WjO0tax5PsRtHcDMlMLWuPSMvZ0TDeEIqM/
         tzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7FUBw3Y7YnXDRe3x9h/Sho7k0+kPEcZRfZqIlBycrnQ=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=CzlyLzTjKu7WT2i69JiQhfvtoca+jaR/NZegMHj9mDZHil9gSwKaAJxWMA0YdRM7Sd
         nSHjGs5GHCM6q6j1zB2z152kUxGDl+S1W5HWxXlnKg38EIQpu0rXFL4H5yAfEK+CMUGz
         3z2Ta8q0U6JS0FDVnVBpVxCEtpLx9yIlY+kMOD8VdH3B2zGwr7OdfIvNPauet98a5QJX
         1Ie7l/1/ANMnUL8/R0yAWJa85tatmzGWhQIUqUv4kzJVgMv3LzIwm5NVVIojgIPuO9VW
         IFTw4ZWxqzQ/ygS2GJgvltQ+KDqes4j70kXNbf6qJOKOy5OcjizzI6+CMbkZJVVicdai
         hJCQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774850399; x=1775455199; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7FUBw3Y7YnXDRe3x9h/Sho7k0+kPEcZRfZqIlBycrnQ=;
        b=kDjwb45xYThrDtAx3a59iFwKlnXc1ACxjgisyPAkPc6NpOoQ5HyNaWXLRcWTNSwTQn
         T61QAGUFyr8h8z0bIOXApJxTDRiCIIXiTfjqOsNsXjdvYvQRjxtTAERXGAXjYAE937d5
         oa45oHlbGatOegmaT+GyZydN0fjZg6Tav7IPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774850399; x=1775455199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FUBw3Y7YnXDRe3x9h/Sho7k0+kPEcZRfZqIlBycrnQ=;
        b=NHhZ5wLrv6A+jJpEgBfj1gFdlbSs00JPiQm3l4MtIdoKCbC+zxYam14n/1W9PcDMMV
         L5i04edMXEpPLP8JuOLByWrc2Zxpad4LCq1cPfO+mpnq5CoSUgr6pRWKpjy4Y5Qzh7ji
         GHTW79v2jEUyTk5DS8ijR+X3DaXFifZK5OkWM3onSrwqPxwTMYpi9iticQend+fzPSwI
         kK85XCz9V2PmUFzErska80v4vYf/n2LnLbuibA9L2TUkI1upYhWCHm22Ny1AxkRmMRmV
         dCTHlehNA9hyb89LwqU8x81Leh3Kj+56tn4PX0E3HT8oJtJpOIuNKSRRaQRC6Czt48GN
         rbfg==
X-Gm-Message-State: AOJu0YxRxpf+8luSEJwewQ0PPR9QOHoE5cat0VS6HyT0jgMJT29/mJJj
	F+Se0e0Vui6JNGrQSjwtra9w4wUKV8wnMUH3cPesQ3hmDqY7jbA32jZ5R8pVKhLLPOwrugWLiAB
	dylIbgBxeqic112dPqjmyTzP/B8BON26uifJXAJujuA==
X-Gm-Gg: ATEYQzxDr5Zy1YebJ327ZCFPop9CZM5CbvzQwxLGbMIYc9womeu1fxOHnNxJv8T9DB9
	5iJEASzF1FLHWBF6NJKEmKISDe1o5CXC3pJrK6ZxDHeVWRSOrvLni1C8ypPr9GYM81CwfvzNdQo
	KfVtln9LLp0lmE4BdCwE9ZPvucORZy9A9pwkVEj9GMl1Hryi0m4Rv6VVWdS6O0ENHhLe+pGbQd+
	RVYoXu1UKOoJMxqDtUFZJovdCIX762UY/FuYRms7MOFX3WsaRecC8i9t/DXzeVeUzpK5IVR8qz6
	44WKudr/q/sdXRd9tg==
X-Received: by 2002:a05:6402:1d49:b0:66b:cdfa:c923 with SMTP id
 4fb4d7f45d1cf-66bcdface7dmr1857940a12.5.1774850398693; Sun, 29 Mar 2026
 22:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260217081454.864791-1-vanusuri@mvista.com> <DHFLXG1K82R7.3EOQRZ2H6KW8Q@smile.fr>
In-Reply-To: <DHFLXG1K82R7.3EOQRZ2H6KW8Q@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 30 Mar 2026 11:29:46 +0530
X-Gm-Features: AQROBzDgf3px9KYoUppRxhYY95ERHuIU6-MOxoBerv94Wi2qo49ij1FNCy54jQI
Message-ID: <CANQUz1-c4PHt16WR9siDppAavk=Ed-9b4VApW-2_ZRwLyKVSoA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch] gnutls: Fix CVE-2025-14831
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008b3649064e378f3d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 06:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234196

--0000000000008b3649064e378f3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for pointing that out.

I=E2=80=99ve removed the commented hunk as suggested. I had already fixed i=
t in the
whinlatter branch, but missed sending the update for scarthgap
earlier=E2=80=94sorry about that.

I will send the v2 patch soon.

Thanks again for the review!

Thanks & Regards,

Vijay


On Mon, Mar 30, 2026 at 3:38=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Tue Feb 17, 2026 at 9:14 AM CET, Vijay Anusuri via
> lists.openembedded.org wrote:
> > Picked commits which mentions this CVE per [1].
> >
> > [1] https://ubuntu.com/security/CVE-2025-14831
> > [2] https://security-tracker.debian.org/tracker/CVE-2025-14831
> > [3] https://gitlab.com/gnutls/gnutls/-/issues/1773
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../gnutls/gnutls/CVE-2025-14831-1.patch      |  61 +++
> >  .../gnutls/gnutls/CVE-2025-14831-2.patch      |  30 ++
> >  .../gnutls/gnutls/CVE-2025-14831-3.patch      |  45 ++
> >  .../gnutls/gnutls/CVE-2025-14831-4.patch      | 200 +++++++
> >  .../gnutls/gnutls/CVE-2025-14831-5.patch      | 500 ++++++++++++++++++
> >  .../gnutls/gnutls/CVE-2025-14831-6.patch      | 119 +++++
> >  .../gnutls/gnutls/CVE-2025-14831-7.patch      | 150 ++++++
> >  .../gnutls/gnutls/CVE-2025-14831-8.patch      | 105 ++++
> >  .../gnutls/gnutls/CVE-2025-14831-9.patch      | 437 +++++++++++++++
> >  meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   9 +
> >  10 files changed, 1656 insertions(+)
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
> >
> > [...]
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
> > new file mode 100644
> > index 0000000000..27ed995d8d
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
> > @@ -0,0 +1,437 @@
> > +Backport of:
> > +
> > +From d6054f0016db05fb5c82177ddbd0a4e8331059a1 Mon Sep 17 00:00:00 2001
> > +From: Alexander Sosedkin <asosedkin@redhat.com>
> > +Date: Wed, 4 Feb 2026 20:03:49 +0100
> > +Subject: [PATCH] x509/name_constraints:
> name_constraints_node_list_intersect
> > + over sorted
> > +
> > +Fixes: #1773
> > +Fixes: GNUTLS-SA-2026-02-09-2
> > +Fixes: CVE-2025-14831
> > +
> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/d6054f0016db05fb5c82177ddbd0a4e=
8331059a1
> ]
> > +CVE: CVE-2025-14831
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + NEWS                        |   7 +
> > + lib/x509/name_constraints.c | 350 ++++++++++++++---------------------=
-
> > + 2 files changed, 142 insertions(+), 215 deletions(-)
> > +
> > +#diff --git a/NEWS b/NEWS
> > +#index e506db547a..96b7484fdf 100644
> > +#--- a/NEWS
> > +#+++ b/NEWS
> > +#@@ -14,6 +14,13 @@ See the end for copying conditions.
> > +#    Reported by Jaehun Lee.
> > +#    [Fixes: GNUTLS-SA-2026-02-09-1, CVSS: high] [CVE-2026-1584]
> > +#
> > +#+** libgnutls: Fix name constraint processing performance issue
> > +#+   Verifying certificates with pathological amounts of name
> constraints
> > +#+   could lead to a denial of service attack via resource exhaustion.
> > +#+   Reworked processing algorithms exhibit better performance
> characteristics.
> > +#+   Reported by Tim Scheckenbach.
> > +#+   [Fixes: GNUTLS-SA-2026-02-09-2, CVSS: medium] [CVE-2025-14831]
> > +#+
> > +# ** libgnutls: Fix multiple unexploitable overflows
> > +#    Reported by Tim R=C3=BChsen (#1783, #1786).
> > +#
>
> Hello,
>
> When I reviewed this patch for whinlatter, I asked for this commented
> hunk to be removed. Can you also remove it here as well?
>
> Generally, since you often send patches for multiple stable branches in
> parallel, when you get a review for one branch that applies for your
> others patches, please fix those as well.
>
> Thanks!
> --
> Yoann Congal
> Smile ECS
>
>

--0000000000008b3649064e378f3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p><span>Hi Yoann,</span></p><p><span>Thanks for pointing =
that out.</span></p><p><span>I=E2=80=99ve removed the commented hunk as sug=
gested. I had already fixed it in the whinlatter branch, but missed sending=
 the update for scarthgap earlier=E2=80=94sorry about that.<br></span></p><=
p><span>I will send the v2 patch soon.<br></span></p><p>Thanks again for th=
e review!<br><br></p><p>Thanks &amp; Regards,<br></p><p>Vijay</p><br></div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 30, 2026 at 3:38=E2=80=AFAM Yoann Congal &lt;<a=
 href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue Feb 17, =
2026 at 9:14 AM CET, Vijay Anusuri via <a href=3D"http://lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote=
:<br>
&gt; Picked commits which mentions this CVE per [1].<br>
&gt;<br>
&gt; [1] <a href=3D"https://ubuntu.com/security/CVE-2025-14831" rel=3D"nore=
ferrer" target=3D"_blank">https://ubuntu.com/security/CVE-2025-14831</a><br=
>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2025-14=
831" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/CVE-2025-14831</a><br>
&gt; [3] <a href=3D"https://gitlab.com/gnutls/gnutls/-/issues/1773" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/gnutls/gnutls/-/issues/177=
3</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-1.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 61 +++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-2.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 30 ++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-3.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 45 ++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-4.patch=C2=A0 =C2=A0 =C2=A0 | 2=
00 +++++++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-5.patch=C2=A0 =C2=A0 =C2=A0 | 5=
00 ++++++++++++++++++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-6.patch=C2=A0 =C2=A0 =C2=A0 | 1=
19 +++++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-7.patch=C2=A0 =C2=A0 =C2=A0 | 1=
50 ++++++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-8.patch=C2=A0 =C2=A0 =C2=A0 | 1=
05 ++++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-9.patch=C2=A0 =C2=A0 =C2=A0 | 4=
37 +++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.4.bb" r=
el=3D"noreferrer" target=3D"_blank">gnutls_3.8.4.bb</a>=C2=A0 =C2=A0|=C2=A0=
 =C2=A09 +<br>
&gt;=C2=A0 10 files changed, 1656 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-1.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-2.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-3.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-4.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-5.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-6.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-7.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-8.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-9.patch<br>
&gt;<br>
&gt; [...]<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..27ed995d8d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch<br>
&gt; @@ -0,0 +1,437 @@<br>
&gt; +Backport of:<br>
&gt; +<br>
&gt; +From d6054f0016db05fb5c82177ddbd0a4e8331059a1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" =
target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +Date: Wed, 4 Feb 2026 20:03:49 +0100<br>
&gt; +Subject: [PATCH] x509/name_constraints: name_constraints_node_list_in=
tersect<br>
&gt; + over sorted<br>
&gt; +<br>
&gt; +Fixes: #1773<br>
&gt; +Fixes: GNUTLS-SA-2026-02-09-2<br>
&gt; +Fixes: CVE-2025-14831<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@red=
hat.com" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/d6054f0016db05fb5c82177ddbd0a4e8331059a1" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/d6054f0016db05fb5c=
82177ddbd0a4e8331059a1</a>]<br>
&gt; +CVE: CVE-2025-14831<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + NEWS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
&gt; + lib/x509/name_constraints.c | 350 ++++++++++++++--------------------=
--<br>
&gt; + 2 files changed, 142 insertions(+), 215 deletions(-)<br>
&gt; +<br>
&gt; +#diff --git a/NEWS b/NEWS<br>
&gt; +#index e506db547a..96b7484fdf 100644<br>
&gt; +#--- a/NEWS<br>
&gt; +#+++ b/NEWS<br>
&gt; +#@@ -14,6 +14,13 @@ See the end for copying conditions.<br>
&gt; +#=C2=A0 =C2=A0 Reported by Jaehun Lee.<br>
&gt; +#=C2=A0 =C2=A0 [Fixes: GNUTLS-SA-2026-02-09-1, CVSS: high] [CVE-2026-=
1584]<br>
&gt; +# <br>
&gt; +#+** libgnutls: Fix name constraint processing performance issue<br>
&gt; +#+=C2=A0 =C2=A0Verifying certificates with pathological amounts of na=
me constraints<br>
&gt; +#+=C2=A0 =C2=A0could lead to a denial of service attack via resource =
exhaustion.<br>
&gt; +#+=C2=A0 =C2=A0Reworked processing algorithms exhibit better performa=
nce characteristics.<br>
&gt; +#+=C2=A0 =C2=A0Reported by Tim Scheckenbach.<br>
&gt; +#+=C2=A0 =C2=A0[Fixes: GNUTLS-SA-2026-02-09-2, CVSS: medium] [CVE-202=
5-14831]<br>
&gt; +#+<br>
&gt; +# ** libgnutls: Fix multiple unexploitable overflows<br>
&gt; +#=C2=A0 =C2=A0 Reported by Tim R=C3=BChsen (#1783, #1786).<br>
&gt; +# <br>
<br>
Hello,<br>
<br>
When I reviewed this patch for whinlatter, I asked for this commented<br>
hunk to be removed. Can you also remove it here as well?<br>
<br>
Generally, since you often send patches for multiple stable branches in<br>
parallel, when you get a review for one branch that applies for your<br>
others patches, please fix those as well.<br>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--0000000000008b3649064e378f3d--

