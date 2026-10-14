Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEF9C3DA7A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 16:37:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8316.1791964813741541635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 01:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bEhRlfCK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XudLtoPL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: paddy.chiu@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E663RF3365339
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 07:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5YVQxi2JGcpxtwopbwocpj5f
	APqjWoN5Ea0njpYRpsY=; b=bEhRlfCKvK4dRBRHDtH1fACEAxQL2CbaH1XyUs8O
	4SU4JsKVUwl38mtCuBUiNO7dwMVGVK4m0sMCAAYOrG1ipTaoMUDbt802jjnrv/Ra
	4NHSgXEACx81EWBI4l1wzfMiOLG2Pni7RF8YeCoKw3DV06K4MC56LV0XHRanE56p
	F9RqJ5vsfQiWn4p1JiCO95i3LhI7NNqc9AcAbF+/lZ35yG6Q76aQbgHBWgbonMSh
	D082XyuHhG1krF/EDtq6Zka0rkvv8AA/svZLRAOkWRlDkYs1aFPkG2+ugUIirvcr
	PUuBSVwtUGV8YoiWQP9+TWMBux//MT/iLU2x2MuvgnkDzQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4620d9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 07:48:00 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-448d51840c4so3694491fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 00:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791964080; cv=none;
        d=google.com; s=arc-20260327;
        b=GSXONYf0iV/lrhehllL1+2dEIv7ddeccrv3T/JNXLMYKCDyX9Eak22Cx0z/o8+A1jN
         SjqIwvkwpRYz/tAWbn+I1bofTMWWsUFAIJWh/xViFg4ySlSg8Ip540NafV+8mM/r7KE1
         IhOV7mAUQtIdJfxtmbQY5szWy43lNWV1n+z65kZ7tGlAmIJtzScs25J0TWoVZoh/RPiB
         P+a05lvuOsnv+1SJMFVLKnZCvZDCjZ8Fa1+apQxsyeGiZxv71IhPnWgzVRaBvMKZ5mqz
         e/VfyXgTXBP0QCy1BQAWJ5JEaNASUqel42sVKUljgP29kB2jm2O9VcokWZTJwe3Oglg8
         gGEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5YVQxi2JGcpxtwopbwocpj5fAPqjWoN5Ea0njpYRpsY=;
        fh=xlZxeILsq1x9gNxk0PsvcNBx8g6UGZcpTmkgfXhrWTA=;
        b=H0dYuE5AFJmhanWGr461yxFSaDp2czm6rl0oTLLJW2mijCB5V6kYSvedxiIt2vHoAV
         qimAujd09TxByc44RwmjIv6dG5QH8f96uaSvl/RB6OgjTKidInr/bkwtrsrrWioBaJ/K
         aLzIW5FM0bpwfgZW5BIdIm8d0XvzAcT4vZUsng/R2Y8BFoT//9kzBW5GAIrIKHYoRSDk
         EkYUusrW015UlYe/xQSaywV/DsDwqM5vXzGSQR7vDbTCv6XlkvgzOeeJAixuh4cYj5+L
         vxMxcjFRlj965F57lISFTU2IVdbJa7M9FPwm0Jq519v5qrEH88gfphkpFuqe0Ovglyoq
         J1sg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791964080; x=1792568880; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5YVQxi2JGcpxtwopbwocpj5fAPqjWoN5Ea0njpYRpsY=;
        b=XudLtoPLfU22thLgYatCMPpmNPC32oa2nvtqXAjDTdIh+KvPsAAoLfG6is2/hMS1tx
         Ldcew5zMc6b3GvCT5pvjlr/0k6Acw5isEva8z8Ukek8ipyAX+zBodk1EuX2dMD8Md9XT
         JbDVkUHI7s5/IlXv84wS+UXVbCB3nlkUsjAvTYfznBULq85vlWEHC2Z9d9zTKd50ri0U
         hA7A91L5MN1SkGFB4V7/njcOFwWr5OXIX18K+yUBGYS5G45cel7aFCxwpFYL2i209EBY
         QaYGJBOJKN+Ll3oTm79yBb64PaUcFYzjWjGYM3wYvYfIFAEo1kzN16F4XTgejyoj1M97
         LccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791964080; x=1792568880;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5YVQxi2JGcpxtwopbwocpj5fAPqjWoN5Ea0njpYRpsY=;
        b=V9idDWBA0x+V+y6R+HbsrSIRlWcFmujAqVZlkno5rHqVnGywAGCpjyKjJON8PTV34r
         2mjVlTom+7BFw5UPkDeZVE0Ao16qPW31UNT12H+m6ZLAh1Hs8MhxbvRRigqlN6LadXQF
         lsRFduN2qO06Y7NAJJ8Rn1dva6kVuEz3lsodYpMm3DVdtJZ+3YVDKrvDJPJkkEX8EnG9
         JB9laBUmfuN/ebC+i4GdNG6RzSA9HMR5HJV2X/0X6HID9SifNIEiFqfdXn41ZvOXE4sS
         Rg27FNg4LU4wBBCJGuwf+U1T2r6wntrMoZlxa5SFoQW3WQKykasUmef1Pxfw6Dyrp8EJ
         vkqw==
X-Gm-Message-State: AFq9FYJX29UtZDtdo/c3rB3YRR+u+3O3Ib+nMaAFPWrwVFdr2jF2/UYO
	6sn416oVl2+l+gQ3Shf/Z/0nfKoKYbvtoJrdoezhhsepR/7SSYhywwIri8jzb9hyGJCl6ELyXwK
	xvwcIpWRcQyM322dfQtJIK4mouPdzeJ74eVmbmc5909GZoYLW0rY+ULU969305/aGhRPSPHkzzA
	JB40kB5P/IAek4/MREVGjZiMZeGouBm1robeqJX5PyJaEYOX8uWoyegh8+ug==
X-Gm-Gg: AYBFou1cTK5V8+H7ucZUF+PE5vFzUs3Se/Qc+h413Z1h88HsKW4a1G1yN/g+5t+Uz91
	2ZkC54eaoqf/E5FgBmo9SIQYaH4/rnZ3WOa0f2pLtk5gyod1lLr8J3UiGfbJqeSWL/wweDMnVId
	/hOD4gDKMB5JzL8ZJrqmeaaUVTHJ1kuu62wmVlmh7gsQf0ns/O2derRsDJ36M=
X-Received: by 2002:a05:6808:bc1:b0:4f7:867a:1136 with SMTP id 5614622812f47-50c57c62e01mr14631841b6e.64.1791964079764;
        Wed, 14 Oct 2026 00:47:59 -0700 (PDT)
X-Received: by 2002:a05:6808:bc1:b0:4f7:867a:1136 with SMTP id
 5614622812f47-50c57c62e01mr14631828b6e.64.1791964079307; Wed, 14 Oct 2026
 00:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260922092015.2428562-1-paddy.chiu@oss.qualcomm.com>
 <8e963943c0883e50063000148a5303edb57582f1.camel@linuxfoundation.org> <CAKFR0p2fPFF5NgizmHmWdJm_QVELMBhokXO5gXNz2WR=Sw39Ow@mail.gmail.com>
In-Reply-To: <CAKFR0p2fPFF5NgizmHmWdJm_QVELMBhokXO5gXNz2WR=Sw39Ow@mail.gmail.com>
From: Paddy Chiu <paddy.chiu@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:47:46 +0800
X-Gm-Features: AclHuK8O-hDDDAzQzE9uhuX9V9xeHc6STk7EGp7iPs7Bn7ai5497jyi0v-7YUIE
Message-ID: <CAKFR0p2kFxU3FHFT5oDib7LSoajVsqxY7diY52tXAM-UANFeeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc: fix PKGV for devtool build
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, jose.quaresma@oss.qualcomm.com
X-Proofpoint-ORIG-GUID: k_gD2mREYDULPP5UDYMKP4-VlLGczGlF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMCBTYWx0ZWRfX4ThjhQZwOirJ
 Ea7RLa34E81CyybnwBYWnaUmdR2tGJ+FBe090mf40+C9yBhfBWRjhB3ZRYb91Ew4G2D4+3EY2wd
 zZgyWi+I18gSw5TPt+YLUtWs3xSrl2E9DsxJSI/zZ1ld800jq1GAHBZefecNH06+WrxmRMcJsL2
 E5+51v4k1sp7h6wvTUBU/BLWQql7EY/dyUXhKMvNq7w7ABCTu9x1Kl4am1KenGtpxxa1mgLSZMA
 U6kwHpoMjay6VmYMnTT3Tkj4Z6sXRTXh70CsG4RhQrNP4SI5sNFP7mpT4QW26FVU8EXriswyaO9
 34b8id8BUCqSxPg2hME44+fkAfIZMdRwUBZ07zLxcUEuoH1bWsd1ntFq/oIRKF7y2hpUXhM1xw4
 UnC/tGHIwA7DKpw0QX8bMe9e2at0ssJbXAoHpPtTTQAJ/84gtZhRhrIWW8xZYUnvmGs6OXj7ywc
 OyxS3GkoqblQyLnyOXg==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf33b0 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8 a=Q4-j1AaZAAAA:8 a=4eOvugPk8RPwnQHdKU8A:9
 a=QEXdDO2ut3YA:10 a=ZXKWx-yiSfMhw3FGchMA:9 a=3c0R6HXeUS52ht67:21
 a=lqcHg5cX4UMA:10 a=y8BKWJGFn5sdPF1Y92-H:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMCBTYWx0ZWRfX2EWUnLgZUd4M
 sHH1WBbCI4tBbcyJfSy55t7Axk9Mz9EMi4y6JsaInq/ada3EtC+Cncp61wTay+gfbwpZ33nVZv3
 6WmHdiVjRkdzdcbnCfutOW1KV1IbzA4=
X-Proofpoint-GUID: k_gD2mREYDULPP5UDYMKP4-VlLGczGlF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140030
Content-Type: multipart/alternative; boundary="00000000000065cdc1065dc8266d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 16:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247789

--00000000000065cdc1065dc8266d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
Is there any update?

Thanks,
Paddy

On Sun, Oct 4, 2026 at 11:43=E2=80=AFPM Paddy Chiu <paddy.chiu@oss.qualcomm=
.com>
wrote:

> Hi Richard,
> Sorry for the late reply.
>
> Patch v2 (Proposed fix) addresses the concern with the previous approach:
> it no longer copies the datastore or rewrites SRC_URI during package
> version calculation.
>
> Instead, externalsrc saves the formatted source-version suffix in
> EXTERNALSRC_PKGV_SUFFIX before filtering SCM URLs. The package and
> PR-service paths reuse it, while the normal fetcher path remains unchange=
d
> for non-externalsrc builds.
>
> Validation used git-submodule-test for both requested transitions:
>
>   BitBake to devtool: both builds produce the same hash-bearing PKGV and =
no
>   version-going-backwards QA error.
>
>   devtool to BitBake: both builds produce the same PKGV with no regressio=
n
>   in the reverse transition.
>
> Changes since v1:
>
>   - replace the copied datastore/SRC_URI override with a saved suffix;
>   - use the suffix for both PKGV and AUTOINC PR-service handling.
>
> [PATCH v2 1/1] externalsrc: preserve source revision in PKGV
>
> externalsrc removes SCM URLs from SRC_URI before packaging, so the
> packaging fetcher cannot derive the source revision for devtool builds.
>
> Capture the formatted source-version suffix before filtering and
> reuse it for package version and AUTOINC PR-service handling. This
> keeps the normal fetcher path unchanged and avoids restoring a copied
> datastore.
>
> Signed-off-by: Paddy Chiu <paddy.chiu@oss.qualcomm.com>
> ---
>  meta/classes-global/package.bbclass | 8 ++++++--
>  meta/classes/externalsrc.bbclass    | 3 +++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/package.bbclass
> b/meta/classes-global/package.bbclass
> index 67148fc1ac..f57397e83d 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -299,7 +299,9 @@ python package_get_auto_pr() {
>                  pr =3D d.getVar('PR')
>                  # Strip PR to make AUTOINC can increase when SRCREV is
> changed
>                  base_ver =3D "AUTOINC-%s" % version[:-len(pr)]
> -                srcpv =3D bb.fetch2.get_srcrev(d)
> +                srcpv =3D d.getVar("EXTERNALSRC_PKGV_SUFFIX")
> +                if srcpv is None:
> +                    srcpv =3D bb.fetch2.get_srcrev(d)
>                  value =3D conn.getPR(base_ver, pkgarch, srcpv)
>                  d.setVar("PRSERV_PV_AUTOINC", str(value))
>
> @@ -319,7 +321,9 @@ python package_get_auto_pr() {
>  python package_setup_pkgv() {
>      pkgv =3D d.getVar("PKGV")
>      # Expand SRCPV into PKGV if not present
> -    srcpv =3D bb.fetch.get_pkgv_string(d)
> +    srcpv =3D d.getVar("EXTERNALSRC_PKGV_SUFFIX")
> +    if srcpv is None:
> +        srcpv =3D bb.fetch.get_pkgv_string(d)
>      if srcpv and "+" in pkgv:
>          d.appendVar("PKGV", srcpv)
>          pkgv =3D d.getVar("PKGV")
> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> index 902ff2604f..47c1b06788 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -78,6 +78,9 @@ python () {
>              d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
>
>          bb.fetch.get_hashvalue(d)
> +        # Keep the source version available for packaging. SCM URLs are
> removed
> +        # below so externalsrc does not fetch or unpack the external
> source.
> +        d.setVar('EXTERNALSRC_PKGV_SUFFIX', bb.fetch.get_pkgv_string(d))
>          local_srcuri =3D []
>          fetch =3D bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d=
)
>          for url in fetch.urls:
> --
> 2.34.1
>
> Please let me know if further changes or discussion are needed.
>
> Best Regards,
> Paddy
>
> On Wed, Sep 23, 2026 at 10:08=E2=80=AFPM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Tue, 2026-09-22 at 02:20 -0700, Paddy Chiu via lists.openembedded.org
>> wrote:
>> > Without this fix, PKGV will be the same as PV when using devtool build=
.
>> > Since SRC_URI is set to local_srcuri in externalsrc.bbclass and
>> consequently cause missing git commit hash in PKGV.
>> > This fix can prevent buildhistory package-version QA failures in
>> devtool build.
>> > ---
>> >  meta/classes-global/package.bbclass | 12 ++++++++++--
>> >  meta/classes/externalsrc.bbclass    |  4 ++++
>> >  2 files changed, 14 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/classes-global/package.bbclass
>> b/meta/classes-global/package.bbclass
>> > index 67148fc1ac..c5f8b2136f 100644
>> > --- a/meta/classes-global/package.bbclass
>> > +++ b/meta/classes-global/package.bbclass
>> > @@ -242,6 +242,14 @@ python () {
>> >          d.appendVarFlag('do_package', 'deptask', " do_packagedata")
>> >  }
>> >
>> > +def package_get_srcdata(d):
>> > +    srcuri =3D d.getVar("EXTERNALSRC_ORIG_SRC_URI")
>> > +    if not srcuri:
>> > +        return d
>> > +
>> > +    srcdata =3D d.createCopy()
>> > +    srcdata.setVar("SRC_URI", srcuri)
>> > +    return srcdata
>> >
>> >  PRSERV_ACTIVE =3D "${@bool(d.getVar("PRSERV_HOST"))}"
>> >  PRSERV_ACTIVE[vardepvalue] =3D "${PRSERV_ACTIVE}"
>> > @@ -299,7 +307,7 @@ python package_get_auto_pr() {
>> >                  pr =3D d.getVar('PR')
>> >                  # Strip PR to make AUTOINC can increase when SRCREV i=
s
>> changed
>> >                  base_ver =3D "AUTOINC-%s" % version[:-len(pr)]
>> > -                srcpv =3D bb.fetch2.get_srcrev(d)
>> > +                srcpv =3D bb.fetch2.get_srcrev(package_get_srcdata(d)=
)
>> >                  value =3D conn.getPR(base_ver, pkgarch, srcpv)
>> >                  d.setVar("PRSERV_PV_AUTOINC", str(value))
>> >
>> > @@ -319,7 +327,7 @@ python package_get_auto_pr() {
>> >  python package_setup_pkgv() {
>> >      pkgv =3D d.getVar("PKGV")
>> >      # Expand SRCPV into PKGV if not present
>> > -    srcpv =3D bb.fetch.get_pkgv_string(d)
>> > +    srcpv =3D bb.fetch.get_pkgv_string(package_get_srcdata(d))
>> >      if srcpv and "+" in pkgv:
>> >          d.appendVar("PKGV", srcpv)
>> >          pkgv =3D d.getVar("PKGV")
>> > diff --git a/meta/classes/externalsrc.bbclass
>> b/meta/classes/externalsrc.bbclass
>> > index 902ff2604f..a1bb92a418 100644
>> > --- a/meta/classes/externalsrc.bbclass
>> > +++ b/meta/classes/externalsrc.bbclass
>> > @@ -78,6 +78,10 @@ python () {
>> >              d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
>> >
>> >          bb.fetch.get_hashvalue(d)
>> > +        # Keep the original URI available for packaging. SCM URLs are
>> removed
>> > +        # below so externalsrc does not fetch or unpack the external
>> source,
>> > +        # but package_setup_pkgv() still needs them to derive PKGV.
>> > +        d.setVar('EXTERNALSRC_ORIG_SRC_URI', d.getVar('SRC_URI'))
>> >          local_srcuri =3D []
>> >          fetch =3D bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split()=
, d)
>> >          for url in fetch.urls:
>>
>>
>> We really need to find a different way to fix this. I don't doubt there
>> is an issue here but change the datastore and it's variables around mid
>> function like that is really a hacky workaround, not a proper fix.
>>
>> If we did this each time we found a bug, the code would become
>> unmaintainable.
>>
>> Cheers,
>>
>> Richard
>>
>

--00000000000065cdc1065dc8266d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<br>Is there any update?<br><br>Thanks,<br>Padd=
y</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Sun, Oct 4, 2026 at 11:43=E2=80=AFPM Paddy Chiu &=
lt;<a href=3D"mailto:paddy.chiu@oss.qualcomm.com">paddy.chiu@oss.qualcomm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr">Hi Richard,<br>Sorry for the late reply.<br><br>Patch v2=
 (Proposed fix) addresses the concern with the previous approach:<br>it no =
longer copies the datastore or rewrites SRC_URI during package<br>version c=
alculation.<br><br>Instead, externalsrc saves the formatted source-version =
suffix in<br>EXTERNALSRC_PKGV_SUFFIX before filtering SCM URLs. The package=
 and<br>PR-service paths reuse it, while the normal fetcher path remains un=
changed<br>for non-externalsrc builds.<br><br>Validation used git-submodule=
-test for both requested transitions:<br><br>=C2=A0 BitBake to devtool: bot=
h builds produce the same hash-bearing PKGV and no<br>=C2=A0 version-going-=
backwards QA error.<br><br>=C2=A0 devtool to BitBake: both builds produce t=
he same PKGV with no regression<br>=C2=A0 in the reverse transition.<br><br=
>Changes since v1:<br><br>=C2=A0 - replace the copied datastore/SRC_URI ove=
rride with a saved suffix;<br>=C2=A0 - use the suffix for both PKGV and AUT=
OINC PR-service handling.<br><br>[PATCH v2 1/1] externalsrc: preserve sourc=
e revision in PKGV<br><br>externalsrc removes SCM URLs from SRC_URI before =
packaging, so the<br>packaging fetcher cannot derive the source revision fo=
r devtool builds.<br><br>Capture the formatted source-version suffix before=
 filtering and<br>reuse it for package version and AUTOINC PR-service handl=
ing. This<br>keeps the normal fetcher path unchanged and avoids restoring a=
 copied<br>datastore.<br><br>Signed-off-by: Paddy Chiu &lt;<a href=3D"mailt=
o:paddy.chiu@oss.qualcomm.com" target=3D"_blank">paddy.chiu@oss.qualcomm.co=
m</a>&gt;<br>---<br>=C2=A0meta/classes-global/package.bbclass | 8 ++++++--<=
br>=C2=A0meta/classes/externalsrc.bbclass =C2=A0 =C2=A0| 3 +++<br>=C2=A02 f=
iles changed, 9 insertions(+), 2 deletions(-)<br><br>diff --git a/meta/clas=
ses-global/package.bbclass b/meta/classes-global/package.bbclass<br>index 6=
7148fc1ac..f57397e83d 100644<br>--- a/meta/classes-global/package.bbclass<b=
r>+++ b/meta/classes-global/package.bbclass<br>@@ -299,7 +299,9 @@ python p=
ackage_get_auto_pr() {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pr =3D d.getVar(&#39;PR&#39;)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Strip PR to make AUTOINC can increase w=
hen SRCREV is changed<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0base_ver =3D &quot;AUTOINC-%s&quot; % version[:-len(pr)]<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcpv =3D bb.fetch2.=
get_srcrev(d)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
rcpv =3D d.getVar(&quot;EXTERNALSRC_PKGV_SUFFIX&quot;)<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if srcpv is None:<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcpv =3D bb.fet=
ch2.get_srcrev(d)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0value =3D conn.getPR(base_ver, pkgarch, srcpv)<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;PRSERV_PV_AU=
TOINC&quot;, str(value))<br>=C2=A0<br>@@ -319,7 +321,9 @@ python package_ge=
t_auto_pr() {<br>=C2=A0python package_setup_pkgv() {<br>=C2=A0 =C2=A0 =C2=
=A0pkgv =3D d.getVar(&quot;PKGV&quot;)<br>=C2=A0 =C2=A0 =C2=A0# Expand SRCP=
V into PKGV if not present<br>- =C2=A0 =C2=A0srcpv =3D bb.fetch.get_pkgv_st=
ring(d)<br>+ =C2=A0 =C2=A0srcpv =3D d.getVar(&quot;EXTERNALSRC_PKGV_SUFFIX&=
quot;)<br>+ =C2=A0 =C2=A0if srcpv is None:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
srcpv =3D bb.fetch.get_pkgv_string(d)<br>=C2=A0 =C2=A0 =C2=A0if srcpv and &=
quot;+&quot; in pkgv:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&quo=
t;PKGV&quot;, srcpv)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgv =3D d.getVar=
(&quot;PKGV&quot;)<br>diff --git a/meta/classes/externalsrc.bbclass b/meta/=
classes/externalsrc.bbclass<br>index 902ff2604f..47c1b06788 100644<br>--- a=
/meta/classes/externalsrc.bbclass<br>+++ b/meta/classes/externalsrc.bbclass=
<br>@@ -78,6 +78,9 @@ python () {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0d.setVar(&#39;B&#39;, &#39;${WORKDIR}/${BPN}-${PV}&#39;)<br>=C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fetch.get_hashvalue(d)<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0# Keep the source version available for packaging. =
SCM URLs are removed<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0# below so externalsrc=
 does not fetch or unpack the external source.<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0d.setVar(&#39;EXTERNALSRC_PKGV_SUFFIX&#39;, bb.fetch.get_pkgv_string(=
d))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_srcuri =3D []<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0fetch =3D bb.fetch2.Fetch((d.getVar(&#39;SRC_URI&#3=
9;) or &#39;&#39;).split(), d)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for url=
 in fetch.urls:<br>--<br>2.34.1<br><br>Please let me know if further change=
s or discussion are needed.<br><br>Best Regards,<br>Paddy</div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 23, 20=
26 at 10:08=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@=
linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Tue, 2026-09-22 at 02:20 -0700, Paddy Chiu via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> wrote:<br>
&gt; Without this fix, PKGV will be the same as PV when using devtool build=
.<br>
&gt; Since SRC_URI is set to local_srcuri in externalsrc.bbclass and conseq=
uently cause missing git commit hash in PKGV.<br>
&gt; This fix can prevent buildhistory package-version QA failures in devto=
ol build.<br>
&gt; ---<br>
&gt; =C2=A0meta/classes-global/package.bbclass | 12 ++++++++++--<br>
&gt; =C2=A0meta/classes/externalsrc.bbclass=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++=
+<br>
&gt; =C2=A02 files changed, 14 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-global/package.bbclass b/meta/classes-global=
/package.bbclass<br>
&gt; index 67148fc1ac..c5f8b2136f 100644<br>
&gt; --- a/meta/classes-global/package.bbclass<br>
&gt; +++ b/meta/classes-global/package.bbclass<br>
&gt; @@ -242,6 +242,14 @@ python () {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag(&#39;=
do_package&#39;, &#39;deptask&#39;, &quot; do_packagedata&quot;)<br>
&gt; =C2=A0}<br>
&gt; =C2=A0<br>
&gt; +def package_get_srcdata(d):<br>
&gt; +=C2=A0=C2=A0=C2=A0 srcuri =3D d.getVar(&quot;EXTERNALSRC_ORIG_SRC_URI=
&quot;)<br>
&gt; +=C2=A0=C2=A0=C2=A0 if not srcuri:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return d<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0 srcdata =3D d.createCopy()<br>
&gt; +=C2=A0=C2=A0=C2=A0 srcdata.setVar(&quot;SRC_URI&quot;, srcuri)<br>
&gt; +=C2=A0=C2=A0=C2=A0 return srcdata<br>
&gt; =C2=A0<br>
&gt; =C2=A0PRSERV_ACTIVE =3D &quot;${@bool(d.getVar(&quot;PRSERV_HOST&quot;=
))}&quot;<br>
&gt; =C2=A0PRSERV_ACTIVE[vardepvalue] =3D &quot;${PRSERV_ACTIVE}&quot;<br>
&gt; @@ -299,7 +307,7 @@ python package_get_auto_pr() {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr =3D d.getVar(&#39;PR&#39;)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Strip PR to make AUTOINC can increase when SR=
CREV is changed<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 base_ver =3D &quot;AUTOINC-%s&quot; % version[:=
-len(pr)]<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 srcpv =3D bb.fetch2.get_srcrev(d)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 srcpv =3D bb.fetch2.get_srcrev(package_get_srcdata(d)=
)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D conn.getPR(base_ver, pkgarch, srcpv)<=
br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar(&quot;PRSERV_PV_AUTOINC&quot;, str(val=
ue))<br>
&gt; =C2=A0<br>
&gt; @@ -319,7 +327,7 @@ python package_get_auto_pr() {<br>
&gt; =C2=A0python package_setup_pkgv() {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 pkgv =3D d.getVar(&quot;PKGV&quot;)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 # Expand SRCPV into PKGV if not present<br>
&gt; -=C2=A0=C2=A0=C2=A0 srcpv =3D bb.fetch.get_pkgv_string(d)<br>
&gt; +=C2=A0=C2=A0=C2=A0 srcpv =3D bb.fetch.get_pkgv_string(package_get_src=
data(d))<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 if srcpv and &quot;+&quot; in pkgv:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar(&quot;PKG=
V&quot;, srcpv)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgv =3D d.getVar(&qu=
ot;PKGV&quot;)<br>
&gt; diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externals=
rc.bbclass<br>
&gt; index 902ff2604f..a1bb92a418 100644<br>
&gt; --- a/meta/classes/externalsrc.bbclass<br>
&gt; +++ b/meta/classes/externalsrc.bbclass<br>
&gt; @@ -78,6 +78,10 @@ python () {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 d.setVar(&#39;B&#39;, &#39;${WORKDIR}/${BPN}-${PV}&#39;)<br>
&gt; =C2=A0<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fetch.get_hashvalu=
e(d)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Keep the original URI av=
ailable for packaging. SCM URLs are removed<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # below so externalsrc doe=
s not fetch or unpack the external source,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # but package_setup_pkgv()=
 still needs them to derive PKGV.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar(&#39;EXTERNALSRC_=
ORIG_SRC_URI&#39;, d.getVar(&#39;SRC_URI&#39;))<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_srcuri =3D []<b=
r>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fetch =3D bb.fetch2.F=
etch((d.getVar(&#39;SRC_URI&#39;) or &#39;&#39;).split(), d)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for url in fetch.urls=
:<br>
<br>
<br>
We really need to find a different way to fix this. I don&#39;t doubt there=
<br>
is an issue here but change the datastore and it&#39;s variables around mid=
<br>
function like that is really a hacky workaround, not a proper fix.<br>
<br>
If we did this each time we found a bug, the code would become<br>
unmaintainable.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>
</blockquote></div>

--00000000000065cdc1065dc8266d--

