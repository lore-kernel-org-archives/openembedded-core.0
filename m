Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7163CC624A4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 14:59:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31602.1788188360541640877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 07:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ou0tmr7X;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Q1X7M40i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETKC02719825
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 14:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eJj4ROlB/v8FB+FsQK+Ust0X
	AQWTrtA+c5s9PwyD97g=; b=Ou0tmr7XwL2P9/Ym+Gq1DS7lasSOTfRIbAsgcfla
	OdJ9T+fb8gz7+7lQnd9mMcojQ6LXSlAOqzzfOcWbjfYlM7pUJ45ofl9a0LS0LSjt
	Co7jKtMc8zsK7vyDekiB01egX4Ec6GNs4L7YxBrdJZMeIsD9umPtRVoNoJA2DUhX
	VPQqHU+7HFARBfmpw1T4SdVTlx0X4ajDwg+ciqjKEEZX2qz856ZAxJZ1Rpj29oEE
	Q3FM6xZoU/vkxlWaCNhjK4oVqJN3P5a5cEr9Lb/F2BoaHyn+xsik5EYMIUnH2+/S
	PAw9EIV6hbNTXZ3cA5IcS7TV/RLs3fUIQyUS/j/o/5t+ZA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vahbtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 14:59:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90ceabcd64aso58209956d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 07:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788188358; cv=none;
        d=google.com; s=arc-20260327;
        b=SwwneovaFQiNWwqlWhOUJSh1WGpiyHvpryeSzKjnp/T8k51IvlvpDqhBWJXwzFqfmE
         X+2Bvsuea2+PdQck1ZO9OZYHRp9Wd8pKNYuNUUfd8KIAuuFa1ZA8FCQbTCv9IZFy946g
         xakDBD1sWoW8J0GRYmk/unLJ2LgFvceRe1uuaDO2quuKUM3LPo03LrGIaslfmLoSLpIA
         9P857vUXONPtUSt5Yb5RzqOydhg/vawD/hUduBi8tDqFgZ4fs3riQ1/CpHhiYtWlGUO7
         K6pgjU/x+bfAn0PCNdpHbUZjASQLuu6Kkq2zXZaKU4RMwzNJed0x9ot07J5Tqd2tJjSC
         cj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eJj4ROlB/v8FB+FsQK+Ust0XAQWTrtA+c5s9PwyD97g=;
        fh=Ab5QchtAs08eZNSFiBl6MfJNprT6k/vVQ8w3IX57Q1U=;
        b=VPEzd6t0oJEDy94foX4xKRcP1wABlebou7j/GJZBc2iBmA+O+rR7yaQZZ2/bE9LmqZ
         cd2rNPnCMuh73VbSp9c1TjT7p5b6y4tuW5sEVpU1d8Iff3ur8fAt3N5TICtFwnLEsJvs
         ZfqNZZBtNcEHmfb1FmqW7gQSB+z1+GrSji1DlFeRvR3nbd8Wuvibk3P/JvZIXzcFLxSF
         APhRjUPA6dTxWzftzpwbkLLWVpTpXSu203M99Dufvi591sXpwP67NZxW55ynV2NF85Q4
         Xwc3fGaR8SSXFke4XhmgHUfzM5TPxjrUyrmo3NE4rZxdmkI1msVHVy9P/OdF3ZrOC4jr
         J2DQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188358; x=1788793158; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJj4ROlB/v8FB+FsQK+Ust0XAQWTrtA+c5s9PwyD97g=;
        b=Q1X7M40ihSoT8p+R75yPJtpV8Pb1VDJj3VTRAT2ZkheMhsQhvOS52R7jhEw+DsI06H
         dzXAqeKGm7VUtBkOGgDClaAamB7z5Jg+Iv7VfuzRaELmSzDWxLJi8pOEuyP+XlJ1cLno
         pYOjmLAQTjpkXksqeSnAG5HHKSzU4G9hFxsRm42u6yPgI8ALOs9lV2vb30BxdCbuqEu3
         0uXM2oAdzbQSy3+1w/EE9zrAjGp95F0Fih7J77RUiAzx6f16i2C49Fo6N2YMic2wuEx6
         cSNsjvKc7rfm3CeOTcHLVfiCNVnG7kMnYWRvXa+IawOwUAm6wqiAzz3RINUMn86MnbWB
         J3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188358; x=1788793158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eJj4ROlB/v8FB+FsQK+Ust0XAQWTrtA+c5s9PwyD97g=;
        b=s5kAZB9wATjD0Vj+8o1DFFx17mhvNFEkg5zzEEa0CqVCP1qhd8XAXpAz4JbQWh02cy
         XZw4FIE2HA5vqYDRPgG89z0+n/T+PYOGkPm2ZUZty7KkYMCPhH/Fhy4Ty0thGnofCqIM
         XYbDvqiT5kvYujXBWvg1Tyt0oJsV1dpCLT6mnIH/mNuRyRlz37/r92nSQquHpI0XHWOW
         mE8ER84Ur2uQ9ATWrfE0kYMUi+NUhgYdDRJEce+7IojFULqALoaDMIpE5ayV3rPywejx
         dl39E07Rh8fdBlzLv6veZcb7VFZdGCljOG6hiwTzyTs3/GgBpH2YvS+IZ3a6Vqfix6NK
         U8gw==
X-Gm-Message-State: AFuF++k8PDL4ie2xBy9Jvwe4VOxxmv1P/jA25AgvQkXlwPE79vSKaPvm
	GpWJBRoNpbhYJJrvG7FfS9eCvW6XOGi5pzOpENc3vIH8CnM8QjaxEMjLoRCPNEvjkEgKNPP3vHy
	HTiAsTPeyWHhY5hXI2FUi+Lr4aIrtDgNnXJ6W+T6CYhCeOGW217/8SL7AtxVwp2ZBkagZJ1YFYf
	W6N1vgT3VXcVKfMexWRoVPc/IlN1wc2/L2AsA1D2sz69c2x0j625GHDMJgPw==
X-Gm-Gg: AYBFou07nUi/ALKkuXzVlH/OOVQZDbh9WuTfYqtgpGFQ13rmOidUYVpVnzaEZiAmPy0
	7GJxXOlO4td/TieaWpw99d+9Q9UTtpicPhdJUHCiwm+BwHbBqoPJrNJsiHZC9+H/YaVzeJbuA8q
	Y3Ri/GVQcsXJeaANOx/EPK7mctm680NHZvofArSNIptlNUm3kLL+yHidu1QqI=
X-Received: by 2002:a05:6214:4843:b0:90c:e89f:14ce with SMTP id 6a1803df08f44-90ce89f195fmr284181536d6.27.1788188358324;
        Mon, 31 Aug 2026 07:59:18 -0700 (PDT)
X-Received: by 2002:a05:6214:4843:b0:90c:e89f:14ce with SMTP id
 6a1803df08f44-90ce89f195fmr284178496d6.27.1788188355767; Mon, 31 Aug 2026
 07:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260702125627.977563-1-ross.burton@arm.com> <20260702125627.977563-3-ross.burton@arm.com>
In-Reply-To: <20260702125627.977563-3-ross.burton@arm.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 15:59:04 +0100
X-Gm-Features: AcwNN1Ur2ap4x6JQmR-g0b74K3A7h31-JmfW1yYtwVDC9ToAiKF8AHVArb0jCeI
Message-ID: <CADWMC-YAdgkbHOh4YS90YsV7wrS+JgsR=a622btwRWQeYJgLtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/6] python3-pycairo: inherit python3-dir not python3targetconfig
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bcc2db065a590bc5"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX1fPlqltxpbQU
 zY1UvJUNwS3RemS+AXbLOH8+yN034bZ+hbabTZLzl5lNA1wf9SLy73xnNolbnZIJpFWyUlRX4st
 bJ2YMY5GawoVZx6BtwrwfX8BgEBAK0gtuqCP1iLNEJ4Z1EPmX6W4CS6/KUBeanukji4sV69NESB
 iGUPp3CVMvNeGrHj5Ry+JV4R9c1KWSpb6LeRINgeaNdvLOZm6MhFCLDMx/0P1QW6sisILsoIRVz
 K7zMNQfLFOY4uBCMzxi1+CFGDLu2evtIxIOR++JAA6PHPFxyC4kF4rfgjd26wNV0sxUuRe9YkTL
 cTXAUEqq/V37FN03W08QduLK5WL5TGm63byevEQq2+TZiOSh44aFqHOfPp486re5bw7J/S7yQ9t
 VRLV0gxnob+ozqp5O1TqwBUS15MSDfrnd3ehsgaB2WDIHt+EE6lIKP/syA5cz6hbypNRUY+xGZL
 A6Twg/bFb0BRhtYqC1g==
X-Authority-Analysis: v=2.4 cv=YYmNIQRf c=1 sm=1 tr=0 ts=6a9596c7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Q4-j1AaZAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=bw29F8Yh2OsH269rBM4A:9
 a=QEXdDO2ut3YA:10 a=0zhiEtMHAAAA:8 a=OtEorC9qAAAA:8 a=NBscFbmCAAAA:8
 a=IQwrwWZW3YWzvyZ8NegA:9 a=ZufSael9nvvLMmXH:21 a=lqcHg5cX4UMA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=v7CeC1Rd8Ef7gCqLsajQ:22 a=09XWDiPSdQGXj7bqdd7l:22 a=LlzsuzCMRspGlJdLRFVE:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX6aV2eNIEhMZt
 90aZU2DYIp3l33f3CX3S1V82+Sp7WF/592KUqu9yvh7PytsGldpIK8EsXjWyoS7GPGbmb49x2zM
 SkeotaR+CqqfowiEgvIcb4SgEUjZ468=
X-Proofpoint-GUID: z3cQr5pyxYfo8LpnFgPQwLJQ5UvrildI
X-Proofpoint-ORIG-GUID: z3cQr5pyxYfo8LpnFgPQwLJQ5UvrildI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 14:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244770

--000000000000bcc2db065a590bc5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 1:56=E2=80=AFPM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> Now that meson.bbclass tells meson where to install Python files this
> recipe just needs to know the value of PYTHON_SITEPACKAGES_DIR for
> FILES, so just inherit python3-dir to remove a dependency on the target
> python recipe.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/python/python3-pycairo_1.29.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
> b/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
> index 20c2c332cdb..9b78e4f3d3f 100644
> --- a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
> +++ b/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
> @@ -17,7 +17,7 @@ SRC_URI[sha256sum] =3D
> "f3f7fde97325cae80224c09f12564ef58d0d0f655da0e3b040f5807bd5
>
>  S =3D "${UNPACKDIR}/pycairo-${PV}"
>
> -inherit meson pkgconfig python3targetconfig github-releases
> +inherit meson pkgconfig python3-dir github-releases
>

This change introduces a regression than can be verified with:

bitbake python3-pycairo -c do_install -f
file
/work/build/tmp/work/*/python3-pycairo/*/image/usr/lib/python*/site-package=
s/cairo/_cairo.cpython-*-linux-gnu.so

This will change the arch on the library name from "aarch64" to "x86_64"
when we build for arm64 target.

+
/work/build/tmp/work/armv8a-oe-linux/python3-pycairo/1.29.1/image/usr/lib/p=
ython3.14/site-packages/cairo/_
cairo.cpython-314-x86_64-linux-gnu.so: ELF 64-bit LSB shared object, ARM
aarch64, version 1 (SYSV), dynamically linked,
BuildID[sha1]=3Df787b1386510f091a34cb71fd91929e14128dc1e, with debug_info,
not stripped
-
/work/build/tmp/work/armv8a-oe-linux/python3-pycairo/1.29.1/image/usr/lib/p=
ython3.14/site-packages/cairo/_
cairo.cpython-314-aarch64-linux-gnu.so: ELF 64-bit LSB shared object, ARM
aarch64, version 1 (SYSV), dynamically linked,
BuildID[sha1]=3Df787b1386510f091a34cb71fd91929e14128dc1e, with debug_info,
not stripped

Jose


>
>  CFLAGS +=3D "-fPIC"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240039):
> https://lists.openembedded.org/g/openembedded-core/message/240039
> Mute This Topic: https://lists.openembedded.org/mt/120082280/10043485
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jose.quaresma@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bcc2db065a590bc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 2, =
2026 at 1:56=E2=80=AFPM Ross Burton via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.c=
om@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Now that meson.bbc=
lass tells meson where to install Python files this<br>
recipe just needs to know the value of PYTHON_SITEPACKAGES_DIR for<br>
FILES, so just inherit python3-dir to remove a dependency on the target<br>
python recipe.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_1.29.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.29.0.bb</a> | 2=
 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-pycairo=
_1.29.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.29.0.bb<=
/a> b/meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_1.29.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.29.0.bb</a><br>
index 20c2c332cdb..9b78e4f3d3f 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_1.29.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.29.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_1.29.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.29.0.bb</a><br>
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] =3D &quot;f3f7fde97325cae80224c09f1256=
4ef58d0d0f655da0e3b040f5807bd5<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/pycairo-${PV}&quot;<br>
<br>
-inherit meson pkgconfig python3targetconfig github-releases<br>
+inherit meson pkgconfig python3-dir github-releases<br></blockquote><div><=
br></div><div>This change introduces a regression than can be verified=C2=
=A0with:<br><br>bitbake python3-pycairo -c do_install -f<br>file /work/buil=
d/tmp/work/*/python3-pycairo/*/image/usr/lib/python*/site-packages/cairo/_c=
airo.cpython-*-linux-gnu.so=C2=A0<br><br>This will change the arch on the l=
ibrary name from &quot;aarch64&quot; to &quot;x86_64&quot; when we build fo=
r arm64 target.<br><br>+ /work/build/tmp/work/armv8a-oe-linux/python3-pycai=
ro/1.29.1/image/usr/lib/python3.14/site-packages/cairo/_<a href=3D"http://c=
airo.cpython-314-x86_64-linux-gnu.so">cairo.cpython-314-x86_64-linux-gnu.so=
</a>: ELF 64-bit LSB shared object, ARM aarch64, version 1 (SYSV), dynamica=
lly linked, BuildID[sha1]=3Df787b1386510f091a34cb71fd91929e14128dc1e, with =
debug_info, not stripped<br>- /work/build/tmp/work/armv8a-oe-linux/python3-=
pycairo/1.29.1/image/usr/lib/python3.14/site-packages/cairo/_<a href=3D"htt=
p://cairo.cpython-314-aarch64-linux-gnu.so">cairo.cpython-314-aarch64-linux=
-gnu.so</a>: ELF 64-bit LSB shared object, ARM aarch64, version 1 (SYSV), d=
ynamically linked, BuildID[sha1]=3Df787b1386510f091a34cb71fd91929e14128dc1e=
, with debug_info, not stripped<br><br></div><div>Jose</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0CFLAGS +=3D &quot;-fPIC&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#240039): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240039" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/240039</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120082280/100=
43485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/120082280/10043485</a><br>
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

--000000000000bcc2db065a590bc5--

