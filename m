Return-Path: <wei.deng@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256A8CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 06:32:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29966.1782455568939898487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 23:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=VbTR18LI;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=IsSGbsi3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VvNn301264
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BYnyvm5Mr4Czt71f+tyyaRiaUKYXd7wDV8tP/PTXd0=; b=VbTR18LIuCGU7HnK
	abacng+Mqt/cCeZcE0iwJApErcC12QPhhEhDhhLX2JBJv80tdxVTbWk6iXHl4xvE
	ntJaNafk55vRlf38lbkTj1u0I2d4a/jYMeh8I5Y6I2Aq87ZlQJpmoyOjaRyp4XVg
	pTXRVYms/BawEjTgOpL/rNYTEBAQR8yZdn1+i368EaZHSC1EFxeJoe8ci2RuL/Zg
	dSVFKb7XzOemsuPgVERtAIacubOWSOekmKRNpg/1MWPGzQJGv3/1TaDg0a8AzinL
	dS8+2p5mGBcyay9oQrQ6P1Z04nnb14DsSChihgUCUCeT0NUr0K8isliJy0CU54t+
	xIhnJg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16jgbjk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:32:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137dd558ac5so25045c88.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 23:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782455567; x=1783060367; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2BYnyvm5Mr4Czt71f+tyyaRiaUKYXd7wDV8tP/PTXd0=;
        b=IsSGbsi3oDtrnLC/cjAMZo+pWbfcia2RWdxO6abjnckIpMW+NfNhN/HEP3ymGcysot
         vZOEjZ10GWINFtSzW3K4eTADNVDvAU08v+7fTFEpmeFfPvUQ28HK7bm5+Sjsb1vcRIme
         TSqIVSU6P2/X+Ayfyht3dw5fPBc24XzK9tC2MC1RIa5w97NAt1gVaKFTDskMWgLvsb31
         z0kdKXIObNTFjJ5JXHlcK8XPjR4WAyZibpyK4NOjLEn9B0l54ZwqvnGU9PIq6DBMwJzP
         R3ttF/CtpBCbaaX99tfaavqbRMnkMExa8QMOkL0C6ivvMQ3RC1pbR+cUofcJ3chUeCrS
         WqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782455567; x=1783060367;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BYnyvm5Mr4Czt71f+tyyaRiaUKYXd7wDV8tP/PTXd0=;
        b=ZHfVckCHJDmWWefAL56cpFVaZaL7kfynOhT+F2jt2wW6TszRPdY0LjS+CYVYPCg8b/
         tQcRtIr9gT/xE8KMNQ9Dm8IYx4bdQE58BNZiDJRtWAEluSpNV4utFEqEvNlb64I+Q5NE
         sk0b5txJHBcSPLMSvpskC1UlLqltOvMedqy9wgtvwtt5NuWKOTVwNKV+gypfrlPVlp6s
         0fz2ol5CXG3YA25qB5AMoV8toPKK7JG6+ArFMghuaQRE5/R3FQn3GQRr+A79RI4LewmR
         LBrPnnWrxfuzRwBVneh/Tss8ATLYxLVIAquurYzbFA1gYOyEjVKolAFt8qqEhrGDb637
         sr2g==
X-Gm-Message-State: AOJu0Yzv7zhjJxw7j+YudnyKOg1GMuqrOFQ8Eo3kWgst70zaRX0gvPuE
	s6qRxO0CnKvu2J1RMzR5Ld7OtXvyF0H7S9cZT52GCnDltvTK7afCc+lJ1v99nShQrf6kbVYk8VD
	gJCIi2bnllDVpFPenN650GCTOacIA5DTh7+w0Ux6fRKcb2Q1jawanYhkLPpRzPTvGnnSs/yLRdh
	Iy1/qjnQNSGjIR1Qk=
X-Gm-Gg: AfdE7cmlIvNxdaReBbVO4YmE5pQy7mdONW6NgvF8iAOypqN1+Ifv/nWn4MgBPaUr47T
	L4+RYZbc44sr09IP5/bjY8Nm1+TR9S+ED5pM1WgoaxT0EWjUbF1x9Z458Jo1NtITrwk+3WgB7CO
	mN8nS3h0Jjd/VAYRjvl1qEyrA+RIvY/DUsoxoe6/sZulK4umDqSBkksMOxlRYSB3bG35w6+AYsI
	JHbgmbMZZsgs0ZnNV7nVMlIrZ7XTVIRJzmIhAdTu1iacVSxMjaXl5yl8MbPpad61ORA5ZSAmVJ/
	h8eCT1zalwgaW/2G0m2NXQs/ieRkCGbpNELCCoWr4MeZvdbmJHjRHCdfIBlsQE/6rnSXinVXPej
	D3X7hbrIBdJ1LmmyEh/1SiPiLsngeQlCzgGlHREQlLt+cp0AFqXV3Kw/0gDHtmw==
X-Received: by 2002:a05:7022:ea2a:b0:139:81c6:67a1 with SMTP id a92af1059eb24-139dbb2aa93mr2236893c88.1.1782455566515;
        Thu, 25 Jun 2026 23:32:46 -0700 (PDT)
X-Received: by 2002:a05:7022:ea2a:b0:139:81c6:67a1 with SMTP id a92af1059eb24-139dbb2aa93mr2236885c88.1.1782455565989;
        Thu, 25 Jun 2026 23:32:45 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm23208534c88.15.2026.06.25.23.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:32:45 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Subject: Re: [PATCH] bluez5: set L2CAP IMTU for OBEX profile listeners
Date: Fri, 26 Jun 2026 12:02:41 +0530
Message-Id: <20260626063241.701907-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMSfU+4MuNWsDvi-LNuv=G7VR7F75LgQ=e3QXrJKGn6pbk0ujQ@mail.gmail.com>
References: <CAMSfU+4MuNWsDvi-LNuv=G7VR7F75LgQ=e3QXrJKGn6pbk0ujQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0OSBTYWx0ZWRfXyvOaz6rz0QRG
 WnrtHxLi+ILADxwyPUaz90dbdkfIiMqBp/Fv1mhCTMREzUw/mYm35k9hZU3UsKc0f84NgU3sZ+o
 thz/sJK6oJkXDrj0f0UhHat/NyzPM+Am2dWSuOR7BRA90ZMMai7CbmJTY0WRnIczLMWL9lkCqnw
 1ch0OpNTmURI64RlOcpozGdGuZPn6KxFgghPyiCQGtgzd1Z0sw/HMuD8WCZvdRl2hvxRplpSlXi
 fbDMzgxxS/83aRIJrRhp3mBytPgnG7TfCg9SdNAiZanEizZgYjCVHER5xI+efn+jvRZYHMi8jiO
 xKMJ3z2sVrK8yU/kyItrPBh4pfl7r9bTFrMNs3nsTKbAEYaVtLWVSkhX1VYgcfsIqwe/0r08feG
 NCk3Ae+kbsNxntn6Ljwl7mcBcmV+jn7OTRn4ZtTEEoBbBeiEbCIAsaT/AvFQNUHaIy0DFx9SNys
 g1LkymC+yVYWRm8NGNQ==
X-Proofpoint-ORIG-GUID: dXgJTpbust6--HQ2yv1kYfAaMS4ivmIz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0OSBTYWx0ZWRfXy+GioenDV/ij
 mghvdIH53MLOG2zkNt//gP2lYbA6VX42PY+uWj4gjq8TDIWJLmrypO/uXPTbRh+n5COKovF+org
 CiKI09BLXH5UgSf8hQXPGJaeEv42opk=
X-Authority-Analysis: v=2.4 cv=daqwG3Xe c=1 sm=1 tr=0 ts=6a3e1d0f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oiv13-6TVh-9QSXv_JgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: dXgJTpbust6--HQ2yv1kYfAaMS4ivmIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 65Q6VvNn301264
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239602

Hi Yoann,

On Thu, 25 Jun 2026 12:44:40 +0200, Yoann Congal wrote:
> Le jeu. 25 juin 2026 =C3=A0 12:42, Yoann Congal <yoann.congal@smile.fr>=
 a =C3=A9crit :
>
>
>
> Le jeu. 25 juin 2026 =C3=A0 05:47, Wei Deng <wei.deng@oss.qualcomm.com>=
 a
> =C3=A9crit :
>
>> Hi Yoann,
>>
>> This patch was merged to OE-core master on 2026-06-11 (commit 13cb97f).
>> Could you please cherry-pick it to the wrynose branch as well? It fixe=
s
>> an OBEX Rx throughput regression caused by an incorrect L2CAP IMTU bei=
ng
>> advertised on listening sockets.
>>
>
> Hello,
>
> I've noted to consider it. Looks good at a quick glance.
> Ping back if you don't see it in the next wrynose review series.
>
> ... except it does not apply cleanly on wrynose. Can you send a backpor=
ted
> patch?
>
> Thanks!

The reason the original patch does not apply cleanly on wrynose is that
OE-core master has three additional bluez5 patches that are not yet in
wrynose:

  - bluez5: fix set volume failure (master ec27d1e5cf5, Jinwang Li, 2026-=
05-29)
  - bluez5: Fix sending extra bytes with MGMT_OP_ADD_EXT_ADV_DATA
    (master f143e23e2e3, Xiuzhuo Shang, 2026-06-05)
  - bluez5: fix gatt cache sync issue (master 137eeffd4fa, Mengshi Wu, 20=
26-06-08)

These patches shift the SRC_URI context in bluez5.inc, causing the
cherry-pick to fail.

I am sending a backport patch series of 4 patches to wrynose together.
Please add to wrynose review series.

Thanks,

--=20
Best Regards,
Wei Deng

