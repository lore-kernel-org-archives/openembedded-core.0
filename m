Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239D5C44501
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 11:32:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8894.1783942338593072213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 04:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=b4KkS5E9;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=H7MEpC23;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9ugi11089817
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 11:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2L9AASChOijBrABWiqZZa8Z
	/prdpO9Um3CE+wXxfiU=; b=b4KkS5E9YWESA8OwmRJr0Ws5xqYm3VNLCPO/6tV1
	sP4VpLuZ8FpK5u92ddkhPvl91z9Ed7aHFEgzOqRnwlRgWlby7cNV4RpGYwMjkLB6
	e1GGte0caRXxpKPcrHaAsrjgAPFxiQVxBzADKVarZ6mHh/SlPVeI7iSbZEQyPnh0
	6sWELKpQ+/1GUjTrRuJmCJLyf1YvY3TQVScESapshUzk/PA/z6ge9/j0+pXnp2KP
	2kTQnvMIPNR4yLuGSByLyeBVHyPFHg5UUo9KfgjNhPTVlKegR43z3bGBXszjr+IQ
	do+xNf+WXmxsjzIfj1I+noc5gZYmI9aLvGN73luSta7nKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4rams-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 11:32:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so42884961cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 04:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783942336; cv=none;
        d=google.com; s=arc-20260327;
        b=WT72Xs0FPZmJRVAarTq/aMu9C1U7jAAvnAO3G2KowVreAb3TQr5qkyEqkOGlNK8TKV
         F8VP6t/d+M9aqYXb802hW2AW+Fnm/oVizh3NiKdLzu/HdGki5s6Jk05bS/qp1AMPx+CR
         kC1xu7cEDXaL5rYmhTRrn/iECLXEpny6bfaowMeFovrvvBpUYFrSln2z3T/bjppm1dzr
         AadABsm+YwFirehjOk/TeyVJtT+ppOyArMjOUSczUx2anGnGOUkTOdYyMXxSRNHCfzA8
         agepk3DHmpbO3cadYwZEJNQCmZZMQTAu/s+Sk+ZT0Z4r11ADZj+jo6y8z2k8a2l8zBOm
         sIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M2L9AASChOijBrABWiqZZa8Z/prdpO9Um3CE+wXxfiU=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=kNVjUnek5BRIpTuKEHeW4oE/tZW/B4ZCcIlvJwO8WMuQETlrdcS/WRR+fc+Pim3S9f
         UCwxu00d8EgeMYGs4h8JTV/h30tPfWb7J+B0mHmnp90KS2M8j3t+C3yh86lCLwbWebXl
         1Fq7RBUKqpgoezqq+i7WMndFlpJBhd0mg+YLVVCPuMAhg987Yeslpbjgp7DKoP28bC0g
         +iFHVNBkIfrskeKdnY7ATla7mF7g1nsoPcfTHFw5jXBFO6lhCsQteF54YdFWXVBeFSEw
         DCCBKWKCUevVKjAd1wrp8KrovYymR/TDb2tNcsqNkGFUqaP7WCJR/QlDF7xqVuVawd8o
         1q4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783942336; x=1784547136; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2L9AASChOijBrABWiqZZa8Z/prdpO9Um3CE+wXxfiU=;
        b=H7MEpC23mVZW170VPsHUfymQfxd26QWrPxyEx2JNS+uwM7bSQK0I10YElp1tqYdPI9
         duec0d+n/7PDxcOn2GdTPl0f7IIOTBitU9h7O21vM3tY08hIvtMvJmr4YP0JjEQPshpe
         1D7wHqse6E+KoWGY2gKpF0+4B/yPO4sKZM8J4ImZZrtewvL4jZDbae1rS54gRKKEbFEH
         5pX2pk+MjG6O+7YufXGClW/5bKxkOga7fvo5COMaF6us3dHDEmmz1HrX3TOmxCGQydfC
         bI/yXjCul5sZboyTs4zd0HsQ1BnM21MByoQlu4uqvBti9jJQAMx0ZLNjMkOSAo69sqOO
         unXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783942336; x=1784547136;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M2L9AASChOijBrABWiqZZa8Z/prdpO9Um3CE+wXxfiU=;
        b=XvhmJlQOj35cvWU+RqS9zpDbap23z85E4LkCYewAkj6ZqWlQSSkQOhIVzV/i7qzVCE
         1VajzJTXJJ+fQ0wnUjXKT/LCbiUNbuqoaybEjl28zeYRYv+cLN6LkTEJPPxMkNi7Od8s
         rrW2gSUZdMBWufJ9oWYy3YNO1MMMcvzR993dNZF8LFJOFUE3Qw7hlweODl+WOrzMatnk
         OyQe90SR6uxqUWZnSgcSfL5VIRjg3AteDew578xfyMIGChI4Ge0ects1MSVli78EqFh5
         CdvUnWeavrQ9EUSvOe1axPGMUp9xSPQ9lf1aVlM+5kE81z4D3vFTJQbWZtjIMOhSpsJW
         75Lw==
X-Gm-Message-State: AOJu0YwbWW9DdkeAw1CR8LVjMsg59viJUj6qPo2TzzESHYHLDOE7oJ9q
	RJnZj4l4G8HYePtKHT3Lny1KfQySXMIOtHrQseHFAw9KyG82qNmaBw8ZercjKW5X/mqBjMa9erW
	9F7Yy2f+KyY9BjxNX6u+go7AJJmCGF6v7ydSYTkg59m+04fH0kuGAMWJ9ei6cZc8Sz4WU1AN8+f
	dztIvDiMLYTAj6xvTyrTZryG2Xyr9a85zfu6AOZEfR4C0Tj2hZatGTkDoOnA==
X-Gm-Gg: AfdE7cmk5lL7XQ8t2y5vxGJOzS4ldE8e7gXPtkEe7gQRDcyb8Uz/Agpf3w35vkkeCxP
	PfqhHHTgNEhkjrJUFOYKHdqp8gIHjYKeuLcNJfVo2Bv/hX+Nk0AVXknXaVhEPZ5LcEv/CU9LjT7
	LMrPY1t89xtCZ+xe0bMSiU8DYtsJaGr8oD6kVhoHpVyFuvpP1lwm+lz89j/fp+M4ictz98Sg==
X-Received: by 2002:a05:622a:181c:b0:51c:11a0:9af5 with SMTP id d75a77b69052e-51cbf2718d5mr86264801cf.70.1783942336316;
        Mon, 13 Jul 2026 04:32:16 -0700 (PDT)
X-Received: by 2002:a05:622a:181c:b0:51c:11a0:9af5 with SMTP id
 d75a77b69052e-51cbf2718d5mr86264491cf.70.1783942335878; Mon, 13 Jul 2026
 04:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260710155721.214588-1-jose.quaresma@oss.qualcomm.com> <2b430032b2f96e187381d0c7d530b0c6f04426ab.camel@linuxfoundation.org>
In-Reply-To: <2b430032b2f96e187381d0c7d530b0c6f04426ab.camel@linuxfoundation.org>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:32:04 +0100
X-Gm-Features: AUfX_mwNpON9ha-jjLCTTgUR_ltkoLuSTFane-_wW518DSmTHWjEUgxCblTH5S4
Message-ID: <CADWMC-YkzqJtq0bD2sopb9-GDXP-5DQ31TWvyYo8YqHttSmZYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] os-release: set BUILD_ID vardepsexclude with
 weak assignment
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003aea7506567c7173"
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54ccc1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ag1SF4gXAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=zrR6nvHGT3xa1PgY3CYA:9
 a=QEXdDO2ut3YA:10 a=DrTBiFIAAAAA:8 a=SMtIbf7bC0cPiK2gNTgA:9
 a=wSJ1_b5r3RyItDHb:21 a=lqcHg5cX4UMA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=8RV8QusGHZbpz6gYgAAF:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMCBTYWx0ZWRfXwHuEPZc6mfyw
 rLhLQLJHZfEOGGTV0Qrfw8GtEqM6TDZPggJ158CsHgvSjh7+sg4+Bn16n6R4caKgjDKIgrM+q2R
 f8IMYfrC+MsxuJvfSNSlpfLWlMLm9Ps=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMCBTYWx0ZWRfX7aHdbtmfHArl
 eklVRZDQgJkTKhaySCRSdlbVAGwrt1jYAGAJwL9muL+uG4RanMWUwOlU+3RRvOp/W6pVvnnTom8
 JlLxzZcDPGojvcMiGas5b16APLlRj8Y0/LaYZUPcT9rGs37Gmg8oYH06qU47ohOp/IRBVK3hJNs
 PxyB+yO6sZIm5KobAR+jlASTer/14ZsjQS8wmjMpEUHZmy3BfM187ly9SlSLRyD6GZQ699zscLO
 seO9vi+6zu3Wbaf6ialLIAr5C/iCtfCoPvPB7scAT7rFrq3nQ6fJpmy3YXxxfwDeZhWU3ta+VQJ
 ebxUtbzuaVxURlnpSxQo09rztPJ2bUhri0RMzxvNgkLRTUIINorYpvOD7QEzZKy6WqL0HQrk8CL
 uAFFDZFvlf7e+ej90fDkSen4a1dbmR5U2njYJrXgD9Ap6+K7oaex9S5anH2r3TTBa+ovg5hWGYs
 kyGgvjhg4Sq4BBQb9EA==
X-Proofpoint-ORIG-GUID: FgEx1h5mzAe7jdvf8jyQI0-ysjPjpCox
X-Proofpoint-GUID: FgEx1h5mzAe7jdvf8jyQI0-ysjPjpCox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 11:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240837

--0000000000003aea7506567c7173
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 9:38=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2026-07-10 at 16:57 +0100, Jose Quaresma via
> lists.openembedded.org wrote:
> > BUILD_ID is defined using a weak assignment so that we can modify it
> > externally. However, if we do it, we also need to do the same thing
> > for BUILD_ID[vardepsexclude] with the new value we assigned to
> > BUILD_ID.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> > ---
> >  meta/recipes-core/os-release/os-release.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/os-release/os-release.bb
> b/meta/recipes-core/os-release/os-release.bb
> > index e1906d05d8..bbbf9e3e11 100644
> > --- a/meta/recipes-core/os-release/os-release.bb
> > +++ b/meta/recipes-core/os-release/os-release.bb
> > @@ -41,7 +41,7 @@ CPE_DISTRO ??=3D "${DISTRO}"
> >  CPE_NAME =3D "cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_ID}"
> >
> >  BUILD_ID ?=3D "${DATETIME}"
> > -BUILD_ID[vardepsexclude] =3D "DATETIME"
> > +BUILD_ID[vardepsexclude] ?=3D "DATETIME"
> >
>
> I'm a bit surprised you can't just append to it and leave DATETIME in
> there regardless of whether it is still used or not...
>

I can't use '+=3D' in my conf/local.conf because '=3D' on the recipe has
precedence.
I also can't use the 'append' because it doesn't work with flags.

I guess I only have the chance to use os-release.bbappend left.
However, to maintain the layer YP compatible, I need to use an override,
and this implies the use of another variable.

MY_BUILD_ID =3D "my-build-id"

MY_BUILD_ID_AUX:override =3D "${MY_BUILD_ID}"
BUILD_ID =3D "${MY_BUILD_ID_AUX}"
BUILD_ID[vardepsexclude] +=3D "MY_BUILD_ID_AUX"

However, I didn't want to have this in a bbappend because it's not very
elegant
and this is mostly meant to be used only in CI.

There might be another way to do this, but I don't see how without using
the weak assignment.

Thanks

Jose


>
> Cheers,
>
> Richard
>

--0000000000003aea7506567c7173
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 11,=
 2026 at 9:38=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2026-07-10=
 at 16:57 +0100, Jose Quaresma via <a href=3D"http://lists.openembedded.org=
" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br=
>
&gt; BUILD_ID is defined using a weak assignment so that we can modify it<b=
r>
&gt; externally. However, if we do it, we also need to do the same thing<br=
>
&gt; for BUILD_ID[vardepsexclude] with the new value we assigned to<br>
&gt; BUILD_ID.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@oss.q=
ualcomm.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-core/os-release/<a href=3D"http://os-release.bb" re=
l=3D"noreferrer" target=3D"_blank">os-release.bb</a> | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/os-release/<a href=3D"http://os-release=
.bb" rel=3D"noreferrer" target=3D"_blank">os-release.bb</a> b/meta/recipes-=
core/os-release/<a href=3D"http://os-release.bb" rel=3D"noreferrer" target=
=3D"_blank">os-release.bb</a><br>
&gt; index e1906d05d8..bbbf9e3e11 100644<br>
&gt; --- a/meta/recipes-core/os-release/<a href=3D"http://os-release.bb" re=
l=3D"noreferrer" target=3D"_blank">os-release.bb</a><br>
&gt; +++ b/meta/recipes-core/os-release/<a href=3D"http://os-release.bb" re=
l=3D"noreferrer" target=3D"_blank">os-release.bb</a><br>
&gt; @@ -41,7 +41,7 @@ CPE_DISTRO ??=3D &quot;${DISTRO}&quot;<br>
&gt; =C2=A0CPE_NAME =3D &quot;cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_I=
D}&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0BUILD_ID ?=3D &quot;${DATETIME}&quot;<br>
&gt; -BUILD_ID[vardepsexclude] =3D &quot;DATETIME&quot;<br>
&gt; +BUILD_ID[vardepsexclude] ?=3D &quot;DATETIME&quot;<br>
&gt; =C2=A0<br>
<br>
I&#39;m a bit surprised you can&#39;t just append to it and leave DATETIME =
in<br>
there regardless of whether it is still used or not...<br></blockquote><div=
><br>I can&#39;t use &#39;+=3D&#39; in my conf/local.conf because &#39;=3D&=
#39; on the recipe has precedence.<br>I also can&#39;t use the &#39;append&=
#39; because it doesn&#39;t work with flags.<br><br>I guess I only have the=
 chance to use os-release.bbappend left.<br>However, to maintain the layer =
YP compatible, I need to use an override,</div><div>and this implies the us=
e of another variable.<br><br></div><div>MY_BUILD_ID =3D &quot;my-build-id&=
quot;</div><div><br>MY_BUILD_ID_AUX:override =3D &quot;${MY_BUILD_ID}&quot;=
</div><div>BUILD_ID =3D &quot;${MY_BUILD_ID_AUX}&quot;<br>BUILD_ID[vardepse=
xclude] +=3D &quot;MY_BUILD_ID_AUX&quot;<br><br>However, I didn&#39;t want =
to have this in a bbappend because it&#39;s not very elegant</div><div>and =
this is mostly meant to be used only in CI.</div><div><br></div><div>There =
might be another way to do this, but I don&#39;t see how without using the=
=C2=A0weak assignment.</div><div><br></div><div>Thanks</div><div><br></div>=
<div>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000003aea7506567c7173--

