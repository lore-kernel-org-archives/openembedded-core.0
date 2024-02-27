Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCAEC48BF6
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 01:16:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2472.1708996579292398293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 17:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=AAtLZ/5z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=278750aa31=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QN0ElA001971
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 17:16:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:cc:from
	:in-reply-to:mime-version; s=PPS06212021; bh=lLPYqM53hccenfadE0r
	B4NcI3yib3h3pNOBF9lmMMN8=; b=AAtLZ/5zjAExB2KOxZnvJBE9q5EInUlZ0yh
	sV/pzqMaOIraSftiJ+h7mbmxOqDUJ1rY9UvjjoBkZpAkb7W2xovab+ry+9M9Zzns
	rboh512/riowkuigYxIu4Gvw8TE07teJO1IHrIBAULpUDYkXzRY8gLByq9My8hS8
	xw0Gty+2xiXwV84QTZT8mKWEcBNS/cfQNwHuY9j1FniVZiJrDCStFv5AYWTKhgIN
	7mUH3uHpRxB8bEECIgIKR5Dn1twWsl/LoLZhKnAU9EBDj+iAc8agiVt8QUEz84bA
	t2XTDYCu7yXGqNWlOKngWY8E/NDECkmz3tBBzlaERGJ17zShDeg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm42cnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 17:16:18 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41R1GI0c028135
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 17:16:18 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm42cnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 17:16:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwvamIW+BfEddadf+201gYIhYHnQwoc+7BdV63slaTdgdpF3zAPG1ep5Hd26gAjAzN8XDgp2X5++1xCD7MzT6wPnPagzZrI1lIs604fwL5RQDYMLWBK6WKk99hd/eSToPPQPo5jpQ7ukGB2ZF/Xm3puHva56+TZ5hk/qpzGVlrdq2ZjD1UpTG/jqmWTIRYijVzXX9tjDDu0iJzKbPlPiZ4ZVNd/DTKPT+i/jo4B0LakRD2U8JmNqhNj5Vmk8lkHBTQR6+qv9Y3BnZqBwpiystSu324c+Ygqd6DRCbfEpUIT5pRQTlQe/x1Oo2C1vIeuocQNU2DUcg3DZZCY1+CwafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLPYqM53hccenfadE0rB4NcI3yib3h3pNOBF9lmMMN8=;
 b=NMCLN3X2qsaZdnaJZ3I1ZdQMtXt+DMv/p8q1ZQmEuIr0tZKHy6s/UcoSWKaS4lVo1dj95xcLCOp6/C1FWpOCWLnmScDaTOykoGTuzGePJaJUyH+rE75HEWe6bxGS9YezybVbrmowaFAAO5t88G233/wF2/yubmP2nGW5SGJHYe6sQ1UQ4DJvB+Pwe+dApXVBWn29/6D4bu9nYilsNG/w1uDbYH/Z1XxxvmL+L1wlQe4YzjRFmObeNO9i9ZWAart3mYjq4wpdhu6qY9/olqvlsTwozYJf1/MYQ7B4bZuE8OCoUtFjur9+dilHLF8KE5Fe4QIK9llk4KzS3Mul91nEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by MW3PR11MB4537.namprd11.prod.outlook.com (2603:10b6:303:5d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Tue, 27 Feb
 2024 01:16:11 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7292.042; Tue, 27 Feb 2024
 01:16:10 +0000
Content-Type: multipart/alternative;
 boundary="------------UY81T35nysYZq0gGDES8gM7I"
Message-ID: <81fee331-31ed-4ca9-9a8d-2522857a54ef@windriver.com>
Date: Mon, 26 Feb 2024 20:16:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] libc-locale: fix ASCII compatible warning cause
 build failure.
Content-Language: en-CA
To: xiangyu.chen@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20240226095921.363844-1-xiangyu.chen@eng.windriver.com>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        Mark Hatle <mark.hatle@kernel.crashing.org>, jonathan@joggee.fr,
        Khem Raj <raj.khem@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240226095921.363844-1-xiangyu.chen@eng.windriver.com>
X-ClientProxiedBy: SJ0PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::11) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|MW3PR11MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f6c7a8-288c-40dd-6f3f-08dc3731ae96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tOU+TKSbIK1ZuBCZ5m1YhUcbT0SmKQo3uHUQh8VpjWW4mb+1wcVjLXqPSyxF3IkSltRG+RQ0mEMlfeHYowD15BTVOBp8+xJeXGjCyxXeDNOhfsFrSHZNVRSWzaMIlEOCdZofXvaoIZAjnfIZCEuAVzMx+XikLL7AKTHXmmGbpV99st9S84EllREGFSiyOPdbvP/uNun+qJBvn30iNUwMVP2bb7YKyHNImvzl2a6/+HFVitWaGxJXsFA1Ay8u6W0FWHRuYMFovI075F4BmjW3ShWu50tO/MRmbvR69A0N0eKWJPt7wNjm7+aqs6bsG2jTNVFmVtLEswnPbawYqVzK3XK8j3abIHFAwG+/v7rjdhx9hs5MmoJO/gLXUw3OTwcEahZSgGEiBxyZPC2eJTyEyjglaQmAbWuOvPWv3dwdcicBqXwwntxxSoNVWYjCA9gXB8Asz3x3OI4ptCB7LZIb/+hQ5XFPbDG9PLwHM+ubOYU1SfDAg6RA3mGit27esDUbah21cvVn0S5gum2lWx6SQF8Kx3KtW7T9bp7GfBsvl0pMGVGMkaOzbyAkymkCfLvbrBplJXOy4uGP2wy/Fuk6QndxOUGODPKJi4jRiqIz7pZZ+W0nrux5Uf1od/PGOhdFFuf+XWV8FG6hWlqsZQxXAg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?akZYemVobHBxRjRVY0ZCRWYyYjRFSWRLWjlQNDNHQmY1TXB6VHovdVltenN3?=
 =?utf-8?B?dlZsbXlYRnc0akVzcFpwbkJUYXk4eTZwYnhkb0FTbFU3aWljNmlicktzdWlj?=
 =?utf-8?B?U2RZaEN2WkpBZ00xQW0wTk1YYkdqRC8vMEZCZDFQcEVtR1JoTnFQZHFCNVoy?=
 =?utf-8?B?N2JnbG5TSGlsTS9kNkFjSm91a3d1VmdCLzNBUnpiMUdoQ2JHM1k3ZlZHcHpJ?=
 =?utf-8?B?RHZBbzRhNEZsMy9NL3BrUG5zc2VTYkJQajFrNHhCY0RJSWhLaXloNHBwZ2lL?=
 =?utf-8?B?alBEdDlhb1AzbjhoTlA4K1k4dnN4eWtxNDlKNmsramMrYTZOa1pkZXBtVFk1?=
 =?utf-8?B?dldmaWtoTzcremloWDJkQk5TYWg2cW8vUkh6Qm5kT2tqaXlqNjhxcDVWZVBz?=
 =?utf-8?B?N1lkenN2QmR1dFIwQndPN0M1SDd1cnI3M3BhWjlTRmdLcFpSWHVpQy9oUTNn?=
 =?utf-8?B?WnZMbjlqa3U4b2NCT3lrcUl1UG1NeTFhS1duaXhtby82dGdxU3VGYVZNWjlE?=
 =?utf-8?B?TWJ6VDNBbkZ0UFBvcEdhN2puOU9JWlFFbFhlM0krMmtUc1hxcXNaQ0VLSlhw?=
 =?utf-8?B?NUg2bDFkaGdIdzZ6STlzTnBKSURtU1FXa1ZMa2dwelJNcHNqMEhBQzZCMmRv?=
 =?utf-8?B?RnJ2bWp3QUJzdkFHczlaMktMbmFSTk5PNW5qWHZUVFdRYXV1TC9HcVcrUWdq?=
 =?utf-8?B?YkpzNm5lL3VPYUdwbUYyMmdYQldmbG5vaDJMWFZjSklhMm1tK1pVa3cxYnBW?=
 =?utf-8?B?UGFqNVY3c1ZuTjkxRHFqc0pUR3JvTVFhalFsOUxuQ3F0UDRFK09IWVlXdXYx?=
 =?utf-8?B?YTgzVnlYS2I3dFljVjZHdmFrS0NHV043Yjg4N0JFSndSWjlvVysvNjczSTBi?=
 =?utf-8?B?YmtldmYrWVFyMmFKR1JsckRpRThkdE5GejdmRytZVlVLZy9TdG5Bbi9ZOXhG?=
 =?utf-8?B?c1lVS1VpTjdUTEw2ZGdFUXU1STFMU1VzbGlBM0pKTWFsYVhFRGw5OGNheC9m?=
 =?utf-8?B?TmxHZU4xbnh4bGNxcDJJS3VEZDZkYVR4VkMzMEk3VHU2cU9uQ2ZNNzFCTmEw?=
 =?utf-8?B?V1dmVkw2NHBrRm1Vb2FTUzg4UTVobEJIdFhIU0I0NjFuWXk0N0lSaWlWblFT?=
 =?utf-8?B?SEJGeGgzVmFJNzFLd2ZML3NBSEM5OTIzU2h5dXc0M0JlWHBkSDFCZ1NFMmNw?=
 =?utf-8?B?VmhjKzBXWlJsTGFIdE9JQTVEd3dkZ281aysxeE4vZkZ4bVlMSHluNU9CQmV5?=
 =?utf-8?B?VU8rcUlqQTI3WmFNSk9kbVUwT3FyNXpvbzNsVDR6NEh6RWRmam5OMXorSmk0?=
 =?utf-8?B?RlZBY0dWZjhOZkpUdG9yQnpReGdlOXVXTGYvSVZMWldNV20rQ25ubzBGUVNK?=
 =?utf-8?B?RitIdWxqbFhRU0dncThGeFE3dE9rZlJVTDBIRks5TUJocmtMMzlxVHBSeU42?=
 =?utf-8?B?cHZRRERGUWE3VDBETi9tK1JzQmswT1FnVVpzU1JQQW1ZMVhiL1RqTWkvZStH?=
 =?utf-8?B?azNrVldYTndVaHNsSVRnN1pZN3pWRGoybUZpYytaTlB3TzMzLzk2WW9Qdlo0?=
 =?utf-8?B?dkIzRm1mdTBoeDBRMnphLyt5YzFGOFpQRy9jdnNBSHUvbkZ1QXl6S3JhcTZZ?=
 =?utf-8?B?TG9yRTI0dGhUd0MyN0FpekFyamFSdjRhTnZJR2FFeitXb2JDYmVxbzFqY3c3?=
 =?utf-8?B?VlN1Z29lTFFac1A4cG9sTUsrQ2gvQk1SQjhrVUVKZE1uU0NYVlFLN0FmVVRu?=
 =?utf-8?B?Z1ExMTl3MmJDcUhKSTB2RExySW5WRjNSUG5PbDhCYllDTEI1eGdVaWVJLzha?=
 =?utf-8?B?WDhSVk1FMDZ1TWYwakZacjh2Vnc2SmdlL3RKd2tFdTJ0Vy9vN3QvaTJSSVJw?=
 =?utf-8?B?Y2tnYlFpWDFyZTFHVVdjZ2tDMkRMQlpmUUp0UlIrcXRoTm51Y1FsZGZTTEU0?=
 =?utf-8?B?cXdIMUkwTSs0d3c1cVlYaVVETzlOb2h4YThRWXlmVE9XSmtYUnNiZlJtTm5V?=
 =?utf-8?B?cFpZa3pOdFk5dzc4OHUxRmExajJjVGMwTXY0dlRXT0ptUVZmQmtkZXNQT0Qw?=
 =?utf-8?B?RGQvOUZWODB4QlExUHdEUXpOS2l6ZTZndEpZcWRRdU82bDFaME5CZHN3Nkps?=
 =?utf-8?B?RnJmNXhjeWVQQzk0cUh3MWhvY0h1Y1dlaWgyTmhMRDk5K2owVXNVdUc2USt4?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f6c7a8-288c-40dd-6f3f-08dc3731ae96
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 01:16:10.2833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dH8HT6Fm7wrWdqWc6c+vMoisESGjpVPeQriF2FAivpJIucRXllRLDo6jtelWv9FcJmZkQ5/not9OvRrNgKbBm/DagxqCAicFCoGwbJ+cgMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4537
X-Proofpoint-ORIG-GUID: ISaDR72PaKvqzq1UY-NYCu3ddFnM_YyT
X-Proofpoint-GUID: 8Ol2mlYtNN7mJjaNDqooFEv6yLeNqzgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 01:16:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196236

--------------UY81T35nysYZq0gGDES8gM7I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41QN0ElA001971

On 2024-02-26 4:59 a.m., Xiangyu Chen via lists.openembedded.org wrote:
> From: Xiangyu Chen<xiangyu.chen@windriver.com>
>
> Some locales are not listed in glibc locales support list, but can be g=
enerated,
> here using ja_JP.SHIFT_JIS as an example. We can add following line int=
o local.conf
> to enable and generate it:
>
> GLIBC_GENERATE_LOCALES +=3D "en_GB.UTF-8 en_US.UTF-8 ja_JP.UTF-8 ja_JP.=
SHIFT_JIS"
> IMAGE_LINGUAS +=3D "ja-jp en-us ja-jp.shift-jis"
>
> The localedef tool would report a warning and exit with 1, that cause b=
uild failure,
> error message as below:
>
> [warning] character map `SHIFT_JIS' is not ASCII compatible, locale not=
 ISO C compliant [--no-warnings=3Dascii]
>
> So add a --no-warnings=3Dascii in libc-package.bbclass to fix build fai=
lure if someone needs those locale
> in yocto.

For context, Xiangyu is changing the libc-package.bbclass so that we can=20
generate a ja_JP.SJIS=C2=A0 / ja_JP.SHIFT_JIS locale
to make another of the bash ptests pass.

I don't know if that locale is commonly used these days but apparently=20
it's not POSIX complaint:

https://discourse.nixos.org/t/building-unsupported-locales-ja-jp-sjis/361=
2


Richard, Mark, Sundeep, Jonathan, Khem,

Any idea if this is a change that we should be merging to master
rather than skipping the bash ptest?

Xiangyu,

Did you test musl? ( I don't know if musl even supports locales,=20
off-hand! ;-)=C2=A0 )

../Randy


>
> Signed-off-by: Xiangyu Chen<xiangyu.chen@windriver.com>
> ---
>   meta/classes-recipe/libc-package.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-re=
cipe/libc-package.bbclass
> index bf160b115d..c06a2ce90a 100644
> --- a/meta/classes-recipe/libc-package.bbclass
> +++ b/meta/classes-recipe/libc-package.bbclass
> @@ -278,7 +278,7 @@ python package_do_split_gconvs () {
>                   bb.fatal("unknown arch:" + target_arch + " for locale=
_arch_options")
>  =20
>               localedef_opts +=3D " --force --no-hard-links --no-archiv=
e --prefix=3D%s \
> -                --inputfile=3D%s/%s/i18n/locales/%s --charmap=3D%s %s/=
%s" \
> +                --inputfile=3D%s/%s/i18n/locales/%s --charmap=3D%s %s/=
%s --no-warnings=3Dascii" \
>                   % (treedir, treedir, datadir, locale, encoding, outpu=
tpath, name)
>  =20
>               cmd =3D "PATH=3D\"%s\" I18NPATH=3D\"%s\" GCONV_PATH=3D\"%=
s\" cross-localedef %s" % \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196197):https://lists.openembedded.org/g/openembedd=
ed-core/message/196197
> Mute This Topic:https://lists.openembedded.org/mt/104579284/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------UY81T35nysYZq0gGDES8gM7I
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-02-26 4:59 a.m., Xiangyu Chen
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240226095921.363844-1-xiangyu.chen@eng.windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Xiangyu Chen <a class="moz-txt-link-rfc2396E" href="mailto:xiangyu.chen@windriver.com">&lt;xiangyu.chen@windriver.com&gt;</a>

Some locales are not listed in glibc locales support list, but can be generated,
here using ja_JP.SHIFT_JIS as an example. We can add following line into local.conf
to enable and generate it:

GLIBC_GENERATE_LOCALES += &quot;en_GB.UTF-8 en_US.UTF-8 ja_JP.UTF-8 ja_JP.SHIFT_JIS&quot;
IMAGE_LINGUAS += &quot;ja-jp en-us ja-jp.shift-jis&quot;

The localedef tool would report a warning and exit with 1, that cause build failure,
error message as below:

[warning] character map `SHIFT_JIS' is not ASCII compatible, locale not ISO C compliant [--no-warnings=ascii]

So add a --no-warnings=ascii in libc-package.bbclass to fix build failure if someone needs those locale
in yocto.</pre>
    </blockquote>
    <p>For context, Xiangyu is changing the libc-package.bbclass so that
      we can generate a ja_JP.SJIS&nbsp; / ja_JP.SHIFT_JIS locale<br>
      to make another of the bash ptests pass.<br>
    </p>
    <p>I don't know if that locale is commonly used these days but
      apparently it's not POSIX complaint: <br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://discourse.nixos.org/t/building-unsupported-locales-ja-jp-sjis/3612">https://discourse.nixos.org/t/building-unsupported-locales-ja-jp-sjis/3612</a></p>
    <p><br>
    </p>
    <p>Richard, Mark, Sundeep, Jonathan, Khem,<br>
    </p>
    <p>Any idea if this is a change that we should be merging to master<br>
      rather than skipping the bash ptest?</p>
    <p>Xiangyu, <br>
      <br>
      Did you test musl? ( I don't know if musl even supports locales,
      off-hand! ;-)&nbsp; )<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240226095921.363844-1-xiangyu.chen@eng.windriver.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Xiangyu Chen <a class="moz-txt-link-rfc2396E" href="mailto:xiangyu.chen@windriver.com">&lt;xiangyu.chen@windriver.com&gt;</a>
---
 meta/classes-recipe/libc-package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-recipe/libc-package.bbclass
index bf160b115d..c06a2ce90a 100644
--- a/meta/classes-recipe/libc-package.bbclass
+++ b/meta/classes-recipe/libc-package.bbclass
@@ -278,7 +278,7 @@ python package_do_split_gconvs () {
                 bb.fatal(&quot;unknown arch:&quot; + target_arch + &quot; for locale_arch_options&quot;)
 
             localedef_opts += &quot; --force --no-hard-links --no-archive --prefix=%s \
-                --inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/%s&quot; \
+                --inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/%s --no-warnings=ascii&quot; \
                 % (treedir, treedir, datadir, locale, encoding, outputpath, name)
 
             cmd = &quot;PATH=\&quot;%s\&quot; I18NPATH=\&quot;%s\&quot; GCONV_PATH=\&quot;%s\&quot; cross-localedef %s&quot; % \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#196197): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/196197">https://lists.openembedded.org/g/openembedded-core/message/196197</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/104579284/3616765">https://lists.openembedded.org/mt/104579284/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------UY81T35nysYZq0gGDES8gM7I--

