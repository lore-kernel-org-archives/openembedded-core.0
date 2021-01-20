Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.63])
 by mx.groups.io with SMTP id smtpd.web09.24788.1611125887474299150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 22:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DnLtDRwb;
 spf=pass (domain: windriver.com, ip: 40.107.93.63, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKswxH4PFZENZtYR4wjfMmwGCeC1o6TxNeMHl/VnfKqj/+zMOUda83ZjogcXMobv1GA6T50MAdGJUX1lcLk7g9vXjjljGz2yDRQafOeh06U17lpqJ3i1vadBGv+TCq53mJhBwYTgn7+A2X9h2t5rK+dguWLEthlZ25Ut35C5VziFDwBIF4dmocbGxyEZy2kaVMP5JDSSOpR/NWdHD00RUfcflFTaxO5oqKfsuIm2mtf2xsw2TAzPKcQ76cOpxexqNJWEKP7HPO4V/VbWG0hEpCGkaRbj7pNhPgXx4c07Lu9Dv/DgTMZpb++hrh6gvsV7xZmLq43YqGIB+VyuAASyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U051kO309aXBB+9o3yxpqcl2oJHFxjG2ey247BrKIcQ=;
 b=X/cNn0aoh94Nje79iSwy/gGlGTv1SZzYQAjf9uVY4bZBHlwv95L3re5jm7vCxHKOTN0UucJHSt2CcjwYPTD2jsYhl3j+oecdpQLYEc8aaGFho+7lbmhBjKioUt2vdOWDzcF+lnFPAbjV/Y0YMqIlU0mFYYiVTrYurnvgbpMWce1uJhCOk1NI+fvus/h/23VzyHldgjdSdiRrbkftfJsq6bB1WpbcVheiXRcsdK80cBaGavNFVrrzmEh3/j9xhSsFo32+Ia6rrDbgsCooWDti2wyRPrk3UFHZ51Dn4JZwrkfaAvutv/QhrMWfasDklat/QCK0c5XuXZJyoJh+Jvr3kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U051kO309aXBB+9o3yxpqcl2oJHFxjG2ey247BrKIcQ=;
 b=DnLtDRwbNhdPD6MY5TeJDoc7R5A3jG9C87O0+yGyRQufRvFsykXFG6z6dKF7ewf7ZQzV+UAEe+cR8WPHGjO7DH5b0djnjIWlJEj+OaM59SAeHch1COryMqbcQPdBJdKwhveqCitJJ2KFYPUw2UCf6M0yuynrrZYVZN04cMRXjPs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2110.namprd11.prod.outlook.com (2603:10b6:301:4f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Wed, 20 Jan
 2021 06:58:05 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 06:58:05 +0000
Subject: Re: [OE-core] [PATCH] bitbake.conf: use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210115032309.24983-1-mingli.yu@windriver.com>
 <4e34eedd6cd84c361e5a316325c508499a7d75a6.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <80c15732-548c-020a-4ac1-0993c2a00fd0@windriver.com>
Date: Wed, 20 Jan 2021 14:56:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <4e34eedd6cd84c361e5a316325c508499a7d75a6.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0060.apcprd03.prod.outlook.com
 (2603:1096:202:17::30) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK2PR03CA0060.apcprd03.prod.outlook.com (2603:1096:202:17::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.7 via Frontend Transport; Wed, 20 Jan 2021 06:58:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 657087b4-e14d-41c2-f44b-08d8bd10bc1d
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2110:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB21108C7B28D93A44591CC806F1A20@MWHPR1101MB2110.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EvUxUe5tNIXHhVDnfqKOdKnoeRhwZNQOq2iwBvMWCtgXvN6FVP9CW2cEu1V9VMTH7XqWfqAXZsQW53iMdsh+jQFRNQpVd/fDqf1vMXG3lB4UpftPhPUeX0Ez88+ZzFMPkgs6T4ctZUm2XSS1xysCQgQIHBsUug9fhw6hCDL6VXJHPikC8A9dcj5pwSvQQcP7UZBW5duGlITG9Vnzqi0CryCItCy+zSI8lOqo/z4nE/uCb0DaacqpnilNRXfxUmPyTl5ztw7sx+qaUGOW5xTqxi0+dwnIqGb6+plOOkcTdB9VhAdSVHtqURhk5Nq48wjRMG1CigNrr2Ex1q26Xw9j26K3bVDguAZ/Kpg8U8MjEnRQ3rTsdzK4TQEVjyzQre0ieV+oQ7uNGm1YF7Wx13veoW03hguJ65yWuc7UKOTMt9Cq6ohV25R520zFDxhA/FXqACBglaUGFReguw7WnG+BfGiW98z4xMee+UoKU7qIo/VOKIxwtvIM2GLDnhmiXErdRV21s44Co/Q3SAhP0W+jkOrNprazCL8stNiWqJF9+THJ0XcdePx3uksJwVxIDOsnVaF4dTSMQgTCBCl8vgJqRoZaW4EpSykLvTODCOdqiLY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(346002)(366004)(396003)(136003)(376002)(186003)(31686004)(26005)(2616005)(66476007)(16526019)(53546011)(31696002)(86362001)(956004)(52116002)(478600001)(6706004)(16576012)(2906002)(8676002)(6486002)(5660300002)(8936002)(83380400001)(66946007)(316002)(6666004)(36756003)(66556008)(966005)(78286007)(45980500001)(228453006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?sL3k+5+7aQbjYxm3CiZnfv4woJsu0iRV7aQWfexdXfDI9O6dofjvazm91WQp?=
 =?us-ascii?Q?qeoDZYFxAaA3tfAYGxRU+NedAAg/l9RN9NDluX8x5wzjTr+VY62aeD1oEjso?=
 =?us-ascii?Q?B2f+AKEJ+05oqHS3ZpuRuX4hW1/hrNO3I3uwuJgLqpHSDpaZhD0WA+Eto9Kg?=
 =?us-ascii?Q?exdbUJM2tEw6C/3xctRDcA3GBJPWURieMAnNVZ75pJhySEX4GDas1H3TV5/N?=
 =?us-ascii?Q?cv930zQYXw9jW0jEXMCXQoPFygFF2jcYpdQ7zGpMQdsFMwH6vwIi9vYazJuP?=
 =?us-ascii?Q?ttGH2LMRKYXHPuRM7XhtiKoOB4ONx+6VUAn0wc3qh01UfrKS7QY6RG7S/Yc2?=
 =?us-ascii?Q?QtsI5kt8cFfdWdJNvLeciO3ChsuRbQ02ZUviNo1ZPiUdV1tZ/GoUkyUkXrAE?=
 =?us-ascii?Q?7dSnUh5VUFuy2v+OpgqvnvzBU2W5sLwq/mSfIh0EConUDxTibZKaF1WPt2l6?=
 =?us-ascii?Q?MoSR16QP+f3BGCesQquO9xZpNiBEuiuBeSILSDMQXpm/ZVzH0E7BPzLdXB+G?=
 =?us-ascii?Q?Qbt5fN4ZOxsuHmSDOKB3e/F5bUu/LC5izjAFpGenjwChp3ZVuXYZ4EpKlrYY?=
 =?us-ascii?Q?s0iUWKa6TPBGkSHqQWdYP12IlCptMGVZRMMLHOX48PNXYq8OyM7lmRoR6AA/?=
 =?us-ascii?Q?3BCFckdqYoQtw0Iv9jN9zJnAI+IELDNi/6VkrMV2/8m4GrkTbEGep3NvBjS3?=
 =?us-ascii?Q?SFAk45smK4Hw9IwIpxwnocrhH3KrbsLVf1KTKVjO9/BZrTRfXzhdY6YP7+LH?=
 =?us-ascii?Q?YmuwvHJCE5xB/rlDrSOxvUtRqt80aPYOPn12fyPay9apyvJ1XDVf1hEfYDQi?=
 =?us-ascii?Q?d8XCNPIKrBCQjfX3AqLO3d49PvlewfDOefXh0MmAojqxoDLdrvnbcpnUnBUU?=
 =?us-ascii?Q?9k7HEyRcqaNYHKwRsOQlDSotLSLllSyACLJW97E2VYDrsWdXNHoQ4hZ2SC2Q?=
 =?us-ascii?Q?5dZsQNDVlcpdP2qtQVGfGXjVnKOJvuTPct4j4SeSSHc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657087b4-e14d-41c2-f44b-08d8bd10bc1d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 06:58:04.9914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOnZrs8wcQWmrKfbhq2kxncGocAAk7G2BsZf5a1eFJ3kd03Ui6TvOomJzmiKvqRqTP257xjQQcX6kI9GDbw5Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2110
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi RP,

On 1/15/21 4:45 PM, Richard Purdie wrote:
> On Fri, 2021-01-15 at 11:23 +0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> When multilib enabled, there comes below error for packages which
>> inherit useradd bbclass randomly when build eSDK.
>>  =C2=A0$ bitbake image-name -c populate_sdk_ext
>>  =C2=A0Exception: subprocess.CalledProcessError: Command '/prj/tmp-glibc=
/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/lib32-recipe-sysroot/=
usr/bin/postinst-useradd-lib32-avahi' returned non-zero exit status 1.
>>  =C2=A0Subprocess output:
>>  =C2=A0/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-=
r5/recipe-sysroot-native/usr/sbin/useradd
>>  =C2=A0Running useradd commands...
>>  =C2=A0NOTE: lib32-avahi: Performing useradd with [--root /prj/tmp-glibc=
/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot --syst=
em --home /run/avahi-daemon                               --no-create-home =
--shell /bin/false                               --user-group avahi]
>>  =C2=A0useradd: Warning: missing or non-executable shell '/bin/false'
>>  =C2=A0abort()ing pseudo client by server request. See https://wiki.yoct=
oproject.org/wiki/Pseudo_Abort for more details on this.
>>  =C2=A0Check logfile: /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux=
-image-std/1.0-r5/pseudo//pseudo.log
>>  =C2=A0ERROR: lib32-avahi: useradd command did not succeed.
>>  =C2=A0ERROR: Logfile of failure stored in: /prj/tmp-glibc/work/intel_x8=
6_64-wrs-linux/wrlinux-image-std/1.0-r5/temp/log.do_sdk_depends.20567
>>
>>  =C2=A0$ cat  /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-s=
td/1.0-r5/pseudo//pseudo.log
>>  =C2=A0[snip]
>>  =C2=A0path mismatch [1 link]: ino 26553244 db '/prj/tmp-glibc/work/inte=
l_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot/etc/group'
>> req '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5=
/recipe-sysroot/etc/group.33605'.
>>  =C2=A0[snip]
>>
>>  =C2=A0Check the PSEUDO_IGNORE_PATHS in [1], the recipe-sysroot part is
>>  =C2=A0/prj/tmp-glibc/work/corei7-32-wrsmllib32-linux/lib32-avahi/0.8-r0=
/recipe-sysroot.
>>
>>  =C2=A0Use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS to guarantee the
>>  =C2=A0recipe-syroot part to be /prj/tmp-glibc/work/intel_x86_64-wrs-lin=
ux/wrlinux-image-std/1.0-r5/recipe-sysroot
>>  =C2=A0to fix the above issue.
>>
>>  =C2=A0[1] /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/=
1.0-r5/lib32-recipe-sysroot/usr/bin/postinst-useradd-lib32-avahi
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>  =C2=A0meta/conf/bitbake.conf | 2 +-
>>  =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 96c1c62b10..1dc08344ca 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -686,7 +686,7 @@ SRC_URI =3D ""
>>  =C2=A0PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
>>  =C2=A0PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
>>  =C2=A0PSEUDO_SYSROOT =3D "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native=
"
>> -PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/r=
ecipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPD=
IR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${=
WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR=
}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_=
DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
>> +PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,/run/,${T},${RECIPE_SYS=
ROOT},${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/ssta=
te-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}=
/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate=
-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${T=
MPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
>=20
> This isn't correct since we're aiming to ignore both WORKDIR/recipe-

Will send out V2 to also ignore ${RECIPE_SYSROOT_NATIVE} altogether.

> sysroot and WORKDIR/recipe-sysroot-native which the above does since
> the paths can be thought of to end with "*".
>=20
> I'm also confused by your mention of corei7-32-wrsmllib32-linux above
> in:
>=20
> /prj/tmp-glibc/work/corei7-32-wrsmllib32-linux/lib32-avahi/0.8-r0/recipe-=
sysroot.
>=20
> since I thought you were working in:
>=20
> /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std
>=20
> ?

Steps to reproduce:
Add below logic to enable multilib and also install some package which=20
inherit useradd bbclass.
require conf/multilib.conf
MULTILIBS ?=3D "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 ?=3D "core2-32"
IMAGE_INSTALL_append +=3D " bind lib32-bind openssh lib32-openssh dhcpcd=20
lib32-dhcpcd postfix lib32-postfix nfs-utils lib32-nfs-utils cronie=20
lib32-cronie dbus lib32-dbus systemd lib32-systemd rpcbind lib32-rpcbind"

And it fails when build extend sdk randomly.
$ bitbake core-image-minimal -c populate_sdk_ext
  Exception: subprocess.CalledProcessError: Command=20
'/prj/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r5/lib32-recipe=
-sysroot/usr/bin/postinst-useradd-lib32-avahi'=20
returned non-zero exit status 1.
 >>   Subprocess output:
 >>=20
/prj/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r5/recipe-sysroo=
t-native/usr/sbin/useradd
 >>   Running useradd commands...
 >>   NOTE: lib32-avahi: Performing useradd with [--root=20
/prj/tmp/qemux86_64-poky-linux/core-image-minimal/1.0-r5/recipe-sysroot=20
--system --home /run/avahi-daemon=20
--no-create-home --shell /bin/false=20
--user-group avahi]
 >>   useradd: Warning: missing or non-executable shell '/bin/false'
 >>   abort()ing pseudo client by server request. See=20
https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
 >>   Check logfile:=20
/prj/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r5/pseudo//pseud=
o.log
 >>   ERROR: lib32-avahi: useradd command did not succeed.
 >>   ERROR: Logfile of failure stored in:=20
/prj/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r5/temp/log.do_s=
dk_depends.30554


Check the PSEUDO_IGNORE_PATHS in=20
/prj/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/lib32-recipe-=
sysroot/usr/bin/postinst-useradd-lib32-avahi,=20
and the recipe sysroot part is=20
/prj/tmp/work/core2-32-pokymllib32-linux/lib32-avahi/0.8-r0/recipe-sysroot.=
=20
And meanwhile check PSEUDO_IGNORE_PATHS in=20
/prj/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/recipe-sysroo=
t/usr/bin/postinst-useradd-avahi,=20
the recipe sysroot part is=20
/prj/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/recipe-sysroo=
t.

So set ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS to fix the recipe=20
sysroot part is incorrect in multilib env.

Thanks,

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
