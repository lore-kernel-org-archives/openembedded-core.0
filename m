Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5466FC63705
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 21:58:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29970.1670450329978488954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 13:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=fM1B3IaC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9340dc85f4=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7FxnSx014045
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Dec 2022 21:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=y40VmKxGa4sRNq7EkJi0Pf4ufxiJHJDNWsHli9AW+08=;
 b=fM1B3IaCmeVylJk1NHnDhRo1Zrg2pbqxo0+JEM1lL2htb/3/RiVxYT8EkloOzucqKm0n
 rHN3rHyI0CbdxSGu1DITnvdxhDw36HSXz7WTo2wXkTt6Ck1v7MkqLbeheVJBgZj46Bly
 mFqO3FsF/U1LUUArtPRd0BFuvmMb4dCZyj+khQ4IqNQp1+z6+JnHsM3AGGLtjsaiWz5F
 9e0J6DUTlgbjaBPbZZnFBwWZO/m0ZddMSZ+P6jMi3Y9CZdAALZit5UwNsX/dZAiL6YEl
 WRDFVZvxvkiv1mH35fIRX6Xk1O5jV6r+X9DwxcjNCpPDWQRpKazF5e0yr84o9cHqJNj2 VA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7up0bxvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 21:58:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j30WOjkmRfvFeyvETaFWicSlh0TF2/kiC6j9rANJh+mxcJ0mPyAfLo2WQ1kP+W+MJ24v63ykuOeIoNYkgmxAzBYIEQe0b8lsRSLIv8LiXFT+WmW8S4EYAVM98B4Cn5bAVi5QaRipoxMmOsWxQdUXYqwVMI+VDbjsJQJUrSgfUrb0APGSksjD7q5XKUrD7ZVW/nFj4Df7TrrsIA1k9HC8VDVG2NVyQoxXnZeIQmbf2y1ppCfpVCho9YcVETZu8AF1nFJeEoVfSEJ/Z7Od9nzIptpoVmbyhAE91qwHc+VwNm3aXN5imqS2qKxcndC4izJZiebatZnNsJ4Thu/WLchsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y40VmKxGa4sRNq7EkJi0Pf4ufxiJHJDNWsHli9AW+08=;
 b=C/vsi2wRjbnk9NwEpdQIEAW9XtMCdOOSIhF788w2swbLPf5J2hVztNF0TUqMaxrapf1rE8KD8xIqoMhzFnx8ZW4PqTFssC39hvybqKkLCC0yAPLw3oFhcbIOWiSjJtnYUBsOrhj/bR0WdOxT15QEBU7TKLrclWMH7tI7MN+SrDeAZ5Pd8l57eAygiNYBaHpBBwM7YTyoNu8n4HZofB+9K3bB/cKyIwE4aTKLF37TkX21pS9IpxYh92VOo0tRSvM46bP7cq4FK4b4Fy02AQAlAzkcHbyTKd7LnOF4TShLdRR30NmfdJYx7SrOogEbEMIhLMWOi6H+bJA/9T+vpv1I6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 21:58:45 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 21:58:45 +0000
Message-ID: <9fe69f66-8020-7630-de23-41be29772924@windriver.com>
Date: Wed, 7 Dec 2022 16:58:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [meta-core][PATCH 1/1] Signed-off-by: Manoj Saun
 <manojsingh.saun@windriver.com>
Content-Language: en-CA
To: manojsingh.saun@windriver.com, openembedded-core@lists.openembedded.org
Cc: narpat.mali@windriver.com
References: <20221207123014.1128631-1-manojsingh.saun@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221207123014.1128631-1-manojsingh.saun@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH0PR11MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa04d8b-4829-404a-4369-08dad89e360f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sp6EfYojN+3vg3heuhvTIG5rcYbSNALJTMipHdR4U0IdQ9DDEdzCNswlJt+wedV/tFAu+gok3LinOcLs0kL3ESqBd9wmumXX6d7bsySu5eZvx+X1XkMV1aoOzocCfmLbztUCw78kGRX/ppBMMdEdJv3+uhIDVgM5bRolu5dUCGjg4s/HVPmXpL93vgxU2NIT60zG1wddZaw6ubOl4vxkHL+LpUpXROS6oP/MfpF4Q5ZsIcxt1cO8O/bZ6fx/YtkyMnNLjvJUMfWPTGOLTKnwFgXjy38SUyLjS1eBDz+7sLLAxF1K8Cto5CqmLKiateYXiUANa77iuQjjE6ZAr6x7aDi7Ex2lMitj4/M8uVk+a0mMB/vDAbvom0rvgk3W7MfUfz3hi5aTKRw3PVcsloHyor9YYB+7XUKhpGbbtDExKgAUVh1r4DX5VlzUy5/eNMqsbh7VeDSW7b3oxA/jKbIYaBGoP3t3zwaw3idDTqleK/Ymsf7u2EmYDrdnk/8ZHk0EnzN4Ck9ouuxL3/shsA7kyx1kzZciqeIAkFEKf+EcNXu66l9KtKhluMCpV64vwJsrkUSqtTIvV6Qx5tLgEZxcaLvPC+kB1AAt6vnJ0MgPXz7kAoKOJD6ejTuHcdnX+7iPKohonvGoUIaVcNmF0mO24SwEay4idiqRtXPXcYeaaa+3w8dHcDCJRdblwoiIfVCsi1BNClz2jZX7Q8UX3SANxml4U6NOB5z+MT6/JYsUPguPlDks150b+mcfLpFi3/NwTriWK14phAnu/3M4rBzr6GOOPj/SH3fuxnKHDUnyWFs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(39850400004)(346002)(396003)(376002)(451199015)(2906002)(31686004)(66899015)(83380400001)(2616005)(41300700001)(31696002)(86362001)(36756003)(66476007)(38100700002)(26005)(6512007)(8676002)(8936002)(5660300002)(4326008)(186003)(66946007)(6486002)(316002)(6506007)(6666004)(107886003)(478600001)(966005)(53546011)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WFdCWXY3TmpCYWxwOWJFWTB1YnR4eFRpV2ZTMzFVNHp2Y2w5Y3pLbGRWSFMv?=
 =?utf-8?B?S0JBVHRkcDhoU3oxdWFtdE5sVWd5aGRyclZ4ek1TakhiQkhJRDRHVll3Y0VU?=
 =?utf-8?B?bFU4UlhETDBmdHlkUEU5NDJLc2hrSXlFY1lDVlh4UmR5KzV5UWFSS0tOU0Qv?=
 =?utf-8?B?L2tmb1BwVG00RHcrdEluMzJUdkw5cVN1R3NiRUpDR1NSeWdITWdvWXFKM3ll?=
 =?utf-8?B?R1lxOWtMRmRIaFlxbk0yRlJ1dWlwaWpaWDEwNlFZQXA4NHAxWHIwQU5rL0Jv?=
 =?utf-8?B?UnhFOE9DM3Zka2RZWW9yLzN0NXoxdC9TYjdWR1pSdllaVlVRdDRkUlhpSHlM?=
 =?utf-8?B?YzdjcVdMRGZCcDRUNXFqbnV1RElwL0hoejVxMnUvcXZWRGQ4VWtvZXFiZ0Ur?=
 =?utf-8?B?Q1BkQkltTnlMVDc1V0lwakpZby80akZNMitoRy9CWjJKNzU5WmR2d002ZUww?=
 =?utf-8?B?UGpkL0dnL3FLZHFYcjJiVkZGb3Q0aE9iM3I3KzF0dm8xNy93am40UWhjcmo4?=
 =?utf-8?B?bnRCM0dOZ014TlYxa1l2Znp6bDVINWhYc2JhbHFWMmRtUzB2MzhyU2RkVjlj?=
 =?utf-8?B?UTlJOERaVjdXZURPcFdmWW4yN21jQzk0SngvampubkFodTJ1cFRSRm1IMnlH?=
 =?utf-8?B?d0c0YitERHJ5WXFCMEthajk5cituaXhiaFZiTEM1elVwOEZIcEpDY0JKS1hD?=
 =?utf-8?B?ZXVpQlI5WEJLSytuRU90eUQ2aXFyRmNmeVI1TVNCaWk4SjNNSFlUcmRtck5G?=
 =?utf-8?B?WG96c1llWUpmR1FzSEZXRVdtL29BMFNobWVvbUVYM0xMZU5BRWlVMmpCV1I5?=
 =?utf-8?B?MEtMeTZGb0RMYTg3bklNZVQxWWJUTHcwVkVXUXU2dDJzZERUODZ3cm9aeUZQ?=
 =?utf-8?B?T0RiT1RxQ3VSVzlkWGNJZ2UxeUowNG9VR041VG1EZUpVQkhtcFFGaFhaV3la?=
 =?utf-8?B?dFl6WjBTeG5VL1Fhd3pkYVk0N3d6c0xaZGZNZlU1cmUyZVhFWGhjeW52ajQz?=
 =?utf-8?B?WFhSZEQ5T1ZuZEwyY09UMzFhY0YrRXNzTmFzN0UvM2srbkNnVU1HUzBBL3lC?=
 =?utf-8?B?TnE1bThlamJtVVFkQmpBdmN4UXB4QUFvc1pTbzdHZTJ4NXVUZzN2UTRPZ0Na?=
 =?utf-8?B?R0EwZWRJNnVHcFNLYk1YOURxQzVHTDRramlWUDViU1BFcEVPRVhDb3drRFk2?=
 =?utf-8?B?alFYcnkxNFJPdXNIVEZRS21UTTRHemFrcEVkWFUzTnpCY0M3SnU2cnJKcXZa?=
 =?utf-8?B?d3ZHaWVUaVRYK0hoMDNsN29qa0R5b2gxL3FoeXh2T2ZsQ09WRi9LRGtUR0ZY?=
 =?utf-8?B?UTRNaWtuaXpnbzVycW9OcmtJZzRxQ2VFSVp2V3M3M2xtNXA2T01STEkrWW9T?=
 =?utf-8?B?QkNybEtmOE5RVFhjaXFXYVc5VFFyTTdBMnFjejVtTlR1WTFJMmI3c3NRUGs1?=
 =?utf-8?B?MnZJejFYQ2o4NFV5Qm9idkJJWnpadmhoTktBTU8vUjVTU3JoWW9zcGV5UEZK?=
 =?utf-8?B?ZWVXdGczWStlalZ3bzZSRlJVOHhpOWpoc2NPNGJPTzQrYTNibmY3c3dHRzgr?=
 =?utf-8?B?NWh3ZEFZdFV5aEFnQ05CWm9oVkFqUVlRU3FtM2N2aVMvY0tERDJ1QzIxNFAy?=
 =?utf-8?B?TEdlV2M0Y2VMMEV5YzN6aGZ3M25ld0k4eTA4Y2FwUVpLNFY2Qk4zUllzSW5z?=
 =?utf-8?B?OWs1R0UrS0dFVjhMRGdCQStjTTJnZTZ1TXNSMTJzME1oVlM3aVYxbWpWOVdB?=
 =?utf-8?B?TmxaTkFFZUpsMSs2V2p5dGd1WEhNY2p5NVJJa2dHaVE2TDVlNjF2ZnBBdko0?=
 =?utf-8?B?SjkzZk02LzN2QVFaOHJmVkxUaE1hS3FPWjZkNjVwRHBoUkNNN2lBdnBpMGtC?=
 =?utf-8?B?aTRjM0cwVlMxdEswQzcvMmZHT1prL2J1aVBoRGdmVjN2L043TWk1QUp2TWJk?=
 =?utf-8?B?TDFZSzZYTTZIVTJXMGpsa2JuMDVXdi93NzRzcGpiaisvNFg3UDdkVVlmSys3?=
 =?utf-8?B?NU1XRzBKaFp4UHlUSEpEUkZDQ1p3Z1BoK1I5Q3Ezbm9odXhkMmZuZlNLc25Y?=
 =?utf-8?B?Wit4RGpjSjc5NHlDdDh5aFpJU0FWOEZwZWd3ZUpFQTdQOFgrZTF2UHdvWEVv?=
 =?utf-8?B?LzhTcUVFNFJ5WXI0SUxEaEFQbGVCT0FqUlVOKzRacndKNkZlVHZxN3BYSUlF?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa04d8b-4829-404a-4369-08dad89e360f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 21:58:45.2248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bO2Vlez/9vXk5ceXmonTeoffJ5nHfOgk4mnI3CE/MZHubC5HVeomGxYN7hn7COXWLbNct7PFRTEogJUt1lOwmKNRlftyhrXrxzBJYlX7Rps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5628
X-Proofpoint-ORIG-GUID: jzMdjmrxhCxsH-OTM7RJzIs1nDl8OUne
X-Proofpoint-GUID: jzMdjmrxhCxsH-OTM7RJzIs1nDl8OUne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_11,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212070186
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2B7FxnSx014045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 21:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174368

Manoj,

Welcome to Yocto/oe-core.

I'm not sure what happened with your subject line but it's not
what we expect for patches on the oe-core list.

Please read:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
and several of the commits to this list and then we can=C2=A0 work on thi=
s=20
together offline.


On 2022-12-07 07:30, Manoj Saun via lists.openembedded.org wrote:
> -> libksba: fix CVE-2022-3515

This should be your subject line:

libksba: fix CVE-2022-3515

>
> -> libksba: integer overflow may lead to remote code execution.
Drop the "-> " prefix entirely, it's not our style.
>
> -> Reference:
> -> https://www.gnupg.org/blog/20221017-pepe-left-the-ksba.html
>
> -> Upstream fixes:
> -> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dlibksba.git;a=3Dcommit;=
h=3D4b7d9cd4a018898d7714ce06f3faf2626c14582b
> ---
>   ...e-overflow-directly-in-the-TLV-parse.patch | 42 ++++++++++++++++++=
+
>   meta/recipes-support/libksba/libksba_1.6.2.bb |  3 +-
>   2 files changed, 44 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-support/libksba/libksba/0001-Detect-a=
-possible-overflow-directly-in-the-TLV-parse.patch
>
> diff --git a/meta/recipes-support/libksba/libksba/0001-Detect-a-possibl=
e-overflow-directly-in-the-TLV-parse.patch b/meta/recipes-support/libksba=
/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch
> new file mode 100644
> index 0000000000..e2cb842a4d
> --- /dev/null
> +++ b/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overf=
low-directly-in-the-TLV-parse.patch
> @@ -0,0 +1,42 @@
> +From 4b7d9cd4a018898d7714ce06f3faf2626c14582b Mon Sep 17 00:00:00 2001
> +From: Werner Koch <wk@gnupg.org>
> +Date: Wed, 5 Oct 2022 14:19:06 +0200
> +Subject: [PATCH] Detect a possible overflow directly in the TLV parser.
> +
> +* src/ber-help.c (_ksba_ber_read_tl): Check for overflow of a commonly
> +used sum.

As per the document above, we insert:

+CVE: CVE-2022-3515
+Upstream-Status: Backport
+Signed-off-by: First Lastname<First.Lastname@example.com>

> +--
> +
> +It is quite common to have checks like
> +
> +    if (ti.nhdr + ti.length >=3D DIM(tmpbuf))
> +       return gpg_error (GPG_ERR_TOO_LARGE);
> +
> +This patch detects possible integer overflows immmediately when
> +creating the TI object.
> +
> +Reported-by: ZDI-CAN-18927, ZDI-CAN-18928, ZDI-CAN-18929
> +---
> + src/ber-help.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/ber-help.c b/src/ber-help.c
> +index 81c31ed..56efb6a 100644
> +--- a/src/ber-help.c
> ++++ b/src/ber-help.c
> +@@ -182,6 +182,12 @@ _ksba_ber_read_tl (ksba_reader_t reader, struct t=
ag_info *ti)
> +       ti->length =3D len;
> +     }
> +
> ++  if (ti->length > ti->nhdr && (ti->nhdr + ti->length) < ti->length)
> ++    {
> ++      ti->err_string =3D "header+length would overflow";
> ++      return gpg_error (GPG_ERR_EOVERFLOW);
> ++    }
> ++
> +   /* Without this kludge some example certs can't be parsed */
> +   if (ti->class =3D=3D CLASS_UNIVERSAL && !ti->tag)
> +     ti->length =3D 0;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recip=
es-support/libksba/libksba_1.6.2.bb
> index f6ecb9aec4..c25c23ef0f 100644
> --- a/meta/recipes-support/libksba/libksba_1.6.2.bb
> +++ b/meta/recipes-support/libksba/libksba_1.6.2.bb
> @@ -22,7 +22,8 @@ inherit autotools binconfig-disabled pkgconfig texinf=
o
>  =20
>   UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
>   SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
> -           file://ksba-add-pkgconfig-support.patch"
> +           file://ksba-add-pkgconfig-support.patch \
> +           file://0001-Detect-a-possible-overflow-directly-in-the-TLV-=
parse.patch"
The patch above is fine.

You find that if you keep the trailing close quote on a new line,

like this:

  UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
  SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://ksba-add-pkgconfig-support.patch"
+           file://ksba-add-pkgconfig-support.patch \
+           file://0001-Detect-a-possible-overflow-directly-in-the-TLV-pa=
rse.patch \
+ "

then the next time a patch is added, the diff will be one line smaller an=
d just a bit
easier for readers to parse. ;-)

../Randy

>  =20
>   SRC_URI[sha256sum] =3D "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6=
ffe06f6ed4f6192c971"
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174351): https://lists.openembedded.org/g/openembed=
ded-core/message/174351
> Mute This Topic: https://lists.openembedded.org/mt/95514199/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


