Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0EBC433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 01:27:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.843.1636075638470282144
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 18:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=UqTeDvoH;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=69431be041=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A51QCpX023240
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Nov 2021 01:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=6UqTogm9n8SJWfTBzSh+nByhiyQE1atIRWQC58WHc4w=;
 b=UqTeDvoH+q/iulA5Y4b+HVpn4rOhP59JMaHuGEVWe4vrLH12UO3ElcjgcWK5Rlb4EcoZ
 uXc2+Pu/9cUNWHVrSKzigtjc2NGLCg148pLB1fzPUAvbHACkMahDFGbdtwxjWDduiXrw
 iijJ4P3Yrz0XKp2duofJkUEKOXVAasryOz9OFPaImuO7u3qCH/FuCxPGHQuylUzAITct
 XYhwdRS0fJE6CagB1HuhvDGEK51PBPdAYlciNsrcdK5v8nhO20WAu2tsVIgWefo+VzLq
 fDzzpJKFuOjjbhvV+cyS/+pqGFK1PI8e/qgxBkZwZ4ZjWBKlzEf2okXqg1l42cEgzYSc 5A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c4t3cr16r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:27:17 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A51RGSs023989
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Nov 2021 01:27:16 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c4t3cr16p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Nov 2021 01:27:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzTbr6GhYsJcwm6qHpa/FzVQrUCxa/EzmmQAwNvSOsMEY+I98mkI9JxgKXOWLNV3AMH9St7I8oA24s2WbPdp/J1dnSdzdkUvfC8CJ6hi/bGCOfcCRqU1PeQhfwI0bdNITfCazXouUWDniSzOOdAhWoOeeduePoCqYUtMRaqhPkDvKSwtQmGozlscjZUA/T2IMhChQwr6hAb9TErImCoQHLWadFqglw23TzRKc1CIPt9a38e1boTWRba8VjT/SaDFlsau7mYlSp3Q70pLneH/tPTZpzXUy4rVfjpUvKlYN16jLswvUbVnO+oBK9hrbxdgkg82HQMo/HJAdSGTm1uMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UqTogm9n8SJWfTBzSh+nByhiyQE1atIRWQC58WHc4w=;
 b=OANmuROlcL/8+6ZFQEUyIlEALuk5NqHh21YlRfLmnqcxsSzFIFXGuBIs/JQTESFnl64fDVy/AtcNNQ4relguvMhiTsGpjs82oXsoYLddWzkAjFU9MYEAri1Uc5kdm50led2rtGn2PvXcIs8xUPkBaezwx59pK+75xz2COnzE9RE3dPB/INqwmBBBi5M44gbbUU3EUj7KUWcUJQUEoK0Xkl1Gxr9cnE3A51lV3xY6WnQv0PiZDW2kJ68u6drwNPrtaKBlrpdGbgS4gieXa3GvnwTuG6RnoL/tj2uRozrUUCuFO/pk0+cFXZTwJS3F7xnvr78Q9nTY5yedGPtLeweaLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB5002.namprd11.prod.outlook.com (2603:10b6:806:fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 5 Nov
 2021 01:27:14 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::61c0:c477:d993:1727]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::61c0:c477:d993:1727%4]) with mapi id 15.20.4669.011; Fri, 5 Nov 2021
 01:27:14 +0000
Subject: Re: [OE-core] [V2][PATCH] ruby: workaround ptest hang problem
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20211104014027.15729-1-changqing.li@windriver.com>
 <CANNYZj89xfqo=4zLkRtAtZqSsXheMC09PPpcOJ87jn1qAct-kA@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <c41dfa10-93e9-7019-7391-347766179430@windriver.com>
Date: Fri, 5 Nov 2021 09:27:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <CANNYZj89xfqo=4zLkRtAtZqSsXheMC09PPpcOJ87jn1qAct-kA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------E07A520EAE3AF76586760635"
Content-Language: en-US
X-ClientProxiedBy: HK2PR02CA0185.apcprd02.prod.outlook.com
 (2603:1096:201:21::21) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
Received: from [128.224.162.189] (60.247.85.82) by
 HK2PR02CA0185.apcprd02.prod.outlook.com (2603:1096:201:21::21) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 01:27:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 288c70ab-e6f3-456b-7001-08d99ffb6596
X-MS-TrafficTypeDiagnostic: SA2PR11MB5002:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB50026EF0656470D33209DC28828E9@SA2PR11MB5002.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8202Nxl1RQ+wGjysv1IvNUnS0YRw63c+5IpM82QJzd51aS/9WgaAy3ZeCdprjNEB9CIFo4v7JbIM9cHTExYuyn2V8sIgPVSFlVeG153Ht6dwFWXjPaBmGL6kPawEPGHSHEEBJejutQHMrk3WiDJCSe0F6TrqhDzLC1nCKExLbZxFG3nWk3rrvLP3O7Hm9aV7ju7ovY9h8s4eeUUYOgHoPR8IqnIi7izK4mgiytE1DTTUPrBAuBpzAxYLvrwr4Ko1uXbCmvPzbX9fwNrEljrDhHB4BFeeGAVAXLzhEPbU4YtKg7YvU50ffXQ6Nny3DjawsyXFWUqqub6HndS83uZVGS9LbrrJwE5nlv5N7Y8CDd/ikYurTPREzesCujdFd86E1MOwUj0YbogvPRjiblKJXpjYU90CwXAlaPMSf+2/FD8ZZ2AlA1NweJlBIL9lE7PdnIxfJ457MuLBRikRsjjAOYRfBajOOeD9c9nm/PmvLBjt3MEvZYSA1reqGcszDn3jUYQjRwmnzvRjLjcrYk/ePdfO4MJ234Jzo0M1Hhf85iDJKWanvwKh32sm91Z4oEKzV5lOoAN2yAKiLVH3EPoBCYlRoodIl7AzAeFlM9UlUJabHITwO633QgEdFq5Sh9nmM0irJPgKIn3nduITcyKd1J/BY1y/wMrt6YA+lCnigApAv8u2ENx1zoIbYp2b1fhhlYYDJGHU2N+oUVlNe9GwG7Uz9fG2pbl8Ie3lhtsOC3Q2ZqX2Sh+Uch8oQfXjgGL3rc4sksw/BS36/IA2QUV4bw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(8676002)(508600001)(8936002)(66556008)(186003)(31696002)(2906002)(36756003)(83380400001)(4326008)(66476007)(66946007)(6666004)(26005)(6706004)(6916009)(31686004)(6486002)(53546011)(33964004)(956004)(44832011)(5660300002)(316002)(38350700002)(16576012)(38100700002)(52116002)(2616005)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UDg2SlRCdjU2ejJxNTRKWGRGM3VSVzlya0ZEU3ZhNHN3RFNLb3FTRko2WUFo?=
 =?utf-8?B?Y2NGaC9kLzVsZzNQc2dxSitXMEFwM0xHVUVOZ0dENnhaekF0VW9SYmhLV0NU?=
 =?utf-8?B?ZVJMbnlPTFZSZ1JadlpXSGdHYUJxa28wOWlHVGg0WS9YbWdHZG1IbS82V2Nx?=
 =?utf-8?B?UDJWUVYxRFVQeHlaQXREZVhQR2gzUGNKY1B3YzB2NC8wVXhQdGF2a1hORkFo?=
 =?utf-8?B?NlZSZFprYmNhQ29yRTRGakRBZytTOFVBUDF5dGg5dDU3VS9ZaEFWOXVlNGEr?=
 =?utf-8?B?WGs1QmxJRW9XNjBTRkh3cGluQ1NyQ0hiaHp1cFRlb1RLaG9jRGI4Zy9pSmVr?=
 =?utf-8?B?OC95c0x1NlJEamNFblRJSXZaWGZubHdReEo3UlJQL2ZqZVhWRUdhN0srMW5E?=
 =?utf-8?B?YWtpUG5Lb1gzaEtnSEtMZ1dtMy9Qem15VU9Na1FJVVJmbDRubzNFZ0VuUmp4?=
 =?utf-8?B?MExJdlVUOUs1NWZKQVlrVzIzcHhYdTdhM2pSd2tsSmc3ZXNHc2txendTV0pM?=
 =?utf-8?B?cG1JSWYvUnVzVUltVlgwVitpQ2ZLeElVM2VENHc2eTNsemFBcnoyY2NHcjZN?=
 =?utf-8?B?bnI5M0NYaE9LQjRrOC9UdFFORG4xNTAzUUpUMElhTjNUSm1BOVRyN0c5Mkx3?=
 =?utf-8?B?TFp1dWRkWjVBWjlkS0h3QldVYVlVY0QxTk5DUk5TbVB3Wmp4Yk1IL3RUYXd6?=
 =?utf-8?B?eWU4L09PMnBiekVDM0tvTU9OMnRHQVorRXdqcjZVK0xiOUZBWVd5bDJBS2pt?=
 =?utf-8?B?c1Njb2RNS2Y3SXptTU5lTklxU1M4WVZuYmpjVTA0Ly9ob1orL1ZSai9CZ3g4?=
 =?utf-8?B?S3RqalJ4Rmwzb1FZaTh5ZnZIdDVSaG9Ia2ZHSll4VkxnTlBUYVpHZndZby9L?=
 =?utf-8?B?SlMvQWNXTDlBdlBNWkVEMzV2STVSbjQ4N2NIOThqSlJBcGZiQytnbnpmVHpP?=
 =?utf-8?B?WUJPQlk4N09HYWkzNWF2K212TTBwOVdCUUNuUExRaWlQVE1aTlRmYXBJOGln?=
 =?utf-8?B?Y2NPbVk0QWsvb2kvcE1xOG5qZS9acnBVc01ITXE2T1RLOTd3YkM2MDNHc2hG?=
 =?utf-8?B?RFdnaWFaVzNjOS91bzNQd0wxRXJkU3cwQXBSTTEvWmVPZURnMGg0R0FSUTNF?=
 =?utf-8?B?aC80RXVNTldlckViUXYzcDRMTTJZYitiajdRamVIZjY2VkhmVWo5NDhEOVRa?=
 =?utf-8?B?Wnh1bmVGdWk2TktGV2taWTRXdWt5eWJPbVUyeUVxQXRvQXM2Q0hJK3kvalVp?=
 =?utf-8?B?RWhXeHlvTmk3OTRpSzZIYnIwQ2t1UnYwMVhMZzNlRmp0M0tOYXhZcW12K3Vj?=
 =?utf-8?B?S0ppV2lwTzkvaGFCSFNaZzNKcXpnOXpHRnJHbmp1aEdNSnZzazNEZVJjNVFq?=
 =?utf-8?B?ODg3VVVEMTIyWGRaVWEzSFQvN1NzT1ZYT0UzTDkyY3Rtc3ZMZnM5NWd3U1J4?=
 =?utf-8?B?cnNNUjVvVWxiWU1teWtJVEFTbUR0Y3VYQ3Rmd01wN05DWXVYSmRQVmU0MDlk?=
 =?utf-8?B?S3g1U21ZVXFQOVdnQjM5WW8zMHlvWHdEUDkvWi9ieitabmdOTUU3elVkeUxY?=
 =?utf-8?B?c1hOdTN1bmJXc0JJQWU3L200cGtuc2ljTTdVaEUwWlQ0THNZT3ovdnhSd1ov?=
 =?utf-8?B?WWlyVVNBVVFOSFlTd1I3UHdvM3l4RmJ2T1ZuWU9oa1NXQWhGRWFZZjQvc3Aw?=
 =?utf-8?B?S0pHT0FpQnJyQzhVaVBDWXplVkxPODAxS1JaaUpqUEFsUGN3eVFkczNkcDVp?=
 =?utf-8?B?WDkyUjdqNU45R0ROUCtkK09UaWFCTDFCaUljMDg1bDI0YkExU2lxeGtYeXdG?=
 =?utf-8?B?Q1EyRXZ4a2RuQllwcm5QNEFyUEo4eHRraW0wcWd3TmRVWjdCMkZWbVNwK3pU?=
 =?utf-8?B?dlB2bTVvWkpXRkx2azlBWk1ndTNIYUt5WENnWnAwd2NsWVNmYi96MEQ4UTVJ?=
 =?utf-8?B?Y1dLMk02SUI1R3A1YmluQlhrdjdIeFBNc1JhQlBETGxmSEczK0YxNE5kSTd2?=
 =?utf-8?B?UlU5VlVUY1NPb0k1aERWNURmcHQrNW53V1NlME10UnRQZm1EcVNEM3J3ZHdi?=
 =?utf-8?B?dU1YaVd1UUdNMzA4V2NKN0xZTzNMWjBnSkpuZHE2WXV4QjV6UVBtL3VpWHQ4?=
 =?utf-8?B?TjhVUWhKWWF5UVlSZHpPbk05NHdYek9GbktkZzhRZlFocEIrN0s2RHl5ZVRr?=
 =?utf-8?B?NVZRRkJoUzViNkRtYkFNMzVoaWNjbHpDcHd5M3BCSUpNRFVQakI0ejZ6K0NV?=
 =?utf-8?B?Z1RSbDFGU0FQdHIvcjJtT0VSbkFBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 288c70ab-e6f3-456b-7001-08d99ffb6596
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 01:27:14.4278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dQeVM4HCe++u+HxKeclLmH30UtD8LUmVg55xSjvUW5mFQgDZszp0YdcrMl3HuFRzHW2oha2J0KZ1C3m2QOCbvJzGG13pzgHGaZ6HaIRWwPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5002
X-Proofpoint-ORIG-GUID: BOcCERGCOcPXmOW1XmS2D2vG0LoEmPMH
X-Proofpoint-GUID: FtxBKMevBA6F8oEJ4pA02bxy2rwcUCuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-04_07,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=922 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 01:27:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157879

--------------E07A520EAE3AF76586760635
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1A51QCpX023240


On 11/4/21 5:17 PM, Alexander Kanavin wrote:
>
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Thu, 4 Nov 2021 at 02:42, Changqing Li <changqing.li@windriver.com=20
> <mailto:changqing.li@windriver.com>> wrote:
>
>     @@ -85,12 +85,12 @@ PTESTS_SLOW =3D "\
>     =C2=A0 =C2=A0 =C2=A0tcl-ptest \
>     =C2=A0 =C2=A0 =C2=A0util-linux-ptest \
>     =C2=A0 =C2=A0 =C2=A0valgrind-ptest \
>     +=C2=A0 =C2=A0 ruby-ptest \
>     =C2=A0"
>
>
> Thanks, can you insert this in alphabetical order? Also please add to=20
> the commit message how long does the test take.
>
> Alex
OK,=C2=A0 Thanks.=C2=A0 I will send V3

--------------E07A520EAE3AF76586760635
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/4/21 5:17 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj89xfqo=4zLkRtAtZqSsXheMC09PPpcOJ87jn1qAct-kA@mail.gmail.com">
      
      <div style="border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
        2.0pt">
        <p class="MsoNormal" style="line-height:12.0pt;background:#FFEB9C"><b><span style="font-size:10.0pt;color:#9C6500"></span></b><span style="font-size:10.0pt;color:red">[Please note: This e-mail
            is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
      </div>
      <div>
        <div dir="ltr">
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Thu, 4 Nov 2021 at
              02:42, Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              @@ -85,12 +85,12 @@ PTESTS_SLOW = &quot;\<br>
              &nbsp; &nbsp; &nbsp;tcl-ptest \<br>
              &nbsp; &nbsp; &nbsp;util-linux-ptest \<br>
              &nbsp; &nbsp; &nbsp;valgrind-ptest \<br>
              +&nbsp; &nbsp; ruby-ptest \<br>
              &nbsp;&quot;<br>
            </blockquote>
            <div><br>
            </div>
            <div>Thanks, can you insert this in alphabetical order? Also
              please add to the commit message how long does the test
              take.</div>
            <div><br>
            </div>
            <div>Alex<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    OK,&nbsp; Thanks.&nbsp; I will send V3<br>
  </body>
</html>

--------------E07A520EAE3AF76586760635--

