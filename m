Return-Path: <nicolas.dechesne@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23193CA0FFF
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 15:25:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.54532.1756740323816848821
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 08:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nEuAlIej;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: nicolas.dechesne@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B45aq025481
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Sep 2025 15:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=nuZ/kmb1q9cw4eucT7Q0Y0Zf5BspqBzOYKKUqbSnAjk=; b=nE
	uAlIejnYUp6ZCFd965uTW9U1Ik9vtEYkkpWLUluX8gSfw9Y8V1/xgITQNpl7CeEe
	NGwq/soOOXdLOmT2kxctBSmRw/juaBaxNchBXwWRPIzkz3PtNCXCa3O9ZkkqT3Vk
	XwfuczFfCeiV/Z3ChYlUP3cGsyoW+FeP7+fCODwHvVGJBsNtHdofDlY3ho/5XC32
	bhRFtep2HSDJb0qJl5mF5pbSoo0Mo/xlEMwDmy9Y/BLrk7FrEig50OWFG5Z3/8V/
	5z2eEs3yrLj1YkkHAW3/cZVHnkIG1cTPfqINsaI10gi6FmL3asOIvbbiYzQIatsd
	0Q67yAOa2vtuMT4EGo+A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyw6hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 15:25:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70dfcc58976so70659976d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 08:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756740322; x=1757345122;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nuZ/kmb1q9cw4eucT7Q0Y0Zf5BspqBzOYKKUqbSnAjk=;
        b=f89Y9waOFenhh2xFlIhmH5aRgr/kDRFdEUA1KJk9Q/m2e9FV7gNWhBUSGd5pS9VDOl
         eKDk1LiyBNEoU1kOi5qRicqWcAV4DaksMisnLYBwzqPFiatElE2xhZ4AKXlwhlnQWWXD
         /KLaUPpezvTKTMjw4SjLeC8eVmngf4nHF7Nbr2Dse99oNaoPG0ATJQha7tPjLBvbUVzX
         4vJCzOGkHC9mJYt9AFgNhZ3klaQa/5DG44XTJXL0W/+88atYrKwhGpfqNINbc0zSDPDh
         cQJI6C/HIar6ctTpccrJXGorwqoD+KtxKpQvnC67OXoolLp2VW3rniGyXsfMEN1WtVA1
         SZ5w==
X-Gm-Message-State: AOJu0YzkIZ46qkDOu3N8gt5mlWzshPu1PvBG3cCuqOApAV1BylQz/xYN
	t5Q2PFPfJXUBe3aJnCxQCgqS5QBxYSCRUfldSDB31EY8Ukx/gMyuU/m3XtPY7AkVkwQR3uqt0V5
	ociO3LcNd52OWJlYeaDTC619/nQDTvkXdWkvT/Y44WkrVUMqVEYVD482nhv3fIWjNIW0JiBHCTV
	5b/sWofsftwF5H7uWB/iDc3iy0oK9GyIo5Tu4IfK+xoJD+NJNortQjEivPPouoh+amswbK
X-Gm-Gg: ASbGncun7n8OjTvKR/W87EJOCSC3YFy18cotHn21HrFD1ic46/NfdiY6TcjpWTNbgKO
	DdiyA06nt3qVyVt4elexPv+snMN5FB4dEp8FVtek6OooSm9/v2zmqrLrBovsSaMl5JaUtKfnLcx
	LvXiC8/8hJsQoS3owCOa/wcQU=
X-Received: by 2002:a05:6214:e8b:b0:716:e723:cb29 with SMTP id 6a1803df08f44-716e723cd42mr72204206d6.25.1756740321506;
        Mon, 01 Sep 2025 08:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6XK4MVIuIs40bb7T+idyLFyIaXwN6ORw0wftMLi742PVgaH0WyIlXtzsq5WrYZuiD4i9rayG2eE4yeE/1dQk=
X-Received: by 2002:a05:6214:e8b:b0:716:e723:cb29 with SMTP id
 6a1803df08f44-716e723cd42mr72203846d6.25.1756740321037; Mon, 01 Sep 2025
 08:25:21 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 17:25:10 +0200
X-Gm-Features: Ac12FXydtSwsKo8oDMiSWr_KzQjrzs0_a3PieUvniPcWGpQSrHDd6P0tlpfvJc4
Message-ID: <CABWbsgC2qLDQfnS4oumgLSuS8TWCk=1a3j8yTxN17_UFjMxuxQ@mail.gmail.com>
Subject: yocto-check-layer and DISTRO
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Fd-i_BYAeKat_YTJv-xDlWBTZx_pYJRN
X-Proofpoint-ORIG-GUID: Fd-i_BYAeKat_YTJv-xDlWBTZx_pYJRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX5jMVTI5Jlo1D
 GruPNeDPlwVBBsZV7iDHF1I+GnucVDgZRAse3bVzKZ3bi8g+k5yCyFNTqEjvhwa5sBSq3/oeggq
 zoTWiLkW4LeFi4Jr96u4aWbcGvJrkTWrckr8+3PVD7vkmWKSPZ2rnm6noJXtwEwrs0Fu4dS8Zvm
 lfBfpCKf5zhZoAQd3TU9jLPuLgAH3tqAmQbHM2FF5ukDovjpUq6/RfvdppXhMnCtltfbB1k0SnE
 YtnWHZpxXfhcjEuYhv8Ic2RWSee34k1LMcUxkiGwPIRTRI0T6PXvQ6DVk3gz0iDEc4q9Yhm1J89
 8/j/H1dfD7Nr81jF92UC2hgpSvSPM0UhApnNJHk/WQFr3XNF1qSIGG4zTkutv4sWqfJ6hPu0sdQ
 uLNj9s3G
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b5bae2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=2tz8wdjylGdw2F0e7uUA:9 a=QEXdDO2ut3YA:10
 a=bUYPNviu4PgA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 15:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222666

hi,

I recently came into a situation where yocto-check-layer failed in
Yocto A/B for meta-qcom [1], while yocto-check-layer was not failing
in our CI [2].

After investigation, we found out that DISTRO is different in both
cases (poky vs nodistro). This problem in particular was in a mesa
file in meta-qcom, and with nodistro mesa is skipped ("skipped: one of
'vulkan opengl' needs to be in DISTRO_FEATURES").

yocto-check-layer obviously depends on DISTRO (and MACHINE? and
others?). However I could not find any reference of what they need to
be set when testing a layer for YP compatible status [3].

I guess we need to clarify what that means to be YP compatible, and
what defaults are being used for that. Or suggest that we run it
against both nodistro and poky?

Any thoughts on that?

cheers
nico


[1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/85/builds/606
[2] https://github.com/qualcomm-linux/meta-qcom/issues/1029
[3] https://docs.yoctoproject.org/dev-manual/layers.html#making-sure-your-layer-is-compatible-with-yocto-project

