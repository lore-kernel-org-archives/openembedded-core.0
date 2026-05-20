Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7244CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:46:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7726.1779266800618801692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EgpYDElA;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JrlZq1Rd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K71LMP2867811
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j4drkg0QJpQ26xdsBYjxEG2l
	dH66jEZ1Hn+9Pg6Igxw=; b=EgpYDElAOgLmNMqyZtfwQtGpKi5ACYK8RYu7I6Hb
	kEZwaglScLZHrJUy5zhp8hCUOlkvudS/MqXA85TgXxQTmtt1x1bh4O/0v6wtHv5R
	RfIxMY54aa/j5HQMfkKCsldS6wb0WsrBSUgbuJw6WuozmI7vz+XedFUIANRMOCFN
	USnmhy3LvQ645qDHeqX307JsYneolqwBoOTcwOf50EqFhZr6IOcP9hJdsPsP9tgB
	0C4IPlmeVVZzNC/un8YSZTV144NTS+178f5RHmTrU6AHqs5WCPkHlmWxeRSXy3ml
	lfDb9o7oCaPE3ZZA+liCmGFeSaWsw2hvYWe1DSArQT9Tog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3wbvu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:46:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so5160041a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779266799; cv=none;
        d=google.com; s=arc-20240605;
        b=PYjff8BZjGg1vQ7RhaDLVI4Ln1NmUdxCs8FmOYtZ3uP/aKaWN7+r7f9DSX2lYQUnCw
         OUjcrjZLO2jUfOYg19lsolWKocxfljiy98QL7kzh7Wpa13f2tJNl92rRpChJgyitwMMG
         R3UnyzPtg5kmPv+B/QMWfVErV3jFFkwCg7ZzO8056qb1NNA3vJi8hxzI4u951xD2+xrM
         KkO8YanrE7U57KpofZaommkfghwbwYyQ7llnommTuO+nLT2h1tZnGCbxxi/PVvQvu8ea
         ZbVo1lvnejJlrM0HbZlSZjAEa6Pxx7ssgTk4YvvcGormCVjK2y+Ah08kKNmBA3nuZay8
         5wXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j4drkg0QJpQ26xdsBYjxEG2ldH66jEZ1Hn+9Pg6Igxw=;
        fh=LfebfR1brhnHO6P0Iqf/2RjZo9i3W4ha6gFG7tScAhY=;
        b=H+iO0RdF9F2RAPMuS0XiHU4fDwR8BfB0IWY8DXq6lV92FqXpPcbisB8oiB1rXlJKXj
         SrbMg48Ia42R9gptvHAuRlV02MP91ixbT0qDDnfBNdZKA360ZD7Enwof93sTo+yAYPNB
         rv2+6Z7FJLpMq77ziiyRHHksw2mnt3QyftLDC6riRUuQ6ODTY2GB6oZyG74wFunMzBQt
         gjnY/TIJ312qSUf06zgG+jFsPW3/yGtYuxRCGfskpo+a0uBhz8YjBV0zAKLyPg0Xwe56
         XzGgQcS1PCCOyc6G/LkDlLKo8dJU3XZwvEREoa6KVT4WarH3JXyp1vu/Ymj7SARhDew6
         q1Xg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779266799; x=1779871599; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j4drkg0QJpQ26xdsBYjxEG2ldH66jEZ1Hn+9Pg6Igxw=;
        b=JrlZq1Rdh6UNIk6KzdPai7WiUNTBa1N3b3dLxpPoM1PUfuGscosZ6NjxUuU1CsBGQb
         lH/rNmXIdwRerdaxw0ej2W0f8mQyMortbOUWdceOCl1gaDeZwzqYEj0cbp1sdUUubT3O
         3/rFmUBfezZXArBHoJqjodwF89zBVaBtDbljtH0Kn6GlxKZbAB/9nig99wZL9jOuhcZ1
         MR1cXQ4Gjz4hOXbAqNCKXUQClotQWLKZDV8kKUt8vhrinVmJD7oMkIQVewBigkKrVg+S
         wf3bPO3H38f/KYCaky10AKbNde6DjxQDW++uSQseNVbJHbqR5ln5Ubx42YnL7q86Ad/y
         oISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266799; x=1779871599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4drkg0QJpQ26xdsBYjxEG2ldH66jEZ1Hn+9Pg6Igxw=;
        b=tIL6KQum5THCW0Fb/+MEoQzqvksDXh3GSn3M6SP7miSndxQ6fXHwoqtTqHKML98Hpr
         iMXvjd7voHj+ZKXjCxNDMDZZJpnZBK2hwEpa5j9OZk2YBiAvvidfZBP8B3KXYoyiK/bi
         lohkRrPBEFG4bkkXwYIA+JGLj8TSgTM2VbiSk8RNQFrC+HDf+eerzgk5A1T/DCxyhnyO
         nvaOhpMxdpjW3y1Cc2sR0BSWNNJqz0+YRJU/ebAEdSs0Nl2HOemHnpFuIDG5NynT8ic7
         qCgaW/oSUo7AJYA4TRR4OlTW9yt8WxeGD1ZJaNJkiB6re939Mxlr8P0vtSBwdDvggQkb
         E2Gw==
X-Gm-Message-State: AOJu0YzOyC4s9lt3C3IlcDeRYm5M+lsvn14gTB6NO4VZBh40yjcMUuyQ
	Mkd9URlddSHt2unZT2OJxhE81BDZi0Te8tvTilblwBRNUFqBIE5PytHCOeN/EN03hTdkXUe/Kr3
	y5QlwbqzL9QeLDexDEU5QNFlSfzvWciROdwYduQ2UUM2Ua1nPdS3MwK1JNjbFGCL4IudDnh73nf
	IFONYzpzxzItJBFMP3xUikx3HME02E7MzQtebfB3ABSps1ZV+uBL1TdA+GBA==
X-Gm-Gg: Acq92OGrgw/EnGdPTA/zoRknsPn41kiIlNhzZtfLedpnmxcvTCmcmSc/nsGrUFwJWFV
	Id77SWt+xoflXIzNMk6VdHhg8F2HT4BESKjbPx1AwYSekRW16b5vvz2G2QwRJ3Dtw0CtnR9+7jP
	MwSpHvt/7wA3opYngZHqoyBkv8f2HTL5lLr2jKle44j6e7WjCV3cf/rIAWMF9a4O/VWhJqrbcvn
	XqWbO4SXSsgvYLClSXoT42+Of0wNbjQMsBpwCeW
X-Received: by 2002:a17:90b:48c4:b0:35f:d56d:1c45 with SMTP id 98e67ed59e1d1-369519cc92amr22198488a91.12.1779266799402;
        Wed, 20 May 2026 01:46:39 -0700 (PDT)
X-Received: by 2002:a17:90b:48c4:b0:35f:d56d:1c45 with SMTP id
 98e67ed59e1d1-369519cc92amr22198467a91.12.1779266798804; Wed, 20 May 2026
 01:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260520051136.2806904-1-vpuar@qti.qualcomm.com>
In-Reply-To: <20260520051136.2806904-1-vpuar@qti.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 11:46:26 +0300
X-Gm-Features: AVHnY4LDjtDd2Ewu-lCBKMiEJeKoo7DdCulGgd0dPnbPdwRlJKVLbDYvXljoSO0
Message-ID: <CAO9ioeWZpVKrL-722nVMk+3yscUdLhtShxQtT8PXWSFy-eXv4Q@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: upgrade 20260410 -> 20260519
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4NCBTYWx0ZWRfX2csXT78BFbXH
 /7/ab8SNIlb6R67VZn5gChYSjjYd5Hwdk8I27hnLS90Aij6Yj3QCud+3J/Cpx6KQ0RNlSambuj7
 x7NdxpGzNRcMWViDoMR/41RF2MoSiq/8ypgm35poffBenCRGtKbGEGfUZYDph995ilnN/QLaTpK
 ECc7kmy6MQbIjA8Vh19cYRTrjs8SutXHiIjowDwUrTZRls881mv7rfzzpQknGV0yaOTyMmi4k43
 /vK2YJYjwUEKLo6i4jXajwVoS7onLk1/BbUIcPn7/6cPSoHLIuEiZtHIFgOwWRJAxMpUVoxajXi
 LUuDNwg6BRq6SsvsvrXAlHVKzlp5AHwa5H1HjQIEQyUf071z92kWiWC1HFWWPuKRiQgw4bUb/3l
 PmC9IW7YCzE/BR7diTLOtQVb6smHIWPl0R+xMPr4CyOChYovVrGnJKalxVgtcQS/yvI3sLhNvPx
 cVzFUpXIAnKSnUU6JdQ==
X-Authority-Analysis: v=2.4 cv=Q/viJY2a c=1 sm=1 tr=0 ts=6a0d74f0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=PXtIEpaEMf3LAeI8DgEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Aw48gdzLX_-7gA_PDEUdaKdP8ibuqZe2
X-Proofpoint-ORIG-GUID: Aw48gdzLX_-7gA_PDEUdaKdP8ibuqZe2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237432

On Wed, 20 May 2026 at 08:11, Vivek Puar <vpuar@qti.qualcomm.com> wrote:
>
> Upgrade the firmware package to latest release. Add compute package
> for shikra. Add packages ${PN}-ath12k-{ipq5424, qcc2072} for ath12k
> based chips. Add Texas Instruments PCM6240 firmware, firmware for
> tas2783A projects, firmware for Lontium LT7911EXC and LT9611C. Move
> lt*_fw.bin firmware to Lontium subdir. Add HP ISH firmware for Intel
> Panther Lake systems. Add RDEPENDS on ${PN}-qcom-license for Dell
> XPS13 packages as qcom/NOTICE.txt is applicable to those firmwares.
>
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20260410.bb => linux-firmware_20260519.bb} | 62 +++++++++++++++----
>  1 file changed, 50 insertions(+), 12 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260410.bb => linux-firmware_20260519.bb} (98%)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com.

