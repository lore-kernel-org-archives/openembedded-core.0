Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768EEC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 18:46:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26110.1786646789865635931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 11:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jOqdtTMH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=iIdao2UE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DIhkMv3929205
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 18:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xQZo8F+AvC65I8E6YUl/wGc+
	StXtWMyh9qThYd3qT8w=; b=jOqdtTMH/pg1VAKnTzF45dlTv7HEpAHZv/TQD8dS
	Hcai1AwSutJ09VNGEnkH+HIqJvWD3SMRkbAcNs1TSU7ruMYEB/4Ad5fxGajAhzvS
	1ORApRV9bhS+5a4dn8iTfBmKM5CanMuRkgvnR/+H6pxzoPhIyAA0mJzMOqrEOdSc
	hxteBl5gS9QeOZEEHRm3wi5SVyHO+F0JV6ZC2nznTM4hG6OsMRL0E3LdLan/Y6LL
	D6I0McOw7w4GR75CtG+dT9sQD6WNlZ/lhbaAulGbWXrESGtKHSa+q+CSr9bS/s3x
	6kJhziE7SiMkTgb0Ox2Y8odqDm2mb2butSYBnmjxyDOYSQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18183btp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 18:46:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so1566126d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 11:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786646787; cv=none;
        d=google.com; s=arc-20260327;
        b=msl9zNSogAxZ+Bs654eCwmDtEWo4nq/CNjMWN9iER38yvSAo6AYBsRd4r240LnInax
         bl6T+dC2cWH6TGXfTOuNC+Dlq+mQ09+PF5B4Jq5utsGTge1CMJba9BnPKejGNHnfaT9s
         MZdUIgd5I7Iee94eEEjRUEC1Ax+ffxV4J0iRSOogKAA4SYaiBYaA7XeTLuMRr0OD3Unk
         uVfLYjHZaQDJyxP/ALV99bq/gG5BnATjy10Sy1bjJf1kvoJ3GJ5kndu/YzmkKALHr6qW
         wOcN6hQA9wtcruV8dk7YTmLIwET6ddqn9CX4/xoeH2+j5sXKC+Yt0tocW5LcuvkTgt5M
         ZPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xQZo8F+AvC65I8E6YUl/wGc+StXtWMyh9qThYd3qT8w=;
        fh=cfC4IFB603Q1BdLghAo4qn/aweuyA4eERpE+s9yd/uw=;
        b=auJ6kw5WKtw90wY8jvHmXmQUvahalK1lTMyLA/Q069tVTEdV+fhbqdGvoef4pz1Wjm
         +61Xw24IDtXsD6uJ7h0rxhyIx7bgk9P3J4Anf78aIVHnWsohwtBSA8lsK3IatxyGaWez
         KWVmuGhGvN/CIwW2Kj8jX6dKQozzLZnxaJa3gcwHoXPbJKxD5FHnJ94Jf3t+AmCum0G2
         b7qS+XxdcqMNM0MN/Hs1xzlW43aXb96p5hi913YjF7lTRSMA5yv7EG1nKfOl7APuORwV
         0ZyjWEra2qWmqIueIDZmzL9FI5ETqYX6vQ2/P7nLBLCg2McS8KxWFi/slxBOAzn57ylX
         BmfQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786646787; x=1787251587; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQZo8F+AvC65I8E6YUl/wGc+StXtWMyh9qThYd3qT8w=;
        b=iIdao2UEo8PpNkH7tHMwobvDlO7uyYhqGNkUfOrw9GwRMfQDkpZaAShs0CvWVJVWce
         kDxmWbJgizUE6XenfFbRpsqCias7J+8VylmhKImUpDTktUGbvcgFEEJNNEsO4lSgOArb
         INJWuo8EkxQhrNeODJbKSqzc0+QDE+VuGpXBa9HEPLuKjBo8arE37Jh8djNYNdEWgDUD
         OK64lHfcZ3DVfTfi7S/qeLMZ2ZJFo0pqItuecx0AAy4GjtLwPYaVsk90G1p7mpMQUUSN
         a5jmQCauZng4TVPkJ/P+vRyBLwyGxkRfAO48b8pvtulHzBZ3pqBvEkNh70nc4K+RTv/4
         o7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786646787; x=1787251587;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xQZo8F+AvC65I8E6YUl/wGc+StXtWMyh9qThYd3qT8w=;
        b=AMzcaXz9fslHvXDnIF6av36IdbSi5YFyWHipGivg+KsLPEINbX/ukZ0cRSNtnb9bCI
         htCz7V4N420x4xq+giwTiBl8ymB57qqYnbJAXAJGyrnuANT+zZU0XFJEM1C27+sZ2eBY
         BPhVKlIJAzHI8hUUFGdf5XPrJThUBgEjywOnSZZXYIqpTIzLeZDfM/Xaw/TvAeR1KkTU
         w9B6nWiDGlLsWRP8dR3rVj/SPQcBGYJsjUXmV+4K688My/Rfs8Yn5sePdGusEmO/Nk1J
         GVOM1UIMaYA/kYfDTA/USnwDScZ0qUogCWwHb9YMOeh1hgDhrV/4UUGsq/AfzIr4tckQ
         OSDw==
X-Gm-Message-State: AOJu0YwYKdFHAK6fXresAu2H7fUc6CBkeiWPBYlHsr8+TuiynMWsRRN6
	mupQ5qotmxyHJDujP7s9fYbGltIrf3FDDvPEou7z1LMe1YGrvVgcY8iXMtiIcNMrtARY9+sa35E
	bdx8VkFydCx6biTtyuKZrOE1ok2Y+YiIurd1VXN5sm+zycaHLki4zc9nx6sh/HXwf/rN9h8oJYM
	5QgH3rrQB2ZpD89wV/yTe+NKkVWjWsvXY0WmsHvARNXGMDdm8k/ebcgRkP6w==
X-Gm-Gg: AR+sD120HA/ntREerTPmyJZ6lYrUlfN3YRtqahQSDP5iZBJMSWOjH1kiyIDEclOtxG7
	e48yMm/nkgvfz+iEKRdlsEPH5H+26SK9SdCMxSWEmgrLLpbM5CfYtJeAH2U+DdS+lQH6qdQAvGO
	ZQIIRHn2K9vvHBuNiQ+srcBWvEqFJKK/h6fpSAPZSDi0iN6dUi66TeVUux61o=
X-Received: by 2002:a05:6214:54c6:b0:8ef:e857:c9d6 with SMTP id 6a1803df08f44-90a80c5003emr101475546d6.22.1786646787134;
        Thu, 13 Aug 2026 11:46:27 -0700 (PDT)
X-Received: by 2002:a05:6214:54c6:b0:8ef:e857:c9d6 with SMTP id
 6a1803df08f44-90a80c5003emr101474776d6.22.1786646786542; Thu, 13 Aug 2026
 11:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260813181719.44168-1-anis.bougrine10@gmail.com>
In-Reply-To: <20260813181719.44168-1-anis.bougrine10@gmail.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 19:46:15 +0100
X-Gm-Features: AUfX_myxSUImxpXrbJonzkfxJyPgZnbsEO_1ZRTilTXkw6Rj9IlYol4KbN848_k
Message-ID: <CADWMC-b1Q7USpOSxnwSbR_xhzdh4P0JgrH4SntkuqB-bkqT0tQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] kernel.bbclass: add strip process for signed
 kernel modules
To: anis.bougrine10@gmail.com
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com,
        Antonin Godard <antonin.godard@bootlin.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000d1f5f0658f21f0a"
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzNSBTYWx0ZWRfX1KlRDyfxHAoc
 L2C6qGlMH9XeJ8RP+l4y4rhtsT4a07duPtadR9hMQAn7AepxsRA2tSJ+h33NvOffItF3QmSZUf1
 xFXDb4cM2sMo8QoJDHkxOaBjwjbw7c4=
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a7e1104 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Q4-j1AaZAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=IkxTdPDVkC3NrnBputMA:9 a=QEXdDO2ut3YA:10
 a=GZ1iYpm_OdrDBXsgtwsA:9 a=fJpJCDylWyacQvhE:21 a=lqcHg5cX4UMA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: ODbhNqnGQqprnXyCcra5xpEIdLc80ctf
X-Proofpoint-ORIG-GUID: ODbhNqnGQqprnXyCcra5xpEIdLc80ctf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzNSBTYWx0ZWRfX3hvQ6wyaTGV4
 /jHEH5zykpnwxA/0B47IPxMJiIJbcJxw/UMLaQh1Z4ImQyolyuMR4RHDhdMsaApYJHk73ST4y20
 ySzdM1r6p24Am0mvAsOUJSQO4LgsrqAfnw3Ggxt1ID47NCD2jv3KpD99J489MNqbPy1zpmgFfKw
 bKGSPaO84VU4SJB8wG4SVw/UVYNJzO27ANAg2lV2v5NfmQApw25om64c9arDUik7KbtFAaoMtHL
 SyuQNZwi96+cCWC7Q8HDNCKWvzGAWF+zyfhtXDd2bdwkekg/sFMT3KApWb5GoV/ZcVAMpqrFcv/
 JZDt+tKNqqrIXZnFXB2evLGrjzHLxPhqCFSPhPcacM1T6Sut+RJK73+xL5mSyiKY6DEC31Qq9gt
 t4T7uXZ8uma2HCLWAd8BUR/13AxsTodgucJpciJeTF7NQxot/c2cW0yk1oap83IXHGhFxXPQwWd
 cdgc8eAv5+pCAB272DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 18:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243379

--0000000000000d1f5f0658f21f0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 7:18=E2=80=AFPM Anis Bougrine via lists.openembedde=
d.org
<anis.bougrine10=3Dgmail.com@lists.openembedded.org> wrote:

> Currently, signed kernel modules skip the stripping process in order
> to preserve the file contents after signing. See commit:
> 4c47e5f171fa2603355e2f9183065ce8137a18c7
>
> However, the kernel install Makefile supports stripping modules before
> signing them. This allows signed modules to be stripped while preserving
> a valid signature.
>
> Make non-signed kernel modules follow the standard Yocto stripping flow,
> while signed kernel modules use the kernel Makefile stripping flow.
>
> Fixes [YOCTO #12927]
>
> Reported-by: ross.burton@arm.com
> Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
> Cc: Antonin Godard <antonin.godard@bootlin.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
> changes in v2:
>
> - Use the conditional INSTALL_MOD_STRIP environment variable to avoid
>   duplicating the oe_runmake call.
> - Use `scripts/config` script instead of grepping .config file.
> ---
>  meta/classes-recipe/kernel.bbclass | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index a82bdf7ecb..dd6e203701 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -451,9 +451,13 @@ kernel_do_install() {
>         #
>         # First install the modules
>         #
> -       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> +       unset CFLAGS CPPFLAGS CXXFLAGS INSTALL_MOD_STRIP LDFLAGS MACHINE
>         if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> -               oe_runmake DEPMOD=3Decho
> MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
> INSTALL_FW_PATH=3D${D}${firmwaredir} modules_install
>

You didn't test it on the master? What is the reason to drop firmwaredir?

Jose


> +               # If the module will be auto-signed, perform stripping
> before signing.
> +               if [ "$(${S}/scripts/config --state MODULE_SIG)" =3D "y" =
]
> && [ "$(${S}/scripts/config --state MODULE_SIG_ALL)" =3D "y" ]; then
> +                       export INSTALL_MOD_STRIP=3D"--strip-debug
> --remove-section=3D.comment --remove-section=3D.note --preserve-dates"
> +               fi
> +               oe_runmake DEPMOD=3Decho
> MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
> INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware modules_install
>                 rm -f
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>                 rm -f
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
>                 # Remove empty module directories to prevent QA issues
> --
> 2.50.1 (Apple Git-155)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243378):
> https://lists.openembedded.org/g/openembedded-core/message/243378
> Mute This Topic: https://lists.openembedded.org/mt/120738257/10043485
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jose.quaresma@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000d1f5f0658f21f0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 13,=
 2026 at 7:18=E2=80=AFPM Anis Bougrine via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;anis.bougrine10=3D<a href=3D"mailt=
o:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Current=
ly, signed kernel modules skip the stripping process in order<br>
to preserve the file contents after signing. See commit:<br>
4c47e5f171fa2603355e2f9183065ce8137a18c7<br>
<br>
However, the kernel install Makefile supports stripping modules before<br>
signing them. This allows signed modules to be stripped while preserving<br=
>
a valid signature.<br>
<br>
Make non-signed kernel modules follow the standard Yocto stripping flow,<br=
>
while signed kernel modules use the kernel Makefile stripping flow.<br>
<br>
Fixes [YOCTO #12927]<br>
<br>
Reported-by: <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.=
burton@arm.com</a><br>
Signed-off-by: Anis Bougrine &lt;<a href=3D"mailto:anis.bougrine10@gmail.co=
m" target=3D"_blank">anis.bougrine10@gmail.com</a>&gt;<br>
Cc: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" target=
=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
Cc: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
changes in v2:<br>
<br>
- Use the conditional INSTALL_MOD_STRIP environment variable to avoid<br>
=C2=A0 duplicating the oe_runmake call.<br>
- Use `scripts/config` script instead of grepping .config file.<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index a82bdf7ecb..dd6e203701 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -451,9 +451,13 @@ kernel_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # First install the modules<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS INSTALL_MOD_STRI=
P LDFLAGS MACHINE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&#39=
; .config); then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DEPMOD=
=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTA=
LL_FW_PATH=3D${D}${firmwaredir} modules_install<br></blockquote><div><br></=
div><div>You didn&#39;t test it on the master? What is the reason to drop=
=C2=A0<span style=3D"background-color:transparent">firmware</span><span sty=
le=3D"background-color:transparent">dir?=C2=A0</span></div><div><span style=
=3D"background-color:transparent"><br></span></div><div><span style=3D"back=
ground-color:transparent">Jose</span></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If the module wil=
l be auto-signed, perform stripping before signing.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$(${S}/s=
cripts/config --state MODULE_SIG)&quot; =3D &quot;y&quot; ] &amp;&amp; [ &q=
uot;$(${S}/scripts/config --state MODULE_SIG_ALL)&quot; =3D &quot;y&quot; ]=
; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0export INSTALL_MOD_STRIP=3D&quot;--strip-debug --remove-section=
=3D.comment --remove-section=3D.note --preserve-dates&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DEPMOD=
=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTA=
LL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware modules_install<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;${D}${n=
onarch_base_libdir}/modules/${KERNEL_VERSION}/build&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f &quot;${D}${n=
onarch_base_libdir}/modules/${KERNEL_VERSION}/source&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove empty modu=
le directories to prevent QA issues<br>
-- <br>
2.50.1 (Apple Git-155)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#243378): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/243378" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/243378</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120738257/100=
43485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/120738257/10043485</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:jose.quaresma@oss.qualcomm=
.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000d1f5f0658f21f0a--

