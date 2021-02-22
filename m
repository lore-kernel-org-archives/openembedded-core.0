Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.55])
 by mx.groups.io with SMTP id smtpd.web08.29493.1613958088246080751
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 17:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CmVMJcs5;
 spf=pass (domain: windriver.com, ip: 40.107.69.55, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPtWbI8NiQG4o4ZHfQZEPc3RJYrS89OCM0UapWC8n42DV+SKSmVu7MHKJgA8jAWbOTqSFb/XDlyKd3hQ+qcxyUQPCmOYpZ5lK5gelM9BWOcdeb/ACUEtYLrgHQCzu9tah9hKNZBKoh3UamjIiY0Hip52ZWzyvrKLAN1HCBWs9Y+ueshmpMYRYgjaYI1oU1qKFFL6kSPGhjmxvoCumxCkxoXK5799+L/ptZqYpzIftV3tQpxH6Qju96iYotEtnJ7VR3Fi0w1OfoZD/ip7zhZfvCFdd/r9bUWc+LGoGImbL9b8pCe9I2ZULn+DbMyq/mt+6qlRaRvO5Dj5hxRGipdO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlO32W6M6ekd9LyLhuZ64+Kvck3AskN5/WzQFmCdHLc=;
 b=hRhu2Jgn5WDGcD5IrnuI3bIyKjCVJQBaabIoMDpI3ZO6sksinq7Q+eBbh/iot3T9thqMqx5vSaWpTGugw2zS09Wtx/zl63Va6BZTMiRqvMEnDSUSi9ZAgkQfmulYhz5/F2xVtsqG3DVUgV+BsgH10uKhOcUetlmbnvbJWC4n1vWkKBhtEBlwv8/aH37xooEpos3n0zc5naWH1zYbdTYBtGtuVODa0/7lmogosjCuV6HJixSt2J9jeYezvJlbafdBEoDjjlnPyOGPFI7BNnITJC5jTVhoym+JGVfLXwc6xzXmpLBfoGkuzZ47XG0wOZQEuxJI+okJd6iWw7Y+yApTNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlO32W6M6ekd9LyLhuZ64+Kvck3AskN5/WzQFmCdHLc=;
 b=CmVMJcs5kKmrpScHicsH6iqglqdZzJE343b7aTCt1H0XrvfT2gYzeffy7DDnbJRuBXmIdvoGp+wsI3BvcqNPMAqzA3vJ1VGibQI9QaacXDqC9L0602wk9vmTqnZycqRiknOapCudSva6ijQHB32kSJ8mjibbuKsXcZKcOS1dXsE=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR1101MB2312.namprd11.prod.outlook.com (2603:10b6:910:1c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Mon, 22 Feb
 2021 01:41:26 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484%4]) with mapi id 15.20.3846.045; Mon, 22 Feb 2021
 01:41:25 +0000
Subject: Re: [PATCH] cups: set rundir to /run/cups if systemd is used
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-core@lists.openembedded.org
References: <20210221164919.389109-1-open.source@oleksandr-kravchuk.com>
 <007cf865-82b2-d5c4-6720-76e9009e8e6c@oleksandr-kravchuk.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <4a8968f8-0a15-9916-ee34-6d5e94137a54@windriver.com>
Date: Mon, 22 Feb 2021 09:41:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <007cf865-82b2-d5c4-6720-76e9009e8e6c@oleksandr-kravchuk.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0163.apcprd02.prod.outlook.com
 (2603:1096:201:1f::23) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR02CA0163.apcprd02.prod.outlook.com (2603:1096:201:1f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 01:41:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50706248-8f9f-4253-5d1a-08d8d6d2f702
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB23124DABE94E750E5CCEB2CD95819@CY4PR1101MB2312.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uYy+GJXzQs3o54pehQOLhF4mD8aJ4mnGKkmCyzjDCTdBtOpy42hwwsd3qcgUByuhXIADlNhN0t52vsWI0tUUOh/bWoiMJbTJN8Ia2rVlt3G9N68BNGW/JL8XO2j8E0LljwnuIp5S7oAbDMAN3RiAih3tpvZAGqIL2uvaLoD1Q55F5b56tSeuNN8ZZ6Q6aNc0VHCoZzvzdtxl5oYlwm7im99rqiQPEechE7/GY7DDhJIIisLCV5lWVaZmJ4f9/e/JI/qRiN5Ot0H2TYroUDN3TJ70hUffcVGOrG+Z+LvEDCxtpnF2CnMbrMjTZ/NIGGt6MngtXoF2+ojTxxwl8Vm21g7YmZL+hFEmo6DTq2quJI82Jj9Xt9Rs3LTFPchesKQl75lrDnWhjZjA0n3zdfxhG3mYJho8RzSwgHAD122VBQ7z5v1doDh5vQGCVkTRrxu4GaStBJOZXxy3K6tAPSyMlnvLKqCkVptO28k4gxK9VbQedQ7W8g1XxpZ27/4C6vIzYwv3u56eaC40tzgUK42+4yjDTtXzNCNgv68kfRoUMbmutfL3FLTR/ML5VkyidEntxsaFEfcJhHDfSFcR4KnVnCXEO6iWLnmsHAkD0leSaFYDVt49nz4MRZ/wMN2IEz9A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39830400003)(396003)(366004)(346002)(136003)(66556008)(66476007)(6706004)(956004)(2616005)(66946007)(8676002)(186003)(83380400001)(52116002)(478600001)(26005)(16526019)(31686004)(8936002)(2906002)(53546011)(5660300002)(31696002)(6486002)(316002)(16576012)(36756003)(86362001)(6666004)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?O+rCdGqQGEOb2o+E2pyi2ug2D5rq1zLjSY/XrAoD/oNwbZbOhK4yGApkw/A5?=
 =?us-ascii?Q?bwjTdH+sNAktf4rNddvaTXXbEC78YP7bvauBElDkkf//GX1KpI3+JLr4mfde?=
 =?us-ascii?Q?IGW2dA7kNFZ5iAKY36XXXJNNR5M5HN6oILMKfMB+escvuZuz2y8Zxy2HY8IX?=
 =?us-ascii?Q?Yc57sXuiTvaKw1vQrxhQz8XKtFpFjZ3EqTylEWU4x77keWPbRHRrfgOvEIGK?=
 =?us-ascii?Q?e/TBZ6Qb+Ty4+YBdz7WcI0qt7cg6OztLE8x8c9WgohU8m84WqdMqGFu3UaYd?=
 =?us-ascii?Q?XUPKIwEN3HukFRJZ2Dt0GNLeQWIHWIxnGm2MrvMaaPvO2i3Cm6MMJpssQ0DQ?=
 =?us-ascii?Q?gfPKTAe/N20yyd1kgmW7mH5ie8tFl5e4tZVJKtW/rdHLAeFKzfOGmAt/Rqw0?=
 =?us-ascii?Q?IjV3fJy1SkASA0Du/j9bg5uf+UWa5TfUfH7XOxnNSYfMgFJto8a7TfQAYZ97?=
 =?us-ascii?Q?6s3vesOS1WcKm2Aby4zCGdylVEMIzb2oHKBaaIT8meQXeA7P3iOjVRemgFDi?=
 =?us-ascii?Q?YMG+FVxOlBP4CsuTQ4KBKIZHU4vtmQK2h9HaJCQX693m48DPcLk/K3MYDAxI?=
 =?us-ascii?Q?ae8hxbZ1x/XFI/EvAsfC+VGqXUlXh5t4+g+lFJZIC3DPSfd1kPNugyE8KDUO?=
 =?us-ascii?Q?NU4kIxlINqp21q88U3jGsO7xY12SY4HfVqnFp6pwukT1oe/vW8Srhldxw4QH?=
 =?us-ascii?Q?sC7Mhx7bE2BxQt8r3PQ+nHKAJNuppyREzxz4KWQtjIxgyPuY/69+GISEHIkJ?=
 =?us-ascii?Q?Sl6zsCoekAdEqmkKXsG7ggeAQShvrkQC3y95QohZ1U2gpv8eNaiZsL8OjHY/?=
 =?us-ascii?Q?lDccjChADOIRIn+kzwHvRBWjeN5Xzr0AgI4nN+I35qUC0daNPT6nJWY+3bGZ?=
 =?us-ascii?Q?KO5XznxhYo4E+T09lNsqszqcQdXUACfxPU0ozdcBVw6A4JZCOnyoD64MdkZn?=
 =?us-ascii?Q?6kRKY4DNmfZmx7Bhwg4TeTgCky2DGlVKz5EeBvzGdq9UCYewo5qqL6du+VmF?=
 =?us-ascii?Q?l9QbiqSFolFjwCJjbEYK8WXuRd4w4IDjz0q3bgMunVLW+dTGh9cuRuZGdo46?=
 =?us-ascii?Q?RkKxsvU+mtwhUC1yF4jydIcWo61+iiH1cgTuuyHcdAU/zWKRCZRkjas/Ytxw?=
 =?us-ascii?Q?ZbExXOPPx6CYq88DO5Ew6IjJ5ev7xNfnY9x9LN4xIolduxZMelDozA+mQTDc?=
 =?us-ascii?Q?tsVF3DnoOncqwSFGl017zo46m1UNUSHqmAxMyP92f1doJhnD8QjzwSBxImAq?=
 =?us-ascii?Q?c9pK76b7Cs3dJIimHBqMqoKkyDrfHq6iTR1iPoIZrlUvbPQZiB90YdY14r4W?=
 =?us-ascii?Q?6flsMcxQa2/6VDOYx8gJwe1H?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50706248-8f9f-4253-5d1a-08d8d6d2f702
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 01:41:25.5215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nx4p9MCqZRwkGIr57nFv0mPjQECv3xp5DWsLiL/2kTYs9gq1p+ImVLXKgQgZFRIOcm9Y2SZNLaLK7NuXtlradQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2312
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 2/22/21 12:51 AM, Oleksandr Kravchuk wrote:
> Kai -
>
> Could you please verify and confirm the fix is correct?

OK. I'll test the v2 patch.

Regards,
Kai

>
> On 21/02/2021 17:49, Oleksandr Kravchuk wrote:
>> When running under systemd, cups needs to be configured with
>> '--with-rundir=3D/run/cups', as systemd takes an exception to the
>> activation socket being under /var/run and relocates it.
>>
>> This leads to fd duplication in cupsd and an inadvertent closure of the
>> activation socket when the daemon exits due to inactivity, so that the
>> daemon cannot be activated again.
>>
>> [YOCTO #14152]
>>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>> =C2=A0 meta/recipes-extended/cups/cups.inc | 5 +++++
>> =C2=A0 1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-extended/cups/cups.inc=20
>> b/meta/recipes-extended/cups/cups.inc
>> index e7a704134c..a8e8d115da 100644
>> --- a/meta/recipes-extended/cups/cups.inc
>> +++ b/meta/recipes-extended/cups/cups.inc
>> @@ -56,8 +56,11 @@ EXTRA_OECONF =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 --enable-libusb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 --with-domainsocket=3D/run/cups/cups.sock \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 DSOFLAGS=3D'${LDFLAGS}' \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ${EXTRA_OECONF_SYSTEMD} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 +EXTRA_OECONF_SYSTEMD =3D=20
>> "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-rundir=3D/run/=
cups','',d)}"
>> +
>> =C2=A0 EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
>> =C2=A0 =C2=A0 do_compile () {
>> @@ -105,6 +108,8 @@ RDEPENDS_${PN} +=3D=20
>> "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'procps',
>> =C2=A0 FILES_${PN} +=3D "${libexecdir}/cups/ \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> =C2=A0 +FILES_${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'syste=
md',=20
>> '/run/cups/certs', '', d)}"
>> +
>> =C2=A0 FILES_${PN}-lib =3D "${libdir}/libcups.so.*"
>> =C2=A0 =C2=A0 FILES_${PN}-libimage =3D "${libdir}/libcupsimage.so.*"


--=20
Kai Kang
Wind River Linux

