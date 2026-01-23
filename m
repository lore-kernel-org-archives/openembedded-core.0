Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3FBD74ED0
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 13:36:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67937.1769175362713840489
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 05:36:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fpnIOmOF;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=h23c4yI3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAa5gN3126249
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 13:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tj12TTWgfFXpzyMDlhbP6Ez3
	KrnNtNX7BpLqq3kFmtg=; b=fpnIOmOFCVi3paKBx3b2kaJr0SpsE7lqH+KvLkhT
	/Qm8I99yKUqQ1rrPnUQZ9LtVe2PbwQF0nJQijHQAmki7z4H6x55ziwV8MRG4Pjyc
	Shig07KS41ZeuoqfW1XQhJ8DQGGk86/UeNkt7bcgaCWAiuxlUTCrI4cfNaAyizQe
	G3N2Q5u+ZjMTNxvD5u1tQglSjKDhEjLEW1nHQlowErSrBG+GDgp5RKRdz1MG5+HG
	CNxTFbPd9kHVfofzl6xsTeZvCXIQ0NLg5oG7voxgHiLutCLWehoYVR+DVjhaRgTi
	r51C6vQyy3VCdynEyMg7Mp3J+G4aaDFbFuZfSXJ2d+DSyA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buthdub82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 13:36:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34ab459c051so4163771a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:36:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769175361; cv=none;
        d=google.com; s=arc-20240605;
        b=Tto8s3F3u+nvmoXL08pGn653uO/tDhHcZ+9l7l0oT8QYc+n+kqsMM1SkadYV+kA7P+
         Sbp+iMQnSdyUw2XaLjnpfuj7Aqw6VIsqflAttCXBME807fQiMggnEDJMw0W2xNJszV6W
         fT70UNJGrsTvMO8TBLM40iBi5Ofbja0R0w52QkBdTQw/b9MxseWllcTOWTu7fOR7WaZs
         4QzIWyTUb+cn+BhdvWk5MuRR/IQwVvXuJJ66wpbgWi3sCgCnFH15HN7ETu3FC40q2R6s
         a+dVlfzocSyo38o3nOnliS6h0iPW0RsndbH7HjZB/k/CHPiapMZGp8J4Es64h9d4UiYi
         xGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Tj12TTWgfFXpzyMDlhbP6Ez3KrnNtNX7BpLqq3kFmtg=;
        fh=kyrcx/wGdP1K8AcZ1t5dlAg43e9Kck6gc8gLfroTQbI=;
        b=BHtR4++mJ0PL4SaiW7EeE+UISZAOquVCrtrJMG9cvKL1iyN7773FcBUbLWW+4O+xks
         Qs7gf2a7pO+ZXg4PhNBwVZddCXJFhSu+57N5E2nLLcaWMzQw48Iu8c/4XFNkdQAbWHSV
         /a7zvlFsvUWwbwKdpx5w5Rx6uf6hoBft+4+AKTrqlJNc8YHQkvlPTzMaQ0o2pzenMcPi
         mInM3d9VJpEacvNZJdKiJ1aFE+thbbeD9T5uGvY007BqGwDWhmCDVqps8YU38DSSaJYm
         gx0jVnet50efNEjJ+K6Z8hW2s1AdOj18bI0XT2BJSQGOjHKEsB5Q6OFYHIEmkOJOkQKi
         QJgw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769175361; x=1769780161; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tj12TTWgfFXpzyMDlhbP6Ez3KrnNtNX7BpLqq3kFmtg=;
        b=h23c4yI3cxNBwxM7HjiNz6MxMbb+YpYf21nMJHr+61EGibTKNnqs858xMECvKI5rDg
         4ICUSoLg7voTWOLtLxtTHnRJWda7gQ7X/gzOQCXcls1BwlKIN1zyeQclxb+k6S5ha0b0
         lA69hAFZJURc0Hv+poS5SngJNlK+wFrdraPFWkvGqn4UMINuA0tJHN+f8HBLqesetIyk
         ouu3raG1p/aUDpc05OhMOMM8pEVOEhYcbQMVHSYtcucCOWYJ+Zp0XuaYPy1g91PJYBFr
         M1sJFTwc6ONEPutkkObBrZcTpQhp3Rno3lk0Aafl4n/1hlVxcs+o3OPbNLBhBkGTcgvt
         rzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175361; x=1769780161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tj12TTWgfFXpzyMDlhbP6Ez3KrnNtNX7BpLqq3kFmtg=;
        b=KLKgIwDeU7uJtDbGNlMbHD3whhAZaNabsu/LY8qAPwqTmJpak9OdVKhDFAkUdpGC1y
         VFBWDd5TQx6DTJ4lAEyCOwfDEBVjjAAH8fCILq94fQ0kBdBBApfm0FtU2t/L+Q77Mgkx
         qYepzzF2lw+3N4TKulAF0XsTTu7OsWuZUgAg3CzUzjjU7PUinKa7aL+c9EPPZyOBNUdW
         RpxSN2//DVvnIluz3ujW+YI1kiIhrAK2VJ4ocxgc0vQ5AF0KiLZ74fRHePgEIGwRHRVz
         aXzgQcz/5hDuIn8aW91HRyaOyQhqdf7nJfScyFRqW7b+pM2xwSf2qVu1pWO20HidzO6m
         A+bA==
X-Gm-Message-State: AOJu0Yzw/xkk4WcESypS8COvcdYm5VAXeEhMxZci8K2nBdEJABBYdpIl
	wJ6iqS35/EZCmrCGlTuHFN/DXHeYMgAUhMGHht2+FLR5T1cPb0sbA0rzQFyFkYPPqg3QsTEguz/
	XwaAzEwxyAJ/0NAf8yXde+ohM8qKbn1pR8crBu2BdPIL5Ws2k0HxSLL3031RPUfRbp3OBrC56gh
	DKApiIfy7fskfwaqlyjjpUlSlVIAKz2CqPwWJHJZxPDqlwb4X7Xhx1RlIwOg==
X-Gm-Gg: AZuq6aIVQVbU1u8OMZ+C0oxJdgtXLfeH93+8yFBnOdW5EOV6ksH+gLbXkjw7gs+k36Z
	FHKI+df7NWcWCd3loYV36S9fnNE6nO1i1zjY3zfTwcQXyvVWept2GkzviKlpGDFDaTTXs3oQBuj
	ZAZQROyI9uYvrIdvj3TWvdThaTRx59JN2s/vZtity21aM03NaO6i41jB0Q9m6eYPZO/g==
X-Received: by 2002:a17:90b:384c:b0:330:82b1:ef76 with SMTP id 98e67ed59e1d1-35368c43197mr2313291a91.28.1769175361390;
        Fri, 23 Jan 2026 05:36:01 -0800 (PST)
X-Received: by 2002:a17:90b:384c:b0:330:82b1:ef76 with SMTP id
 98e67ed59e1d1-35368c43197mr2313279a91.28.1769175360781; Fri, 23 Jan 2026
 05:36:00 -0800 (PST)
MIME-Version: 1.0
References: <20260123131814.586417-1-dmitry.baryshkov@oss.qualcomm.com> <AS1PR10MB569720FF73A415EC84069B29FD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569720FF73A415EC84069B29FD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 15:35:49 +0200
X-Gm-Features: AZwV_Qi0yO_kYLF0BftyQe7RzJArP_y8dYXHhIqyOUe41L8Nn7zvf7FrLTY-eSI
Message-ID: <CAO9ioeXzRQPwVb3j23FcXQE4OYZkf9JETKmg4iui5UPmWF+MCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] uki.bbclass: drop INITRD_ARCHIVE, fixing
 multiple INITRAMFS_FSTYPES
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExMiBTYWx0ZWRfX4/nBSgrdhjxc
 ZW4qaEH/4q4HSoelFxrZWHrhk8ogZ9I+ND6mQugAX4qZ+VRSOeU4/t3gja7cbunj0s+dkbKzmqJ
 HfYyc96FNrCTM9tG8qD721b/+M0DLTFCxk+Y7hogVDrt4ve54dIeuzlfJZoFuUayaZpY785IZoc
 D/TlgOsrvh8Y2sFSk3oumLNAvHRuyEN1XlIBvcghG4/Ep7nsyPR1UIsSv2fEyFufnqodT61kyl0
 f5lZ7rokqzX4Su9p6bxQLqSOl2sAFdbgiO6BLA341BDN+G/oQ9usxdrElnoUnTPcawxLmfhQPI0
 v2vcd09TqAyL3MBMEsTeywfWveldFxRj6eXdezeH7CaXc/xhW6J8FXc+ruLM3VYI+34kCjSDAuh
 9WJiJANq0P6cLfhdCIhz8IMMv4zqzG2TwEPLJuIies0gdskcdWpWtYzA/PXIA0Su8c4TCXUaGY2
 BQRsjiV9ralTlHq6uMA==
X-Proofpoint-ORIG-GUID: gjB0Hij3jPpO-drFqVIrH5bkgiyjpDsr
X-Authority-Analysis: v=2.4 cv=XauEDY55 c=1 sm=1 tr=0 ts=69737942 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=a_U1oVfrAAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=uMiIkJZt22svwt1YAssA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: gjB0Hij3jPpO-drFqVIrH5bkgiyjpDsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 13:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229890

On Fri, 23 Jan 2026 at 15:32, Marko, Peter <Peter.Marko@siemens.com> wrote:
>
>
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Dmitry Baryshkov via
> > lists.openembedded.org
> > Sent: Friday, January 23, 2026 14:18
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH v3] uki.bbclass: drop INITRD_ARCHIVE, fixing multiple
> > INITRAMFS_FSTYPES
> >
> > If INITRAMFS_FSTYPES contains more than one entry, ukify build command
> > will fail as INITRD_ARCHIVE will contain extra strings. Drop
> > INITRD_ARCHIVE and handle fstypes directly in do_uki(), letting the user
> > to specify other fstypes in INITRAMFS_FSTYPES.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  meta/classes-recipe/uki.bbclass | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
> > index a2b1c8a82d6f..ea449540db66 100644
> > --- a/meta/classes-recipe/uki.bbclass
> > +++ b/meta/classes-recipe/uki.bbclass
> > @@ -73,8 +73,6 @@ require ../conf/image-uefi.conf
> >
> >  INITRAMFS_IMAGE ?= "core-image-minimal-initramfs"
> >
> > -INITRD_ARCHIVE ?= "${INITRAMFS_IMAGE}-
> > ${MACHINE}.${INITRAMFS_FSTYPES}"
> > -
> >  do_image_complete[depends] += "${INITRAMFS_IMAGE}:do_image_complete"
> >
> >  UKIFY_CMD ?= "ukify build"
> > @@ -127,7 +125,8 @@ python do_uki() {
> >      ukify_cmd += " --stub %s" % (stub)
> >
> >      # initrd
> > -    initramfs_image = "%s" % (d.getVar('INITRD_ARCHIVE'))
> > +    uki_fstype = d.getVar("INITRAMFS_FSTYPES").split()[0]
> > +    initramfs_image = "%s-%s.%s" % (d.getVar('INITRAMFS_IMAGE'),
> > d.getVar('MACHINE'), uki_fstype)
>
> This will leave orphan INITRD_ARCHIVE variable defined.

Where? It is removed in the first chunk.

>
> Additionally, I think there is probably issue if someone sets non-default values for IMAGE_MACHINE_SUFFIX or INITRAMFS_IMAGE_NAME.
> Isn't INITRAMFS_IMAGE_NAME the correct variable here instead of ${INITRAMFS_IMAGE}-${MACHINE}?

It's a separate issue, which needs a separate commit.

-- 
With best wishes
Dmitry

