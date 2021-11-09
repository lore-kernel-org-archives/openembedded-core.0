Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D99C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 09:46:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9915.1636451166590449136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 01:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=FQ3S/0i4;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6947b2a56d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A9982Uh031141
	for <openembedded-core@lists.openembedded.org>;
 Tue, 9 Nov 2021 01:46:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=NYSQP95W0Yyuv7odnR2+ERePFEXkOQKrP62NUe79BCI=;
 b=FQ3S/0i42Hrcs0DQVnw9NxSZzU143WaKevNmGAWUj8mfq0sccmv4rAQwpUlhTxwldjTk
 GuVyaBTwxbsB5eYrOGTiJnvpq2d1ujgm4GP3yFQie/dQSR54dh6tj1NKNND1i725Tebc
 5UYFdw7JAAWfJkGkoQFNE0xWcNZR+p8NVd4PxfpDPWmr8CtJ1MhpeOkqAVEyU7T7HbCD
 zhfTkDFQX3Kw4JzSW1+AX11mI2BkxPotdNQf+3NrSBEhzVrsF5hZDCNmgliizpv5PN3b
 d6Jwwoc6SG/aMK4cF6DPstv79tQoa+byVIwQ/2wV8zdKqKUAZYm+sbLWeuyRpM9GD1X2 hA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c7b060gwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 01:46:06 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A99eS1K012602
	for <openembedded-core@lists.openembedded.org>;
 Tue, 9 Nov 2021 01:46:05 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c7b060gwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Nov 2021 01:46:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABuLV89eyugEiRzmbRm4j5dY9B/8KHlnJxiYhaI2rX77jCWiMqOtYWS8ho2BCgRkO6XiAoP9qnBSUG+auxZ6D3YyB029q8kSXZj4pffDnujPJv7AMXpsNy+i0wyahWcxsevR/5V3MooJ7Gx17H0E3dQtk1Qe+1gQSyfKE+W+4zEx+ZYJlkQPcBOcTrjA2s///qLFXyiZ/Brv1yGA1tK0kLoZ7Or8ALW+eSY+LLGM7+8tMl0kjf5zfqKJy1+AnN5PWJL2BQgaeGa7X648RqPGgwTrPhnTmQCp0sU/s/9Tbt5S/dV+zcZfBl65E2l0G4J7EfZOeNNvzfTqwE0jdxtWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYSQP95W0Yyuv7odnR2+ERePFEXkOQKrP62NUe79BCI=;
 b=Fw2O0rFVaD+2X2e/g5eP/H6zHBWNK5CjpqtdcQPJgUZ0xrOzA9upnfltwf6bzsSW1yl+UGYWrCyXMqw9e5EEK3rZlnWFdzYsPL5//kjn4aeSyOGi0PL/UTbS6AscMMY3GNLZ9Li044wJEnNOILW0oBYeBAg293usHWEQOmDq76E68XcjjA62ehfwhqmYOiZILCGoue/G94h38yjAp50eRkNv2SWEFZPDAdIv2d/4GmBjZjzCn9SVN8oKY7WufAE/60jyhiIdNaLjzSBTXetnxQBZ3V/IKxmr+0SccYomJ/z+GYV4IFe8yABX2Z9ViJLvvMMf9CDTmU/UWagEJoDrog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM5PR1101MB2089.namprd11.prod.outlook.com (2603:10b6:4:54::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 09:46:03 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::896a:7d8a:5ecb:7970]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::896a:7d8a:5ecb:7970%9]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:46:03 +0000
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Set ZSTD_THREADS to half of
 cpu number
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <cover.1636447679.git.liezhi.yang@windriver.com>
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
 <CANNYZj_y=ujQf8poDv1seVjWTOid1H=4Hn1OVi1NJ_o55vwwTQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <c900b636-ef79-ba55-d74c-5b29ce8c47b1@windriver.com>
Date: Tue, 9 Nov 2021 17:45:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <CANNYZj_y=ujQf8poDv1seVjWTOid1H=4Hn1OVi1NJ_o55vwwTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK2PR02CA0203.apcprd02.prod.outlook.com
 (2603:1096:201:20::15) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from [128.224.162.198] (60.247.85.82) by
 HK2PR02CA0203.apcprd02.prod.outlook.com (2603:1096:201:20::15) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 09:46:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb789a7a-20de-48da-172f-08d9a365be1f
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2089:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB2089F5E0CFA913E6F41C3909FF929@DM5PR1101MB2089.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aEjG1pgRO6FilKfKtBmcf8T7HKznySmFf1JSnZN5qXUj0696A8Clyg2kIXPAnXMyF80e/2GWadBLuPIjD349DY3LbcbdOETMrkHZcVPPru+G4lftJSPCgSTQJ//0IgBJMl6/A+mFEnvABaJJ8m2BodaTWQ65z9aF+eHPG8kj4Bu3Jmp2FisL3gP/DHqyjYP5im07wI+o3nLoBcfnRMo8kKMIGhvYxxRXwqT+BIgHNM98bw1ja21XTEqTW/OCW5+gIZ9ncMcGk5+b0gzrM86PP0b0co+rCXieO0DI8JdXD+NPIACo1vnjX45sLt9ML1gHL3KOivSenr2185P+lyb76vrwdCaUsxNqMKMIqYsZW+ABi4x7rS1xr3Nryy07Bkc5CsGWPwmf6vdwIgUw98xv85QOXPy1YDzQBjySXl3yHDMRYpykRuaPOVTe6XxHNQaShCxR9Ot4ATh6IomSBGgDcpV/Rt12XZTJhOOvVdloZOsdLG+Qm8kvZEAUqkVBwgF+r1kD72lPSWaTydrhn7kN9ulotav2Jn62+CkQsOfYFzVqvM7Sd0Qu9ctJ4MaGhi/z4papvYhNxxEXJdVtusMmZ77oBXd/4Rf5r34VCnYd+LuJoDyEd+oD6lnLk+AcUIGUaHFsay7zLUjfCDzUrnM1o38bxjwVmMJwqBEFVAWQ7ZcU5JdrrlzsE5jHOc5BzYUB6XalpAEu0Ljvc/3R3OAQhPIeLwoMitcb+nRsmkX3je8hy1nVF6kEl3zHIIjBOEIKJNrHf/d6IPyxqBWkxs9sGysMjuZ5dR6H7CeH4oPZ+df6WegX3op6dL5Zne1ITBUkx7agbXTiGqol6pHeDn3Xs/F7N+jnuMjfNHWP2ZJZivAIeCokUD54QfI/BiVJgZoIepiJn8McWd3V6dJuVLQ2JrnHi6CmeZflSgW/mL1eLXY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(66556008)(66946007)(8676002)(26005)(956004)(508600001)(6666004)(52116002)(6486002)(2906002)(6706004)(66476007)(83380400001)(966005)(186003)(86362001)(4326008)(2616005)(5660300002)(36756003)(8936002)(53546011)(38100700002)(38350700002)(31696002)(6916009)(316002)(16576012)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NEx0OUQzb012NllQbVJ1TjJ1THF0eEZaOHhvSi9HbVlaWDhCVUo2LzFCajdD?=
 =?utf-8?B?YW96b0ZNZmdONkM5aXhjaExnWmpwUk9FdkZVMzJnVzh5QlpBMGtZb3ZGVHNB?=
 =?utf-8?B?QkdLbWswd1dYUFQ5OU5vS0VIaVJYem1UUWxYUFhlRGxmbUphK1lWSENCSWJt?=
 =?utf-8?B?N1Q2d25Ma2tlemg5eGNDMHBXSW1vcy9iWVlWK3FJd2ZhNXg0a2NGcUJMT2dM?=
 =?utf-8?B?SnZudzFSdmgzdXZBOVJaRHAxODVpL2RuSXJHanZ3MmV0bmgrU0dvU0N5SEZx?=
 =?utf-8?B?bVJ4R3hwSStKWTlpSlpLcWtNTEN2cXY4RmpicWtVRHBzWnVsdmNNWXM1Q2Nx?=
 =?utf-8?B?SnVVSTd5Zkpsam45ZzBXL1RwMUFodnlON2xkSGNoSlBWNFRBMW16UXIzVzNq?=
 =?utf-8?B?YWY4aWNqREtBZ0pQOXlvUmJTUnBnMWtpWHNDVUp5b3BUNTRseG5LM29tTjRU?=
 =?utf-8?B?WTNzL3BHais5VzEzMGtDUy9rSUhCaFpHWnh5NEp3NWpFaklHSklGalVCZnd2?=
 =?utf-8?B?RHFFd0UzdTB6VjNSZzdhQ1d0NFpQdys5NmtTcGlNbG9wVDM2c0JUMWg2RzZN?=
 =?utf-8?B?UjFFNHdRaFMrNUxHaUV6SkhYNEhqRENya1VYd015bUtJQU9MbG8zNXZES2c0?=
 =?utf-8?B?OG0rRmQ3dlZ4a21SQ0YvdmlCN0FnMkl3RWdCU2ZwdU56NlY1V2Fwc1UvNks5?=
 =?utf-8?B?UGlVRlo5OVlJNDBwbEdWNjRKWVlOdjVmeDJqYVY4Q1dGbGQwdFcxbU9sTWEz?=
 =?utf-8?B?WFVkSGhSVHFaSlN4U3QzcnR1S3ZuaUpRaVlScGRDWlloN1JFaUNkcDh2N2Vn?=
 =?utf-8?B?aXdIT0JQNktUek1pSkJVMmlaR2loYkUvb0orWElJTEJLY1VkR0gwSmY1c0NP?=
 =?utf-8?B?elUvcnpVbGx3aE5UMUhjSXhTTmhIbU56VXptZDZYY1lZTnJPbkxVdVpKcURv?=
 =?utf-8?B?YmNHOVNtSWJmYVF2L1dad1lrT2FGRWNYWGd6N1ZOUm92V0F3cVdaUkZ1cCt3?=
 =?utf-8?B?OGhlYzFrelpldVN3WTVOT25GNGN5M0cyV3ZVcHFrMW0rdXQ1ZWM1R2RXY2p6?=
 =?utf-8?B?NjZqaFdMK3F1Lzk4R0hQZ1lNWEVXS0djY0hIcTZXN1NWYzh3bk1ET3ppMlNW?=
 =?utf-8?B?QUhlaC9KNTJmbWhiamwxNmQ2aDJBK2Y1M0MxcE9UNWUrd3FoNjVVeVpGbk5o?=
 =?utf-8?B?dllJYUR2Wis4Lzg3Tjh4OVdvN1BjaGw4S3lkWUVWanNoUWN3QVBRNXlUWlFY?=
 =?utf-8?B?MDVUZk5TN3VuOFJuNE1vcWpDQVZCYnlhb3Q4Z0FZNk1pV2FUQURKNmpPaHln?=
 =?utf-8?B?TUdzTWtnbXBGUVFMZkdiRDdTZDh6N1ZKVm10MHJQN01CNE0yUTNsUktIbDc2?=
 =?utf-8?B?Mk0vZTFJNU1IKytaNmNvdlFqZjBVcUlEY1hYMldSYWdlV1ZXUFkwNzROSnlH?=
 =?utf-8?B?Q3pqL3VuM3grTW5QcStXbHlmYlBHVk4xL0kzSy8zUm5Wa3F2TUpFVVRkOFNZ?=
 =?utf-8?B?OTZTcEs0dDFvZUVxdjIyblVOeWYrTkc1UExEZlJrZWRMdVE2QWFVMTBENDNy?=
 =?utf-8?B?V0NOQUloTUd3OUsxNlFDNGtrTys2K0twRHlKcnpuNUU4VWowaUc2MDQ0VDhy?=
 =?utf-8?B?WHkrWldaOWlIQmkveWhheUZ4SVdBZUE2QlBkNHVHZThZSTZSazUvYTQxTTlq?=
 =?utf-8?B?VTJ3Q2RJeUJkbVdLM1p2Z1dxQmNDYlkyMmwvMG9wRGk0Vlp2Sy9hd3ZmdGxj?=
 =?utf-8?B?am5tRXl3OVBEWDJWc080YThhK2JsNTIwYTlDalk5aUpjR1AxclpvNlkzcDlP?=
 =?utf-8?B?ZDI1NmYwRzFRZHFYbTVwQzk4YTRyNk9BSXVoejIzN1RkbXZRRTZRU3l5RFFI?=
 =?utf-8?B?L0IxWGVFK2NLSVVXS1FZci9Db0RqNUVpZFh2U3BKcXNjWm95Ym8rRzhqYk41?=
 =?utf-8?B?TDRONXh4cjNHQmMreGRpTnNmOVd0bEJTdi8rVXZERURmUEc1cFI5Z1NmK245?=
 =?utf-8?B?YkhibTl4Q2VEQXlaTWdRdGhmUGRBTkpPUmxZcDU5cnpuQTFOMkRMbWVYREFs?=
 =?utf-8?B?b0Z3N3RvNXU1NFdKcGtlRGNQVEFuQ0NrN0R3R0llVEoweSs5YmZFV3R1NnRE?=
 =?utf-8?B?dWFaU3dCejcySnhQRCs1UTJtcEU1My8rOWNvUEVaaExvaGNJeEV3S1VuclZV?=
 =?utf-8?B?enBHanFocG5oaWxHRnZnTHEyemt4TTBjazhYTERBN05mUEZUZmVwd0VTaFFW?=
 =?utf-8?B?Y2lTR2NYTXdJcmhUcjk3TmlTeWtBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eb789a7a-20de-48da-172f-08d9a365be1f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:46:02.9176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 99TBlpvJmK9T51PGMKwCpnJAx8ZDUJhKnAaJER5F3dmvxl1c7Mqs0OLKgax1U1/lLVneaatnHqB7Dn1UfQHdSd3jQZI/oxm8Yz6AEt67BcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2089
X-Proofpoint-GUID: nf4rJGulWAg_yXc1QY0roeOOP3Ev-yIe
X-Proofpoint-ORIG-GUID: w8x128I1xvCY2VcJooAWthl6XZCCeb25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090059
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1A9982Uh031141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 09:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158006

Hi Alexander,

On 11/9/21 4:21 PM, Alexander Kanavin wrote:
> But does this mean we need to globally restrict this and make things tw=
ice=20
> slower for everyone? I'm not sure.

Please see my reply to Konrad, it doesn't cause any slower, but faster in=
 my=20
testing.

BTW, the XZ_MEMLIMIT is 50% for command xz, but there isn't a similar opt=
ion for
zstd, so I have to limit ZSTD_THREADS.

// Robert

>=20
>=20
> Alex
>=20
> On Tue, 9 Nov 2021 at 09:12, Robert Yang <liezhi.yang@windriver.com=20
> <mailto:liezhi.yang@windriver.com>> wrote:
>=20
>     The original value is very easy to cause do_packge error when cpu n=
umber is
>     larger, for example, 128 cores and 512G mem:
>=20
>     error: create archive failed: cpio: write failed - Cannot allocate =
memory"
>=20
>     Set the ZSTD_THREADS to half of the CPU number can avoid the error =
in my
>     testing.
>=20
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>      =C2=A0meta/conf/bitbake.conf | 2 +-
>      =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
>     diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>     index 71c1e52ad6..46ebf5113f 100644
>     --- a/meta/conf/bitbake.conf
>     +++ b/meta/conf/bitbake.conf
>     @@ -833,7 +833,7 @@ XZ_DEFAULTS ?=3D "--memlimit=3D${XZ_MEMLIMIT}
>     --threads=3D${XZ_THREADS}"
>      =C2=A0XZ_DEFAULTS[vardepsexclude] +=3D "XZ_MEMLIMIT XZ_THREADS"
>=20
>      =C2=A0# Default parallelism for zstd
>     -ZSTD_THREADS ?=3D "${@oe.utils.cpu_count(at_least=3D2)}"
>     +ZSTD_THREADS ?=3D "${@int(oe.utils.cpu_count(at_least=3D4)/2)}"
>      =C2=A0ZSTD_THREADS[vardepvalue] =3D "1"
>=20
>      =C2=A0# Limit the number of threads that OpenMP libraries will use=
. Otherwise they
>     --=20
>     2.17.1
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#157998):
>     https://lists.openembedded.org/g/openembedded-core/message/157998
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/157998__;!!AjveYdw8EvQ!JYlw1H6vGmlFiU7pGKOBAwXZBD-wG=
B5MiKIahgkPJl3ojXBUC4Rkt3vdHS9iN8a9RUvg$>
>     Mute This Topic: https://lists.openembedded.org/mt/86926962/1686489
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/8692=
6962/1686489__;!!AjveYdw8EvQ!JYlw1H6vGmlFiU7pGKOBAwXZBD-wGB5MiKIahgkPJl3o=
jXBUC4Rkt3vdHS9iN7BIPv2n$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!JYlw1H6vGmlFiU7pGKOBAwXZBD-wGB5MiKIahg=
kPJl3ojXBUC4Rkt3vdHS9iN_MzaRNb$>
>     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

