Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03D5C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 04:07:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5241.1702958832722148478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 20:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=O2XXZe3w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0717b75427=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJ3WAKH023144
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 04:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:cc:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=PhnhFRe6q1B9ucv8moh1bt5V0DUvhM7A2NVeO02dhDA=; b=
	O2XXZe3wlFg7EvdxR9Zk4rG0Qgjc9hcQhuLlA10SBwkItXNIPr+QKXON6BwrxGlS
	LxAAqK/gO10cNRk9+D3PLuhhOwk6AqpxUS9O+OfrhLCjGfDxIkigiju0aPqCru4z
	6Xo+X047XhWqDI1/p5prRENwSgEmWTRDyn4DJ1XucniIKf5LEGZd/kD28IZ7GBni
	TdhuZeGMz3tr+vjpNwNzG58rOJp026/IUmneSjlswEFeq4d+sc4Ip2a5hpjYNKz2
	NN74olGLgIyrmO9v1AIhVDpCVW2G8uwjRkmn7tpYfOPS3hUhMHH301ADTSVCSMX8
	6HB16jtb0eN0ogyOxVEpVw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5trf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 04:07:11 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BJ47BK3029425
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 04:07:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5trf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Dec 2023 04:07:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZ4h63uhl78mDJEsFOiunnTbfjKerXDMlsCNUUgfk1qlVxGF28nEQtBYwbgvH+Ou55s10r5UVmOrAteYCmALDMd9r4SEPUKrcaPoEdCElVxpku+ouG9UFO90sSkfwfZ5FQe7bLkJDznBvm+aqgRo+CVe37IIZQmMgKQ8OSzNwhPS7YZYZWvU1VW37W6TBDdlk1o3lgnMNUoj8u4o38E7091p/dsbcF23wZMYgjfqb9bD+RYUd1mFleKta3Nl1GDxoAXncbTZeooRK4d2ALB6t5DmlqSmumdoQ3nKgrOEdWMsHTmRFE6Jm2uKTsjkHo41p4gbRRqxtMzXMcFe2C6yww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhnhFRe6q1B9ucv8moh1bt5V0DUvhM7A2NVeO02dhDA=;
 b=RrWANXdtAVaHUS6R5u4JKMrs5svTswMwL8hRnTrC6tCY6SvRqqXxXjKI3uwOpHpFOGpd4ysVAzTmtWEE7145XHogsrsYYo2rAkzfHq1xubUujYAYtfo7UGnpdxwvPGvbAB0VvnEgjUD3TI7La+lwTr/w3P19MFfs1sZ7nwilmBKsizDDoxnEaYp+BcTjNh0y4f2WroLzphIzlt5nevf1ut2FtLl4mN7txVpRSRZJMGwxvyztOXOZy2JU12EgbBz17AyYgt+OcperW4PJd4M9xL6M4wc22Wm551DgY682bJxPUwvveoBFjY8qO0TDmGiJv4d0rJSnTFa91qOYfW+JLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB5421.namprd11.prod.outlook.com (2603:10b6:5:398::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 04:07:09 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 04:07:09 +0000
Message-ID: <7a8e831d-bb7e-4d3d-bda7-ba225e453bb0@windriver.com>
Date: Tue, 19 Dec 2023 12:07:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] libxcrypt.inc: use alternatives to resolve
 crypt.3 conflict
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <179E2737483C0885.1352@lists.openembedded.org>
 <179E27474C306557.1352@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <Ross.Burton@arm.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <179E27474C306557.1352@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: 35eaf201-f6cd-4848-4f45-08dc0047f858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sO34yapge1y56/a6Q+jk3w913noUecCGNgF0roIA0HstSHVESYUyT8sOUWAwSgeMhGHDu27eTBM0U5wRkNzNa5YE/Ar9qLPeE96Zb2cyk1AgnQ9gEVfjbMqXKO3lnRXqNhMJgdXdFGs5YlDLBaHxNIGONdDIY0Jm+mDFtnIiuU0H0eKngOjJQ+4zUV5TrBPvupGQKzQ57CqFASZ/7uJA84fYb+1krwoTugxqQSh64veDhVctHwnRIONn72uYP2id9eKUggjG9PIaSf8rHPPMEYPrO3GhShHAauXWAExZ/QzvTW2A2YxsQNxS7gRU+nk4N+9+LgfU2CDUnk3DEOHZcSGYlur5JE65V+U0lMxpFMrH05ieNrKNrQ+XA0at1kbkcDuTTkHQjUI3hY4l1DygPWW2JqXlWKORi8lCE1LnlZEXWjwMNQ7wYbNs+4hit98+j6BjLTR/8jgdn2lqIRA/kCYhJ7eblI2oCAQ9bpPOavksEYmrSDd+ixTEEoZpRm4qUK4YUZpqRq0r+PIZIeD+wui+6ehiNdkVh50MiiqoU7B+0634sKBBHr1xURKxErzg2cKumgPfv6w+G74YVQMUx+icGgO+R6n7jvpI7QsQ+HzaCITuLbD41XvR5Ov+kuE3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39850400004)(366004)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(83380400001)(53546011)(2616005)(26005)(38100700002)(4326008)(8676002)(8936002)(5660300002)(44832011)(41300700001)(2906002)(478600001)(966005)(6486002)(6506007)(6512007)(6666004)(54906003)(66476007)(66556008)(66946007)(316002)(6916009)(36756003)(31696002)(86362001)(31686004)(66899024)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eDF5d29PeW9nRUJWcGVzRnV4YXJERjFGMTJacE5TS0gzTXJqTkl1cDg4dkF5?=
 =?utf-8?B?blI3M1lEdS9HNGc3M2lTa1c2NlBYNlZaaVgwS1Z6SFRZdUdCaGpWbXBFbFB2?=
 =?utf-8?B?NUJnaE8vRmo5VVNKNHErSWErbmlwYlhobUhBcnN0WnJxdFNXVytJUDR1czhm?=
 =?utf-8?B?dUtpT0t0UE5qZXlLL3A1UkMwWXMxWDc0UEpNTEl1NkdqRktnUnZjbkJWTXVR?=
 =?utf-8?B?U3hpZXM5Yi9ZQ29MS2wrbHNRUStENzRXQm1QN0JPWHhHcnMycENFS2dCa0xw?=
 =?utf-8?B?cmt4Z2dzb0wwSUpWbFJRMzNnd0dUN3Ewbzh4aDZJM3g1UlRZVHpodnZSaFBz?=
 =?utf-8?B?WnZtdEJzbE5CMnFSMnpLTUYxZ3lHZmJGNThOeVVjUkdiWGIvaWVhZEhhaW9O?=
 =?utf-8?B?ZUlsY0dnejhmYzUxdnYzYVJmVWYxeDhFSjJyeWJ5Q1V3TVBDR3g3ZExGL283?=
 =?utf-8?B?bERZYkJuRzVibmpKQXFwWGgycGpyNXFOR1puSFZRdm5TOEpiNVloZWsrWnpp?=
 =?utf-8?B?Y3orTUJ6cGhtcXp4OUltS2VyUXlpL2drZ0NDZTRreDlRMkdqQk5JTng2Mk1X?=
 =?utf-8?B?a3piOEV4bFdaUTQ3QUFFUktFUjg1VWxUQ3k1TThITUJrTXlMcnJhU3FpT1dF?=
 =?utf-8?B?S2J3UzF1VzJ6czV5OGx1UjdwckRMWWhramxLYU95OTRjZE5lNlpkcGZ0cWpl?=
 =?utf-8?B?djgrM3ZHSUZlK01lUm1LczNuMGcwUGFDdnN3eTVZZGxGN1YveTBKUzNGZEpR?=
 =?utf-8?B?RGN1M24vcmFIcVBwd3NQMFNOSTdiQTZCRHR2SzVVcUxVMGxpWm1VMThLN3g1?=
 =?utf-8?B?aUhkRjN3c0x5WlJGYWdmaXhnSlVmVDBocGdkVndGaTJCT2VZNUd4VzhhVU9B?=
 =?utf-8?B?cUxUamZXR2NMWG5uTDRjUGY5OFVuMmEvN2NVQ3Y4ZmE2SkpEV0xWN00wMElM?=
 =?utf-8?B?YUpZWFJrMytoaVNzczZRbTZrTmQvL1lUVTVZaUphUE5XZllqazVCcmxUR2Nv?=
 =?utf-8?B?b0hNNnhwMnpQVlc4VEZCUTdWTjBDSEFUcXd4clcrSWttMFplYVQvRjQzY1Mx?=
 =?utf-8?B?ODhid3dyUmV4bzJKODhDckQzTnZmUXJPMWJISndBVjVkOEFFeVZEbHlLNWJJ?=
 =?utf-8?B?WVlIa0lCREZ2TjViOVhWSm12VWZBNkJpN090Q1M3dExkOXVDTXJtSUZEWTh5?=
 =?utf-8?B?MjFNK0xSeXlWdCs0TjJTM3JwTCtEeXp4OXoxZnc5SU8xU3JEZlRvVnFpT2NJ?=
 =?utf-8?B?eE1ORmZEZ2ZrVWRoL0hFQWtXSlMvVUhPMEY1d2ZmSXBVTHhtZ21tVFpqYnAz?=
 =?utf-8?B?QUcvZGJZaW1EY1B5WmM4VldYM2tEbU1TQmRYSHdVZC8yaktmWmFiVG5EK3pB?=
 =?utf-8?B?dTVuMTc4a2NZWkJaUVVBcWFTWTFzMFdFbEpqWHhFMS94MkVKRklWZG13T2tE?=
 =?utf-8?B?YzVZbEdFNmdLaXdSOStxYUVqK1htbUhzNG9XU0dzb2kyeUk2MXhWbVYwbWdm?=
 =?utf-8?B?YnZlRGUwUW56NFRkam9HNVQ5SFFEdXJGaENrYThLdTc0RVRZUW9kR0U4R1FN?=
 =?utf-8?B?Vk9kVFoxUGpRd2d5dFV6RTRqcVQyQ1oyUHpSZytXKytlckVnUFN2NGw4YUhJ?=
 =?utf-8?B?cGM2aFpzT3pSaG1uRlB0VEpvazZhdHhWbUlOVFpoYTh0cVRaQ0x2YnJtbmdI?=
 =?utf-8?B?Z0ZrQmRNUE1vWWxNdkJ6Ym95RWtCRHZhcFFtcFBJeHZEbXB6L296YlQ4MExp?=
 =?utf-8?B?ZHhNdktGdjF5bm03dnpkWVVmSWYvQnRqNTJIOHBRQ1ZTWWYvdXk1N3g4MURD?=
 =?utf-8?B?YlFzMVEwc1NRbTlpcEVvUjVOK1BQTkRHajN0OStmQXdha3g5cDRBTlFZRVJM?=
 =?utf-8?B?elNrbXBkbWV2cWx3R3JOL3N6V0FyN2Nyay94dUQ4N0lNams5L0VnUGZlK3Nh?=
 =?utf-8?B?LzRGUHJEdEtGcjhqRHE0dStEcVVQcVFTTG1WYTRETXN3dGhzY1JSdjhDS0ZT?=
 =?utf-8?B?TStlVXk5a2ZxTW1UVHhzNDBXN2ZuWE1TZXhMUTJjZS8yRDF2ZytsdHJMTG9v?=
 =?utf-8?B?SHlXRzlsemIzdlUvRFVQdVNwNkcyMnZIOWJLSmM3dWFIVVh1VnlUMys5US9X?=
 =?utf-8?B?T2lmdGo4bFpYRnZBVm1RT0duSnd2ZzZxYXVFTU9uTmxyVE9tVUg5WWlWcEhB?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35eaf201-f6cd-4848-4f45-08dc0047f858
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 04:07:09.0401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3d5+moJLJ6Sf2yGI3SZE6kw/gLKALIEtWLQkv80Ze/jJOGyQFbQqzIA8cpaNXtXwZS64xWcizFpUPH8nrlj899lSDapXZzO3rWhIYqcwAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5421
X-Proofpoint-ORIG-GUID: nJNRh7vxujo4Y0RiAk1LgU8MmhLBOStU
X-Proofpoint-GUID: jenflwBDuwrfPhL_rLZmC_TqjGoY-JIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312190028
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BJ3WAKH023144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 04:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192689

Kindly ping


And why have this change:

In old version of man-pages's README,=C2=A0 it mentioned:

Note that sometimes these pages are duplicates of pages also distributed=20
in other
packages. Be careful not to overwrite more up-to-date versions.

So we set man-pages to lower priority,=C2=A0 so the doc in the related=20
packages are used.


And if we delete them from man-pages recipes, it will make man-pages=20
missing these docs

when eg: libcrypt-doc is not installed.

in man-pages recipe, ALTERNATIVE_PRIORITY set to 100. So I send an V2 to=20
update

ALTERNATIVE_PRIORITY of libcrypt-doc to 200.

Regards

Changqing



On 12/6/23 13:34, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> To fix:
>
> Error: Transaction test error:
>    file /usr/share/man/man3/crypt.3 from install of
>    libcrypt-doc-4.4.33-r0.x86_64 conflicts with file from package
>    man-pages-6.04-r0.x86_64
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-core/libxcrypt/libxcrypt.inc | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-c=
ore/libxcrypt/libxcrypt.inc
> index ba93d91aef..1a45df2618 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSING;md5=3Dc0a30e2b15=
02c55a7f37e412cd6c6a4b \
>                       file://COPYING.LIB;md5=3D4fbd65380cdd255951079008=
b364516c \
>                       "
>  =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig update-alternatives
>  =20
>   SRC_URI =3D "git://github.com/besser82/libxcrypt.git;branch=3D${SRCBR=
ANCH};protocol=3Dhttps"
>   SRCREV =3D "f531a36aa916a22ef2ce7d270ba381e264250cbf"
> @@ -26,4 +26,9 @@ CPPFLAGS:append:class-nativesdk =3D " -Wno-error"
>   API =3D "--disable-obsolete-api"
>   EXTRA_OECONF +=3D "${API}"
>  =20
> +ALTERNATIVE_PRIORITY =3D "200"
> +ALTERNATIVE:${PN}-doc =3D "crypt.3 crypt_r.3"
> +ALTERNATIVE_LINK_NAME[crypt.3] =3D "${mandir}/man3/crypt.3"
> +ALTERNATIVE_LINK_NAME[crypt_r.3] =3D "${mandir}/man3/crypt_r.3"
> +
>   BBCLASSEXTEND =3D "native nativesdk"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191868): https://lists.openembedded.org/g/openembed=
ded-core/message/191868
> Mute This Topic: https://lists.openembedded.org/mt/103008188/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

