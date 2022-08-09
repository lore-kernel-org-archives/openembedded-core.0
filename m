Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B668AC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 04:59:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.8249.1660021166378875569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 21:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=fz/D/mU+;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5220416ab7=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2794uXDb016634
	for <openembedded-core@lists.openembedded.org>;
 Mon, 8 Aug 2022 21:59:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=zzwWkORzNN3VGGExqHneFmfNGsraug4tmtamocvRoYc=;
 b=fz/D/mU+m9Dk+Nhxgee5EHHBEo4GHegMVtlzwKSHrmcuZ+wszrtOdFnr0O6Pz8ziQx/N
 hpP0gs8MZsXS3qo/mO8H/n8gnJEBVej59yFNEzwnwtgRJ9YJ8Rg+9fw3tDXlUoof0dqe
 IceX4+PcLsyvHW3qEdjXaY5q6iVnr7QRcJGoU/J+yXQ78zVZbC73gNI8U42cd7wZeXjE
 Spd+pYwbmHMYL+AVCLmz3Z69HuhVWNA6SWL+m2vDRQ2Nc7ticXd3BmcHinC8VcsBaLzw
 l0q3j8VUg7kCJZrrosr2mMVCQA5IAdZ6A6BX8a8GgMmC9wgn6cWyu+wrmV85dtG6+H6o +A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hskk4j43j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 21:59:25 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2794xPWT023057
	for <openembedded-core@lists.openembedded.org>;
 Mon, 8 Aug 2022 21:59:25 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hskk4j43h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 21:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVHjkAvLIxLJ3ymZ2P2ISaJoZhuwbrV/onbLfqtC0AIEnze8jMWfEYJgGb3Ji9O0sXMjBHbnE1uv5lfebCvaiHjv21ME/DiP46fuZUmlHOV3whxc9DgYRC1pLTmr1h0f1fqkXblbsVRJDAR8hWrCQu/RfYy/IYCDtcQcscgb9IxAoyu638FsdmhOcHE1+5ksCyz/Kc5Rm756F1imOebnXc1FWFiPASJIsCrDGaYUVLN9U1tQng/MKNiJV0/Az/9gKl4N6Br02OJuJFrH4pUx+kFJAdjq85c7cROdMIG74dgkl4INKwrlh2B4Ksu+AYlVpu1ZAB8LYLE+V/63uQmdcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzwWkORzNN3VGGExqHneFmfNGsraug4tmtamocvRoYc=;
 b=I9HgBpajaI3U5mx0+48iSTCHH8oytNKS+8uE+VCAuNRni1o9vSdpuqcG4Q4txB388yQJg+rVeA4BaHIK/PUoijtQcvTno3tv745dCq7uCl6cTQ8HbhptVCdSKSzUHnXbaYIdPcCf5TR55oSAuKRZWBj1yiVMQVxfvUAcwBQCvqIyK6KZLMKYlUAoDyAAjfssTFkcijuVPVKBj3QKn8SIV0NgEWrMtCfDpKXon0DiD6/sydEZbOL6rYhPDRf9pKeBOUGygIuZouo3Ub+/JIxB1zRcHo1f51RnP+Qq8dp1nL619lTK2SxFCBPcYZtCrJZkBudCNaPTGqwjLLNz/SiBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 SJ0PR11MB4862.namprd11.prod.outlook.com (2603:10b6:a03:2de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 04:59:22 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::d0c1:127f:313e:e8f9]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::d0c1:127f:313e:e8f9%3]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 04:59:22 +0000
Content-Type: multipart/alternative;
 boundary="------------ZbA04sM9rj9QW6RmS6tN1TJ8"
Message-ID: <b2aea74e-f82e-c5e1-6d53-753d66360784@windriver.com>
Date: Tue, 9 Aug 2022 12:59:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v2] mesa: fix compile error when debug build
 enabled
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Ross.Burton@arm.com, openembedded-core@lists.openembedded.org
References: <20220727072956.15438-1-kai.kang@windriver.com>
 <CA+chaQf7iEzXN-rH5HxjvaveHxg9mPtvh-q-5d_pxoWY=G01Lw@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: 
 <CA+chaQf7iEzXN-rH5HxjvaveHxg9mPtvh-q-5d_pxoWY=G01Lw@mail.gmail.com>
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b8f7f04-f2f0-4ed6-8955-08da79c3ec56
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4862:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8pKvKc6tteN/Zl0ZjaPznt1axQ72GdGG/XkfPNGR7sAotjetSqoCiurbKroFBxzi60dNEZ1Zx/Nasd1GDG891zyox/cEXnVKvnutu38X6uNxPsuBmROuR4aNlNz5Yfa/FmCDtZWZLMzH2jbpj5EHZJag5GCL/hATpu6MKNLyyuFctNFuBbPjSBxubDlV4yG9IGgrw4LA7n6Pci8nMlhnaHOUAj6vg9d2/SRpvZZFyaZ9ZIRruSs0cUpUxBOxvchb7/jrT2BwqUNvEfHrWnL4uh2h4S0PJ4hMSe+1DIenpx6djfblCXCH+HTbQ1WYarJHMC1M81vXsjjPBvOG88Y7Rmv8BoqG0S0dqm39fl9pH3Ex1RI54mmJgdaDSBL5Qnq2JsYYBobjBSEizD3V1QarmdxY04Qk3xbTAkRrPSsTyuhNj7ATo8YyU4cF4xfgtBsbpRgzuRxOzHOK8r7iCD6ssFfuXKm99Q413rxnYPELTVl9K3A1Kt9bUBB91XRc3ZiKOSsZpi6ZA2LJX8/aPa2y7vhaqkquJEvFEmJygvqUkqOdL51L9kOVL3b2ufecGkECDY2ayVLoCR6vlkYfYB4UJnrS9V/T+uJr+VVDW/AXnnlG6bifsPFP8PsWK7l5vD99lixPHQMq8MSBvuJxExUr50vIZcOwgEqiCve1sWaa/PW9HrKPD3qu4CkZGv0v7vj7gorFQk7X2eux22tBVGqKZcCvOgVaHAuPTselNReVPDtxa+HCfOf1+tM6MVX6dkALKBxaHkybxIPsHb3MyKWH2Pv0GWPkTuuU7w0oFmtQSbxNYk7FyhSCQVh9DzHR0EDPBh2oJlAzsw9lYMjSTf6KQo0TuuVlFbkQ6l714EZBpdnif4I38zb8mZYRbL4t+2tRpxzoeq9rOeLwTWV24J7Crg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39850400004)(396003)(376002)(346002)(6666004)(6512007)(41300700001)(30864003)(26005)(6506007)(53546011)(83380400001)(33964004)(2906002)(2616005)(38100700002)(166002)(186003)(6486002)(66946007)(31686004)(966005)(66476007)(66556008)(4326008)(8676002)(36756003)(6916009)(86362001)(8936002)(316002)(478600001)(31696002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RjRFdGxjMTlzYkhBcGFCRUgvd0YzRzNkVUluNGhtU3NoV0NXTE9CNlU1cTJX?=
 =?utf-8?B?anBwZk5lYTRPRXlXQ1g1V2EvM1pJT3ZyeGJ1VnlaOFloV2pDdTNBazc4M3lj?=
 =?utf-8?B?bFJLem8yTlExUWExc1JnM3kvUTRFeGNsclJtb01mKzhWKzJqeXpGTTVBcjVi?=
 =?utf-8?B?ck9LWGdUKzZCY0dqbUNTajMrVjcvcmR4MFlHMHh6c2hIQVZwVEMveElaSUJu?=
 =?utf-8?B?U2plV1lmNUo2dW5MY1R5alRvTUNWV01LT25ab2VMWDRaNEtnTnRPWlVrR2tU?=
 =?utf-8?B?T2hsbGJHdDlaZXhtNkRkdWlVNEwwWGM3YlB5cU5VL2pnMkkvRHZxRUtrVE5a?=
 =?utf-8?B?RTVxbDdDMFEwZThuYzk0dk1PdnQrRVhLNFFhN1lLRXdKM21sSjlQaVZFSW1v?=
 =?utf-8?B?K2QyT1BvZE5DY0hvR3BWMEJVL3ZPa1d2US9Xc0NpYkNPMFZJTjNmajhNd09z?=
 =?utf-8?B?dVJKMC9EWFFldGFjT3JpZXV1MXVLTjlCa3orTTMwRlEweFFwTFNxSmxITUtp?=
 =?utf-8?B?OVkrWXlLSzBUVjhIbEdmTm5HakgrMkZlOVZyRjVzL3dncTJPeDVDelRSSWZ2?=
 =?utf-8?B?K1k2a1NyT1pzRGZsemxTSllIS3B3WFlGNW9Kb09peVhTaVpKQXhnQzhpOUIr?=
 =?utf-8?B?bTNJNDhhMDhrcFR4QUdlT2NpVCtBdmoxcXNBb2pubmFSbDF1dFhORGpna2hq?=
 =?utf-8?B?bEw1R0V6YnJSc0V4Z2l5eXpMZDBBNjg5N0Y4SDNoZUQrbXV2SldCZHpzcXF6?=
 =?utf-8?B?cFdkcXlvRHkxSVllNEN2dHR3aTJMTkNPTS9GSXh0NEhoQ3hIak9tTUN1ZEpF?=
 =?utf-8?B?T3JFd1d0dVIrTll0cGNQMk1CNFk1MnhnbFFibjBKNGgvS0UzMlROODdCZCt0?=
 =?utf-8?B?MnRucm1SSkIzd3hYYVo0NC9BS0VFUUVJUU5nd0hEay9zcGdsd2FYZ0hBQ0J0?=
 =?utf-8?B?djl1cGpONU54ak5GSWt5ZytUaDcrVXFweUM5bCtCOHNGYjR5cExmZHM3WDZP?=
 =?utf-8?B?QWhCUWd4OVpFZ2dnYVRmelJ3Y3dXS0NZYVBPdENGOEdIZ2RiWEhYbC9NWm5r?=
 =?utf-8?B?aGdZaHdJVDA5ZnBhazRZU1FHNDczWjJvanlxZHhQTyt2dVJEcDJpVVA0Q1lV?=
 =?utf-8?B?Tk04NFVnVHc4bTFYczVPRDhBRnNPaFpmT1RCdThINmZ3YWxSYnljMEVsa2wr?=
 =?utf-8?B?SitEVTd0a0JhNzBEdnR3MjFJOGtEdHdQdnRzTFV1QjNxMDAycmJ1akY3OEJS?=
 =?utf-8?B?S245dm9qMEhsZ3lISWRyYkh0YjhHaWxoZkJCSU5NdWpMeUtENkZWZlhZdzZh?=
 =?utf-8?B?cmlrTGVweTA2QlZhMmZ5TjVTdjV4QkhUUjlPYjI0eFFWUEZ6UEg4UFRRWGFj?=
 =?utf-8?B?eVF1Ky9RM0pyQlRPUUY5U3plbWVod2JRSUN4T0NZWDhCZzZnRGVWWiszNjZB?=
 =?utf-8?B?Ni9NZGpwNmU0R20rYnd3Q0daS0dsN2sra2lIdlpXSEFWbC9mWTRWK2NYT0da?=
 =?utf-8?B?TEhLK0pOekRJcmkvSjJ6ZkU5cGd4ODdnM0ZuakJrN2R0amtEbG9TWjE5UG4x?=
 =?utf-8?B?R2Zsa0x3S1V3eE04R1lJWWVUeW1ZeFVMampLNU91UE5QTUhCd1FWUDVtUjhO?=
 =?utf-8?B?YWhZcjM3NWJZVjh3K3J0Z0NLYnNNRC9VT0VFWUxNUFdseHduc3dWVWduckdL?=
 =?utf-8?B?clhGNGQrUXc4emxlQ2JZc205WTY2U2dEd2JtRjMvSWR1NWJZRnNRZzlWYzBl?=
 =?utf-8?B?NWkrUjUyUFJUMGw4Z1RnZHJ1a1k4MThNZ1FKVWhSRnlrTGNFdE52dCtLbnF3?=
 =?utf-8?B?aFRXZ1FlSUVkVFY4SWdmOEtxWjQxVkRMNGFXbGNhelZtZDNsekwySVhvRUIz?=
 =?utf-8?B?aDRwV2U2Sm5qd3RvSDYzYmo0UmlHUWVpOXNDK29pQktMRWVnSG00RCtmbGJD?=
 =?utf-8?B?QkpoUkVHMzM2NXdkaUpyeFhpZjNBblQ5MGV1Tyt0R01KaFpIZzdrVzAwenI2?=
 =?utf-8?B?bjB0TUZGWWhpbXUxdCtzaHhPOVhxeXlEdUxWZkdZNzZrYnF4MFpVbDBTVlIv?=
 =?utf-8?B?MS9RbFFlZVhwd1JPdW4rT0JBTXROdEo5V3Uwa1p1TjNOSk93TnhhbysrS1dG?=
 =?utf-8?Q?+TcWWF682dzJFxhjM3mV6snep?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0b8f7f04-f2f0-4ed6-8955-08da79c3ec56
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 04:59:22.1867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jZ4NQBHspwqdcebmwZo9vvgDeot26Jrq0Nt1ehqWVHyIcl3Fn0Zd/ENoIlSqRpHgCjzOEMbmyRdH5WuJ7XIj9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4862
X-Proofpoint-GUID: TZPOFzQziluQmec9yeUI4uKU0ehR85Sj
X-Proofpoint-ORIG-GUID: y_sAZubikdfC0t_Pkgr0ItUPPoXh6Z1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_14,2022-08-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208090021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 04:59:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169132

--------------ZbA04sM9rj9QW6RmS6tN1TJ8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 2794uXDb016634

On 8/8/22 01:35, Martin Jansa wrote:

Hi Mark,
> Does this still work for you?


Yes, it still works for me. Without that patch, it fails with=20
"DEBUG_BUILD =3D '1'" in local.conf for qemux86-64.


>
> With this change applied (now in master), mesa fails here with:
> http://errors.yoctoproject.org/Errors/Details/664881/=20
> <https://urldefense.com/v3/__http://errors.yoctoproject.org/Errors/Deta=
ils/664881/__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW8GPSy=
vnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUn492GZ4$>
>
> and builds fine with DEBUG_BUILD when I revert this.

Is there any extra config?=C2=A0 I saw the the error is:

../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error: inlining=20
failed in call to 'always_inline' 'src_is_ssa': function not considered=20
for inlining

Without the commit, it fails with:

| ../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error: inlining=20
failed in call to always_inline =E2=80=98src_is_ssa=E2=80=99: indirect fu=
nction call=20
with a yet undetermined callee
|=C2=A0 src_is_ssa(nir_src *src, void *state)

Regards,
Kai

>
> I've reported the same in upstream MR=20
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439=20
> <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/mesa/-=
/merge_requests/17439__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCt=
NMVlW8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUu70TdHw$>

>
> On Wed, Jul 27, 2022 at 9:30 AM kai <kai.kang@windriver.com> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com>
>
>     It fails to compile mesa{,-native} when DEBUG_BUILD is enabled:
>
>     ../mesa-22.1.3/src/compiler/nir/nir_inline_helpers.h: In function
>     =E2=80=98nir_opt_move_block=E2=80=99:
>     ../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error:
>     inlining failed in call to
>     =C2=A0 always_inline =E2=80=98src_is_ssa=E2=80=99: indirect functio=
n call with a yet
>     undetermined callee
>     =C2=A0src_is_ssa(nir_src *src, void *state)
>     =C2=A0^~~~~~~~~~
>
>     Backport patch from mesa merge request to fix it.
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com>
>     ---
>     v2:
>     * use patch from mesa merge request
>
>     =C2=A0...ove-fix-ALWAYS_INLINE-compiler-error.patch | 65
>     +++++++++++++++++++
>     =C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 1 +
>     =C2=A02 files changed, 66 insertions(+)
>     =C2=A0create mode 100644
>     meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_I=
NLINE-compiler-error.patch
>
>     diff --git
>     a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS=
_INLINE-compiler-error.patch
>     b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS=
_INLINE-compiler-error.patch
>     new file mode 100644
>     index 0000000000..48fc1e37ff
>     --- /dev/null
>     +++
>     b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS=
_INLINE-compiler-error.patch
>     @@ -0,0 +1,65 @@
>     +Backport merge request to fix mesa compile error when debug build
>     +enabled.
>     +
>     +Upstream-Status: Submitted
>     [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439
>     <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/me=
sa/-/merge_requests/17439__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfys=
klCtNMVlW8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUu70TdHw$>]
>     +
>     +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>     +
>     +From c69c6e7a35205557de73734ad4a1f411c8f99926 Mon Sep 17 00:00:00
>     2001
>     +From: t bettler <thomas.bettler@gmail.com>
>     +Date: Sat, 9 Jul 2022 09:28:51 +0000
>     +Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE compiler erro=
r
>     +MIME-Version: 1.0
>     +Content-Type: text/plain; charset=3DUTF-8
>     +Content-Transfer-Encoding: 8bit
>     +
>     +fix call to =E2=80=98always_inline=E2=80=99 =E2=80=98src_is_ssa=E2=
=80=99
>     +
>     +Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/6825
>     <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/me=
sa/-/issues/6825__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW=
8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUf3T6WDU$>
>     +Fixes: f1d20ec67c3f186886b97de94f74484650f8fda1
>     ("nir/nir_opt_move: handle non-SSA defs ")
>     +---
>     + src/compiler/nir/nir_inline_helpers.h | 10 ++++++++--
>     + src/compiler/nir/nir_opt_move.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 2 +-
>     + 2 files changed, 9 insertions(+), 3 deletions(-)
>     +
>     +diff --git a/src/compiler/nir/nir_inline_helpers.h
>     b/src/compiler/nir/nir_inline_helpers.h
>     +index 125dd8a537c..ec33f0509f7 100644
>     +--- a/src/compiler/nir/nir_inline_helpers.h
>     ++++ b/src/compiler/nir/nir_inline_helpers.h
>     +@@ -73,8 +73,8 @@ nir_foreach_dest(nir_instr *instr,
>     nir_foreach_dest_cb cb, void *state)
>     +=C2=A0 =C2=A0 return _nir_foreach_dest(instr, cb, state);
>     + }
>     +
>     +-static inline bool
>     +-nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void
>     *state)
>     ++static ALWAYS_INLINE bool
>     ++_nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void
>     *state)
>     + {
>     +=C2=A0 =C2=A0 switch (instr->type) {
>     +=C2=A0 =C2=A0 case nir_instr_type_alu: {
>     +@@ -162,3 +162,9 @@ nir_foreach_src(nir_instr *instr,
>     nir_foreach_src_cb cb, void *state)
>     +=C2=A0 =C2=A0 dest_state.cb =3D cb;
>     +=C2=A0 =C2=A0 return _nir_foreach_dest(instr, _nir_visit_dest_indi=
rect,
>     &dest_state);
>     + }
>     ++
>     ++static inline bool
>     ++nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void
>     *state)
>     ++{
>     ++=C2=A0 =C2=A0return _nir_foreach_src(instr, cb, state);
>     ++}
>     +diff --git a/src/compiler/nir/nir_opt_move.c
>     b/src/compiler/nir/nir_opt_move.c
>     +index 81bcde5c436..051c3cc6295 100644
>     +--- a/src/compiler/nir/nir_opt_move.c
>     ++++ b/src/compiler/nir/nir_opt_move.c
>     +@@ -60,7 +60,7 @@ src_is_ssa(nir_src *src, void *state)
>     + static ALWAYS_INLINE bool
>     + instr_reads_register(nir_instr *instr)
>     + {
>     +-=C2=A0 =C2=A0return !nir_foreach_src(instr, src_is_ssa, NULL);
>     ++=C2=A0 =C2=A0return !_nir_foreach_src(instr, src_is_ssa, NULL);
>     + }
>     +
>     + static bool
>     +--
>     +2.34.1
>     +
>     diff --git a/meta/recipes-graphics/mesa/mesa.inc
>     b/meta/recipes-graphics/mesa/mesa.inc
>     index 710cacb09d..f02ef2dc2b 100644
>     --- a/meta/recipes-graphics/mesa/mesa.inc
>     +++ b/meta/recipes-graphics/mesa/mesa.inc
>     @@ -22,6 +22,7 @@ SRC_URI =3D
>     "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz
>     <https://urldefense.com/v3/__https://mesa.freedesktop.org/archive/m=
esa-$*7BPV*7D.tar.xz__;JSU!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfyskl=
CtNMVlW8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMU7TXzo3Y$>
>     \
>     file://0001-util-format-Check-for-NEON-before-using-it.patch \
>     file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.pa=
tch
>     \
>     file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.pa=
tch
>     \
>     +
>     file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch=
 \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
>     =C2=A0SRC_URI[sha256sum] =3D
>     "b98f32ba7aa2a1ff5725fb36eb999c693079f0ca16f70aa2f103e2b6c3f093e3"
>     --=20
>     2.17.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#168545):
>     https://lists.openembedded.org/g/openembedded-core/message/168545
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/168545__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJf=
ysklCtNMVlW8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUkjHUb6c$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/92644854/3617156
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9264=
4854/3617156__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW8GPS=
yvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUpD0FcUk$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMV=
lW8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUbQFZS8o$>
>     [Martin.Jansa@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Kai Kang
Wind River Linux

--------------ZbA04sM9rj9QW6RmS6tN1TJ8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 2794uXDb016634

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 8/8/22 01:35, Martin Jansa wrote:</=
div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Hi Mark,<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQf7iEzXN-rH5HxjvaveHxg9mP=
tvh-q-5d_pxoWY=3DG01Lw@mail.gmail.com">
     =20
      <div dir=3D"ltr">Does this still work for you?</div>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, it still works for me. Without that patch, it fails with
      &quot;DEBUG_BUILD =3D '1'&quot; in local.conf for qemux86-64.</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQf7iEzXN-rH5HxjvaveHxg9mP=
tvh-q-5d_pxoWY=3DG01Lw@mail.gmail.com">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>With this change applied (now in master), mesa fails here
          with:</div>
        <div><a href=3D"https://urldefense.com/v3/__http://errors.yoctopr=
oject.org/Errors/Details/664881/__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9=
_SiJfysklCtNMVlW8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUn492GZ4$" target=3D=
"_blank" moz-do-not-send=3D"true">http://errors.yoctoproject.org/Errors/D=
etails/664881/</a><br>
        </div>
      </div>
    </blockquote>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQf7iEzXN-rH5HxjvaveHxg9mP=
tvh-q-5d_pxoWY=3DG01Lw@mail.gmail.com">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>and builds fine with DEBUG_BUILD when I revert this.</div>
      </div>
    </blockquote>
    <p>Is there any extra config?&nbsp; I saw the the error is:</p>
    <p>../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error:
      inlining failed in call to 'always_inline' 'src_is_ssa': function
      not considered for inlining</p>
    <p>Without the commit, it fails with:</p>
    <p>| ../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error:
      inlining failed in call to always_inline =E2=80=98src_is_ssa=E2=80=99=
: indirect
      function call with a yet undetermined callee &nbsp;<br>
      |&nbsp; src_is_ssa(nir_src *src, void *state)<br>
    </p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQf7iEzXN-rH5HxjvaveHxg9mP=
tvh-q-5d_pxoWY=3DG01Lw@mail.gmail.com">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>I've reported the same in upstream MR&nbsp;<a href=3D"https:=
//urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/mesa/-/merge_re=
quests/17439__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW8GPS=
yvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUu70TdHw$" moz-do-not-send=3D"true">ht=
tps://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439</a></div>
      </div>
    </blockquote>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQf7iEzXN-rH5HxjvaveHxg9mP=
tvh-q-5d_pxoWY=3DG01Lw@mail.gmail.com"><br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 9:3=
0
          AM kai &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"=
_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">kai.kang=
@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From:
          Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D=
"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">kai.kan=
g@windriver.com</a>&gt;<br>
          <br>
          It fails to compile mesa{,-native} when DEBUG_BUILD is
          enabled:<br>
          <br>
          ../mesa-22.1.3/src/compiler/nir/nir_inline_helpers.h: In
          function =E2=80=98nir_opt_move_block=E2=80=99:<br>
          ../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error:
          inlining failed in call to<br>
          &nbsp; always_inline =E2=80=98src_is_ssa=E2=80=99: indirect fun=
ction call with a
          yet undetermined callee<br>
          &nbsp;src_is_ssa(nir_src *src, void *state)<br>
          &nbsp;^~~~~~~~~~<br>
          <br>
          Backport patch from mesa merge request to fix it.<br>
          <br>
          Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windrive=
r.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">kai.kang@windriver.com</a>&gt;<br>
          ---<br>
          v2:<br>
          * use patch from mesa merge request<br>
          <br>
          &nbsp;...ove-fix-ALWAYS_INLINE-compiler-error.patch | 65
          +++++++++++++++++++<br>
          &nbsp;meta/recipes-graphics/mesa/mesa.inc&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;|&nbsp; 1 +<br>
          &nbsp;2 files changed, 66 insertions(+)<br>
          &nbsp;create mode 100644
meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-=
compiler-error.patch<br>
          <br>
          diff --git
a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLIN=
E-compiler-error.patch
b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLIN=
E-compiler-error.patch<br>
          new file mode 100644<br>
          index 0000000000..48fc1e37ff<br>
          --- /dev/null<br>
          +++
b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLIN=
E-compiler-error.patch<br>
          @@ -0,0 +1,65 @@<br>
          +Backport merge request to fix mesa compile error when debug
          build<br>
          +enabled.<br>
          +<br>
          +Upstream-Status: Submitted [<a href=3D"https://urldefense.com/=
v3/__https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439__;!!=
AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW8GPSyvnGDFlKkBZpdNWKw=
WpwCeU_Mv0NvgxptSMUu70TdHw$" rel=3D"noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true">https://gitlab.freedesktop.org/mesa/mesa/-/merge_reques=
ts/17439</a>]<br>
          +<br>
          +Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriv=
er.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">kai.kang@windriver.com</a>&gt;<br>
          +<br>
          +From c69c6e7a35205557de73734ad4a1f411c8f99926 Mon Sep 17
          00:00:00 2001<br>
          +From: t bettler &lt;<a href=3D"mailto:thomas.bettler@gmail.com=
" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freete=
xt">thomas.bettler@gmail.com</a>&gt;<br>
          +Date: Sat, 9 Jul 2022 09:28:51 +0000<br>
          +Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE compiler
          error<br>
          +MIME-Version: 1.0<br>
          +Content-Type: text/plain; charset=3DUTF-8<br>
          +Content-Transfer-Encoding: 8bit<br>
          +<br>
          +fix call to =E2=80=98always_inline=E2=80=99 =E2=80=98src_is_ss=
a=E2=80=99<br>
          +<br>
          +Closes: <a href=3D"https://urldefense.com/v3/__https://gitlab.=
freedesktop.org/mesa/mesa/-/issues/6825__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFs=
DHckQo9_SiJfysklCtNMVlW8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUf3T6WDU$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://git=
lab.freedesktop.org/mesa/mesa/-/issues/6825</a><br>
          +Fixes: f1d20ec67c3f186886b97de94f74484650f8fda1
          (&quot;nir/nir_opt_move: handle non-SSA defs &quot;)<br>
          +---<br>
          + src/compiler/nir/nir_inline_helpers.h | 10 ++++++++--<br>
          + src/compiler/nir/nir_opt_move.c&nbsp; &nbsp; &nbsp; &nbsp;|&n=
bsp; 2 +-<br>
          + 2 files changed, 9 insertions(+), 3 deletions(-)<br>
          +<br>
          +diff --git a/src/compiler/nir/nir_inline_helpers.h
          b/src/compiler/nir/nir_inline_helpers.h<br>
          +index 125dd8a537c..ec33f0509f7 100644<br>
          +--- a/src/compiler/nir/nir_inline_helpers.h<br>
          ++++ b/src/compiler/nir/nir_inline_helpers.h<br>
          +@@ -73,8 +73,8 @@ nir_foreach_dest(nir_instr *instr,
          nir_foreach_dest_cb cb, void *state)<br>
          +&nbsp; &nbsp; return _nir_foreach_dest(instr, cb, state);<br>
          + }<br>
          + <br>
          +-static inline bool<br>
          +-nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb,
          void *state)<br>
          ++static ALWAYS_INLINE bool<br>
          ++_nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb,
          void *state)<br>
          + {<br>
          +&nbsp; &nbsp; switch (instr-&gt;type) {<br>
          +&nbsp; &nbsp; case nir_instr_type_alu: {<br>
          +@@ -162,3 +162,9 @@ nir_foreach_src(nir_instr *instr,
          nir_foreach_src_cb cb, void *state)<br>
          +&nbsp; &nbsp; dest_state.cb =3D cb;<br>
          +&nbsp; &nbsp; return _nir_foreach_dest(instr, _nir_visit_dest_=
indirect,
          &amp;dest_state);<br>
          + }<br>
          ++<br>
          ++static inline bool<br>
          ++nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb,
          void *state)<br>
          ++{<br>
          ++&nbsp; &nbsp;return _nir_foreach_src(instr, cb, state);<br>
          ++}<br>
          +diff --git a/src/compiler/nir/nir_opt_move.c
          b/src/compiler/nir/nir_opt_move.c<br>
          +index 81bcde5c436..051c3cc6295 100644<br>
          +--- a/src/compiler/nir/nir_opt_move.c<br>
          ++++ b/src/compiler/nir/nir_opt_move.c<br>
          +@@ -60,7 +60,7 @@ src_is_ssa(nir_src *src, void *state)<br>
          + static ALWAYS_INLINE bool<br>
          + instr_reads_register(nir_instr *instr)<br>
          + {<br>
          +-&nbsp; &nbsp;return !nir_foreach_src(instr, src_is_ssa, NULL)=
;<br>
          ++&nbsp; &nbsp;return !_nir_foreach_src(instr, src_is_ssa, NULL=
);<br>
          + }<br>
          + <br>
          + static bool<br>
          +-- <br>
          +2.34.1<br>
          +<br>
          diff --git a/meta/recipes-graphics/mesa/mesa.inc
          b/meta/recipes-graphics/mesa/mesa.inc<br>
          index 710cacb09d..f02ef2dc2b 100644<br>
          --- a/meta/recipes-graphics/mesa/mesa.inc<br>
          +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
          @@ -22,6 +22,7 @@ SRC_URI =3D &quot;<a href=3D"https://urldefen=
se.com/v3/__https://mesa.freedesktop.org/archive/mesa-$*7BPV*7D.tar.xz__;=
JSU!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW8GPSyvnGDFlKkBZp=
dNWKwWpwCeU_Mv0NvgxptSMU7TXzo3Y$" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">https://mesa.freedesktop.org/archive/mesa-${PV}.ta=
r.xz</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://0001-util-for=
mat-Check-for-NEON-before-using-it.patch">file://0001-util-format-Check-f=
or-NEON-before-using-it.patch</a> \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Revert-e=
gl-wayland-deprecate-drm_handle_format-and-d.patch">file://0001-Revert-eg=
l-wayland-deprecate-drm_handle_format-and-d.patch</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://0001-swrast_k=
ms-use-swkmsDRI2Extension-instead-of-driDRI2.patch">file://0001-swrast_km=
s-use-swkmsDRI2Extension-instead-of-driDRI2.patch</a>
          \<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-ni=
r-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch">file://0001-nir-ni=
r_opt_move-fix-ALWAYS_INLINE-compiler-error.patch</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
          <br>
          &nbsp;SRC_URI[sha256sum] =3D
          &quot;b98f32ba7aa2a1ff5725fb36eb999c693079f0ca16f70aa2f103e2b6c=
3f093e3&quot;<br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#168545): <a href=3D"https://urldefense.com/=
v3/__https://lists.openembedded.org/g/openembedded-core/message/168545__;=
!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW8GPSyvnGDFlKkBZpdNW=
KwWpwCeU_Mv0NvgxptSMUkjHUb6c$" rel=3D"noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">https://lists.openembedded.org/g/openembedded-core/me=
ssage/168545</a><br>
          Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/mt/92644854/3617156__;!!AjveYdw8EvQ!fJX82CjYkZXv1=
aLFsDHckQo9_SiJfysklCtNMVlW8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUpD0FcU=
k$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https:/=
/lists.openembedded.org/mt/92644854/3617156</a><br>
          Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.=
openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembedded=
-core+owner@lists.openembedded.org</a><br>
          Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lis=
ts.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!fJX82CjYkZX=
v1aLFsDHckQo9_SiJfysklCtNMVlW8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUbQFZ=
S8o$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https=
://lists.openembedded.org/g/openembedded-core/unsub</a>
          [<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Martin.Jansa@gmail=
.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------ZbA04sM9rj9QW6RmS6tN1TJ8--

