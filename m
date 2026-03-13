Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE1D106FD69
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 02:30:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7267.1773369042137316405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 19:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=HpTaBvYN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7532d94ec9=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D196ZO1615005
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 02:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=3P3J8xELyPc235cVl5QSzA
	DRCkm/WhibTN1QY+ll5VY=; b=HpTaBvYNMMvYbFLOyVqDS0pg6vh0K43Xodbe+T
	q+FQI6K2fSOMEafW9xUarxGcT/RDzSaaZzon3ajckdAMn82S6f7LTQWN0zkblSyN
	a3tkmAqqsWcobkKKWTxCv/M3rYNMgqKMldAP9tiGtm0sN0b0eVZDSK2YcpR7+hOK
	xGKU6KRnLEtNBct+yJ1cd63O77eRY+PUXAGaNmybaBdWyLfEUBTSr9A5cfBU4lEJ
	g9y9/6Jz/ZBRZLMfJkjrsYiBRt/6sINZ2SZ+fHlC7WPZ90/SHaJi9nMdWwB2496n
	H/v+QQJ4yU/G9Qa0L1Dg/0gbLT3XauUzMrpV6jDOVFQggRPw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010021.outbound.protection.outlook.com [40.93.198.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqs223-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 02:30:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vq5lXldl9JyqVXWPPgNxOKQqjkWk7LSXj1IJaV1uWvjlg+DBRP7F0NDLDdJz7oN20BfznzyqkHeO4COAX+ZcjI+kPLr3smVacf5sPKFw00qu2hzaAekQEm6EaHq4az47u3nyw539AinhXDVz2bijaqSvN/7zEb3PSm5tWwVsFqbLR5McY6wL8AQ0qYvCAfWjAobfFFTq2ZOdw6kIw0KtGloh9sjrDl0QaNxeiaYZGJFhrIbxyNIvv8lu7hYRw+BRlfgfzYz88m0X8dU6QmDPVbEEwyd+jQpavVsvkO9STLEHlJtguU0zH/HpoqxzpHcw68ELprOWCgnH91OoySsrWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P3J8xELyPc235cVl5QSzADRCkm/WhibTN1QY+ll5VY=;
 b=N53D9CUjs7WEROEFhcV7VSx0bPsjQFfMQId+L3EDceQdx5EzOLJvnPXglGacIqb/0dpbeRZiD1kHk7oa+U0gkA+mEP+y56DMWmp+tdnr8vbh9NxUrSyW2/uPF/+NNjbXe99KVPvvQzYvXihk8QRRwY6qPSGZEUeQQhZrAlNSmM6rbDMEOKHTp1805x56QdzGCjAjG0zzgkN3X0jt9PNpzW686rjabcZvhw8slUyasGg5UOBLtmBOy69Ik7+qK0VlOmmRdp5ggxiFZhhVPROKlnyggiVAaHfQ107pVEqAsn/qOz+uumd0otTxxZwsuXr6R++Sp0L3PHw5/uDn5/hNIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Fri, 13 Mar
 2026 02:30:37 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 02:30:37 +0000
Content-Type: multipart/alternative;
 boundary="------------0rqKwa5l7bDyZJ3Sfzaf0R0b"
Message-ID: <34e5b5a4-693d-4a31-8471-1a5495918593@windriver.com>
Date: Fri, 13 Mar 2026 10:30:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] appstream: upgrade from 1.0.6 to 1.1.2
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <DB5PR02MB102138725558AB810833F8DFCEF74A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <20260225034013.1510432-1-changqing.li@windriver.com>
 <C0CE5EB9-AB4B-40D5-B625-3C34119E3099@arm.com>
 <189BA872138654D8.2412760@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <189BA872138654D8.2412760@lists.openembedded.org>
X-ClientProxiedBy: TY4P301CA0055.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::11) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5ef316-dceb-4c4d-5880-08de80a88293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|22082099003|56012099003|18002099003|14052099004|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	GflfhVpcQNrgf9uBk9bHmMxZDLOKAoZpwDYnz02g+00XOCRqnkUJIv6g2wBTfJhcCUFU+m08iBhd1px49KO95UalzuaKvh8HaqhQE6d8GIz/+XAo5FrXcH0tsseDwwoYRHQoRwFcpmw+dNAx/CHwprilVl01zGKtyMGvDweiuiSfe1RF6uD8JzUzst9t0Fb5/yMkPLKNX6510Tv0DpnOfMpw7ok6Ji5O/0gU+QXUDL86LQewlR2JQKHj2vxqytW4c5eOcK2WwU/UUiNd/tXmOuTE6utvOTdWkouNJqMd0I6AcmX07VBIFqoRDRnZi/2YjANagHc/MVNenPyrfw6m34tInp0KJNQGFeOqNi1B/ItoLDys7sssRh8woWb1DZZfKxuwfHcCdkHS13Av69tXYz7olcKy5dCKH2Ke/fLAdfXYBa+4j3cI81+PVuoh5QpFiAoPPLbQ9KG+QTKsLA33OTQazm1UIWEJsEZ4kZnCnAEUe9nMw1SqYrKE6FFdi53cppUIrNcFoNb61xnXMlpapjzrFZsQt9ImqGE3NFaWCfuxSVkB4yVi2vxdMTVNMShx8KHTewrClU9rJvDc6kdzFnxEYcakqeQ6M4J+B45BlC9t6y5vsd4P/0tGg/L99D+/yZauZyZEDVRy7Hcb7nE+2vcDOvN4XJOTmOeAXaSWN+mEIp5PsRvzIUw4GsYTFJuTb8AFrDjZDHSXfHzuWEybUTo+glNCnZBfecxQU2dK9Pg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(14052099004)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N3dGTDlxanVEa2RuRGRlMitGYXBzNk5mMGZhUURRd01sWEJxZ0Iyb2krZXNs?=
 =?utf-8?B?KzlFdFN1ZmxNSk16T1U3ejd6b0l2QmtzTkdUV2h5eG9uZG1kaVVLd2htSFNx?=
 =?utf-8?B?TVRid01BSzNHOGdYbG8rSFdjR256UE56Y2FFUTlpaFhNQkxUKzFsUk1CcVVa?=
 =?utf-8?B?c1VDU2VjRk1DMEMyR2h3a1N6MEk5azM2ejV5MTBXQ0Q2dHYxM2pqMUczbVh1?=
 =?utf-8?B?dkdIellIZTV4R3VYeldsVTFjU3FFLzFMQ0lGVmJGVXhTRTJtbS9ucGdzYzlN?=
 =?utf-8?B?Z25xTStYQnd4eGplbXpCeFY0Um1pcWhJUkt6Z1hCN3QvYk9uOVkyb0F0b2Rr?=
 =?utf-8?B?MXhJZmFDRVZYeFp1VldDYTNPRjdHb2xWV0x0eXZ4MVliMUdoRFNtVmFmVW51?=
 =?utf-8?B?akMvQ3J2TDVhWWZ0dFQ1WHJXT3QybW1SZzdFYkxVOHlWamNQSFJuc3l2eHJF?=
 =?utf-8?B?UUpkdFk2eG9CNGJCVEpZYmRUR3RTZHkrZnU5VHVVVnlJdzg0d0hJRE1RTkU4?=
 =?utf-8?B?RjNyTkp6anVKSVNnekJGbDY1UXRxS0dzSkcxU0RaSVNpNHdJYWRTOUpXWXRx?=
 =?utf-8?B?cWo0cW84djVmdFV1ODFmaWhlUDR6aXFldGN0ZTlaaUkycUFJdHhieXBmNm41?=
 =?utf-8?B?eUpnVnlvSGlSMGRXWU5GTHB0NGRDbHV0L3MzVEZ1cjRSZHNaR0tURE54b2ZV?=
 =?utf-8?B?bHFGb0IzZ0tndFZJM1AxMVpwMVhCUmo3aG5uZ1RIR05RVU8yQ01BQmFZdDdv?=
 =?utf-8?B?ZVNFVFJGM2djN2c4SDQ1dnZXTFdpTXJKVTFBYVJiSmxyRSs0WEFPUFNFaytG?=
 =?utf-8?B?S1JNa2ZWUEUvalZzQWl2WHVoUFhmTlY5SDkzR3V1dklubVNYT3k0QTJ3OWFR?=
 =?utf-8?B?WlZBMDFZRmEvZ1N4NmlLUHRNelNkWXR5RHNFMS9OaUpVN0kvbjZaYlluTXFQ?=
 =?utf-8?B?cHEzT0pVMHFicDd5V2hpb2lBVkF0M1E0WEtvYlc0MERNVkJwZUJEWldqeVVK?=
 =?utf-8?B?YzZOekZ3MVdEdzhZNWZ4dnJHbXVoL0c1K1N6c0tVL0dPNHFrTVFMZjNoMSty?=
 =?utf-8?B?d2VTMFhYUkg2Nnl1SEIwOFN4L016RlJ1THhYOCtCemF2YnFPTWhqNjh0NTRu?=
 =?utf-8?B?RlhUZ0R5TEJETHRSczBiRDQ4RTJySEdmYWk3VStIak4wMklBNGV6aUNFUFZw?=
 =?utf-8?B?V21SZ1ZvdnFJVVhhNnlIZ0w0dURxcFlscEFTUldrM1ZsQUVZY1B5RlpuRGcv?=
 =?utf-8?B?a2FNVXVwc0gwYnZpalYwYjR1ajBqZE4yM1EvSVpLK3AwV091dXFIbExLTlVq?=
 =?utf-8?B?V2ZIbTE2dFFpbjN0b1E4VkZza1VLVVJaZlFYc2RKNXAyYkN6ZmxKUzhYR3Y5?=
 =?utf-8?B?VVd4b2k0Y0M4TFFROW9tSWFKUVI1cVpzS2FPSG5NS09kY25IRldpNkhUc0h0?=
 =?utf-8?B?N0tUZkJjaWdQNTQvdWd0Z0YyS3JKc3JlQXR1OW5xb29MTWhLWFB6ekRpemta?=
 =?utf-8?B?clNROFlXSE5GZlJEVE9HRlkrckhVeDBEWHQ3ekpFazRuTCs5SDhzMkZUZ1Fo?=
 =?utf-8?B?bVNxQmlHd1BFSGsvdFlUNHVjcldIQUJBYTByQXBRN2NzTlFwRFRJQU0yVGpE?=
 =?utf-8?B?UU5wWkpxTVh2RG15eUF5U1hoVDFnZUZ3b2FqbzlMeHh6VEptVEJCNlpkZzgv?=
 =?utf-8?B?Q1d3d1hFZFFLOElnUHdnS3RLS2Zyc2Q5UFU4Qzl5OEpVOUVUODIyeXBzNmhh?=
 =?utf-8?B?NzVkZmZjS0w4YUpqVHNQWXo4RFQ5RStiYitWVHhxV3kxMm1nR0FnNEhCTXAv?=
 =?utf-8?B?VjFRVVMxVGRrQXNkN25BU2d1THNITTRtU2FlNEVKRGlKL2VyaTNFNGRZa3k1?=
 =?utf-8?B?RURUYkNKeG5hR2dUc2ZjOSt0VVBDWkttZ0IvRjNtakQvU29XNFBpU2xoT2dO?=
 =?utf-8?B?Yy9mcEJRY05EaDBjdDlDYllPcGs1Ky85NkNsUHc1SkNlcHNwWENtTmJ3UFl2?=
 =?utf-8?B?MlRtMFQ3cjNJVnlUeDdrUm9jSERWVXQxZTA5K0w5REp6a2dZTHp5RE13QjBB?=
 =?utf-8?B?R0tlMmc2SlB4R08zZjdudzlrckc1Ym1QbFZ4ck8velRWL1ZDODJwbFQ4ZFlN?=
 =?utf-8?B?YXZUbVZRU2hYb2JTeFJsSU5ZV01FeHVjaCtDUVIyeTNrZ2g2dGszT0JjWVcz?=
 =?utf-8?B?bmFIdkt0Y0FXV3JscjJvRmI3NFRqZ0xrcVozZ0hWbU1mVFowMithQWEySVhH?=
 =?utf-8?B?VllFNGNwd0paL0RlcXhxUHFMWlpUWXhCdXBLWmZRd2M1cG9UOFdoWHpsWjhY?=
 =?utf-8?B?Uk9XRjQwZHlOQ04rdWQ5RDZqeVBLOHdHMEFyUE1zU1lvcUYwQ3ExMWs2aW9F?=
 =?utf-8?Q?KXEB4XRQ/gHtfTTk=3D?=
X-Exchange-RoutingPolicyChecked: 
	wcOe8zQ8EY7hHhVHtVTSoPP+2N/1tI6hdUkb8zYGvcx+Xu2B17KLrXGnTMCQSf8SugUVb68rHi+McbSYbyckV0dmIkHA+QAf7aePDdIn4cKigt6xqzsUwIvgF1b+bGnyD4aUpXA6tv+c177WHOiZnVo5bI5St2wDhaL6nduD1JpkX0OL/OLr3892HafMGdZKmJv8mn6TJsHxpr8QI/2OtF1y+bHa94GeiKLyKt0Q0jB3VQyMcg6RSXMnD6AOrRQouh+Ddm5j6Vm7f8+FXNK7WYGnmknzfXi57fnzxflLzFzi2Ejurc+qVjjvNVi4gAnsKlFTde3oJ/Am76d7o4mSaA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5ef316-dceb-4c4d-5880-08de80a88293
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:30:37.0688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTZppY3vNyf41vH6Br/biDE4jUav1pBaFWPB4/CwNTOpABpsacU47Ni8Sv0RD+HYN42gFhB8y+rWCwS/GkYbnqLIlpi1ebAgLFd+4K/5Qbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: yqgnOXUgZtJu41cjku1g1E3e3k8d0dKM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAxOSBTYWx0ZWRfXzoDO4C5+BI53
 6QoaM2vs1CC6LiNnGSPeYdbmjvrZzT9jRlTO9N6W+5dU1aTnDYoQf260m9NOhPeEhiShwxSlnDH
 YrWvPwpcg0LckOg1ztH1xJAEsqHgegnD3TdtxAoNDIfQuSDhF05P9CopCP1wJ4TrB/Z1L27pm9g
 bbui+IQpQ0SKu49AxuvjpJouJ86fRmIQoyrUXA6//Z9GyW8LLZCn/wvziRYEmjZr8q+SUwKoBhh
 X/nydgt7q5J8RmwK7Sa/O3a2a98exUH+1gJHEQIJb+nxp8UTY+fPOw/YIYae7kLf2eLxxxlo2bs
 kyfQu6sziuZ96Jj0r7PEdNFeijGPTMDrb0LsNFw2OxeuFjSt1IKIcatqZ43k6LiSftwiBnH3gJE
 rqE9UzvdW4Wl8bwPPLjEIlx3YFaUkPQ5WYXBJOGK68/O5HobitsF+PWjooXsRvnE9JMVjRKH8cK
 HCCujYedlS74f6fmKXQ==
X-Proofpoint-GUID: IFu2hb8Jcd6zTeUhkO8FVuTYQGtsjfI6
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b376d0 cx=c_pps
 a=4YE3MzgntgO4dypjGrF/tw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=IvQJNAUUq8ru2VKf7xoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=7CQSdrXTAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=LJ0YB7QnO-PcATQw:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 02:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233019

--------------0rqKwa5l7bDyZJ3Sfzaf0R0b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62D196ZO1615005


On 3/11/26 10:27, Changqing Li via lists.openembedded.org wrote:
>
>
> On 3/10/26 19:44, Ross Burton wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On 25 Feb 2026, at 03:40, Changqing Li via lists.openembedded.org<chan=
gqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>>> PACKAGECONFIG ?=3D"${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d=
)}"
>>> +PACKAGECONFIG:append:class-target =3D " bash-completion"
>>>
>>> PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,system=
d"
>>> PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemming=3Dfalse,lib=
stemmer"
>>> PACKAGECONFIG[qt6] =3D "-Dqt=3Dtrue,-Dqt=3Dfalse,qtbase"
>>> +PACKAGECONFIG[bash-completion] =3D "-Dbash-completion=3Dtrue,-Dbash-=
completion=3Dfalse=E2=80=9D
>> I can=E2=80=99t see any other recipes that have a PACKAGECONFIG for ba=
sh completion.  Personally I=E2=80=99d just inherit the class and EXTRA_O=
EMESON:append:class-native =3D =E2=80=9C -Dbash-completion=3Dfalse=E2=80=9D=
 as the special case is native.
>
> Hi, Ross
>
> Indeed, very few packages offer this PACKAGECONFIG=EF=BC=8Cbut both oe-=
core=20
> and meta-networking have one.
>
> I checked several recipes that inherit the class but not provide the=20
> PACKAGECONFIG,
>
> all the recipes don't provide option to disable bash-completion. I=20
> think this is why they don't provide PACKAGECONFIG.
>
Here I means that the recipes's upstream don't provide an option to=20
disable bash-completion, eg:=C2=A0 apt, it will compiled with bash-comple=
tion=20
by default,=C2=A0 there is no option

to enable/disable=C2=A0bash-completion.=C2=A0 So they don't need a PACKAG=
ECONFIG.=20
But appstream provdes option to enable/disable bash-completion. so I add=20
one allow user to

disable it.

//Changqing

> upstream appstream provides the option to disable bash-completion, I=20
> think we should keep the upstream option.
>
> Regards
>
> Changqing
>
>> Ross
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232832):https://lists.openembedded.org/g/openembedd=
ed-core/message/232832
> Mute This Topic:https://lists.openembedded.org/mt/117989519/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [c=
hangqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------0rqKwa5l7bDyZJ3Sfzaf0R0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62D196ZO1615005

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/11/26 10:27, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:189BA872138654D8.2412760@lists.=
openembedded.org">
     =20
      <p><br>
      </p>
      <div class=3D"moz-cite-prefix">On 3/10/26 19:44, Ross Burton wrote:=
<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:C0CE5EB9-AB4B-40D5-B625-3C341=
19E3099@arm.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes =
from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On 25 Feb 2026, at 03:40, Changqing Li via lists.openembedded.org <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindriver.com@l=
ists.openembedded.org" moz-do-not-send=3D"true">&lt;changqing.li=3Dwindri=
ver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">PACKAGECONFIG ?=3D <a cl=
ass=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.utils.filter('DISTRO_F=
EATURES','systemd',d)}" moz-do-not-send=3D"true">&quot;${@bb.utils.filter=
('DISTRO_FEATURES', 'systemd', d)}&quot;</a>
+PACKAGECONFIG:append:class-target =3D &quot; bash-completion&quot;

PACKAGECONFIG[systemd] =3D &quot;-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,syste=
md&quot;
PACKAGECONFIG[stemming] =3D &quot;-Dstemming=3Dtrue,-Dstemming=3Dfalse,li=
bstemmer&quot;
PACKAGECONFIG[qt6] =3D &quot;-Dqt=3Dtrue,-Dqt=3Dfalse,qtbase&quot;
+PACKAGECONFIG[bash-completion] =3D &quot;-Dbash-completion=3Dtrue,-Dbash=
-completion=3Dfalse=E2=80=9D
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">I can=E2=80=99t see any ot=
her recipes that have a PACKAGECONFIG for bash completion.  Personally I=E2=
=80=99d just inherit the class and EXTRA_OEMESON:append:class-native =3D =
=E2=80=9C -Dbash-completion=3Dfalse=E2=80=9D as the special case is nativ=
e.</pre>
      </blockquote>
      <p>Hi, Ross</p>
      <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><=
span class=3D"ryNqvb">Indeed, very few packages offer this&nbsp;</span></=
span></span><span style=3D"white-space: pre-wrap">PACKAGECONFIG=EF=BC=8Cb=
ut both oe-core and meta-networking have one.  </span></p>
      <p><span style=3D"white-space: pre-wrap">I checked several recipes =
that inherit  the class but not provide the </span><span style=3D"white-s=
pace: pre-wrap">PACKAGECONFIG,  </span></p>
      <p>all the recipes don't provide option to disable&nbsp;<span style=
=3D"white-space: pre-wrap">bash-completion. I think this is why they don'=
t provide </span><span style=3D"white-space: pre-wrap">PACKAGECONFIG.  </=
span></p>
    </blockquote>
    <p>Here I means that the recipes's upstream don't provide an option
      to disable bash-completion, eg:&nbsp; apt, it will compiled with
      bash-completion by default,&nbsp; there is no option&nbsp;</p>
    <p>to enable/disable&nbsp;bash-completion.&nbsp; So they don't need a=
&nbsp;<span style=3D"white-space: pre-wrap"></span><span style=3D"white-s=
pace: pre-wrap">PACKAGECONFIG.  But appstream provdes option to enable/di=
sable bash-completion.  so I add one allow user to</span></p>
    <p><span style=3D"white-space: pre-wrap">disable it.</span></p>
    <p><span style=3D"white-space: pre-wrap">//Changqing</span></p>
    <blockquote type=3D"cite" cite=3D"mid:189BA872138654D8.2412760@lists.=
openembedded.org">
      <p><span style=3D"white-space: pre-wrap">upstream appstream provide=
s the option to disable </span><span style=3D"white-space: pre-wrap">bash=
-completion, I think we should keep the upstream option.</span></p>
    </blockquote>
    <blockquote type=3D"cite" cite=3D"mid:189BA872138654D8.2412760@lists.=
openembedded.org">
      <p><span style=3D"white-space: pre-wrap">
</span></p>
      <p><span style=3D"white-space: pre-wrap">Regards</span></p>
      <p>Changqing</p>
      <blockquote type=3D"cite" cite=3D"mid:C0CE5EB9-AB4B-40D5-B625-3C341=
19E3099@arm.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">Ross
</pre>
      </blockquote>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#232832): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/232832">https:/=
/lists.openembedded.org/g/openembedded-core/message/232832</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/117989519/3616873">https://lists.openembedded.org/mt=
/117989519/3616873</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------0rqKwa5l7bDyZJ3Sfzaf0R0b--

