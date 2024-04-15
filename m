Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C264C00A94
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 08:45:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16254.1713170704858395357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 01:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=SKIbkoET;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48352763c0=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43F5VBE8031661
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 01:45:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=Vr12GRcQl/Y8HUR/Dcl
	t78rUBsJa6cCUOWNFjpKLx1k=; b=SKIbkoETkP1KHW2r5UhLurucHZdSK5TeKLh
	ovMXaEjsrN9eQoCudkSpCFSnKepFbPlGwPHpW/RHznFE2dovhjWdS4uPQ0ByRrV4
	xOOoO9RJargslRwJvsQyqt8taD8+ag4hHt2EmfWUldF/LiDhR1fL9wN7hZwxkWKe
	WVvI4McdmYrp2kd1jO67uSCWuD2K/hxSmFWYbfpxoObDGye4uzwb+g1FzlmHj3M8
	Pxr2eovh9KKIuk+wop7XXNVkIbxog8pqeB7b058scKCG+tDERE/QALiCh2CXgg6K
	/9j5V0H30u2Pp+3o55hwsLHWJ3qavXq80S8bVz86YNOKFrH8mQA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfsjgs57x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 01:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cy7PE6cCf0Cl/UJ+NzMxP/LVm6/sM7c0WC3U8qdANyU/X1x1L/A5pFaj/Kd1m/3WSwTlwUrC9zEsGiQAghfQRnzkDVuflohPYiurIFfuICd3b4xK/Pg18arqjrx7uL09HBoMpHLKUHFRh3EoQlpSJonCsFGHWyjX017Ua2ysb+gu2JFH4FW8STYpcHmh8DKgKr4KYt1cvabua2bJLIKymWo5Hr03LWEpjj7MbH2l+pS4Zuad5Om8Dz9X8EyANxcJa7Ok9ieiXZPK01VwcWWQdhqRKM7tpoLXd8DHyM0qgnjrTwbwg/yrRR6ml2FY/Ro6zrYJDdV1TzbsEmu0ntxyNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vr12GRcQl/Y8HUR/Dclt78rUBsJa6cCUOWNFjpKLx1k=;
 b=lgb1Yd31hPyLmea+KU72wXurriEd/i7hM6e5gAPD1q1uf6gwfaZv393tPlga+yBvrj1OEwnSJabMAtYbSPsQHvF5mya5IXRWyxs4wEbUCZsa97WPOZJwjJuEiNeuadAtoPVDLE5u9mPkLIBCIhgW/tkGd1zLJpn8cq4Sq+RtIzMuIR7ZpCg0E+I/Z9hBFA56rxInh0HJVxbyMpS8UzVlg2NLLd1Q/esme51OOfu27XzSOnoqWDcFdkmPiStfQ2O7CkapoP6jHijjrZvtHX/FrPHYOiMZYCOI1JYbcFQIevD+qPOxEv2+bw/1Qa1Yqx+y0IGZP+EQOSQU1m3Hj6+o1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB7970.namprd11.prod.outlook.com (2603:10b6:8:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 08:45:01 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 08:45:00 +0000
Content-Type: multipart/alternative;
 boundary="------------L0TDV2vYkMojJ10J1LIbA7iE"
Message-ID: <64109c74-a8b0-4fc4-98c8-ddd4f0356fdd@windriver.com>
Date: Mon, 15 Apr 2024 16:44:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] base.bbclass: make do_fetch depends on
 PREMIRRORS MIRRORS
Content-Language: en-US
To: Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <17C666E056927DBC.10598@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17C666E056927DBC.10598@lists.openembedded.org>
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 1088f4c6-e77c-46b4-d07c-08dc5d285646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dzbwLkg2ajE9hsG98al2AmV6PYmoQ0ctFpK54QT+8PTbdkRG0PZTD3QlOG/lnbWjzQfRHZZZKDWmlYtFR/9w1lXHQuO7+rv5AibZ7h0wj433jTGReuaBucfMOUpDefow5kZ8YsnDlbVTAnoHfCy/wspfbGoysV+Fqtx09UPPlqozQydwvhxy+cjjJJBDJkMY4k8GuYyqIzNeSHiR97B+CUP+xeCKCbnAF/PejTTrLmDkx/veB1V1MNAmsPsV+Wajdrm3PmyM4EKODAWcKfbmyT2Jp6ggPjkPBkeIalu+u+64iaRV24IVt1CJ++WVly17i/y1/SMQzePGTwhkyZzaT0M4J5PnHqMkiQm/hUSrvlj+slWdfxJVYeXR/EX/2HlZAxDr3JdxxC6t6x/5qDA3eWGfnRNAvmQQhCoKdTz0XQo0/LOTiGd+qopsxLyFEoX8qPUaX7SYsvfsR99ygKEAflf1LdND4EVQViP8HOtbEIyTkh4d89LScso9ztfrM87kd4QdDKjg9aFzrwXopoiTpP0pP58/vc9uVs8i6BTgrcixAKaXOTKTcEGuuh9C1oRPms225fLwmSdnQcRlTB2coyPIW/XahMCzYcJSdlzBZ3WIMwNScS2yJ0Vh1sh4lnHB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?di9jSGFuVXFUcTVSbWJmNFpFMlowT2ErdGFVbE51UEVkUVhBV0FMYVlEcHpj?=
 =?utf-8?B?UlU5ek1SNE9pUDJLaUdRR3hBVXFQeWl2V3hXMXZNb0hhYkxsU3VROCtOS3lp?=
 =?utf-8?B?UEZHaEhreVQrY29nNnBIRHNKMjVPdDlabktYdXdXcXl0SFFpdEtHTFFjdU9N?=
 =?utf-8?B?dFFNOG1lMXViVXZ5QVUyWG5mNGRBUFV3R2cvYWFQcGVvak8rVU85WmlJMDNT?=
 =?utf-8?B?c29kVmJKYzFUSlpLUWFOOHBkTEd4bUtpYW9GOXYzNlRneGxFaXZiakx2cjA0?=
 =?utf-8?B?MCt5aVZwa0FSbFFybGh6azZlWERsUVZCMC9LTEt0QXhQUU1xVTU1REhwS1lY?=
 =?utf-8?B?cDBQSHhqVzJjVjFoZGFoM1haSW9ZWmhha0VmWm5mSVJFdHV3YnZiZHB6NU1R?=
 =?utf-8?B?bUVGL0MvdWZNRFpKTHZ4dCswb284UjVzQXpJRXBQN0grTlQyZ1RvQllENGJu?=
 =?utf-8?B?S2FhK3RCOHhLZ3VuWllrbmZiQnZSODlHRU1QaVBPQTF0b3A5U2VMUzU0M0Ns?=
 =?utf-8?B?cHBQNHNpZm5qUGZDaGhCMlovZDcrekVaOVNCcG5yK1I1dUx3VDl1ZURKVWJa?=
 =?utf-8?B?ZGdxOE0xMUtZYTUyYlBqTmhRRTZSLzNocUtaRzJJVW56MlhIbDhNd2dZN2N3?=
 =?utf-8?B?OTdEUS9iYUIza1QvQlQ5NUFONCtCaFYzMVY2Kzd4TVJyYjZsVGxmZ2xRd1ky?=
 =?utf-8?B?emVhTjdNSmNNZEcwNmJacmphRUpXVE1wTVQyWXhpbjkxRXNLelFtSFJYakVk?=
 =?utf-8?B?ZW1WOWhDdC8zS0VIVFU5TERTaXF3M3ExOVEydWpBYlNFVFpObjRta3JWSVJ2?=
 =?utf-8?B?a3c5Q3NUbEY5RmtYSVJnZW1KQ1MwclFnenk4SmtWdXkvdkFYRWdRZ2NCMC93?=
 =?utf-8?B?UUdRSVEyaDJndDBMajByNEE3d29ueVZDUXBnN2poWDVqMG5CYzJ4bHhSVC8r?=
 =?utf-8?B?MGp0bHJ4RHRkaDFEY3BWVW80KzRrRUhUM1BLT3NQWWgwVEt4b1d2NXV6Vmhi?=
 =?utf-8?B?eUROaEREeHdFZmJxMU03NXowMUFHeC9FNkpaakh4MVNxQ0h4TVRSa2RMWnpu?=
 =?utf-8?B?U09iWExJZ0RGVFEwUDVtKzBYcTc0WUVmRkR1SUx1L2VLTklnY01QMjhQK0dn?=
 =?utf-8?B?cnhpdlorYkxLc2s2ZFhxcXBseFM2SjM1TklwK1h4a2RlUVhGbHZ5aEFXeWtW?=
 =?utf-8?B?QkY2S3RXWjh4emtmRFNFaHZDMVozanNHL2JtUlVJaWcrQmNtV2wyNTJWTTV0?=
 =?utf-8?B?TExSRU02QloyS1RxbVFOVVVTbkVFRTdwTHJac1BqRmtBN01kbkVUblNldXpz?=
 =?utf-8?B?ZVExcnNIN2drSGRzMVprNGpIVHFWVUwvSS9hVEJPazFTZ2JQdmZ1MUQ4TVhB?=
 =?utf-8?B?Z2JydEdaZkJQcEFtNU9XQVc2U2U5cVh1VUpRdmVFRWM1eTVqQ21SYitEZXMv?=
 =?utf-8?B?WXd1VlMvYWZvUndXMUZGcFpWVEJ5SWdxNXFSdE83UUd4bm54c3Q1THEwWW5G?=
 =?utf-8?B?RUNjRjJPbFBDdlZiZVJ5NURFUEVzUE9LdkErUlNKMkJXNk5FYjg2QzFYQTFS?=
 =?utf-8?B?N2lOZTlFR1VIbFhBUXpvelVRZjBzQXBRRHlicnE2RVZkU25OMU1IbkVnelcz?=
 =?utf-8?B?cm5LYnhnbHNqUHFTdElOR3A0dTBiRzRHblFYUVRNWDByM0Z6azB0UitEUktx?=
 =?utf-8?B?TzhKUEdpaTJrYVpwN1pQNXZXRU1Ud2pLaU1lWGRNNVdNSjkxNzlMMHdJMmpl?=
 =?utf-8?B?dlEyL3BwWWhFSXozMHlNT0pwVFlKdUxjcW9KNlVhWXBzOEJOK3ZUaGRXaXRQ?=
 =?utf-8?B?OUVCVE9xakhGVngrZEVYMGUzcEhNdHdMa29RU0xUdGR2Z3RZNlhOV3dBK1Ay?=
 =?utf-8?B?UEFzbWhIekJTZDR4MGFmYnJrdHF1SFJjNG5zTTNHYlp2WVYwVmVvcDJEeGdi?=
 =?utf-8?B?dFd5U3ZYTnRLS2RpSzNWcHRJY2k5UllZcjdJYWg1SDlucHZYUndnNGxuRld2?=
 =?utf-8?B?YkNxTGlFdXNBV08vL0dvM0ZCMGZLUUNBejgrNWR4eXhEY21FUUNkem5CbWhR?=
 =?utf-8?B?UFJBWEpoRitncXdBdlZnS21GNE1JWDgvWU5ZN0VxR3hXdkY0Q0lQaFVOcm1h?=
 =?utf-8?B?V0k4eGNLU3pNMURCUUxaWjZicVlMSExzQkNSVzArRDhjK2pCYlFZNWk5YzFl?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1088f4c6-e77c-46b4-d07c-08dc5d285646
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 08:45:00.8947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vY9micDW6sH9vk2Iheiad+xu9dRZxl6OF8/xHdReV6R/zrxgcODguFs/R9W3Oe/6EX7ONscztxbeLFfzfewLrl0nuDnCpi55txvaFBRq/D4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7970
X-Proofpoint-ORIG-GUID: xjhNT_KJUJIz5awk0eMoCOEUZ-PG9eC-
X-Proofpoint-GUID: xjhNT_KJUJIz5awk0eMoCOEUZ-PG9eC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404150057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 08:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198224

--------------L0TDV2vYkMojJ10J1LIbA7iE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 43F5VBE8031661


On 4/15/24 16:30, Changqing Li wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> When there are tarballs in local mirrorfile://, do_fetch will
> create symlink under DL_DIR, eg:
> pseudo-prebuilt-2.33.tar.xz -> /project/path/to/localmirrorA/pseudo-pre=
built-2.33.tar.xz
> after user update path from localmirrorA to localmirrorB, because
> do_fetch don't depends on PREMIRRORS/MIRRORS, do_fetch will not
> be rerun, so the symlink will not update to:
> pseudo-prebuilt-2.33.tar.xz -> /project/path/to/localmirrorB/pseudo-pre=
built-2.33.tar.xz
> then, do_upack will failed since the tarball cannot be found.
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   meta/classes-global/base.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/bas=
e.bbclass
> index 0999b42daa..5094a1540e 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -139,6 +139,7 @@ do_fetch[file-checksums] =3D"${@bb.fetch.get_checks=
um_file_list(d)}"
>   do_fetch[file-checksums] +=3D " ${@get_lic_checksum_file_list(d)}"
>   do_fetch[prefuncs] +=3D "fetcher_hashes_dummyfunc"
>   do_fetch[network] =3D "1"
> +do_fetch[vardeps] +=3D "PREMIRRORS MIRRORS"
>   python base_do_fetch() {
>  =20
>       src_uri =3D (d.getVar('SRC_URI') or "").split()

This fix has a shortcoming,=C2=A0 it will make do_fetch rerun in some=20
unnecessary cases, eg:

PREMIRRORS changed from

PREMIRRORS =3D "git://.*/.* https://downloads.yoctoproject.org/mirror/sou=
rces"

to
PREMIRRORS =3D "git://.*/.*=20
https://downloads.yoctoproject.org/mirror/sources \

ftp://.*/.* https://downloads.yoctoproject.org/mirror/sources ".


Any better suggestion? Thanks.

Regards

Sandy


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198222):https://lists.openembedded.org/g/openembedd=
ed-core/message/198222
> Mute This Topic:https://lists.openembedded.org/mt/105532159/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------L0TDV2vYkMojJ10J1LIbA7iE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/15/24 16:30, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17C666E056927DBC.10598@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

When there are tarballs in local mirror <a class="moz-txt-link-freetext" href="file://">file://</a>, do_fetch will
create symlink under DL_DIR, eg:
pseudo-prebuilt-2.33.tar.xz -&gt; /project/path/to/localmirrorA/pseudo-prebuilt-2.33.tar.xz
after user update path from localmirrorA to localmirrorB, because
do_fetch don't depends on PREMIRRORS/MIRRORS, do_fetch will not
be rerun, so the symlink will not update to:
pseudo-prebuilt-2.33.tar.xz -&gt; /project/path/to/localmirrorB/pseudo-prebuilt-2.33.tar.xz
then, do_upack will failed since the tarball cannot be found.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/classes-global/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 0999b42daa..5094a1540e 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -139,6 +139,7 @@ do_fetch[file-checksums] = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.fetch.get_checksum_file_list(d)}">&quot;${@bb.fetch.get_checksum_file_list(d)}&quot;</a>
 do_fetch[file-checksums] += &quot; ${@get_lic_checksum_file_list(d)}&quot;
 do_fetch[prefuncs] += &quot;fetcher_hashes_dummyfunc&quot;
 do_fetch[network] = &quot;1&quot;
+do_fetch[vardeps] += &quot;PREMIRRORS MIRRORS&quot;
 python base_do_fetch() {
 
     src_uri = (d.getVar('SRC_URI') or &quot;&quot;).split()</pre>
    </blockquote>
    <p>This fix has a <span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">shortcoming,&nbsp; it
            will make do_fetch rerun in some unnecessary cases, eg:</span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">PREMIRRORS changed from <br>
          </span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">PREMIRRORS = &quot;git://.*/.*
            <a class="moz-txt-link-freetext" href="https://downloads.yoctoproject.org/mirror/sources">https://downloads.yoctoproject.org/mirror/sources</a>&quot;<br>
          </span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">to <br>
            PREMIRRORS = &quot;</span></span></span><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">git://.*/.*
            <a class="moz-txt-link-freetext" href="https://downloads.yoctoproject.org/mirror/sources">https://downloads.yoctoproject.org/mirror/sources</a> \</span></span></span></p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">ftp://.*/.*
            <a class="moz-txt-link-freetext" href="https://downloads.yoctoproject.org/mirror/sources">https://downloads.yoctoproject.org/mirror/sources</a> &quot;. <br>
          </span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb"><br>
          </span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">Any better suggestion? Thanks.<br>
          </span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">Regards</span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">Sandy<br>
          </span></span></span></p>
    <p></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb"></span></span></span></p>
    <div class="kO6q6e"><br>
    </div>
    <blockquote type="cite" cite="mid:17C666E056927DBC.10598@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#198222): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/198222">https://lists.openembedded.org/g/openembedded-core/message/198222</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/105532159/3616873">https://lists.openembedded.org/mt/105532159/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------L0TDV2vYkMojJ10J1LIbA7iE--

