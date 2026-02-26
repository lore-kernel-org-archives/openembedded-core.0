Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10DCFC5932
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 11:23:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67827.1772104994256973743
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 03:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MKET7Bg7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=651757bcf4=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q5pg7l190732
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 03:23:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Wk3F3/f0mT8jYpLH7/tWedL6mdToelg1rdrVDwg333g=; b=MKET7Bg7AIfK
	pcjFv005aHuqhAKzsnUFpnDlaKJjWzIc0IMPwfPSCtutxnG+7JTiGZv/S8DQ22BZ
	sn3q1vgsjS3JloJ9B7OQ/YMJglSFkNjuzupUfXp2TxNgFy8gtq8hylStad0v1V7O
	z+eLb17yRFFgbfaGcW6XfX+VWH14FqOg57n7XBUjIedM7PMbEAa+R83qh71F0GZt
	I1iAhOSldbDCeIhTmv/z5ufbk1KmhnJ+3iN7myodYZ+vY0ax+4esfCqeaAlAu0PK
	B21k1BC7F+KpS9z105Tqw7OAp3HVXXmLRczpl14D7Pyn6AoxFIhdrHaKHysP+/kT
	2suSf0KUHA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013048.outbound.protection.outlook.com [40.93.196.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdu2rc54-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 03:23:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITJyGvOB05ISoMeHLMN0QuZwr+lf0MigX0gXrFoopah+eCUaSq96zxrDKZs8sfskx2/jGD7xvaX7Z1tbleh8z9KNivkioY/VCQnlx4CF3ax6Kai/ggjfvauxph60YlRJh6wRWX0EDsLPNVb23HvBGoigaxFPQ/Zhd5EfExPfO/R5RIqHQXyKhcGruQeMYBAgghBAtas+W0fVWd0hx5gBhsvpUGEcKAbwJhEQ++rpoxCXDJHZz/df6GozmiVaH6+GopLYiDZ6j5yS7NO24sL66QQ/41WoWeQHjOjOZMRzUaxOVN2+rDYEk+kG8pYV0YrVcHzuXiYXkF5zbrl9MKcAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk3F3/f0mT8jYpLH7/tWedL6mdToelg1rdrVDwg333g=;
 b=ezZz4asfVMHtYoNt7Uc1BWa0Ys5Go2krKMOz7QLDVi3/jxX2ZZVN0AN8sAdx/6/DPU2FTwQj7aS2tgIb4ZfYCoYgZ4G9TNtG6RGVgJdXW+HtRsgbBPDzrMp9OTn7cGu8A8YvY1p1/sBJMefXaP0pWj5AqErSoQ4UPX82sFJu33QgPA1gYFxZratCsJU0rRgA5JC9uFCZX0y17G5NLaIT7DUQAiB3sw4tOraWIyt5hfPbvVeH1frX4Pljt5BtBi2fAzvxdZxlKP158ta/ehqvVsK7cCFvyk2b+B04aF4RPD/FbnKe9Dmjb5l/FI6Ik1Tgw7vGvPBmdC04W+E0IiS6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 11:23:10 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 11:23:10 +0000
Message-ID: <94d7efaf-3e81-4cbf-b2e2-9e419ece0010@windriver.com>
Date: Thu, 26 Feb 2026 19:23:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] perl: upgrade from 5.40.2 to 5.42.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260224014646.3335672-1-changqing.li@windriver.com>
 <DGNYN4ICGR5R.29DIPU8EA51MG@bootlin.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DGNYN4ICGR5R.29DIPU8EA51MG@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: e928a0a9-6d8c-4a17-8e67-08de75296bdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	H8fI6lZaWwsDVZFYRTXpXmV/nOode/Zpk7X/zHvPcDFQaFJbrQpNC24Lih9hARGFBb6Q9jNP71qF022ayQLPDDYupfCOfNisRjgCHwMg3lmZAno73hbrjuxIHSzhghrO70j/QAquXqsBw40HyJ5/9rwGgQcL1KN/GFiwB6BLIbxKgBEa383zL066DmX2WzY0incBvKHcS+SJ7fqMmM+n6eW6gG9Hb5DTuZ5XMTyJFlSzW/m+UiVUR7GiU3l8jYTO5KqOZTohMPO7MpR3QdqQhQ8Jf2jQ7gL1ibS+xIs5EtMmHZD6TCwk9+DIVFU76AaaZMLTVfvHYQVp59I2Yq/g9GQ4eC+q9SiJps4QRBLcnsL7yzfcsWbgk49rZf+8bBmRPrupIZI0VSsvW7lAdMoYtd/ENZ8eB2dzTAb+EDyZMwsPg4VAcFBFq5+3+jCAZo3fFE2zN8keJaMkHGKZ86prLpT5DOTaE4DGWKHbqpmKKHA7p/Ndi4GClAOO08jxWf9XXTH1i+GiA2o6Sbw8WnuNnLEWP8r9ou/D2MU9tR1HhQyAmJavb2tU0IQ10Hie0DLHgsG+/P9uRvR+lGTZbRy61fiQ4v3yG5zF5O/uq1AxohOYI3SWMNysJMDXMRdDczAXGMjU9PMLiFW0fWXFwsx2ZZ+c6Dkpv0o8KFj/DHcG15c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2R3R044cWtUcWNYQVR2Sm9ZSGxuc2VIOXlIdk9ZeGE3THNFQjRkeUpZR0tr?=
 =?utf-8?B?M3ZRZHFtVklTR2hrN29yUkZpV2lKQmdBeGZCa3NLWStYZUM3N2liSkxyc1FR?=
 =?utf-8?B?Y0ZUYWY4L0hrUUE3SUo2dTFSbmZMeXY5NjIreFdPbTk0MEcvbitTV0szdDg4?=
 =?utf-8?B?L2dyUmwrejR3bVk4d2VkM01xaEV3TWF6QTZpM1diZGJaMTJtZ2V0ZUZmZk5x?=
 =?utf-8?B?aU1lbFZIdkVRMWE5eis1NWFTUmRPOUt0RnNUbnlFMnFmWkkwRTVVeWVlK3Vr?=
 =?utf-8?B?Q1JZSDArV2hpY25rZGVtdVduS1FyWnpzK1RkT1JoQUFQdXNpUkd0aXdlL3dU?=
 =?utf-8?B?QzBadEUxUDAxYjBEajBxSlAvdDJ0VFlrYjRPb21jWjk3d0EvbGl0N3VQRnVw?=
 =?utf-8?B?N2J6MFJuOFc1aW1hWUFZVzRaaEhrdWhKMUpHSGRBQk1haTRhd1NhZVRwbkIw?=
 =?utf-8?B?dlE5dG05VjRzcm9wU2UrbTdHeVdtK2Q3eXBwYkdyVkpqMUduUUJXNmcrWjB0?=
 =?utf-8?B?enEwQkh6RFlFRmtmZkJRTEc2RGpiOGJTUEhkY3RVMHVDVm1RY1BxTlUwWWpa?=
 =?utf-8?B?YkhyQ21hek51ekVBWTZLY281TEcrSEpWTWZYTDRRajEyOFZFWHp3cE9uL2dS?=
 =?utf-8?B?bEpGSlJReUZGRE1EZWlSVld5Q091RkpjbFlKLzlPdlM1clE2NW9jdDFKRFBF?=
 =?utf-8?B?eVUyY0VpQklIWW1kNjhmelRSR1hsRzNDNExUbjRIQWJoNWtlWWtKNEk1bEpE?=
 =?utf-8?B?Qng5QVRjRzVoZGFwRUpGK1hxeTN0L0hQcFIrQXhwbGFpVFIvN2ZxU0I0MlVk?=
 =?utf-8?B?QXF4UmZhWUJnNXpFQ0NubnYyNUp1REpHKzdOTzk3L2k3eUJoSXIvRDBZUFBw?=
 =?utf-8?B?dm9QWkpnOGtLYWNaRzMrdEs1aEErNkI2UzNNN3Y0NFh4YVJTV3N6d0xOQVZV?=
 =?utf-8?B?cXEyZU1OUVVPQXV3U0l1dWgyZkdHYTlUQWJydTZuQW42YWN4dHg3UVpOZzJF?=
 =?utf-8?B?OERMQlJIRXR1bXVEVzRqTk1PSlpiS1BEMTVtUDZqbldMQ21qZHJ3V0EwK09C?=
 =?utf-8?B?cDUrdXk5aFB2alZaUlU5cG5FUUpVNXZnZmNGOTg1dnlOdTQraktPNzlwZExy?=
 =?utf-8?B?dHVaUWpxRUdLUE9GQlpWK0czdi8vcHNrV3RRQ1hacXZTNm5QVmhaczhtcHJh?=
 =?utf-8?B?YWU1Q1lab2FkVkk2U1FGQ3pjRzBCQXdiSFJvWEFKeFNoRFJkOGJubHB3REJU?=
 =?utf-8?B?djF2Tmw0SEVTckZQQ21ZNkxEdlZDMVRjd3llVjdyTGhUWk1WVDBLSVl4UzVS?=
 =?utf-8?B?OHJTYkJ0ZHlGWTB0Z2Q0RmE2M2FHcXg5aFo3dHd4blA0NXJ4N2xidWFNeDFY?=
 =?utf-8?B?L0k1MCsvdHpGKzZUZEY4Uy9xd041Ny9PRFBIaWpmVndIRlJXVWpyN1dNSUtY?=
 =?utf-8?B?YXkzV2lQb2JjK1hsdTVXL0hReThGMHBEWWlRbWFKdDdDZGFabXVEQitzRUV4?=
 =?utf-8?B?OUhqRDJ2Qk1rZEhTRXh1S3dHVnpzSXVDbmh5dVFCNEIyWjdWVHlBRUU1alpm?=
 =?utf-8?B?VWwwTXI4N09LK3RoREx0elp0OHRWcDRIeHFpRnA3dklZcnkyNmpRdEI5dEFv?=
 =?utf-8?B?bzg3aEt2TDNpMDRtQVJqSWRvVnQySmt4dVp4S0ZlcSs2ZUZFcCs2N2pzZzBB?=
 =?utf-8?B?ajhkQWNQY1l2SzlsNXhYOVlmUWd0MjdoQ0dvdXQ4Q2hJMzRCYUxUakNPNWw2?=
 =?utf-8?B?Z0lXOWlpTDF4MzZEZGJYNlVhYm94cEdwMFlHSlRtZVFycWxCVDY0TUNuYzd3?=
 =?utf-8?B?N3lqSjZacHlqUU1zL2tBeWoyQlB0ZFhiK3JOU2MyL2dnbnlZOGRZUnMrdWtG?=
 =?utf-8?B?aUN5d1pvcDFydzJuYU5TQlYzTm1Vc0JNL1M0SDJXSTZrTmdoaW9aTWNxeHgw?=
 =?utf-8?B?UWpiSE1XRTNZcXpBZ2ZqcE4vVW5UTnRVc0FhOEJIb2h3NDZKYk5hbWJhWHpw?=
 =?utf-8?B?SU1hZTd3eStqdG9OM29yS0FlemtIT1djdHBnK2lrRlJGTGtxUWd2UHdhbjVv?=
 =?utf-8?B?ZkN0cnVVUFQ1MW9hdU9QTzc3am54cEgxd3lRUkd5ckpMWkxXOTBEN3FZZng3?=
 =?utf-8?B?SVd4L1c0bzJQZUxXRS82VzhvZGs4YjgzaVViWGdsYUFkWHFSL29UNGRvWG9R?=
 =?utf-8?B?UUNydUN2Q2pSNWJNVTVpVVlQdk82cytvSnlnQlk0dFZhdkl0cDF1dzBzTUtx?=
 =?utf-8?B?SDA4bnBrZEZ6TXNFZTNJMTJOK0VrbEtLcmwrRE5XQmtVRklOcE1vczQ4d0Mr?=
 =?utf-8?B?WW5JdUI1YzRLdHowQ21RVkltSTAwOWliMkc5TTRvY2toYjBDSmpMaGppck1n?=
 =?utf-8?Q?ZBBpaUBfmLqoa/Uk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e928a0a9-6d8c-4a17-8e67-08de75296bdd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:23:10.0241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kO9CnGi2enTi08SGX0JSrFDa0eRkMqNJkjNgO9pmvuHTf3iicS2juYpMm8O+/aE9DLMd7Vm4zJ8bNrXRf6fhldry3hZu4dUyUkHTP5lZnns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEwMyBTYWx0ZWRfXwnC0y1f1ZJ6A
 mtKusdePMc3aH4J3dnKB8tacGWYRixEr8wMP4KAxDAeBWR0/eWg+7BuIBZM9f6SN92FeKjQ0H6w
 U3l3vFqHpUXsQ9p6F0zVUnIJjSeQOHewPkZJuYVV7wc9sr/WrOU0Ay+elfps3omP37Q9Lf1ql4C
 r81O8UZjX2MzZCNgVlt28fTMflJLb95ueblvAJ3mkT7ShUHFeagc7WXkAplQY2u042nnYaD/aWW
 5urpd4ucuonQbLfX5eYSMCXYRiReWWvSI1YkOJBbySOWViPIxZTt5xMi3Ut1pov2ZrjyzpPWdgj
 doBxpP2knMLeWfrnT6W7Otmhl1lIvTSqeDNJglczapzOAcv1lrNxEEwe7aadYpxtZyUKOCDlEt2
 zW0cuqC+a93No3qgVDnm9G5STxbP9A5YgeJpamNypszk53xQMxNs2ZOznxRxKS5GyipSNGASmUv
 VCemo9T6qGlyhlAzwWg==
X-Authority-Analysis: v=2.4 cv=WpMm8Nfv c=1 sm=1 tr=0 ts=69a02d21 cx=c_pps
 a=BzYQZFXHgS3DonsPiq/7CA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=gGYar1BewNqQZIr93BQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WPw8RTJ10TrlEq-9oA05EP0xRCgJmdpz
X-Proofpoint-GUID: JtzT0v1BVq20dAA5M1ivgrfgmBHNlZi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260103
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61Q5pg7l190732
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 11:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231999


On 2/25/26 18:11, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue Feb 24, 2026 at 2:46 AM CET, Changqing Li via lists.openembedded=
.org wrote:
>> License-Update: Update copies of GPL to match recent FSF changes
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
> Hi Changqing,
>
> Thanks for your patch.
>
> It looks like some ptest is failing. I suspect the fail comes from the
> perl upgrade:
>
> WARNING: core-image-ptest-libmodule-build-perl-1.0-r0 do_testimage: The=
re were failing ptests.
> Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrap=
ped_f
>      return func(*args, **kwargs)
>    File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrap=
ped_f
>      return func(*args, **kwargs)
>    File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrap=
ped_f
>      return func(*args, **kwargs)
>    File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_pte=
strunner_expectfail
>      self.do_ptestrunner()
>    File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 120, in do_ptes=
trunner
>      self.fail(failmsg)
> AssertionError:
> Failed ptests:
> {'libmodule-build-perl': ['t/xs']}

Hi, Mathieu,

I cannot reproduce this locally,=C2=A0 in my test env,=C2=A0 the missing =
package=20
is installed as a dependency by someone.

But I think I have find the issue and=C2=A0 send V2, please help to test =
with=20
V2. Thanks.

Regards

Changqing


> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3155
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3114
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1126
>
> Test logs can be found here:
>
> https://valkyrie.yocto.io/pub/non-release/20260225-48/testresults/qemua=
rm64-ptest/core-image-ptest-libmodule-build-perl/
> https://valkyrie.yocto.io/pub/non-release/20260225-48/testresults/qemux=
86-64-ptest/core-image-ptest-libmodule-build-perl/
>
> Can you have a look at the issues?
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

