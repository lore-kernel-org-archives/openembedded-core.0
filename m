Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EECE9B251
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 10:19:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17348.1771928389877241838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 02:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UfYHn5nH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=idMCZNN6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFSTL2774555
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 10:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7l4sIRPqDeVUAZwgB8MBJU81Komo6DpvDUy636E2N5Q=; b=UfYHn5nHolRYvBni
	WhFa+ncipeFtzAyYjDtf5ULK5E4bvj1PIAPsH3RhVPagrAaAC8PPWFszL5jaM3pk
	lS8KyJ20PwtkWwyTLNppSxBUAvP0sL/Rf2CPFNMvhPvsyrGxyU7feD9ToA8s9m1C
	0fH1yhDA9/09OP3YsERSGc3hQrNzno/1gB57SLGhZeY9FDYfoK0RU78i6cn7Rm+Q
	Ui/xTWPOBDu3rlMX4RwV2VuNFXbVsrGXPIRVY4inlcBCEbjx3jZZwfkHPkyi/ejP
	Gb/gUYJAhMe7uiwo3W+ai095xjzyUutVCl1ceyyyhQgkNFBDvzLxLp48SNzOXk2v
	X0VJnw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69kakb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 10:19:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3561f5bd22eso4507863a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 02:19:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771928388; cv=none;
        d=google.com; s=arc-20240605;
        b=UEump4rbY6w6RkolScdpP5pepFQZl4KduF8XwMlPO/bLISzNPTawFT5u596Aols8En
         ePPY0IEqIV/HBd5eDc3Qsf5KxE4AmucCSpvKunht4DzZlkp0dSeUSPEXRDZVXRk8sycN
         7xUXWqfuVYstQTq/Yov9t2kFilX33HtcC+c8dLRthz3V00yMfJdG6eKQ47MBkV/KnX5N
         3vVSCC1nanS8Fu78NUiuRk2jTuQ9GMYLqnzI6Q9VF07BklSI5vIWnXULjnYBemeyQSaL
         QrSS1cfDoq86a/y25q5X7YbV9PCTmRvsKkx7hbaDxq7qqwgSTDKB8NId22lNW3P+HdnE
         1ePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7l4sIRPqDeVUAZwgB8MBJU81Komo6DpvDUy636E2N5Q=;
        fh=eZ9KL6WcGlrgcMnrw+eLVmmdYbLOcDTVYp2rJpTr1vw=;
        b=UwRbrqcGij5tHAmxDDhrPbPPw1NopocRJVoTlNYMbneQ98+7RgHiDvDa6tAd+i1YVO
         acbWjG9NTC1VlT3rs6s+StXxWTfemXlbzgKmhVuY5BKkydiluwSwSHKLTxOj/a/hA0dv
         uhv32PkJNYZH32GoK/YZ72uAGKlVDfbzfMiimYP/25y6S01zfS/PpFwOGBM1qo/WxH2B
         WLlxrNGyVYXuyG3RWazSakkju/8N0gd4ucqRRRoAlG0xL01xQV9oopefx0HjrANgpZdW
         sgxySoxCbeETXLFPWcES7FdzKCKQVkslZUz+X7JqK6IOE04bSKw7K800BdboEQKN02eI
         U5wQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771928388; x=1772533188; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7l4sIRPqDeVUAZwgB8MBJU81Komo6DpvDUy636E2N5Q=;
        b=idMCZNN6QtiNXfDc5NA3vDYYK/RabNR/J3jIcYWSGYbPwdJd+dP1oldEt6L+9eDVBe
         b6s1rE0YtzQYhCQY09zFE1MWuPyi/WXkvjv8cyirhLelGecoZNWe+JdRORZII6N1AZMN
         fFKfZdlkILHu3ykZJUJBgE3y3aNHK/qMhiAyPw4r+xysrK3ULmJxRfCOwfpzR49PrM/L
         V4rgE6NI2Ss0Uzc6vvGGG4zICWdbGE+UnArmonAOLLVxwmHmscsG2KzfCm1ARCtylLYo
         ScxC/eK/t8dSqwawFLUhFZIyUKrxeVRVdyRwiVR9xxO94shwy3FITdqO4fY/5//csI5s
         bd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771928388; x=1772533188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7l4sIRPqDeVUAZwgB8MBJU81Komo6DpvDUy636E2N5Q=;
        b=QPoIWtJq0euAd5XTiAYCmeUL2SQhl3nvlx4A9mhrFomJJo9mo0XJapv0g3qiE4NKbm
         +fuzxEs60sV53/N10fq4rxzcoRkfOT22EKiIuhf3sU2dEm809nBKJ7zfx7mOtGqfGhy9
         GM8YLVR+Rgj7LZPcwako76c7Pq4lKPvSIwNuT3RVbML45Qaa/zxHB9Y3igNwKfN16uNa
         wIDor9ZYj7h4tHcgIUKhr9wBTAFFn73Wmg8ST5DQMhZQdNHhu2M96CTCGX7Og03pVkWU
         ul3NyWAo/UTKi/BwHT3kY8rH1alxZe+zTrqJiy2AghLHgjdsCyjJf39cY7zUF93J9x89
         4a+A==
X-Gm-Message-State: AOJu0YyOApqt742WVN3VSTlnbomLQop+Gr7DmIhMpUlmsg5VV0sgsIMh
	p/ZOGnzuycoe4l0RSjk5/vMc2p3OV3iu/q4UZ3Wn5/8rZiozjiJKEsjjRSazB8GtfVdbIZvxsNG
	wkSWFG84+pLNwVXjeN6ReZSKK8V4xN46aJzmzwEmAy+bcWtr6Q1+7icPRf769SwQKiNpceaG19U
	cJC9cnB5/hq98T61lfd3VsRLoudVszWe1n7sHw7OD15xUYJY3Qg+8IMEmh0w==
X-Gm-Gg: ATEYQzwvHKE7DgEh97RfA3BVaJDgVC1fdmOZwRl08hel7zbO0T/FEGImOdCnx/GkVro
	Qlm5PzS5FhXjBKphvyhaZ31L543tRS8KcwdKRCOJBiS7h6DyMNBcurU6Uvkwb9PKPE4Hm+7Xo7n
	s4OQzITOphOW+1x8C0HOK6jYP4R8SGRbdu68rvFz76KcI+RWGC1qjj89H5Jm9AcQr1dBCiE3bve
	VyhSbKzfmXwN4k3/nBs
X-Received: by 2002:a17:90b:2d48:b0:34c:9cec:dd83 with SMTP id 98e67ed59e1d1-358ae8c77cbmr9633732a91.27.1771928388462;
        Tue, 24 Feb 2026 02:19:48 -0800 (PST)
X-Received: by 2002:a17:90b:2d48:b0:34c:9cec:dd83 with SMTP id
 98e67ed59e1d1-358ae8c77cbmr9633727a91.27.1771928387931; Tue, 24 Feb 2026
 02:19:47 -0800 (PST)
MIME-Version: 1.0
References: <20260223184247.394616-1-dmitry.baryshkov@oss.qualcomm.com> <DGN2C9C4VRH6.2P5XSY46IY4HI@bootlin.com>
In-Reply-To: <DGN2C9C4VRH6.2P5XSY46IY4HI@bootlin.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 12:19:36 +0200
X-Gm-Features: AaiRm50BboTcKlSrcSNYrC297QzXz2e2CbSnPb9dgww7yOvOXg1LHQjQ30mt7yQ
Message-ID: <CAO9ioeUgoYspLdZ5YcXJDRN1tQ4uRmieV4z6y=-7wxPKFyXcVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] linux-firmware: upgrade 20260110 -> 20260221
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
        Sairamreddy Bojja <sbojja@qti.qualcomm.com>,
        Vivek Puar <vpuar@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699d7b45 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=RJ06NW-8pzhYXx-PI1gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: ZgXTva52Znh-gf7LFPHmW5nJLKvnQBbc
X-Proofpoint-GUID: ZgXTva52Znh-gf7LFPHmW5nJLKvnQBbc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NSBTYWx0ZWRfX6gZOEA2k4QRF
 4I/waLNKOdNd0VpKiZQUPT8iQcBb+qadpnPsPzC/HDTiymhRqBPTSVV+YdrX4ON/1y6TUYqOV26
 pxG6ZpgOE/hoprSxk9i+40KT7yZC7V1swCazETbgse4m0baAlcTAZG1kXwfh89eWdDQApfU09Ff
 cu/57GzNmCt/3W0y5vln1V2mWDMrrr+rVbLVHcm67XEFfyx+RXIV1uVD9GoZpMvBm3z93EuLhnZ
 XZTUTXn7LzemG1cvQxqOJvDzmg05joMEFiWnyebHmoq+VwzMNEQT84ofy30tj5CTRGsKXJOhIOg
 32TvQkNwoMfklX5FPTlABQH19Wmlf93o9u3iS7tht0hzvmjBd5Xe+I+6bCOJj85u0B2eGC2fmX6
 b/ThaFjm5WfIFlPeOqVIZHislZMDYNBhwxcXbG9f5ORcEwxMQZHu+wky1LanklNHoO/EDL7vS1i
 w8UkzsEyi7FVKXqxVhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 10:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231762

On Tue, 24 Feb 2026 at 10:52, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Mon Feb 23, 2026 at 7:42 PM CET, Dmitry Baryshkov via lists.openembedd=
ed.org wrote:
> > Upgrade the firmware package to latest release. Add firmware for TI
> > TAS2783, Qualcomm Adreno A801, Qualcomm Glymur, Radxa Dragon Q6A CDSP
> > and several Intel Sensors Hub firmware versions. Also pick up several
> > ADSP topologies for Qualcomm X Elite and Qualcomm SM8450 based devices.
> >
> > License-Update: copyright years, new firmware
> > Co-developed-by: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
> > Signed-off-by: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
> > Cc: Vivek Puar <vpuar@qti.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
>
> Hi Dmitry,
>
> Thanks for your patch.
>
> I bet you already know it, but just to be sure: this patch is breaking
> builds with meta-qcom, so meta-qcom will need changes on this patch is
> merged.

https://github.com/qualcomm-linux/meta-qcom/pull/1615


>
> ERROR: linux-firmware-1_20260221-r0 do_patch: Applying patch '/srv/pokybu=
ild/yocto-worker/meta-qcom/build/meta-qcom/recipes-kernel/linux-firmware/li=
nux-firmware/0001-linux-firmware-qcom-sync-audioreach-firmwares-from-v.patc=
h' on target directory '/srv/pokybuild/yocto-worker/meta-qcom/build/build/t=
mp/work/all-poky-linux/linux-firmware/20260221/sources/linux-firmware-20260=
221'
> BBHandledException("Applying '0001-linux-firmware-qcom-sync-audioreach-fi=
rmwares-from-v.patch' failed:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/builds/245


--=20
With best wishes
Dmitry

