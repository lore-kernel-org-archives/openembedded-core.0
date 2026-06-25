Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98822CDE007
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 11:55:10 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9503.1782388501235141807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 04:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PISAOvtF;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: awais.belal@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-915ab38ac14so280052185a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 04:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782388500; cv=none;
        d=google.com; s=arc-20260327;
        b=qNMotAZJDqwKFP+LPZH61Nrz7oNKZRzorXWbDCE9ZRTVAaxKQ+3/9WaqTFhpBF4C58
         fJ1yrAssJKcE0br6BJpVtgdTllCHHUT/lCwAsYV7A3wIESBFZeXhBlMHzRgjzNKcHxoS
         BeFf9J1Abj/Z+wEWZVvEFS9uQ9RLWBfbewjJycksulR0nnwkcGcLjnovRrW3ABKB4hmo
         mFWhguCnzoDNGn10kBasBUD11y5/efxFMc5h0un7Zi5Bu7FfhcYFCBlkR+9Jk5DIYTPY
         rCtVhn79wENydKmBPhwEUvyJJTzzvOCtjfjMtALMpxv3JuIdJsnLyzejVwZaWkVFoyei
         8sSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q25RtasFrtHcJRxSxsfVnpxX2rTDacc6twTYzeAVluo=;
        fh=iT17vgP+1RGLs1lJpZGBUF3q7H6YKyDyTGWW1cVZqI4=;
        b=rGgz2gE2askmKjT94yrDaMEMiCgvOgjzVNGjMr63Ym1KHBeRG4qauhJDB1qYLYM1eP
         pEQZBGLAeBB80vIz+FqLj3sw8YquglmnR/w+Qbx0VxrruLYFNmdy4fmn2ZX16pJo2CKc
         69sMUqeYD/TsFbxfKQodRPo6iov0CNl0ki/ybdiWneWlVMElD7MHbK0iOOJ1yHvMrifk
         8DY/aDVKUdzRTk0SyZF/0x2ZP0u/nnTgvfj2lFqpt9od7YsWba7iYgqgUNRutpqEg9cx
         S5cMeumwa2PucHtCgmEFQHIuML7hFTH1uy/0xjfvGxwcUkAES22UBpqUjhtdcErcjeyH
         UrqQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782388500; x=1782993300; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q25RtasFrtHcJRxSxsfVnpxX2rTDacc6twTYzeAVluo=;
        b=PISAOvtFQ7RsyrJb1pXBHVFp0bWAc2h11s9S0pV4FKnFc/XRLm8Ut+57BCH+/v7Edh
         +oeJoNJ/2SCSJWIscT8P7URj7O9v2vJb9GoAzhZ4XMZ4OexM5vNLNksnip6SQ//4r9Tv
         w0f6+2RHCfGWOpUvJVKT/KqRuSpGxiepKHlkwyT4rol4NQJMLoohBcco02vDq/ue2t4G
         ppXjYIDqeBDdtAstSyloz6Auo3pCezxx/cLuJ41NOvQQ4YOLdgefHO7IZllz822F7dNA
         pd0PC7NslIVr8h9oIB4ecvHOw5+CvHuBXiuM/UKLEYnBmIWMvB7UOjQv93foDpw+EPVR
         KONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782388500; x=1782993300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q25RtasFrtHcJRxSxsfVnpxX2rTDacc6twTYzeAVluo=;
        b=WsRi8UrOgJAXiykx6V/+KwMSzo8kfToXfiAhnPK3C4B9sH7+TzlhRzBn2kU8JtJi9v
         iFMHdq7yx3D8qpWOTLkAYC10AUFgL+cms91jKlnJF0GczatzLunpaZjqCtnKJCCjVy55
         FY7LkTD1BPRr4isDxiaTFxwcKTsBoyjl/WOFFDmJ25JoeAsbf3p0EvL4/023S8U6hWkk
         Axtd4ABx5wDY9H50GygigrikeOrIiIb3iRON+z0vxkslxcz1/6mVaQwjWkJx2R8+UwLW
         MYUaQdO1ElchZ1rXjOtbcq9vPEywU4JMQY16fxn9q9DvBFRHjldzk8jyYRgnESx6yyW9
         gfMg==
X-Gm-Message-State: AOJu0YwbM9wwT3G4g0xfTFiNSAShoHYim+VhaMUVO387Bd5b+xlErY5T
	zmZdFjVtZeeCOVja2nwDZla4/L0Qq2L4Jf68pnF1YYd+671iC4UREVNFIKDtML1zenZGlzAqN6O
	GgqZ/50CHh/9PmdJ+FGX01AHbBMp22xU=
X-Gm-Gg: AfdE7cld5dZPbrqZ/nPdjCrMbySDXbeUXwISVxTNmXXxQQRmSN3p7c2OZRpXFBLT2Yz
	vu5uf8qHNC83hNpNmKOm3O65+nfvyK+LNVrfWqWQzjTTBlOQY32/FAPIC+TgnhZeCJB5kWrtnSN
	S3z95uuRnxQpxh4GpwmpyqliwCpcFEOg/rM7zbWT4JPWw2Z9M8krmAG+SxjF0CGBXcmECOa7B/a
	fTVtKR3P9Vnuo0xjl7JOrbk0hCX5ovSgVsUVC2BQYDrUVPRBvtkjEAoK1hFPDrQwcKshcjGtA==
X-Received: by 2002:a05:620a:45a0:b0:915:cda5:27fb with SMTP id
 af79cd13be357-9293e3c8e45mr286182385a.54.1782388499882; Thu, 25 Jun 2026
 04:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260625111524.3796292-1-awais.belal@gmail.com> <DJI3QIVVIZ9I.3K82US4CW443J@smile.fr>
In-Reply-To: <DJI3QIVVIZ9I.3K82US4CW443J@smile.fr>
From: Awais Belal <awais.belal@gmail.com>
Date: Thu, 25 Jun 2026 16:54:48 +0500
X-Gm-Features: AVVi8Ccve3X_wARLappTuoLlDLVGoJvcABwDTDiBwGEXj5tfAQeho8mAQpv1t-M
Message-ID: <CAM=5AmYZ==fYHq2B9-hNOssywegYhDQ5tr6qmoukAq2ZFmER8g@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] cve-update-nvd2-native: allow
 setting resultsPerPage
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, Awais B <awais.b@rufilla.com>
Content-Type: multipart/alternative; boundary="00000000000063283a065512a914"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 11:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239556

--00000000000063283a065512a914
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for picking this up

> What value are you using? Especially in the last few days...

I've seen much better results with a cap of 500/1000 than the default of
2000.

> I'm not sure CVE_DB_RESULTS_PER_PAGE_MAX should be a bitbake variable (I
> don't see a reason for it to be configurable). Can you simplify the code
> a little by making it a constant in the code instead? We already have a
> handfull of hardcoded limits from NVD.

Well it is a valid request parameter for starters. This allows the users to
control it from the configurations rather than hard coding to any limits
someone sees fitting for their environment so more flexibility. Not setting
the variable defaults to the limits recommended by NVD however my analysis
shows that these days due to bulk updates on the NVD side the fetch has
failed most of the time due to an "incomplete read" error.

On Thu, Jun 25, 2026 at 4:43=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> Hello,
>
> Thanks for looking at this!
>
> On Thu Jun 25, 2026 at 1:15 PM CEST, Awais Belal via
> lists.openembedded.org wrote:
> > From: Awais B <awais.b@rufilla.com>
> >
> > It is seen that during bulk updates on the NVD side the server
> > struggles to keep up with the default/max of 2000 entries per
> > page and we see a lot of incomplete read errors resulting in
> > proper db sync failures most of the times. Lowering the per
> > page value noticably increases the reliability of the process
> > and hence should ideally be configurable.
>
> What value are you using? Especially in the last few days...
>
> >
> > Signed-off-by: Awais B <awais.b@rufilla.com>
> > ---
> >  meta/recipes-core/meta/cve-update-nvd2-native.bb | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> > index 945bd1d927..5d8b76e62c 100644
> > --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> > +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> > @@ -34,6 +34,11 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
> >  # Number of attempts for each http query to nvd server before giving u=
p
> >  CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
> >
> > +# Maximum number of CVE records per API response. Default/max is 2000.
> > +# Lowering this value can help avoid incomplete read errors during bul=
k
> NVD updates.
> > +CVE_DB_RESULTS_PER_PAGE ?=3D ""
> > +CVE_DB_RESULTS_PER_PAGE_MAX ?=3D "2000"
> > +
> >  CVE_CHECK_DB_DLDIR_FILE ?=3D
> "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAME}"
> >  CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
> >  CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
> > @@ -217,6 +222,15 @@ def update_db_file(db_tmp_file, d, database_time):
> >          api_key =3D d.getVar("NVDCVE_API_KEY") or None
> >          attempts =3D int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
> >
> > +        results_per_page =3D d.getVar("CVE_DB_RESULTS_PER_PAGE")
> > +        results_per_page_max =3D
> int(d.getVar("CVE_DB_RESULTS_PER_PAGE_MAX"))
>
> I'm not sure CVE_DB_RESULTS_PER_PAGE_MAX should be a bitbake variable (I
> don't see a reason for it to be configurable). Can you simplify the code
> a little by making it a constant in the code instead? We already have a
> handfull of hardcoded limits from NVD.
>
> > +        if results_per_page:
> > +            results_per_page =3D int(results_per_page)
> > +            if results_per_page > results_per_page_max:
> > +                bb.warn("CVE_DB_RESULTS_PER_PAGE exceeds maximum of %d=
,
> capping" % results_per_page_max)
> > +                results_per_page =3D results_per_page_max
> > +            req_args['resultsPerPage'] =3D results_per_page
> > +
> >          # Recommended by NVD
> >          wait_time =3D 6
> >          if api_key:
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

--00000000000063283a065512a914
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Yoann,<div><br></div><div>Thanks for p=
icking this up</div><div><br></div><div>&gt;=C2=A0<span style=3D"background=
-color:transparent">What value are you using? Especially in the last few da=
ys...</span></div><div><span style=3D"background-color:transparent"><br></s=
pan></div><div><span style=3D"background-color:transparent">I&#39;ve seen m=
uch better results with a cap of 500/1000 than the default of 2000.</span><=
/div><div><span style=3D"background-color:transparent"><br></span></div><di=
v><span style=3D"background-color:transparent">&gt;=C2=A0</span><span style=
=3D"background-color:transparent">I&#39;m not sure CVE_DB_RESULTS_PER_PAGE_=
MAX should be a bitbake variable (I</span></div>&gt; don&#39;t see a reason=
 for it to be configurable). Can you simplify the code<br>&gt; a little by =
making it a constant in the code instead? We already have a<br>&gt; handful=
l of hardcoded limits from NVD.</div><div dir=3D"ltr"><br></div><div>Well i=
t is a valid request parameter for starters. This allows the users to contr=
ol it from the configurations rather than hard coding to any limits someone=
 sees fitting for their environment so more flexibility. Not setting the va=
riable defaults to the limits recommended by NVD however my analysis shows =
that these days due to bulk updates on the NVD side the fetch has failed mo=
st of the time due to an &quot;incomplete read&quot; error.</div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Thu, Jun 25, 2026 at 4:43=E2=80=AFPM Yoann Congal &lt;<a href=3D"m=
ailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
Thanks for looking at this!<br>
<br>
On Thu Jun 25, 2026 at 1:15 PM CEST, Awais Belal via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a> wrote:<br>
&gt; From: Awais B &lt;<a href=3D"mailto:awais.b@rufilla.com" target=3D"_bl=
ank">awais.b@rufilla.com</a>&gt;<br>
&gt;<br>
&gt; It is seen that during bulk updates on the NVD side the server<br>
&gt; struggles to keep up with the default/max of 2000 entries per<br>
&gt; page and we see a lot of incomplete read errors resulting in<br>
&gt; proper db sync failures most of the times. Lowering the per<br>
&gt; page value noticably increases the reliability of the process<br>
&gt; and hence should ideally be configurable.<br>
<br>
What value are you using? Especially in the last few days...<br>
<br>
&gt;<br>
&gt; Signed-off-by: Awais B &lt;<a href=3D"mailto:awais.b@rufilla.com" targ=
et=3D"_blank">awais.b@rufilla.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.=
bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a> | 14=
 ++++++++++++++<br>
&gt;=C2=A0 1 file changed, 14 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-=
native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</=
a> b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" re=
l=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
&gt; index 945bd1d927..5d8b76e62c 100644<br>
&gt; --- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.=
bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
&gt; +++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.=
bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
&gt; @@ -34,6 +34,11 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D &quot;10368000&qu=
ot;<br>
&gt;=C2=A0 # Number of attempts for each http query to nvd server before gi=
ving up<br>
&gt;=C2=A0 CVE_DB_UPDATE_ATTEMPTS ?=3D &quot;5&quot;<br>
&gt;=C2=A0 <br>
&gt; +# Maximum number of CVE records per API response. Default/max is 2000=
.<br>
&gt; +# Lowering this value can help avoid incomplete read errors during bu=
lk NVD updates.<br>
&gt; +CVE_DB_RESULTS_PER_PAGE ?=3D &quot;&quot;<br>
&gt; +CVE_DB_RESULTS_PER_PAGE_MAX ?=3D &quot;2000&quot;<br>
&gt; +<br>
&gt;=C2=A0 CVE_CHECK_DB_DLDIR_FILE ?=3D &quot;${DL_DIR}/CVE_CHECK/${CVE_CHE=
CK_DB_FILENAME}&quot;<br>
&gt;=C2=A0 CVE_CHECK_DB_DLDIR_LOCK ?=3D &quot;${CVE_CHECK_DB_DLDIR_FILE}.lo=
ck&quot;<br>
&gt;=C2=A0 CVE_CHECK_DB_TEMP_FILE ?=3D &quot;${CVE_CHECK_DB_FILE}.tmp&quot;=
<br>
&gt; @@ -217,6 +222,15 @@ def update_db_file(db_tmp_file, d, database_time)=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 api_key =3D d.getVar(&quot;NVDCVE_AP=
I_KEY&quot;) or None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attempts =3D int(d.getVar(&quot;CVE_=
DB_UPDATE_ATTEMPTS&quot;))<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 results_per_page =3D d.getVar(&quot;CVE_D=
B_RESULTS_PER_PAGE&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 results_per_page_max =3D int(d.getVar(&qu=
ot;CVE_DB_RESULTS_PER_PAGE_MAX&quot;))<br>
<br>
I&#39;m not sure CVE_DB_RESULTS_PER_PAGE_MAX should be a bitbake variable (=
I<br>
don&#39;t see a reason for it to be configurable). Can you simplify the cod=
e<br>
a little by making it a constant in the code instead? We already have a<br>
handfull of hardcoded limits from NVD.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if results_per_page:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results_per_page =3D int(re=
sults_per_page)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if results_per_page &gt; re=
sults_per_page_max:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot=
;CVE_DB_RESULTS_PER_PAGE exceeds maximum of %d, capping&quot; % results_per=
_page_max)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results_per_p=
age =3D results_per_page_max<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req_args[&#39;resultsPerPag=
e&#39;] =3D results_per_page<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Recommended by NVD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wait_time =3D 6<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if api_key:<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">Regards,<br>Awais Belal</div></div>

--00000000000063283a065512a914--

