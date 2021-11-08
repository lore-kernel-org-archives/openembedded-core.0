Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39333C433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 19:01:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.996.1636398106951106885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 11:01:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=o9CLoRyh;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=69462f0bf4=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A8IgmGH002443
	for <openembedded-core@lists.openembedded.org>;
 Mon, 8 Nov 2021 11:01:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=f6JrNRvxENvsvxwBi0rsCMxMyhG9mzo/t5M3kr8VT3Y=;
 b=o9CLoRyhTarc+fKtBV8DlYXbZW3vf+hhGPHnC7NdX9ntuLW3c3JVjuFjpqnl318nRYbx
 3bKAR7Yczt/JHtWtNi4LYS4xR7If3jnk9bkJb90Y/1G7rhH4MIg7rgG5gjI7D4Bwe0St
 3DxTRM5WBFJgKQYUhuxnOYNnHiXs2DAQGk2gWiwKcAaedqL4CFVeji6kqlFAz8q+1Go9
 dakzKP9Cst4SmDrFZZ72pzgXuI8n6C7+PGUFh0WYZfj7+MQsQ2LNu4HNhu2slOfrgLJO
 Iif9JZZBnyDCDp4F/ya9WgXH1gZ2F7zYNMVyyZFH7Wsz9s6g2BOkyYlofoK+Ar3kV1ub SQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c67wws8g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 11:01:44 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A8J1hLH011618
	for <openembedded-core@lists.openembedded.org>;
 Mon, 8 Nov 2021 11:01:43 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c67wws8g6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Nov 2021 11:01:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDk19tpWvqNjPS9+t7gkz73zHz//qzZE56RSS63I5JW/hhOglOpqvDPAZm5q4mai40XH2GYMgM6tkBr5wRynka3KVwL4W9vstQrAwKQsR1Zp9ipIZnX0bLl2MJ4B92HkXQs5YXI7z71w9OwqucEmkw/pl1DO/7E8bsHqEKmGWu/GikaGZXPfkM+JLAnu/5hZqijfJMVfWNMn0fMjY3BmbTPiHUayD1U2dD1PiJSxjnozeiK+Vdz4YtDw4U51gCCxUpCvCHP8rcVoqA5lJxoc+RBC/WPaUNhJTvkZh9jbt+/N+dVIF3a6I/c6dMxCXUjRbeUWMn7GHB+SoszLGWoC+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6JrNRvxENvsvxwBi0rsCMxMyhG9mzo/t5M3kr8VT3Y=;
 b=M14ES+0tpxPmC4x3gOKKCGVAcieyG6wOgrqQt6XZTRl87j+0TvgW1GQqqV7iAZMRIsFl92v5PRDnWuy3gLhMu2Kdn4s4ohCAGxzTXWNwahQ6TUlLcW2uD1KlR7w/+s3V29UESEhiqb8FteteXafrE1CxebYRu88wCZh7z6xig/SDNJosFF2eX/Q6XHwXvap+Bzts6HnO6WWlVHBRc3c8NGWSa4JyOgImXUFFcXJOwWwV5yQfHlUN1ryW4tZfY4hTocc03gUx2ile4VT49FS1n5WCbRhKaOu+VG2OZx1MkIPVTHgiSaQRGyBJ3pxNKLlcHkyIvBFjCzTElnhlTkWEpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1423.namprd11.prod.outlook.com (2603:10b6:300:22::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Mon, 8 Nov
 2021 19:01:42 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74%7]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 19:01:41 +0000
Subject: Re: [OE-core] [PATCH 0/3] SPDX: Add annotations to relationship
To: Joshua Watt <jpewhacker@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Jose Quaresma <quaresma.jose@gmail.com>
Cc: Steve Sakoman <sakoman@gmail.com>,
        OE-core <openembedded-core@lists.openembedded.org>
References: <20211027013050.137364-1-saul.wold@windriver.com>
 <CANPvuRkxEFt7LHO_BAnQpEWU=T9ctFh45d+SzFfe=jBHUOH1aQ@mail.gmail.com>
 <CAGDS+nkJ4en5JjLGSMuePSQUY+mvLiek4X67q5Go+LA8307ApQ@mail.gmail.com>
 <5a8c05846279f160ee2d5fe7ef7502c29e1bfee1.camel@linuxfoundation.org>
 <CANPvuRnT027cnayyR=2XO_VtjhKd27rhXG=ieX4KZmDFC2yuCQ@mail.gmail.com>
 <2035d95566fd1cb0453186cc8034f234b9e9fc98.camel@linuxfoundation.org>
 <f4a34ed5-320a-2ec6-ef57-4a1efc4871ee@gmail.com>
 <a428d22285cc222b064cf837c00a3defd3b3770f.camel@linuxfoundation.org>
 <89232e41-ac8b-def5-94b9-22d08b7e01d3@gmail.com>
From: Saul Wold <Saul.Wold@windriver.com>
Message-ID: <9c6aa6d7-ddb5-0bab-8639-063e71379101@windriver.com>
Date: Mon, 8 Nov 2021 11:01:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <89232e41-ac8b-def5-94b9-22d08b7e01d3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from [IPv6:2601:642:c400:ecf0::1886] (2601:642:c400:ecf0::1886) by
 SJ0PR05CA0016.namprd05.prod.outlook.com (2603:10b6:a03:33b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Mon, 8 Nov 2021 19:01:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dd0f16c-2dbf-4a60-7a1f-08d9a2ea3347
X-MS-TrafficTypeDiagnostic: MWHPR11MB1423:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB142343EE1F742789AA57939BEE919@MWHPR11MB1423.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ua8NXX4suxsBvEiuvmUyoV+PEnalx6mhfQjVzgXePvx+6rI2qwgmCtX+LUXq6nwoijwBbwY5h+7rUTiHyaBsLmgeOp7SQXauyr8I8F8TuaIrKiXv+nKxpz87yf1qQZ5lgsnojE3neVqZ+ZuI8xkAtKlDlYbKvsgkuaeEdKiLmDbd1fR7tWWUFNXoStW+YZqwiPDUFcauRT3VgyGfyLU6PRSAhYLBEYc1oawEkDasQAGlcF9cbaM2olfhBCa8zg2SnR4BcNK2tXEvEGZG3gZr76nkjbm66D09iC6gZuhGDj2bxC0YQRgw+u1fWzPFwdj6BLClufsM8ry8NdgszPgJ8wUrsTE29Lx+P4B9T6a2c4eGiKiLeuSOYvNWzxhnTX36nzZFmWBwOHaoivGcacVsXZCR7Y4R1a/ktFWpykdJRDbmujklE5IiVWr892/g2HIVj39pq7SvjJiO9+1m6HnrlMPq0NXcVf7QX9unKLcnsarwJndJNAjnRKdSdz/ljF/cYBuVAlRy8aQlIYBNl4DH6P9he4w5uX9802Om07qZNHS56zfKA9cNjaerGTxgg8uPjc6vjZQxiVhU3BofGrq3MybzPTfgKm1o5u9zoObWy3H0EC9oLkJKiMBCzu4wA1CMvACRJ/INw+kv8w8TyD/1xv1RF9ji2XU/9//PIdIFtfJtkSiaLD6AvxE6ppHhhrPQTTnkLZCvhK7+hnQMembgkC6owI5sumu4KjerDY3EoSo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(52116002)(66946007)(8936002)(36756003)(31696002)(186003)(31686004)(53546011)(54906003)(66476007)(4001150100001)(508600001)(2616005)(6666004)(2906002)(110136005)(8676002)(316002)(86362001)(6486002)(66556008)(4326008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?KzRVKzdnOWVNUUN3a1JZNGVLeSs0dGIvUnVEaDBqVmF4aDROZVB2cTgzaVpI?=
 =?utf-8?B?eFJaSHhvZDFJR092SHNqUTlRTFBDNGZRNTBCeitFUjMyb2JXRlRSaklxZEdS?=
 =?utf-8?B?SUl6UXhTYkJUMUVMcHBmVWw5WEFFWkZ5VDZjbXJyZzJ2dTNHRUxlV3NhdHJN?=
 =?utf-8?B?RkR3ZGx1TmZBeHNEd3hXTkNwbEVNWWNpNGNOV0grZ3liNmdkbHp5UGJvL1VZ?=
 =?utf-8?B?ZWkxcE9QcWNmMGpLM1FMb3lmeWhqQi8zNHBneWxsQVdPZXhwbldkMW5Kb2tB?=
 =?utf-8?B?NWE0MGxRRHVwVFdRQ1FPNCszNzZjblRYMHg2WDZJSS9EYmxWRGVTeHhWdGxp?=
 =?utf-8?B?Ni9ES2IyVHgzQzBXVitHeW5oNjVtQWU3VFNoLzZETmQ1VWdqMUxSS285MW5K?=
 =?utf-8?B?TmFnZVBycGtCbldaanZWcnJQV0FTQ0NFdExvdjdqSTJoU1V6OHd3ZUpYK0tB?=
 =?utf-8?B?UkU1aXlsL0ZsazNpR1Evc1diYzB3eTRVNmhQNXRHbXlPNit2UXV6YWZLb0l1?=
 =?utf-8?B?TWlySGFOVlpCUWl0R2g1M2dDUE1Ic3BKVjd6ZnRmbjNCa1RGeUhnT1AwVFJX?=
 =?utf-8?B?RDkvVlZ0ak9qNTBncDV6dno1dmcwc2hXOGxwaFBMSkYwSW5MdW1GcHlTUjB5?=
 =?utf-8?B?aGxVUitYTXBFc3UxZ3ZjZ3R3TldRMmhZb0FtT0NFV1lxRXU1NVdhVElnZ1Av?=
 =?utf-8?B?b3VRNUJjL3VTSkVNL2x2NU1lQ2lYSFRlaWJ5cUk0OUVDY0NvcWpJaHkvVnZB?=
 =?utf-8?B?SmRNWDlQOGt2RUVVQXcyemRibU4waW1nT1YxUGQyMi9DeHhpdFl4a1FqaURs?=
 =?utf-8?B?YVZYSDN1V2tDTDlyZndqSUc0VEhSekdLV0lPNmdqQmluQlk1akh1S2NRYmpj?=
 =?utf-8?B?d0czQjR1bDJNb05iTDJqVWUzRkgvSTNIQld4YXZ3NDE4WEM4Mm9Yc0dQN2ZS?=
 =?utf-8?B?SDd6WFM4Zm9lNlVTUEcrZ1ljbWdxSzVKZmxycmM5RWZMa2VMcUlLNkRoY2dv?=
 =?utf-8?B?Qm5iZ0QzcDljZXFVVFQ0Z2pvQll3SXMvT0NVRkdBVHdQSTY4TjV5SC96T2x0?=
 =?utf-8?B?N1VBRG5xckhJT1NYYjhLLzU4VHFtdUpNTmRrOFFrbHpBc1EraEhXanhnSFdU?=
 =?utf-8?B?YmY2Q2dJTEpBT2xuU1JoRVBrQUtrNENpTHhiYlZ0Qmp2S3AxZXU5Wlg1aTM3?=
 =?utf-8?B?OE1OcEFERmFoQTNCWmNTZGpQVmZhL0luRnR3c29MRGw5UWZ3Uk1VSUYzbE8r?=
 =?utf-8?B?RytYVERYUWFPUkhaU1ptT1ZzSUc4aEZGaHMvc0d2d2kwdjVHcVFRK1lGTTVU?=
 =?utf-8?B?aFI2S0JtSkU4Y0srbC9IcXJrS056dEVmdkxjU2FnWGthVUtnQUNSNis0Z3Qy?=
 =?utf-8?B?UUorbjRtaTRRTDRjdzRpbCtQbUNORUxtNklXcnVsaVhTYXpxTnczenRPbVBv?=
 =?utf-8?B?SFd0WTdyd0tiQnp4a0tINWx1dUVILzA4Sm1RY2JReXpFR09IU3ZoNlFoUmtT?=
 =?utf-8?B?bFk5TkJuRDZ0aFhhMDVkcWNEUXZzcXpKenFDQlV5TnJYMmVkYVU3MjdKSUpj?=
 =?utf-8?B?UUN1UFQ1dEcxRUhZbkVETUVMSHJJTGNOejBzckM2MHRVeS95NFBYUTh0eW01?=
 =?utf-8?B?QmhTcE9JaTlRZGNCOUYyYVF5dDFLN2NOcUVOSTdSNHdGV1pOVDYwVHVUWWZD?=
 =?utf-8?B?ejgyYlRoUjBvdTI4dUxobkZSS2JGSmZFNkdabjRQVHlJRXYwSmpRenVacUla?=
 =?utf-8?B?a1N3N096U2xiOW9MWFRudFJHRFdxT0VPMG9wem5uYlk0eU9DTGQ4YzhuZS8y?=
 =?utf-8?B?dUNBWlJzZ2l4ZGVSNU9ac1d2eFEzNi9KdzU5c2lRR1paUCtaS3FzNWkvbVRp?=
 =?utf-8?B?TFp4WHoxd0Jhd2dDblFFYStrMjVhZnVBK1ZsOUkwTU9jODVJdFQzYjk0QVI2?=
 =?utf-8?B?cVlyUU9RbnluNFpxZXVGdGF0WThFVG9rOEZiR21PUzBiTVhpTThxRU05WG1G?=
 =?utf-8?B?QTNQOVFldWxESHNNVVA4RDNSWDJWYVBSc0VkWVBVTW1EaXF6WkVvVnF3clZa?=
 =?utf-8?B?djRlOFQ4L0lOL2Z0WFZyUWg2enFCcHFnUEE0a2svYVJMK1ExRVFnWjFnVzhX?=
 =?utf-8?B?NS9wZjQxV0hwU1c4dlowYjN1L1FUUG5lYWZOdjBLNkl2MWwyUEx1cTZZcUp5?=
 =?utf-8?Q?XdJH/ZWen0k81qUtjCDv+sOapyNk/UMoFLEizyvDtJUB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0dd0f16c-2dbf-4a60-7a1f-08d9a2ea3347
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 19:01:41.7389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4wGKIOOeQGUvUbIM6WNqyLYxCteROXqUodZcIZ/pc0PqcxOtSuB2HQCVexFxL943zqwOLGuj8tRIk0+OP22kUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1423
X-Proofpoint-GUID: HWR9onQpzSoCbvUiqu91yP6araRpSsge
X-Proofpoint-ORIG-GUID: P6pU-SBDAyfgLGehC6hqlAaki7Oj30tK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_06,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111080112
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1A8IgmGH002443
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 19:01:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157987



On 11/4/21 2:20 PM, Joshua Watt wrote:
>=20
> On 11/4/21 3:50 PM, Richard Purdie wrote:
>> On Thu, 2021-11-04 at 15:45 -0500, Joshua Watt wrote:
>>> On 11/4/21 3:43 PM, Richard Purdie wrote:
>>>> On Thu, 2021-11-04 at 20:00 +0000, Jose Quaresma wrote:
>>>>> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia=
=20
>>>>> quinta,
>>>>> 28/10/2021 =C3=A0(s) 21:58:
>>>>>> On Thu, 2021-10-28 at 08:47 -1000, Steve Sakoman wrote:
>>>>>>> On Tue, Oct 26, 2021 at 10:41 PM Jose Quaresma=20
>>>>>>> <quaresma.jose@gmail.com>
>>>>>> wrote:
>>>>>>>> Hi all,
>>>>>>>>
>>>>>>>> There are any plans or is it possible to backport the SBOM/SPDX=20
>>>>>>>> to the
>>>>>> dunfell branch?
>>>>>>> I'm going to yield to Saul as to whether he thinks this is
>>>>>>> desirable/possible or not.
>>>>>> The packagedata changes are pretty invasive unfortunately and=20
>>>>>> likely not
>>>>>> something you're going to want in dunfell sadly.
>>>>>>
>>>>> Thanks for the clarification.
>>>>>
>>>> I have been thinking a bit more about this. I did wonder if we=20
>>>> should consider a
>>>> mixin layer of some kind for it that could work with dunfell?
>>>>
>>>> We could host it, it is just a question of writing the mixin layer a=
nd
>>>> maintaining it.
>>> I don't think it's going to be possible with a pure mixin layer, sinc=
e
>>> it relies on the extended package data?
>> I suspect that could perhaps be patched in through a layer though? You=
=20
>> might
>> choose to drop the compression piece or do it differently for the=20
>> backport?
>=20
>=20
> I'm not sure if a layer could hook in well enough to get the data=20
> needed...=C2=A0 maybe worth an experiment though
>=20
Yeah, I am not sure an mixin could track the changes for package.bbclass
>=20
> With a backport, I would probably either use GZip compression or no=20
> compression. The zstd compression was designed as a drop in replacement=
=20
> for Gzip if we wanted to go that route.
>=20
I will say that we did something similar with Hardknott for WRLinux, but=20
did not propose it upstream as Hardknott was knot going to be supported=20
longer term.

Having the spdx class standalone with the correctly backported changes=20
seems to be working

Sau!
>>
>> Cheers,
>>
>> Richard
>>

--=20
Sau!

