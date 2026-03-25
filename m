Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82359FC72DF
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 00:05:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11516.1774397153301647223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 17:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=R7h3l+Si;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=J7LNFhrp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCi7p907715
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 00:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGXfooLNa76ILH5t6+DlEqEJV9/jw2Uw6k0npyKzVtc=; b=R7h3l+SiRQe/v/EW
	8QJ8i26AFyHurf0qQ2Gb2u/+islEokdKQfsfobshxd+J5Cn3/DVOsIst4P4WHjHQ
	ZJ4jBgPXQO+1nK/d/NiepcWIRzn6Xd4iE/P0IEzPfKQTc9qkXI2rJq3FXdkrEh+z
	vNFyCZH1v7Dsj+mx67R7HeCcWVdVtD/Sj5Op2JSflTeU8WagbSv6rKEKMfp3QyUi
	6gDLr25xDdrtSeNCCYs24o+7g6u46Yp+wxyezDC6h5exTc/bl5CRKSKkHKHakdwu
	cekaozJ0L3HUFkHAfX3eeWfXSy1Tk1dh4AXwvuIkfFlPS78XeXZQzGxPph6ONtsW
	D4ov7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukma3nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 00:05:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091327215dso3900221cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774397151; x=1775001951; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jGXfooLNa76ILH5t6+DlEqEJV9/jw2Uw6k0npyKzVtc=;
        b=J7LNFhrp1uLaOjTAWaZTdhSXyD1EX97yGyhAe7cyJo+7+v5ql3kapB4EscAgzB/Bth
         U0FQrHfEJCrNGmsUqJj1R+3WwrctadEs707jEe9q91xvFD9eXP/J/zJyu0aGuyqiyKPj
         624jnRqovbSCpiFPsmnbQCNL0HwjvsyHsWfUq26wKyR7nmtaJkLGD/Do2Xj1LbXkMuVj
         qWHRKdl2NlhHOq3+kkWeNvV3KGuu0oY55RlFGcKF5MPQnxDPdZ++W0aVelLvHTMdBWbZ
         cp2pRY4Rv06HOaTdOVjPK34hveCiezpYCasRRl5MxRU9sqMUtY4tzHhG8iMGnAxxKLz+
         u0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774397151; x=1775001951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGXfooLNa76ILH5t6+DlEqEJV9/jw2Uw6k0npyKzVtc=;
        b=WLyyGcq45KlokPoR1EMs/IB1Ale35shKbShDIFLKRPZ92+jYR3Jp3D9DjfhbkDb52q
         /6NSz704IqAI9Db7NXKYsfwTghpXJ/YsfR3iO2q/OSp5AD41P9lxYlPoyOs/VoDojkGp
         oO8YYFxoL8eZrqeVPenSvQsYaqr80rNl8AHHEyujj0VdM8io9ND3QZqJd9lrpKn0VViN
         A24fE20ANjomG90150OxSWDyuKqmQukYGxZ0w+3kc4WleIZ3USCZeSY+66NVYanZIv3B
         Njn/GmT+vE8gJl94kTqBDp51zMBqUgecJHBi3safWaxfRfi+j0L4jVjmTR3AUrLK6Y66
         +okg==
X-Gm-Message-State: AOJu0YyuQ/K+8fpZotYHesnWVhZwETO4I6l67iFEcP4vmM2AE7x17E8B
	102nKA0az0i+PYOzq8A3zucKd2Xhw0rzz0ddCFuEYqN2XL32HqwBotA0KHiYtQH3OlxWE807kH9
	3IlqjJmJ0gi6vb7ecODfIUYUKH9KhXm2DJYy7fIahmO4kB4K2tNx8Mxbd0vB3wf8KW+C2ZZjCNJ
	lfdnEwyl/LWVjpNcA=
X-Gm-Gg: ATEYQzwgecgseeHhk3Rv+mvxdo7sMai5ASyl00RTuJZ6VGieHnFt7EY+ufeL6Sj77VS
	HS5ZeFl6VM5bwOqk9cdp9XG2q6+C/zdPJQJ3s+csXM61ozYNwjRp8+o+jJ/vH65TFCMq1+qY/Ig
	/juXGddqnbAL09UXUR9lpmtplxufQ5mNIelZKdkODTHwFL5z3W83qcYePRq/SlHRGT0Oaz/dy7X
	hofGXzM2n/GAaxU2OpntK91mJhphp9qZBvbH5Ug15wPjDU+vh10xFxprTmvT7HhLUIeiS4sElJq
	ZtjAJKHrbBFtkkNOZYVt7oOnfqKo1bRIIAXkiRve0cNub+B1ooXhviwwZc4kKGFLT8iFqsmxBuf
	ZRQN0BvFCDdN+n4q0KNBAjUNC1bfxWqt2ilviW4ivSkQTdT7Nig+yxIl5F+jQdi1JFNRpUugcRZ
	MHysVNU2nsR2FBSrrsJW5H/yxpQhP32Crd1b0=
X-Received: by 2002:a05:622a:5c89:b0:509:4b11:6cf4 with SMTP id d75a77b69052e-50b80c862a5mr25752941cf.5.1774397150936;
        Tue, 24 Mar 2026 17:05:50 -0700 (PDT)
X-Received: by 2002:a05:622a:5c89:b0:509:4b11:6cf4 with SMTP id d75a77b69052e-50b80c862a5mr25752551cf.5.1774397150423;
        Tue, 24 Mar 2026 17:05:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28520731esm3432895e87.45.2026.03.24.17.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:05:49 -0700 (PDT)
Date: Wed, 25 Mar 2026 02:05:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] class/pkgconfig: use pkgconf instead of pkgconfig
Message-ID: <h5lrgbr42atenjzkrgdl3wwxn7af76lafptxew2twvyjyjfknf@tntp4vm3eev7>
References: <20260320122732.1630715-1-ross.burton@arm.com>
 <20260320122732.1630715-5-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260320122732.1630715-5-ross.burton@arm.com>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c326e0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=7CQSdrXTAAAA:8 a=ZdTsr9lqNOwzTsP8h6oA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 2OlypmXHiz2vLJvGuTHzILiLGsWLlM2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE4NiBTYWx0ZWRfXwdUpDD/SSZDI
 pU5zjllU2rDj0mDlcJwFRyA149VclJMbzcVC0B+8tyz5V1N37+YCFn2y44f3dhaXXwFG7JSJGu0
 Djw6Rtrr4YeKJxwdVX70Xei+utTaxuBMGusNwB0e8srtqv0lugVg1UdDCRGHV4On9Zt2MkJQduc
 0XdU9/yfkfJFNOkbzN4ZhNkA/Uj9s3XYC2awFumaIGD5kXAvr6JbbKnm0VjjiCx0LTkMqYX6g08
 i8TpNg9agFyudU5HjdBpDw2kqrfN2rGIiKyOPsr5ynTlIg9YeqRKBOTkGbOR+Pfou4mvTIKCVDu
 cXdR6Bg1oR/yaPKO86CkZU+x/Dkey5THNiXXrsjGDZpZD81ZR7ggdbZTR/29WTreiZbA0u3V8wX
 UVE6p7R2/ak/duA7zAJokgtI9pVB6cpaeKOsUnoan7c4GBLf0KwfiA3esWiJ1pYlXHhK2lXhoUe
 MrnkNBPIn5fE2WdH2lw==
X-Proofpoint-GUID: 2OlypmXHiz2vLJvGuTHzILiLGsWLlM2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240186
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 00:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233836

On Fri, Mar 20, 2026 at 12:27:29PM +0000, Ross Burton wrote:
> The last meaningful change to freedesktop.org pkgconfig was in 2019, but
> pkgconf is actively maintained.
>=20
> Major distributions such as Fedora (and derivates), Debian (ditto), Arch
> Linux, Buildroot, and Alpine have all moved to pkgconf already.
>=20
> There's a subtle behaviour change between pkgconfig and pkgconf, whereas
> pkgconfig appends the sysroot to PKG_CONFIG_SYSTEM_INCLUDE_PATH pkgconf
> does not, so we need to sysroot-prefix those variables.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-recipe/pkgconfig.bbclass          | 6 +++---
>  meta/conf/distro/include/default-providers.inc | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

FWIW pkgconfig -> pkgconf change also break gst-plugins-imsdk build in
meta-qcom. Reverting this series makes the build succeed.

| FAILED: [code=3D1] gst-plugin-mlaconverter/CMakeFiles/gstqtimlaconverter.=
dir/audio-converter-engine.cc.o
| ccache /home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-q=
com-linux/gst-plugins-imsdk/0.1.0/recipe-sysroot-native/usr/bin/aarch64-qco=
m-linux/aarch64-qcom-linux-g++ --sysroot=3D/home/lumag/Projects/RPB/build-r=
pb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/recipe-=
sysroot -DHAVE_CONFIG_H -DHAVE_LINUX_DMA_BUF_H -Dgstqtimlaconverter_EXPORTS=
 -I/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-li=
nux/gst-plugins-imsdk/0.1.0/build/gst-plugin-mlaconverter -I/home/lumag/Pro=
jects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-im=
sdk/0.1.0/sources/gst-plugins-imsdk-0.1.0/gst-plugin-mlaconverter -I/home/l=
umag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-pl=
ugins-imsdk/0.1.0/recipe-sysroot/usr/include/gstreamer-1.0 -I/home/lumag/Pr=
ojects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-i=
msdk/0.1.0/recipe-sysroot/usr/include/glib-2.0 -I/home/lumag/Projects/RPB/b=
uild-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/r=
ecipe-sysroot/usr/lib/glib-2.0/include -I/usr/include/gstreamer-1.0 -I/home=
/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-=
plugins-imsdk/0.1.0/sources/gst-plugins-imsdk-0.1.0/gst-plugin-base -I/home=
/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-=
plugins-imsdk/0.1.0/recipe-sysroot/usr/include/json-glib-1.0 -I/home/lumag/=
Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins=
-imsdk/0.1.0/recipe-sysroot/usr/include/libmount -I/home/lumag/Projects/RPB=
/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0=
/recipe-sysroot/usr/include/blkid -march=3Darmv8.2-a+crypto -mbranch-protec=
tion=3Dstandard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wforma=
t -Wformat-security -Werror=3Dformat-security  --sysroot=3D/home/lumag/Proj=
ects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-ims=
dk/0.1.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=3D/ho=
me/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gs=
t-plugins-imsdk/0.1.0/sources/gst-plugins-imsdk-0.1.0=3D/usr/src/debug/gst-=
plugins-imsdk/0.1.0  -ffile-prefix-map=3D/home/lumag/Projects/RPB/build-rpb=
/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/build=3D/=
usr/src/debug/gst-plugins-imsdk/0.1.0  -ffile-prefix-map=3D/home/lumag/Proj=
ects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-ims=
dk/0.1.0/recipe-sysroot=3D  -ffile-prefix-map=3D/home/lumag/Projects/RPB/bu=
ild-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/re=
cipe-sysroot-native=3D  -pipe -fvisibility-inlines-hidden -Wall -Wextra -We=
rror -Wno-unused-parameter -std=3Dgnu++17 -fPIC -MD -MT gst-plugin-mlaconve=
rter/CMakeFiles/gstqtimlaconverter.dir/audio-converter-engine.cc.o -MF gst-=
plugin-mlaconverter/CMakeFiles/gstqtimlaconverter.dir/audio-converter-engin=
e.cc.o.d -o gst-plugin-mlaconverter/CMakeFiles/gstqtimlaconverter.dir/audio=
-converter-engine.cc.o -c /home/lumag/Projects/RPB/build-rpb/tmp-qcom-distr=
o/work/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/sources/gst-plugins-imsd=
k-0.1.0/gst-plugin-mlaconverter/audio-converter-engine.cc
| cc1plus: error: include location "/usr/include/gstreamer-1.0" is unsafe f=
or cross-compilation [-Werror=3Dpoison-system-directories]
| cc1plus: all warnings being treated as errors
| ninja: build stopped: subcommand failed.
|
| WARNING: exit code 1 from a shell command.
ERROR: Task (/home/lumag/Projects/RPB/build-rpb/conf/../../layers/meta-qcom=
/recipes-multimedia/imsdk/gst-plugins-imsdk_0.1.0.bb:do_compile) failed wit=
h exit code '1'

--=20
With best wishes
Dmitry

