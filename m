Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8397DD6ACF1
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 12:15:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40571.1766060094223963913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 04:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=A36EZYXx;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=KS0jx3K+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI96aCq527962
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfmDZPYlamvrzNkQFr0yeXC5oE3byqUfHvshbwIdXJ4=; b=A36EZYXx529C4ZKc
	afBfY0/zB22kdCRh7Z8Jym01eaG9/Wt+neRCpYC68TdG2FZVx0r5Az7kQQOVL2Gc
	nwsFxeMWFzrzhhx/2CDaBrIRfo6jSfbOAjLfAV4vtO4XMgYYaH08KXCcQOhmaKfD
	UnFqUYDHPpmbMfDgzNK/rTUGolYo1Fo/5Is0aibW2sFTCOArYW1fZL+sxYyoohoK
	gl1lRjIE527/H/eV41GpkZsM+FeJ3NuAat90x5oiP1vzL2R2qkUNs+mi4NBfMerU
	a24KOQYyJZsim1XxXtLcPhVoSTu3EIh1V/A6BuQuOfSDZea9woIXags1X+crfssv
	Z1klyw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43mb2hsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:14:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0488e746so10555161cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 04:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766060092; x=1766664892; darn=lists.openembedded.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfmDZPYlamvrzNkQFr0yeXC5oE3byqUfHvshbwIdXJ4=;
        b=KS0jx3K+7FB/exuLSyP1/gdZUlSGmP+BbfL84zBOJp+TOEFdpg7klm1Z+J7Jkbd/N2
         fejTQuS8iUQ0DOcnBJyu+SN4taI5Ts+Rq3i0N/4p9+dolrClWPxAZP6OEy+bKhncb78P
         obrRZvOjcTEtvTQ4gKeBo4/Of21bD23vsL4AwIMMuEl/gb7O1TWGFHAR2BIyGKwrx3yb
         Uq019wk4rVn7592v1RgQtZmj7eBw8To7m1/7DSRd227prMwn0KTI5FAEXuiDVPif+YHi
         RgoNOAlpQhx4ZjBuREabZ0FIM2eKLklw/fAeYpAnXq802bg4KYwEzHlWJcIJkJVRjoDV
         oOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766060092; x=1766664892;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfmDZPYlamvrzNkQFr0yeXC5oE3byqUfHvshbwIdXJ4=;
        b=SO/QTYpH7Tzuv2vMsbvXqQKPDR2VjnEea7YgU2aJOvuLxIgFL0FDFJBYIC9Ha+251G
         DeGM9WfVxVbu1iMmkYwpu2bhrUo+fwWCgbcJmRUmZzlBNcTqlk5advO0iljhb9R2Tegy
         azy1nFDzfIiW2ybQ1wqm7GA/OAcP3Nx3y4veUm3Pm+WObpfBkk3rZLtZPhxHkoSZ0O6V
         txGujaMHxTGyJbBEMohjPX5gMuNc01OKkbpifxCeCX/tAVmsr2bIWpqqg4sw29Uovmlu
         M0mVv3kqCAws9fT0RLTDk+QQeJdHF/6z2Ni7+QR9KUDW6pkuW2RL5vR5Wx8vrZo9y4Cf
         UV7g==
X-Gm-Message-State: AOJu0YxNXzCMV8hXIW3Ac1Gzc0Sq0eM2rGB1o74Qn3U40o2CiZ838AO2
	fKSGFPCsKmTx/FntXODBhwwNKCEiC6L5FlWB2QXsNMcvHNrNgnhUQ+mXynoPoqAH0FXxVfrZE2s
	6Ygx4nvPNxT2kdxI3yzLZi5HLf1CFPX7bIVl4zs1UOtTEVggNo6MnTM6A+5oN5sSRNf/W/rkHqq
	xuQR59wrE=
X-Gm-Gg: AY/fxX65w65oXhcHQsKPaEzu4b8FkMGSWsEIlrw4fW1nMNZS8XQtpubirCBuahKgbs8
	wgy4sCwz2uYO5iVb1bEsCcEKmEi0Nxye/qeCuKF/ZvwkG4qFYJbDLjQQgBHDDfTvIMgGwo4dvf1
	F/dFu3K01TctpwJR/ny/VeJxWiOPERoBVBlXHLF42wVURGKvUpbShFumP3y1uPsZeiyJ0evog6Q
	2DnJFiOohZ/zA6e1dBh2l+jX/brFiQpUzKxcIUK3Pxp+uaWqWkwA71+mEqfqO8poDuqPzNFl9At
	EReFeg+q5upmH+MRFCVXEIaoNktd6oi7wUf2P6QSUxqspF8szu5ybfTaBqtusaV3uECR8jcnwXI
	m6NsRTJ10K5axCqPW5+5r6zP9oaunzryGCu6boKdJ8ik5WiufIADAS5FTWkpD4pwuVQ==
X-Received: by 2002:a05:622a:58c:b0:4e8:a560:d980 with SMTP id d75a77b69052e-4f35f481bafmr40153721cf.38.1766060092549;
        Thu, 18 Dec 2025 04:14:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5sv7CPeCU5hYt9MBd9nqZool6tDkwQcrd9TUZp8ClEdVP1JPW8BeNF6lwwqrzMlBMQ19HLw==
X-Received: by 2002:a05:622a:58c:b0:4e8:a560:d980 with SMTP id d75a77b69052e-4f35f481bafmr40153441cf.38.1766060092084;
        Thu, 18 Dec 2025 04:14:52 -0800 (PST)
Received: from smtpclient.apple (185-047-135-246.jonaz.nl. [185.47.135.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80230cfa9dsm214708366b.15.2025.12.18.04.14.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:14:51 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [OE-core] [PATCH v2 1/2] python3-pyzstd: import 0.17.0 from
 meta-python
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <DF0LZKG2H116.1SNE235TEG058@bootlin.com>
Date: Thu, 18 Dec 2025 13:14:36 +0100
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6154845B-2C91-4FC4-A48A-CB06A5461C90@oss.qualcomm.com>
References: <20251217093409.914045-1-koen.kooi@oss.qualcomm.com>
 <20251217093409.914045-2-koen.kooi@oss.qualcomm.com>
 <DF0KOAGYU1ZY.399MUHSJMJ1BP@bootlin.com>
 <F86DDF1B-F439-4E6C-9335-8C8EA388F862@oss.qualcomm.com>
 <DF0LZKG2H116.1SNE235TEG058@bootlin.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: Apple Mail (2.3864.200.81.1.6)
X-Proofpoint-ORIG-GUID: DPCjud4-BUAsVK710QW0mqrPEaVNigOy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwMCBTYWx0ZWRfXxKyAvB+BQJle
 PKIFSQg9yTlrV85yux9YI8znBCvSqI5gVKJEFPK3ifBOR1MQxlqZAvT3FyBpMhqL84PLzkJanvu
 o777TqNExG4F30hXoh2mLSoD+tlS72B0+QATd9CxWgfaUABhrrpmQHcWhJ/kIolTNfY132Vp+dd
 b/T02dOChQfK6+7cDwUvupMfhVPg1dzPF5x0r1Q5q+khuM4BquVkRn2M5idbrLmA45Ot2HYcBqo
 nwqUHrzZmk3EpaPSjS9Uv1TgVqH2Rf7IcaEyE08FKvMz1tDtI7RKWTXSMLB7NkiEaSgSYKAf+yL
 WaILkVWQuCEsEAJeZnsH7gVZUpq3SHz9XaF5WA7+NLntPkMVpK0VwGE8q4mq9x+ACp5dgcQqeU2
 wIgwxKynmdXSRQs4rU45wtV3bk8xtA==
X-Authority-Analysis: v=2.4 cv=NPHYOk6g c=1 sm=1 tr=0 ts=6943f03d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=/kpjpRmFdjEkggKB3J9tkg==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=bZmlF6pekZA44JAVPXkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: DPCjud4-BUAsVK710QW0mqrPEaVNigOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228120



> Op 17 dec 2025, om 16:49 heeft Mathieu Dubois-Briand =
<mathieu.dubois-briand@bootlin.com> het volgende geschreven:
>=20
> On Wed Dec 17, 2025 at 4:09 PM CET, Koen Kooi wrote:
>>=20
>>=20
>>> Op 17 dec 2025, om 15:47 heeft Mathieu Dubois-Briand =
<mathieu.dubois-briand@bootlin.com> het volgende geschreven:
>>>=20
>>> On Wed Dec 17, 2025 at 10:34 AM CET, Koen Kooi via =
lists.openembedded.org wrote:
>>>> =46rom the upstream website:
>>>> Pyzstd module provides classes and functions for compressing and
>>>> decompressing data, using Facebook's Zstandard (or zstd as short =
name)
>>>> algorithm.
>>>>=20
>>>> This recipe is being moved over for systemd 258.x, the 'ukify' tool
>>>> depends on this.
>>>>=20
>>>> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
>>>> ---
>>>=20
>>> Hi Koen,
>>>=20
>>> Thanks for your patch.
>>>=20
>>> It look like this is failing on the autobuilder in various
>>> configurations, probably only with poky-altcfg:
>>>=20
>>> ERROR: python3-pyzstd-0.17.0-r0 do_package_qa: Fatal QA errors were =
found, failing task.
>>> ...
>>> ERROR: python3-pyzstd-0.17.0-r0 do_package_qa: QA Issue: supports =
ptests but is not included in oe-core's ptest-packagelists.inc =
[missing-ptest]
>>>=20
>>> =
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2848
>>> =
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2837
>>> =
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2894
>>> =
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2848
>>> =
https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/2829
>>>=20
>>> Can you have a look at this issue?
>>=20
>> Sure, but I have no way of testing that patch :) V3 is on its way.
>>=20
>=20
> This is a build-time issue, so I suspect you should be able to =
reproduce
> it with:
> DISTRO=3Dpoky-altcfg bitbake python3-pyzstd

builder@8458df25789f:/work/build$ DISTRO=3Dpoky-altcfg bitbake =
python3-pyzstd
ERROR:  OE-core's config sanity checker detected a potential =
misconfiguration.
    Either fix the cause of this error or at your own risk disable the =
checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    DISTRO 'poky-altcfg' not found. Please set a valid DISTRO in your =
local.conf



