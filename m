Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B30C3A5A7
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 23:04:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.715.1670367868168556286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 15:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=b3Yoc5kI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9339579541=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6MuJxN027864
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Dec 2022 15:04:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=KgmOd+nWmiOQy5C7dPscQPsgoJWp8wiYVygbRCVuTV0=;
 b=b3Yoc5kIDMszWXee4QqtkHZMnC0bXu2PkRRcqMp+uWg6dyyEsdFKJ8ZUpJUkgYhOXVxN
 A1DFrAYtn0IAdmkf7OuDgh+FWkg8eFDxmbBo2ZnqHCgd91yEc2xaNurSq6xMxCn0lfoj
 TcWQsJkKz/GtXurIg+crgqXy9dSyF5euFHgIYH0P6ciyVSV8ZiosURsmPF8NvvFbaMqt
 KhtbaEsMFcgt+Is3RPjlE6BKjzSyUp9gnSQZJKeIo5xRuq1Quqk16HoD1FrGiS2CbOrE
 lWgZ2NYeloRUVjbGKyZY7bM4cu59xZno85w8ZamdXlDNaT5XQwzDX1AZdKlaOh9uBAof mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m86uqtpm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 15:04:27 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B6N1g6L004665
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Dec 2022 15:04:27 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m86uqtpky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Dec 2022 15:04:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRA32ZkeqRdGBF3OzgF68I9aHkjJtoN0oFNyroiu5gjg/+l9BEVtuxklQdEj6wtJbkDs62Q6n21HEOy7ubPlWSVCYrKwqtAAQYoAVxuQGfr8QwW6Gs0FZeTzTIKcUvwPMTc+XlTcbeP7VTLZX1Tk6A6NRtUOXO/YhunpIagxToG7KJMWZhpV/nMss/N9t94AvOupxcjT+wpLCx2bRvjpBUO7lqbctNUT3mv6fraLtup2VA0avKsp+g9AHnpJ5SHsVNclUF3xM47nBfNIAlpEpA1uPIU9lpR4NFNDUs2R+slk/JhhDN8vy0l5f++6wNrMm56UtYbFh5zkXP2VAEZ8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgmOd+nWmiOQy5C7dPscQPsgoJWp8wiYVygbRCVuTV0=;
 b=WHk7B1awEv5gICm9Cfvuw5nDiayAMN7y6U37tSbC12PoSfW4yy2HS1sNGOMIbq4O272PS0dW677dpbc/9Q5+UMmnIl+M2HuOqXIP9YUY5WS0amr6TIC+Xg+HQMoGHwxVjYNgvqkpHGqeSSU6g20UECxBU/GluYICsaZh3We7sdmUxrANxjzUTwq4YksnKd7IPK/418qrTAL3+0aj/kSI7j38B5q5Cps1kvfTyzjI6WY/wQU5mWh42L89389ZwvMLW5kfnWrFz3tvplv8haITNCUmjIOnZkNlJUURAIqMZfJdD+oZBSCGuRkD8QXNVHqiUWhIePagyEOhm1pue5AL/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH8PR11MB6611.namprd11.prod.outlook.com (2603:10b6:510:1ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 23:04:23 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 23:04:22 +0000
Message-ID: <167d8dfa-fe50-24ff-d2d2-249df3445ae8@windriver.com>
Date: Tue, 6 Dec 2022 18:04:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH 01/13] cargo-update-recipe-crates.bbclass: add a
 class to generate SRC_URI crate lists from Cargo.lock
Content-Language: en-CA
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org, jin@mediatomb.cc,
        Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221031114719.2725967-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH8PR11MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c7ba1a-06cf-43e0-be44-08dad7de36b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ua5EsEnAmQQhQT53E7XIfwSXL9OsNvdvCOdJ/HRA/mjGTfntmjJAD52Ti70MIGJOOa3EPUZEIFeIMmlfhRepeULwuSUYITIdTpJsAoLMv9fjN286w6mUyoLKZ5iK9RerK6dpHoS+rEzECd1iipJMe0E6QNLT16bmrL5UmZRG+R+xwu+PjwGRODA5pXG9uljgKsMvNLtkWfNG96mNNv37dA3/Jn03GAfXNRA5+UmN54dWrGF5OHz0z/LMp2cf+5uqrzgwgj5qSljMyNCmjWZ8Yzg0UtUcJxaN6pZeubF7fZtBNeBDCJJ85R0agwviSgZxaG2sqr+2h8Jyqr5I/o+ahciQJ3uFzY5zwELoXdo0k3hBBQc0iHHpc6ZFS0+/Yw0w3AJ+7e0VhlEY8ZZTj2C77tw3pLKIyCOLvvq20eNWLRNGoLi4DDShBZUVedKHpbXXQeb+dfORclt44qSeqUqKHmcm3s0vvooRe+NePsOmD/4V2UK6w/JBIdTcUwmO8XhkXNkWryGBNe5/VI1VQ5sMX6NIMggKSfHDxY+3DInO70jFZEoQ+4LdoPkwSz5gNPVAfkUJLy4q8TLnhdR9VtFFyNfnMTQ1L1A1d88zO0gR+t2jW/Exm5Q+GIPVARNCeGd/e/uszcpjCNiwMz3OQ8TNB/z+a+nVnU3qOA4wqc9K72l9zHG7fxPI09m31ayU07M4vPqj3IVC8ySimiFC9T6HG8sA7q+9LrFUNDVjNDmVujbjSRed1p4A9PG0DNuRBWi1LLTu3z+C3K/l5zylaCjZoglVk7jEVLl78/isiDzOHCs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(366004)(39850400004)(451199015)(66899015)(41300700001)(15650500001)(66946007)(66476007)(4001150100001)(8676002)(4326008)(8936002)(316002)(31686004)(5660300002)(66556008)(110136005)(36756003)(6512007)(53546011)(6486002)(478600001)(6666004)(38100700002)(186003)(26005)(6506007)(2906002)(966005)(2616005)(83380400001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OFBtaGZ5Y3pjSHZRYURTKytETmRQdzRYemlyQTFmbjV0S2VYLzFZUXkwV1BE?=
 =?utf-8?B?dXE4Y3RVc0pPdkNYK0dBTkJEa1BUR0ZpRFlLT0xUa083MHdYMDlmMW1WZkho?=
 =?utf-8?B?dTZobExRTHNGdXV0Rk14SmpMUnpRajloSnl4NGVOZUtjZWhWSjlhR1lGU0g0?=
 =?utf-8?B?SnQ2SUFaM2svUjgxa3dGYmlHR016MThLSUYxSTZ0S0Q2ejYyZU5rOEcvL1JV?=
 =?utf-8?B?cXlRMWJLdGNTN29EZ01iazB1VmhiQXVqKy9QdGs0RzFEbFBLai9rbXIyMUVM?=
 =?utf-8?B?YWJkekMzUzN1SytkOWtiUWdTT1g5WnZnSVFMbWcra0YzYk5GL2pZZ0FFblQ1?=
 =?utf-8?B?RWJJaXp1V1ZJcHhUeGlWWWttZnBlSDE4eXRZSnFaUlo3Nlc2b0Z1RFpPZEFD?=
 =?utf-8?B?aWkyWDdnYncvOUVka3pBN01UODgzWHJyTFdUeDBoaEdzTTBFenNBWWZ0WXU1?=
 =?utf-8?B?VGNkQlpGcDdINit1clZkMlNrZlArU1FEN3R2WU1SaU5TVEZjSDBwS2VlYU1X?=
 =?utf-8?B?d1FzWkQva0swZGxNeFRYTU5sNEpGbVlncEFaVVlNN1F4aXF3allDU0d6ZURE?=
 =?utf-8?B?SUhzTndqbjdMb0pkZzNIRzNCcHJCc1dSam5RUGFxdzIzbnlnbFN0WTl0SVN1?=
 =?utf-8?B?OFVFdUNyOWM0WHk2dVRNOVA0bWYxOWFMNkx4V3dkOUxxdlYrdk14MTM3VFha?=
 =?utf-8?B?UGlNK0d3U0xSUUhwYThVYVhnazJRckpWakxRUVhteHRtTXkwVk9XWDJCeEpz?=
 =?utf-8?B?THFPQ0lwVGRuNmlxaTVaMFUvL2pvMW42dENOVkZ4Rm56QWFTc01heEt4Wi9P?=
 =?utf-8?B?K2xRV0JoRXp6eVBJbmU3Z3I1cS9CMGNkK1RMZ0QxMkthQnNEWldwLzJ5eXpS?=
 =?utf-8?B?eVY2OUZlcGdKSHZ0ZHloNVEvaHl0Q2JSOEtEWHJ4cEFsMi8wUHJTVzIzVGZx?=
 =?utf-8?B?UWVpUGRUb0dqQy80d3ZSbDE4Y0dMbDBrTFI5UWN3bTJyRWtSc2wwRDJ3WVZM?=
 =?utf-8?B?eTR1YUlhaFV6NlhLdjl0QTZydXlJcnprYnV4cktObVNLcmV2RXhTUi8xZC9x?=
 =?utf-8?B?K2xNTDVkQlNsWEtTcUYySExORTlmQWVSeTRmaVY0TkNaK1kwSGtMWUpPQTAr?=
 =?utf-8?B?cnhzMXRjN0p2aU15RG9UblhqUjNodFRIU0ZIYklvdUdNY0M4TzlHcXVwZ3pT?=
 =?utf-8?B?eW02dGo3TG50QmNKazZkeVNrRlpGNWFlaHcyTTFHZGc4cHowZ0hnRlpTV0Vj?=
 =?utf-8?B?VWhESW1PZ1c0Q3hiYlg2S1JxNUpjd21wRWtaUGVTcDZHYmJ0bWRJQU1qc3lh?=
 =?utf-8?B?VW5JV0R5VDY4YWQ4Q3lPRzFUQ1M3YlhvaGwraU9KQ3Y2S0RldW4xTHRDbTMw?=
 =?utf-8?B?OGp3cE5HQTc3V1BOMVhDZHRCV2ZQWEN1NW55ZkhYSVRkRUZjeERDbWhyTDRi?=
 =?utf-8?B?VS82QXp2aUNEVllyYi9BUGthMVM2WThPUkNtTVJNWEJQR1c3YjVOelRxcHVl?=
 =?utf-8?B?NmJrc1NNdk02V0VleTZTWDFLZ1dTZURxZVJYbnNubkFoRW9JRVRwYzQzQmdT?=
 =?utf-8?B?bmdpNVp5RGpMMFJ1WUpOajBFZVJpYU8reFhVUW9EMVZvdFZOVE1uSWdqbUg2?=
 =?utf-8?B?ckZqbFBuckZjREQvRDVSSVNqNG9Cc0N3SFFtczhLbjF6M2tGN3I1U1ZsV1ZP?=
 =?utf-8?B?L1crMDhzZVFnejIrWHpiMVlOanFRUGpmejh4N0E0UmVRQ3VvV2ZHM3doczQ1?=
 =?utf-8?B?Ui9lUHNLeWlmTERpWEZiSVk5SUpXejJCVDlMbmxHNmt3eENET0VhaUJIV3Jj?=
 =?utf-8?B?bjJRZlVSOXpiVk1rVGgwYmVaZ1hGa1c2YmpDbjJxUzdjc0h4UFZQeUE3Zmxr?=
 =?utf-8?B?dHhCN1dJeHh4R2NrWFhTQXJBN1BabDdTcyt3T2xBMHp5K0dWOTZjT1dnMTU1?=
 =?utf-8?B?QmQ2R0lSZkk5TThjZnk5TU1VMG5kNUZ4Z05Vc1FBVDZpYnZaaFRNdjkyaVZq?=
 =?utf-8?B?TDN2b0plWVVDZFFEazEwZS9PaDRPTnRQSzRlTmpQSW1zWEk2YkcrWHU3U2F0?=
 =?utf-8?B?VEtKbEJTWVFMV1dJZEtIOUhtUFB1ZllJcTZBRWl1aWc1ZmxoR2ZZeVUrMFk0?=
 =?utf-8?B?czdqeXE3Vk00Q2JxekhmVnVCbkJsYWRZWmFiWVRxNHA3WHpReVhvMHgvNldM?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c7ba1a-06cf-43e0-be44-08dad7de36b1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 23:04:22.8082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpLXGr9fWXW8MbopGspudnd4ManzVflGxV+CSiURTryo9bzaG5QMbn0RLydV+6M+FT+jtF97hEzpBCu3AGazRmG1GEMAeFSotOpv9YThWGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6611
X-Proofpoint-ORIG-GUID: D-BMDEUvx-XJVdc_X0QpIqdXf2jVKJwM
X-Proofpoint-GUID: NhablGGmFoExuBB0OZOnyIrX-U2u9KsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_12,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060195
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2B6MuJxN027864
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 23:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174335

On 2022-10-31 07:47, Alexander Kanavin wrote:
> For better or worse, more and more rust components are appearing that d=
o
> not include their dependencies in tarballs (or git trees), and rely on =
cargo
> to fetch them. On the other hand, bitbake does not use cargo (and quite=
 possible
> won't ever be able to), and relies on having each item explicitly liste=
d in SRC_URI
> with a crate:// prefix. This however creates a problem of both making s=
uch lists in
> the first place and updating them when a recipe is updated to a newer v=
ersion.
>
> So this class can be used to perform such updates by implementing a tas=
k that does it;
> the next commit shows the outcome for python3-bcrypt (which has been te=
sted to work
> and produce a successful build).
>
> Note: the python script relies on tomllib library, which appears in Pyt=
hon 3.11 and
> does not exist in earlier versions - I've tested this by first updating=
 python to 3.11-rc2
> in oe-core.


Thanks Alex, that's a nice approach.

I'm reply to the thread since Jin had some trouble getting started
with this class. This pushed me to finally try it and I have some minor
comments and suggestions.

First, it works for me for adding ripgrep (1) and for Jin for something=20
he was
working on. It wasn't a perfect experience for me since at first, I
had omitted:

S =3D "${WORKDIR}/git"

and
$ bitbake -c update_crates=C2=A0 ripgrep

would fail silently with nothing useful in the log.do_update_crates file.

I'll likely send a patch to make it more verbose on error.


It also wasn't clear how to get started but in hindsight, you need=20
'obviously'
need a recipe that has SRC_URI and SRCREV and S and maybe a bit more to=20
get started.


Michael,

Do you think we should a document this workflow in addition to the cargo=20
bitbake approach?

../Randy


1) https://github.com/BurntSushi/ripgrep

Recipe will go to meta-oe.

>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../cargo-update-recipe-crates.bbclass        | 41 ++++++++++++++++++=
+
>   1 file changed, 41 insertions(+)
>   create mode 100644 meta/classes-recipe/cargo-update-recipe-crates.bbc=
lass
>
> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/m=
eta/classes-recipe/cargo-update-recipe-crates.bbclass
> new file mode 100644
> index 0000000000..f90938c734
> --- /dev/null
> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> @@ -0,0 +1,41 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +##
> +## Purpose:
> +## This class is used to update the list of crates in SRC_URI
> +## by reading Cargo.lock in the source tree.
> +##
> +## See meta/recipes-devtools/python/python3-bcrypt_*.bb for an example
> +##
> +## To perform the update: bitbake -c update_crates recipe-name
> +
> +addtask do_update_crates after do_patch
> +do_update_crates[depends] =3D "python3-native:do_populate_sysroot"
> +
> +do_update_crates() {
> +    nativepython3 - <<EOF
> +
> +def get_crates(f):
> +    import tomllib
> +    c_list =3D 'SRC_URI +=3D " \\ \n'
> +    crates =3D tomllib.load(open(f, 'rb'))
> +    for c in crates['package']:
> +        if 'source' in c and 'crates.io' in c['source']:
> +            c_list +=3D "        crate://crates.io/{}/{} \\ \n".format=
(c['name'], c['version'])
> +    c_list +=3D '"\n'
> +    return c_list
> +
> +import os
> +crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
> +for root, dirs, files in os.walk('${S}'):
> +    for file in files:
> +        if file =3D=3D 'Cargo.lock':
> +            crates +=3D get_crates(os.path.join(root, file))
> +open(os.path.join('${THISDIR}', '${PN}'+"-crates.inc"), 'w').write(cra=
tes)
> +
> +EOF
> +}
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172303): https://lists.openembedded.org/g/openembed=
ded-core/message/172303
> Mute This Topic: https://lists.openembedded.org/mt/94683148/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


