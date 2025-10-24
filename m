Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FFECCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 02:42:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.943.1761273774062379944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 19:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Y93S6iDA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2392b4e295=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O1ohm81045918
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 19:42:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=bHrNgKXv5ba9+3/nVhh6iowEXi2mbnuu6v/GEr8NbS0=; b=Y93S6iDA8wBU
	TGlrTsrLDg1gTHur/GGFx3mkbm0AMXESt7tAWdPAOh7x0gbHoNGScuM8J4B69Qx7
	ydNypu/7iDtUixDkrSodZER9sR1pcHuiFbayOixyFNmKsF4UTy4lQ/MdmgGr4yFo
	q21CXaHSqKwSvPTIrzQoiuGcR1ZmDXpBiE+XTHoRG4IEPnZ4oK8+95xXMODieuLL
	h6X++EtnJOd328dbBayv7151zYKW0I+3CFPpX51UM2SuO2wYeBDfPBSSMH0etwS+
	NAzJl9XUxxKzgiUJONO9jCpjIJYyVIcVA6IdB2nwLU0EOIRW0ykN1weEYbmRxlC5
	4qlkriLcXg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49ys00gctq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 19:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRtBAVnG6VjczfbKGKSzoL8bZ1IKD5F3LLdi3YD59KDJkU1rSwI//Wt538Tp9U3FlphkBlV4v63fz2l22fNwrfRLnAxBVafgiVz25tccFnMNKLXfXq4e5Cy7w3uFQNSiPyCcK6fwJ3QRjuIUkEyHEafpGMYa1H0c16BAgeo3rOQutUWja2v6LCRVPZokMSehuseMzQmminhlAaH39rIFSAsfzx1I9zOFFJZNV2Kf3nzGjFSDAqgu34XfMwygiRGh3flldPgoLSgX+i8gV9ummsljIpeoYa99ED7OAd6Hj1PYO0dPy4T1CxPE3zLaD+SpYMbsQq9FjZp7zQ456PS/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHrNgKXv5ba9+3/nVhh6iowEXi2mbnuu6v/GEr8NbS0=;
 b=VJ+iuyfd2+7or1bCfdA11fk3+3pggMVwiHwaYtaeiWzou9eSstpivU7g+u8MZkvPOVTomQ+jafwusz/g/WTRctkaR6vecW9/L4uwM+Yv/elUE45dwM0Xz6moLY4u5zLP6qwgyOVw8o48IvZn8EHNVt7vgfmxoHaKV6fB8muyEm0ygmgZv7q3HHEnbDrA6UejJK3ve8GQYjttLpQbsw4U8KpDyx+r8oGmAtlv2XODpjows29wV5sRgymV8XzYxJdmM4xuNHuRSPGsDXJS7wNB54UH/pZbtZesxBtwry39+QZ8E5B4VM+WlLad3sqfbt83r0+B3GQAalefhDj3reb7ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6086.namprd11.prod.outlook.com (2603:10b6:208:3ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 24 Oct
 2025 02:42:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:42:50 +0000
Message-ID: <8bbd0c8b-5614-4448-95b9-21a41b0cf599@windriver.com>
Date: Fri, 24 Oct 2025 10:42:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V3 2/2] systemd: upgrade from 257.8 to 258
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
 <20251016084700.1537381-2-Qi.Chen@windriver.com>
 <DDKQEKP5R8RA.185ZCAGQ6EA07@bootlin.com>
 <DDLHVDCXIV53.3EI69FW87CCB8@bootlin.com>
 <20c03386-14b5-46d6-b72b-24a1957ee15b@windriver.com>
 <DDPQZWRSRHB7.112430EANEZH8@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DDPQZWRSRHB7.112430EANEZH8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU0P306CA0027.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:16::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN0PR11MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec06e48-a852-459d-45fb-08de12a7059b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VUZCc0NnbVpvTUtYSHpxMkVFejhJb2w3a09lc2tNb3FZampjWFJ1eHdMU1FN?=
 =?utf-8?B?YnAzYklINkVZVTVIQlhwSTdyUTZyZGtyOGw2ek1kUlM2MXZhS1VhY1pXWW45?=
 =?utf-8?B?d05ZQS9wNVNkVHlJYjAyWE0xWXduTE5ORy9UU3VJV1BYdHgyNSt2N1pzREFq?=
 =?utf-8?B?RHZwQVAvS1dpYUdiYlA5cW1Pb2QzczVKdllsZHlSRnVXaFI2TTNUZnhWMFcv?=
 =?utf-8?B?YmZtT3hlUE9SalgvZ09sSHRXZlBsN09HK1AyalpJRTBEbDhxMUNWelpLQmdK?=
 =?utf-8?B?Y0I0NHJmL0RDaXpSdDRrMVpYTndqVDEwenpnTm4wZ1orWk5TWmFBaTJ0bFll?=
 =?utf-8?B?czIzVzd6OEwxaG9aT0Y2RFpMWHhGTDdIM3AyN1kzL3R6QXAwbkpuZlIyeGg2?=
 =?utf-8?B?SGhGeGYwY2pmYzVLdi82UW9odXdDSVY0VktNWlZMUUFkc2IyU0IrWElZVjRQ?=
 =?utf-8?B?MTlQR1k2RG5UMzhxcjZGT1JjUWRxQlVwZ1hGM2tCa3Jjc2FhMnhyNlVYZzEx?=
 =?utf-8?B?Ly9mbW43K0ZOYVNmNTJhWnhIN2FvT3BzcnhLRlYzWnpvWE5IS2JZMDZFUlor?=
 =?utf-8?B?dkFXM29NenJpbGlEY0hCYUxPSVMwemtZSHo1TzRuOHgyZHpVNGJCbm1kNTky?=
 =?utf-8?B?TzVpUC80Vk9peXljVXVrU1pCSjZPbHdMOFZYcU9CY1pUYTJWL0hLYWlvU2Rw?=
 =?utf-8?B?SzloUXRXR29mYVhSWG9uL294RXhFZlFSV21RRk5BaFprYllRQklMZkFKZTZJ?=
 =?utf-8?B?Um4wYUk2RUpyc28wUXFrTHUxRGJhYXcyYmxpczlVRmN4TkpHQW9RNjRiU1Nl?=
 =?utf-8?B?VWNweTVUNE03SXZmR1c5cG9aK0JRK0w4YlhyOGkvbm9pU2FOKzZleG40QlBj?=
 =?utf-8?B?TzZCMlliSjhWeEo3UUtLQWI1L2RCT3oyUTFiUUh3TlZHcDI2d3RaVGkvazdU?=
 =?utf-8?B?bE1Wa25zUjVrak9uOVE1b1cvTW5WaDhsM01vak82NFdXNEZvZVp3b3pHWkFY?=
 =?utf-8?B?bXdwWlIyUElkU1lINUNOMmtvRXFkY1FZOGd2b0Q0MlVnRkpvWmY5RkxBUTFD?=
 =?utf-8?B?aFBPSS8xSjJ3cjJtQno2QVRyeWdxdS9vZVhMQk0wLytLR0ZZbVRQelNySUFm?=
 =?utf-8?B?bkEwNTllbGQ1NWNielhSTUd2KzZaNWdWQXFCYzhIVlE2djQ4ZDhBdFJZaENC?=
 =?utf-8?B?Y3FmM3BWN0MwZ0ZaL1VsUU81LzVZNE1Gb1pDQlFHWGdGdHFZTDVGUVk3MDJU?=
 =?utf-8?B?Q1dINll5emxhY3pYUGZwZ0FZZU14WXg5alBvUGxFeExDbFphaU9PbklOS1Bv?=
 =?utf-8?B?Q0phWjltK08wbGFRMUVKREZDMG5sYkM2T054UkVXRmdYYlBMellWanAvdlJu?=
 =?utf-8?B?UmtpUUdqVXh5bFZLZUhiL0JGNDhNTUxZQUY4cGFQb0tzNGJmMlF6anVCS3BM?=
 =?utf-8?B?Wk1yK2V6QWN2bklYdkZLY1pRc2NabllSQ3MyY0hGSmVuZlhaSDhwUnpaVzZM?=
 =?utf-8?B?TkNlTXlSK2h5VjVaajBaVE9UQjh4REt6bEwrMjkybG94OXFzRXVISStUa2N0?=
 =?utf-8?B?ditmai9DbmhCYkZXQ0dNQWo5RGl6NzRhcmltb3kxYTNOZi9XcHBYcytxcGNp?=
 =?utf-8?B?MWdjWGcrSWhWZnhqSVdBQlRrb1lZRWJiUEc5cElvN0JFb0xIVG1sUVJ0cFFa?=
 =?utf-8?B?WkFkWEFPRkZKNUdSeTByUlZvY083MlBCaFlVSjZnU2xtVnlXUGYrL1dRakFF?=
 =?utf-8?B?aENhOFgwdlZSb3psUXpWNFZBdVFPTC9DWlRIWENBaVA3WTNTRUc0aGtqUWt6?=
 =?utf-8?B?N1B0Q2xkbmNuWU5kSlc3MVBNWXVIRXVSTGp5YjZUWG1CcTdqanl2VTZsUm56?=
 =?utf-8?B?NDYwZ2xjOWdtci9jek04d0ZtbWYvRDZKREd3MjRRZ3FqVUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VXlsZmpDaTM2TW5kaFBGSVFIcmFPMFNZZHJiYzRRRFd0MUJIdkhhbDlvYnh0?=
 =?utf-8?B?UHJCTmNjZDNnT3pzNFlvZHBrWjQ5WjJaOFFXN0kzUDRhaXloTUhFWElqcjZO?=
 =?utf-8?B?QXhSQ2I1U1ZIaVJZQlZMeVZMRnJnbXVCNXhnbnh6WWpJNGYrUVdnREE0WWFp?=
 =?utf-8?B?TytNb0NaMy9LT0lBdFFqazVTNmU3NVRLeG02WGJQa0R0SDNjd0NMZmhzSUJ1?=
 =?utf-8?B?VXd1UUgwZFZqdzRzb0o4UmtvZXNUUmFVRi9YZTJiaThpSGh6eURSRW9aRnYx?=
 =?utf-8?B?OTA1ajc2dWQrd1c2K1dnbnFTaHB5d1J5QmRURW9XL1pvMnlYaEZXS0RzOHNa?=
 =?utf-8?B?aUNJYWF3MGlPSVI2ZDRBUWF3WHJCaTgzWE5yN0lOQ0JsbEkrWDZteDUrM25H?=
 =?utf-8?B?ZDRuaEFOYTZWNE9Ddkh4N0tsMlBRZ2hpalZvWkYyblRMNGxTemFwMnBQUzdE?=
 =?utf-8?B?VWFmOGFFWDQvUzFkNVI2WktrUVlXd0tiZCtJM3RDZ21qRVJENjZ1eWRNd0d6?=
 =?utf-8?B?aWd1ZllBR3lCZ25Id3NMS3E1NndKeXYySVROWTQxaWo4RWJpSnFlZENieXJT?=
 =?utf-8?B?bEZCMHN6S1VpU3hlMUF1VFptQ2dZSjRraHloZXV0TFBMK0FhWVZiS1ZzdGQ3?=
 =?utf-8?B?V1U0aTV4U0pLTW5MRzEwSHhsVVR4TkNkVm5wYXZzdjFSd3lpWkRxYi9YOFh0?=
 =?utf-8?B?d3c1S0w0b2NzL0dROEJPNWlXdHI5Unl2R2VyV2NaSXpheTVielMzdFBrWDgr?=
 =?utf-8?B?ZDU5dGhIV1dLdllxR2dxNWxKYm1WcUVDWGxCZUhCMEJlZTd6VlV4TGFtSURW?=
 =?utf-8?B?TmY3aVBObEV6T2dOai8rZVZ2S2xwTVREcEVwVEtESkQ0NWtpeFlSWHpsN29L?=
 =?utf-8?B?N0R1b0VNclRKcmd0alZ2ZGRIa2lDcU9od2o0NFdMMERpWjdUcXJnazlZdWdW?=
 =?utf-8?B?ZXRONERlbkxXRGNMK0xMTmRvRitnbjJvYVlOaGFpTGJmYVVFVEx5cmM3Y1hZ?=
 =?utf-8?B?UEltWS8xS002Ujd2MTRQVkRpSlRVTjk5ZUg4Zi9CQ1RKeW1HU0tFVnJxeklQ?=
 =?utf-8?B?UUJ2aEpUK2dRZCt3NU5QRjZyMy8zd3R3MnV2WGMvQjZlcnJ6ZlJvc3pFOGRi?=
 =?utf-8?B?ZFVPUlcrWGI0QmlEL05UalFCaHBOeXJBTWFqWEE1bFh5UVdhRHZQa24rME5i?=
 =?utf-8?B?enNpa294amtwTDM5SE1WT1VoTEhEaG9QclcxRHYyUDZ2NEtUbFFKSkk1MU8r?=
 =?utf-8?B?Vmw2SloyVHFrTCs3MXZIQ1RCMXoxZ1pBYW5HN09yeS91TDdsU1NqT2JLRDd2?=
 =?utf-8?B?blYrR0Z1a2RORE5CY0pmM3ZJaGlSUHBaNWUrS2NEa2E1S0VrUlRuNHBzOXBz?=
 =?utf-8?B?S2wzK1pGSFBxM2g2d1d3dVVvVlRQOEM2VFdJL2VCL1ZtUUg2OGJGNC9jUUpT?=
 =?utf-8?B?UWRPaDlrdWJUU01yb2xRYTl6aVNGcy9tU2l0VWY1bWd4ZTZTUis1NTdvcy8w?=
 =?utf-8?B?VVlKanQ4SFpkTHhjR1dpaG53VzZ3K005YlphMkxNQVRqYmNyT2hiMmk1NURh?=
 =?utf-8?B?RUlmbUdSTDJ4NkgwVDFNOEtUcVpuOUJBM0J2Q2NHSWpRQWl6ZWxYSFhGRDNv?=
 =?utf-8?B?NEp0UE1HVGZVOUo2Ly9PWmpUYUFKaW1VY1I4R3ViZklQT3pKbjUyQi9wRGRp?=
 =?utf-8?B?OXNiYnJoYkZvVjJDUElJTE9XcmZ6bnJKOERsSGtwQURTN2xXNnR6M08yR0NU?=
 =?utf-8?B?eldadDEwVnkrdGx4KzF5MlZQczIvcjhZL1dBajFQejg5QVc2WEcraHNGQUk4?=
 =?utf-8?B?bVJySElIQm9mT2tGbU0zM2kzbGgzNlROZGRadVh5WnEyc21zYS9SczE5R1V0?=
 =?utf-8?B?L2xXYk5vUE5Qa3JYN0xQVjdrSVI2bGRzREliMUVTalV0Q05UdElCem8vU0Jx?=
 =?utf-8?B?MitXdXBVL0xUdXI1REw2L1ZyeGsxMkdyTkhRdk01ZDFCU1N5cmNUSEx5cjhV?=
 =?utf-8?B?Z2ZsQm45UHNqb1NURkd6VE1ZMzlGY0hDc2xmeFRYaHdVNDhyOWpRdDQ1eDg3?=
 =?utf-8?B?K255ZWVFVGtRaGdzMzg4dlR0dFAyK3hEK2p5WUxHblZrT05vTkJYaENoTlJt?=
 =?utf-8?Q?GEIqAhzBtTXwNJNr3r8PnDtWu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec06e48-a852-459d-45fb-08de12a7059b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:42:49.9694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfsqzCbx9HfNym7rG59N1xB/Hrfp0HLgp1l3tdBSbK1Ic9/IScJ2FmHG6ADpOpPZ7+HkvKD29IauC2hBK48y7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6086
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDAyMiBTYWx0ZWRfX82dCPelEWyvc
 wvBnT9SD1//kfMqAHMquo1Sm49+VrOBFcZ0ywTp6OTblSgGdE0Qz+gw9d6bquvxs/Z5kOsjykA9
 /oE8zytpnOV+YwEse1wIVSzBjX7eszEO/FmFLyXEYv6JhklLhbQGuEOtFpRnErKWODIRdp6KUR7
 5LM5ubGSqRazPm81MJDe/Nc+CpxOOHQEGT4eUrEIRq0SswpI8yQonOx/BifvWcGR2XYbF8BsViF
 DVsYowj56v9VXZKmSGETtJallLj1IbPUcLOdHyzYAvMeiRsYNAf9r6Y4n8DA3U4IrsatpPVp3W+
 1XFj//QDrfTBWM/W3rLZ+jby0cTWuWzpDscjHWdohFMbxiAXdImEMo9BBVMMQx3kIHYXt0td8YJ
 Tcv6k+qn4+IP3dDB+Lge43XAFZK06g==
X-Proofpoint-ORIG-GUID: FlXRbDV-bvpBauWbcuF3zKDGsQyj8XAg
X-Proofpoint-GUID: 4Tg0QVz7QRsGiaZac0XW5owmJ_-CnciK
X-Authority-Analysis: v=2.4 cv=N/8k1m9B c=1 sm=1 tr=0 ts=68fae7ad cx=c_pps
 a=h6NrD5D8j3GnK3ckJnoRDA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=f-49r9t1ufCkH1rh1S0A:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510240022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 02:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225279

On 10/23/25 21:49, Mathieu Dubois-Briand wrote:
> On Wed Oct 22, 2025 at 5:28 AM CEST, Chen Qi via lists.openembedded.org wrote:
>> On 10/18/25 21:49, Mathieu Dubois-Briand via lists.openembedded.org wrote:
>>> On Fri Oct 17, 2025 at 6:18 PM CEST, Mathieu Dubois-Briand wrote:
>>>> On Thu Oct 16, 2025 at 10:47 AM CEST, Chen Qi via lists.openembedded.org wrote:
>>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>>
>>>>> 258 Release Changes:
>>>>> https://github.com/systemd/systemd/releases/tag/v258
>>>>>
>>>>> The 'runlevel', 'initctl', 'telinit' related contents are removed
>>>>> because they are offically removed in v258.
>>>>>
>>>>> Disable tests explicitly. This is because we're not installing any
>>>>> tests. There's no point building them out. And this puts extra burden
>>>>> on making things compile for musl.
>>>>>
>>>>> gcrypt and gnutls PACKAGECONFIGs are removed as "OpenSSL is now the only
>>>>> supported cryptography backend for systemd-resolved and systemd-importd."
>>>>>
>>>>> musl changes:
>>>>> 1. This version has big changes in musl patches. The goal is to
>>>>>      help maintenance. I want patches to be more easily applied
>>>>>      to new versions. The count of files modified by musl specific
>>>>>      patches decreased from 113 (v257) to 34 (v258).
>>>>> 2. All patches are re-evaluated.
>>>>>      This version of systemd introduces big changes in header
>>>>>      files and other places. So the previous musl patches are
>>>>>      re-evaluated one by one. Those that are dropped are considered not
>>>>>      needed. A few new ones are added. There are some notable ones.
>>>>>      0012-do-not-disable-buffer-in-writing-files.patch is dropped because
>>>>>      there is not runtime error.
>>>>>      0016-Fix-the-segfault-for-glob-related-codes-and-define-d.patch is
>>>>>      added because this version of systemd uses strv_free to free gl_pathv
>>>>>      instead of relying on globfree provided by libc.
>>>>>
>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>> ---
>>>> Hi Chen,
>>>>
>>>> Thanks for the new version. Still, we get some errors with post install
>>>> scripts:
>>>>
>>>> ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['bluez5', 'ofono', 'connman', 'xserver-nodm-init', 'avahi-daemon', 'rpcbind', 'run-postinsts'] have failed. If the intention is to defer them to first boot,
>>>> then please place them into pkg_postinst_ontarget:${PN} ().
>>>> Deferring to first boot via 'exit 1' is no longer supported.
>>>> Details of the failure are in /srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do_rootfs.
>>>> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do_rootfs.2882514
>>>> NOTE: recipe core-image-sato-1.0-r0: task do_rootfs: Failed
>>>> ERROR: Task (/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedded-core/meta/recipes-sato/images/core-image-sato.bb:do_rootfs) failed with exit code '1'
>>>>
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/2590
>>>>
>>>> Can you have a look at these, please?
>>>>
>>>> Thanks,
>>>> Mathieu
>>> Sorry, another issue that I've just identified, during image tests:
>>>
>>> Traceback (most recent call last):
>>>     File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/layers/openembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>>>       return func(*args, **kwargs)
>>>              ^^^^^^^^^^^^^^^^^^^^^
>>>     File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/layers/openembedded-core/meta/lib/oeqa/runtime/cases/parselogs.py", line 185, in test_parselogs
>>>       self.assertEqual(errcount, 0, msg=self.msg)
>>> AssertionError: 1 != 0 : Log: /srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato/1.0/target_logs/Xorg.0.log
>>> -----------------------
>>> Central error: [    27.402] failed to find screen to remove
>>> ***********************
>>> [    26.897] (**) Option "Device" "/dev/input/event1"
>>> [    26.955] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
>>> [    26.956] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
>>> [    26.959] (II) event1  - QEMU QEMU USB Keyboard: device removed
>>> [    26.991] (**) Option "config_info" "udev:/sys/devices/platform/3f000000.pcie/pci0000:00/0000:00:02.0/usb1/1-2/1-2:1.0/0003:0627:0001.0002/input/input1/event1"
>>> [    26.991] (II) XINPUT: Adding extended input device "QEMU QEMU USB Keyboard" (type: KEYBOARD, id 7)
>>> [    27.049] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
>>> [    27.051] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
>>> [    27.401] (II) config/udev: removing GPU device /sys/devices/platform/3f000000.pcie/pci0000:00/0000:00:03.0/drm/card0 /dev/dri/card0
>>> [    27.402] xf86: remove device 0 /sys/devices/platform/3f000000.pcie/pci0000:00/0000:00:03.0/drm/card0
>>> [    27.402] failed to find screen to remove
>>> [    27.428] (II) config/udev: removing device QEMU QEMU USB Keyboard
>>> [    27.431] (II) event1  - QEMU QEMU USB Keyboard: device removed
>>> [    27.472] (II) UnloadModule: "libinput"
>>> [    27.508] (II) config/udev: Adding input device QEMU QEMU USB Keyboard (/dev/input/event1)
>>> [    27.509] (**) QEMU QEMU USB Keyboard: Applying InputClass "libinput keyboard catchall"
>>> [    27.509] (II) Using input driver 'libinput' for 'QEMU QEMU USB Keyboard'
>>> [    27.509] (**) QEMU QEMU USB Keyboard: always reports core events
>>> [    27.509] (**) Option "Device" "/dev/input/event1"
>>> [    27.567] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
>>> [    27.568] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
>>>
>>> ***********************
>>> 1 errors found in logs.
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2588
>>>
>>> Thanks,
>>> Mathieu
>> Hi Mathieu,
>>
>> I reproduced the postinstall error you mentioned in another email.
>>
>> But I cannot reproduce this one. I used 'poky-altfcfg + qemuarm' as in
>> the above link. Is there any other config I need to use? I referred to
>> the 'Write config' step.
>>
>> Regards,
>> Qi
>>
>>>
>>>
> Hi Qi,
>
> I've been able to reproduce the test failure with this branch:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=mathieu/systemd-upgrade-tests
>
> Following config in my local.conf:
>
> ---
> SDKMACHINE = "x86_64"
> OE_FRAGMENTS += "machine/qemuarm distro/poky-altcfg"
> EXTRA_IMAGE_FEATURES ?= 'allow-empty-password empty-root-password allow-root-login'
> IMAGE_CLASSES += "testimage"
> ---
>
> And then just:
> bitbake core-image-sato && bitbake core-image-sato:do_testimage
>
> Hope this can help you!
>
> Thanks,
> Mathieu
>
Got it! Thanks a lot!

Regards,
Qi


