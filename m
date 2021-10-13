Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9910FC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 16:40:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10920.1634143243992859697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 09:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=Tla8Lg6J;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5920abad25=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DDc48h005099
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 16:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=14p7gpjAPen6iN3U2lqt2xLinU3CRqYIYHnJFQXe1m4=;
 b=Tla8Lg6JQilKnKicqyV4jOaasTXP/eKdoKdpVIQYW+yoy0qOjBW5ll/hVmcZiHAxbzJQ
 6hTtQxnr98gKRmMJfmCm0/i8hScbpiE4HREQje7ChwtPemAp2UyB0BF8LFZpWNOP/RAz
 97Kp4ItkLb56jWVd+K/moqIFFp1m9JS0QHh68vCjNGifmvnrwzc7erR5jdGmnE1qeBK9
 xZstT4uou593jiD0mb9yizgISAkok/cDT5tWyMlUMoshIp0n692hYe0oZ4dy/AXKRPVo
 cKSOSC2ga3ET2X0yoVWArpjYLJmmdll1bvoSmIDp39ehxEUcGH9NAQld9/3vuMVNQKOm LQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bnka98tyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 16:40:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Su0HxBk4uXJ3n8cKYHGgd7SZsf0WDh/n2zfcOojmhn5rL22zjt/TxbyJoWd/8c2V0BHqnVDNUgTUYJq192EtgFLfk4qgYuzNG58L5KI3JdY26J9Ybx3NhziKdYGiDwpAZ+kFeWpQvBktXafinDKx1oGpl5ZSOj+2IfUfuRJRCvl7mX8f0sej0royE5I8BDM8HQQ6/3O4Sys1jXlDjWbcxEX+tn3It2rKdH0v5v0cLhVn57JYgbW1HEGQReDOuE0t3WAbCbK/g4p8RSoChQRl4281urDE9gW/G7hoXOsbO3xE339HRioKjiIpPvMs4JSpYeSGxqs4v6SutyLOkQR4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14p7gpjAPen6iN3U2lqt2xLinU3CRqYIYHnJFQXe1m4=;
 b=DUPtAm0tHT0byokOICekF57IJEeFECCi96/+toyebVz2jJpkm8r+aJh4m8VNA7G19H1ENFc1jj0mh5h4koQdPh6/fu/DtPQiuCQJ4fppAcc8IG/gZWb2XiXnXGcCP4adNfoz1ED6Fs2Hu1H5d9p+UXHyWPRM4P9knv6PXqukY3lhpHDxTvlReOMrlwlA7E6+MbrB/BxOV372Yq/NRgpE6+bHAuqpN+x+wsNHuz8Jcz2FXa0o4SFvWo0LzpjXlhuL38tmDnFgE/oTm1P8/MVal2YU4JHfCUkUlbPUMoDzdIhVAF3q1kGw5aFv84Ie5lXzGTl5PDuDWL9gis5cri8p7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3580.namprd11.prod.outlook.com (2603:10b6:5:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 16:40:40 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62%6]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 16:40:40 +0000
Subject: Re: [OE-core] [PATCH] packagedata.py: silence a DeprecationWarning
To: "Yu, Mingli" <mingli.yu@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20211011082848.12434-1-mingli.yu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <fc590102-151a-aa4f-f04c-918fa1f0179d@windriver.com>
Date: Wed, 13 Oct 2021 12:40:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211011082848.12434-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 BY5PR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Wed, 13 Oct 2021 16:40:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29fd6416-e062-4d76-3c04-08d98e683126
X-MS-TrafficTypeDiagnostic: DM6PR11MB3580:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3580A583E2F4C9044CB0DA85F8B79@DM6PR11MB3580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oGhbA9dUafOPJ3QuT237O3gQ/B6Q4j3jmLu5rZ8YRjZ9FgG7bTpnKIVqRcYd6CggvMBNJD5OEJlh24FMzs8H0rJcxDcWuPrae0mCLgyueHpi+DKMreIpoCb+DB5InIBG7I1s8MV9muyCJbm3KI2uy2TEQq5FA9vqjXKzFkobZRM7B9UOigxwsmriLBNvgPEhLWgeZ6ZnR5U8h8TDEB6T5GBgvfOfGbYLenjhufRY7/Hke5B52UITqYtZK0mIap9f45CT/p1rxrtJp1sponrxadPxmtu35DGpiEANn25aeqEC3JCiNTggF+GGZasMLNh1bbgLM1PKDB0dfzA3Ao2pUll6hyZV/PA13BFwjiuu3NwzkfxcLKCYMCGJgto9AW0DjeRtRTPYmfxDpD527TTjpt2RmqXHxd21eoA9L2yGXfknqQQJqkdVT/9dyBN1DvhCqaMrqFPOwRfsfmYYc6vV9hwPN6MeWpFWZJAeLWIM8FkmUUyyF7EeQO5ihGVOiPV4j+zebrxYmDILrOQWgpgdiRbbveXyaiMXiNGh1ZNHGYxLHEgMAzgW+ow5A+2GP8rx66P1IgnzrZejqHquVue4BwRzcuavSQSgLuOor+w10nu5BVmwEG/rKjkHBJM6cU2G0nd+y6chySw0EiKpw6403GL/hAYgBmqbui4SHSMWNOILE6gOBBRi6X9KgbFEaFhfycG4fgi3y7mqH/ts04+tp9zguDz1s+mwrG3/idncDtXq6QnVNhU1S3Z5DzrvQcn4IPczRpPp0aJ5LKTwSyfbK5NPAhdIkP+fUM0fJ/ie/iw6ctHs32nebaJEFma8KvtZ+o+sdoKuTvSuK0uVhTEjC3wNoyGYJL9CEioTyD9b6nTkVO4lK4VyIGKunxCbO0qILeHtePpxkqVhw2Mn7ifzXg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(4001150100001)(86362001)(66476007)(8676002)(66556008)(956004)(83380400001)(52116002)(36756003)(2906002)(6486002)(53546011)(186003)(38100700002)(31696002)(508600001)(966005)(5660300002)(2616005)(38350700002)(8936002)(26005)(31686004)(16576012)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUNvNzQrU20xNy9JTGZtVTU1UkZjNUI5VnBZaFAvZWZYclBsZnF6M0dNSVE0?=
 =?utf-8?B?N2Z0OEtjczErVFRla2dESnhzVS9hS1dDd0FLS1VndnlCdDFUN3FQb1dLY2lT?=
 =?utf-8?B?RXY1cmZWTE9RZEUyR1FUaFJTWXBFMkV0bmV2QXlXSG1SOGthSzh5NEFVVmla?=
 =?utf-8?B?Vk5nWm9VT1BYYmZ5ZkZOamM0OHVrKzRkVjFSTEdmMHZFYWVNMDkwYW5UQVlz?=
 =?utf-8?B?SDZSRFltZ1JFbzNqdUtHOXZpRFJIakE1K3FVZ0J1VytaOFZsdityQndYbkw0?=
 =?utf-8?B?dXlLUmVGSW40eWZYZ0JYajZGU2ZPTU85TkxxZSsveGM2VXFCN1hNVVpjWTFu?=
 =?utf-8?B?R3NlSEZaTjdRbVdkOUdPajRuc2JxSEFRejc3VzZpNXVZdHdZK2dYSnQ5bm5N?=
 =?utf-8?B?TjdjTnVVYkU1SGtTNTFUeUlod3JFcjZFYWh6eTJtOHRPaE5GVXh2WFdaRG1F?=
 =?utf-8?B?SHd3aHhldXpvaythZ21iYUhOK3FMYmM0Ry9nR3ZlMGl5QithM0tZTmNqZmha?=
 =?utf-8?B?b0FvbXRESUJaQlJYRGZNbmdsV1ErRUM2YlAzZWsvRTVGRDNoRSt3aTdVdmc0?=
 =?utf-8?B?dEVqazdoSzZ4NGoycEt4TUs1Sm1lNXg0M0tBOWIxcTVRbS9RbTJmamdLbUV5?=
 =?utf-8?B?KzI3THlQV1FaV0U0dEVPWmNhSmV0Rno4aFIxWVpXSUpYeHZ0MlcwdmZBb2w0?=
 =?utf-8?B?clBIN1cxNmxOOE51Y3hkT2dLNFE3bTdaaVJYeEVjZUJvVzQzUjhZbm5kUDR3?=
 =?utf-8?B?RVNGRUJkY2VTL1gwZGJiVWpDbldPTDcrRHRuelhWZXhFVXlFSFF0Z2ZLRGVS?=
 =?utf-8?B?alZUdU4vNVNaRGN1VHlKMGQ0U1U1ekQ2b1VoM0RDRWg5SW5pLzhtVkZnQ0w1?=
 =?utf-8?B?UllGbityakllY3FFdWJmMzA0NCtXYWM1STZlNDNILzAzaTVEL01KUHk4dEcw?=
 =?utf-8?B?YlFYVGphVU1QNGcramtCTDdOZEZ1b041QVlVbnNBdmRQZDJGODd5YWQvUGc2?=
 =?utf-8?B?NVo1Z0R3RVEzS0RlVHBOT2lIUFZuRlJBZjg5OGxaaTFaTVJPSXlYWXZDeEx1?=
 =?utf-8?B?QWx3UDJZYkp1R3FyeHZ5STRBNUtDNG5JbjIwSDlkSWczaHdQeU9RaG5HM3hV?=
 =?utf-8?B?YUQ3bEpoRXdGeWo0WS81K0J3cHFiODhTV3dtbUExbndSbnc5OFBNQjc5Tmgv?=
 =?utf-8?B?MXBJRi9RTFV4a2d2RVIzaVNiTXExNFIwcHFJd2RpVTQyN2ZIMmpVUndDamUx?=
 =?utf-8?B?amdneUtOZ2RSVTloQll2eE5XYzl5SkRhQVV0b3Brd05IUjUvSGZubE14RWlS?=
 =?utf-8?B?dTFPcXVnb2l1ZkkvNllTRmJta1IxK1RNc2R3STd4Q2RJVUp5VmsrSUFwRjlX?=
 =?utf-8?B?ck1LVjlHQWpPK1hsdmMxYmthaVkxWjYrTnp5M0NxRHZiaDZ5ekFWb2JteTVk?=
 =?utf-8?B?Qlo0NytKb1hVZGU4eWM5d3R1bzVHNXhRUE9WN0RVS0Fyc3d2ZmliK3ZBVzZh?=
 =?utf-8?B?WjRLa2ZHcnRheGV4M05OTTJHbks0SVRaaldWcDg3Qk1LV0ZyeDViSm5pRXpI?=
 =?utf-8?B?UWhvMGxjQmFGS2NVMUtCUTJSbnAreEZUMFplTENITU9MK205Q0RHU1o4YkQy?=
 =?utf-8?B?bXZVZnJnMHlpaW9RYTZoeE1UNlVCNVArSVBiS3RlSmZhaThQeG4va0JvUlpY?=
 =?utf-8?B?OHFoSFRJdmdTbEcrN0N1QmxYZzlsaGFsMVh3cjdKdVhJNXoybGdnS2hsa2gx?=
 =?utf-8?Q?P37npOBGVV28iOStwyPdM7jrHxmUjR8EhKG8ydX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 29fd6416-e062-4d76-3c04-08d98e683126
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 16:40:40.3597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RCOEH2MTUuW3LNc7NH0fXCZxgCPML9Wx8jeXyjjvtVoYKs1CicjONNOLFNuz24wkGt3jLRcku7FXTXI9PadAhGgLHkXT/PEj9ixlzdvqObI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3580
X-Proofpoint-ORIG-GUID: _FJguRUh9nYfHZFlsJ69rk7yj7XNyDWP
X-Proofpoint-GUID: _FJguRUh9nYfHZFlsJ69rk7yj7XNyDWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_06,2021-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110130104
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 19DDc48h005099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 16:40:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156918

On 2021-10-11 4:28 a.m., Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> Use regex strings (r=E2=80=99=E2=80=99) to silence below deprecation wa=
rning [1]:
>   $ cat tmp/work/intel_x86_64-wrs-linux/linux-yocto/5.10.x+gitAUTOINC+9=
17c420111_373c02c3ca-r0/temp/log.do_deploy
>   [snip]
>   /build/layers/oe-core/meta/lib/oe/packagedata.py:22: DeprecationWarni=
ng: invalid escape sequence \s
>   r =3D re.compile("(^.+?):\s+(.*)")
>   [snip]
>=20
> [1] https://docs.python.org/3/library/re.html


"Also, please note that any invalid escape sequences in Python=E2=80=99s =
usage=20
of the backslash in string literals now generate a DeprecationWarning=20
and in the future this will become a SyntaxError."

so it would seem that our use is invalid and if so we should fix it=20
before it becomes an error, right?

If so please create a YP bugzilla defect.

Thanks,

../Randy

>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/lib/oe/packagedata.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
> index 02c81e5a52..212f048bc6 100644
> --- a/meta/lib/oe/packagedata.py
> +++ b/meta/lib/oe/packagedata.py
> @@ -19,7 +19,7 @@ def read_pkgdatafile(fn):
>           import re
>           with open(fn, 'r') as f:
>               lines =3D f.readlines()
> -        r =3D re.compile("(^.+?):\s+(.*)")
> +        r =3D re.compile(r"(^.+?):\s+(.*)")
>           for l in lines:
>               m =3D r.match(l)
>               if m:
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156812): https://lists.openembedded.org/g/openembed=
ded-core/message/156812
> Mute This Topic: https://lists.openembedded.org/mt/86232043/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
# Randy MacLeod
# Wind River Linux


