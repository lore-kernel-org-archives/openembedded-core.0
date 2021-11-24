Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53529C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 20:01:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3132.1637784098670511192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 12:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Fl+Vm4MN;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6962e1e0ea=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AOJCsuG025330
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 20:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : from : to : references : in-reply-to :
 mime-version; s=PPS06212021;
 bh=CJxm3IGN7ipQOIDyMDWFfNeUo1noRHo3B896P6kr8oo=;
 b=Fl+Vm4MNkbHOG/qQXF+k7b98CsR9pAU92+ulas0RS1/F2Xmf4tCbsm1HgImbT7bra5Ug
 O3ljrwmZ7/GUfxtKjk+lGmbsqjaLn8nIiws4Cao9I/hQN0BzFFbyMjWLU4//Rfp4211n
 SX3xQchBdBQHgaly/FIf01HIMcFUrmeabrfBBzanTPukSda0Kw+F16wkgpG8GBgnmo0c
 0INaoTiyPkNt2wp51rY7XqfJxzOKM2rl4n8hQ+ajLHqP+xRrfmOyud23xK8P19HbUEs0
 Wr43ooELy92dv8UdxJuqY6sm7Yfg309KSQ3QXLaFsrjj0Gl7mSkDk8Mg+7DtwcX/jidE 3w==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chce58qyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 20:01:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDfbxgyZIOR6DZENOH9qt5ty/mNYQoxhTVt76c6aNykdJbvgMrk4KXiBS7OG72DcFY8O2SZbGLsfSgJp9Ycw+xlZIPi7NQY3I3CrsbPm67CfoL8l0EorYdcIrsuDjg6iuczhk1hEI8S8NUQZQR0JuTjU0K9POOMnreHQgpCKr+3BdHr0NOJANpbfwdr8KUy514SUqZa7J9ayy/ewe42avYTo7n/6Nl7PJ/gtTqt8D3yeVxIyze6znShzWt5s0eIdw5aH0B6AjA05dBZTwtoWXs/QKrSnNo20yOIu1mrS+w33ItGPiE5Lfzn/km8YdzUqDXYHp6UDJlm810eFxL46+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJxm3IGN7ipQOIDyMDWFfNeUo1noRHo3B896P6kr8oo=;
 b=LnTpKZqAMiQQkjHCwLDCBci3R1nWUD9+G9fWEQK4KaaHBUJQuXH0WnI7g52b20YWxYGSBcwSMR3GPa1EbRd+LI60ByBqoKW3kCOjTl8uLBp9L68fbL4bxmyM0+ySkz2pLPL8WWtOVnqC3ZbCysBK5l11k2wb5lCM5ZkQJFOEVs1P+uqVuXtIseHajWg6IYdNGadu/OiqsiWBOUB6YQmNw6DQbFxWfsO9ozG4Rtf9uCMDf4nvzspalUYVGDAYPDFt7OeVXr1JGrRBaEDxNUo9j+14dC/thmEyM8WnpLoxkBJCPMY9c2hTHcWJgfsd3ksElafAZs03TWyKJuPUC60fqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3445.namprd11.prod.outlook.com (2603:10b6:a03:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.25; Wed, 24 Nov
 2021 20:01:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4690.027; Wed, 24 Nov 2021
 20:01:35 +0000
Content-Type: multipart/alternative;
 boundary="------------09mlX9ilbkWI2H0gDkCtCACK"
Message-ID: <ebff72ef-7dd8-2e4c-0481-9876b9ea1b90@windriver.com>
Date: Wed, 24 Nov 2021 15:01:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [OE-core][hardknott][PATCH] go: fix CVE-2021-38297
Content-Language: en-US
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <16BA91708F9449FA.15594@lists.openembedded.org>
In-Reply-To: <16BA91708F9449FA.15594@lists.openembedded.org>
X-ClientProxiedBy: BL0PR0102CA0047.prod.exchangelabs.com
 (2603:10b6:208:25::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from [IPV6:2607:fea8:c29d:d7c0::56df] (2607:fea8:c29d:d7c0::56df) by
 BL0PR0102CA0047.prod.exchangelabs.com (2603:10b6:208:25::24) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 24 Nov 2021 20:01:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e5b8679-5786-4849-77b5-08d9af85379b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3445:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3445BAE3B356F94A64552C249F619@BYAPR11MB3445.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S2AAS3LF/b9Sf4aDqVmXpE00eEEfYwPsADNVNohvmEwmDAglPakMwtMXB/z8M60p//hnd0T7nAMi5ilgJ0Yp7uJGeeZIBbnV6Su5lH/aphF8KIpN6uvL+0PrbnpgdoOrdVuAuTYVjeKqsW+a53/cFS3fDMzF7PKDxsSG8lrexJbRqEcN8eUrMQV858ByiqpCepMhEdZ3SYb1Fn5OSJfRfGDXAAJsP+uLVdJ0IWr3KXJo0R/4P2t0W/tMK9DP9naIrSXG90laEAse2IiaOtFJ+34K4QDThNEVhy3lvwL2A65ZkjtIz7UA2uiwd42Ozu9PoHBY0PkkjHaV73jiFIAVe4iV1Q2hijR84nPoA6l/1cJP5/2xWdypL5uaJw5pjwWxxKgBgF8azrawyEa8rgkl3uWRgm78KVOlcTlibdM0CNZfC2Vd74je5YGaTBOwD28Cqbct7eJqrpBVjwDuUZ9OB2ZPhXFZrKXrcMHuft+vMOtnTWvNOtgB6/5HyRFITGMb65gWyivrQSJiR94n/A7PUHJz9qBNFvgWzHYOQD0yphLj64ElLR/zzTnDefwaxWQxTqqr+xdWKq6sCJRmhWuncm5fvoT5SQdUHuL55e0Cod9V63kd+a9TgtWj756eLH4FG3C+j8uGtmCVv5akJRWWa/Z+VWvpampbQW506MTZAH+bEC34JZotewxR8zYgsL5p11ZlgN4Zls4hzGpyyYzfeekaczapx03wRpBbpgaj3odeYGK5tAvWvqc2wAY23oFcU/qzreJ4T8mChhn4zUAROZA+BsuzMvZUUUrQ6QKMUXBlbId3Ra91iYAKbJfU7GJ/hqHH5vVPcZx6gOLd+ocB+A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(30864003)(8676002)(31686004)(66476007)(186003)(53546011)(966005)(66946007)(4001150100001)(44832011)(6486002)(6916009)(83380400001)(38100700002)(66556008)(316002)(6666004)(2906002)(8936002)(166002)(5660300002)(36756003)(2616005)(31696002)(508600001)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NlhVOGR3Y3lPSUVUMjJ3N0FxSEU4RENiSXdiVkdmUkhaZzRhUzJScTIrUmhl?=
 =?utf-8?B?RXFuNEVheDhXTHpXZ0FRT05OZE03NkNFOFF3QWdtMkdZUjFEYmtPOEVValpK?=
 =?utf-8?B?YWhqL1IxT0xsMVN4VnZxZ0NFamJxOVdUZnNXYkVKYVFaUTBOTWVwTEpod0xz?=
 =?utf-8?B?cjAzb1dnUk80eHR4b1kwUkhQbjZxTVRQS3RvNDRSR2VyWFVVZytKTWRRNkdC?=
 =?utf-8?B?RDk2N0FjRmVsV25NT2gwZ0hLTjdtMDdSc29OeXhKMTlReTZUWEV5Q1RoZHJ1?=
 =?utf-8?B?MkR4THp1RkhWT0RqamlBdU90bi9jTCs5QXZ4ajBxYUgwbnlTRkl0VmptY20w?=
 =?utf-8?B?cnRGRnVRUERTY0RucWhnQ0J6dThNb04rYUdXRkYzd2xCWWdNbkFyeEt0QWFI?=
 =?utf-8?B?U09tNjFoakRwd3l5Uk0zemM2WHNjeXdDUW1Bcys2ZldHZTNndWdMZEFyVDFr?=
 =?utf-8?B?TFEvcStVNmhVR2kvdE1IUkxWaVdYYnNuKzVhbndmK0NsSFVBZjdjS3ZnZFVX?=
 =?utf-8?B?K3lBcWlNbTcvTE11WGZBS1pWaGdFZEtETE5mcmhUcHVxUk5Dd0wxU25HVERL?=
 =?utf-8?B?UTNjcm9MaGYxeFhIVnV6bmgrNkdPRHExcC9SRHhYamJyMklTMWJrenNtTXNH?=
 =?utf-8?B?eVdzREZ5Q1g4WklJRUR1NlZmM0luUUo2SWdPNXk0Q1dpQXJZNVBuUkdNL08w?=
 =?utf-8?B?TEY2N0ozcUhBTkI3Y1NhckJaZ2dIRkx6NEYxcTVNd3hZME9GUFd5eGhVbFJo?=
 =?utf-8?B?OFYyUWRUV2JwbmtjRFFzaGdybUQzcVhoUnRPdG8zTjR2VGtGSXJVWjk0eFNm?=
 =?utf-8?B?TmgwLzVUR0NQY2N1TUJGQTcvQlVpV090enYzR2hZbHd1ay94L3ZOaW8vS0lP?=
 =?utf-8?B?Yy9TeTg0aFM0MXh2djRNVmdSMEQ4R0w1MjM1R0lsRlVTQWlLdDc4aUJkL3FH?=
 =?utf-8?B?aDBDZ3U2c0tKWXlhQk1BeUZxV2M2OFRLTjhUaVBXQ2lGNU1tSzF5elFIL2Vk?=
 =?utf-8?B?enhRa0x0NWR5MHptaWk0ZXkreFI1QlhTYmtjS09yRHlGV1JvK3FBbm9iaGdW?=
 =?utf-8?B?Q0hiNDdPYUcwT3YwR2hYak9ucUxiRTNpcVlEVXFPVXRhT1Q5amV0VzJ0Q0xZ?=
 =?utf-8?B?THRYRHdZL1hDQWhrWkViMzB1UlhaSHgzUWZvNy9YTjZWSzZScEpxdkZsTnR5?=
 =?utf-8?B?YXU3bVNBSXd2blcrVS9Xa3M1UTBINUJOcTZ5QjFmTk40RmJ4ZHlTMHBLbmJt?=
 =?utf-8?B?enl2Nnd2QklRK2pFM01NMytPdVB0eXpSdG9nbkhHcFErWXQrQUU0bGtLQnVN?=
 =?utf-8?B?WS9FUDBCaExEMFJYVDUzNDBlS2FKV2d2dW9ZY3ZZTlQwbmNWNUk2NEt3Y2VW?=
 =?utf-8?B?Tzg4UzRJRHVKemgybzFiNC9WZWs3UWxNZDBOM1dGbTBENFNmSlY2L1lOR2pU?=
 =?utf-8?B?c2ZQSmZ6SW9LTEsyNnBSb3ExWHVSMU1oaFIzaCtJTHI1ZFdLQk5UZjM2NHRX?=
 =?utf-8?B?aFBXMk00MnNWNmNiVFhQK0VENG0rVDRGNVp2MHdKVlltVjhDdDdKWEE5dUxT?=
 =?utf-8?B?bWdDQjhGSEdmdEQ3Zko3a0FxclhWcndFZUJSVmRMeHhwT3VERkVpNThpd3c4?=
 =?utf-8?B?MVc3WTVVejFjQ3hHMm1nOUJ0WWU0aWo0NTFVU1FiODFQRytTMjA0ME5BOUxW?=
 =?utf-8?B?bVplUzkrZnBTSmpnd3RoNHUyelJ0SnpNcEJnMk5wZUJrTC90VE1HZnl2LzUv?=
 =?utf-8?B?OXBYYkJ6am5qZ3M2YmZMV0svMkpIRWU2YXRXWFpkY043U0pMUUxZK1E2QVVk?=
 =?utf-8?B?RFFKNkdyZjZORmVqVGp1RldEWFhWVHJsKy9BdG4rc0FCbmgvSksrZVVJMHJS?=
 =?utf-8?B?dnpSR0IzK2NIbnFTMG1US2ZlbnU2SEs2SG1FRndLb1gvcW5hWHhFMVVlNi9Y?=
 =?utf-8?B?QnE3bWpMc1VWT2gvOEpGbjM5NWY4dkEwdk9TdG5heTdVQmF4a0FRa2RpWWY0?=
 =?utf-8?B?WW5XWCs4WFp6MERyTDBEd1pGM3pJdWN2R0UydGQ1RWJ5Y2pRRS80UzRpSFJh?=
 =?utf-8?B?bEU5TFhDeU9rYis3VUhVaUY2TmhQemtEeFdWUytJSncxenhaNFFQNnRJbHlZ?=
 =?utf-8?B?cUdnNkhBRnRiR2kwYXNVS0o1UElyTkQ5bzJ2Nk5pNktDM0dOUGVEcFVhVE5W?=
 =?utf-8?B?UysrOHludWV4VEVQRGVsZXVXTDFaREoxZXl4TysxbzI5aTBpWW5XRThaMlYz?=
 =?utf-8?B?RTY3cDNuUGhmdkRPU0pRYzFJSlltV3h1R0VGWmZFdHlJV2Nsa2lUVDlBRWVi?=
 =?utf-8?Q?PP9W3jKoEkEcOoJYJD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7e5b8679-5786-4849-77b5-08d9af85379b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 20:01:34.9731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +kdHiW2ofASk6YsAZaANQ9gb5EpGDuyFeCa/qreZx9fwNc5wPYS4ziOy4leQxh6MZrz1G9k/LdyNLBd+FZ96SyTMk4EljCa0i5WFA+9uSSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3445
X-Proofpoint-GUID: F-fw9lLfSi00sK8kOgAvc1jdGlL4yrgt
X-Proofpoint-ORIG-GUID: F-fw9lLfSi00sK8kOgAvc1jdGlL4yrgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111240101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 20:01:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158738

--------------09mlX9ilbkWI2H0gDkCtCACK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-11-24 14:15, Trevor Gamblin wrote:
> Backport a fix from 1.16.10 to address CVE-2021-38297.
>
> Signed-off-by: Trevor Gamblin<trevor.gamblin@windriver.com>
Actually, the uprev merged to master looks tame enough on the Go side to 
do a backport. Will send that shortly.
> ---
>   meta/recipes-devtools/go/go-1.16.8.inc        |  1 +
>   ...nk-do-not-let-command-line-args-over.patch | 95 +++++++++++++++++++
>   2 files changed, 96 insertions(+)
>   create mode 100644 meta/recipes-devtools/go/go-1.16/0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.16.8.inc b/meta/recipes-devtools/go/go-1.16.8.inc
> index acc2300a286..31dc066845b 100644
> --- a/meta/recipes-devtools/go/go-1.16.8.inc
> +++ b/meta/recipes-devtools/go/go-1.16.8.inc
> @@ -17,6 +17,7 @@ SRC_URI += "\
>       file://0008-use-GOBUILDMODE-to-set-buildmode.patch  \
>       file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch  \
>       file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch  \
> +file://0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch  \
>   "
>   SRC_URI[main.sha256sum] = "8f2a8c24b793375b3243df82fdb0c8387486dcc8a892ca1c991aa99ace086b98"
>   
> diff --git a/meta/recipes-devtools/go/go-1.16/0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch b/meta/recipes-devtools/go/go-1.16/0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch
> new file mode 100644
> index 00000000000..21b82c0c9fe
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.16/0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch
> @@ -0,0 +1,95 @@
> +From 77f2750f4398990eed972186706f160631d7dae4 Mon Sep 17 00:00:00 2001
> +From: Cherry Mui<cherryyz@google.com>
> +Date: Thu, 2 Sep 2021 16:51:59 -0400
> +Subject: [PATCH] misc/wasm, cmd/link: do not let command line args overwrite
> + global data
> +
> +On Wasm, wasm_exec.js puts command line arguments at the beginning
> +of the linear memory (following the "zero page"). Currently there
> +is no limit for this, and a very long command line can overwrite
> +the program's data section. Prevent this by limiting the command
> +line to 4096 bytes, and in the linker ensuring the data section
> +starts at a high enough address (8192).
> +
> +(Arguably our address assignment on Wasm is a bit confusing. This
> +is the minimum fix I can come up with.)
> +
> +Thanks to Ben Lubar for reporting this issue.
> +
> +Fixes #48797
> +Fixes CVE-2021-38297
> +
> +Change-Id: I0f50fbb2a5b6d0d047e3c134a88988d9133e4ab3
> +Reviewed-on:https://team-review.git.corp.google.com/c/golang/go-private/+/1205933
> +Reviewed-by: Roland Shoemaker<bracewell@google.com>
> +Reviewed-by: Than McIntosh<thanm@google.com>
> +Reviewed-on:https://go-review.googlesource.com/c/go/+/354571
> +Reviewed-by: Cherry Mui<cherryyz@google.com>
> +Reviewed-by: Heschi Kreinick<heschi@google.com>
> +Trust: Michael Knyszek<mknyszek@google.com>
> +Run-TryBot: Michael Knyszek<mknyszek@google.com>
> +TryBot-Result: Go Bot<gobot@golang.org>
> +
> +Upstream-Status: Backport (https://github.com/golang/go/commit/77f2750f4398990eed972186706f160631d7dae4)
> +
> +CVE: CVE-2021-38297
> +
> +Signed-off-by: Trevor Gamblin<trevor.gamblin@windriver.com>
> +---
> + misc/wasm/wasm_exec.js           |  7 +++++++
> + src/cmd/link/internal/ld/data.go | 11 ++++++++++-
> + 2 files changed, 17 insertions(+), 1 deletion(-)
> +
> +diff --git a/misc/wasm/wasm_exec.js b/misc/wasm/wasm_exec.js
> +index 82041e6bb9..a0a264278b 100644
> +--- a/misc/wasm/wasm_exec.js
> ++++ b/misc/wasm/wasm_exec.js
> +@@ -564,6 +564,13 @@
> + 				offset += 8;
> + 			});
> +
> ++			// The linker guarantees global data starts from at least wasmMinDataAddr.
> ++			// Keep in sync with cmd/link/internal/ld/data.go:wasmMinDataAddr.
> ++			const wasmMinDataAddr = 4096 + 4096;
> ++			if (offset >= wasmMinDataAddr) {
> ++				throw new Error("command line too long");
> ++			}
> ++
> + 			this._inst.exports.run(argc, argv);
> + 			if (this.exited) {
> + 				this._resolveExitPromise();
> +diff --git a/src/cmd/link/internal/ld/data.go b/src/cmd/link/internal/ld/data.go
> +index 52035e9630..54a1d188cd 100644
> +--- a/src/cmd/link/internal/ld/data.go
> ++++ b/src/cmd/link/internal/ld/data.go
> +@@ -2330,6 +2330,11 @@ func assignAddress(ctxt *Link, sect *sym.Section, n int, s loader.Sym, va uint64
> + 	return sect, n, va
> + }
> +
> ++// On Wasm, we reserve 4096 bytes for zero page, then 4096 bytes for wasm_exec.js
> ++// to store command line args. Data sections starts from at least address 8192.
> ++// Keep in sync with wasm_exec.js.
> ++const wasmMinDataAddr = 4096 + 4096
> ++
> + // address assigns virtual addresses to all segments and sections and
> + // returns all segments in file order.
> + func (ctxt *Link) address() []*sym.Segment {
> +@@ -2339,10 +2344,14 @@ func (ctxt *Link) address() []*sym.Segment {
> + 	order = append(order, &Segtext)
> + 	Segtext.Rwx = 05
> + 	Segtext.Vaddr = va
> +-	for _, s := range Segtext.Sections {
> ++	for i, s := range Segtext.Sections {
> + 		va = uint64(Rnd(int64(va), int64(s.Align)))
> + 		s.Vaddr = va
> + 		va += s.Length
> ++
> ++		if ctxt.IsWasm() && i == 0 && va < wasmMinDataAddr {
> ++			va = wasmMinDataAddr
> ++		}
> + 	}
> +
> + 	Segtext.Length = va - uint64(*FlagTextAddr)
> +--
> +2.33.0
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158737):https://lists.openembedded.org/g/openembedded-core/message/158737
> Mute This Topic:https://lists.openembedded.org/mt/87288269/3616776
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [trevor.gamblin@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------09mlX9ilbkWI2H0gDkCtCACK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-11-24 14:15, Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16BA91708F9449FA.15594@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Backport a fix from 1.16.10 to address CVE-2021-38297.

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a></pre>
    </blockquote>
    Actually, the uprev merged to master looks tame enough on the Go
    side to do a backport. Will send that shortly.<br>
    <blockquote type="cite" cite="mid:16BA91708F9449FA.15594@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
---
 meta/recipes-devtools/go/go-1.16.8.inc        |  1 +
 ...nk-do-not-let-command-line-args-over.patch | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.16/0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch

diff --git a/meta/recipes-devtools/go/go-1.16.8.inc b/meta/recipes-devtools/go/go-1.16.8.inc
index acc2300a286..31dc066845b 100644
--- a/meta/recipes-devtools/go/go-1.16.8.inc
+++ b/meta/recipes-devtools/go/go-1.16.8.inc
@@ -17,6 +17,7 @@ SRC_URI += &quot;\
     <a class="moz-txt-link-freetext" href="file://0008-use-GOBUILDMODE-to-set-buildmode.patch">file://0008-use-GOBUILDMODE-to-set-buildmode.patch</a> \
     <a class="moz-txt-link-freetext" href="file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch">file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch</a> \
     <a class="moz-txt-link-freetext" href="file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch">file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch</a> \
+    <a class="moz-txt-link-freetext" href="file://0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch">file://0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch</a> \
 &quot;
 SRC_URI[main.sha256sum] = &quot;8f2a8c24b793375b3243df82fdb0c8387486dcc8a892ca1c991aa99ace086b98&quot;
 
diff --git a/meta/recipes-devtools/go/go-1.16/0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch b/meta/recipes-devtools/go/go-1.16/0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch
new file mode 100644
index 00000000000..21b82c0c9fe
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.16/0001-misc-wasm-cmd-link-do-not-let-command-line-args-over.patch
@@ -0,0 +1,95 @@
+From 77f2750f4398990eed972186706f160631d7dae4 Mon Sep 17 00:00:00 2001
+From: Cherry Mui <a class="moz-txt-link-rfc2396E" href="mailto:cherryyz@google.com">&lt;cherryyz@google.com&gt;</a>
+Date: Thu, 2 Sep 2021 16:51:59 -0400
+Subject: [PATCH] misc/wasm, cmd/link: do not let command line args overwrite
+ global data
+
+On Wasm, wasm_exec.js puts command line arguments at the beginning
+of the linear memory (following the &quot;zero page&quot;). Currently there
+is no limit for this, and a very long command line can overwrite
+the program's data section. Prevent this by limiting the command
+line to 4096 bytes, and in the linker ensuring the data section
+starts at a high enough address (8192).
+
+(Arguably our address assignment on Wasm is a bit confusing. This
+is the minimum fix I can come up with.)
+
+Thanks to Ben Lubar for reporting this issue.
+
+Fixes #48797
+Fixes CVE-2021-38297
+
+Change-Id: I0f50fbb2a5b6d0d047e3c134a88988d9133e4ab3
+Reviewed-on: <a class="moz-txt-link-freetext" href="https://team-review.git.corp.google.com/c/golang/go-private/+/1205933">https://team-review.git.corp.google.com/c/golang/go-private/+/1205933</a>
+Reviewed-by: Roland Shoemaker <a class="moz-txt-link-rfc2396E" href="mailto:bracewell@google.com">&lt;bracewell@google.com&gt;</a>
+Reviewed-by: Than McIntosh <a class="moz-txt-link-rfc2396E" href="mailto:thanm@google.com">&lt;thanm@google.com&gt;</a>
+Reviewed-on: <a class="moz-txt-link-freetext" href="https://go-review.googlesource.com/c/go/+/354571">https://go-review.googlesource.com/c/go/+/354571</a>
+Reviewed-by: Cherry Mui <a class="moz-txt-link-rfc2396E" href="mailto:cherryyz@google.com">&lt;cherryyz@google.com&gt;</a>
+Reviewed-by: Heschi Kreinick <a class="moz-txt-link-rfc2396E" href="mailto:heschi@google.com">&lt;heschi@google.com&gt;</a>
+Trust: Michael Knyszek <a class="moz-txt-link-rfc2396E" href="mailto:mknyszek@google.com">&lt;mknyszek@google.com&gt;</a>
+Run-TryBot: Michael Knyszek <a class="moz-txt-link-rfc2396E" href="mailto:mknyszek@google.com">&lt;mknyszek@google.com&gt;</a>
+TryBot-Result: Go Bot <a class="moz-txt-link-rfc2396E" href="mailto:gobot@golang.org">&lt;gobot@golang.org&gt;</a>
+
+Upstream-Status: Backport (<a class="moz-txt-link-freetext" href="https://github.com/golang/go/commit/77f2750f4398990eed972186706f160631d7dae4">https://github.com/golang/go/commit/77f2750f4398990eed972186706f160631d7dae4</a>)
+
+CVE: CVE-2021-38297
+
+Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
+---
+ misc/wasm/wasm_exec.js           |  7 +++++++
+ src/cmd/link/internal/ld/data.go | 11 ++++++++++-
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/misc/wasm/wasm_exec.js b/misc/wasm/wasm_exec.js
+index 82041e6bb9..a0a264278b 100644
+--- a/misc/wasm/wasm_exec.js
++++ b/misc/wasm/wasm_exec.js
+@@ -564,6 +564,13 @@
+ 				offset += 8;
+ 			});
+ 
++			// The linker guarantees global data starts from at least wasmMinDataAddr.
++			// Keep in sync with cmd/link/internal/ld/data.go:wasmMinDataAddr.
++			const wasmMinDataAddr = 4096 + 4096;
++			if (offset &gt;= wasmMinDataAddr) {
++				throw new Error(&quot;command line too long&quot;);
++			}
++
+ 			this._inst.exports.run(argc, argv);
+ 			if (this.exited) {
+ 				this._resolveExitPromise();
+diff --git a/src/cmd/link/internal/ld/data.go b/src/cmd/link/internal/ld/data.go
+index 52035e9630..54a1d188cd 100644
+--- a/src/cmd/link/internal/ld/data.go
++++ b/src/cmd/link/internal/ld/data.go
+@@ -2330,6 +2330,11 @@ func assignAddress(ctxt *Link, sect *sym.Section, n int, s loader.Sym, va uint64
+ 	return sect, n, va
+ }
+ 
++// On Wasm, we reserve 4096 bytes for zero page, then 4096 bytes for wasm_exec.js
++// to store command line args. Data sections starts from at least address 8192.
++// Keep in sync with wasm_exec.js.
++const wasmMinDataAddr = 4096 + 4096
++
+ // address assigns virtual addresses to all segments and sections and
+ // returns all segments in file order.
+ func (ctxt *Link) address() []*sym.Segment {
+@@ -2339,10 +2344,14 @@ func (ctxt *Link) address() []*sym.Segment {
+ 	order = append(order, &amp;Segtext)
+ 	Segtext.Rwx = 05
+ 	Segtext.Vaddr = va
+-	for _, s := range Segtext.Sections {
++	for i, s := range Segtext.Sections {
+ 		va = uint64(Rnd(int64(va), int64(s.Align)))
+ 		s.Vaddr = va
+ 		va += s.Length
++
++		if ctxt.IsWasm() &amp;&amp; i == 0 &amp;&amp; va &lt; wasmMinDataAddr {
++			va = wasmMinDataAddr
++		}
+ 	}
+ 
+ 	Segtext.Length = va - uint64(*FlagTextAddr)
+-- 
+2.33.0
+
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#158737): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/158737">https://lists.openembedded.org/g/openembedded-core/message/158737</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/87288269/3616776">https://lists.openembedded.org/mt/87288269/3616776</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>
--------------09mlX9ilbkWI2H0gDkCtCACK--

