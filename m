Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB0EC46CD4
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 03:00:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.116709.1703732416187024118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 19:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JZ/HkoYz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=072696740c=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BS2p5KD009822
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 19:00:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=ggeXivVcgjv6EFAcvKSefxLt2ji1eR9O7k3dXna+CJo=; b=
	JZ/HkoYzanpi6DZMd3Xlj71QdEbWPaV1zgr2oEJ8TT6XuoXgNJA1qBWPFPLdimnF
	l4JnWJXvhwPdITERFHfnfKakQ043tm20IvGmfkXbNiY2ICYEJnAfd8cjH90x6sFM
	MZWAlX58/Z7pI7WgUh8VQGPfHkzTCXZHuLiU/taF3jXYpo6pVKX3iR83S00CEU+D
	hVrC9WXRpGK4Ro9N9YpElRHxZzmekDTEijRj1U0gRj00Fd6wq2K9/4V4I6wiDgNc
	eFueseOIowdFn/LQAJogIdkxbGqadLs1zsdHfhMHgWeFeJWv3rp1sYdn6Xc1G0v7
	3MYgN9cvupK3bTWjlVJAfw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5yxm3gcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 19:00:15 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BS30ESc019170;
	Wed, 27 Dec 2023 19:00:14 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5yxm3gcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Dec 2023 19:00:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1b+0935xz2rluOGIr5QDbn1tW/FJ9NvxAWfouyfkNTw+X/L5QSDIzSBwki+oErhcvVmMAy6GjiHNO6+CjqDZF8tTXr197Y0ZRy19p4LsksLiEzJ1hMZh/mS3ua2dS+Np3xtHbqMqJZZGTzxawhTpplssgSz3BM+IdMtVfZS4iorIrk246uHZDagsXPs7/UlJV2y0ZaC27arrC09XEyt349OlUIjGgHVwGUltuNKXR2CUNmqksLy1amvp6YZ7ipI66NIvdoK3C5wT3DnSbWQkybPmgUWnSFYpxw93XvSBJBF0QYXa95L/HEBY1hvviLkc6H2OlGLbnpkUcnymNghEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggeXivVcgjv6EFAcvKSefxLt2ji1eR9O7k3dXna+CJo=;
 b=l8BGF8M2Xfb53gwKZR9rWxK8YQeyMXBX+VUEnZQyaJ+AHHnkMn002kSd6cHKmSI8ePGj51lSSJEFKArcCfzqDl74fAR7YKDvarq+Vt8/Q4l/ZvRXeGIktw+cKtCx1FuusvBb22mz2aD292LAce3RHedQiF+nBWve5OO3K2kaRDFhy9fm+xSTjnq/MHxW/7/KThR2+Q9ZhVEB8DhmdhSVoV+zyRYNhPvRDbB2xQkwvnh+PORIjDzev5FeVDFs5dDc6VSzUVXidRQgOekGxJuoOB1RoDVRPuMjtTOTP32UWR4VRX61mI3+GHGOOeC0bQxh2Z9l4K1uYhPVqr7o8F24UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.24; Thu, 28 Dec
 2023 03:00:09 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.017; Thu, 28 Dec 2023
 03:00:08 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Thread-Topic: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Thread-Index: AQHaOHwUZkl3/dEfCUuIElbTG14Wi7C9B0cAgAD6uAA=
Date: Thu, 28 Dec 2023 03:00:08 +0000
Message-ID: 
 <CO6PR11MB560279EC2354AEBC89D8E15FED9EA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
 <2023122711592084d34620@mail.local>
In-Reply-To: <2023122711592084d34620@mail.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|PH8PR11MB6729:EE_
x-ms-office365-filtering-correlation-id: cb73e842-e45a-4aff-bd0f-08dc0751197b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 asaOEUUYjWIaVElJqwysvjx2CXWJVUzU1oKREHMYf0zjWNC89lxTmaK+e2seWBmPnQkRrPC7Wj2MEPF1Rhvh7d1I6W/MRZEVGqp0e47QfO34L/c9EtSCfYe+ydgXI+7cbixf5lLW6kuVrnjyaWm/xRu1P00QrpB9Fho3SHlBv3ZXw85NXBQ8c9BiimjyKHukWV5EvoFI+jC9Os6zuuGFgy7mqU61FtKjiyaof6a4QYXD0hxtk1973IwGTaomJX2Nku+FI6Wb6ot+h+PbJt8+suHZuswYe12ooD3d6PjfHfPJfoMumEuLM9AUWMXb87Tlc/jM4PxwcKF6kBfttcLueL4NdZYAX8iegZeMdd8STlog4qFixK0GjIAo8QafQ7EUw0P0SPD2E1y0hsoGGl/fkC78vG/SORrHUz0Y2WcaPOlY8822EnvAEgc3XPhkJ6MBL4QIMEkLzeQsmi1B21UctzhbsZYNPqHVp1gBLrEzpCC2UcoXhZspuOG9p2iwDTeJLimQHLAv4Mx17/5IKzGUp58VzbzmtNOHJUBuKB/WP5WHm8ax5DzcqvFDfDxxrKY/aP/xQ5i5GPtWPNBAplD+J0cPa26Wsq7Oph8tw48YPRaZwkiqnijxdH69RVTEmX6k2VXY6dr1RwvuEFZo/CFag704voRMAT16iT4/FZA9uW9ZZD6NWEcovBgzKeOklRX9xBHCU4BPJgZ/BcsWwL6k+w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39850400004)(230273577357003)(230173577357003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(55016003)(38070700009)(66899024)(26005)(9686003)(7696005)(6506007)(53546011)(30864003)(8676002)(8936002)(5660300002)(66446008)(76116006)(66946007)(4326008)(64756008)(316002)(478600001)(66476007)(71200400001)(66556008)(2906002)(6916009)(38100700002)(122000001)(966005)(86362001)(52536014)(33656002)(41300700001)(83380400001)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bfdWmoPgtNI7nBGVMMhQs8zL6FFQQhiHglCCoc0k4H6rMCT4SLhV6Aq/8it9?=
 =?us-ascii?Q?/LyEdX+HTYLC1zOGqC9+URXVnZ/deQmcyVWW5/4eW/LAUXhzVWt5XflUtwHX?=
 =?us-ascii?Q?2K/+xCaR1DHoUfHia47eerdvPBqhFtpphAcPekpJh/ooF1fBhH7ScqJpmuq1?=
 =?us-ascii?Q?/HFi/Pqr2jCHfvqrtPJ7H2YOMCI0P94x75nIewwTajEWuxuMleFA3ObXmIfa?=
 =?us-ascii?Q?FtKVJiJvWGIBP5StPSBpPTdxlHlImpNIlVk/GTzgLrF5n0kRb6rsdTuDyEQY?=
 =?us-ascii?Q?Spqb5XgIjMIU/UdrKsviZYSERRHJqvaQOLpfcBbicRoa94njOJqDiYoY8ftA?=
 =?us-ascii?Q?nhSjFtz1vt3MsZ5tSUuQlBht/VH4ogmAdtelfZysNELaHWylWWmK7iAeZoYa?=
 =?us-ascii?Q?XdY+v4KrTJIzWaI19q8lb03iNda0OPWqt5wLg3IPBbydKENdY8+8rnsjuGOA?=
 =?us-ascii?Q?8XQbfB7XScFjsfG5mt9mSisS7NmHm1NAzZICJGcVwf5Danf2mhNcyYrWYpCw?=
 =?us-ascii?Q?7vAfiqFDjTWeY5OUCwzbCui/AQsm57cKdeKijOZrsm1f9keO1kYKyxVZ6SLS?=
 =?us-ascii?Q?BjD/v9JKLsQzOdNXj5kiVe1whcAcxRRUx3C4JGuKklEpoXTIPx7+gXDqKYU5?=
 =?us-ascii?Q?874eALhXJsDdQXmbQs2F9HsYDO8BrzekgVzoJVkwoPekYZOGt2XoKCLfkI6+?=
 =?us-ascii?Q?5CsChiKYRjkjXtuvkWI5Au+T/jVY4wOFysCxJLBbH071W7QUeZufBpYkruQ/?=
 =?us-ascii?Q?yBbhx6VWuaUapZ7bR/BIlbqPs4fD8iJl9SBXGb3/pal7Bw4Gxr3qpElVYQEb?=
 =?us-ascii?Q?3DqIoz2kImGBDNfEB2mLUTIBe+Vto6f9HXt4bcCHZCmiMCWDOe5FAC4jUfqU?=
 =?us-ascii?Q?Buh/hE0BMib8KxsF8ixCKj6gYlis1cmqmyNIJ9fDGFrcWFBqRfhI/4LVOetv?=
 =?us-ascii?Q?oaGU+fCZsiUl/X40YqdTkiJQBh+r6kLyNNLBuux/GMyGKME+2+qHs83ZHEv+?=
 =?us-ascii?Q?tkal/knQ9ZnQYXXTTD+ekK2AgzqC7e0qhDuQ+dhdtRjLq/oElGo6QWPO5LZo?=
 =?us-ascii?Q?KpR4IzrICZ2Ye6MK1Ibp1ThKAGCHhd0AhggFo/lH9i94lTiJb8hkzSqp/g+B?=
 =?us-ascii?Q?tvr4+oIaq8S1rgg5hc7nxMMYjAYPA006MW/mr+2MQYFYjbvavANPYE/9GHap?=
 =?us-ascii?Q?Vo9grnVaI6ovUvpR3npp4ZaOVLl2BNNkVQPqCoUCIWQJLuBilB29+1pHX57n?=
 =?us-ascii?Q?nWLpqhpb4qrsDFY7Wal7pv3vds16bSoVVX8nkSdJ0FV1LhBvCw/kqDyFXl3B?=
 =?us-ascii?Q?7uhWAvXi+jrWxgR0QlMVLrgdDL3TGFJ37Z8tfOi2WWO9fylhrfVvEJnjGqsc?=
 =?us-ascii?Q?ysT1VjsKXYAx9nClPqAiPMCWhh/NfjG72LS0e6MonO5P/1VPxqEED2U7Y0xm?=
 =?us-ascii?Q?u8fLOT2GVcLmyyLY2y8gQzxoQsfNxgtuMGKwMy6TW1LqPKStVbXaNnTwzQ6F?=
 =?us-ascii?Q?8SW6TETDw2JaV/5Qob7Ki1t7wxdnlVKV3qqRX/dFsp82y+DQn0vhmGudKZTk?=
 =?us-ascii?Q?LfN6QCE8Znl6wKkpxCKqYKwPYylCDCaI56t+e4Sa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb73e842-e45a-4aff-bd0f-08dc0751197b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2023 03:00:08.0690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ss9WIGn4aNqiEtk29ONDZ/niaL7/uzeR5lmWlyH03WQnLSyuIAPyETRSXajm1Il+m9SsfH8rse6AYGE5i51dLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
X-Proofpoint-GUID: yG1wgzmGVE4n3WjFjo_P6c09GlVUvfYm
X-Proofpoint-ORIG-GUID: Vfon3j2fHlrYEbMNpmlDoUOTcwKJ9rmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312280022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 03:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192970

I double checked it in my environment, setting INIT_MANAGER to "systemd" an=
d then 'bitbake systemd' will not generate this warning. In this case ROOT_=
HOME's value is "/root".
I checked https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds=
/8354, but I couldn't find the configuration items that set the init manage=
r to systemd.
Does the build use the variable 'INIT_MANAGER'? Does it set ROOT_HOME to "/=
home/root" somewhere?

Regards,
Qi

-----Original Message-----
From: Alexandre Belloni <alexandre.belloni@bootlin.com>=20
Sent: Wednesday, December 27, 2023 7:59 PM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1

We hit the added warning on the autobuilders:

WARNING: systemd-1_255.1-r0 do_install: Using /home/root as root user's hom=
e directory is not fully supported by systemd

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8354/step=
s/14/logs/warnings

On 27/12/2023 12:20:34+0800, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> 1. Patch changes:
>=20
> 0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> is removed because it has no real effect now. The /lib is now /usr/lib=20
> because 'usrmerge' is a required distro feature for systemd.
>=20
> 0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch is=20
> refreshed for the new version to avoid patch-fuzz issue.
>=20
> 2. root user's home directory now defaults to "/root":
>=20
> The sysuers.d/basic.conf is still modified to respect the ROOT_HOME=20
> value, so if users set ROOT_HOME to "/home/root", the behavior is the=20
> same as before. However, this is only for backward compatibility. With=20
> this patch, The ROOT_HOME value is set to "/root" in init-manager-systemd=
.inc.
> This is because systemd's source codes are hardcoding "/root", and=20
> other values are not officially supported. See the list below.
> $ grep -rl '"/root"' src/ | grep -v 'src/test'
> src/core/namespace.c
> src/basic/user-util.c
> src/nss-systemd/nss-systemd.c
> src/nspawn/nspawn.c
> src/firstboot/firstboot.c
> src/shared/userdb.c
> src/shared/user-record.c
> $ grep -rl /root network/ factory/ sysctl.d/ sysusers.d/ rules.d/=20
> tmpfiles.d/ units/ xorg/ tools/ sysusers.d/basic.conf.in=20
> tmpfiles.d/provision.conf units/emergency.service.in=20
> units/rescue.service.in tools/list-discoverable-partitions.py
> Previously, the recipe was just substituting sysusers.d/basic.conf.in,=20
> which is not enough to be treated as 'fully support'. I deliberately=20
> put a warning message in do_install to warn users about non "/root"=20
> ROOT_HOME value. Don't remove it until all above places are handled.
>=20
> 3. cgroupv2 is now the default.
> cgroupv2 is the default for systemd for many years and it's the=20
> default for distros such as ubuntu and fedora. Let's also use it as the d=
efault.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../distro/include/init-manager-systemd.inc   |  2 +
>  meta/recipes-core/systemd/systemd.inc         |  4 +-
>  ...tall-dependency-links-at-install-tim.patch | 22 +++--- =20
> ...sysctl.d-binfmt.d-modules-load.d-to-.patch | 73 -------------------
>  .../systemd/systemd/basic.conf.in             | 40 ----------
>  .../{systemd_254.4.bb =3D> systemd_255.1.bb}    | 16 ++--
>  6 files changed, 25 insertions(+), 132 deletions(-)  delete mode=20
> 100644=20
> meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt
> .d-modules-load.d-to-.patch  delete mode 100644=20
> meta/recipes-core/systemd/systemd/basic.conf.in
>  rename meta/recipes-core/systemd/{systemd_254.4.bb =3D>=20
> systemd_255.1.bb} (98%)
>=20
> diff --git a/meta/conf/distro/include/init-manager-systemd.inc=20
> b/meta/conf/distro/include/init-manager-systemd.inc
> index 595d1f2644..0a76647459 100644
> --- a/meta/conf/distro/include/init-manager-systemd.inc
> +++ b/meta/conf/distro/include/init-manager-systemd.inc
> @@ -5,3 +5,5 @@ VIRTUAL-RUNTIME_init_manager ??=3D "systemd"
>  VIRTUAL-RUNTIME_initscripts ??=3D "systemd-compat-units"
>  VIRTUAL-RUNTIME_login_manager ??=3D "shadow-base"
>  VIRTUAL-RUNTIME_dev_manager ??=3D "systemd"
> +# systemd hardcodes /root in its source codes, other values are not=20
> +offically supported ROOT_HOME ?=3D "/root"
> diff --git a/meta/recipes-core/systemd/systemd.inc=20
> b/meta/recipes-core/systemd/systemd.inc
> index ccc3236457..1417e0150f 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -15,8 +15,8 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
>                      file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"
> =20
> -SRCREV =3D "2e7504449a51fb38db9cd2da391c6434f82def51"
> -SRCBRANCH =3D "v254-stable"
> +SRCREV =3D "2018ccef6645ce00c784369a22dc4e98f6d7061d"
> +SRCBRANCH =3D "v255-stable"
>  SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH}"
> =20
>  S =3D "${WORKDIR}/git"
> diff --git=20
> a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependen
> cy-links-at-install-tim.patch=20
> b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependen
> cy-links-at-install-tim.patch
> index 085f1e9052..be231cf6b2 100644
> ---=20
> a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependen
> cy-links-at-install-tim.patch
> +++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depe
> +++ ndency-links-at-install-tim.patch
> @@ -1,8 +1,8 @@
> -From ca7d9a8d9c81702af9c599bb79706f12b1a465cf Mon Sep 17 00:00:00=20
> 2001
> +From 29a58009a172e369ad7166e16dab2f4945c6b0d2 Mon Sep 17 00:00:00=20
> +2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Thu, 21 Feb 2019 16:23:24 +0800
> -Subject: [PATCH] binfmt: Don't install dependency links at install=20
> time for
> - the binfmt services
> +Subject: [PATCH 1/2] binfmt: Don't install dependency links at=20
> +install time  for the binfmt services
> =20
>  use [Install] blocks so that they get created when the service is=20
> enabled  like a traditional service.
> @@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
>   3 files changed, 7 insertions(+), 2 deletions(-)
> =20
>  diff --git a/units/meson.build b/units/meson.build -index=20
> c7939a10f8..219570ab19 100644
> +index e7bfb7f838..1d5ec4b178 100644
>  --- a/units/meson.build
>  +++ b/units/meson.build
> -@@ -149,7 +149,6 @@ units =3D [
> +@@ -154,7 +154,6 @@ units =3D [
>           {
>             'file' : 'proc-sys-fs-binfmt_misc.automount',
>             'conditions' : ['ENABLE_BINFMT'], @@ -36,7 +36,7 @@ index=20
> c7939a10f8..219570ab19 100644
>           },
>           {
>             'file' : 'proc-sys-fs-binfmt_misc.mount', -@@ -246,7=20
> +245,6 @@ units =3D [
> +@@ -251,7 +250,6 @@ units =3D [
>           {
>             'file' : 'systemd-binfmt.service.in',
>             'conditions' : ['ENABLE_BINFMT'], @@ -45,7 +45,7 @@ index=20
> c7939a10f8..219570ab19 100644
>           {
>             'file' : 'systemd-bless-boot.service.in',  diff --git=20
> a/units/proc-sys-fs-binfmt_misc.automount=20
> b/units/proc-sys-fs-binfmt_misc.automount
> -index 6b1bbdc91e..5ec5b8670a 100644
> +index 5d212015a5..6c2900ca77 100644
>  --- a/units/proc-sys-fs-binfmt_misc.automount
>  +++ b/units/proc-sys-fs-binfmt_misc.automount
>  @@ -22,3 +22,6 @@ Before=3Dshutdown.target @@ -56,7 +56,7 @@ index=20
> 6b1bbdc91e..5ec5b8670a 100644  +[Install]  +WantedBy=3Dsysinit.target =20
> diff --git a/units/systemd-binfmt.service.in=20
> b/units/systemd-binfmt.service.in -index b04412e037..63f116e4fa 100644
> +index 6861c76674..531e9fbd90 100644
>  --- a/units/systemd-binfmt.service.in  +++=20
> b/units/systemd-binfmt.service.in  @@ -14,6 +14,7 @@=20
> Documentation=3Dhttps://docs.kernel.org/admin-guide/binfmt-misc.html
> @@ -68,12 +68,12 @@ index b04412e037..63f116e4fa 100644
>   After=3Dproc-sys-fs-binfmt_misc.mount
>   After=3Dlocal-fs.target
>  @@ -31,3 +32,6 @@ RemainAfterExit=3Dyes
> - ExecStart=3D{{ROOTLIBEXECDIR}}/systemd-binfmt
> - ExecStop=3D{{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
> + ExecStart=3D{{LIBEXECDIR}}/systemd-binfmt
> + ExecStop=3D{{LIBEXECDIR}}/systemd-binfmt --unregister
>   TimeoutSec=3D90s
>  +
>  +[Install]
>  +WantedBy=3Dsysinit.target
>  --
> -2.39.2
> +2.34.1
> =20
> diff --git=20
> a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binf
> mt.d-modules-load.d-to-.patch=20
> b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binf
> mt.d-modules-load.d-to-.patch
> deleted file mode 100644
> index 98914ae154..0000000000
> ---=20
> a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binf
> mt.d-modules-load.d-to-.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From f75f03ef6bc3554068e456bed227f333d5cb8c34 Mon Sep 17 00:00:00=20
> 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 29 Sep 2020 18:01:41 -0700
> -Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to=20
> /usr
> -
> -These directories are moved to /lib since systemd v246, commit=20
> -4a56315a990b ("path: use ROOTPREFIX properly"), but in oe-core/yocto,=20
> -the old /usr/lib is still being used.
> -
> -Upstream-Status: Inappropriate (OE-specific)
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> ----
> - src/core/systemd.pc.in           | 8 ++++----
> - src/libsystemd/sd-path/sd-path.c | 8 ++++----
> - 2 files changed, 8 insertions(+), 8 deletions(-)
> -
> -diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in -index=20
> 693433b34b..8368a3ff02 100644
> ---- a/src/core/systemd.pc.in
> -+++ b/src/core/systemd.pc.in
> -@@ -67,16 +67,16 @@ tmpfilesdir=3D${tmpfiles_dir}
> -
> - user_tmpfiles_dir=3D${prefix}/share/user-tmpfiles.d
> -
> --sysusers_dir=3D${rootprefix}/lib/sysusers.d
> -+sysusers_dir=3D${prefix}/lib/sysusers.d
> - sysusersdir=3D${sysusers_dir}
> -
> --sysctl_dir=3D${rootprefix}/lib/sysctl.d
> -+sysctl_dir=3D${prefix}/lib/sysctl.d
> - sysctldir=3D${sysctl_dir}
> -
> --binfmt_dir=3D${rootprefix}/lib/binfmt.d
> -+binfmt_dir=3D${prefix}/lib/binfmt.d
> - binfmtdir=3D${binfmt_dir}
> -
> --modules_load_dir=3D${rootprefix}/lib/modules-load.d
> -+modules_load_dir=3D${prefix}/lib/modules-load.d
> - modulesloaddir=3D${modules_load_dir}
> -
> - catalog_dir=3D${prefix}/lib/systemd/catalog
> -diff --git a/src/libsystemd/sd-path/sd-path.c=20
> b/src/libsystemd/sd-path/sd-path.c
> -index 1af3a36d1d..def502b717 100644
> ---- a/src/libsystemd/sd-path/sd-path.c
> -+++ b/src/libsystemd/sd-path/sd-path.c
> -@@ -365,19 +365,19 @@ static int get_path(uint64_t type, char **buffer, =
const char **ret) {
> -                 return 0;
> -=20
> -         case SD_PATH_SYSUSERS:
> --                *ret =3D ROOTPREFIX_NOSLASH "/lib/sysusers.d";
> -+                *ret =3D "/usr/lib/sysusers.d";
> -                 return 0;
> -=20
> -         case SD_PATH_SYSCTL:
> --                *ret =3D ROOTPREFIX_NOSLASH "/lib/sysctl.d";
> -+                *ret =3D "/usr/lib/sysctl.d";
> -                 return 0;
> -=20
> -         case SD_PATH_BINFMT:
> --                *ret =3D ROOTPREFIX_NOSLASH "/lib/binfmt.d";
> -+                *ret =3D "/usr/lib/binfmt.d";
> -                 return 0;
> -=20
> -         case SD_PATH_MODULES_LOAD:
> --                *ret =3D ROOTPREFIX_NOSLASH "/lib/modules-load.d";
> -+                *ret =3D "/usr/lib/modules-load.d";
> -                 return 0;
> -=20
> -         case SD_PATH_CATALOG:
> ---
> -2.39.2
> -
> diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in=20
> b/meta/recipes-core/systemd/systemd/basic.conf.in
> deleted file mode 100644
> index fac288f7fa..0000000000
> --- a/meta/recipes-core/systemd/systemd/basic.conf.in
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -#  This file is part of systemd.
> -#
> -#  systemd is free software; you can redistribute it and/or modify it=20
> -#  under the terms of the GNU Lesser General Public License as=20
> published by -#  the Free Software Foundation; either version 2.1 of=20
> the License, or -#  (at your option) any later version.
> -
> -# The superuser
> -u root    0     "root" :ROOT_HOME:
> -
> -# The nobody user/group for NFS file systems
> -g {{NOBODY_GROUP_NAME}} 65534       -            -
> -u {{NOBODY_USER_NAME }} 65534:65534 "Nobody"     -
> -
> -# Administrator group: can *see* more than normal users
> -g adm     {{ADM_GID    }}     -            -
> -
> -# Administrator group: can *do* more than normal users
> -g wheel   {{WHEEL_GID  }}     -            -
> -
> -# Access to shared database of users on the system
> -g utmp    {{UTMP_GID   }}     -            -
> -
> -# Physical and virtual hardware access groups
> -g audio   {{AUDIO_GID  }}     -            -
> -g cdrom   {{CDROM_GID  }}     -            -
> -g dialout {{DIALOUT_GID}}     -            -
> -g disk    {{DISK_GID   }}     -            -
> -g input   {{INPUT_GID  }}     -            -
> -g kmem    {{KMEM_GID   }}     -            -
> -g kvm     {{KVM_GID    }}     -            -
> -g lp      {{LP_GID     }}     -            -
> -g render  {{RENDER_GID }}     -            -
> -g sgx     {{SGX_GID    }}     -            -
> -g tape    {{TAPE_GID   }}     -            -
> -g tty     {{TTY_GID    }}     -            -
> -g video   {{VIDEO_GID  }}     -            -
> -
> -# Default group for normal users
> -g users   {{USERS_GID  }}     -            -
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb=20
> b/meta/recipes-core/systemd/systemd_255.1.bb
> similarity index 98%
> rename from meta/recipes-core/systemd/systemd_254.4.bb
> rename to meta/recipes-core/systemd/systemd_255.1.bb
> index 0c12926bef..daa3a01fef 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
> @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES +=3D "systemd"
>  SRC_URI +=3D " \
>             file://touchscreen.rules \
>             file://00-create-volatile.conf \
> -           file://basic.conf.in \
>             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallb=
ack', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
>             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallb=
ack', 'file://00-hostnamed-network-user.conf', '', d)} \
>             file://init \
> @@ -29,7 +28,6 @@ SRC_URI +=3D " \
>             file://systemd-pager.sh \
>             file://0002-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0008-implment-systemd-sysv-install-for-OE.patch \
> -           file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-=
to-.patch \
>             "
> =20
>  # patches needed by musl
> @@ -73,6 +71,7 @@ PACKAGECONFIG ??=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-s=
hared', d)} \
>      backlight \
>      binfmt \
> +    cgroupv2 \
>      gshadow \
>      hibernate \
>      hostnamed \
> @@ -266,12 +265,16 @@ EXTRA_OEMESON +=3D "-Dkexec-path=3D${sbindir}/kexec=
=20
> \  # The 60 seconds is watchdog's default vaule.
>  WATCHDOG_TIMEOUT ??=3D "60"
> =20
> -do_configure:prepend() {
> -  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in >=20
> ${S}/sysusers.d/basic.conf.in -}
> -
>  do_install() {
>  	meson_do_install
> +	# Change the root user's home directory in /lib/sysusers.d/basic.conf.
> +	# This is done merely for backward compatibility with previous systemd =
recipes.
> +	# systemd hardcodes root user's HOME to be "/root". Changing to use oth=
er values
> +	# may have unexpected runtime behaviors.
> +	if [ "${ROOT_HOME}" !=3D "/root" ]; then
> +		bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully =
supported by systemd"
> +		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/b=
asic.conf
> +	fi
>  	install -d ${D}/${base_sbindir}
>  	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'fal=
se', 'true', d)}; then
>  		# Provided by a separate recipe
> @@ -754,6 +757,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
>                 ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules =
\
>                =20
> ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
> +              =20
> + ${rootlibexecdir}/udev/rules.d/60-persistent-storage-mtd.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape=
.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-sensor.rules \
> --
> 2.34.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192923): https://lists.openembedded.org/g/openembedde=
d-core/message/192923
> Mute This Topic: https://lists.openembedded.org/mt/103380516/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

