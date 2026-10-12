Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC259CA9EDE
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 18:18:49 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1103.1791829125889068329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 11:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=m8WCiX8k;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bR7N4qZY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHuibd2022738
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 18:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DMBxWDdXrg80e5KKly6rqKPB
	7FsDpxFixigssivzoWk=; b=m8WCiX8kAKdfIAjSlcAfaXWEkdJgFUd+j6U4BIBk
	lFZ5f4C0PVQLozXGxTTLi96b1d8qvEtFD9QXAbIH2DQARk8/BVzUGuuItvqiXsRN
	9pHeKHeSMfM4BRANggUT6zQo00/GoKNrk6aD/0h+aN9qi9ImGwmHWb4OSzn9LLp/
	c5dX8rboKM3A9mLmXetexvG9Cq+n9r3E8Ls5z4O1MDPzcnv/fKDy/dRM93VmNjxL
	WSU3QB1JJbfDCdalzySLnzpbJ2EbLHTSBqlyAmV14QDlnDpOcyMg1PWZ2+yC9Vco
	xrHjD5t/Xn6c+pW0YskGuRroU1lk8hBWD7hXIb8P7P7a4g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aerdwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 18:18:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91961d4b31bso49202586d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791829124; cv=none;
        d=google.com; s=arc-20260327;
        b=rqz4MKOR8kZZ4Uzzknzt8QJ1CxE2OLIuakrdX4U3/S84MOcm/bvwq2BgxPrg6nLj6i
         VwfJ3S1c0x7P0K9Bl5zb0I3nFSDP5X3m4SHrfzaEK1Wer6rxyg1CVPctAjfaGvQbh1Zz
         iZffJ0rIJbxCSQb7fo+tL67DfPPnGxWWz7T77widcZZc1FC7fIxYsRg/rO8B8w82i9UW
         VFU867Eh8pQOAOxvbjx30Wi63bLqzhurwwM5lEA7pn01uGg+ftXBWRVI6KXNJMU4uJod
         sYfoG6uDqFzXE3+ikqZI/SGDGYJZur7NqgvqNSB9kLPBA75lEBZfbT/UyFJhm/CR+6Qq
         ttkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DMBxWDdXrg80e5KKly6rqKPB7FsDpxFixigssivzoWk=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=UUkJvJKm4eUuUIYYrbpBPQxPFgVkjKHZaejwGAWh4OV5tLYWrvfeKyEB42rkCokGcM
         8PsIamtwha3qQt/B9LOAbMV1EevCY2p/yt6XEvYfSm/flX3KpwKyuKGQ3yzuZqlBHxyL
         kYvpGLAXnPwDkVztZUajxzlLz3HiljGt2mpOXngBH987RpLL+jN/hjhQB9NFkqhFUlIa
         FCFQPmRFWNgWMSN2JUvJa36KWJCbCrSieTS97jX5gvrDcFl/S875CPpURvK9nCqp1+mq
         K9l7lgospgYduVWoEykUsmagR4T4Ck389QMlzrF3PG9pxGyDsmkNCToxqerjko6OgWvX
         Q+Gg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829124; x=1792433924; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMBxWDdXrg80e5KKly6rqKPB7FsDpxFixigssivzoWk=;
        b=bR7N4qZYE3uDuBlrKHXRnL7p1E5UTWs8yYXEtrYoWZa8CZ2324yq3EzC7O0Syz4dYA
         hMQA740Vmw+j5oteIJhYKCbwPuWsLLlYI0JR1zIJ4XIyly5XSjveC4T+wIaz3Z8ZB8Hz
         Pe1Wd2jnSjODaJbFh4b4d9sn4XXJG4CoDTSmEFfJaxn9+1EwVsF3439ce+yKM+XlNm1s
         z+iJVeNCuxFMnL4AnGOUnvUP8eaHly7Q3kn8akPh5psqW4NxM232zyijuqsD5PcM+0Hw
         hyGuKTGhn/KMPmVAiz6dGhq54aBbf7Sz0EAx7QwhxAj4Hf+yA5UQZUseOe1xEC2FpMZE
         ozEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829124; x=1792433924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DMBxWDdXrg80e5KKly6rqKPB7FsDpxFixigssivzoWk=;
        b=xZDELvix6vTw63rNlivOxOrUZXhmhUYAm63mY0ExLS3FUw4Xr1VFwFFjtpdLCAPZP1
         H5ac/xNPR2LHGIGObnnNOkK4j0EHG+rPyBMncIMgaifVTLaHP05aZQRKA94GYMEJpsgy
         P5tYmtV8Q0T4m4Gzlad6sv79gYg8wESqwaSKnOPMl9QO7/AapkQeh08SbKvekYhzGFXG
         8tn99E3AZMI3DPZ71GHPskHBRbSveKwin4DoMUlxKPGCkCSifBMhIrpak+PbZejNG/HR
         FK9nJChum4+uvgth58hbJ3DT2rp4/baYDItEgJqlzpRPSlSrKO8jwvDrou54F+0KR7sH
         OeGA==
X-Gm-Message-State: AFq9FYKYsP4sLCn/3UvYla8sdNxHbyukDvzmbsMxPbH70su4aUce3DoH
	Hkih5gBb3JEyUY4INBbgLUmjDQfgmrAhtckyehiP1NdKmXRJ4k8i9PVrxJRuWVV3Hb99tjk26uB
	/lhCdDp5kxStVTY+eiDs8fIKpgIV3PxtwOOcWT3kLexEmn1F/Ijdv3Rrwy4F5XtT+4po61X/APK
	WT/OspLSXy8et8gedbX+F4jLBnVMyg2GzIm6xz+G1nYlotlymKGYhBOtTQAslfKagav6Q6
X-Gm-Gg: AYBFou1MLO7aVHJC9W0RM5xNLFLe21NAocJBR6pSNz/ggD1d4g5YaX7gHI/+kD0JEWR
	yyR1U0fPQQwE1hUpOvKpDSPRxPUVu5/YywuUqrRojwZK02TBY4U6gksysqIaCeLqX4RUAwt4MlD
	MaRoH9nQosrXubd5+HcaNLTqYyIiOZeDwmHy78Z8ut11COHMkliydyWSDzLf4=
X-Received: by 2002:a05:6214:29ea:b0:912:517b:8fc with SMTP id 6a1803df08f44-91b557d1e68mr186887236d6.46.1791829123683;
        Mon, 12 Oct 2026 11:18:43 -0700 (PDT)
X-Received: by 2002:a05:6214:29ea:b0:912:517b:8fc with SMTP id
 6a1803df08f44-91b557d1e68mr186886846d6.46.1791829123067; Mon, 12 Oct 2026
 11:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20261009200155.1040688-1-jose.quaresma@oss.qualcomm.com> <61ddef022463353447681c6d77033fadfe47f753.camel@linuxfoundation.org>
In-Reply-To: <61ddef022463353447681c6d77033fadfe47f753.camel@linuxfoundation.org>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:18:30 +0100
X-Gm-Features: AclHuK-VXQcHyHVNvPhOxbR26LJmkJG2qIydFHdBnpQ0B5vorY6DDoaCuRI1adw
Message-ID: <CADWMC-YzMNDrYUpo=_i25uSAW1cJXJX5m3zG-z6hoNGmvGE4Bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] testimage: excluding TESTIMAGE_AUTO from
 initramfs images
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006105df065da8baf4"
X-Proofpoint-GUID: mnWlyLXJq1jPGk7GulGS54vXKb-q-aKZ
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acd2484 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ag1SF4gXAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=IRWi4dCofZEOYWtkj2IA:9
 a=QEXdDO2ut3YA:10 a=4pf7h7LjaYbtA_QMBoAA:9 a=9yk2A0_v3jO90BGD:21
 a=lqcHg5cX4UMA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX2ZrhtpkRi//5
 O/sHozrgY/QfLaVcro9buhavJqNU0q51dKtOHVU/bDdPEqv1L6gFM3MNIU/fZJGPZ073juytzKG
 sCFKDWdOTRiKEIKPmGGK68nGPzWTxWw=
X-Proofpoint-ORIG-GUID: mnWlyLXJq1jPGk7GulGS54vXKb-q-aKZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfXzVjApfRSY3R5
 jg2wM9EkGBHiy3wEr1GlGe/YzqzmnS51pzM+isoFyWHNVQLCX0GpHM6bRZG6tRI0zxD5eb0sx98
 YzpsxDnLTG8Vtpf0hBRDWvJlVrj6XL0tTsx5b0ha8MAV1zppJLfb9mtuqKu0vLgi7DAL/uw0SWn
 lqbr6gylb5jJqaF8Gd30ML9XXbF04acUhVEdJMgroJ+az5we9+sQOj0iCmiTKtLC/evTc2DIMN9
 7r/K717TDUrVzjI6kpCamgt6+mFiOOKe33nZKC3QnosZUpHayGkYWOD6aE7/I6NfE0W7rSf2AYh
 1l5eZxhmlKL0IIDQDipe4urp92Evch7w1dMxNScKRi4oRzuaoY27sPZ8gyB8hyw7IBGkRDT2+Ur
 iNzptN6cS9UgtiOT+a8xX72e1BMmmN6MfQEju8deNGurRTIWGEKHQR1nph1WP1D7iLaz0D1WBfT
 cyTy4ZzXYzVyFqmf9rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 18:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247674

--0000000000006105df065da8baf4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 5:28=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2026-10-09 at 21:01 +0100, Jose Quaresma via
> lists.openembedded.org wrote:
> > When TESTIMAGE_AUTO is enabled, the testimage task is automatically
> > executed for all images.
> > However, this is not the desired behavior for initramfs images,
> > so it is necessary to disable TESTIMAGE_AUTO in these cases.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> > ---
> >  meta/classes-recipe/testimage.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/testimage.bbclass
> b/meta/classes-recipe/testimage.bbclass
> > index 419ad6dcb0..f21c87487f 100644
> > --- a/meta/classes-recipe/testimage.bbclass
> > +++ b/meta/classes-recipe/testimage.bbclass
> > @@ -520,6 +520,7 @@ def package_extraction(d, test_suites):
> >  testimage_main[vardepsexclude] +=3D "BB_ORIGENV DATETIME"
> >
> >  python () {
> > -    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False"):
> > +    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False") and \
> > +      d.getVar('IMAGE_FSTYPES') !=3D d.getVar('INITRAMFS_FSTYPES'):
> >          bb.build.addtask("testimage", "do_build", "do_image_complete",
> d)
> >  }
>
> This looks a bit fragile as an image might use the same type as the
> initramfs.
>
> Could we just force TESTIMAGE_AUTO off in some of the initramfs
> specific classes/code?
>

I agree that it's a bit fragile this way; I'll look for a more robust way
to do it.

Jose


>
> Cheers,
>
> Richard
>

--0000000000006105df065da8baf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 12,=
 2026 at 5:28=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2026-10-09=
 at 21:01 +0100, Jose Quaresma via <a href=3D"http://lists.openembedded.org=
" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br=
>
&gt; When TESTIMAGE_AUTO is enabled, the testimage task is automatically<br=
>
&gt; executed for all images.<br>
&gt; However, this is not the desired behavior for initramfs images,<br>
&gt; so it is necessary to disable TESTIMAGE_AUTO in these cases.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@oss.q=
ualcomm.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes-recipe/testimage.bbclass | 3 ++-<br>
&gt; =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-reci=
pe/testimage.bbclass<br>
&gt; index 419ad6dcb0..f21c87487f 100644<br>
&gt; --- a/meta/classes-recipe/testimage.bbclass<br>
&gt; +++ b/meta/classes-recipe/testimage.bbclass<br>
&gt; @@ -520,6 +520,7 @@ def package_extraction(d, test_suites):<br>
&gt; =C2=A0testimage_main[vardepsexclude] +=3D &quot;BB_ORIGENV DATETIME&qu=
ot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0python () {<br>
&gt; -=C2=A0=C2=A0=C2=A0 if oe.types.boolean(d.getVar(&quot;TESTIMAGE_AUTO&=
quot;) or &quot;False&quot;):<br>
&gt; +=C2=A0=C2=A0=C2=A0 if oe.types.boolean(d.getVar(&quot;TESTIMAGE_AUTO&=
quot;) or &quot;False&quot;) and \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.getVar(&#39;IMAGE_FSTYPES&#39;) !=3D=
 d.getVar(&#39;INITRAMFS_FSTYPES&#39;):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask(&quo=
t;testimage&quot;, &quot;do_build&quot;, &quot;do_image_complete&quot;, d)<=
br>
&gt; =C2=A0}<br>
<br>
This looks a bit fragile as an image might use the same type as the<br>
initramfs.<br>
<br>
Could we just force TESTIMAGE_AUTO off in some of the initramfs<br>
specific classes/code?<br></blockquote><div><br></div><div>I agree that it&=
#39;s a bit fragile this way; I&#39;ll look for a more robust way to do it.=
</div><div><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000006105df065da8baf4--

