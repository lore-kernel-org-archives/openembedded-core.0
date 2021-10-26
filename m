Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AF4C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 23:44:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4680.1635291845659187097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 16:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=VzHNotxx;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5933ac1779=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QNG2su015364
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=AnjXb0OT+YAQF3PirU6Hr42Rt+kZ4TqTnmziLzduwKo=;
 b=VzHNotxxSBOys1e6bLaOqns49nkFqOOw4sVRK+SPuPUFoQIGe6ftrxxou8ExP2IaSgyo
 jBiWRcZjUoQuxUZCTQyjwTcgapgbkA1u3fTxlcRfh8tSp7yppBnLXO/8CEcSVOIoSg9D
 w2pSg/qH2ubB7rZtghj9aIOw1a+O3RnbrZ9wfUQdjtqjSB/CwF+cy3AF5r6h2p7u2wbL
 0txUAvsYA8GvF07aNfYhFtZoscyXDiAkYOTWZOJNgHH+WOtJIa6VP1tU1cVa42IoHea+
 hhisRdKl+fob8xsRYl+xnNGfNRLxn6MAZzLaMDToSpmi7SMibhF2EfVbu/9xE/NCN7N0 9A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4rch13c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 23:44:04 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19QNi4Rh006005
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:44:04 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4rch13a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Oct 2021 23:44:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PL5QC4QHA/VCzjpFAhJ4DjJIjiSVROFL/nwFUcbI2pbUZ7AY9J9mLIDk9eHU8FOWNS7qkrjcKqEHydomldQ2TLwmNF7av98gf8aPk1P1pM2ZnZa8PdxTQbWNLKqWL/TnxljSlcSkYoqCCO7p8836RWGyDrpoe33C9Vu1NsrE4ssYdQ9BFWgIfHBL8B6ytYljS0FerGEqZOcsFSLbrZRQzGOlgj9ygXO4aoqnQ0jYH7uRFwkVO9q89J9kqs9+pzaTaManERtRwQJcbGlwB2nC+cAId8Nq5IVTEMOiqIkahQi7v+R8hsVdbY84mFCYi/Oa1CQVGTadOurnMxzlmL+ONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnjXb0OT+YAQF3PirU6Hr42Rt+kZ4TqTnmziLzduwKo=;
 b=DLL2VbAUY2L/vncbBsaSYdUvicT2QZ5H1vuRVizk0iWkeOQasQneHFpYVeTu3XmcRfM5Wd8fmKF282MynvcD8j7NTJ7X77Ael8er9+zEm6h0bDij11k23gCm1Rs/zgXzbr04cPTGHvkWK37BvXQc6BlciU66tJeF/9+0vObDrDZS7cYohB+fBoWn1balzQgreTEvr6aYx562FAMSX25CYIP490gxMjqhG4nDQ98U7iEjioYaGbzHYoHEOP5WDb4H1+YdEV92yx0sp5/T3fzTLmTeVQ9BR6KAShMpzALYg3CWVsXJISoUjEolaIr+9ro8os5rTUt5kuYy/GHj+1IYMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3292.namprd11.prod.outlook.com (2603:10b6:5:5a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 23:44:02 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62%6]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 23:44:02 +0000
Subject: Re: [OE-core] [PATCH] rust: Upgrade to 1.56.0
To: Martin Jansa <martin.jansa@gmail.com>, Pgowda <pgowda.cve@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211023065203.1624178-1-raj.khem@gmail.com>
 <16B193358866A17D.20978@lists.openembedded.org>
 <CA+chaQfFk1mNBbBERcbAqvdK4dGuXpyGzUtc3jyGxXRhShjpgQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <5036e93f-011a-57ce-5725-245097b86cb7@windriver.com>
Date: Tue, 26 Oct 2021 19:43:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <CA+chaQfFk1mNBbBERcbAqvdK4dGuXpyGzUtc3jyGxXRhShjpgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
X-ClientProxiedBy: SJ0PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::24) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 SJ0PR03CA0139.namprd03.prod.outlook.com (2603:10b6:a03:33c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.22 via Frontend
 Transport; Tue, 26 Oct 2021 23:44:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54b68eec-477b-4897-dfd7-08d998da7d09
X-MS-TrafficTypeDiagnostic: DM6PR11MB3292:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3292B91E80F5CA653FB51DB0F8849@DM6PR11MB3292.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Iuj5NX2I0FLQhkJRZhmD4Gq/4N5kfcZI7ol8bN8sAtw8KINoBbKH0HbJv2dX2COrMSzP+vR9fFE+xsl95kmtwJeXcb+znyvoKqEgWuARKB3efhRfBvYStSmhWlfDeO6e73PrTKkkw/+NpY+MZfhJYRpD6dkPEINn7FgnSJEEwBCSQuKdKettvR6etLA4atwaENizaK6DcFtwxO2+PFdgs+EeHeA31nDkt/QTpCwmTVFhSusjGPaf4fgyImxkocNipUIE6sq5s/AIWLb9rpl48pdryyZSK5P1h7+d10Elkx/QyPHicCXXgHuV5lDyvHQh/GRINmxzCRx0y3m/72hRBzVdAsmo4QAm+R2UK//zD30Si59sUnX9OZaBTQTGffCrZyP9CS1D8DwbULNonoIfsJF18VLuKTHGH9jSqsMRBSOeLiErCKODuq4MD0Xb8ZQLyCdF+oKoUmYoJ1zqaw8vHVQR+w+fw6vhAXUcwzkfJ7P+moE+OVAAzlrd0Ro1lbxT3L1Y+Z9lmKrnObB0xUTdyKKuheU8GTsgGem5JRdUuFG0NKMVxrRk97+4HTMr61BvrjXJJSpXQq9h15vO07VksrSaIJcr29nETZoKFAw4v+rZ+3MirvukVZFYh9seeFnRsOc5fLyhukZr99wSnGlIfg4rFKBQUmXXflCg6Z3iePYbdvjHpzw5fwXTuvdA1LnfZShzKTu4rHtHJSBat/p8jNRU/1oITzCy7ElAIMMkbUAJajbrVEqrDO+o7zMH76a6ydeVm4TsT88I6e8SYplhSRF7l9+DnwjRn7+bkCCqin9ldmagbCyKx7ECeoEm6hDLLmgrakLJJM9U0mq5S2/z7eEL86Y5gS/BjLgxNGC9RsbZvqY40px8n9GYF/pNRmes6j70qhtSss7oTck83DAX8mU4ddPaX0CWC7I3SW9oarg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(83080400002)(966005)(83380400001)(5660300002)(8936002)(2616005)(26005)(66476007)(8676002)(31686004)(66556008)(66946007)(6666004)(956004)(38350700002)(316002)(52116002)(38100700002)(86362001)(6486002)(16576012)(31696002)(36756003)(53546011)(508600001)(186003)(110136005)(54906003)(4326008)(4001150100001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZzI5VVVZWFkycmdDNUJYKzl3SWRBYlQ1Z25Jc2J3NW02ZWRJMUhHYmxPeW00?=
 =?utf-8?B?cjN3TnFHQ092R2QvNGZ1WDZZMXJ6ZVE5ZUNyUHNiNVNpS3JaUitLMWlHL1VM?=
 =?utf-8?B?dzlMM01Ga1VqZDhyVCtuM0x2UEFjeE9tY0FYYlpoMDJCUTYyK25sZE5CbXRF?=
 =?utf-8?B?NllnZDZuZTNiQXZ4bnZXaEhWeVpDUG1hZDlQSUhuNWR4VlQ5TDlwT2ZIdEhu?=
 =?utf-8?B?RW52K0pGSE14NGJTd3hlN3JlZDY5alpvRS9nVzRwOGRhRmZON2I3eDQ1R28z?=
 =?utf-8?B?SjUzeVUzQnpIRmVUUXVLbzZHM3loS0xsNmhYTE5IZXNXZmI2ZFp4dCtXUXZp?=
 =?utf-8?B?L0tiWlQyL2FLeW5CdEhZL1MzRFZBbDBIT29HbnJZL1d1d25DYURqWmVuRXgx?=
 =?utf-8?B?ZnFlcVBGc05zMzA3eGJOTUw4NDEzWWlEUUdUYVlJVXF1RlNiY21heXkxRExT?=
 =?utf-8?B?UkYyVDd1clJXMldnTlZ1dmpOaktwNy9oT1pMNEwwMXoya0NVNGdtVGVtRzMx?=
 =?utf-8?B?WTFQRk9BR25kNTA5SVNZWEt0d3BzbjVMVGN4eC9Wa3BaQndkRjdmam9mVCtq?=
 =?utf-8?B?NmRnSkk2TmpUaWhiSElXVGJjZVJiMWdwejNralNsT1JSREw3MWR3ZGhoR2N0?=
 =?utf-8?B?U0lUSWVWMlNJNTBKdDFkVDIyQ0orcnl3NnZ4M2dwZmpCcmhGVHg2ZG1hWjVY?=
 =?utf-8?B?ZEpkSURtUUVLSG02akYyRS95YnRHYzJ0dUhDYmFvZjdueWJwTFFhdHJmTzZT?=
 =?utf-8?B?dGtxOTZucDNtcGJuemRGYW82TFNidE5jcDNiY1ZsQ2pBeVIvZmtjdTM1d2lh?=
 =?utf-8?B?VUZVNVFyUHBMUnFpaC84dFZrcUdpanZtWm5KbE4zdXlBdE1vajZGNWk4N1lH?=
 =?utf-8?B?WHZqeG13d01kdTMwOU9TVzVZa1djcW1FODVRbFFFM2VIbk1SVFlGeHlqdVZJ?=
 =?utf-8?B?K2FZaFpmcjgyZlA1SCt0cVBDMGpjTlZxTnMyNmN4MGl2ZjdPVUViRC85dDNL?=
 =?utf-8?B?Sk1oSzlCUWVpNmhNMkd4WUNtdThMYnlaWXgrcUNiejF3SERacGtEeDc0bnl2?=
 =?utf-8?B?MXQ0eGt3b1Z1M0dJZzczQzluOWRjWGRuZk5wZm5pUytuVnVZSWhWVjNXRktw?=
 =?utf-8?B?SzVRM1A3V3EwR1FmN0U5MXlleW5rTjdYQk9OUm1FTHRnSUFCUUVKK0xnSlBJ?=
 =?utf-8?B?aThTaFNHcGpJVFUxZVI2RFJCTWF1ZEt4WnA0RnhveTVpUkQ5Vk1zYkhSZ2RO?=
 =?utf-8?B?SWszMEZDK2hzdlUvVFpFZzF3U1pCRHZraVZoNm5zejJNeEJSdnVBVTlpNytB?=
 =?utf-8?B?RXVXR1gxVFE2MkNOUnlvTW1kU0RkLzljN2o3bE03T25ZL1Y2UVp0eFlwQVZQ?=
 =?utf-8?B?WDdhaGtMck5paTl0dk1RM0J5ZkxVdVBPVDk2TFVBNFE4RTVTQUFkT2p1UTVH?=
 =?utf-8?B?TGMxYXhlUUJtcjlVbFIyeWVMQ0ZkYjNzQ0c3WmNTTVlQUXlHS2dXUTg3YnN4?=
 =?utf-8?B?WmtiTGZyQ1BzalEvYjhZMWllaU5QVjhEWE54TVNkeG91QmFZZE9uNFAyNm45?=
 =?utf-8?B?a2JYUUhDYXJJZW5QZTFRR1RyWUI0bWh4bm9YSVUwdnVkY0c0dzdWaXpzZjBq?=
 =?utf-8?B?MjVEczlBQTIrR1Fjem1oYllFci8xVzVzUUdwaEc2K1ZNUGJYYTFjazZtRXdN?=
 =?utf-8?B?MWErMTYwbTM4Q0doUHljeXJHcU9kcXluUHZWMlU4dmxia1JncHMvOUxRQ1Fu?=
 =?utf-8?B?SmE0b05JNlBlRDY4TWsrVVFONzEvNFc1dFkvVTJxZzBBb3ZVQlJVamkxYUZm?=
 =?utf-8?B?c3RmMFdWTmVQZW1ERXlNekRqYTg0dWpOVFZ6WXRTa0lJL2VVNVFDdGFsZTEx?=
 =?utf-8?B?ZzR0VHFnajJjVHFTZFdkUFU4UXdocGhGS0IvVWVWYUJiS0o3MXpKamIrQTBs?=
 =?utf-8?B?WlVpcDlFR1I5SHFxbDV1V1N5MlVCUjJCTE8rdit1S3RFQlVKdHlrYk9lK1Av?=
 =?utf-8?B?d2o3aHNGNkJqZzRKWFVLbW12SFhUWjd5R0ZucWdWWjBmbWFybjE0Znd0ZHRi?=
 =?utf-8?B?SHE1WFh6a3RHcEYybWJGbThWci9tVVY2UjhxbmNkU2pVUWpWeldIS0JhaVBD?=
 =?utf-8?B?VVZ2TklvcmFmck85bTBMeVE3YllJbXozUWpUV1RIZmt5L0QzYjVNUGxoMXY5?=
 =?utf-8?B?eHFHenpLbjZja0hGWVFuZms2VUNjcHltWEF3N2JtWGkwMjcwVGpzMUg3UTdJ?=
 =?utf-8?Q?YORofZbFIhpVfwWE7fgC2FcYhgjhmuISEmTnuRzQbk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 54b68eec-477b-4897-dfd7-08d998da7d09
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 23:44:01.8956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kg/p3uBZSDqS4LKXR183kdiygeYYzahJ6v1RZ7/PqEfWu5jGTJrtGaSu5uh823EZOCXVL+a0thnZnX1qlumKYnghLLNSg/J8xF7+I9Ua5t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3292
X-Proofpoint-GUID: MzJPD3u9xZviH3Oc2hugaPIGPkxBPH8v
X-Proofpoint-ORIG-GUID: V45IALBt5bRI8GdI_qFg4kse8GQWt3bp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_07,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260129
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 19QNG2su015364
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:44:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157461

On 2021-10-26 8:12 a.m., Martin Jansa wrote:
> Looks like it was caused by rust-cross issues reported in:
> https://lists.openembedded.org/g/openembedded-core/message/156516=20
> <https://lists.openembedded.org/g/openembedded-core/message/156516>
>=20
> Re-building libstd-rs in empty TMPDIR, just for qemuarm MACHINE without=
=20
> using sstate worked.

So sounds like there is there still a problem to be fixed...
If you create a defect in the YP Bugzilla, Naveen will work on it.

../Randy

>=20
> On Tue, Oct 26, 2021 at 2:06 PM Martin Jansa via lists.openembedded.org=
=20
> <http://lists.openembedded.org>=20
> <Martin.Jansa=3Dgmail.com@lists.openembedded.org=20
> <mailto:gmail.com@lists.openembedded.org>> wrote:
>=20
>     On Sat, Oct 23, 2021 at 8:52 AM Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>> wrote:
>=20
>         This is latest major release, changes are here [1]
>=20
>         Forward port libstd-rs patches and refresh musl/rv64 port
>=20
>         [1] https://github.com/rust-lang/rust/releases/tag/1.56.0
>         <https://github.com/rust-lang/rust/releases/tag/1.56.0>
>=20
>         Signed-off-by: Khem Raj <raj.khem@gmail.com
>         <mailto:raj.khem@gmail.com>>
>         Cc: Randy MacLeod <Randy.MacLeod@windriver.com
>         <mailto:Randy.MacLeod@windriver.com>>
>=20
>=20
>     Anyone seeing libstd-rs failing to build?
>=20
>     e.g. for raspberrypi4 it fails with:
>=20
>     | error: could not compile `core`
>     |
>     | Caused by:
>     | =C2=A0 process didn't exit successfully: `rustc --crate-name core
>     --edition=3D2018 library/core/src/lib.rs
>     <http://lib.rs>
>     --error-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts
>     --crate-type lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -=
C
>     embed-bitcode=3Dno -C metadata=3D1c41b1708b174d1e -C
>     extra-filename=3D-1c41b1708b174d1e --out-dir
>     /OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-g=
nueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps
>     --target arm-oe-linux-gnueabi -C
>     linker=3D/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-o=
e-linux-gnueabi/libstd-rs/1.56.0-r0/wrapper/target-rust-ccld
>     -L
>     dependency=3D/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfp=
v4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/releas=
e/deps
>     -L
>     dependency=3D/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfp=
v4-oe-linux-gnueabi/libstd-rs/1.56.0-r0/build/release/deps
>     -L
>     /OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-g=
nueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib/rust
>     --remap-path-prefix=3D/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf=
-neon-vfpv4-oe-linux-gnueabi/libstd-rs/1.56.0-r0=3D/usr/src/debug/libstd-=
rs/1.56.0-r0
>     -Cembed-bitcode=3Dyes -L
>     /OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-g=
nueabi/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib
>     -C link-arg=3D-Wl,-soname,libstd.so
>     <http://libstd.so>`
>     (signal: 11, SIGSEGV: invalid memory reference)
>     | warning: build failed, waiting for other jobs to finish...
>=20
>     with qemuarm it fails as well:
>     | error: could not compile `core`
>     |
>     | Caused by:
>     | =C2=A0 process didn't exit successfully: `rustc --crate-name core
>     --edition=3D2018 library/core/src/lib.rs
>     <http://lib.rs>
>     --error-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts
>     --crate-type lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -=
C
>     embed-bitcode=3Dno -C metadata=3D1c41b1708b174d1e -C
>     extra-filename=3D-1c41b1708b174d1e --out-dir
>     /OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueab=
i/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/deps
>     --target arm-oe-linux-gnueabi -C
>     linker=3D/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-lin=
ux-gnueabi/libstd-rs/1.56.0-r0/wrapper/target-rust-ccld
>     -L
>     dependency=3D/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe=
-linux-gnueabi/libstd-rs/1.56.0-r0/build/arm-oe-linux-gnueabi/release/dep=
s
>     -L
>     dependency=3D/OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe=
-linux-gnueabi/libstd-rs/1.56.0-r0/build/release/deps
>     -L
>     /OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueab=
i/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib/rust
>     --remap-path-prefix=3D/OE/build/oe-core/tmp-glibc/work/cortexa15t2h=
f-neon-oe-linux-gnueabi/libstd-rs/1.56.0-r0=3D/usr/src/debug/libstd-rs/1.=
56.0-r0
>     -Cembed-bitcode=3Dyes -L
>     /OE/build/oe-core/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueab=
i/libstd-rs/1.56.0-r0/recipe-sysroot/usr/lib
>     -C link-arg=3D-Wl,-soname,libstd.so
>     <http://libstd.so>`
>     (signal: 11, SIGSEGV: invalid memory reference)
>     | warning: build failed, waiting for other jobs to finish...
>=20
>     Will try to downgrade to 1.55.0.
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#157390):
>     https://lists.openembedded.org/g/openembedded-core/message/157390
>     <https://lists.openembedded.org/g/openembedded-core/message/157390>
>     Mute This Topic: https://lists.openembedded.org/mt/86531835/3617156
>     <https://lists.openembedded.org/mt/86531835/3617156>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [Martin.Jansa@gmail.com <mailto:Martin.Jansa@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
# Randy MacLeod
# Wind River Linux


