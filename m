Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9C5C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 05:40:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.76645.1717393211686676963
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 22:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=688488c23c=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4532gdi2008687
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jun 2024 05:40:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfrux9fwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 05:40:10 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4535eAxJ027621;
	Mon, 3 Jun 2024 05:40:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfrux9fwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 05:40:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z74s8xTYd61y+KZUGrzXDoCaG4XOxD/4l+TBitoFCpBLP/368BTWxh+zfluGfhgrLuDNdV9qo76NBbhSXqChZekPuOxm4Q/PzGfw79d6YgzDZJD2kjiMf/MrTQuwYTk9d6vDfD0cZx2R5vZLGl9Yb1RA24rtN1YtIBUJskQUCQ2Ih9f/c+r6rBwFkZooDRHGTDZKtDDidJX4KcsABfsa72+qQghB4gFFmr1JFCdXfF+/iE2WnzcRpp4rBkBaUSnDpJp8sBM3wvuoPyErhdS7lCg8VTUBcQCN5MsHtcipde7KW14yVlexco72HCfK4mYcXHAVcvLytoVHWXIfnMZokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogHXviMdUG63iLAk8hty7YU+dFAOugNs8cAcX8wWcVQ=;
 b=egX+8lZID+Kk+Gh21EkqLTwlcPuIDC7MwSL7BNr13ZVCKGnJtaEIrkZq4W+PXndiK4Hu6fRvOUPMo7U/2TCTyPzAto3K/J02d5jVlc14M68SpOLIw1zSXIL3dZTi6cVVRn0+wCGXbND62ney2i5reVQwtpEVou7/xhV1YuS39lf/bw2XkIw4QsRhH3kJHgQ0BbJeK4GfYvBKL6Pmww2D9gT9QYyuqTgWJxBoPMXGvdZoEhUou9fJhjA9P+57Rg47BbQcpu245v9bMODycuyfO+mlUnwRfuBkGrRnjYjSlvhDTLvp2518DlsB4SMPJ+NLYE6ja9wrl/FEQHJwC+3+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 05:40:06 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 05:40:06 +0000
Content-Type: multipart/alternative;
 boundary="------------CgPv23Alv2WERA97Q1gBln70"
Message-ID: <5285f1b4-3154-4073-ac54-e02b8ecca88d@windriver.com>
Date: Mon, 3 Jun 2024 13:39:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 13/42] gdk-pixbuf: upgrade 2.42.11 -> 2.42.12
To: Steve Sakoman <steve@sakoman.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
 <1716369289-22526-13-git-send-email-wangmy@fujitsu.com>
Content-Language: en-US
Cc: wangmy@fujitsu.com, OE-core <openembedded-core@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <1716369289-22526-13-git-send-email-wangmy@fujitsu.com>
X-ClientProxiedBy: SI1PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 83698a77-b034-45ad-0465-08dc838f9f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dlV0VDJBWng5T3RMUGEyUXVERjh5Tm5VMUFYazNybXd6cDZyZUlGc2lRTTk2?=
 =?utf-8?B?ZWFRYWhES2FMR2tlbEtvdEhDeEtvdjMrQ3JiMGhKUSt0UmZSMy9JSDltUm5z?=
 =?utf-8?B?dktXcEV6WE9STW9zVDZ2ZGtuVFhLcnUyS0dHdFZPK2FmcENRTFZjWlhudXFa?=
 =?utf-8?B?aVE3c1Zia0pTcWRmdjRkMzBxbDhoNTFSVFpMTGZuMG1XZlFZeHhxSGE5MVJ6?=
 =?utf-8?B?Vi9VQTA5a1JuNko1bHNJdDZjS2RoVXNZNGRxSVhwSWVsVjJyaGtxbFVycmU5?=
 =?utf-8?B?WFpkUXI2U3d5bHJtMFFIbzRqVHIrY1dTdG5oemRwZjNNREJlbWcvZkFJYU5x?=
 =?utf-8?B?cFJyeVNPVDdPdDdldXFJZGV4enhGQlduRy8weXpnVUk2UndrVWtmdEtFR2ZX?=
 =?utf-8?B?SllEQjRURXk1aDhyZFE3YmJUSm03VFNxTFlTaWhFTyt2c3pIQ0EwYzRHa1FD?=
 =?utf-8?B?aVRYNFo0aFQrWWpnaFNSZlQzTVZLZjEyLytmeHZnZ0RHUVV5MUZ3WFdmSjdJ?=
 =?utf-8?B?b05GTG5HNWJjV0VxYnJUek9Za1V2UDhBYUVKbVJPZFN1U0RaT1djUWZhdHNW?=
 =?utf-8?B?NTdDTnRhNEZoUHVTZWttdHQ4cDYva0JXRW5Tc05vTlJMYlJubDdKOWdsK1dj?=
 =?utf-8?B?blJuQk9yc3lkYTFubmFyNHJ0TkFua0F1MHBNWlVia2V6cXByeFlLWk16N0xQ?=
 =?utf-8?B?ZnNSNUpsSFF0aWRwOCt3ZHhFMWl3bno0NDB3YUpoeDBCQlNXZ0dGaWV1a003?=
 =?utf-8?B?SE5SOFNDRDdQQ0pESzM3Rm4zaXcwZVpaSmFWTU0rK3paQUhEcHpld015WWQr?=
 =?utf-8?B?Nml1eGxoUEhHRStjVjVZYWNSSVU3dUMyUnJKVUl5UXJqUEg5eFdqeEtiMGto?=
 =?utf-8?B?WEtEN2Q1ckMzVkhDMEd0VkpuTXM4TVpZWFZZall2UXJPaG9PZWxXU3ByZCtD?=
 =?utf-8?B?VU54c2lZQVpKYVpUbHhvRkN1T3lKcUNZRXNxWi84M2JXSGxETStEZTNaN2l0?=
 =?utf-8?B?akZQTHRvYjVVTEVhUHlDUVpmT0ZHOWsxUW9sYUhBeFRManpJY0JaYTNad3Nr?=
 =?utf-8?B?SXhJMUlWbGlhMlk3SllKekw1S0FBakVJR0RTbVRXSlo5MWtkd2llR0pYMjVz?=
 =?utf-8?B?OFZXUlV1b1JrNU50RDVKR0MxVkROZnkvbE1GQXFzNUxmOTRmdkNHRW02M3Ew?=
 =?utf-8?B?KzJGOXFRamhNSFM5MExxUzVrVmY0NFVKRVB6ZzZYVGRZY0FWRjVhWXg3Zmk5?=
 =?utf-8?B?SUsvL2ZKV1ZFTjNWY1JPRFhUcFpmeTFHbFF0RGZkSnpYcGgvN2thcFRjRzRL?=
 =?utf-8?B?ci9RQlJNa2htS0JPVVM1cjNndnZkTm82dGMxcFZJVWxILzlVSitDT21adHFU?=
 =?utf-8?B?OUNaenNKU1JKWjcyU041TmpaUUYrSk1QU3kyWEtERVJXQU81TTQ0WHFBVE9r?=
 =?utf-8?B?b00veHErOTdUVVJzVWVSRUlYa2s5dUE3WU9OeE0zYm1zQ0lqTSswdVU0K240?=
 =?utf-8?B?RHFwQ1lmSHRPck5aNmFWRSt1VTFWRXVJZ0pYUkZzakp6bnlnZklJTkl5THlD?=
 =?utf-8?B?Vk50OFZKUjhYTCtiL1lBWVk0WU52alN6aXdQSk5MakhhOE9iWXpqWmY2ekJq?=
 =?utf-8?Q?bafQYOyu0tpKHrAmj5KmfO+q/0FRnT8Mz0eGRWh56f9w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1NYVW1KdXcxTk5yNzE3Um9mN0kvb1NZUnl6eEI5dm1IOWpEaUM3dUs1TEM0?=
 =?utf-8?B?Wkw5Qnp6TWF4STFxelVCRzNBRVdjRHVLNDNwL3RESytWYzR4SzZjREduWm1E?=
 =?utf-8?B?bHhuUE9HR0l6Rk5kQXpKMG9CbVhNWWVDWGU1NU9Oa2tTQVBLZzNoNkFjUWE2?=
 =?utf-8?B?OHJCNUxoR3kyTFdkeUZhYnJxQlZZODlGdHpNTXR4NlE3ekIxVm1BOHFNZ1BH?=
 =?utf-8?B?NXJXZTRxam8wemwwUDVzc2hyYmdiU21ZQUlZWUhzVFYrWVE3bWRkZ2JOb3Jt?=
 =?utf-8?B?SENHeWFzdjRtSk1RWTlsZU1KNFowejh0Q1ZHWndndDd2Y1R3U3BadzM2Z3Q4?=
 =?utf-8?B?bDVJR0RhdE9PMVoySllhK2U3RWtQNkRDOTljVUFpZUgwWitreTFzUmVyZ0NC?=
 =?utf-8?B?WTFLZWsydFJuTkh3bFl4eDRlSjF3OEJVYkdPbnBJaGN0TXVjd0QzUngyUFpp?=
 =?utf-8?B?N1VLaFZZb0taaFBvSXVld0ZnUHZYV2ptdFY1WmJsZ0xqYW1GRG1rVmdUREp3?=
 =?utf-8?B?NnRHZlhnZDI5SndxZUZSNkpSWUw3b3BsZ3R4aWpGb2Z4T1Y4SHhJR1lMOUZ4?=
 =?utf-8?B?SldZMWROdkpDNmR1NnlacHJhMHdJc1RGbHRQNUJjSkdHQmtiV2pxZ3grK2xj?=
 =?utf-8?B?SVFkVTBHcHNteVJzME1tem40Mm9iRy9VWndJRU5XeXFzRWhpSkxXZDlTVXBK?=
 =?utf-8?B?cUlUTWtaeE44QzBPNlU3dDhBeE9oa21JS3o1ZC91VTRoVjltNUxpWlpWUllv?=
 =?utf-8?B?Qi8zU0lPS3ExZlpuUy95Q3M3SWI5WDV4REMyWXFtSmRmZXNLOGpDRHR3ZWhP?=
 =?utf-8?B?UmZWY2F2OUtsK05Ja1E0aUtWd0JVRjM5TjRvZUZzV2lpZjVXQ2YvQ2Q5bVZF?=
 =?utf-8?B?Z2Z4QWsrbUlrVzdVR0RHWEtYM1M3VExNSHM4Z3ZjSitJU080cGlEUk5ibm9R?=
 =?utf-8?B?bWFqZ2JibUlwMlExQjNUWWJrWjIxRDdjMTl2YjNwZXB1aXBLWVUrUWtZczlZ?=
 =?utf-8?B?bXhVOG9CRW1NcUhsNDZUb256RGxJcUpEOTVDWDg0a0RWWEpLNG5hNEdkZHd5?=
 =?utf-8?B?NnhZZlpUREhUdXNPUkZuYVR2RFFkMWdLR1hUc1FNdnhlTTJXVnBDbTM3Mlhy?=
 =?utf-8?B?SmF0UmVoT1VjRHIrTmIxbXFvVVVra0gvQjBlOXNZZFZrQ1Mra1JoZkE1ZVpv?=
 =?utf-8?B?MkJGMmRsZkVXY29aWHlNNlN6MFRpWHVReVdaSitGMnZndlpuWkpiSG8xS1po?=
 =?utf-8?B?VThGTUNzRERaemtmWGpydm1acENKRGpPN05QdW1ncXh2L3FzdTdBb1BrZHNr?=
 =?utf-8?B?Y1B6clhTbE9GSllIQVZlME04UFg1akp4RGdEV2lYNkhsY05uQ0lYQUVaazY5?=
 =?utf-8?B?SE03OFNuV0NBajFVWHV4azc4Ry8wcGI4Sm45dHM1OXYxeFUxZTh2bFJEL0dK?=
 =?utf-8?B?RFNkQjBSdC9pbTNFaHhQS0hiTDduZFVlb2JuNXV1ZnBNRVdOV0JGcmgzSzRQ?=
 =?utf-8?B?dlhFSHFSQjRJOXlUek1wblN4QWl6eXdpNHRLdjFzKy9vbkdqYVh2R3huNktD?=
 =?utf-8?B?cm5kNUk0QS9GMUZOVHJCc1Y1SDg3M2dMdWF5Z05RNjd0cmJIUWYwTE5ldnlE?=
 =?utf-8?B?S1JFMWNQdUJIcnk0dkM1UE1pTUR2Skg4bDVlM3ZpZ0JUOFlVcWZLNzBQUzZj?=
 =?utf-8?B?aGdVTjlwQjkweENseTNUWlB6c3RPSlRUSDN0WGRkVE5LOE5WZE5PemlTZk54?=
 =?utf-8?B?TzVWTXk1UkgrU1RSV2ZtVXc4cnNlbU1JV2p6b2hxTVB0YVJjTytXUDRJb1Nw?=
 =?utf-8?B?cnlyWnpaS2IwOHdwUlFVck5vVDBSRmN4dExaQnJkWkVnRFRaVk9ibEt1c1g0?=
 =?utf-8?B?UXhuSlB6R0c4OGZsWmpuS01nZTVnR05maGFvcVpVRmtiNTFETHJoVmdrS05D?=
 =?utf-8?B?YnZtMlFGNW0zSENNL05FTGhDbm5VUXdielpwa0ViY0JkOTFhQlFYanNoUElK?=
 =?utf-8?B?VTliWmYwRGdWNllFbEhodmxOS3UwdnRrWjdjWDFTd3dRTjdSaGdoRGdvN3BX?=
 =?utf-8?B?b0ZxSkkzYkltTEc3clRtem9nRlhEYlRIbVhEKzJPQWVvckZFY3VLenpQalMz?=
 =?utf-8?B?aVhIWm9PV3BnUkdjNFJPNXVJaTZaQ05PZ2x1eUtKc2RWMTU4WlE4ZTAyY0NU?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83698a77-b034-45ad-0465-08dc838f9f4a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 05:40:05.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lxp+npAKlqIBckXpOEIDea3CIAQneqlORAUcpfCv9nUQtq+7qKopBTPAvwdueBJZaSLVAYYU76oW0hAUeK24JLuauYEc8TE/mokkkk/X/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8763
X-Proofpoint-ORIG-GUID: rrwat-USz8AAq7q03HDoLVKzQeX4lPvY
X-Proofpoint-GUID: 8xhyphdvHg1nPxHzVPjb5kCFGqdz9dtL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406030045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 05:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200232

--------------CgPv23Alv2WERA97Q1gBln70
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4532gdi2008687

Hi, Steve

Could you backport this patch=C2=A0 and the patch gdk-pixbuf: upgrade 2.4=
2.10=20
-> 2.42.11 to branch Scarthgap? Thanks.

2.42.12 contains CVE fix: CVE-2022-48622

Regards

Changqing

On 5/22/24 17:14, wangmy via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> From: Wang Mingyu<wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Fix a build failure
> - Fix occasional build failures
> - ani: Reject files with multiple INA or IART chunks
> - ani: Reject files with multiple anih chunks
> - ani: validate chunk size
> - Translation updates
>
> Signed-off-by: Wang Mingyu<wangmy@fujitsu.com>
> ---
>   .../gdk-pixbuf/{gdk-pixbuf_2.42.11.bb =3D> gdk-pixbuf_2.42.12.bb} | 2=
 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.11.bb =3D> gdk-=
pixbuf_2.42.12.bb} (98%)
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb b/meta=
/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> similarity index 98%
> rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
> rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> index ef0f23f8f7..9f825a68ef 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> @@ -22,7 +22,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}=
-${PV}.tar.xz \
>              file://0001-meson.build-allow-a-subset-of-tests-in-cross-c=
ompile.patch  \
>              "
>
> -SRC_URI[sha256sum] =3D "49dcb402388708647e8c321d56b6fb30f21e51e515d0c5=
a942268d23052a2f00"
> +SRC_URI[sha256sum] =3D "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95=
a148cb669ab748e3c7"
>
>   inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-vers=
ion-is-even gobject-introspection gi-docgen lib_package
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199708):https://lists.openembedded.org/g/openembedd=
ed-core/message/199708
> Mute This Topic:https://lists.openembedded.org/mt/106239623/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------CgPv23Alv2WERA97Q1gBln70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Hi, Steve</p>
    <p>Could you backport this patch&nbsp; and the patch gdk-pixbuf: upgrade
      2.42.10 -&gt; 2.42.11 to branch Scarthgap? Thanks.</p>
    <p> 2.42.12 contains CVE fix: CVE-2022-48622</p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 5/22/24 17:14, wangmy via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1716369289-22526-13-git-send-email-wangmy@fujitsu.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

From: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>

Changelog:
===========
- Fix a build failure
- Fix occasional build failures
- ani: Reject files with multiple INA or IART chunks
- ani: Reject files with multiple anih chunks
- ani: validate chunk size
- Translation updates

Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.42.11.bb =&gt; gdk-pixbuf_2.42.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.11.bb =&gt; gdk-pixbuf_2.42.12.bb} (98%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
similarity index 98%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index ef0f23f8f7..9f825a68ef 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -22,7 +22,7 @@ SRC_URI = &quot;${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch">file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch</a> \
            &quot;

-SRC_URI[sha256sum] = &quot;49dcb402388708647e8c321d56b6fb30f21e51e515d0c5a942268d23052a2f00&quot;
+SRC_URI[sha256sum] = &quot;b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7&quot;

 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package

--
2.34.1

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#199708): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/199708">https://lists.openembedded.org/g/openembedded-core/message/199708</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106239623/3616873">https://lists.openembedded.org/mt/106239623/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------CgPv23Alv2WERA97Q1gBln70--

