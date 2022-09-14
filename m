Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35C5ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 00:37:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.823.1663115830747563082
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 17:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=ouv+g2vp;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6256789b3d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28DNr53J029154
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 00:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=sJ/T0DjDf+zI+kZ9yP0eK1VunBdFkJGAJJ0926Z7mX4=;
 b=ouv+g2vphbKEdnS4BOlPkmOfyv/VnGdXlJVurgpuBqZxFk3mZgS3iQY1oAXhG8Bkq6f0
 o8h1TVjY02bC0kkrDCJ20Hma1f/YBfP7Fp/yHH90BIcqyEm5Mqpp18g7Qq+qDD6chBI4
 vu45wVQ7Lyeg/zEwgKbD9pmNAnTE/IKpoNjOwsxRSUmnCJNexfnljbJ3Ns8ftGzCna7j
 89YA9q56Uq8Ex/nipuHSF+4SGxn0Rm0YF8PFfupDboxS/SkyLP2FLl5DzSwgf5zXWBii
 RgK+iTuCA7tJRP/1y/amRkYpU2VCTlfWlYOjOVRLu9PckJDMqa7BMzByct4qxN4S5Jzo YQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jjy0eg8ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 00:37:09 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28E0b98X020611
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 00:37:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jjy0eg8uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Sep 2022 00:37:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHWn7MIQtNwYwR6GMLw2ee+el1n7ItX8J2YmZHgU2NBOW6yydG5B7CpykRBvQ0ZAPR5/QIHbWacT6/efSn7HinPXiYy4iZMwefdGWnt5T1ce6on204C0S6Xz6kQzCn28biEJBDwOMLxxhTQbRATuVLSm2Me5b25isBAJgByHg9VmDOHYpjwaquOkY7bMtFtDUmKHohzjmnxELQnP1tMntkF6nob4FYPrsmkV7BKPPF+23Y4EgabR85ax2nWn1RTsInoV0w+32cCqTqRy7d6aWBRUpUMV1LOKqiXfB/PpGDwtkJwlB7fFoBhI7pZ1c1Y89apftZ1nLcK172bT3KcARw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJ/T0DjDf+zI+kZ9yP0eK1VunBdFkJGAJJ0926Z7mX4=;
 b=Xe0INGaKwqsyvYv52JAAx9ytK1yS5geT54fMx82g2+qWG+W/tgogBiXQNTwG62pot7peDxAKVHvSX5q6kj6osbSLmnx0iXGwNu/6cXY0+MW2jXAVqJZKaYGdrj1Dlvl8dOoDW20+8kWBzNmS2ugGv3dRLw4S6kDk4j58MLhIwT4Ymv8z0cWzn5ViskeGccrNxeDnbjmCqwcOC4l8XEiOkE9dv916Rz0H+bPkxsY+TktmGzYbMomL3ftGuIWy/6MaaQn/NlmJaB3Zr6fLHuv7OITRn78tTfZdCKEjL6LLQX/XWaNFNY+rIPzgV8uFXaLlDKjTh9u42S8+LgfNmTsS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB5503.namprd11.prod.outlook.com (2603:10b6:5:39f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Wed, 14 Sep
 2022 00:37:07 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 00:37:06 +0000
Message-ID: <6ce4bb69-f2fe-c6f3-86d7-ee220f30009d@windriver.com>
Date: Tue, 13 Sep 2022 20:37:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core][kirkstone 07/24] libtasn1: upgrade 4.18.0 -> 4.19.0
Content-Language: en-CA
To: Steve Sakoman <steve@sakoman.com>,
        openembedded-core@lists.openembedded.org
References: <cover.1662559557.git.steve@sakoman.com>
 <005bfa0639724248f2a257cae0108ecd16e7314b.1662559557.git.steve@sakoman.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <005bfa0639724248f2a257cae0108ecd16e7314b.1662559557.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fab68d0-2ff5-478b-e43b-08da95e94070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CHL8xpUNuhRpXuheGyfGId6JyjF9FIo1VO5+QTQMeKXNPseCjF6qPWyQiug5EtEpDoMqEBkRzZihaG+4BCQDyNTCaaIJqP4xsM6/nLccj1+F5+WCoS62wUUctCPp+APriVEu3n1OBcq2ABiXkCsdM3+3WgVK19nZaHk4BOSrx1eeAEaSK0o6imGCLQ0cEQi9BU+TpaDu1VTzPLfrmUz2rCdqkDbyEtHoT4p9TBFj70yv6JTdUGCeLzHdOdvV/HHHTagxyGAYaCP+8aR6F9P1iYkEmUeryoC5eIpZvsd9vKDtdzIyDIeysJHGXgMZmi7wcACeqUY/uRXbX0pR2ioAAc/+H+wGwYKL7SPHbjLgmylYLPIn4XtO+7wWvfP0JE3p+Na/0mTojmNSTcAmhL8tCfKaXd5+PIw9xTlYOoKXa1PzRsLH074xgXirJRNgaXoxpJ6Ehh7vWq/iInVlc32lRkD5TmvUuVNmkFmjetaW2fDeuxgHntE6vaLBEDemIlE4HX5llKx52yLqg60NWrgfVB9Nk5TBeYJMrxfiDBHC8ByKWhwf5ETNRp2I4Z4oBcVLnTDQv4u9lGEAj0hTh1VG6wQMHDqxsmMX5buvQkB1v5sgO20SurAkaxsEnOPB0M4EpFZsCHtAVwlI3h9d0wt1pvdso/xJiy/Y4awmANYi+irzFzpsN8mPaA1rIlrF31yPzPp1SH2PuB/nQZwM+yeGf5ldiDU3GWIp1gFnYfQPMcG1cgczjEITDYx/I0g2x2oe7ulEqpA0T3o31BUDQJlwdr1qDOKW7nQK2NXU+HObmH0/XGL7k22BC724B44y10jb61Hd4X0UrSSDiPjLzbftQlwdgri3Ry+3O81dtrfxQf7bVMJLTjYzpwGencKHG2ie
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(396003)(346002)(39850400004)(451199015)(478600001)(66556008)(6486002)(8936002)(66946007)(2906002)(186003)(2616005)(36756003)(6512007)(31686004)(26005)(38100700002)(83380400001)(8676002)(31696002)(5660300002)(966005)(86362001)(316002)(41300700001)(6506007)(53546011)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZnVXUXgrcUdONFR3cFhZTXNHNkI3YWhzZXl0bzhWZEF0enFQV2VjN2EzQWxN?=
 =?utf-8?B?dkhnV1pMdDBRL2xmd01hQUNYemxvTjZaeTgvSzdHVDlDYlEzNlY3djJzVXJi?=
 =?utf-8?B?Y2RaZUZMdTlUUVMyazZ0RHBPa3FGRmtyMjBNR0pwRWRwclFOZzZSbXFFbXha?=
 =?utf-8?B?YVlVWXdrSXd4b3kvaVppdjZYRHpTZXN3Y2hSaUtYMk01dUVmNmFQZmcyZmdT?=
 =?utf-8?B?b0xvY0JPK3dTazJMNG1INkxUYmZOQXNSTzgxM01GVUFZQ3U1OTZHejNtNURa?=
 =?utf-8?B?QjRhTVhLK25HVE0zOUVXekJ3ZVYwcUY4MW5yUFlNVU9uMkk2SGs0QWVqam9u?=
 =?utf-8?B?WitDSnEyQXVTdWp1ODE3dGoxWnZNSUpubWMzMW9VQnFrM3FtVHpnclpGdGdL?=
 =?utf-8?B?VDA3Zmg2T1YxblZraXE1c3FBa3dLSjIzb0tNcGVsNnRPVFplbEdpbWxpNkxW?=
 =?utf-8?B?ZVhLcGxKYWtTMWJ5OUVMV0orVDFaU0lwR2RTUTRuNGhBKy90NGNqcTJhckN4?=
 =?utf-8?B?U05NNWtkVFlCN1A4TkFaM3hVUUZCbFltajViOENidHFvZ0x0MGk3eVpYcnVu?=
 =?utf-8?B?SEtKWU9hTXdZdGhHWGV2OFZSZEJRSUNpdURhSGdNZ1hnbkpOUHhpVUgzNGw3?=
 =?utf-8?B?S21LSVY3UXVyYlJKd2xCK3o2V0hnQW8vNEZKSitwTkhRamFMd0VaVDlZS09w?=
 =?utf-8?B?Vm5rWm8rWWluMXlEMEd3SWxXMUREcUtoOUJPcDJQS0JxODBJUWpsL3h0T3dH?=
 =?utf-8?B?UFl1K0tWUjQyUVY2OU1ZRFlTd2FXQW5qSzNDaWo3S0lLT2xUYlNNWGVEY09l?=
 =?utf-8?B?aGF3cHo2M1BGalg5WUl5TUNWTmhLT1BFaXM4YlNUbjFzRnIrYUZCNjZKem9V?=
 =?utf-8?B?S0xVS1NyWTI5U1JIUzcydDM4YWZWbVo2dC9ON0dSWXo4RjZOZkZKK29BQ2hO?=
 =?utf-8?B?UTl2Q2dLUHlONzVrQ1ZHczRXZE1qRlRSTHBxMTRDZjVqbUtMaFhaN1NySThu?=
 =?utf-8?B?azlrVEVYSDR4T0pEK2VyMHBMQkh2dkUxYnVGaTRYR3dFUTRMNFF6RzVSNEpD?=
 =?utf-8?B?YVZBc01VRDVJNU1pVmt4NmhVWWovNDRFYVllWWxwQXNQVVF5ZGdXYWxkRlV5?=
 =?utf-8?B?dEZ3NWMwdHUyeTJsZDZpRkZMQlVDbHA3YkpjZXI5K1pFUkVRdmJCQ3duaGJa?=
 =?utf-8?B?ZWtnTm9WY1kwN2ZvcVJIUSt6SGZEdHp1cUJnZDRlNnNBMTRoclhkeXNJQmZr?=
 =?utf-8?B?STlBVFFDMU5sK2pWZDYxKzV2bGpUL3pBM3VsR1p1dHNNMjBSbkFMU2oyTlhP?=
 =?utf-8?B?eDl3TllHVkpYK3gyd3NQd3hqRStoclhTbjE1eURKZXM5dERZVjAvdHdYZStw?=
 =?utf-8?B?S1g5R2F3eGlzZGtVcnhyNHNZZ0pzcFNyZWFIRzd4SkRYbnVXRHRrRUpmODJZ?=
 =?utf-8?B?NUQyUkJIUzRqRlhTN1dVOE5NZDBlTVlHUDVOOVViMWcrUlhBazFzNWJkSHFW?=
 =?utf-8?B?ZnV4YVpuTnVBeWNHVGxWVU85TURTZHMyaGU5RGVPaTA2ZHBtSjJIVUFoQXgz?=
 =?utf-8?B?Y3AreFp5TXlGY1lTamhGaFNGMjdlWUY2dXEwM3JXMUYyZ3ozeEFSY0cxRDNh?=
 =?utf-8?B?T3c1YUtoejZ0RnlMaDdGSEZzcXZJdlU4YkY1ZStDVllNYkplYVpuSUZhZmov?=
 =?utf-8?B?VHJCYnpIQWdnQjBkenN0SXZ0WWdIWjRYZ0dCclhqb2RYTHZIWTZVbUNDQUpC?=
 =?utf-8?B?S3Rydk1nTEdNekVhbC9uL1pMRmtkdEhUcVlFWlBHRWFmdHlYTGxUVUZaOHVa?=
 =?utf-8?B?MXY4RVM3Q1RCYUxuZUQvNEh6cTArRksrV1hlNUdmanpmMXFzeW0xQWIyeHdV?=
 =?utf-8?B?OG1mMndUVkNOR1Voc2xBeTdESXczZUFLWnJadzdnWGlHclJpWTJVNUtxeTRi?=
 =?utf-8?B?L3hHNHJrUkxWZTI5SmJNOUp5dC9ueEYxNjFBQUZxU2JiNTJNNVdUVU1FUlgr?=
 =?utf-8?B?Tkc0SitFL2tmanR4U0xjaXNETGZHak1lUzBKMWU2WkZvN0twMUVUL01yL2Q5?=
 =?utf-8?B?Y1pGU3E1M0ZULzlnNDNmMWd6RFVSYVNDSTcrYmdHZnpXNkhVSTZmU3daM0l5?=
 =?utf-8?B?MWJKZFM5ZUdkakV5bXR5NnZNa21aaUowMnNjdEs5NnhNdVEyV1E1NXl6eU1t?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9fab68d0-2ff5-478b-e43b-08da95e94070
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 00:37:06.8811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FtCUDPoal5E5TX0gSkJ087bycPm0jcyKZ2hJr/vesBtt0/XzCWhCdGOjLvefo/j6jY6ES9JWtKlhFFza50B2ofJslFwZQc6qrrQXrwp6naw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5503
X-Proofpoint-GUID: YDo1SjhE0FU28z-RmfZkPlxDY4Wip_kU
X-Proofpoint-ORIG-GUID: zgJeaxgxZXdY9ndVd3McB0-kISkTc6ZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_11,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209140001
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28DNr53J029154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 00:37:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170614

On 2022-09-07 10:20, Steve Sakoman wrote:
> From: wangmy <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Clarify libtasn1.map license.  Closes: #38.
> - Fix ETYPE_OK out of bounds read.  Closes: #32.
> - Update gnulib files and various maintenance fixes.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> (cherry picked from commit b8f2c6ec61ffcc607a35bd5c11f5020c9b676226)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   .../gnutls/{libtasn1_4.18.0.bb =3D> libtasn1_4.19.0.bb}           | 2=
 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-support/gnutls/{libtasn1_4.18.0.bb =3D> libtasn1_=
4.19.0.bb} (90%)
>
> diff --git a/meta/recipes-support/gnutls/libtasn1_4.18.0.bb b/meta/reci=
pes-support/gnutls/libtasn1_4.19.0.bb
> similarity index 90%
> rename from meta/recipes-support/gnutls/libtasn1_4.18.0.bb
> rename to meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> index db49adc1c2..5fb8b54c06 100644
> --- a/meta/recipes-support/gnutls/libtasn1_4.18.0.bb
> +++ b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> @@ -16,7 +16,7 @@ SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.ta=
r.gz \
>  =20
>   DEPENDS =3D "bison-native"
>  =20
> -SRC_URI[sha256sum] =3D "4365c154953563d64c67a024b607d1ee75c6db76e0d0f6=
5709ea80a334cd1898"
> +SRC_URI[sha256sum] =3D "1613f0ac1cf484d6ec0ce3b8c06d56263cc7242f1c23b3=
0d82d23de345a63f7a"
>  =20
>   inherit autotools texinfo lib_package gtk-doc

I was a little concerned about this update for kirkstone but
after a little review, it seems fine so I thought I'd reply to show
Steve that people do eventually read his updates and to re-assure
any late to the party worriers like me.


Full git log --oneline below but the source is mainly in 'src and lib':

$ git log --oneline v4.18.0..v4.19.0 src
4e74cf2 Bump copyright years.

$ git log --oneline v4.18.0..v4.19.0 lib
6acc6d9 Work around unfixed gtk-doc problem.
5ce3238 Some C89 fixes.=C2=A0 Closes: !70.
44a700d Fix ETYPE_OK off by one array size check.=C2=A0 Closes: #32.
33adcd0 Fix license header.=C2=A0 Closes: #38.
4e74cf2 Bump copyright years.

so that all seems to be sensible.

I may learn to trust Steve (but I'll keep verifying...)

../Randy


$ git log --oneline v4.18.0..v4.19.0
2b7ee16 (tag: v4.19.0) version 4.19.0
6acc6d9 Work around unfixed gtk-doc problem.
53fe8c8 Improve CI/CD artifacts, and fail on errors.
06e7433 Put version checks in tests/version.c.
513bb42 Deduplicate.
51e04e5 bootstrap.conf (src_gnulib_modules): Add getopt-gnu.
290a4ad Build check with tcc/lld/pcc.
5ce3238 Some C89 fixes.=C2=A0 Closes: !70.
b66b8ce Attempt to reproduce !70 build error.
4af0fbc Bump LT_REVISION.
42467ed Add sc_libtool_version_bump syntax-check.
74785e7 Move gnulib's dummy test directory from tests-gl to lib/gl/tests.
45c87b5 Add NEWS entry.
44a700d Fix ETYPE_OK off by one array size check.=C2=A0 Closes: #32.
1487507 Make sure syntax-check catches indent mistakes during cicd.
6533485 Add self-check for #32 to see if cicd catches it.
33adcd0 Fix license header.=C2=A0 Closes: #38.
72e30be Add NEWS entry.
7b58af4 Silence syntax-check.
f1436e1 Silence sc_makefile_DISTCHECK_CONFIGURE_FLAGS until we clean up=20
coverage code.
7c54eb1 Put gtkdocize in bootstrap_post_import_hook.
2a2686c Update bootstrap.
81b1cb0 Update gnulib.
4e74cf2 Bump copyright years.
02bf9cb Don't use -static when linking in fuzz/.=C2=A0 Closes: !61.
56d2301 Use portable way to remove carriage returns.
3af8286 (origin/jas/tmp-cicd) Don't use non-portable diff=20
--strip-trailing-cr.
607e6b1 cicd: Add targets, reduce texlive.
581e2a3 maint: Fix builddir!=3Dsrcdir abi-check failure.
c9c8de3 maint: Attempt to minimize texlive dependencies.
6182cf4 maint: Fix (and CICD-test) builddir!=3Dsrcdir bootstrap builds.
4332821 maint: Remove really old release announcement template.
5b766ad maint: Really remove texinfo.css.
f3c679d maint: post-release administrivia


>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170402): https://lists.openembedded.org/g/openembed=
ded-core/message/170402
> Mute This Topic: https://lists.openembedded.org/mt/93525901/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


