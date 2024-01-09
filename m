Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB2AC47073
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 08:14:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12342.1704788094597750124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 00:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jDh/07uT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=173861e99f=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4097DVWI007346
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jan 2024 00:14:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=kmEhUilf74tSVQS2bCg61v7HbUH0udpyhGuwRPrOl/Q=; b=
	jDh/07uTtVIsMQFDTpIojXvrOKDi+riyZa3Ha+jVcFay0THaRDmiZnykGLAsTM8q
	7umxFQR06q/fUzf+hZOrkBB71rKiQxxD9u7OOpCVrj8li1/LdtMQ3lMW3Zs4jvqN
	VGl+GYZloJ8RHH2okctdzNtnI+6vfBdy+FLnOlsh/JHBXwkCMbmcJ+8yRSjrSIqv
	hcGQL+GcYEiRiZGFYRyCHz8ilK7cdfRBp01QcCrzsC8uBFtNl7Khfk0MJGCw0vE0
	2FqRx6kCI4R0GkyTxW1FbPR+5L+s54zRaG0LLeSW2/MNI6Dv0pmD4LY3BogjyiqK
	aBpaW0NuefrRvl10f5QdQQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vf313jsuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 00:14:53 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4098ErjH009770;
	Tue, 9 Jan 2024 00:14:53 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vf313jsuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 00:14:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIucj9Jvsjc+Pu57sw+6dSFXNV9FuX7wn1yeyta7rZUzwXgZ659asVa230tgAL5DPLTMKGEVQBkWJqpN7emLbjPhhhath1Bw+iBvP4kWOqItT8BEz1oxEATO7ELdiYjhmbKVtBUzYqYNBu0GCE9hUBjeC0QlMVl9NHRjyZ49KeSA15c5jRIjWVDeMZKg9pqTS0rzY4oW1DWGQHTNzLhSN4DnEHEWpxb7BWXQ7uTPtUz6vhBJDhXwy3de83me/ZFcnYqqv/R0oW9r0GDRoYLxiPWlcyow+K7gkLs/GdM1fM4qw1uotj3us7o4KMBQ31lYE4lucIuwXYhs1ukdr2L29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmEhUilf74tSVQS2bCg61v7HbUH0udpyhGuwRPrOl/Q=;
 b=UpfXYGQG4IHSnwmpxaQi6OxzH7Bo7+prKSD1uDrPwHTdIEVaI/HoVw/MCk4L5tFpkE4NcCk12T/LXauMlPyXcfQVkxRGO3mgL3qPxCW9nBfMF1HyTPAplPHfz4lpHNUfbIqPVYNmMZuECLaYvhxaGXXhzoNMuk6cux/JQiWveixOSHa+5XM5nTE3e3sE1rZiL4QENZhNwbo4yCx72DvAVCb/F6e2YtWiPkuoRcRooGgsO3PKv5htp+gGEjdNfo9QM2MfJ6vYIwkrD+Dg1i/M7hzgQiW/MsxU3QnEuA50qhjRcsZcBkBIrfUHWkT82lgPqzy8LgjySzOjdqw9WQPppQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.21; Tue, 9 Jan 2024 08:14:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 08:14:50 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Thread-Topic: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Thread-Index: AQHaOHwUZkl3/dEfCUuIElbTG14Wi7DLb+4AgAMD2ICAArtgAIAAB5Ew
Date: Tue, 9 Jan 2024 08:14:50 +0000
Message-ID: 
 <CO6PR11MB560274D069FE5857D78E0F79ED6A2@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
 <2024010516013267114873@mail.local>
 <PH0PR11MB561163509353E4D92EA5F47FED642@PH0PR11MB5611.namprd11.prod.outlook.com>
 <2024010907471455b45bc8@mail.local>
In-Reply-To: <2024010907471455b45bc8@mail.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DS0PR11MB7904:EE_
x-ms-office365-filtering-correlation-id: 422d7514-c79c-41ef-9055-08dc10eb0d51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NOAaVeSuRbg76S64OwZGJXEO8woIWwK9dwSoBcA09gwgrOFYns/RqcjakHE8MuD+NqjoRyPNA1v3JEWcNo2NevwT6x41tTIrX0SsrUDdod5QxvrNpH9PdrPWObh+blqvQzNA4tGUTRKg4sBO4mCzD3hkUfzgR3L59RLdbSeuOWaMcsWlYipTHYWy8AEO/Dk896rhwpZtP20Lyj34dZc4/83+a45rw5XnFHMFI0Qpj/7PNeSOfAaNv0/URBnNK+1ITF2b21zf310O6wM9HwbTXGm0B5H47c2OvUs79GZCBkKilyxGvq+aLY5GnCcKMHRXYm59ajGQ1n1Iyrl0+Xc/9I9CnGeplxDW2uBv6ytbZBQNJ5n7uUpk5cKclTmLfbnA3vd9MmJDeXLng37rX4EhImLUUBp13ikDFEECpDjGPNEr3c5r5Jobg51jEUevpgbkID1tCjftQmf9e9cyUXxla8/VwEueN5yXnC+pEC6V4Jpjy05H2oVOp7+Qi6P5q2yygT89ljyfprZbyicJKrZmRQZ5/0uyLjbVXSvIbEj5hDjDb/O2HWCghZxdTcpuLH8tgtRke4Gd4BT2ubPpC8N1lwtDMWu6zrVCbQ9Ks1J92SxJoZCSFNgGylPMugI3fmzaRs508cKg0USqS4+Kjg8+pnAp7XwUZKrhywP0HNPGpPk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39850400004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(1800799012)(186009)(55016003)(66899024)(53546011)(9686003)(26005)(38100700002)(6506007)(7696005)(71200400001)(966005)(478600001)(122000001)(41300700001)(33656002)(86362001)(2906002)(5660300002)(4326008)(30864003)(83380400001)(64756008)(66556008)(66946007)(38070700009)(6916009)(66446008)(8676002)(316002)(76116006)(52536014)(66476007)(8936002)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Sh40G/UrXIt0PJza3czRm1Sj8fArxs0Ef+K1B/9Fjd/XaGIjrmW6WYYs7i/j?=
 =?us-ascii?Q?rrgl34HFOU2Ck7q8e/1sW0mKvmHJDx5ahJ0RN5EDpmEwkznnIXYxdRhUSbf4?=
 =?us-ascii?Q?Fnbp3XyK/8Wmo4Yxp1sTx5iGfx3f8aeidUrR+o7yS4aysqAjPj2qfbh3STBG?=
 =?us-ascii?Q?wnRJ6USifqPpOvDUKlGmd2E7uZKt/+n+KxHgADXO2kY2MXUCvhmOZgRvFW4H?=
 =?us-ascii?Q?1vxvL53iGDJSoQjq3utb+E6XgCj/yMAGkJjqG7RylZCmWq1WHpfObxhXFQ2W?=
 =?us-ascii?Q?FokbZPjtkztwSjv0ywQ/fQxkm3tc9wQygvnCcqyn257Ooqdne+dfItJjJDIc?=
 =?us-ascii?Q?qg2+3cvVT6XhFhIrclxQ+hglnIAkhmeswn7ZqBtnVy7AXBT6ZhLW0s6IuTRD?=
 =?us-ascii?Q?Q31p9McJIzmk5Wyp4o0EudCKWtcdQhhTqmekVimvayhW0L+0OW0ez5pao0V8?=
 =?us-ascii?Q?K548+HXedbTWSoctnG0scVcP2wGm3LDg0mR+ToyHRW2MWi/APxqAMqDw5lTK?=
 =?us-ascii?Q?sHNsBO61yIvD47micNn3IbyBMf66jnVdd4leMJUcZEX8LPv7CBrqhgz6zGHc?=
 =?us-ascii?Q?B4oLyx67r/LCsgVlPkkcPOdRIMDUS2nsNhg0FNeH+Y0r9TVssDtRZg5bvc6G?=
 =?us-ascii?Q?VVgUqjygb20jxjV+3VZOhLGvhd4x5SxGbFhFMIzvnw9+uq0iIcDrscRm92mQ?=
 =?us-ascii?Q?2Ic61tXo/h7ElAroq5dUdbHdGi8d/RB7YXycT+IW+Rc73vU22yO3+Mx5TLOR?=
 =?us-ascii?Q?yRZgtXDEf374iZpLtWmqFk/xmm31nBc2aOvgIcqfkUOOy6SJCJgOfXR2NLLj?=
 =?us-ascii?Q?pYQysB6No96sYDbMxUSdLYihRCPmaV9eFN6QPU//AcOcLJTZjgfsE/PuPRW8?=
 =?us-ascii?Q?ClGo5A5AgWXF/M0VYQryGTKldrO8TKJPX3htPMrCz3QsO9mzCivCVX4hlyG3?=
 =?us-ascii?Q?w1+9WoZUtS8OXNwILVGy7XWatabwlkgt1udsfKS1K14z5g0Y4ZGHso16n/It?=
 =?us-ascii?Q?S+5vv9pmiHy45T54OCXLpEcKsQ1Jim+DH7PQY7vTTBgbnSuGbFFOPSsKDWJd?=
 =?us-ascii?Q?wkzy9zuJeEZhUkn9ulsoX9YRWNV8O3/cTm/vFrA7jh0Kg1i4MQCtGlA9emGL?=
 =?us-ascii?Q?PWVVyjOWesu61Av9Q+sxMG48kShBb5CgcFaDhs7wG3x+lfRbZ+zehY3ZFptB?=
 =?us-ascii?Q?yWV1CHFm7UuFrbUHdM/2O9elwpkho+qXNDr1Axxs1TseUv/ngT3wSuw5NWg/?=
 =?us-ascii?Q?Bp9IT/A9T96vo2hUXRZks/93oBConI4rKArbqC5ZtJ4BEVxHS6ELyHWBp4BW?=
 =?us-ascii?Q?SMFBvqLSINSbFY+eUe70wQYQ3a9ljcuXz+3uFXtORVapjEfD9DoWd35IkqvK?=
 =?us-ascii?Q?USu0JJNF8mwKNPVii9jaEo5RlpOWkuhYq+8zm1986y2aHxOJnFJozosviYsV?=
 =?us-ascii?Q?Gg0Y9EcKz5aRkBURHtq/GAf4YV/iIvEwkY3LfB+T/pxkvQtrK+L/CK/nm9nu?=
 =?us-ascii?Q?uIELAkmFu/BkZNVcTNMvLAjRHo5wPdGebF9Q30CPkiKmI6GR7oUnbS92wI+W?=
 =?us-ascii?Q?8YpNYPM+OEL8RL99WO/qPJMQFMgY2hxzKdIhSiUB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422d7514-c79c-41ef-9055-08dc10eb0d51
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 08:14:50.6017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4l7UxXb4VCewl12OEk2MmKhtduNKZ4yWAyBlCWXa+KLMAbnaTv9+Eo/XaiLmUvcHBkBvrywGQVERO1PNZb8/6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7904
X-Proofpoint-ORIG-GUID: MupxCnrSngWi88GRsDmprk46pdjiyqqF
X-Proofpoint-GUID: YsneLfyoSwT9KAsGn-MzeCGl7oQUVNoc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401090063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 08:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193446

I just sent out a patch for the yocto-autobuilder-helper repo to use '/root=
' as the ROOT_HOME's value in case of 'sysvinit with systemd'.

Regards,
Qi

-----Original Message-----
From: Alexandre Belloni <alexandre.belloni@bootlin.com>=20
Sent: Tuesday, January 9, 2024 3:47 PM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1

I got this today:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8420/step=
s/25/logs/stdio

WARNING: systemd-1_255.1-r0 do_install: Using /home/root as root user's hom=
e directory is not fully supported by systemd

On 07/01/2024 14:05:35+0000, Chen Qi via lists.openembedded.org wrote:
> Another patch in this series fixes the warning:
> rootfs-postcommands.bbclass: ignore comment mismatch in=20
> systemd_user_check
>=20
> Is that patch also staged?
>=20
> Regards,
> Qi
>=20
> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Saturday, January 6, 2024 12:02 AM
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
>=20
> Hello,
>=20
> This fails with:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/736
> 1/steps/12/logs/warnings
>=20
> WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: User root has been=20
> defined as (root, 0, 0, root, /root, /bin/sh) but sysusers.d expects=20
> it as (root, 0, 0, Super User, /root, -)
> WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: User nobody has=20
> been defined as (nobody, 65534, 65534, nobody, /nonexistent,=20
> /usr/sbin/nologin) but sysusers.d expects it as (nobody, 65534, 65534,=20
> Kernel Overflow User, -, -)
> WARNING: core-image-sato-1.0-r0 do_rootfs: User root has been defined=20
> as (root, 0, 0, root, /root, /bin/sh) but sysusers.d expects it as=20
> (root, 0, 0, Super User, /root, -)
> WARNING: core-image-sato-1.0-r0 do_rootfs: User nobody has been=20
> defined as (nobody, 65534, 65534, nobody, /nonexistent,=20
> /usr/sbin/nologin) but sysusers.d expects it as (nobody, 65534, 65534,=20
> Kernel Overflow User, -, -)
> WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: User root has been=20
> defined as (root, 0, 0, root, /root, /bin/sh) but sysusers.d expects=20
> it as (root, 0, 0, Super User, /root, -)
> WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: User nobody has been=20
> defined as (nobody, 65534, 65534, nobody, /nonexistent,=20
> /usr/sbin/nologin) but sysusers.d expects it as (nobody, 65534, 65534,=20
> Kernel Overflow User, -, -)
>=20
> On 27/12/2023 12:20:34+0800, Chen Qi via lists.openembedded.org wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> >=20
> > 1. Patch changes:
> >=20
> > 0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> > is removed because it has no real effect now. The /lib is now=20
> > /usr/lib because 'usrmerge' is a required distro feature for systemd.
> >=20
> > 0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch is=20
> > refreshed for the new version to avoid patch-fuzz issue.
> >=20
> > 2. root user's home directory now defaults to "/root":
> >=20
> > The sysuers.d/basic.conf is still modified to respect the ROOT_HOME=20
> > value, so if users set ROOT_HOME to "/home/root", the behavior is=20
> > the same as before. However, this is only for backward=20
> > compatibility. With this patch, The ROOT_HOME value is set to "/root" i=
n init-manager-systemd.inc.
> > This is because systemd's source codes are hardcoding "/root", and=20
> > other values are not officially supported. See the list below.
> > $ grep -rl '"/root"' src/ | grep -v 'src/test'
> > src/core/namespace.c
> > src/basic/user-util.c
> > src/nss-systemd/nss-systemd.c
> > src/nspawn/nspawn.c
> > src/firstboot/firstboot.c
> > src/shared/userdb.c
> > src/shared/user-record.c
> > $ grep -rl /root network/ factory/ sysctl.d/ sysusers.d/ rules.d/=20
> > tmpfiles.d/ units/ xorg/ tools/ sysusers.d/basic.conf.in=20
> > tmpfiles.d/provision.conf units/emergency.service.in=20
> > units/rescue.service.in tools/list-discoverable-partitions.py
> > Previously, the recipe was just substituting=20
> > sysusers.d/basic.conf.in, which is not enough to be treated as=20
> > 'fully support'. I deliberately put a warning message in do_install to =
warn users about non "/root"
> > ROOT_HOME value. Don't remove it until all above places are handled.
> >=20
> > 3. cgroupv2 is now the default.
> > cgroupv2 is the default for systemd for many years and it's the=20
> > default for distros such as ubuntu and fedora. Let's also use it as the=
 default.
> >=20
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  .../distro/include/init-manager-systemd.inc   |  2 +
> >  meta/recipes-core/systemd/systemd.inc         |  4 +-
> >  ...tall-dependency-links-at-install-tim.patch | 22 +++---=20
> > ...sysctl.d-binfmt.d-modules-load.d-to-.patch | 73 -------------------
> >  .../systemd/systemd/basic.conf.in             | 40 ----------
> >  .../{systemd_254.4.bb =3D> systemd_255.1.bb}    | 16 ++--
> >  6 files changed, 25 insertions(+), 132 deletions(-)  delete mode
> > 100644
> > meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binf
> > mt .d-modules-load.d-to-.patch  delete mode 100644=20
> > meta/recipes-core/systemd/systemd/basic.conf.in
> >  rename meta/recipes-core/systemd/{systemd_254.4.bb =3D>=20
> > systemd_255.1.bb} (98%)
> >=20
> > diff --git a/meta/conf/distro/include/init-manager-systemd.inc
> > b/meta/conf/distro/include/init-manager-systemd.inc
> > index 595d1f2644..0a76647459 100644
> > --- a/meta/conf/distro/include/init-manager-systemd.inc
> > +++ b/meta/conf/distro/include/init-manager-systemd.inc
> > @@ -5,3 +5,5 @@ VIRTUAL-RUNTIME_init_manager ??=3D "systemd"
> >  VIRTUAL-RUNTIME_initscripts ??=3D "systemd-compat-units"
> >  VIRTUAL-RUNTIME_login_manager ??=3D "shadow-base"
> >  VIRTUAL-RUNTIME_dev_manager ??=3D "systemd"
> > +# systemd hardcodes /root in its source codes, other values are not=20
> > +offically supported ROOT_HOME ?=3D "/root"
> > diff --git a/meta/recipes-core/systemd/systemd.inc
> > b/meta/recipes-core/systemd/systemd.inc
> > index ccc3236457..1417e0150f 100644
> > --- a/meta/recipes-core/systemd/systemd.inc
> > +++ b/meta/recipes-core/systemd/systemd.inc
> > @@ -15,8 +15,8 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7aba=
abaa882bbe \
> >                      file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079=
008b364516c"
> > =20
> > -SRCREV =3D "2e7504449a51fb38db9cd2da391c6434f82def51"
> > -SRCBRANCH =3D "v254-stable"
> > +SRCREV =3D "2018ccef6645ce00c784369a22dc4e98f6d7061d"
> > +SRCBRANCH =3D "v255-stable"
> >  SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dht=
tps;branch=3D${SRCBRANCH}"
> > =20
> >  S =3D "${WORKDIR}/git"
> > diff --git
> > a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depend
> > en
> > cy-links-at-install-tim.patch
> > b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depend
> > en
> > cy-links-at-install-tim.patch
> > index 085f1e9052..be231cf6b2 100644
> > ---
> > a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depend
> > en
> > cy-links-at-install-tim.patch
> > +++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-de
> > +++ pe ndency-links-at-install-tim.patch
> > @@ -1,8 +1,8 @@
> > -From ca7d9a8d9c81702af9c599bb79706f12b1a465cf Mon Sep 17 00:00:00
> > 2001
> > +From 29a58009a172e369ad7166e16dab2f4945c6b0d2 Mon Sep 17 00:00:00
> > +2001
> >  From: Chen Qi <Qi.Chen@windriver.com>
> >  Date: Thu, 21 Feb 2019 16:23:24 +0800
> > -Subject: [PATCH] binfmt: Don't install dependency links at install=20
> > time for
> > - the binfmt services
> > +Subject: [PATCH 1/2] binfmt: Don't install dependency links at=20
> > +install time  for the binfmt services
> > =20
> >  use [Install] blocks so that they get created when the service is=20
> > enabled  like a traditional service.
> > @@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
> >   3 files changed, 7 insertions(+), 2 deletions(-)
> > =20
> >  diff --git a/units/meson.build b/units/meson.build -index
> > c7939a10f8..219570ab19 100644
> > +index e7bfb7f838..1d5ec4b178 100644
> >  --- a/units/meson.build
> >  +++ b/units/meson.build
> > -@@ -149,7 +149,6 @@ units =3D [
> > +@@ -154,7 +154,6 @@ units =3D [
> >           {
> >             'file' : 'proc-sys-fs-binfmt_misc.automount',
> >             'conditions' : ['ENABLE_BINFMT'], @@ -36,7 +36,7 @@=20
> > index
> > c7939a10f8..219570ab19 100644
> >           },
> >           {
> >             'file' : 'proc-sys-fs-binfmt_misc.mount', -@@ -246,7
> > +245,6 @@ units =3D [
> > +@@ -251,7 +250,6 @@ units =3D [
> >           {
> >             'file' : 'systemd-binfmt.service.in',
> >             'conditions' : ['ENABLE_BINFMT'], @@ -45,7 +45,7 @@=20
> > index
> > c7939a10f8..219570ab19 100644
> >           {
> >             'file' : 'systemd-bless-boot.service.in',  diff --git=20
> > a/units/proc-sys-fs-binfmt_misc.automount
> > b/units/proc-sys-fs-binfmt_misc.automount
> > -index 6b1bbdc91e..5ec5b8670a 100644
> > +index 5d212015a5..6c2900ca77 100644
> >  --- a/units/proc-sys-fs-binfmt_misc.automount
> >  +++ b/units/proc-sys-fs-binfmt_misc.automount
> >  @@ -22,3 +22,6 @@ Before=3Dshutdown.target @@ -56,7 +56,7 @@ index=20
> > 6b1bbdc91e..5ec5b8670a 100644  +[Install]  +WantedBy=3Dsysinit.target=20
> > diff --git a/units/systemd-binfmt.service.in=20
> > b/units/systemd-binfmt.service.in -index b04412e037..63f116e4fa=20
> > 100644
> > +index 6861c76674..531e9fbd90 100644
> >  --- a/units/systemd-binfmt.service.in  +++=20
> > b/units/systemd-binfmt.service.in  @@ -14,6 +14,7 @@=20
> > Documentation=3Dhttps://docs.kernel.org/admin-guide/binfmt-misc.html
> > @@ -68,12 +68,12 @@ index b04412e037..63f116e4fa 100644
> >   After=3Dproc-sys-fs-binfmt_misc.mount
> >   After=3Dlocal-fs.target
> >  @@ -31,3 +32,6 @@ RemainAfterExit=3Dyes
> > - ExecStart=3D{{ROOTLIBEXECDIR}}/systemd-binfmt
> > - ExecStop=3D{{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
> > + ExecStart=3D{{LIBEXECDIR}}/systemd-binfmt
> > + ExecStop=3D{{LIBEXECDIR}}/systemd-binfmt --unregister
> >   TimeoutSec=3D90s
> >  +
> >  +[Install]
> >  +WantedBy=3Dsysinit.target
> >  --
> > -2.39.2
> > +2.34.1
> > =20
> > diff --git
> > a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-bi
> > nf
> > mt.d-modules-load.d-to-.patch
> > b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-bi
> > nf
> > mt.d-modules-load.d-to-.patch
> > deleted file mode 100644
> > index 98914ae154..0000000000
> > ---
> > a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-bi
> > nf
> > mt.d-modules-load.d-to-.patch
> > +++ /dev/null
> > @@ -1,73 +0,0 @@
> > -From f75f03ef6bc3554068e456bed227f333d5cb8c34 Mon Sep 17 00:00:00
> > 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Tue, 29 Sep 2020 18:01:41 -0700
> > -Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d=20
> > to /usr
> > -
> > -These directories are moved to /lib since systemd v246, commit=20
> > -4a56315a990b ("path: use ROOTPREFIX properly"), but in=20
> > oe-core/yocto, -the old /usr/lib is still being used.
> > -
> > -Upstream-Status: Inappropriate (OE-specific)
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> > ----
> > - src/core/systemd.pc.in           | 8 ++++----
> > - src/libsystemd/sd-path/sd-path.c | 8 ++++----
> > - 2 files changed, 8 insertions(+), 8 deletions(-)
> > -
> > -diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in -index
> > 693433b34b..8368a3ff02 100644
> > ---- a/src/core/systemd.pc.in
> > -+++ b/src/core/systemd.pc.in
> > -@@ -67,16 +67,16 @@ tmpfilesdir=3D${tmpfiles_dir}
> > -
> > - user_tmpfiles_dir=3D${prefix}/share/user-tmpfiles.d
> > -
> > --sysusers_dir=3D${rootprefix}/lib/sysusers.d
> > -+sysusers_dir=3D${prefix}/lib/sysusers.d
> > - sysusersdir=3D${sysusers_dir}
> > -
> > --sysctl_dir=3D${rootprefix}/lib/sysctl.d
> > -+sysctl_dir=3D${prefix}/lib/sysctl.d
> > - sysctldir=3D${sysctl_dir}
> > -
> > --binfmt_dir=3D${rootprefix}/lib/binfmt.d
> > -+binfmt_dir=3D${prefix}/lib/binfmt.d
> > - binfmtdir=3D${binfmt_dir}
> > -
> > --modules_load_dir=3D${rootprefix}/lib/modules-load.d
> > -+modules_load_dir=3D${prefix}/lib/modules-load.d
> > - modulesloaddir=3D${modules_load_dir}
> > -
> > - catalog_dir=3D${prefix}/lib/systemd/catalog
> > -diff --git a/src/libsystemd/sd-path/sd-path.c
> > b/src/libsystemd/sd-path/sd-path.c
> > -index 1af3a36d1d..def502b717 100644
> > ---- a/src/libsystemd/sd-path/sd-path.c
> > -+++ b/src/libsystemd/sd-path/sd-path.c
> > -@@ -365,19 +365,19 @@ static int get_path(uint64_t type, char **buffer=
, const char **ret) {
> > -                 return 0;
> > -=20
> > -         case SD_PATH_SYSUSERS:
> > --                *ret =3D ROOTPREFIX_NOSLASH "/lib/sysusers.d";
> > -+                *ret =3D "/usr/lib/sysusers.d";
> > -                 return 0;
> > -=20
> > -         case SD_PATH_SYSCTL:
> > --                *ret =3D ROOTPREFIX_NOSLASH "/lib/sysctl.d";
> > -+                *ret =3D "/usr/lib/sysctl.d";
> > -                 return 0;
> > -=20
> > -         case SD_PATH_BINFMT:
> > --                *ret =3D ROOTPREFIX_NOSLASH "/lib/binfmt.d";
> > -+                *ret =3D "/usr/lib/binfmt.d";
> > -                 return 0;
> > -=20
> > -         case SD_PATH_MODULES_LOAD:
> > --                *ret =3D ROOTPREFIX_NOSLASH "/lib/modules-load.d";
> > -+                *ret =3D "/usr/lib/modules-load.d";
> > -                 return 0;
> > -=20
> > -         case SD_PATH_CATALOG:
> > ---
> > -2.39.2
> > -
> > diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in
> > b/meta/recipes-core/systemd/systemd/basic.conf.in
> > deleted file mode 100644
> > index fac288f7fa..0000000000
> > --- a/meta/recipes-core/systemd/systemd/basic.conf.in
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -#  This file is part of systemd.
> > -#
> > -#  systemd is free software; you can redistribute it and/or modify=20
> > it -#  under the terms of the GNU Lesser General Public License as=20
> > published by -#  the Free Software Foundation; either version 2.1 of=20
> > the License, or -#  (at your option) any later version.
> > -
> > -# The superuser
> > -u root    0     "root" :ROOT_HOME:
> > -
> > -# The nobody user/group for NFS file systems
> > -g {{NOBODY_GROUP_NAME}} 65534       -            -
> > -u {{NOBODY_USER_NAME }} 65534:65534 "Nobody"     -
> > -
> > -# Administrator group: can *see* more than normal users
> > -g adm     {{ADM_GID    }}     -            -
> > -
> > -# Administrator group: can *do* more than normal users
> > -g wheel   {{WHEEL_GID  }}     -            -
> > -
> > -# Access to shared database of users on the system
> > -g utmp    {{UTMP_GID   }}     -            -
> > -
> > -# Physical and virtual hardware access groups
> > -g audio   {{AUDIO_GID  }}     -            -
> > -g cdrom   {{CDROM_GID  }}     -            -
> > -g dialout {{DIALOUT_GID}}     -            -
> > -g disk    {{DISK_GID   }}     -            -
> > -g input   {{INPUT_GID  }}     -            -
> > -g kmem    {{KMEM_GID   }}     -            -
> > -g kvm     {{KVM_GID    }}     -            -
> > -g lp      {{LP_GID     }}     -            -
> > -g render  {{RENDER_GID }}     -            -
> > -g sgx     {{SGX_GID    }}     -            -
> > -g tape    {{TAPE_GID   }}     -            -
> > -g tty     {{TTY_GID    }}     -            -
> > -g video   {{VIDEO_GID  }}     -            -
> > -
> > -# Default group for normal users
> > -g users   {{USERS_GID  }}     -            -
> > diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> > b/meta/recipes-core/systemd/systemd_255.1.bb
> > similarity index 98%
> > rename from meta/recipes-core/systemd/systemd_254.4.bb
> > rename to meta/recipes-core/systemd/systemd_255.1.bb
> > index 0c12926bef..daa3a01fef 100644
> > --- a/meta/recipes-core/systemd/systemd_254.4.bb
> > +++ b/meta/recipes-core/systemd/systemd_255.1.bb
> > @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES +=3D "systemd"
> >  SRC_URI +=3D " \
> >             file://touchscreen.rules \
> >             file://00-create-volatile.conf \
> > -           file://basic.conf.in \
> >             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fal=
lback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
> >             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fal=
lback', 'file://00-hostnamed-network-user.conf', '', d)} \
> >             file://init \
> > @@ -29,7 +28,6 @@ SRC_URI +=3D " \
> >             file://systemd-pager.sh \
> >             file://0002-binfmt-Don-t-install-dependency-links-at-instal=
l-tim.patch \
> >             file://0008-implment-systemd-sysv-install-for-OE.patch \
> > -           file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.=
d-to-.patch \
> >             "
> > =20
> >  # patches needed by musl
> > @@ -73,6 +71,7 @@ PACKAGECONFIG ??=3D " \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev=
-shared', d)} \
> >      backlight \
> >      binfmt \
> > +    cgroupv2 \
> >      gshadow \
> >      hibernate \
> >      hostnamed \
> > @@ -266,12 +265,16 @@ EXTRA_OEMESON +=3D=20
> > "-Dkexec-path=3D${sbindir}/kexec \  # The 60 seconds is watchdog's defa=
ult vaule.
> >  WATCHDOG_TIMEOUT ??=3D "60"
> > =20
> > -do_configure:prepend() {
> > -  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in >=20
> > ${S}/sysusers.d/basic.conf.in -}
> > -
> >  do_install() {
> >  	meson_do_install
> > +	# Change the root user's home directory in /lib/sysusers.d/basic.conf=
.
> > +	# This is done merely for backward compatibility with previous system=
d recipes.
> > +	# systemd hardcodes root user's HOME to be "/root". Changing to use o=
ther values
> > +	# may have unexpected runtime behaviors.
> > +	if [ "${ROOT_HOME}" !=3D "/root" ]; then
> > +		bbwarn "Using ${ROOT_HOME} as root user's home directory is not full=
y supported by systemd"
> > +		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d=
/basic.conf
> > +	fi
> >  	install -d ${D}/${base_sbindir}
> >  	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'f=
alse', 'true', d)}; then
> >  		# Provided by a separate recipe
> > @@ -754,6 +757,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
> >                 ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules=
 \
> >                =20
> > ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
> >                =20
> > ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
> > +              =20
> > + ${rootlibexecdir}/udev/rules.d/60-persistent-storage-mtd.rules \
> >                 ${rootlibexecdir}/udev/rules.d/60-persistent-storage-ta=
pe.rules \
> >                 ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules =
\
> >                 ${rootlibexecdir}/udev/rules.d/60-sensor.rules \
> > --
> > 2.34.1
> >=20
>=20
> >=20
> >=20
> >=20
>=20
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel=20
> engineering https://bootlin.com

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193387):=20
> https://lists.openembedded.org/g/openembedded-core/message/193387
> Mute This Topic: https://lists.openembedded.org/mt/103380516/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
> [alexandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--
Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel engi=
neering https://bootlin.com

