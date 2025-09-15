Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324D9CAC598
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 09:46:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.28785.1757929574443718530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 02:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DxXdZuDN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FgAG002193
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 09:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3K3UCi0gXzAiAaokA9eu+2rJZqk7DNMMmOETxSQSOQ=; b=DxXdZuDNHX96uL1a
	XI3U/QbC6mz42pdDqEhsLcUgnAccj7b3QKq1dnsxCgBlRhB8kVcPw6Ez0uIfXgPC
	JDmqkpe7StayiVQa3A9SqNKIfZyttmwTGiTmL3u9PujJFDFvdnfSxUNX20YrrHXS
	LGRbSBkKBzpfJaP0m3UmK3y8bW9cV/IvEkFCi/rbc4C34sWCVBd2bS7dwcQkSBwc
	ac+IvzBce/51fzxH8A5lQ1JX+1SMBpUbNpWZA8Z7BolZNIUmu3ijNv/jWk67EfiK
	6AM5lnw5QsdsEuMGFFUkSolUjIm1Wggn1nsvx3TnfPI7cAJNNxFfsFUJbmn5Tft9
	B4ZybA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da98s5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 09:46:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-786c3986579so6901956d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 02:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757929572; x=1758534372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3K3UCi0gXzAiAaokA9eu+2rJZqk7DNMMmOETxSQSOQ=;
        b=MEbMTFY0oikrSdlzgv2958AynAkIz0km3tRM9VH+wSZ1p/KHfzd12oBD/OGKgLoMbI
         V85wbkyhzhdsdXbpyANe3AgGm3WiTCj9ly0krNHLPMFa5ohVqn1S9sY//LNBUg88hqPU
         eBjrtpM0rJd8DRC5Fg0SD9Vmcj3B/zhBRzM+SqtPSaQtWTzD8ra89Ux5o1+vkNi8edTE
         uExT1RWltmcrHtjOYvccRcrBbeKuQWy0iB1c4wLTupTp2fbLrl45ZP4Mzmi0UeOkl9lO
         0v3PdFvc44kNKHXdd1DJIYuq0KM3ANWmAHxCBl8FYtVisEYUdCJB/0pud56MXIfBE0hl
         uowA==
X-Gm-Message-State: AOJu0YyKKxdKwqHqDeGat/338SPjRkGS9MSVzMPOoSVBJtsx6A45/F27
	9NtfZaFiTA0NH39WYhWYMzMFEuOzrdrSM/4c9Chz3PySn02tDAReYMoeoQud7I8dSTjTOsVfTZ+
	wWTF1mJuVL/+132fo7XkE3DKl5ZL7znGNAdr2K2EWqaxfrpfxyDgGI8N8TonDbtjJHkwOa4a2eV
	GdtH2OYJggrVstHtw=
X-Gm-Gg: ASbGncufH8aLESMz0JMSMkzfo5a0lNSPNTTMEeHqUrD6KQ3KOaIGNX83JG/uZ02+Ma1
	Y6H6lAM57FxWq/foXWr3pTFkqciTK8F6jMtfgZDEc/0ie7qd5EgJAONu9ZO87OjZafxHY6a2RB5
	Taj3iGI+q8YY+gyfvT5jWi2O21AR79zUUMuL5RNDsblAwT4gwePwTWkHzWdMFjnv8tnja/WdXU8
	JpPSUG2jnplOWcQYCipjNY/dLHabwrR0LwdFRd+0EPVg4HOp8R14rXQ9H22ENjRwg72E6n9z1Nq
	4UiNWdWIsmQinbn+wmbQPMRh+2UzD3BTvc0ywIZGKv64pGcZm/e5qsHMy9ztooW3DMaTHo1OxW1
	6A6KN0BppTZpl9kkAjJeY4AA9CRbPOoscHdquaIDuNereZFQfArIK
X-Received: by 2002:a05:6214:29ef:b0:785:3521:4685 with SMTP id 6a1803df08f44-7853521497cmr20501566d6.6.1757929572328;
        Mon, 15 Sep 2025 02:46:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHEPHUAGa2/Iyt5Pxh7gU056Y+R1kGxNPQtiZzbbFyaBLw3b85q40uOXAydVBe+cvhiDklLA==
X-Received: by 2002:a05:6214:29ef:b0:785:3521:4685 with SMTP id 6a1803df08f44-7853521497cmr20501376d6.6.1757929571750;
        Mon, 15 Sep 2025 02:46:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dfa5sm3364433e87.112.2025.09.15.02.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:46:10 -0700 (PDT)
Date: Mon, 15 Sep 2025 12:46:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] mesa: add PROVIDES for Vulkan and OpenCL
 ICDs
Message-ID: <xqbdacelmt66gyxqodfwi7u2w4mh5nye3j7vm523vyper5eotf@kmudnow6y4xk>
References: <20250912134427.1763047-1-dmitry.baryshkov@oss.qualcomm.com>
 <DCSFA11LTKOJ.5F9G4SE07942@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DCSFA11LTKOJ.5F9G4SE07942@bootlin.com>
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c7e065 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=eCxvBYkZpy4XW0bpFLwA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: LQmY6ofcPvTc_mSVx6VpsGqLUx9zGYGZ
X-Proofpoint-ORIG-GUID: LQmY6ofcPvTc_mSVx6VpsGqLUx9zGYGZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX/Fkdlk1OnW6y
 PM+ePbkOI6KNdUZWEEPbgNhpd4+e+9WPEzSpJ2LDfQaQ9yXibMvEvqSHNNFvA2sdtu0e3XJ7uQv
 jysbWcX0l6MG/4LR81BxB1hV1tFanmxLHJejKtxlG3BPYI6l8/9l5gejVl3SGNgB11Uf9iQ6Xc+
 autqbVC3nVz/gc9wKHDytbb2UGC8NS2VO41YeQtTt9wYjRfFFdAIcp8OxtLrj9/CsyjbYxT32xQ
 tt3mWFK30gtQZ3TjDkOx/5hNuF8H0JZFgxbT3DEMfK8+0a0q0/THi/Z7m0RHUZtJc2GVTkufW6k
 xPOSu1/Dm4Nt/wpek1v1xYs0Xr5hC0oRePAwnBKkjST2KMq4TaEuzjtctJhCzErIqP5fpPnx5fu
 4vSwqR9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 09:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223397

On Sun, Sep 14, 2025 at 11:40:32AM +0200, Mathieu Dubois-Briand wrote:
> On Fri Sep 12, 2025 at 3:44 PM CEST, Dmitry Baryshkov via lists.openembed=
ded.org wrote:
> > In order to let BSPs easily select OpenCL and Vulkan Installable Client
> > Drivers, add two virtual package names: virtual-opencl-icd and
> > virtual-vulkan-icd.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
>=20
> Hi Dmitry,
>=20
> Thanks for your patches.
>=20
> It looks like it is introducing some build issue:
>=20
> ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Unable to install packages. =
Command '/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/qem=
uarm64-poky-linux/core-image-sato-sdk/1.0/recipe-sysroot-native/usr/bin/opk=
g --volatile-cache -f /srv/pokybuild/yocto-worker/qemuarm64-alt/build/build=
/tmp/work/qemuarm64-poky-linux/core-image-sato-sdk/1.0/opkg.conf -t /srv/po=
kybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/qemuarm64-poky-linu=
x/core-image-sato-sdk/1.0/temp/ipktemp/ -o /srv/pokybuild/yocto-worker/qemu=
arm64-alt/build/build/tmp/work/qemuarm64-poky-linux/core-image-sato-sdk/1.0=
/rootfs  --force-postinstall --prefer-arch-to-version   install kernel-devs=
rc opkg packagegroup-base-extended packagegroup-core-boot packagegroup-core=
-eclipse-debug packagegroup-core-sdk packagegroup-core-ssh-openssh packageg=
roup-core-standalone-sdk-target packagegroup-core-tools-debug packagegroup-=
core-tools-profile packagegroup-core-tools-testapps packagegroup-core-x11-b=
ase packagegroup-core-x11-sato psplash run-postinsts ssh-pregen-hostkeys' r=
eturned 1:
> Solver encountered 1 problem(s):
> Problem 1/1:
>   - package packagegroup-core-tools-testapps-1.0-r0.qemuarm64 requires me=
sa-demos, but none of the providers can be installed
>   - package mesa-demos-9.0.0-r0.cortexa57 requires libvulkan1 >=3D 1.4.32=
1.0, but none of the providers can be installed
>   - conflicting requests
>   - nothing provides virtual-vulkan-icd needed by libvulkan1-1.4.321.0-r0=
=2Ecortexa57
>=20
> Solution 1:
>   - do not ask to install a package providing packagegroup-core-tools-tes=
tapps
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2366
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/2395
>=20
> Can you have a look at this issue please?

I see. The config requires vulkan feature, but Mesa doesn't provide
vulkan drivers, so there is no mesa-vulkan-drivers package (and thus no
virtual-vulkan-icd provider).

I'll keep RRECOMMENDS, making sure that it's possible to build the
system wthout actual Vulkan drivers.

--=20
With best wishes
Dmitry

