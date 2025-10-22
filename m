Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B31CCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 11:33:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.4596.1761099114532199252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=macllwT/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LF7WvW000310
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 01:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNxNmYgAanD/FsECV+JOR/Hl+tQASvEhDgeR759AUxU=; b=macllwT/3ES9n5Av
	3t2bKO0jtpnHWhtZIuJRsQfGqqKAz/+tSPrr+OxcMj2W+YAA10Y3RklPnp+O+Utj
	cX1rLvYcU5KVH4TSAVK2p0ZJ4sEc/NDB8mLZh9oz6uDuz9Oul02n0yuIn8svOuxy
	qtEVQEMa3EhrvF4Sox8oQE9+52aOZEvCfCVQRtUWMf65S2GMGNjdyn3uR32hFhm2
	lqqF5P90J1jzXg+wFKkDOc+4E4qCJfxcp2uPYU471JytjkZlJx7hQxy3V1Hr/bLu
	ScRE7aHBi04oxjXkRGoI6riUqwjFKA8ly0smOb4w5xe2OFV99p5PNtuL5C89heZC
	K06BWA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w8da7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 01:45:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77e7808cf4bso4029526b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 18:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761097543; x=1761702343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNxNmYgAanD/FsECV+JOR/Hl+tQASvEhDgeR759AUxU=;
        b=hfd8olupi3MMx1TFPlXDKvzQ3UjIFOPvug6tSspFqGnjXU24t8zf7a7ah/LdDYt5si
         zoUE4AvP6dSTU3G4xZfZ6QXgQUhwHeTBqOtn/KaYzuj0APMtcpctBpWWAd+wU4upG2fk
         Dz5gxg1ITCajD9TjxsNdkEM1HhNbZm9fR90KLnN4hVgEXI3tuVaKo5bRy/rAuNhFsMGe
         MWsFZKzU3hbgPG8mDKOvBn3XyIcuhWyCD04HYpnHt6wB5HoSbCc25qRS2iJwvcmDxhSl
         oNSDzr4qttK2e///4KeSWDTpf/XAKj+qjWMBLrxyJUHkGg5TClDiKafyvtGXEDoPJUYY
         8f9g==
X-Gm-Message-State: AOJu0Yx40JJSizuPy5vCrdnxKCMFTJ34wuVHGTqCVtZDPmSkUbLDEvjW
	IMMtKMGtfsOoBj6ZiclJ3nit4T+D/IA+p8li/kI0gnnIXVsTpUMagAcClgul0vO5iXLe55bXDiJ
	BRte1508GhNlcoJI1dWWdPJGc83U/tjs7oTppwaPxu7k/4cqTqDTwrOakhK9Xrdb2D7xirVOcD2
	nHpqI3ISY=
X-Gm-Gg: ASbGncv/pv3ehL2Bg8xKuwk63AZ0EZznlYVsex2lnq5BYuCiJ7cxpxRN3g48hHZ/MUm
	Ma1qNGxJKVetuk6GqiY+cmavoG3Wj5Db92G4z73/nxKOae2E1k9ptegHgik48nIxYESP91VAHHo
	DYbb443MidNZtp/OMjQbFADKbWiZV96iekkP1vKxv/ULY2sH/FYRhRA36tRSm61QhvtrgMXaAXr
	xgt2wxffEvID95hPcay+o67114SH0Fa2oVF86+UF6IlQO/f8Jk3gkoBIYrPpD+sIQ8ljLIMBh8a
	nETk3ZwjJQAGf+U+TrIlhsoKLnKBmVLA8Jp1m9qYjN07FnYemgZ8WQ69JMc+HQ6QrLpI6SKiVLU
	GA+q4k9EWZpLamjxgylAcjdYucYCOKQqJLhgDP0fQ/EB2/cYTiFrw4wSprXr0trKpn89d3ls=
X-Received: by 2002:a05:6a00:1a90:b0:783:c2c4:9aa5 with SMTP id d2e1a72fcca58-7a220b10802mr28185360b3a.32.1761097542597;
        Tue, 21 Oct 2025 18:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM9t1CMM3RC5NYA7hj7XUtGziYhgoFn/ybGO9Ty1sLSMslPrb3fkAwzSq3WLmrPSertHkk2g==
X-Received: by 2002:a05:6a00:1a90:b0:783:c2c4:9aa5 with SMTP id d2e1a72fcca58-7a220b10802mr28185328b3a.32.1761097542097;
        Tue, 21 Oct 2025 18:45:42 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23010d818sm12754602b3a.53.2025.10.21.18.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 18:45:41 -0700 (PDT)
Message-ID: <714beff3-b3a7-4d7c-8f7a-7337644d22ab@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 09:45:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wpa-supplicant: enable 802.11be, MBO, OWE, and SuiteB support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250718030452.3459203-1-miaoqing.pan@oss.qualcomm.com>
 <aPQV4Qy78RWUnImJ@umbar.lan>
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <aPQV4Qy78RWUnImJ@umbar.lan>
X-Proofpoint-ORIG-GUID: 72KcsmaAFuqK36vKoXVTxmX3Gq7cN7sD
X-Proofpoint-GUID: 72KcsmaAFuqK36vKoXVTxmX3Gq7cN7sD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfXwAX54G7v+4+L
 /5MfDACmZQVIYLg4Uda9eT2YmiyldVpWcSTnfRGqbIOISuvSIgB/ioeBvsj5FjbafI33ggjBoqj
 m3SAZlEN+JRL+kCJU8kQjFO2bPjAXcT7yKW2vGfkTLE60sKcItQkUy5D+buTvQqa+ZQaYGVBwvF
 xEGFszP2LMP0k05LJSJbZPcFK9CyyhqA2Q3Z69hWV+ZtjgD1kd9cbwvgNhN8AiMgKo7nbFTlB2J
 QJM60MFpN8/Z8yCKL55c0Lo/8sr7PVzcuZkNnWBQoTd18iKuxLTDGEcwbEPgA+o32q/MRNrAorl
 B80gKp4oNjJ5XUgwrLp0YzxohPVAIXQS7E6X3f/H86O7RofZxX7vdE+zaiOZTy4ah5FxYgUurIg
 pQ+IgYbwoEMCHROsJnPJHhnH9vZeAw==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f83747 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BFbBklBsiq3ZtazxafgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 11:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225291



On 10/19/2025 6:34 AM, Dmitry Baryshkov wrote:
> On Fri, Jul 18, 2025 at 11:04:52AM +0800, Miaoqing Pan wrote:
>> wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
>> years. With growing market demand for Wi-Fi 7, it is now an
>> appropriate time to enable IEEE 802.11be Extremely High Throughput
>> (EHT) support - mainly for AP mode.
>>
>> This patch also enables the following features in defconfig:
>> Opportunistic Wireless Encryption (OWE)
>> Suite B and Suite B 192
>> Multi Band Operation (MBO)
>>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>> v2: update prefix and commit message.
>> ---
>>   .../wpa-supplicant/wpa-supplicant_2.11.bb                   | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
>> index 6dc76494f7..440d3a5c94 100644
>> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
>> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
>> @@ -37,6 +37,12 @@ do_configure () {
>>   	${MAKE} -C wpa_supplicant clean
>>   	sed -e '/^CONFIG_TLS=/d' <wpa_supplicant/defconfig >wpa_supplicant/.config
>>   
>> +	sed -i -e 's/^#\(CONFIG_IEEE80211BE=y\)/\1/' \
>> +	       -e 's/^#\(CONFIG_MBO=y\)/\1/' \
>> +	       -e 's/^#\(CONFIG_OWE=y\)/\1/' \
>> +	       -e 's/^#\(CONFIG_SUITEB=y\)/\1/' \
>> +	       -e 's/^#\(CONFIG_SUITEB192=y\)/\1/' wpa_supplicant/.config
> 
> I was pointed out to this patch. Is there any reason why you don't
> extend the previous line, which also patches the .config file?
> 

Will update in v3.


