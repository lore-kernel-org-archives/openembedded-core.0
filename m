Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF64FD9E3E
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 06:17:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89438.1772173031718189626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 22:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CKClgGAL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=651884c08a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R64u5N210979
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 06:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=qk6j5Ch6PV35VeIpMSVzvoPpCX+L3l/Yr056Zs7BsEU=; b=
	CKClgGALN6Vwd0uvxqwWZt8CEHLfcsWFH+NqAMUPRRq+zaJihC0U9OTVh0UXVlJU
	GWr5Py5B5aMjhdRsWIqbAn9IlsNDQWHzeAVCwHOXGCc6kyRltkpfsfxGGD4Y4kd3
	A/ZlqxZJ4ohjL2lJsMyRaUQLDZYbiWpwzYCNltREN9j7DcWh+VpcxtUY0DDORE6q
	uS1xcwHhZ392odLzwpui2VK0qaJ8oiIvplJ3dl6V3T6dedhOe6lsEKNBAN/xEDyL
	jDwCnmThOR7zf3/2abFvj7UdeTUKTjnj69n/oRh3GHjBSWmv3VHgo1akcab1KLya
	yvmGW4c/vPKHK9wlTkWBYQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdvdsjnc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 06:17:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3wxoJMV/Wkx8DPES2Nf0reDpq5KvXuMGAqLrxpqkm8tHqhdKpNINnj7hSydbwYZD3KI/C+nonP0Oe8x8DPaIfaxMJX39cyeIrf6LvRvpf/AulX3H6hTk6eS9EjhLValglt1nj0Tg5VkrOQn5Z23KErueyBWtVOsRiEit0R2Gv1/oh+Lkw/F2L4m+Kr5RBv9/bofJfJgV4BVB2eyoVEgIhwKloIqCnM3RzQSZO0nn3neDwjsdWK8gWJ9eomUuwiPn+jVxrSopudc1esFHdooxy9gm0Ifn1gH3tw7oXETk9FEHPrACYUQ7DIlCgDETbQ3DhCp2WYrXHoTPgvbNakR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qk6j5Ch6PV35VeIpMSVzvoPpCX+L3l/Yr056Zs7BsEU=;
 b=R2oGacjMyS8Xnojzi+azMpGtWlYL1etnTYypROKDxEe4V6mbPLc6GWWj/wK7jsUKI5i9ndRi03c5AA5sX6ty3kr8PXj7ReIr9vE9Cs+lH9TZwcUsHnhAwQKxgtlyChny09XihRfCj+uGEA/jovoH1tEiDduFvK/90TzBTjThmOO9kgNDVLpNmux2JTvd+vq47ymJtsloeCxbOU+Xvuy57wg3oX0Ea78WvHEptjQDzTR0/hBAahYRocEFKK/6HnD1YxBTGwi8+bXbV+68r0I6zASU+rX8wCwGJxjmghALx2jm5f8oUsU77+EkS0LdPfuW8trn4BQDlIHrpP7iP/bDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LVUPR11MB9567.namprd11.prod.outlook.com (2603:10b6:408:39e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 06:17:07 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 06:17:07 +0000
Message-ID: <1f902e9e-e85b-43f1-91e7-8ed1d31f0846@windriver.com>
Date: Fri, 27 Feb 2026 14:17:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] procps: support ptest when TCLIBC is glibc
To: Ross Burton <Ross.Burton@arm.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260224014748.3336195-1-changqing.li@windriver.com>
 <20260224014748.3336195-2-changqing.li@windriver.com>
 <7C785637-73B8-4927-8A7E-C689573CB8BD@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <7C785637-73B8-4927-8A7E-C689573CB8BD@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LVUPR11MB9567:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3c8f3d-5c33-4ec2-3ae8-08de75c7d568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	RtDDNONtoMSSSderjcX/USabHuhsFMjZlbe/BSdCejag7/pcCTiIVWj00tW30UCgwZIM3TkSWd9q/ujoV95/NEfgdWkuFuPyoDi1aZ5x6YJD8jPQVOTAWsWb5x4M8NSRasV49UdjYtbDVS47J62lCoIvbfeuWxTPqYV/n1uQGjpyD05OCedYS4F9LR2EHWujYlOWfg2kFJL478jm5Cw7U5FQEOZhisw5hePjpmN7W78pfmWe+DUg+rZTcz8U7JE8sQIDbL42VklqOmeB0uuSqiNYFsKqfWQTpTzM/dKxvlCVgsTSjrVICFBZSmgRbXV6sx5rZlacy538KTYBqJZKdYExJIUy88iC3qDTSdJv+A+J1ExM4gPcLdvdDDtUOApgt4vBLG2a0SSVb2kfDIoEPGod7B8Q6djddjZA5uHuAOHhseMwKBzH3JhBnEyEDh/si2B1efO6suUj8xOE850uPPCzY4XiRstivp+HRU41XyylKuKI/ug3f9z/wmqR5NHdcwSmyMQ5Dn51+9NswFg1Hsq1MB89/hD+Z4cqwtVFeehxN8eyI/3Hn1BDQnWw3Yacl5tDOenbJWC8EPUyIRwPUg5Qiz18DD2bbJLf9iKy/JhUUmfDMWRZfqoNTEvH3wDxqTQ2kiY/DSR/OvOG9rAWG88IpjmzsoC1EpkR0G4s0aA63fLJFAS0kfHYwAfQ6uSxUaUxq7YSR8bEqUzWeooGORJ2XOlM1WdaK84FxjpWWD4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SzI0RHpYNkU2YklmV3VjOHQxTmYxczYyWTljUHhoVjBFN3o5eHBlMDRRQ2Yv?=
 =?utf-8?B?M1dmTndtUitIQVowMVhkYi92dlNsVC9id1ZIVWhCb0wyV0lIajAwUEdMTG1P?=
 =?utf-8?B?TzYveGdLY2txNU15YnBtNzhhblpBbUtOMzhUSk5MT05NcjV2RSsrVHM4QXJU?=
 =?utf-8?B?NVlYNkRZTy8xWXlnNlRDbi9wZ21sUDg1eVBqU1ZUTHo0WVk4L28vSk1WOUd5?=
 =?utf-8?B?dFVUMnRzUE9UbUZiaTUvbStEQVJhYktsanYzOURVTVoxdEIvQWtGNmRjMkxK?=
 =?utf-8?B?T2tic0U5TkpKeEpwWUtkUkJ2MGxhbkVFUmZNT2h1cWl2aE8yYnpmTDJLaElQ?=
 =?utf-8?B?MEpseHZFaVBPaWttQVZ4cWxqbFBDSTB0ZHFZSUZLMGFPZkJJTndMdWRPckVJ?=
 =?utf-8?B?WVVXSFhMeUdONllyMWgyRkpVTHNkcmhYY3FjeWZiYS94TlJsTkNES0daUXNL?=
 =?utf-8?B?ZzkyYkozZXJmaEl3eFFlc0JvbUp6N3dqQTQyd0lFay9sRThULzg4cmxtMXpB?=
 =?utf-8?B?YjJhWTRoUnAxek5VZlZvbGpOdHpSQ1QremU4UUVkbjZLUFN2eU1CcW5wRE9G?=
 =?utf-8?B?ekpmbUJZUGVkSTJWUTFETy9nWmJ5UlUrL3RTcVFHd1gzUlZNS0lOV0RjS2NL?=
 =?utf-8?B?eUNFTEdqMGpiZnRkODNPMVBNVDBkazh0eTBzTVRXckVRY0dCNExLMHJyUFh2?=
 =?utf-8?B?cDZQNE5wQmRUdUszYk1waEo4ajhubG1PNXVBNkljSUVLdU96RFpWejl4VFl6?=
 =?utf-8?B?d3dJeWlxd1ZYNGVwdWdkRG9UVGs0U015ZlJPdFJGME5rWmoyZFBzVHQwa0lG?=
 =?utf-8?B?ZTg1OG9rZkk3YXA1NTFrdnp4c0Fwd09Oa1dlVGRabkJ4c3IrQS9rektNWkxz?=
 =?utf-8?B?ZVdRN2lDTjU1dk4xMXpyV3ZXTEY3VUlYSGJUVHRRcXg3cmhTK1EzdHJmRnlF?=
 =?utf-8?B?cEEyWXpJWUpaVzFhWTN1NEdZT1FXaCtaejVjZldSNlBrTjRkTDhsUUx1bDlV?=
 =?utf-8?B?YXVjTXMxRGdpaE4rZ2Myb1pWckFZQkZkSlFwS3hFTlBzNC9mTlI5bVJtT3Fk?=
 =?utf-8?B?VEoyNnBTc2EyemV4U1pWNEFsai9vM2hDc0xjZnBmaU1BUmtXMnVrVHpQN0Vv?=
 =?utf-8?B?MjRzbWJNQ3VrSWRtcmpJbjFEWXJiMjFFcisyYzMrRXI4NGI1MDVrSklvS2tk?=
 =?utf-8?B?MTc2OHJVNmVqbHc4emswVFpBMVdYUmRaTy9HQm9GWC9iSldQWVJadDFKN1hY?=
 =?utf-8?B?S3BlamdkVi8rcXV1RlBRSU9rNzE0aUJrblFpYnNQM0xHNzZXZnpBQW95SXU1?=
 =?utf-8?B?TjQ4QWQzVGVIVHBxVW1KMXROU2FucU9sOEp1blN0QmxvL2pZM2d5cVhOZSta?=
 =?utf-8?B?QUtNWFlEbHpmVmZBK0dqZ1FyamJFakNKT0dBQU8wcS9CcUZwYTE1U3dTeXJq?=
 =?utf-8?B?QkNyRDhpVVlwU1UzT282bDc5RFA4K0tZVUpMalc5QW5sRGxVQTdzZnhLTHBR?=
 =?utf-8?B?REQvaXRaVWtGWVg1R09nWHlRakNEako1K24vZnpoc2ltVFQ2ZDNYbUFjVTF0?=
 =?utf-8?B?em1iTXdSb0RSZCtScERvbUVBelRUeEFiMEtVdHhIeWJlZHhQejJSdUN5eDJP?=
 =?utf-8?B?NDRZMGxxK29OMDFYVUFpNWFMRFZicGVkSUV5RlBnY1p2RUZKMDNaZlJORUo2?=
 =?utf-8?B?S1Vnb1RYVG5IYm9iV0VWaGxXT3pQNG5GU0R5OWQ3SzdOVlhhVk50dElVNUFa?=
 =?utf-8?B?RnJoWFY1VnhCKzdtdkRPcFV2UktzUlVLNWU2NVIrQVFSV3FDT3BvMGdGb1Jm?=
 =?utf-8?B?MjFZb0FJeVN6UG84alhGRHBnZjJoRG9NUlVmR0s3MTFHWlRsQUlZWi9zZEta?=
 =?utf-8?B?Nmxvc3dKYk9lN2NvVEl0aHpNOGJjZkI0ZXBybkQzUysyKzdhcFFmYkJvQWwx?=
 =?utf-8?B?YjhTR3p3TEx6ZmV2eEszdVgvNW1aM05tSmtKWEFEUGJSMWhUZ3RxOGhrd0lM?=
 =?utf-8?B?M0VjZHFGZThhMU5BMmd1QUduVVJiVFpUb2VaUlJCYnNKZ3lub0ZtWTlWTTJ3?=
 =?utf-8?B?aDBmTndYZXNSbW1KL0F4OW9yR2tXS0pLdHRic2xHK21HcEQvRmdxdFVkdVpF?=
 =?utf-8?B?RFlFc2o5K0hOZTF1RXFkVDNmaTJnODdodXBMZ0IyenFxbXVwM3RNaHE3cUhK?=
 =?utf-8?B?cnVycy9aQVU5SDZ0TzdXcXpXcEl1RmhkVzJncFRZeWI3cUNpaCtSVXJzSlBO?=
 =?utf-8?B?dzlIYTNublpJazVjRy9TbzBkOTQxMkZPc1UzdklEdlZpOVpLUktEQyt6a01S?=
 =?utf-8?B?TVF4MDYwa3M1dmZiL3lBZ0tYSWZISW1EOVpyNEQ4Z1NWaXpzdUFrQzVLOHlu?=
 =?utf-8?Q?vQcq3gnkPHl1A1gU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3c8f3d-5c33-4ec2-3ae8-08de75c7d568
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 06:17:07.4887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RK/SDzp/HFQ8SiryT3bYYD3dr410RCFaDq08qxze7Jxc1oAffbmQ/ISzoDQNaZPHsAHF+ZSFj03jqDnUaFHAThB7cXZnrFLNkRUA3nr45jA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9567
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MSBTYWx0ZWRfX8X4ZnOC2HPbc
 cgCycVAV7pL5bwTFCfmjSkxdgQI191kZ0LsLmRGrgedzrJZ2TN/Mh2lUfLDBkGlFCmAcrxQc34O
 MkOtmbex35asTKFeqYeY8bs2prbmEtGX4s1b9iLYX6rOMpgt00qL9qAv5FOioaaobRtnH65bRZ+
 zryd5ixvGVE6jjksaWqa9DRGCwuCEed1Cf1FiDbkxETkg9lSoesx/u6zy1Ik9uSoARFyahMpQ09
 WqPXqTecAtc8xyq1pQxJVujZNPbY+lYLxqnRo9gffRlToSt8pidsfh96+He15AOfsITbz3Pb5DS
 kCgA0lMSpH5EkgW7YEgtwCWFGfBW5vqywU/zYjYH1B/cqYYSyrjkfuyH9/6wOSBFlj5Ny6LGOYw
 zLDhxObbBuRn5+pyMTGyxdikyQNWyXnWoPxc2gowPeTUsqaJ/GriQcOlbphHasuA4ES+viG55xa
 5WUMUMj/xRzve8McMZA==
X-Proofpoint-GUID: ILCqLYg2M1WSPRHTcWDONS9LHZkNtv73
X-Authority-Analysis: v=2.4 cv=UKzQ3Sfy c=1 sm=1 tr=0 ts=69a136e6 cx=c_pps
 a=1s4lD5itHyb3CJ4oxNoLhg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=p0WdMEafAAAA:8 a=Q4-j1AaZAAAA:8 a=A1_3VUoD3V7rM01nOD0A:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 6M_CJfU95NHSaNQvZND76jfbPR3L5F-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 06:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232075


On 2/26/26 21:13, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi,
>
> On 24 Feb 2026, at 01:47, Changqing Li via lists.openembedded.org <changqing.li=windriver.com@lists.openembedded.org> wrote:
>> * support ptest for procps TCLIBC is glibc. The configure.ac only match
>>   LINUX as "linux-gnu", we can patch it to make test can run on musl lib
>> system, but the upstream testsuite should only run on gnu libc host,
>> some test cases only suitable for glibc, eg: Some of the error messages
>> for free command on musl system is not the same as glibc system, which
>> will make test failed. In order to avoid some other unexpected failure,
>> just support ptest for glibc.
>>
>> * procps's testsuite use DejaGnu test framework.  The testsuite is
>>   expected to run during build time, this implementation create the same
>> folder structure as the testsuite expected to make it can work well.
> I filed a bug for musl support just now, https://gitlab.com/procps-ng/procps/-/issues/420. Please link to this in your changes.
OK. I will update the commit message in V2.
>
> I think we should build the tests for everything, and skip the few tests which break.  In my testing in an alpine container there are five failing tests, but it seems that two of them are busybox related so we can resolve that with dependencies to pull in the proper tools.

Maybe we can add musl support later after upstream add musl support.

//Changqing

> Ross

