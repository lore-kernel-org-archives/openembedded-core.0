Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37A9C79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 20:13:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.944.1788898377929356052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 13:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=knkcdFRT;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=G7poV8AX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fde5B2194522
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Sep 2026 20:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	900zoKAOOw5YPmPchn1C4eQWGfvwU0s2cxH706JTsNY=; b=knkcdFRTVnHa23WF
	jtyWkDljm7SRAPnW5/d/4V/OR/UgK5YwxHmLDQj8hsRPQCtXLIC5XjkRDcu0aKtx
	iYrj8cTYd5PfnDfwiFVspBKB6rzK6SQBfcbrdwmlaEm4AaVsPX8GbIsFS6jMnBVE
	7BRXVyflekfbkjKYvetMtMNnnQ1o+Eb7sKjfp0EMLrtFHFFkiQTRCJYcZbsw1zdx
	2nR8eMJAyrIDAvMFL/g28ggb4TpJ+RHgNZTXNMXKVE9WFn2G/vxiPO8ssXnHVCUV
	yXzvg2wx0f6Q5dVjxjd2xt1GiN3n+0lDuqwip5q4CpqmzFKXvH+ghH4ip5Xf4QCe
	nGuecg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjkshsvnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 20:12:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-85321e37104so5259293b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 13:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788898376; cv=none;
        d=google.com; s=arc-20260327;
        b=Dod7sbOCVoRNNTvme/OSGWPFJbvIi+yQwhZG5+nCIni5B1xPTPSSD8pNsIFO6GKDSo
         c0yqsG0+rkI77MUpROa3I4QJYqq0aWxeYQTvrSsd8wLQ426LoFoFPpr4oWPvXKtnHO+E
         kv6+A3cic9A/uWZjlKBMMdtiV9AqaJb+lGNyoNVrc1jPGHQnMis9QAbLTsj80J5ieGCo
         JPO6MaspZMeS1gv4ntrAxDs1HPUW7UXWvke0mWgqKESV3BwZtasg1FLKzcJDe3adf5hU
         HcvWjXCXuINNBb61FZNj/YY1w54egRvivYZ6gTC04uI56BJUup51OacyMjLj6KHrNh1N
         H5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=900zoKAOOw5YPmPchn1C4eQWGfvwU0s2cxH706JTsNY=;
        fh=WC8oM0jbj1pGGyUaLpIoYYWujctzZur9XvWcqW8E9gE=;
        b=da4yjT4VyJkYNzh/rUZ7AFRVp7FjRcKjgckXSh4utEveKIbYAfnx3qP9hk2KDMJUr1
         jNRMQc/y0aQByqYNKNYto9dNdFzFSsQb8Qah27ZpL5kdmNW3aInnziZagLUoUEmhb0zo
         YPU3ZMNNGFuZ1lbhQbzxTeL9QAFh3WtA9HaelpsOtqYkn1J2M8cghJR2BVw64scm6HX5
         0JK+s6qqh79y4Z916uwtq73lX61VHT/FzWUL3hBwfdKkhDADAUkqeT9DQBxWI8Gw/2As
         LHOvWTbvQ05bCyDOFqbdeXJS8Ft/dmTXbPt4Zw060NGsC7GH4Oexu018w/lNv5m1DIEk
         roEQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788898376; x=1789503176; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=900zoKAOOw5YPmPchn1C4eQWGfvwU0s2cxH706JTsNY=;
        b=G7poV8AXRxIHYFu94wijJiUAHm3zdKPxdrkucEf2sIOU2239EnUsRU8NP/gRUj5MZC
         05u/wGeCaJZWUGuyRrRzxyScaX0wuuYVI6vjSXu/B7eFJt13+wSjuFnSd3CRl9c+UEoa
         p4ch/b84rrgnNFjM+XKE3OAFUAhEKI8S6tH8XUrT8Vr/sRXpsjulwaPLpUKN9n2i7HxQ
         jLKtsNOXpTmyIRgohE6shfyYlULMEJuuYDYSVle9gT6KPDLoybHAnd/RR+DmV7sTqQQU
         9F8TdRHxDKh9YekQNuY8DQwqsK2xMY4BpCdrUfjW5QBhzvNGms0ZPVE9td9TzGHx7qa1
         gDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788898376; x=1789503176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=900zoKAOOw5YPmPchn1C4eQWGfvwU0s2cxH706JTsNY=;
        b=lN4OIGPNs9n3Jmn2PJ3LKENHJcs6tJNv18KV+juS6E1pVSNDQi70VuiQRD/KukfWF3
         W0F/AWEY6Y5p4gZGVVafzBWQfS+qgdkdNvdJAzXzaMZmDGV1ZAkcCLURDDAzr7AMT19J
         SBu6lecrOx4ovtjRDzE7ymNpKwDJStacvdA5EaY3x55a5AuV2H695iPCA1iAKrDnEX3G
         d+UzX9m3aIVS/KdXR19D6j6w5UAWeT57J567t51jgGiB/H0eNWK5I2REXbAwMGkcIj4E
         r+7AQY4FMETTdSAeDOCvq8v+EMgdiE3r/xToRZo5x35OQe6FEQ482j6e2ZZs69UKuOSJ
         VuFg==
X-Gm-Message-State: AFuF++masVGhsp1PTxw20IKXCPx2M+d762n5YAMdc4J8gu7m20gIRELM
	HCbEpFSpH6chOAfdmnYBDnaTZg7//QFO6+PPCw+kHxyUUIjmb/r7FtAdP5TojlWEXTQE3dZqlX7
	RmUzZ1eDkCK46C1OEfCT+t8YBObZnHCNI9JfTH+v3aRu6oXcM08VB2A2mUa/zcTKt2NqYMOSwct
	rz4S1D1MRdMO1kFmQgRwZFFduxesXU9bxpJ5tFE1h3HN6SgJNCASkPX9prAw==
X-Gm-Gg: AYBFou2+jiuYGn9NrYLkYFjHs7le0FkCbC6H6LX+rwkcmgyYBhKqriSIogsilGKyfcc
	8nFvDktjyW81ICYNHFrUOl0So/G1J90RIqcwyS7AJOxlL0xL7Z20rZc82CPEG61k15/FLCQmRbT
	Z0sDF+A7ITZkowuHA97haBRKBfMZenABsFspgtkz9bpzIjm+58OYIRN7BYwjE=
X-Received: by 2002:a05:6a00:c206:b0:851:d12e:389b with SMTP id d2e1a72fcca58-8628622c78fmr27495699b3a.14.1788898376211;
        Tue, 08 Sep 2026 13:12:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:c206:b0:851:d12e:389b with SMTP id
 d2e1a72fcca58-8628622c78fmr27495662b3a.14.1788898375774; Tue, 08 Sep 2026
 13:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260905224403.152831-1-ricardo.salveti@oss.qualcomm.com> <ca796be26f7848304079f52c3a17f42aef210114.camel@gmail.com>
In-Reply-To: <ca796be26f7848304079f52c3a17f42aef210114.camel@gmail.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 17:12:18 -0300
X-Gm-Features: AcwNN1VB1lh_llIsA9B8Ow4Jd5APbcFPI1wrA9DysmwKtcP2WseBNhFtAGb6hFI
Message-ID: <CAA_5youCKSC_=QGGwnMAvcqXEAf1aWn=27ekMzYL_S8RdeC9Ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uboot-sign: keep the SPL BSS padding when
 reassembling the SPL binary
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDIyMCBTYWx0ZWRfX+yUlvM1Tg5pI
 0XSVlkr3C8NiUsFtneVfYUXeHQhQvwSjD9RtwGozG0urq6fT7YX38pwtNRaSg9LfADGlgL4OCnO
 ioM5ow7g79dtGxlJpUm0SLF3z4MD554=
X-Proofpoint-ORIG-GUID: fQg6ePpVgaF_NlUolnDwrgorax3mPi_S
X-Authority-Analysis: v=2.4 cv=TammcxQh c=1 sm=1 tr=0 ts=6aa06c49 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=apn0q0EWAAAA:20 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=5s7XvVWXJyJoDMfDS3sA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: fQg6ePpVgaF_NlUolnDwrgorax3mPi_S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDIyMCBTYWx0ZWRfX+p4zyj3Migjr
 3JBCGKnFKsYnEOMhIe6SH6Zk0uWa4Xh4jDo16eTA63KAJfFwpImgYTYYPQ+gap5AKxm1+IVF42M
 JGEvl+3/VS3CZ5dktga7mozLgLJ+rUEf8wXCfhb7sUC0j+1DuQopSC/uvF3iX45FE9kSAT/UIF9
 bC+j/7Ngfmz1tEE2p49LcYJCRUG1W/1AliG9oAesn38UCKI06d6coq/AwcSJT3R6cRAf+gA6wfx
 qJWCXHeSSQPAtTr3sG/ic2DjWIBvyoa92924uy2L4jKnl+iyHWA1GcbLBN8cQqsGkgYqu920jbw
 DrqD5giAAbfntsVu4wKGdJ/nXslvs5WE0966vsj8j6HAM4Z6FZHB63fFpwjzroMdh8wHU4SDRR8
 yq1s8bM3vslJRzKS+mvRi0Nlkx3wVp1+y+uf2pQ29PaHusohHJOcRsmRd3sL3n8s7+cgNUF8wKM
 PCnHTkiJKeTjwWjk2vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080220
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 20:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245389

Hi,

On Mon, Sep 7, 2026 at 1:28=E2=80=AFPM <adrian.freihofer@gmail.com> wrote:
>
> On Sat, 2026-09-05 at 22:44 +0000, Ricardo Salveti via
> lists.openembedded.org wrote:
> > concat_spl_dtb() rebuilds the SPL as a plain concatenation of the
> > nodtb
> > image and the signed device tree. U-Boot only assembles it that way
> > with
> > SPL_SEPARATE_BSS; otherwise BSS is part of the image and it pads
> > between
> > the two, so that clearing BSS cannot overwrite the appended device
> > tree.
> > Platforms loading the SPL as one contiguous image, such as Qualcomm
> > SoCs,
> > need that layout: without the padding the device tree ends up inside
> > BSS
> > and spl_early_init() finds none, before the console is up.
> >
> > Reassemble at the offset U-Boot used, taken from its own image as
> > SPL_WITH_DTB_BINARY, and fall back to the current behaviour when it
> > did
> > not pad.
> >
> > AI-Generated: Uses Claude Code
> > Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> > ---
> >  meta/classes-recipe/uboot-sign.bbclass | 20 +++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-
> > recipe/uboot-sign.bbclass
> > index 236d19925e..4743b86dd4 100644
> > --- a/meta/classes-recipe/uboot-sign.bbclass
> > +++ b/meta/classes-recipe/uboot-sign.bbclass
> > @@ -57,6 +57,8 @@ SPL_DTB_SYMLINK ?=3D "u-boot-spl-${MACHINE}.dtb"
> >  SPL_NODTB_IMAGE ?=3D "u-boot-spl-nodtb-${MACHINE}-${PV}-${PR}.bin"
> >  SPL_NODTB_BINARY ?=3D "u-boot-spl-nodtb.bin"
> >  SPL_NODTB_SYMLINK ?=3D "u-boot-spl-nodtb-${MACHINE}.bin"
> > +# The SPL image as assembled by U-Boot, before signing.
> > +SPL_WITH_DTB_BINARY ?=3D "u-boot-spl-dtb.bin"
>
> This looks like a MACHINE specific variable. Should it default to empty
> string and be assigned only in machine conf files which need it? And
> then...

The file itself exists for every configuration with an SPL device
tree, so while it depends on the configuration used by the machine, it
is generic and widely used.

From u-boot sources (depends on OF_REAL and OF_SEPARATE / OF_HOSTFILE,
and this class already depends on OF_SEPARATE for signing support):
https://github.com/u-boot/u-boot/blob/main/scripts/Makefile.xpl#L323

> >  # U-Boot fitImage description
> >  UBOOT_FIT_DESC ?=3D "U-Boot fitImage for
> > ${DISTRO_NAME}/${PV}/${MACHINE}"
> > @@ -249,7 +251,23 @@ deploy_dtb() {
> >
> >  concat_spl_dtb() {
> >       if [ -e "${SPL_DIR}/${SPL_NODTB_BINARY}" ] && [ -e
> > "${SPL_DIR}/${SPL_DTB_BINARY}" ] ; then
> > -             cat ${SPL_DIR}/${SPL_NODTB_BINARY}
> > ${SPL_DIR}/${SPL_DTB_SIGNED} > "${SPL_BINARY}"
> > +             # U-Boot pads behind BSS before appending the device
> > tree
> > +             # ($(SPL_BIN)-pad.bin in scripts/Makefile.xpl); keep
> > that offset.
> > +             nodtb_size=3D$(stat -Lc %s
> > ${SPL_DIR}/${SPL_NODTB_BINARY})
> > +             dtb_offset=3D${nodtb_size}
> > +
> > +             if [ -e "${SPL_DIR}/${SPL_WITH_DTB_BINARY}" ]; then
>
> ... this -e could fail fatal if the variable is non-empty string and
> the file does not exist rather than fail silently?
>
> Further, would it be less risky if all the special handling of
> SPL_WITH_DTB_BINARY would be in the if block?

A board that does not define OF_SEPARATE would cause issues even
before this function is executed, but we can separate into another if
block if preferred, something like:

+               if [ -n "${SPL_WITH_DTB_BINARY}" ] ; then
+                       if [ ! -e "${SPL_DIR}/${SPL_WITH_DTB_BINARY}" ] ; t=
hen
+                               bbfatal "${SPL_WITH_DTB_BINARY} not
found in ${SPL_DIR}. Set SPL_WITH_DTB_BINARY to the SPL image U-Boot
assembled, or to an empty string if it builds none."
+                       fi
+
+                       # U-Boot pads behind BSS before appending the
device tree
+                       # ($(SPL_BIN)-pad.bin in
scripts/Makefile.xpl); keep that offset.
+                       image_size=3D$(stat -Lc %s
${SPL_DIR}/${SPL_WITH_DTB_BINARY})
+                       dtb_size=3D$(stat -Lc %s ${SPL_DIR}/${SPL_DTB_BINAR=
Y})
+                       offset=3D$(expr ${image_size} - ${dtb_size})
+
+                       if [ ${offset} -gt ${nodtb_size} ] ; then
+                               dtb_offset=3D${offset}
+                       fi
+               fi
+
+               if [ ${dtb_offset} -gt ${nodtb_size} ] ; then
+                       cp ${SPL_DIR}/${SPL_NODTB_BINARY} "${SPL_BINARY}"
+                       truncate -s ${dtb_offset} "${SPL_BINARY}"
+                       cat ${SPL_DIR}/${SPL_DTB_SIGNED} >> "${SPL_BINARY}"
+               else
+                       cat ${SPL_DIR}/${SPL_NODTB_BINARY}
${SPL_DIR}/${SPL_DTB_SIGNED} > "${SPL_BINARY}"
+               fi

Let me know what you think and I can send a v2.

Thanks,

Ricardo

