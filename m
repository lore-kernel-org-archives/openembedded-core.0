Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87E4EBFD05
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 06:55:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.266537.1776063312871636922
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 23:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hgAapZn0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85636eeddb=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5iBLb1998993
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 23:55:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=uowVtuv3qoXEcflZVpJjVpARKSWq68Hh/13/ob4zr5A=; b=hgAapZn0fZAf
	3OJhIkDY1yj8e+0I/kzOWIeduIK86pvqOJ5SMJ/nmbR7V2WWowDrOp2clPytfGT+
	a2Rl/p7gBhje6BNzvbzHlzrgvLBCwIKzw39cCBYbPt19IJA8HBLi5xakr7TqPAGp
	Z8cvHMi8tKBjSy4XBzH/ljx40rAARc0lUVITrXaEuOjn7mhY8KIqcT1iaF63lqxz
	4RmG7Svh3OsbhnrbLluzHjCyl2OAMl1b3ek7DcgBg4OEQ7ew0QbGUiJ21uRJmQw7
	YlGFia1iPrxgCyXJD4lZdyGRfzcqU48g7FoXDiCiwIoT3z+mxBZZBjJqrF8rnDs1
	wuyPEYj/Rg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dfntds66v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 12 Apr 2026 23:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmnKyvKWoi/ngCJofzRNuCjNrv4w+A9hrUUk0bnHF1g2tQQWoNCGi/V4cRPmOP/W4VJkjIW90RnTNFRkSTMzhypJ4ytX1HgPxBfvhlTRsRt6wEK7wJiT3ngb0JBqjn8P6QfUzCtmtzUhXe1dClQg44IAsKo6O1MoELMR+IP0xzTXg5FOvYHfP0OaEZamRXE7s8Njtdg+9aqG4/+LWr34/Cg8P8zC19gvm8WLolub6oZjoRJvnaagVtBl9F6Ap+fBWWFZEZeB0oD7hzKXUCMA6KD64CAbWxpsPr/WkUKA8eFR4+3GABVVQ1jBAH+kDbCfLOnpDasEjtp1X1yF2rl1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uowVtuv3qoXEcflZVpJjVpARKSWq68Hh/13/ob4zr5A=;
 b=P9wVkpQiPpRXrwwgZkUGdTAOf2qUMZN8cs/4wuVDuy46PIllCzElPANXZuFwWXOtZVr3V1Px95AtpWY8uGTJoTECoXxRSbrEPSSJ8kCJnwrOlytQT6+38bYuZooh4KTAfjapEpSpJehnahKd9jAZvQSu1huUYMcAPYvK8oEmH+Rg+RRCpN/qLPfgddKMEw5kDkakmCHabNTxSLNSK0BSSg4hjuG8VG2oXEX5RLYk+SaglAxfWPw+j1RaDTKT5h1Z78/fjM35ur6HrVLlXcooBdD6HT6UtfUXEV4xVY3aSQ8EU2XCDdZ860+h1HrfPmXqd64jL/ePGVJuWSNISgVDtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 06:55:09 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 06:55:09 +0000
Message-ID: <e394c9a1-8193-49d3-afb2-f3ae65ed3b85@windriver.com>
Date: Mon, 13 Apr 2026 14:55:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-bad: add
 ANY_OF_DISTRO_FEATURES
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <189E1B5A8FDE995D.2964266@lists.openembedded.org>
 <0439268c-895b-4ae8-88de-8aa9d03eaefd@windriver.com>
 <DHRSU3199BKL.AH6ENVO5S6TL@bootlin.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DHRSU3199BKL.AH6ENVO5S6TL@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW3PR11MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf11e5b-157a-40b0-f39c-08de99299a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	JvHS7OlXzoEVU8g+wgAniXkCx2fjukMEDyiNxRl00dUQ+Cwn8O2jPg2YMNGlKaxV3Yu+mWc1b8TC58sDT+PQvBU67m9FkMH4pYXxtUp0B//Pj3vx9MuASFmjkBPeeS3Rv78EhOy8xYSGRNplKBoAgnN5WfzS4xbtQnzTa9uhDT8WQsoW+ElynEXdVa5iOj+BBzVTcJvQLzioP7zu+CwA16eHqsF5xW1uEWBc7IBTrdWQoznK8bpnQaCTJDB1rZK49ca5OUCOl/IjPxJ+51ofJG/42/olPiW+Uu5VzTAkC0Ou79zZeQUOy7qyRPTDdBS2yJjKu5tKG/FX1DpFvEgxvBaBXEEJGak3prEkleAaNYbCsTrOGEGZ1sOGxgFBoSLpC4sG/le3sF9apt93KaSBCnGKR/fZQykgxWXDF+yLK541VtIF4KfK2DmklDgVQQh7eHO+ck31ELLm39PmdWEMHGlurzULn809NvLrRLiroecpymHQIYFQSH68EDMJZqGLKR4hbOkanhT39VKCTJiXWYC/jPkLGUmkOrDjyFjwpaZOcawoVx8euNie34/oyhtsvg0W8DML1gIk/m2rzIUocYPCs/u3bzk7+kRtyE/0EC376c2CMTg/gUchRKft5DBJCcaC+f/gKU/VkT67WP+kJQb/yv3FuM6jbVw3r1CgQejui1J5RAIPiHcLjWARb+8x
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3FQTnJPZnAzVHNMNXBVYTV3eTlhQVFQRStVMjBWVGdUSnMvYmhndmhBdHF3?=
 =?utf-8?B?T25aMVhJZ01FQTRaclpJc0xuQ1pKMmhsdVFKbUkrNG5IZ3AzRk5MN0NDWXdT?=
 =?utf-8?B?QmlUNzc5aTNLM3NRZUIxcUU2bjNxeS85RnpQNHpBSXNydHdaOGFnMGxFclhE?=
 =?utf-8?B?WkVjck5ueWRDYjAzL2lBZ1k2Qjl4eDBrNnROUFlnRFlXZ0ZYNnQzd2MxblFt?=
 =?utf-8?B?UkFkTkdtR01FU092dHFVMEVSY25CeHhtam5nWlo4cFk5WVQzMFFqWU9sazRG?=
 =?utf-8?B?dHY4UjVKS3F2a1pJRTErcFQyb1I0WGZaUEo4OVBwSjROcXVDQitUcHlXYU9M?=
 =?utf-8?B?N0NYd3N0dm1UZkR5UmZxV2h1czNwblNLVU41Uml0N0dqY21zdHRHMTZKcC9Q?=
 =?utf-8?B?Q0JVaVdQTW9LWkpEeXBseE9Cd0YySHVOSnZkRkdyTXpkdVRsVmQwUTlDUUkz?=
 =?utf-8?B?TU1hQTdWT21ub1pOZFpwVTRYYzlwbDdkeUtrb2ZhWjFnTnpuMDVnSUpOclRG?=
 =?utf-8?B?c0c0NTB6NlBQVEhvZGN5WkthdTRYVzJreDR0N3BpNzUzM0FIcWQ2OGQ4RGZU?=
 =?utf-8?B?RkxGSUJBQjdFM0RjcS9uZ0Ruc1A4dUF2dnRPQUV5MEpwYkZZb0RldXR1U2pZ?=
 =?utf-8?B?STc3cld2TlgzbHdlYUJyRVlxNHNYdU9sWmRFT2Era0FWMG1CMldQSVQ0cGVt?=
 =?utf-8?B?aUtIOHMyZ1hvdmEzTEMyUjducDlNNjRzNVNUb3d6aldKZ3VSRU9LOEhxVzdh?=
 =?utf-8?B?c3Awa010b2NOTnZLSFQwQjJlMGd4R243bW9zclBUUmoxNnhwdFJLMTR3Zm1H?=
 =?utf-8?B?UHRzRmRIdTJPTmNrdGpCRkhDakJ2UnNSN1JmMktydGhua0RkVyszWFJkSXpU?=
 =?utf-8?B?RjlRSkluOU1wcjJCaU1wSW9EMjZvWGlZRnNEVTBoZU9GWlQxMGN4ODVaY1lL?=
 =?utf-8?B?bWZ1ZHNGSkRSRDFjY2l2bGlDUnExNjdsVWVERHJYTTdYYWF4aWhpRkZkY1VH?=
 =?utf-8?B?VCs1UEY1a3NxajJkNTRETEE2Nk1UZHg3bFNGT2k2U0VDZ2FpdmUyUnJUR2pt?=
 =?utf-8?B?Qkxab3JXQzhOOGMrUUttelR4dmpCT2Vzd1BZNDFNS1djRXFIRjBwZDN6czQ0?=
 =?utf-8?B?WFpNZEN3YVdXamxpcEVick9zdXMxSDhpOUJodVdrYlVQazB6YjFUdnUxZU1Q?=
 =?utf-8?B?M2IwVi9xbWJhRDZPTU8rV0lwUFBHdHlhdktHMlhWenphbkh3SUkxNlVCcmlw?=
 =?utf-8?B?R2pZTXJmaDVNaGJjZmxiOVpGYmVGSVFadGV0WnFqRVlPTzhCaXovZnEzSm9U?=
 =?utf-8?B?N1F3R2tHQUZMQ3ZTcTZONnlDaHJ3eDNkL0pxQ09FL2tCZEk5VmtrUGtXdHV2?=
 =?utf-8?B?RGhVemhielhkTEpDN2Fzczh3dDhFRjA2c0NTVzNNeUN2Vjg2RFdIRGxDaEMr?=
 =?utf-8?B?Zk1OZGhCWHRyR3ZGV0ZyblBra2ZRY3FQVFVyYnFmZUxIaHBzMGNJL1pXdW9t?=
 =?utf-8?B?VFVObVRpdGtFMldPWFNmVDRJTzZod21ST1lTdDErMllSYS85ZkljVlFzVjN0?=
 =?utf-8?B?N3J0cW0yMDByQ1dlQkZ5elFIZVE5YjMvQzN0OXdudVJNNGt5RjFNdmZEOVR0?=
 =?utf-8?B?eXh0VTVEdFpscnI5QkVhVzlPdHdBbWZXZVJSZDIwZ2UxVFhpUkQrTGwzZjdz?=
 =?utf-8?B?TmtKT3Nsc2syZHllTmRDR0x3UnA2MTVTellEL0g4dFlEM1FCRnVtbE9BOWxT?=
 =?utf-8?B?NlFEQzZ0TDVLYnBDejZBTkgrZ2w3SVFYQ2RCOFpydlRpUzE5QVVEWVJOaEVr?=
 =?utf-8?B?VkZpWlBUMUMvWkNjc1M5ZGZjdmRhWG96bHpKN0xxRW1sQjFMUk5INkpwSHhY?=
 =?utf-8?B?OGhYRDQweUZZOHdvdmpZZDJEUmV2UG50TFNYeG5BZ29DeDZubktrYzRpa1Zn?=
 =?utf-8?B?eS85bFFKNW5nU2txMkFNZXJwcHFkMmUxVk1EVEc5aEJRbmswS01salp6MGo5?=
 =?utf-8?B?a0h0N2gwZkxMZkxJQ3U5aDVaZ0M5S0V1cXFHSTZmbkYxQ3FmRzFUZi9KcEt3?=
 =?utf-8?B?bVVVQXRnZlZYNSs2ZVZ1dVYyaEd1QlMzOFlYcEJGTGVINWRXdVdJUC9YSFpv?=
 =?utf-8?B?Qkl4TlpFT3JxMStieTFiZElUU2NMMEpyWlZaVEg5WVdjaWxacTFhSnNWOXNJ?=
 =?utf-8?B?bytZYTBXK1UzSm82TnJISm1aU2FUVmtpTmFNV0NUQjR5VHBNZUF3S0VvSWdS?=
 =?utf-8?B?bzM4SCtnTFhiV1BaZXFNSm9zUE44NDVWZDhtZ3BHaFEvSStSMmRFbk5Qc1Ey?=
 =?utf-8?B?dUlqVDUyTmNHUzJKbnZkVEFzOGJES295VkpuMExtM0dDSzc3aXRiYUM5eEUv?=
 =?utf-8?Q?YiDRZW0nDufmbb+U=3D?=
X-Exchange-RoutingPolicyChecked: 
	D+juCMCFSRPnXQVLbj/vebxg0WDC/06l7rrkOqQyq2ED+HOHnEVamc23InJF7fQ7NRBsmeKDEczbtKzWY/xiUe1FaqYlNrwZm6Xon/onjWA82B2DsfsoeN0IdoeBDVLdMLVXwZhQzjf6EzGZG4FcIbKVK1C0ygX5nCXvyoQjwIcI8GRcB4J+L+nHuBNEx1WaJIiO6gRy5sbBZo6XYmq5YoXZp/ukNVRl7EbZCSEWKW7w38IImvn3vOGcPcZ29b3tv4oyaCHPKIdgF8k2PaacMovEt4hGYvU0lgpWkqKxTPKPVNl7+juGl/7GDwaY6tH0KiATxV/NKRtLFJjuZdgQGA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf11e5b-157a-40b0-f39c-08de99299a00
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 06:55:09.3579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIF7k/bRgKN1ZOKT60a234FOYRTbLlVMt023zguSUojE9ygMQseAWn2h3HZK3vfq7GrMo0Tp2A1UScFLbLcPlzgz3LcW9iwBGp59GMPSK9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 5okexbvaFPBGUrhG985cx7P6yiUgCVcx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA2NCBTYWx0ZWRfX0XJ30kY59jyn
 Mj/3505YClS1Z0w8lhDipHnziIOylRvfJuJ2QMcARB4bEAqP6tNP/5m7dzL4DWLlLM3NZiUXl2t
 ApUVa7pLdMaBSI1vnXkKk0tlspcDWNETfsVhnxzmtukluQ4C2Nme0wQeA8vViV2UJRV0NUqxb9i
 4ZHre/oG8Rp9mN0yCb9D5fJVCjxwcXXjw8CRv+ldS68w2bGWvVsCFjnNyiSwED7NLWMsbJw+JF2
 OcufmsTe05gu2g6DG+id+XmhfqyROeBuNJjeXf5+8EQwgK5e7zNu/alKkYV8aAkRamPLBLO8/HX
 t5aPQcDeolaja4PswK1PalzgchasaHsFynhkRyvLrhdqKth6T1/w2rIzcvlyMtzGkDc9BMnEf2q
 8iFe9ZkKAcWc6w8mMch4wUStT9Jtrs1jRcXdOyOJCeYcdufrKEoYB3gEwsJilgvANEizcCH7GSi
 fCgcJvXD86xXbPcBgxQ==
X-Authority-Analysis: v=2.4 cv=S6/pBosP c=1 sm=1 tr=0 ts=69dc9350 cx=c_pps
 a=UC7P8Ip5M4jKPNRdwLma8g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=7UvXTtmbKG5kzFrowuUA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: y506cK45PQySdg52kM9P7PP86BzkF373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 06:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235084


On 4/13/26 14:05, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon Apr 13, 2026 at 5:17 AM CEST, Changqing Li via lists.openembedded.org wrote:
>> kindly ping
>>
> Hi Changqing,
>
> Your patch is still under review, but we have a pretty long backlog. It
> should be merged or you should get some feedback soon.
>
> Thanks,
> Mathieu

Thanks for your feedback!

//Changqing

> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

