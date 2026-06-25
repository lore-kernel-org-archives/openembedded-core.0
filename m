Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED20ECDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 12:29:33 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10347.1782390570370993345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 05:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GtCcHjwg;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: awais.belal@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-929a7eedde8so24551885a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 05:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782390569; cv=none;
        d=google.com; s=arc-20260327;
        b=e90PXZtcg+HNyCVYPCCLuKdHPJlmebt6qiN6TaZzh1Ss6ffs8JosPf08QNJXsf2L7q
         zWziwJl6CsJC9RWXGuCPxl8ScZH1070AvjSH4y7vg9Toh/h9t18k2CHyH/YWycuqI/1/
         L2l81GBr9fLJMvc3gyH9jb/k1lAw+IaLr+6dufLhTl7Re3PNsnD6HRLKj6QsfL8OOUdU
         v2u0r7BUrm9wXuJK4SdVosPWoK/OB1FW3TiLeLwgMwaVwQJCpjp/DR6GfK6+d7o559UA
         BTwuCN+l2q9qsHvvND218J6YPGULlBxty+MJuW+0wFm9+nK+S9LjnMRtRGHABBemxLfm
         C3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Da/WlupdomnssiaKotSonnC0SYvaqhVXrzAWnqqzXsA=;
        fh=iT17vgP+1RGLs1lJpZGBUF3q7H6YKyDyTGWW1cVZqI4=;
        b=A6zGkPYoFA2zvKD8nc2aLp2ijVkMgP1RSlIBGCklvfi15fKsMP+xwISw48t8QmhC6o
         Ku9ka5yphKRdkMSeJm2c9dwoHvQcdvY5kYwglRwnYUOE+ALaYLvIZoVCz1ujLkJXKYpa
         /2jAWeUafh+H7K965qTt/1Y0lgCZAW0KeJRGZqVF8H3pwcRN2Ed8RiAaE+Y2FrDr1z4V
         NjdsUCkt5wXT6RL1E0FPQuL4jR43W2b6XehFbNpnCE28qZZjqv3rnPfCRnB+w/pvF3eW
         mwoWnp/vpCtEXEaZMaMZiZw1V/C80ecfnztBtH0sE6XeWSWfgLBo7TBGuwtgPIf3tmpe
         fDZA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782390569; x=1782995369; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Da/WlupdomnssiaKotSonnC0SYvaqhVXrzAWnqqzXsA=;
        b=GtCcHjwgwGs/sCDwAWjKaylrnS0u9XYLHJm7IiQ9n4RL2kA2N4WlBTRscRbECT6ALK
         j4TTIbHNPrpcJ6O9iMgZDKOX11XvfTFErD195fDp/a/7JnS5sPmnRuSQ603Hh+goUDYC
         knwp3uMtaY38T/fDmy/7AOPSTLE+0nnYHewRv9GAXr9RsylhzxhkaTBqFNuP39nSNSm6
         nIfYVjC4tKPlDds4RTaZ4LccEeDvBPd2q8Al/Nbkfi9pg1nNwzAOJ9hk03JUDNP7oMPg
         VqsGDR5FhqOdIhyprMqWP8EWPeRAmxyGx9XHyhfFpaY1w85De6/0yIZgzPLaPTRrXM43
         LUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782390569; x=1782995369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da/WlupdomnssiaKotSonnC0SYvaqhVXrzAWnqqzXsA=;
        b=Qqrl8gJycYs6VuKdr2jq025PloArvhM5CgV/pIFP9/OPu3N674vbED2DAr2roWu9a/
         T6x6Us0Z/f9qraIAvcsfAy+v1V6yU+aS3bPDXR7H1sD3nEmdmkk0+BTNJCqzzgi8kTFf
         hFpNhptBy26IR9ZANpyGg8vCBsQncg/qXQWB61urmJik0++w1e8WvBZmuZZled9s6ylM
         ZSgOaMtHX+ZJTfE4ChHPnYv9kNV5CpMBfMucN6X9XTk1KJu21L7x4vZCtgGPLz4dA1t2
         cKqkrb+15fbwcXexpkmdx/IjSzIP/xbe/K+eoXDBmdY6ExiQowfg4+mppC3OVhf6VCh0
         uilQ==
X-Gm-Message-State: AOJu0YydxLTyNmij4MUk7/SJnmLPGGQ5ncwA6zUghCM+5LAttg5QHbF4
	MNNDdA93xpyp9poI+Sd0ztsdapRxarH9Q/KOcyGUVipXn8ax8YEjDIAOF9tWV/bdw1wQ+DraCbP
	VjCU+yHlCYQuq5R5VC8Xaz3zWDMIy6iM=
X-Gm-Gg: AfdE7cmkGPq+C5X/d2Zx72Rrfx9fGAQw/UV34RCVwtrHKYbAMEEhXBUmlHRxhNUNXku
	5ADqVDBREC4PbT/wgvzaJVVTAmE9q0+/Cu37ntXr2QCbWuryFxYdD84JBPq1vrDQ1hQOaYIuqO8
	hOTn401oPcpAKPJMdeMgL+V45+Ww2YiH5yVnQGG+ZyeL+qlLOijbIgJ5yI+tKT8A0KLHyBADLqo
	ExAmGxNKH6iQEvNgrscHnTNqR2sBmWY5Y9U4PG2IKsxZF6KT+T4w7LURYx0OG4kPw22sMD9ncBJ
	5AerX57X
X-Received: by 2002:a05:620a:4154:b0:920:56af:ceee with SMTP id
 af79cd13be357-9293a8ac323mr317897285a.17.1782390569092; Thu, 25 Jun 2026
 05:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260625111524.3796292-1-awais.belal@gmail.com>
 <DJI3QIVVIZ9I.3K82US4CW443J@smile.fr> <CAM=5AmYZ==fYHq2B9-hNOssywegYhDQ5tr6qmoukAq2ZFmER8g@mail.gmail.com>
 <DJI4KDD3OCFO.1SC80PSP0KVPI@smile.fr>
In-Reply-To: <DJI4KDD3OCFO.1SC80PSP0KVPI@smile.fr>
From: Awais Belal <awais.belal@gmail.com>
Date: Thu, 25 Jun 2026 17:29:17 +0500
X-Gm-Features: AVVi8Cek5F8dRR5p3CdCJA02scvQZGYzmPWw-lfosp_8dDyRztHna79IZScscto
Message-ID: <CAM=5Amb7kc=q5s=x-0G8REWEVsTzWvhEP8h_=J6eLdskcK-5pA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] cve-update-nvd2-native: allow
 setting resultsPerPage
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, Awais B <awais.b@rufilla.com>
Content-Type: multipart/alternative; boundary="000000000000b8cc67065513241a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 12:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239558

--000000000000b8cc67065513241a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I was questionning why CVE_DB_RESULTS_PER_PAGE*_MAX* (notice the _MAX)
> should be. Seems to me that this is a limit imposed by NVD itself and I
> don't see a reason to set it to a different value than 2000 (as given by
> NVD).

Ah, sorry for misreading your comment earlier. I went with a configurable
max for flexibility purposes as well. Consider a scenario where someone
would want to limit the max as well for whatever reason. Even in this
scenario if the NVD limits change all we'd need to do is update a single
variable rather than having to change multiple locations, we could also use
a local var for that but then it won't cover point 1. Still if you think
this is over engineered please let me know.

On Thu, Jun 25, 2026 at 5:22=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Thu Jun 25, 2026 at 1:54 PM CEST, Awais Belal wrote:
> > Hi Yoann,
> >
> > Thanks for picking this up
> >
> >> What value are you using? Especially in the last few days...
> >
> > I've seen much better results with a cap of 500/1000 than the default o=
f
> > 2000.
> >
> >> I'm not sure CVE_DB_RESULTS_PER_PAGE_MAX should be a bitbake variable =
(I
> >> don't see a reason for it to be configurable). Can you simplify the co=
de
> >> a little by making it a constant in the code instead? We already have =
a
> >> handfull of hardcoded limits from NVD.
> >
> > Well it is a valid request parameter for starters. This allows the user=
s
> to
> > control it from the configurations rather than hard coding to any limit=
s
> > someone sees fitting for their environment so more flexibility. Not
> setting
> > the variable defaults to the limits recommended by NVD however my
> analysis
> > shows that these days due to bulk updates on the NVD side the fetch has
> > failed most of the time due to an "incomplete read" error.
>
> I agree that a configurable CVE_DB_RESULTS_PER_PAGE looks like a good ide=
a.
>
> I was questionning why CVE_DB_RESULTS_PER_PAGE*_MAX* (notice the _MAX)
> should be. Seems to me that this is a limit imposed by NVD itself and I
> don't see a reason to set it to a different value than 2000 (as given by
> NVD).
>
> >
> > On Thu, Jun 25, 2026 at 4:43=E2=80=AFPM Yoann Congal <yoann.congal@smil=
e.fr>
> wrote:
> >
> >> Hello,
> >>
> >> Thanks for looking at this!
> >>
> >> On Thu Jun 25, 2026 at 1:15 PM CEST, Awais Belal via
> >> lists.openembedded.org wrote:
> >> > From: Awais B <awais.b@rufilla.com>
> >> >
> >> > It is seen that during bulk updates on the NVD side the server
> >> > struggles to keep up with the default/max of 2000 entries per
> >> > page and we see a lot of incomplete read errors resulting in
> >> > proper db sync failures most of the times. Lowering the per
> >> > page value noticably increases the reliability of the process
> >> > and hence should ideally be configurable.
> >>
> >> What value are you using? Especially in the last few days...
> >>
> >> >
> >> > Signed-off-by: Awais B <awais.b@rufilla.com>
> >> > ---
> >> >  meta/recipes-core/meta/cve-update-nvd2-native.bb | 14 +++++++++++++=
+
> >> >  1 file changed, 14 insertions(+)
> >> >
> >> > diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> >> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> >> > index 945bd1d927..5d8b76e62c 100644
> >> > --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> >> > +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> >> > @@ -34,6 +34,11 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
> >> >  # Number of attempts for each http query to nvd server before givin=
g
> up
> >> >  CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
> >> >
> >> > +# Maximum number of CVE records per API response. Default/max is
> 2000.
> >> > +# Lowering this value can help avoid incomplete read errors during
> bulk
> >> NVD updates.
> >> > +CVE_DB_RESULTS_PER_PAGE ?=3D ""
> >> > +CVE_DB_RESULTS_PER_PAGE_MAX ?=3D "2000"
> >> > +
> >> >  CVE_CHECK_DB_DLDIR_FILE ?=3D
> >> "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAME}"
> >> >  CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
> >> >  CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
> >> > @@ -217,6 +222,15 @@ def update_db_file(db_tmp_file, d,
> database_time):
> >> >          api_key =3D d.getVar("NVDCVE_API_KEY") or None
> >> >          attempts =3D int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
> >> >
> >> > +        results_per_page =3D d.getVar("CVE_DB_RESULTS_PER_PAGE")
> >> > +        results_per_page_max =3D
> >> int(d.getVar("CVE_DB_RESULTS_PER_PAGE_MAX"))
> >>
> >> I'm not sure CVE_DB_RESULTS_PER_PAGE_MAX should be a bitbake variable =
(I
> >> don't see a reason for it to be configurable). Can you simplify the co=
de
> >> a little by making it a constant in the code instead? We already have =
a
> >> handfull of hardcoded limits from NVD.
> >>
> >> > +        if results_per_page:
> >> > +            results_per_page =3D int(results_per_page)
> >> > +            if results_per_page > results_per_page_max:
> >> > +                bb.warn("CVE_DB_RESULTS_PER_PAGE exceeds maximum of
> %d,
> >> capping" % results_per_page_max)
> >> > +                results_per_page =3D results_per_page_max
> >> > +            req_args['resultsPerPage'] =3D results_per_page
> >> > +
> >> >          # Recommended by NVD
> >> >          wait_time =3D 6
> >> >          if api_key:
> >>
> >>
> >> --
> >> Yoann Congal
> >> Smile ECS
> >>
> >>
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--=20
Regards,
Awais Belal

--000000000000b8cc67065513241a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; I was questionning why CVE_DB_RESULTS_PER_PAGE*_MAX* =
(notice the _MAX)<br>&gt; should be. Seems to me that this is a limit impos=
ed by NVD itself and I<br>&gt; don&#39;t see a reason to set it to a differ=
ent value than 2000 (as given by<br>&gt; NVD).<div><br></div><div>Ah, sorry=
 for misreading your comment earlier. I went with a configurable max for fl=
exibility purposes as well. Consider a scenario where someone would want to=
 limit the max as well for whatever reason. Even in this scenario if the NV=
D limits change all we&#39;d need to do is update a single variable rather =
than having to change multiple locations, we could also use a local var for=
 that but then it won&#39;t cover point 1. Still if you think this is over =
engineered please let me know.</div></div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 25, 2=
026 at 5:22=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smil=
e.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Thu Jun 25, 2026 at 1:54 PM CEST, Awais Belal=
 wrote:<br>
&gt; Hi Yoann,<br>
&gt;<br>
&gt; Thanks for picking this up<br>
&gt;<br>
&gt;&gt; What value are you using? Especially in the last few days...<br>
&gt;<br>
&gt; I&#39;ve seen much better results with a cap of 500/1000 than the defa=
ult of<br>
&gt; 2000.<br>
&gt;<br>
&gt;&gt; I&#39;m not sure CVE_DB_RESULTS_PER_PAGE_MAX should be a bitbake v=
ariable (I<br>
&gt;&gt; don&#39;t see a reason for it to be configurable). Can you simplif=
y the code<br>
&gt;&gt; a little by making it a constant in the code instead? We already h=
ave a<br>
&gt;&gt; handfull of hardcoded limits from NVD.<br>
&gt;<br>
&gt; Well it is a valid request parameter for starters. This allows the use=
rs to<br>
&gt; control it from the configurations rather than hard coding to any limi=
ts<br>
&gt; someone sees fitting for their environment so more flexibility. Not se=
tting<br>
&gt; the variable defaults to the limits recommended by NVD however my anal=
ysis<br>
&gt; shows that these days due to bulk updates on the NVD side the fetch ha=
s<br>
&gt; failed most of the time due to an &quot;incomplete read&quot; error.<b=
r>
<br>
I agree that a configurable CVE_DB_RESULTS_PER_PAGE looks like a good idea.=
<br>
<br>
I was questionning why CVE_DB_RESULTS_PER_PAGE*_MAX* (notice the _MAX)<br>
should be. Seems to me that this is a limit imposed by NVD itself and I<br>
don&#39;t see a reason to set it to a different value than 2000 (as given b=
y<br>
NVD).<br>
<br>
&gt;<br>
&gt; On Thu, Jun 25, 2026 at 4:43=E2=80=AFPM Yoann Congal &lt;<a href=3D"ma=
ilto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;=
 wrote:<br>
&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; Thanks for looking at this!<br>
&gt;&gt;<br>
&gt;&gt; On Thu Jun 25, 2026 at 1:15 PM CEST, Awais Belal via<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt; &gt; From: Awais B &lt;<a href=3D"mailto:awais.b@rufilla.com" targ=
et=3D"_blank">awais.b@rufilla.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It is seen that during bulk updates on the NVD side the serve=
r<br>
&gt;&gt; &gt; struggles to keep up with the default/max of 2000 entries per=
<br>
&gt;&gt; &gt; page and we see a lot of incomplete read errors resulting in<=
br>
&gt;&gt; &gt; proper db sync failures most of the times. Lowering the per<b=
r>
&gt;&gt; &gt; page value noticably increases the reliability of the process=
<br>
&gt;&gt; &gt; and hence should ideally be configurable.<br>
&gt;&gt;<br>
&gt;&gt; What value are you using? Especially in the last few days...<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Awais B &lt;<a href=3D"mailto:awais.b@rufilla.=
com" target=3D"_blank">awais.b@rufilla.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-core/meta/<a href=3D"http://cve-update-nvd=
2-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb=
</a> | 14 ++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 14 insertions(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-upd=
ate-nvd2-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-na=
tive.bb</a><br>
&gt;&gt; b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.=
bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
&gt;&gt; &gt; index 945bd1d927..5d8b76e62c 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd=
2-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb=
</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd=
2-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb=
</a><br>
&gt;&gt; &gt; @@ -34,6 +34,11 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D &quot;10=
368000&quot;<br>
&gt;&gt; &gt;=C2=A0 # Number of attempts for each http query to nvd server =
before giving up<br>
&gt;&gt; &gt;=C2=A0 CVE_DB_UPDATE_ATTEMPTS ?=3D &quot;5&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +# Maximum number of CVE records per API response. Default/ma=
x is 2000.<br>
&gt;&gt; &gt; +# Lowering this value can help avoid incomplete read errors =
during bulk<br>
&gt;&gt; NVD updates.<br>
&gt;&gt; &gt; +CVE_DB_RESULTS_PER_PAGE ?=3D &quot;&quot;<br>
&gt;&gt; &gt; +CVE_DB_RESULTS_PER_PAGE_MAX ?=3D &quot;2000&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 CVE_CHECK_DB_DLDIR_FILE ?=3D<br>
&gt;&gt; &quot;${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAME}&quot;<br>
&gt;&gt; &gt;=C2=A0 CVE_CHECK_DB_DLDIR_LOCK ?=3D &quot;${CVE_CHECK_DB_DLDIR=
_FILE}.lock&quot;<br>
&gt;&gt; &gt;=C2=A0 CVE_CHECK_DB_TEMP_FILE ?=3D &quot;${CVE_CHECK_DB_FILE}.=
tmp&quot;<br>
&gt;&gt; &gt; @@ -217,6 +222,15 @@ def update_db_file(db_tmp_file, d, datab=
ase_time):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 api_key =3D d.getVar(&quot;=
NVDCVE_API_KEY&quot;) or None<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attempts =3D int(d.getVar(&=
quot;CVE_DB_UPDATE_ATTEMPTS&quot;))<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 results_per_page =3D d.getVar(&q=
uot;CVE_DB_RESULTS_PER_PAGE&quot;)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 results_per_page_max =3D<br>
&gt;&gt; int(d.getVar(&quot;CVE_DB_RESULTS_PER_PAGE_MAX&quot;))<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m not sure CVE_DB_RESULTS_PER_PAGE_MAX should be a bitbake v=
ariable (I<br>
&gt;&gt; don&#39;t see a reason for it to be configurable). Can you simplif=
y the code<br>
&gt;&gt; a little by making it a constant in the code instead? We already h=
ave a<br>
&gt;&gt; handfull of hardcoded limits from NVD.<br>
&gt;&gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if results_per_page:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results_per_page =
=3D int(results_per_page)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if results_per_pag=
e &gt; results_per_page_max:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.w=
arn(&quot;CVE_DB_RESULTS_PER_PAGE exceeds maximum of %d,<br>
&gt;&gt; capping&quot; % results_per_page_max)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resu=
lts_per_page =3D results_per_page_max<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req_args[&#39;resu=
ltsPerPage&#39;] =3D results_per_page<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Recommended by NVD<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wait_time =3D 6<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if api_key:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Yoann Congal<br>
&gt;&gt; Smile ECS<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">Regards,<br>Awais Belal</div>

--000000000000b8cc67065513241a--

