Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF873CA5FE6
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 16:58:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2487.1791132835705099748
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 09:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LP6ivOlA;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GLKCBz3I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: paddy.chiu@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694Edv563229934
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Oct 2026 15:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WUqIC+R6rmvGU2M7Zdj/9Keo
	vSWJQUu0piUse5akuLA=; b=LP6ivOlAIj3x5M5y+W/FrcsaJeTd9PHXuCVXIsRR
	ZJTcWdbMkOyNyMLs7KGe60J5h94dYYHu4HPqWoDueqZJK3GFs8TEjoiMiZn66Y9s
	UopIBxDbfLt3fwnCfGivTfuKi7ESLf9iHhPL2XGWOmQvLPdjlpXxtachVdwwtDKk
	vbIb2J6F6whOdJhjiw7tnZ7jOwSqellFtsmtgwiIixYI4rFOS1r5POeA/zudbHew
	APEdDT3y9f4m25vKzfC3/P552DEEWwMyA0b+bnv1Wzrey8kOq/uUhEZcOyRL90Mr
	+DVFZ/C1511jDNtwa9i2I8afQoODlAwr/UbcRw2XxJMUBg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t06u9nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 15:43:15 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d7ffab1so1799751b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 08:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791128594; cv=none;
        d=google.com; s=arc-20260327;
        b=CuOFSCbUEgfw/ENYrw19TINU3lToqYkaMSrORXEKSy6yVLdDZPA2PhM5Z/YtQr3uSW
         49C2WwSZBRGlQuiBWdp20k9z+i8kc2+76K9xD6kbW86N8M3zfDsd4pUbOJ7geZv4b+j9
         glKhP/8m2bffvrqyaUzFfdATQOEeDMrgt6ldd3puWcPtPTalBslyCFHF4zVkOhodu1lY
         fy+Gj18sGXq/km6YnM0R6llZd3JcR60pPmhfv2YGd4asHZS0D7O4IXuyslJ5lNasD12H
         5+sNaxVKYS093Xglh0EmDsRHv5tMiMGxr8lq1F5Hr8A+fWQxdND/gUnduh+eUf/5GtBJ
         w/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WUqIC+R6rmvGU2M7Zdj/9KeovSWJQUu0piUse5akuLA=;
        fh=xlZxeILsq1x9gNxk0PsvcNBx8g6UGZcpTmkgfXhrWTA=;
        b=BESPUicyqK+UQy/Pj9HcJB7U8F6Pj9UNcK4waLAQDb69pEwuGOKEtVLT1APC0y0hTX
         DsrajJ/bkyrT9rwkwEym4zxAcSgnpR5tKSXsJHQXXSlarHabafvu8QYPJS/8U8oexC1n
         JD3MAr0NhTCE5A/i/SWdRLYT3PyapzMvdSO+3w/sTYFkRWTjq0sxumAp9DL9lRTLFFUC
         Uh+KkPakKoZyvznGGu2f1RUbRFbuzI+C/7iCNgqbzIxq8yaHSapqpPzWQXqy9G2jC85U
         Bs0gXBJU8t0ifiLy3oxgBy+LL9Fku9ffTJwtxcuzDRAaT10DIYFkn2uQGq/Q/+QP1T0+
         576A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791128594; x=1791733394; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUqIC+R6rmvGU2M7Zdj/9KeovSWJQUu0piUse5akuLA=;
        b=GLKCBz3IGY/DKjCKLUaQ6OlWrZmW/PzppZ+7BqSvtlf7SjZZUFbzEuDO/GjhOsQEx7
         eKAQ8BXmZ/A2dTOWdGfjSowiD6DI+rz57jIHRmH34LyZo8hnipdz+Zb5wbLwCb3AQcDF
         L+2eVabGogskHPSNP7cycLJl/zM9Vjc/FzdBVmfVwxD7W5cw31ZF/UjTkr6TZvGkGmgg
         T5pk/e2nGDrC732DEa2x3NaXVM0zD1oPXGJdAhL2Gqx0gSIgTvuy/TcQa3TzR+pmieIS
         5dwuBwqfVgLGLie99f9UC1J5vfgwpnrEL2RTeKytwq1xB+NZsYIdj1y8j57biUZmBdRW
         diqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128594; x=1791733394;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WUqIC+R6rmvGU2M7Zdj/9KeovSWJQUu0piUse5akuLA=;
        b=KWyS/t+pIuxcGul5xgt7HrLRxYMun6krWTXyNp1bl4dgopT+mH9TbkFuUSv3rgymkP
         82FNttjHR904KtMWQmM5imNU2X6fst9iZdD67XVBVy1v2eFKfEpJBwBRVz7+nz7l7NEG
         oPqgb9DHiIvAlwvlZHEybzehjVTlqbLdbmHGT6aCnT8raaQ2RlulGZ+LjYXY77skl7vk
         GtymashPUI5E5B5Uz0AmCOoXBegsndh0+XT9vaR3b4jlvU5eDMnz+SOPe55E8gAcBO0I
         vB6OF6AvxiX3yFUokdsY2LAMo2CMjqlGDfC2PBqW59HnNv4fndhvZ91x3MsNNvhW4KJj
         Y25Q==
X-Gm-Message-State: AFuF++lx7JDlevBQWBrMyL7JMpl3+QaQaJ6TNIPpoIpVMXOXxDYfnj0H
	+q/psv5b0tsOhzGNWfSNBhB8szCnPKyAWQsmP8hGCF5AOOodGJ8bEuwpjEJQteS/eOaWTty3hnF
	Cep04/rAn6piZQgSush0nj2kUIxSmEeDyH5WexxemdlrVjOsRiBlCkWcA+NJpKR8PLGxKm2GUYs
	Ys78odEWGIljMjmP/4zT23wwsHuMFybfEkqhXZGNNO6xqyM1EaVPN+G/RhYw==
X-Gm-Gg: AYBFou11hShhnAEYVPffqUZOwIYP/u00nImRKp5SfGP+xQppfjyWQEKn3JnHUk+9aEQ
	yHg7rwQF3yP4TrIHTWjMTW8OtzUi4D6cgiyJnnAgNmSpALD8sXuLdpzO3/fd1nXr6TfV97opOT0
	ZAIRS6T/SCAnJJDirJTmneZonyt7x/y2JDdJMxwOnra0cJHuOcFcu/HUzhiAU=
X-Received: by 2002:a05:6808:319b:b0:4c3:cab9:2ab7 with SMTP id 5614622812f47-4f30a659006mr10242689b6e.31.1791128594513;
        Sun, 04 Oct 2026 08:43:14 -0700 (PDT)
X-Received: by 2002:a05:6808:319b:b0:4c3:cab9:2ab7 with SMTP id
 5614622812f47-4f30a659006mr10242673b6e.31.1791128594037; Sun, 04 Oct 2026
 08:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260922092015.2428562-1-paddy.chiu@oss.qualcomm.com> <8e963943c0883e50063000148a5303edb57582f1.camel@linuxfoundation.org>
In-Reply-To: <8e963943c0883e50063000148a5303edb57582f1.camel@linuxfoundation.org>
From: Paddy Chiu <paddy.chiu@oss.qualcomm.com>
Date: Sun, 4 Oct 2026 23:43:03 +0800
X-Gm-Features: AclHuK_EOD4B5fNjKZXfXLogD6kWOxIEQrtEl-FP3-xCx17psNtb6RiLRM6bndU
Message-ID: <CAKFR0p2fPFF5NgizmHmWdJm_QVELMBhokXO5gXNz2WR=Sw39Ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc: fix PKGV for devtool build
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, jose.quaresma@oss.qualcomm.com
X-Authority-Analysis: v=2.4 cv=cf5HPXDM c=1 sm=1 tr=0 ts=6ac27413 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8 a=Q4-j1AaZAAAA:8 a=NRo516JGOdhUfnFt4_EA:9
 a=QEXdDO2ut3YA:10 a=ZXKWx-yiSfMhw3FGchMA:9 a=4iCOxXAfEeMlPlZR:21
 a=lqcHg5cX4UMA:10 a=efpaJB4zofY2dbm2aIRb:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: nB4grle5Ua0FZbW-yMB4iVw87KovacZJ
X-Proofpoint-GUID: nB4grle5Ua0FZbW-yMB4iVw87KovacZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA2MiBTYWx0ZWRfX2MEj9lVZ6Yhj
 PvvVg/GfyYrXPS29pT8NoV9NDni1RoJz+5dbKXSmnPeNKY/qFXPligtVJ7o46IN0WC2k53JEZth
 l0Un7u7ZN9mGcmUAu/AGZBg4U/OQtwG3UdlloOHDPNjF0eeSPpCeaFi5OIFsiiuAuaIl+jD1s0y
 phnRqWEBFq3ud23mlU5xZWaPLAu66RbhrNCXYMcojs19/hv6RrV1zGRRe+wTGr+XEgfI+S3kndP
 yAAyjSOWfqttXkLymSPEVVbZZZxvK15fQ870P7bDuP+5BAdAwDL66ScsDq10DcdU9iGaTkgZ6nV
 JvrOM0Aq4B8AZ6K0uKDNdIpghyBqAZyVHydbAp2A6DBLgf45noO6hht9hmpzDP2i6KtWybGogkr
 GnImdlXKSs8NQ3e/bHtK1eaahBpTI0UY2S2PnodlJtF8yNb39CruG9ffkXLL6EDxGQ6gBlg5I/v
 JwftNxFF6Zd7rygGwRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA2MiBTYWx0ZWRfX+Y+8yZX2Kgpr
 plNyKNgBJcecWs+qiVRzRfy5DkyYfV5usFxN6YqQOGgWig0gvXfrav/1H9eUrybPKE+xhzKIwUK
 Din2GuJ41Nx4iT07eTtleexMfzAtktk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040062
Content-Type: multipart/alternative; boundary="0000000000009852aa065d059f3f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 16:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247202

--0000000000009852aa065d059f3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
Sorry for the late reply.

Patch v2 (Proposed fix) addresses the concern with the previous approach:
it no longer copies the datastore or rewrites SRC_URI during package
version calculation.

Instead, externalsrc saves the formatted source-version suffix in
EXTERNALSRC_PKGV_SUFFIX before filtering SCM URLs. The package and
PR-service paths reuse it, while the normal fetcher path remains unchanged
for non-externalsrc builds.

Validation used git-submodule-test for both requested transitions:

  BitBake to devtool: both builds produce the same hash-bearing PKGV and no
  version-going-backwards QA error.

  devtool to BitBake: both builds produce the same PKGV with no regression
  in the reverse transition.

Changes since v1:

  - replace the copied datastore/SRC_URI override with a saved suffix;
  - use the suffix for both PKGV and AUTOINC PR-service handling.

[PATCH v2 1/1] externalsrc: preserve source revision in PKGV

externalsrc removes SCM URLs from SRC_URI before packaging, so the
packaging fetcher cannot derive the source revision for devtool builds.

Capture the formatted source-version suffix before filtering and
reuse it for package version and AUTOINC PR-service handling. This
keeps the normal fetcher path unchanged and avoids restoring a copied
datastore.

Signed-off-by: Paddy Chiu <paddy.chiu@oss.qualcomm.com>
---
 meta/classes-global/package.bbclass | 8 ++++++--
 meta/classes/externalsrc.bbclass    | 3 +++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass
b/meta/classes-global/package.bbclass
index 67148fc1ac..f57397e83d 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -299,7 +299,9 @@ python package_get_auto_pr() {
                 pr =3D d.getVar('PR')
                 # Strip PR to make AUTOINC can increase when SRCREV is
changed
                 base_ver =3D "AUTOINC-%s" % version[:-len(pr)]
-                srcpv =3D bb.fetch2.get_srcrev(d)
+                srcpv =3D d.getVar("EXTERNALSRC_PKGV_SUFFIX")
+                if srcpv is None:
+                    srcpv =3D bb.fetch2.get_srcrev(d)
                 value =3D conn.getPR(base_ver, pkgarch, srcpv)
                 d.setVar("PRSERV_PV_AUTOINC", str(value))

@@ -319,7 +321,9 @@ python package_get_auto_pr() {
 python package_setup_pkgv() {
     pkgv =3D d.getVar("PKGV")
     # Expand SRCPV into PKGV if not present
-    srcpv =3D bb.fetch.get_pkgv_string(d)
+    srcpv =3D d.getVar("EXTERNALSRC_PKGV_SUFFIX")
+    if srcpv is None:
+        srcpv =3D bb.fetch.get_pkgv_string(d)
     if srcpv and "+" in pkgv:
         d.appendVar("PKGV", srcpv)
         pkgv =3D d.getVar("PKGV")
diff --git a/meta/classes/externalsrc.bbclass
b/meta/classes/externalsrc.bbclass
index 902ff2604f..47c1b06788 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -78,6 +78,9 @@ python () {
             d.setVar('B', '${WORKDIR}/${BPN}-${PV}')

         bb.fetch.get_hashvalue(d)
+        # Keep the source version available for packaging. SCM URLs are
removed
+        # below so externalsrc does not fetch or unpack the external
source.
+        d.setVar('EXTERNALSRC_PKGV_SUFFIX', bb.fetch.get_pkgv_string(d))
         local_srcuri =3D []
         fetch =3D bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
         for url in fetch.urls:
--
2.34.1

Please let me know if further changes or discussion are needed.

Best Regards,
Paddy

On Wed, Sep 23, 2026 at 10:08=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2026-09-22 at 02:20 -0700, Paddy Chiu via lists.openembedded.org
> wrote:
> > Without this fix, PKGV will be the same as PV when using devtool build.
> > Since SRC_URI is set to local_srcuri in externalsrc.bbclass and
> consequently cause missing git commit hash in PKGV.
> > This fix can prevent buildhistory package-version QA failures in devtoo=
l
> build.
> > ---
> >  meta/classes-global/package.bbclass | 12 ++++++++++--
> >  meta/classes/externalsrc.bbclass    |  4 ++++
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes-global/package.bbclass
> b/meta/classes-global/package.bbclass
> > index 67148fc1ac..c5f8b2136f 100644
> > --- a/meta/classes-global/package.bbclass
> > +++ b/meta/classes-global/package.bbclass
> > @@ -242,6 +242,14 @@ python () {
> >          d.appendVarFlag('do_package', 'deptask', " do_packagedata")
> >  }
> >
> > +def package_get_srcdata(d):
> > +    srcuri =3D d.getVar("EXTERNALSRC_ORIG_SRC_URI")
> > +    if not srcuri:
> > +        return d
> > +
> > +    srcdata =3D d.createCopy()
> > +    srcdata.setVar("SRC_URI", srcuri)
> > +    return srcdata
> >
> >  PRSERV_ACTIVE =3D "${@bool(d.getVar("PRSERV_HOST"))}"
> >  PRSERV_ACTIVE[vardepvalue] =3D "${PRSERV_ACTIVE}"
> > @@ -299,7 +307,7 @@ python package_get_auto_pr() {
> >                  pr =3D d.getVar('PR')
> >                  # Strip PR to make AUTOINC can increase when SRCREV is
> changed
> >                  base_ver =3D "AUTOINC-%s" % version[:-len(pr)]
> > -                srcpv =3D bb.fetch2.get_srcrev(d)
> > +                srcpv =3D bb.fetch2.get_srcrev(package_get_srcdata(d))
> >                  value =3D conn.getPR(base_ver, pkgarch, srcpv)
> >                  d.setVar("PRSERV_PV_AUTOINC", str(value))
> >
> > @@ -319,7 +327,7 @@ python package_get_auto_pr() {
> >  python package_setup_pkgv() {
> >      pkgv =3D d.getVar("PKGV")
> >      # Expand SRCPV into PKGV if not present
> > -    srcpv =3D bb.fetch.get_pkgv_string(d)
> > +    srcpv =3D bb.fetch.get_pkgv_string(package_get_srcdata(d))
> >      if srcpv and "+" in pkgv:
> >          d.appendVar("PKGV", srcpv)
> >          pkgv =3D d.getVar("PKGV")
> > diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> > index 902ff2604f..a1bb92a418 100644
> > --- a/meta/classes/externalsrc.bbclass
> > +++ b/meta/classes/externalsrc.bbclass
> > @@ -78,6 +78,10 @@ python () {
> >              d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
> >
> >          bb.fetch.get_hashvalue(d)
> > +        # Keep the original URI available for packaging. SCM URLs are
> removed
> > +        # below so externalsrc does not fetch or unpack the external
> source,
> > +        # but package_setup_pkgv() still needs them to derive PKGV.
> > +        d.setVar('EXTERNALSRC_ORIG_SRC_URI', d.getVar('SRC_URI'))
> >          local_srcuri =3D []
> >          fetch =3D bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(),=
 d)
> >          for url in fetch.urls:
>
>
> We really need to find a different way to fix this. I don't doubt there
> is an issue here but change the datastore and it's variables around mid
> function like that is really a hacky workaround, not a proper fix.
>
> If we did this each time we found a bug, the code would become
> unmaintainable.
>
> Cheers,
>
> Richard
>

--0000000000009852aa065d059f3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<br>Sorry for the late reply.<br><br>Patch v2 (=
Proposed fix) addresses the concern with the previous approach:<br>it no lo=
nger copies the datastore or rewrites SRC_URI during package<br>version cal=
culation.<br><br>Instead, externalsrc saves the formatted source-version su=
ffix in<br>EXTERNALSRC_PKGV_SUFFIX before filtering SCM URLs. The package a=
nd<br>PR-service paths reuse it, while the normal fetcher path remains unch=
anged<br>for non-externalsrc builds.<br><br>Validation used git-submodule-t=
est for both requested transitions:<br><br>=C2=A0 BitBake to devtool: both =
builds produce the same hash-bearing PKGV and no<br>=C2=A0 version-going-ba=
ckwards QA error.<br><br>=C2=A0 devtool to BitBake: both builds produce the=
 same PKGV with no regression<br>=C2=A0 in the reverse transition.<br><br>C=
hanges since v1:<br><br>=C2=A0 - replace the copied datastore/SRC_URI overr=
ide with a saved suffix;<br>=C2=A0 - use the suffix for both PKGV and AUTOI=
NC PR-service handling.<br><br>[PATCH v2 1/1] externalsrc: preserve source =
revision in PKGV<br><br>externalsrc removes SCM URLs from SRC_URI before pa=
ckaging, so the<br>packaging fetcher cannot derive the source revision for =
devtool builds.<br><br>Capture the formatted source-version suffix before f=
iltering and<br>reuse it for package version and AUTOINC PR-service handlin=
g. This<br>keeps the normal fetcher path unchanged and avoids restoring a c=
opied<br>datastore.<br><br>Signed-off-by: Paddy Chiu &lt;<a href=3D"mailto:=
paddy.chiu@oss.qualcomm.com">paddy.chiu@oss.qualcomm.com</a>&gt;<br>---<br>=
=C2=A0meta/classes-global/package.bbclass | 8 ++++++--<br>=C2=A0meta/classe=
s/externalsrc.bbclass =C2=A0 =C2=A0| 3 +++<br>=C2=A02 files changed, 9 inse=
rtions(+), 2 deletions(-)<br><br>diff --git a/meta/classes-global/package.b=
bclass b/meta/classes-global/package.bbclass<br>index 67148fc1ac..f57397e83=
d 100644<br>--- a/meta/classes-global/package.bbclass<br>+++ b/meta/classes=
-global/package.bbclass<br>@@ -299,7 +299,9 @@ python package_get_auto_pr()=
 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr =3D =
d.getVar(&#39;PR&#39;)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0# Strip PR to make AUTOINC can increase when SRCREV is changed=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_ver =
=3D &quot;AUTOINC-%s&quot; % version[:-len(pr)]<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcpv =3D bb.fetch2.get_srcrev(d)<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcpv =3D d.getVar(&=
quot;EXTERNALSRC_PKGV_SUFFIX&quot;)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0if srcpv is None:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcpv =3D bb.fetch2.get_srcrev(d)<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D con=
n.getPR(base_ver, pkgarch, srcpv)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;PRSERV_PV_AUTOINC&quot;, str(value))=
<br>=C2=A0<br>@@ -319,7 +321,9 @@ python package_get_auto_pr() {<br>=C2=A0p=
ython package_setup_pkgv() {<br>=C2=A0 =C2=A0 =C2=A0pkgv =3D d.getVar(&quot=
;PKGV&quot;)<br>=C2=A0 =C2=A0 =C2=A0# Expand SRCPV into PKGV if not present=
<br>- =C2=A0 =C2=A0srcpv =3D bb.fetch.get_pkgv_string(d)<br>+ =C2=A0 =C2=A0=
srcpv =3D d.getVar(&quot;EXTERNALSRC_PKGV_SUFFIX&quot;)<br>+ =C2=A0 =C2=A0i=
f srcpv is None:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0srcpv =3D bb.fetch.get_pkg=
v_string(d)<br>=C2=A0 =C2=A0 =C2=A0if srcpv and &quot;+&quot; in pkgv:<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&quot;PKGV&quot;, srcpv)<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgv =3D d.getVar(&quot;PKGV&quot;)<br>di=
ff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbcl=
ass<br>index 902ff2604f..47c1b06788 100644<br>--- a/meta/classes/externalsr=
c.bbclass<br>+++ b/meta/classes/externalsrc.bbclass<br>@@ -78,6 +78,9 @@ py=
thon () {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;=
B&#39;, &#39;${WORKDIR}/${BPN}-${PV}&#39;)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bb.fetch.get_hashvalue(d)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
# Keep the source version available for packaging. SCM URLs are removed<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0# below so externalsrc does not fetch or unpac=
k the external source.<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;EXTERN=
ALSRC_PKGV_SUFFIX&#39;, bb.fetch.get_pkgv_string(d))<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0local_srcuri =3D []<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
etch =3D bb.fetch2.Fetch((d.getVar(&#39;SRC_URI&#39;) or &#39;&#39;).split(=
), d)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for url in fetch.urls:<br>--<br>=
2.34.1<br><br>Please let me know if further changes or discussion are neede=
d.<br><br>Best Regards,<br>Paddy</div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 23, 2026 =
at 10:08=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2026-09-22 at 0=
2:20 -0700, Paddy Chiu via <a href=3D"http://lists.openembedded.org" rel=3D=
"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
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

--0000000000009852aa065d059f3f--

