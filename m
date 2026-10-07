Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E835ECA6002
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 20:14:21 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.795.1791404058516300850
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 13:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=d8XByQue;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=hGrNF8mw;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 697ICnuL1803276;
	Wed, 7 Oct 2026 15:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9uilzbfETCkYB2fhDWRxA/wgEnk0GcJA29zZIksNF
	5A=; b=d8XByQueFdG+3cjWabOfCSL7jLb15gk19xiopjOkPHR8QvK9JZ+AsVMD9
	H85gPd4BmLm74xPZ5x2dqYV8s6yp1YK9Hxl+woNyt9SxZ5T31OKoFzy8yjW37ef8
	KBOQGcOyL/SKg1CNQeLlCthR+4Aj6zrRgAZvwyKjpHRwCgGvQUUQBa12q+1OYeJu
	2oXxmglyHqklmxB1LKJCbHdzC5quM6ijeXCmauliCbmBtXzV0Aqne0XVQfWIOfM9
	bMeylrrj4Wd7MAed5oIUqulW92WWsqYUlZfeqU3mmoUfOjY8qd9glP2VvHgNiVt7
	26zwS0H9ChUdQ72GsHyhwIDHe3A8w==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010050.outbound.protection.outlook.com [40.93.198.50])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h5sh818bt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 15:14:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keHXX0AiPgGUtnWmOukBexZfY4cIIp0LFbSWnZu1uBkMJylK7OmWs8aR/AsEbzbV0WYhUF9DxouSfcyHKVEJFn2Bz/a69j6zQbBBFu1AvMAAJvxTvGd5J7VNMXv1oT6IdPhWb5Vo5t9FcVzEORHiq+jf9FunFGK6b/uNJWnlO0uLL24cM5wVsxA7Fy8czTaPeXFKrGemPNPyUyRSPj1jUTrEEH6PdjGoSHmtJnHEV1IbEtRJsIrJ/Oo/cYYNFUG46GxJgxi2K+wpZEpqN01JLSZ7O1sClNsj8iGcLyvlpOuwZeAqbk/c68R11ngMXTUO5HgIeBnFi1aIbtMC++6aDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uilzbfETCkYB2fhDWRxA/wgEnk0GcJA29zZIksNF5A=;
 b=BlyzsJ+3X2YiR4sucl8vFD+USydqy4t39+25Dw2GqeBMgd8MtzAG5WZ50PHpJGpWnWxbPGEo3gW/5w6kAHN0W2p+QvKbPFcAupAybdc2LemxQax8TAAHTQ3zeRN+WTWWUoLuNuQsJw0TueFjKZjyRNbhsmdiH7pQWC2E/kDc0NaGMDKM/Hh5BduF8jYs8Mx4qwX+mcT74qATcJ2HMQwn42J4HwZhFTHisG6YnjaamTzbwS0R7j7Xguki972iEsTvp5jTk9c45Qrc5bYPvGuFav7i9x/VqZ1aMiWq2sH2D2LXjREvWrNYlCGB8FL++sRJ5Ll0QiJOYs5RgSeFjKA7SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uilzbfETCkYB2fhDWRxA/wgEnk0GcJA29zZIksNF5A=;
 b=hGrNF8mwgOkfMjYiRwumDf6SllY8k0u8FmCHD3QvOMvxJ8GYej5lTPQGOl1awdgTq9S3+HzKfZvNao+D31JCYQwIQmOuV4eEBg/RzpV+/yfHzVSunVNZgf90WhXS49KNU5x4UazoazvHnf34U9uhS9Udej7KBEeoESP/2w5DrMY=
Received: from CH2PR07CA0039.namprd07.prod.outlook.com (2603:10b6:610:5b::13)
 by DS6PR10MB333227.namprd10.prod.outlook.com (2603:10b6:8:4a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 20:14:11 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::1f) by CH2PR07CA0039.outlook.office365.com
 (2603:10b6:610:5b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 20:14:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 20:14:11 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 15:13:52 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 15:13:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 15:13:52 -0500
Received: from [10.249.66.148] ([10.249.66.148])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697KDqUm1832234;
	Wed, 7 Oct 2026 15:13:52 -0500
Message-ID: <d245b4e3-3f2f-4f9e-a7fb-35ae3f5913df@ti.com>
Date: Wed, 7 Oct 2026 15:13:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Revert "tclibc-baremetal.inc: fix gcc-cross
 EXTRA_OECONF"
To: Paul Barker <paul@pbarker.dev>, Denys Dmytriyenko <denis@denix.org>,
        <openembedded-core@lists.openembedded.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20261006214254.1556824-1-denis@denix.org>
 <9032ce70465fe1664635c7a3c4eef470c774092e.camel@pbarker.dev>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <9032ce70465fe1664635c7a3c4eef470c774092e.camel@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|DS6PR10MB333227:EE_
X-MS-Office365-Filtering-Correlation-Id: c5faf012-f16d-4ca7-199b-08df24af8ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|82310400026|23010399003|36860700016|1800799024|376014|22082099003|18002099003|3023799007|10067099003|13003099007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	fimHJzGq7qqIjGO4LzTf9rpu/K9bsZj6HU+5mPTnwIhnm9NZUxTwbCJ0Gn+JZ3KwCmKMabju1+W3hDhFFMYNx9vkEmhyu0vF9paIwyUshdI5SdS8HvI8TTJXogXgJKiq/yxMa1KwHAKS5xt4rr5tappoHFUcCnfSENQqIJmkDSX+E65KV90FtZ5b0582bUPCNB3Blf7GMOC5r5gMZf2oEaWanknXkzh5vIJ7tK8Qxg+52rIaw3M5V5SnWwy5t9BR+l4HZKdIhv7zs0M0iP6UZBeVIHEVktDfgb8kDuFAKQ8eslzhXszCgTgR2Tn5a3elhrocoNcuYAoL1kzoJmMgrJTWVwOxeklzAjgA5+sUxtA7N/u4cWDn4Sa5Vtv3mXAOPJlBlFEzKXIQcJcB5GAJ5YURbnrRHaGDG0+rxrUY56nuBy0XfttXAaMYxGikTiTjOWvLyI+r3159UfyIsYI+9RDVU19pUhzjVjXo4VND2AlSsSce/TdRQY848QY5xaG90QuxPxZpgjY7gR1m11g1mcibrAkYOKhQovs2nW6tkwVU3Mhizsle0SDMnEdoS5juEm307+GlMixBSt3jSqFjwHi1B847yhHQmcrJJGt7G5tqOu0avEI5YJWxP9WXjhC/0WeiwzJmv84+/rGLh/G1Kg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(3023799007)(10067099003)(13003099007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cj24yD0AAsATM31NGGC5EEi02e+h4Kvcw8aCnrSyfFB2jEu19HfX2Kha1lAlnr2KM421U59nIW6Am7aCygkTXp2xlupAAFvRmvfGg63UqzI+to0V/5rWChd3RjBQgqJ2n2snY5+ADKc0WcAXTGbexGMNRqXHD6DhPBY9xkMddfDn30+7CIsILxFPA9I9XmwnDN+pGqgGEm1hvn5tpOzJAsIjm4Wdd2QSSV+1Hf5l4dfo+otBR76IBznDjE+w4ngnuSqE4AhOUdQblf+5Tq/M6mBzFGSHCpAYYYQeh/0kmeTcI8N8vXm7ItaujDoEG/+PVBg6R1T7/F06nWU0gv7sDuqhV8iVAP0e9XQm+nPv6RIfGghELIgfeaiwR/s/wyL5PeVmlmGBXhUSHjfwyub5VpFiEhyPGqxlbi4pXCBCVJDHJ4u4pK8yF5MXbrwOseKa
X-Exchange-RoutingPolicyChecked: 
	uGly/UM2Vl1JazAwwbyILKCmjuTsgqqPyBxGNjgMAgiAwS5ptJuasK6HuNgSvW8N4Qq33rPB3zkt4ixtszOwWI5MIikKRak5dKlFNKOZtrKllNsu4Iuv7J+dO/zCnt8p80UcMPY+5UXiEOFe9zKDLRmLZGgfftU2eD1WoQI7/B4isDZ7v9/uJ6sMaCofCF9egWTNpgWCTp7niqEDjD0gguhYpSZw9sLdVbbSrSz2KuaPfcB22DfFhNj3J1DWW3v5ty/FRwn1ZNJdTAi1Gp74Bj0y2JlBEPCOmwIBFBE2aEKmSu4gqkjTmcoB/irbhzXhDA0mxtWDPPIBQttI87xtxw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 20:14:11.1070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5faf012-f16d-4ca7-199b-08df24af8ce4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR10MB333227
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA4MCBTYWx0ZWRfX3fSdW0euOsJU
 f99dLtKBiY9ymOCtYjBqzpqsOsirOa6FrDQ8AJOtMZ77T3mv6egZsMeFA5JvGZnc7yhLQZh7ATb
 KlWL9zstWv+aYMAMiKbB/xpZOMt46MQQvqxxfBnjUqXGFoyUvW5bSlSraT6hxhhIl6k5fr/fcUn
 Ttm1oa/m2mpb/mq78GxcJc8Kj10KGlapgcadkZ2ppLcg0rmFwfvMRDKjnEUzPgKB+cAwe7dsI14
 Ar5XWXYqkfTnCCO5Du+u0Voamo3vdJjUzMkzEFPIvgKmj18TjAuxFx+ER8qmmdpkxdQxTn1X9fz
 i5f25sSm6Opg0Ymj9Ksr4XcYOvNT24pwOI0B15so64gfsLl0vJNwp6g3I4Y/kszt3fhBSH8john
 2n1h27EQNX+VrivpBWfI3JGz/S/XuIp/gYPml9JjrLsxph1BLjntiT1L9mG3kQy5Wi1oRn4ChJX
 pQXL66vmm81O2Qo11RQ==
X-Authority-Analysis: v=2.4 cv=ffM4WEQF c=1 sm=1 tr=0 ts=6ac6a815 cx=c_pps
 a=xOrz19RqOvhMowGYDVTMqg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=Q4-j1AaZAAAA:8
 a=k-42gJp3AAAA:8 a=sozttTNsAAAA:8 a=EE4KprYuNPQthhLAIiEA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: jA8InyglEo8-rJ48S5lTntVt_bqFcP9b
X-Proofpoint-ORIG-GUID: jA8InyglEo8-rJ48S5lTntVt_bqFcP9b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA4MCBTYWx0ZWRfX1e1mhi50g0cT
 rTpM+sU/k/9SIQcQ77raJlSOegyCQdNw0rUTBmclycM5gPpoxnPLHH2dP8cf+NQ097K3UXaOuJK
 embaiSOhNdSzeKpmANvl9CQbphBOgHg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 20:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247402



On 10/7/2026 9:30 AM, Paul Barker wrote:
> On Tue, 2026-10-06 at 17:42 -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> While this change has good intentions, unfortunaly, it completely
>> breaks baremetal setup (at least for ARM arch).
>>
>> The line this change removes seems to mask an underlying issue,
>> but until that issue is fully understood and resolved, let's
>> revert it and restore the working baremetal behavior.
>>
>> For more details please see the following discussion:
>> https://lists.openembedded.org/g/openembedded-core/topic/121486589
>>
>> This reverts commit 020d5f018616bc48eae3a23d5498dec3c78a1386.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>>   meta/conf/distro/include/tclibc-baremetal.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
>> index 6043cb6654..abea5a7162 100644
>> --- a/meta/conf/distro/include/tclibc-baremetal.inc
>> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
>> @@ -18,6 +18,7 @@ USE_NLS ?= "no"
>>   IMAGE_LINGUAS = ""
>>   LIBC_DEPENDENCIES = ""
>>   
>> +EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append = " --without-headers"
> 
> Hi Denys,
> 
> I wonder if the fix is that this should be:
> 
>      EXTRA_OECONF:append:pn-gcc-cross-${TARGET_ARCH}
> 
> Best regards,

That would fix the bad behavior but would result in the same build issue 
that we see when just removing it.  I think the issue might be fixed by 
the gcc fix that Jeorg sent to the list.  I'm going to test this build 
with his patch right now and see if it fixes everything.

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#247400): https://lists.openembedded.org/g/openembedded-core/message/247400
> Mute This Topic: https://lists.openembedded.org/mt/121618723/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

