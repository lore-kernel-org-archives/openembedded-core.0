Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1B9C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 06:11:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3409.1648534260239020958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 23:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pHFN2+qF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=108765020a=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22T6Av6C029619
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 23:10:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : cc : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=9NK5/dGGRVNdLBnpffPNMkTrIrAt+/Gs2DWG34a8Ph0=;
 b=pHFN2+qF9DbkPqEaTR16GYjG+7tHV5CpDCWL11cnmUkurYFV1oUnd7UsjyWfTvi8Xi0Z
 g8Vb2UFmE+kGtMsDfbIho/+nf30+a59euIsE10HzylVY+c7nPHWvhnBTneVBSHSc5h8e
 xmHmoFOOX/bKUA5yLJ6eFfq3tQ7O33a0GY86AE7c6jHuWZpQbTw+7zvTJCPbI5d8w2vA
 STTI+rJThlo/Mj04tx1KFOqaljKwn4Dj1/NAROEjB1i0fumFIBud80EnF26IsBoRfXWX
 Ep7/loMJL/GdvCRH09l88695qaBm6bid3ivOqy98McHQTDCXSqU9+/Sb7Q8KeHXW4mrw 6g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f22bj9yn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 23:10:57 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 22T67R2Y022212
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 23:10:56 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f22bj9yn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Mar 2022 23:10:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHLoJMmcXvQTtVUqVfgG6CkCwAcvrUarYAweNrXSfbTz2k4BOVDCGInQ7F2zUkn+BB9UimAtGFF03+sLiaEMtSIWRtrf8tm4vdusqIjBZdrlxe85fcMmbL7nj/jZRWb/MUqmvVcKv/FLYoxRe2iWv0uYcuYkyAWTKpSoOFtaqoZ3ixpHlWdJ+CsMUuuxP321z2w+8PwWJB1+Ddn3BrpJE12lYWIlbcesjckHlD5owmgV7CE1b3zlKp3zzVy8Wd2zDvthGmEhbj1Zkkj0SM1whX7IGAVQVZsa+q19V8aRd1c+r4l/lYOimd3XYtTSpwNH8yELXTKdtSBocXL9JEGNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NK5/dGGRVNdLBnpffPNMkTrIrAt+/Gs2DWG34a8Ph0=;
 b=Er3VweuhH55UTeK2jtKTqjGhHWYokX1I0R2qJ1neGOt3ffLOCVSb4oiOsYvIY3XUi7A6OnBs87fHWVxfGT4oVKV+uy73gllKiGJzYrVXae38pwde269OMIAeLBN9ccxdId4466dzjVAzfBM9rXOx6mA6jQZP8TEdbOkThcvZ5QkeMvawEPULpKmI8ym4XxKNQkTvmnSI117RAURK41xrhP+BSLGUzkSRDnz+9dtfoZ2o0TYTaPFgi90YDR4ST3d/VbKupFYLYtgbNCXaZXaGsqN79Hi7ix5bUUa7f/jilgSEuS/fYb03EjaApa8gkIbMUBr3lfwyxLiEnESDvy/pIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 by CY4PR11MB1285.namprd11.prod.outlook.com (2603:10b6:903:25::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 29 Mar
 2022 06:10:52 +0000
Received: from CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::5d2f:3638:aae8:1f80]) by CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::5d2f:3638:aae8:1f80%7]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 06:10:51 +0000
Subject: Re: [OE-core] [meta-oe][PATCH v2] graphviz: add pkg_postinst script
From: Kai <kai.kang@windriver.com>
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <16E0C3F6BCA9DBAD.3733@lists.openembedded.org>
Message-ID: <273c4ab0-e84e-7c6f-56f7-1b8726a7a2b5@windriver.com>
Date: Tue, 29 Mar 2022 14:10:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <16E0C3F6BCA9DBAD.3733@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------47FE994A371E139F43F4600F"
Content-Language: en-US
X-ClientProxiedBy: TY2PR0101CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::20) To CO1PR11MB4851.namprd11.prod.outlook.com
 (2603:10b6:303:9b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3e13681-dfc5-4347-a5d9-08da114ae071
X-MS-TrafficTypeDiagnostic: CY4PR11MB1285:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1285083644CBBA0E3ADAF596951E9@CY4PR11MB1285.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9oaJJEa0jwypsis+GhttzsMD9q3tnBLznJmxx1E94DBE8+oDJco1PgwchSc1u7koPrjGwjoKIfvZNfUpBBRswFxdYVxFnOUSVvM/LP7RHM56jkYXzDGVxjT15GT2z9IIHimAR06e0FPimWy14ctYXpHJtq0tKj56YgQtc5lHzsJSWMDpf7YnU1CgpE3ngPrLOJ/j7o9HsxhWd5KWYM3+3uMR4gG4YAkUXmYWC3F9fmIZUP8YMqSwnwoG18RvdRjj+DHYsv4ITjBw6lvkiITpBqanmjYf46vys/ihhWYxvJM/krIJO1mOR0mzYua/b6u54xaBxxgP8uQmqclLEQHKLgXJAmVYJtMmAH4LamPV9hDaN0zE/O5geuRQI0MP3OQb/lJSnc5WU/jIWgAHdV8DE5GeOWoUKdhpV088zkmkxO5cEpn0x4cuA2XVuKmm7NeBj+E0zRQ/kQVJTgY+aHl0+kqYG2jQ5cWAocJRy+sDFCPsVT1ZhgWTsI+ePlJ+OS7kJRUzDjLsotll5IJc3MckWwjEcPVtTX3YUct7FKj1v2tcc2pl7556NV058AIgrs00T9SCKLiDQNfp3bRi68zgTgG7lpmpTtUXcgKCGwkufvoq60egjSacqqGMlZyTSres+KLEMn2FscU/MvDY89dd4qk7msTdx2YQgftHpuDk33KedQytLPRzgR98k2NbTtVaLUg7+Wjfe6XwIdAyM6Trg5MN2MXnQ38tEio73ckPMkCyp+wcikRqbDsrpG2OR+mBY0LKWpfL/HORwQhB3ZV6NPKvHMOVXhczKxGqFnY9fULkkvVNk1eZsEiJaVZCZntCRO7woIZ9cFEMNuSMs/TrEeIC8vSS4NswUAH3+ulDCRcTHgsR8gw1Xjf4MppasinS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4851.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(36756003)(52116002)(26005)(33964004)(166002)(186003)(6666004)(2906002)(8936002)(5660300002)(6512007)(83380400001)(6506007)(31696002)(53546011)(6916009)(6486002)(508600001)(4326008)(316002)(2616005)(86362001)(66946007)(66556008)(66476007)(38100700002)(38350700002)(966005)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWRpekE0ZjZxTVlzU25XcktvM1V4L0pzRjY4ME5PRTh1L2Z2YWRSaU9ybmtv?=
 =?utf-8?B?cUtmb3pOVFM5Z1J1NmlVUEllczdSeVhJd1gxL0xNbDhXR1lqUjVmNmt1RVRM?=
 =?utf-8?B?Y0VncUswN0pDOFhKOWR2ZEVSMm4wL005ZVFndzN5MlRXTGpUSURyOG5UcG5p?=
 =?utf-8?B?c0p0Y1I3UEl1U0VQdG9Fcy9qZEdnWGoyRzVWSlUrQ3BzeHNrOHdtODJ5Zmh1?=
 =?utf-8?B?b3ZsY0UvLzhaRG4rYlhwbmNLQmNrbTVQeGNpaENxWVhrVmxaNjJpMTRUbHd6?=
 =?utf-8?B?RmtPQmpDRkE5NjRXRkxWZHB1T2ZjeG5NZHIrRTZ5TFE4SGtHcTVoQ2lwSjR2?=
 =?utf-8?B?SjUwV1FPT3ZXT0k4WUd3RjVBNnFvc2JaWm54WC9PUlRHSWhybWFHaHhmWTBO?=
 =?utf-8?B?czFKMnBRVmVUcWhLbkRmQm5WaDk5ZDdMWGR3OVYxVTBuaE5FMlB1VS8yNC9t?=
 =?utf-8?B?U1NuRkFLcDYxeURMUC9vdmpzcjh3RTVIbkw0a21GSGxPbWhEd3prV1Uva0Ux?=
 =?utf-8?B?R29veU9LeG5XRW5pY2JFZWhoekQ1OHpMc3lsMmNEdVg2NmNzbWc0bDlOZWo0?=
 =?utf-8?B?akE2UTNNeEowZ1BIdUtMNzNHeHF6YTdCV21HQWRCcjR4bGllR2hmSXhFMEtw?=
 =?utf-8?B?dmNaYUJ3UU9tYkNsbVFqK2VMQy9aY1c1WHRNbnBOZ004ZldMOHljTUh3bnE3?=
 =?utf-8?B?L1dNRVlBTkQ5M3lRT3Bac1BvWWJScTBRYVcyWjVaVE80NmtMbWxQMkN1MFpQ?=
 =?utf-8?B?empKSFpOQzFZL3lzQXRZREpzd2F3dVdMVW1ZODZiOHIyVStqZFhoLzYvbzhU?=
 =?utf-8?B?bU8yRk1OZEtiVkUvT1l2Z3lqN24zaFBwR3hmczczdHVZeEV5Q3QvRUVjUmVK?=
 =?utf-8?B?VWQ3UDI0YU5Gd1pUd2VCQnVaZENFUytCUGRYdG1EL2lGV3Jpd0RPdGpNbFFN?=
 =?utf-8?B?V3A2NkNMMjBER2oxdG5IQmtvUy83YlFZWVhxUkR1U21veWYwS3dRRk5yVENn?=
 =?utf-8?B?RS9MM1lSbU9lZzc4c3Nqd0xMREhWcC9QWFNaTllyMXQ0UHNlWTlLNWs5bTZl?=
 =?utf-8?B?ZjRYRERhZDFaTUV0djB6V0d1RktxMVZVWE1HOHY0NnQxQWk4SUxuMnlaSHdY?=
 =?utf-8?B?MmxKOFNFM0FuMnRHQWRMcitydXY0MFcyNmlRZmFad2tjU1l3c0FhK013VWpI?=
 =?utf-8?B?dFBKdmh0aThhc25vaGtHK1hoWUg3Nkp6UGpXRHAxamsybzlPS2Q4N25IUVE2?=
 =?utf-8?B?My9KcFJnaDFTS3ErZnlKTkE5VzZxQ0VSUHBVTlJZZFNYYUtFNXBVdmEvT1o4?=
 =?utf-8?B?eWwyRmg3Uyttd0xqV3dnL3FSUEl1YlgvK0Uzb29HVTFEeWtQTGpNQmFPZzhD?=
 =?utf-8?B?Wm45TkJHc3F6RS9NcmpjemhKdDZEVWtScTZ3LzA0YTAyaE8rdDVLQWNhS0Q0?=
 =?utf-8?B?VDdQWFpnUHcvbWVuWGNvQXU4aVV2K2NqdTNzNW1LUnUvRW9wbWNjRzkzTk9X?=
 =?utf-8?B?RlBHNlZ2SEV5dENWZFdCSHhGL1U0UWFjQ0tRQjROUXBxSmFFQ2h2M1FFRUZZ?=
 =?utf-8?B?cEEvNUh2dHNBTjFHM3J6K2FEZVBLUm44ZFZvT292VnljNzlSSlpBTVdGS2N0?=
 =?utf-8?B?VXJpdWhFZzQzL1ZhamFHbCtFV05yc0lOamJGT1hROEsvNmltNDAwRTZ0elVr?=
 =?utf-8?B?cjhyRTNZSFNNTloxdnFCTXZncVdYNUpET0d2SlVVMys0TVBGM2I0WVFCUERB?=
 =?utf-8?B?clhMcmNzeVZlZTV2Z1ZoY0l5a3FFeUFNQkpyRXNGQWpOOUhxR3NEU0haVEpl?=
 =?utf-8?B?TkY0YUdlL2J3K0hZTGpUWGoyYUMrUjhHK1NWNVdWNHV1ODE3dTlsRVlwVzVK?=
 =?utf-8?B?VFVVVFJGZ1g0TUhsckFzbFFOaWQ0dHJZY2xqZEFMOXhpODdrdWpuc0xzVFFF?=
 =?utf-8?B?Rno1OUFBR21MMjBucHNGR2VRVVc1TVdwTFFpSm9mcUJLRjBxbTBBN1VNS3M1?=
 =?utf-8?B?NTk4cDUxU3lQVGtjc0VyRE82NnZUZ29vSFBxKzBNeTYzU1I4SDFLR0xaVWht?=
 =?utf-8?B?b2UrZkxtQnZNekV4TnBwcFdVVGVCVzk0b1lPM2JjWm10bXpkS3lnYjliY0xS?=
 =?utf-8?B?Q3pNWU1zaU92MTZpdHd0V1UvbFdiMzVKREU2R05RUVBBdnRmVU1GZFNSL25F?=
 =?utf-8?B?Nnk5QkxGak11N3Y3ZEFYSEJSLy9OemE2MlJQNXdLRmIyU3dZUXo4eTUrOHZO?=
 =?utf-8?B?YzhmQzNSZkY3UXY2cWZDUWN1ZUlrTHVEb3BwZVp0ZHdkTnRpTFJSZWVUZkl5?=
 =?utf-8?B?U3RHa2Y1di9qODRpV1dLUDV3Z1R2MTdkR3ZsYUJmWlBIUklBckdyZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a3e13681-dfc5-4347-a5d9-08da114ae071
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4851.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 06:10:51.8080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6JMsOwwLdn25FrnJyWVAe1fUNDyBRC5DR8pMBYLlymP9PrwW1RGzysyPL7fu2FqR6Frfhy7NAFCEnlcSMxOr+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1285
X-Proofpoint-ORIG-GUID: XnzGAh9KJWoApmIZ8SL2pkn69dZVXOWr
X-Proofpoint-GUID: kD2wgwO8pNUJAEa_bSPgFYSDrrn_Q6PP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_02,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203290038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 06:11:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163733

--------------47FE994A371E139F43F4600F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/29/22 1:48 PM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> It needs to run `dot -c` first before call 'dot' command, otherwise it
> fails with:
>
> | Format: "png" not recognized. No formats found.
> | Perhaps "dot -c" needs to be run (with installer's privileges) to
>    register the plugins?
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>

Wrong list. Sorry for the noise.

Kai

> ---
> v2:
> * add guard to check qemu-usermode is supported
>
>   .../graphviz/graphviz_2.50.0.bb               | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
> index 0eca7fdba..66353b837 100644
> --- a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
> @@ -17,7 +17,7 @@ DEPENDS = " \
>   DEPENDS:append:class-target = " ${BPN}-native"
>   DEPENDS:append:class-nativesdk = " ${BPN}-native"
>   
> -inherit autotools-brokensep pkgconfig gettext
> +inherit autotools-brokensep pkgconfig gettext qemu
>   
>   SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-releases/${PV}/${BP}.tar.xz \
>              "
> @@ -81,6 +81,23 @@ graphviz_sstate_postinst() {
>   }
>   SYSROOT_PREPROCESS_FUNCS:append:class-native = " graphviz_sstate_postinst"
>   
> +pkg_postinst:${PN} () {
> +    if [ -n "$D" ]; then
> +        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
> +            ${@qemu_run_binary(d, '$D', '${bindir}/dot')} -c
> +        fi
> +    else
> +        dot -c
> +    fi
> +}
> +
> +pkg_postrm:${PN} () {
> +    rm -f $D${libdir}/graphviz/config*
> +    rmdir --ignore-fail-on-non-empty $D${libdir}/graphviz
> +}
> +
> +PACKAGE_WRITE_DEPS += "qemu-native"
> +
>   PACKAGES =+ "${PN}-python ${PN}-perl ${PN}-demo"
>   
>   FILES:${PN}-python += "${libdir}/python*/site-packages/ ${libdir}/graphviz/python/"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163732): https://lists.openembedded.org/g/openembedded-core/message/163732
> Mute This Topic: https://lists.openembedded.org/mt/90102726/3616933
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kai.kang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


--------------47FE994A371E139F43F4600F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/29/22 1:48 PM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16E0C3F6BCA9DBAD.3733@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

It needs to run `dot -c` first before call 'dot' command, otherwise it
fails with:

| Format: &quot;png&quot; not recognized. No formats found.
| Perhaps &quot;dot -c&quot; needs to be run (with installer's privileges) to
  register the plugins?

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a></pre>
    </blockquote>
    <p>Wrong list. Sorry for the noise.</p>
    <p>Kai<br>
    </p>
    <blockquote type="cite" cite="mid:16E0C3F6BCA9DBAD.3733@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
---
v2:
* add guard to check qemu-usermode is supported

 .../graphviz/graphviz_2.50.0.bb               | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
index 0eca7fdba..66353b837 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
@@ -17,7 +17,7 @@ DEPENDS = &quot; \
 DEPENDS:append:class-target = &quot; ${BPN}-native&quot;
 DEPENDS:append:class-nativesdk = &quot; ${BPN}-native&quot;
 
-inherit autotools-brokensep pkgconfig gettext
+inherit autotools-brokensep pkgconfig gettext qemu
 
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-releases/${PV}/${BP}.tar.xz\">&quot;https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-releases/${PV}/${BP}.tar.xz \
            &quot;</a>
@@ -81,6 +81,23 @@ graphviz_sstate_postinst() {
 }
 SYSROOT_PREPROCESS_FUNCS:append:class-native = &quot; graphviz_sstate_postinst&quot;
 
+pkg_postinst:${PN} () {
+    if [ -n &quot;$D&quot; ]; then
+        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
+            ${@qemu_run_binary(d, '$D', '${bindir}/dot')} -c
+        fi
+    else
+        dot -c
+    fi
+}
+
+pkg_postrm:${PN} () {
+    rm -f $D${libdir}/graphviz/config*
+    rmdir --ignore-fail-on-non-empty $D${libdir}/graphviz
+}
+
+PACKAGE_WRITE_DEPS += &quot;qemu-native&quot;
+
 PACKAGES =+ &quot;${PN}-python ${PN}-perl ${PN}-demo&quot;
 
 FILES:${PN}-python += &quot;${libdir}/python*/site-packages/ ${libdir}/graphviz/python/&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#163732): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/163732">https://lists.openembedded.org/g/openembedded-core/message/163732</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/90102726/3616933">https://lists.openembedded.org/mt/90102726/3616933</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------47FE994A371E139F43F4600F--

