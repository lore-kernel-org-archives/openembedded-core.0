Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D193DC982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 13:22:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10058.1790083365520629966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 06:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=avEyYK/p;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dAquiOf3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPDWF620047
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 13:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PKx7dFrEirwO9CPTHHgmqYHt
	AfmHLFzMAlH0WAZlCp0=; b=avEyYK/pE8GwuRrWp/DUxt4AU/1/DPLXsOEoLVg2
	BTX3pC7AIpgEvWAZFjxQmWrzfY788/JAOrrj+NsJV9UUlELpSGJf1rxzJyyiUuII
	dAiip5pJrQ2MElUldWfMO6dPbUd4pfj1kb7XDPLADTJNsCcrOWX4I4FsKdk9cheK
	9hzDPhbFFOjPmMkPG8OhtxflfdbTYvNTr8vHNIpONsFp8AKcebxEF2ZGl++549J9
	TpbHPhAKSB9GPeLBFCoKemaai/98PVaJSPS3+HGd0vau5pDbqbcnre+LGfjuaoMV
	bC0SSFm0Qt33q9XBwEDeoDOVN8+ssShidL3eJovxIWyarQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5thd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 13:22:43 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c2549d0cbaso6340837eaf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 06:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790083363; cv=none;
        d=google.com; s=arc-20260327;
        b=QTkKZFmEU2jK40YZ7/GIj3986DrfaFYe060ZvHnbAg4g2gMQ5KLRg3r7Yc7WJOhJ5k
         yiK/jrdv9DPjEmDIui/cmDx4GFm6oAmyqrn3wJs8gujHXYyCegvcPpSGRldADas7O0sa
         83d56Z75jV4fcKkSVeL0N43Z2hOcGGK6HVu/TdM2poTR0fX5hWbS/bZ5wTLwNNT9cOCQ
         eRHaHT2V8gt6mQURh9f+8AdQsYfPMRcjkBbZARLlGLAbhvoyrlcrCyRiqqbJMMHddRqz
         hKVLuh+2dJFwgI9P0b30wRgV9QvrBBFIXnEogu/GnUeiPCt1iaQxPqZ0b5GgVI1caN1N
         zXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PKx7dFrEirwO9CPTHHgmqYHtAfmHLFzMAlH0WAZlCp0=;
        fh=laiFijwgbeJcOoShvEfCehKP0HKthC9LgSjiH4KeXcs=;
        b=hkZkx8k8zoYQMb6dOFJ7SR+9jw4BW0FrpvieYv4ht9ZGvZmAW6ZX8FTqa1cjFeDlrR
         Jw10RRdQ8qgvB8sMMtA6VYdvqoZ3Z/z3fuCZexoTTdqMdAM5FmKOQAv0lSMH7DfZ4sWg
         qAhdbt8cD+cfskVhI7f8Xge7fTipQJ7yajQFCVCzjslgGkthdDiifWjpt/4TX2qJ3uo+
         01hHzZiksL8FiP5vhGLi0l7OPTFvLQaqgMo6hyfyNyvdZdblvizhIpIrewJO1OEhAM+8
         j4o2RTmnIiWwfXbz6l1f/RIUMgrHLJW2M3MUOsf4aOU3Huw28Ap7MgNPoltxI7kkB9Mw
         XGgg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790083363; x=1790688163; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKx7dFrEirwO9CPTHHgmqYHtAfmHLFzMAlH0WAZlCp0=;
        b=dAquiOf31KmlCZw2Lnq+KW6RXI6lPKnQCZZBvM+iL76lthvOUbyu/o1sqH9gZ6VsxO
         If48CR8+4dEjb944mVKHtUVUYD1aHMFm02fR4i9GZBKc448WNr5y4rZpsKQRMxn443Ku
         Q7nCKCZxF6IMdTeFmIc45YnIshqp7CGn1WEkIVpLba05KjzcYNsWENf6VLK2yZtE176J
         v3dE8X1WiIeqDL2Ln7shtEECgHFUR7tFj0libE4a9SKSHOY6W/k4AtvlzcHsMF1mmn79
         RoB+dR7OV4mMTmV0K7KX38GrBxVW+3WbQgzFmhqzirIYb3+2HvFUA3NtOjOuOQX36L3l
         A4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083363; x=1790688163;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PKx7dFrEirwO9CPTHHgmqYHtAfmHLFzMAlH0WAZlCp0=;
        b=uwgUwhzcUu5Dc3XI/pbvwQ+51HfwXM0uc0HZxQiuQmD/1FjwbGRTrVgfdnuD0M64C1
         BamMtzbO1XYSSyk1k6LCcWVPdscEscotKXA1t0l/j9VAGbvEu3o43DIWSfaqNJ8d3aHb
         xIlGjFyL+liftsyabvv+7HWHcS2qukCviK13eH6cLK+v7fG1RHcyjMHvMkKqHAUwh9Nw
         o6ft4HY0alv/EXBlxYVuN3DWfWK8PEaHLvHscpJjIDqsMr9ZF2AiUhV9SXqmpFi8o5EA
         K5DXv7jU1rIUAEj2Y/WioxgwC/xK/Fsm85rJQvPOeTpWomPVDzxwiYBiFqvm9OSgHTcZ
         672w==
X-Gm-Message-State: AFuF++lZO6OdiSxkl/sUkoOJ8evg6RFJYuPhFe1ZpDiN/ncqhNoz6xrT
	H6mqnHMLr5p80v64g5x9VJFpHGJri+s3AeX1axt5cLwJOSrTSW5YJK2Rb+LmLLfnXI8wh4Sj6Bl
	3s9oDtVSFKw15pihyj96YTjue37tderxFcB6FWAZh8dN0HI/Qwbx4dCvKnX7xD8UvBB4kL33i2z
	Osr2ypLK2u6a+2/b7SpPfS59OspgTI1T0/B9p+m4IvwRpA3WZVEBKaxFTCGA==
X-Gm-Gg: AYBFou170MvaTpZJqOQzSMnbq9SF8nqaLho+7PWsH1XF8ubLy5JpymxWqZbaorP7x86
	Fvyc4ahUyQyDSoJGDvacj691cyesjK/njrp9E/jawQ0Om2pdcHufL1Yg/SIpgrUg05izijM9k49
	TL8LVHnVFLNCmI2wACB51VgJ1Kbv5+y5Hx0Lgh4czN6yEPrr/+gX+flmVP2N8=
X-Received: by 2002:a05:6820:222a:b0:6b1:4e36:fb80 with SMTP id 006d021491bc7-6ca9a243975mr12641315eaf.15.1790083363046;
        Tue, 22 Sep 2026 06:22:43 -0700 (PDT)
X-Received: by 2002:a05:6820:222a:b0:6b1:4e36:fb80 with SMTP id
 006d021491bc7-6ca9a243975mr12641289eaf.15.1790083362539; Tue, 22 Sep 2026
 06:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260922092015.2428562-1-paddy.chiu@oss.qualcomm.com>
In-Reply-To: <20260922092015.2428562-1-paddy.chiu@oss.qualcomm.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:22:29 +0100
X-Gm-Features: AcwNN1WDElSfYu4I_BZGKvS5cOYSeTGvEd_KSb-Y_B_k5pi1gLZdMF1xqnllcVk
Message-ID: <CADWMC-Z2gS=0rW9q29QEv=j-t69bVbF7gtfpQrFcfqHNJNqG-w@mail.gmail.com>
Subject: Re: [PATCH] externalsrc: fix PKGV for devtool build
To: Paddy Chiu <paddy.chiu@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f15fa5065c124217"
X-Proofpoint-GUID: DELYKTPwt_czLDLPAmGEEKKpfEoCIybj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE5NCBTYWx0ZWRfX1i7TzJ7VGDUY
 C3pxatLVUzQjCYk/nh0tlT/zctkG04hGFI+m28fZODt/hPr0qNaMYjIgKq3iE1LWu926DwmkgIp
 IWQv5raKZcOFSUXLy+CGLoCQMXFoOLQ=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab28123 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WqQTtqrRaY3NmFEFuk0A:9 a=QEXdDO2ut3YA:10
 a=CYbeYmYUL6zfRrghKdgA:9 a=QUlIWIoa6qd00sgm:21 a=lqcHg5cX4UMA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: DELYKTPwt_czLDLPAmGEEKKpfEoCIybj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE5NCBTYWx0ZWRfXxsrkxXW1t3o2
 QX99ftVywUS6vGxiP+xCL9R+0WLSgDhSfduPin/t6OYDyFiao7z4p6+HyySf/Ngt19fzusFCzWX
 0eVV/fG+Na/sQu41Gk3NIbP02inqseCSZIYH0NNUz59k6RNS2MfdkqFhGsUAf3QkXFK+6yUPEyJ
 A6fljjlj9MEfRBCWwBI4AjfO2RFqFYPx6QnI7Fy1avOVrOICXNTboE2hWxYT7OKaq+7XNfUhTkx
 xB4E6U+2XhcXshOsPFPSYi427IlYR83Z9BO0hRfKUAU7m/0xlKZXmrE+9A7d2i991HKU303/hmk
 vOsesWxRrfBhB9K/nmGFSi69c7rgcpqsFlIWK3FWMQ3GSZaw5a4U409FDlPSITA6/PiUHLjfPa1
 yAyE7Y5+cbtpn2F1SU5GNoIMZ9s5UWFw86rgCC4n9GPd6tVSBsd4Nsp+hgrx15Xad3BxnW+ikUL
 Ujof3GVglLlB9enUVow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220194
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 13:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246413

--000000000000f15fa5065c124217
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paddy,

On Tue, Sep 22, 2026 at 10:20=E2=80=AFAM Paddy Chiu <paddy.chiu@oss.qualcom=
m.com>
wrote:

> Without this fix, PKGV will be the same as PV when using devtool build.
> Since SRC_URI is set to local_srcuri in externalsrc.bbclass and
> consequently cause missing git commit hash in PKGV.
> This fix can prevent buildhistory package-version QA failures in devtool
> build.
>

Please use about 72 chars per line on the commit message
and also add you Signed-off-by (git commit -s--amend)

Jose


> ---
>  meta/classes-global/package.bbclass | 12 ++++++++++--
>  meta/classes/externalsrc.bbclass    |  4 ++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/package.bbclass
> b/meta/classes-global/package.bbclass
> index 67148fc1ac..c5f8b2136f 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -242,6 +242,14 @@ python () {
>          d.appendVarFlag('do_package', 'deptask', " do_packagedata")
>  }
>
> +def package_get_srcdata(d):
> +    srcuri =3D d.getVar("EXTERNALSRC_ORIG_SRC_URI")
> +    if not srcuri:
> +        return d
> +
> +    srcdata =3D d.createCopy()
> +    srcdata.setVar("SRC_URI", srcuri)
> +    return srcdata
>
>  PRSERV_ACTIVE =3D "${@bool(d.getVar("PRSERV_HOST"))}"
>  PRSERV_ACTIVE[vardepvalue] =3D "${PRSERV_ACTIVE}"
> @@ -299,7 +307,7 @@ python package_get_auto_pr() {
>                  pr =3D d.getVar('PR')
>                  # Strip PR to make AUTOINC can increase when SRCREV is
> changed
>                  base_ver =3D "AUTOINC-%s" % version[:-len(pr)]
> -                srcpv =3D bb.fetch2.get_srcrev(d)
> +                srcpv =3D bb.fetch2.get_srcrev(package_get_srcdata(d))
>                  value =3D conn.getPR(base_ver, pkgarch, srcpv)
>                  d.setVar("PRSERV_PV_AUTOINC", str(value))
>
> @@ -319,7 +327,7 @@ python package_get_auto_pr() {
>  python package_setup_pkgv() {
>      pkgv =3D d.getVar("PKGV")
>      # Expand SRCPV into PKGV if not present
> -    srcpv =3D bb.fetch.get_pkgv_string(d)
> +    srcpv =3D bb.fetch.get_pkgv_string(package_get_srcdata(d))
>      if srcpv and "+" in pkgv:
>          d.appendVar("PKGV", srcpv)
>          pkgv =3D d.getVar("PKGV")
> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> index 902ff2604f..a1bb92a418 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -78,6 +78,10 @@ python () {
>              d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
>
>          bb.fetch.get_hashvalue(d)
> +        # Keep the original URI available for packaging. SCM URLs are
> removed
> +        # below so externalsrc does not fetch or unpack the external
> source,
> +        # but package_setup_pkgv() still needs them to derive PKGV.
> +        d.setVar('EXTERNALSRC_ORIG_SRC_URI', d.getVar('SRC_URI'))
>          local_srcuri =3D []
>          fetch =3D bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d=
)
>          for url in fetch.urls:
> --
> 2.34.1
>
>

--000000000000f15fa5065c124217
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Paddy,<br></div><div><br></div><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Sep 22, 2026 at 10:20=E2=80=AFAM Paddy Chiu &lt;<a href=3D"mailto:paddy.ch=
iu@oss.qualcomm.com">paddy.chiu@oss.qualcomm.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Without this fix, PKGV will=
 be the same as PV when using devtool build.<br>
Since SRC_URI is set to local_srcuri in externalsrc.bbclass and consequentl=
y cause missing git commit hash in PKGV.<br>
This fix can prevent buildhistory package-version QA failures in devtool bu=
ild.<br></blockquote><div><br></div><div>Please use about 72 chars per line=
 on the commit message</div><div>and also add you=C2=A0Signed-off-by (git c=
ommit -s--amend)</div><div><br></div><div>Jose</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta/classes-global/package.bbclass | 12 ++++++++++--<br>
=C2=A0meta/classes/externalsrc.bbclass=C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
=C2=A02 files changed, 14 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass<br>
index 67148fc1ac..c5f8b2136f 100644<br>
--- a/meta/classes-global/package.bbclass<br>
+++ b/meta/classes-global/package.bbclass<br>
@@ -242,6 +242,14 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_package&#39;, &#3=
9;deptask&#39;, &quot; do_packagedata&quot;)<br>
=C2=A0}<br>
<br>
+def package_get_srcdata(d):<br>
+=C2=A0 =C2=A0 srcuri =3D d.getVar(&quot;EXTERNALSRC_ORIG_SRC_URI&quot;)<br=
>
+=C2=A0 =C2=A0 if not srcuri:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return d<br>
+<br>
+=C2=A0 =C2=A0 srcdata =3D d.createCopy()<br>
+=C2=A0 =C2=A0 srcdata.setVar(&quot;SRC_URI&quot;, srcuri)<br>
+=C2=A0 =C2=A0 return srcdata<br>
<br>
=C2=A0PRSERV_ACTIVE =3D &quot;${@bool(d.getVar(&quot;PRSERV_HOST&quot;))}&q=
uot;<br>
=C2=A0PRSERV_ACTIVE[vardepvalue] =3D &quot;${PRSERV_ACTIVE}&quot;<br>
@@ -299,7 +307,7 @@ python package_get_auto_pr() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr =3D d.getV=
ar(&#39;PR&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Strip PR to=
 make AUTOINC can increase when SRCREV is changed<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_ver =3D =
&quot;AUTOINC-%s&quot; % version[:-len(pr)]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcpv =3D bb.fetch=
2.get_srcrev(d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcpv =3D bb.fetch=
2.get_srcrev(package_get_srcdata(d))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D con=
n.getPR(base_ver, pkgarch, srcpv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quo=
t;PRSERV_PV_AUTOINC&quot;, str(value))<br>
<br>
@@ -319,7 +327,7 @@ python package_get_auto_pr() {<br>
=C2=A0python package_setup_pkgv() {<br>
=C2=A0 =C2=A0 =C2=A0pkgv =3D d.getVar(&quot;PKGV&quot;)<br>
=C2=A0 =C2=A0 =C2=A0# Expand SRCPV into PKGV if not present<br>
-=C2=A0 =C2=A0 srcpv =3D bb.fetch.get_pkgv_string(d)<br>
+=C2=A0 =C2=A0 srcpv =3D bb.fetch.get_pkgv_string(package_get_srcdata(d))<b=
r>
=C2=A0 =C2=A0 =C2=A0if srcpv and &quot;+&quot; in pkgv:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&quot;PKGV&quot;, srcpv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgv =3D d.getVar(&quot;PKGV&quot;)<br>
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class<br>
index 902ff2604f..a1bb92a418 100644<br>
--- a/meta/classes/externalsrc.bbclass<br>
+++ b/meta/classes/externalsrc.bbclass<br>
@@ -78,6 +78,10 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;B&#39;, &#39;=
${WORKDIR}/${BPN}-${PV}&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fetch.get_hashvalue(d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Keep the original URI available for packagin=
g. SCM URLs are removed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # below so externalsrc does not fetch or unpac=
k the external source,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # but package_setup_pkgv() still needs them to=
 derive PKGV.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;EXTERNALSRC_ORIG_SRC_URI&#39;, d=
.getVar(&#39;SRC_URI&#39;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_srcuri =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetch =3D bb.fetch2.Fetch((d.getVar(&#39;=
SRC_URI&#39;) or &#39;&#39;).split(), d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for url in fetch.urls:<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000f15fa5065c124217--

