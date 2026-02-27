Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B67AFD5305
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 07:07:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89804.1772176035387836042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 23:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=sU/Yr3fX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=651884c08a=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R4ef1u2492430
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 23:07:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=rNjwxG7PARyrERyY/cwrv2aRO3Tu8+diqgv85WAVT8k=; b=
	sU/Yr3fXsyAtZWV1GbOeH4Ed26d54i+13RAQeairYM5xdiDe5RssfQtwDq5nhb84
	Vv19huumhKjPGeUBK4TkAOtEKrWN/VVhj2Eb7FPnbiqtiV/YvJ1ROiZi0RwNsXN7
	SIkOIlR6DBMgv7HnzKIsbcv1CG4Wd3gM8Yqj2CQQ5A44dhlQ8zDv1OqWXzHNAV1D
	mkJB6SHN0rMZGW6DDHc+FlYEku5IPf6l8KIycTXuF78U1k9S2CNsDpe7UtONAgx3
	3gHi8mYtGlZp22NaQD/dHUoR3CQBkeJXDymq332HZ7Gpszl6jkOJ9jNbRAYZchC2
	GygVBkvLzmo7JKW9HWGelg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdyjskd3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 23:07:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzmXL71PmQjRvOT+NCG0YH+Zo3Qdg6HI0tPNgPI05gMpRWk615xj2EuJNkatKGVhMflWKMRbXHdfqThCbRIv1UP6EpG85oI1WEOUHhxQERIbA02xecYA0b8zv+ybW3cECU8Ozomfd1bH9LOXPEpoi+Rvtj0d68kH4QW88r/zv5Ngnjwq1NjSbuQ/07NUlOejPPap2ICasYz7MUlgFxLM5GPg7xa0bL9x+DrdUP1+V/GpeEpoUEoj273SHu+pwOK1fS4JWmf4EfzWv/RCEcw4y4uF7Ez1lKaYw56BsM3qwPjjvuCS7+5pV7gt+WTf31JogP4tnqoTmEfAjJqPAfNLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNjwxG7PARyrERyY/cwrv2aRO3Tu8+diqgv85WAVT8k=;
 b=nZlP053EQU8/5Q5qkLVfRR/m2WfDDIjL7F1qoFKrVsRacKWX5pzy/l3OHN6B4/2C3IGWorlda5rlnIZKgx0Y0wTKFzQG3+5NNy7ds8qHQXoGjnZL1gcPuaSetDyEdJjvEoDdTnxikz07LZ+FQ0ZH3e1RsFgLtNEMhRsXpJp3d7CYCmzRRBa0A5QhZsP9jko2oHjTLWwozCUlMHzPwdHzZg2WC6WHUinE0GCoZgtFy50ncDD3ZCNoCMV9dhPWgh4TlK4YziVP13z4JI10JyglhPlJl4Zp1PjHt+ea5f1F05brwI0I1apo6yrpD7j6r8P8+LMRFQ5mYK/0DdpfiWK0CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 07:07:12 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 07:07:12 +0000
Message-ID: <8ef7cf39-b249-4fe6-b330-a3ee8519f99d@windriver.com>
Date: Fri, 27 Feb 2026 15:07:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] lua: upgrade from 5.4.8 to 5.5.0
To: Ross Burton <Ross.Burton@arm.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260224024638.1146564-1-changqing.li@windriver.com>
 <39D9B021-BF4B-4050-8D22-53C33E84F8C9@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <39D9B021-BF4B-4050-8D22-53C33E84F8C9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TP0P295CA0041.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::7)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: cb831f66-392b-4941-537e-08de75ced453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	MX3MNYdcX3J9OeP4+2ZM4DJVYbpz/7MKxTyGHx5YPa1uVesnE5wGjrEsun02+TkFyDtw+PA+3EfuAWTL6BK/E849KSpJH2CKjbIeSRx4oU1PbRm2U3m/iewKjKTHAWrAzXHLb2boGkyb6wxx6RRatfOS4MUOHU1YvRmI5EAC2hx5krbdzWme/HiSv8OZo/cbobqx2M7SblTvJCudGQMHWLtgQS/JpNKJQKpNXMIbK7FAi6WlWlXwBIZzBnFGBaCgOPjX0qISbmX3xSiRSeW4CvtApYab+65OhqcjIqgJajipeiUUUcCUBudlQgNxtT343po0k/tzNhQrQg3BgjHdRmLp37+5Wp/KAXSiBw69XmjcnvlTmDyvNVe4I07723X8kTqYqfGm1R3w4hS7aKGR/KRLjdfMTS6JUKwCkYi+34xvCSAnpPK19DWtoPfluxSp3C5Emtr7kmAK6L3EGeLkROT8ACuZlHe6xETNh5wfhDUaTh/VahgYPPWBX8cP2VlA5lbZ0Hrkfu3FHZ42TG2lxv4ujvCk6dqCAUKhtkPydkc4X5K2rMSuSlPQbH3/ajXMa6uvChQ8ENg1ojcb+NfY/iNCzyu9+9jZhcBV7ydiFQCCWwelpIJTVKwCQDBPbsDe5h2vngnMq1a1w+dP4RWjq4KwfwCcuoW43DpflGKOi0FMfVUsgVe8HjVWXqRd/MZb10JEfW6puh5e+IKPg1uVuErTmmxPn+qCzcUjpL0/E8s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFhNRUd0cGtwS1Y1aTc0VDVZTlYxTS9tZ2dWMDBPdERuczZ4cVJGR2ZXQlhr?=
 =?utf-8?B?bk5NcWpQbndGcFl1aSt6S2oxSjFsWiswK2VhVW9teDlLV3RCL1Y2cThLRzRx?=
 =?utf-8?B?U3FqVXg1dzF2bGoyMlE2YS9Ea3ZjNUwvSUV0cXJhdi9ZN2gybUdQUmdsR1Qv?=
 =?utf-8?B?T3hEVjZqN0FtK09pVkdHSkNvZHFORFpJdTN3bFhZZ1V5WmpWTU1zcGVhOEwx?=
 =?utf-8?B?OWxWNkpyQnQzSGZkUGpVSnh5RkE2djJQdUp4L0ZsU2VDV3p0ZHRFTnRiMlBY?=
 =?utf-8?B?UERRZlExcmFoTXJpNnpzME55OXZ4UFp6RG5MeGx2ajZKd2lYYW5vanB2RC93?=
 =?utf-8?B?aEJYYk9JOWthKzhrWklNUkdFL056bSsxRFBiTkRaanVOVGlWRVU2Z3VLdGt4?=
 =?utf-8?B?a2JoaEdmNGNua3VmS3Y1WUF0RjVKMkFaVGpBOE1nUWFkNW9xU0o4dk4rb3lz?=
 =?utf-8?B?dDNVRU5odk9KR0dVY3V1MGNKU2FGNkxTWEhXTVUraHN6UlMzWk4ybjRHZkZw?=
 =?utf-8?B?TXhtSlE4eXBSM3dJbmdid3BZRGhJRE1rTnJCdFRKcW90Z0NsUnp0VWRjVmJG?=
 =?utf-8?B?U2w5ZUs1cFZFVGRBSWJSaXVCNWlJSGVYWGlYVVlxSldqamgxUzVNeWUxUkZP?=
 =?utf-8?B?d0MyOHdmZlZBaTFCN2lJUDFHUEFackU0N1VKR1JVaWFENm16T2Q1ZXF6OXA2?=
 =?utf-8?B?TkJMUTJEV3dRSVJuamw5U1JCOGlrOEovaEg3VHVqWXN6UEJQU2s4ckoySXpF?=
 =?utf-8?B?MnNxVEdrMVpha2VZL0VpVGdJVDdSTkRJRTNseFBxa0p5QkNoYXB5OVdXdlBs?=
 =?utf-8?B?UkJIaVF1Tk5oRkNPUjQ5NFZrSWRlNDN5a24xUFNlK2k0NlZDTytKT0ZpR0o1?=
 =?utf-8?B?NTFGc3QyWEFxMGhIYWlXa2ZLa2ZtUFlVb01UNVNteE9xeVhUUUxlY2VCdzU1?=
 =?utf-8?B?YmNPQ0RMSCttM3YrNGcwMkpyZkxvVVpMNDVNZWh4V2R5dmw2S0pIZnZnZmFD?=
 =?utf-8?B?ZldkYU45QlBIQmpuOGtsRjBDb2ZHS2w5dXpPc2RHME4xM29oT0o3L0pLcXNj?=
 =?utf-8?B?VUgrVDZuODZHSTd2TUI1TkZqWTMyekY2VmR2YWFtVW9lbkNUOE9FWXdCdzZi?=
 =?utf-8?B?TnNXNG5sN29wMUlNejZiZXF3ZVBKcXEyM0ZlS1I3N1ZvR3crR1ZsZ1VLcHV0?=
 =?utf-8?B?UEhGQUs2YW9lMitEWThKNEFOWWhqQ2VQN2txNFJKc3hlZGVUTFEvZ1JWT3gx?=
 =?utf-8?B?WEJuTWh3VW0rQXdsR1VUQUVDWDdkeGtMK29ybmIzR2pUdkVOUE0yL0Y0ZHhG?=
 =?utf-8?B?N2Nhc0ZlcFcwZ1A2VGR6NG1KdjRGcGdJZENabWVHLy9XWHQ2eERvU2tFaC9n?=
 =?utf-8?B?ZWErdFExVnJPaWVoQWlqblJMeUE3YUo5Z1Zta3N5czhNaE9jWmo4dkxFYzhC?=
 =?utf-8?B?YjRsWVVFbERyZVlCU0JpZkxtSFlDcGFPcGxlclRIc1p2NWh5RGtmSzhBWHFT?=
 =?utf-8?B?dTlqakp3VkdwWlNaMGRpTFJqR3VaR3NaeUdsYXhySlIvY2IwclBtMm9pelVp?=
 =?utf-8?B?YVFTc0Jid1VNZjZWVGdBRUIvK0V4azhOZjVxVDh3cktsVXRuazN5MWJTT2Ri?=
 =?utf-8?B?N1ZIQVAzS012b2dCcUdSeVpGeUZXWW1HQnY2cjhnRzFreUNxR0k5ME1TVC9y?=
 =?utf-8?B?L3FKMFB4MVQyeERtVU52d0xDWG54NTRuOWNLNDBSak1VK1JRVjVpM000WXBp?=
 =?utf-8?B?eWR5RmkrRU85aXljTTBFbmNseHZlOTB6RXgzaXNDTDNKbDhUaWpBWHFwd0xx?=
 =?utf-8?B?QUNpcG9NYnY0N3ZLOFdQUTdCN01GamhDSDc1RGIzWXpKOHBpVTdrQjlyWHJE?=
 =?utf-8?B?TC9lWjlSZE95dVdSMTBicDl1WXhTVkxVc01kVk5LeVU1RlFJS0ZiZXRqTXNj?=
 =?utf-8?B?dllOQmN0MUxzWXpkRWgwR1lLRDVSd0FsTk5VLzd0OXgrRXRxSnYxb3FtTGJZ?=
 =?utf-8?B?REtWOGRXYTVoNXVML1FwZk40VTJYdVZCSnQ4bmppc2MvMEgxaWlyV2RTZDcy?=
 =?utf-8?B?UTh1VnBNb0JQTWdNY1h4ZmgxbUdvejlaOExQTXlwaUFJMjF3cXNEWjBUOVRL?=
 =?utf-8?B?Y2s0Zzh1MUZTYkJlRWljTndsWG9HRmJQVFpIVWtPNG9PVjFIZW5iaW11VXRM?=
 =?utf-8?B?MlJybFN3NE1JVTdCUzhhbWV5U01XclZTQkhmYmt2TjEzVk1kS0lRZEVmY0Vn?=
 =?utf-8?B?TWo4NlRPK3pPWDIvbFdNcVBZdUdnaDlWUkd6ZHE0VC9ZZTZGMUlLZFZjQnlo?=
 =?utf-8?B?UGdFS1dmLzJXU1BnUmJaVXpzT3dNSmEwZDNqa1RiUStra2hJOFBLRG43M05k?=
 =?utf-8?Q?U8YmilySefHgNQuw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb831f66-392b-4941-537e-08de75ced453
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 07:07:12.1755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBoSAJC8tn3L+uBlYwV1HntOXWpVUf6Xp7ByiaXN9NP/v9sWUQrYUhmPJNLtFWjjloPMQp/jxVG1kwDrf63XByraSKa/cRELT6v9zjEDI5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA2MCBTYWx0ZWRfX2pk/obK7NXJr
 dBQxvabpek5NnsWi/v/NlZoiB4hfqUIqunutuzJ0+Nv25rA3zn2BId8ysDzTXDTvReL0H6rQGBq
 pPSi0MmzX5g42tpqhtkZlnhzkCL8+mc6bAvaYrAywbFC09wo7lPRmSDrl/umrNGcYOplCzno40x
 OHJzjDG6ffjDFPYA0Np3YpNmLRl+e8DznFqd4ikh7TAoS69isXG6MVqd3c7r53j8lvGw2Qsh1Sk
 rKi/ZRchJmXr3U+BUqpupDxLQtJY15i31cceIkUfsK5j87OGK36AfC2Lwd47nQTbEY4KnWTUQJ6
 mjNyGa4LrBC/ilVcr2UKnoYk2BI09bKAEGI+REQCyh9mq6WchdV0F3mywdJh1HIRyhU+3NryOGa
 SPauWRHwFw7yCFz3A75PaWe2kEGD56SWcKbIFtxPS31I+wXxZ5+cc76S8yRYNyIYCNtBtSllK7Y
 CozenhQ3aaJlhkO26Hw==
X-Authority-Analysis: v=2.4 cv=Cv2ys34D c=1 sm=1 tr=0 ts=69a142a2 cx=c_pps
 a=+TgAdn5i6nn1e/5/V9fTSg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=DHFuiITRRNkwP-hyXT4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=n5VPS44eipEEuhguoufB:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: HRcfUHt-8WBPOD4zOPQqymwFxdt8g8W5
X-Proofpoint-GUID: f01Sd3x7jAJCROdmUPzz27V45uNdBsxP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270060
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61R4ef1u2492430
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 07:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232079


On 2/26/26 21:37, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 24 Feb 2026, at 02:46, Changqing Li via lists.openembedded.org <chan=
gqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> -LIC_FILES_CHKSUM =3D "file://doc/readme.html;beginline=3D305;endline=3D=
326;md5=3D0e573c143cb6491b41cf02cfbcb8c267"
>> +LIC_FILES_CHKSUM =3D "file://doc/readme.html;beginline=3D299;endline=3D=
320;md5=3D0e573c143cb6491b41cf02cfbcb8c267"
> You need a License-Update: line in the commit message explaining why th=
is changed.
>
>> -PACKAGECONFIG ??=3D "readline"
>> -PACKAGECONFIG[readline] =3D ",,readline"
>> +DEPENDS =3D "readline"
> Why is this no longer conditional?  Readline is GPLv3 so there are peop=
le who want to disable this everywhere.
Thanks.=C2=A0 I will correct this.
>
>> do_install () {
>> @@ -40,13 +39,13 @@ do_install () {
>>          'INSTALL_MAN=3D${D}${mandir}/man1' \
>>          'INSTALL_SHARE=3D${D}${datadir}/lua' \
>>          'INSTALL_LIB=3D${D}${libdir}' \
>> -        'INSTALL_CMOD=3D${D}${libdir}/lua/5.4' \
>> +        'INSTALL_CMOD=3D${D}${libdir}/lua/5.5' \
>>          install
>>      install -d ${D}${libdir}/pkgconfig
>>
>>      sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDED=
IR@#${includedir}# ${UNPACKDIR}/lua.pc.in > ${S}/lua.pc
>>      install -m 0644 ${S}/lua.pc ${D}${libdir}/pkgconfig/
>> -    rmdir ${D}${datadir}/lua/5.4
>> +    rmdir ${D}${datadir}/lua/5.5
>>      rmdir ${D}${datadir}/lua
>> }
> Maybe use 5.* to avoid having to do this on every upgrade?

Changed to 5.* in V3.

//Changqing

>
> Ross

