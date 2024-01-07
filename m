Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F77C47073
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 14:05:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15478.1704636345403478784
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jan 2024 06:05:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Y8jTudMh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17363ddd61=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 407DtiXd023065
	for <openembedded-core@lists.openembedded.org>; Sun, 7 Jan 2024 06:05:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=BZS/mKvAAQQ3F1/ODNBbQkGwNbvUiDOi7hBIh3pltu0=; b=
	Y8jTudMhSF/zWTRrYHNHago4CD04xhBsBDbsKHwS9+2OXwMweKpE+QVbC1Ke2of3
	OSWtXRqCv6pXwQqln/Z/wpjWQ4flXyIz9WxRybz4KE33V/cTPvt908EPIDtTeUPM
	+kokQb8CHpt2zLRIg28w70kR1Vha6U/MytXi9GtyTpkNhgjRy/U7I0nSiXUoeduN
	Nh/tniVyFBLJs77nasdan8zx9p2GhJV05FnVrNzYF5iVnnYbYnbZqf4NbZlIK9dy
	jN5KLnft6TaViuvuAxmKElLLgPVz5eGj7Kepman7LBehBUM7on4lbI9Yywg/Pz3e
	aD8GBfnJ8/hvMszBIHy7RA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vf313gx0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 07 Jan 2024 06:05:44 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 407E5iSD000702;
	Sun, 7 Jan 2024 06:05:44 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vf313gx0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jan 2024 06:05:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuzqquQ6L4+lHOXOpYjWO+gMDcqpGZINOAPG92NWfn1gJoEORKs11ATO6qlrjc3ndGYWOEXBOFn2hT6ZW2leV5OhUXzX1YZTGbTlxsL5AenIG7M5qwfugk5hxJorjm2Y5PU8bs2Dx3tjPdNwvaqvM9F90boH5V6mkm6tRvheSh0FYpuYRa0bgFtgpSrZHPhhuBbjePyxAeu3JPYYkhPLNZJ4QcB2eeIL+yPhOJsrVTb9GncjqiMRjm1e5E4cZMX0+1XdF8+CSxzJmhZnylOS30tFN0fRk9A0qhSkMvQlaSytYW0Hamper0+HRG8Eid01VhYahk5Y1DeVcYoG93tMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZS/mKvAAQQ3F1/ODNBbQkGwNbvUiDOi7hBIh3pltu0=;
 b=AIGGIX4yB7B64JY4Ks1pmciu1vi7mouNLW/NGwX6D2CX2MfVIwhQHjs5MGT0Lz0hbmm0ulYOnZ3oAVHNUPxJE1yNdyUTR4AE2lOCugzdT0wh2L+2gIREhrXwGAgbF1q6UyRXQi9OIFHsO9RIZW6ckABMoLkY6/8lSwyhBCdd6wE73TnVMBNUTmsz3ZtRDJ+z1HST5CgMqwVJslC01v8bTzOQ+3KfsBnNequAI3yYWwke5xNIA6Ocq3PBySOCzExa/O7WxAKMfpF0yY3Z0jqYcHtEPczxLA1LrF/v68M0eSf6jWHtmAolN6yiWylPZFk/tV9hQT2oUOn+/Z+eEuE1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CH0PR11MB5411.namprd11.prod.outlook.com (2603:10b6:610:d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Sun, 7 Jan
 2024 14:05:37 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::8ba4:4bbd:ce09:b53c]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::8ba4:4bbd:ce09:b53c%4]) with mapi id 15.20.7159.020; Sun, 7 Jan 2024
 14:05:35 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Thread-Topic: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Thread-Index: AQHaOHwUZkl3/dEfCUuIElbTG14Wi7DLb+4AgAMD2IA=
Date: Sun, 7 Jan 2024 14:05:35 +0000
Message-ID: 
 <PH0PR11MB561163509353E4D92EA5F47FED642@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
 <2024010516013267114873@mail.local>
In-Reply-To: <2024010516013267114873@mail.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|CH0PR11MB5411:EE_
x-ms-office365-filtering-correlation-id: 1f51e9ce-b326-47d4-90ff-08dc0f89b840
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PMRIovck6Bagmq3Z/Qh/JEh3tjfcIjZkhNWSdV8hFgq+YrH+02q5GHjhLxwCFn+L+I0k/3MI2LIi8J402k1qe5Jf9USHrCGC3/L///49LjGKv/8tA1pBJRMZkAdomahPhE3Tc8GmqgCSpNtltB/2DomaPTOuVAePE4G/LXF+G3xZPYBI0ucKHKFhANGPewUUsjKCB4YsEv4CuHgiaM+IKqApZ9G0tg3D15vtzROoDWjkWpXJ0r6GD9TG+8ZqMruJKmdqQLxKgRde+9CGDptTqklDvdGCqgQ42kXEpUr0Hrv5E7/3OlgORc99is5WWyHkRyz6DeMR+FnQK7033zaciQl7iairLzm/365SD8d1csxnl2z3B0xOt5dnIHXiWgjhCWSgqLAFXl2MWkjxYkemCMAEa3tuOObcabUo/G5fPPYFyAU/mqv6tNJrZfWFshCd5snROGxb0bcW/XPdSi4dL+Jx95NpOZCKC44yPkxMmQxNfdMM0EAq/20GADXzXNIRNYHXq38Q3ZmfesJch4cHYW1GJOHxjG/t0N+QLAc8hGRvb0I8EIkou4b9EpmQrF8yRC6WolJ17sJto798rHePc5EWl95/lV8H3BYCSJUz1kKEvCnLNucE1i/krhqOYmU2IU2BmATHdJJtd1PTgIB+XFoMCi/6ANRrOhYhIMTIvoA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(39840400004)(346002)(230173577357003)(230273577357003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(66899024)(38100700002)(8936002)(8676002)(316002)(5660300002)(4326008)(83380400001)(52536014)(6916009)(966005)(478600001)(53546011)(9686003)(6506007)(7696005)(71200400001)(26005)(38070700009)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(122000001)(41300700001)(2906002)(30864003)(86362001)(55016003)(33656002)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?jc1tC5QdR7p0Uyhb4k/bv1SuFHoastvfP0lu0uNczNe6Eazmq/OmWMxpPQ++?=
 =?us-ascii?Q?dwkclY8ZgOEr6ne3R2BBrMbaNV+54kq/zXVBsQQafHlEs2FymdWJaWauHctf?=
 =?us-ascii?Q?O4rnRCqtHvgaXh6n7yoZlsk1xIMCWMQ9WR4hr9coKsKMFwvV/iiVD1ieFYwg?=
 =?us-ascii?Q?7CKWsCc1+RRyV972Qq71+afPWLtTOg5OUK62KGhrAq0/XsfQUH+hjxlajBCa?=
 =?us-ascii?Q?/ZW8xWNXkyKvwEnttGjj2dSP14aeqlXN+cUU4Ksog/kk88n/O+5o1wDu8GF/?=
 =?us-ascii?Q?Cfq2kw8fsiGCPZUKQhDU/TWlVWS+rLf7caNQvezQ+e8ln8bkURFsC/n61xXr?=
 =?us-ascii?Q?iS7x4qHBi62KIAT8YY+NZalGiBGtEk5w+3lNqRT/+0KKj15BFtkREdQfvs+r?=
 =?us-ascii?Q?ko03HJMKBhQOCQxLtFyl2MvKjGFFFF3EAkKS+UobwBRAYWqkXMlIiQKb9zTm?=
 =?us-ascii?Q?kke9NWc8Gn8xwxooFP26Z4R6ACcm1VEdZT45EHCK4Txqi7F++pKj7oogx86F?=
 =?us-ascii?Q?XEoYrKEoDP/rZXmqQVmb8Wo3KplRGZhsPIiymWrQHgB/aq1HVhESK0rRzYDA?=
 =?us-ascii?Q?4M9QzoPVNfaTuH6nZvnxmnsVtHJdvXFRZdKuSiIZcV1N4rirPjOkCmphq7md?=
 =?us-ascii?Q?g87XYDFt3aqLn5KtFiRqQxSUyIsi3sZKcQGO0YCfdbJVouQmk/Op/YGwlASH?=
 =?us-ascii?Q?NxAKxOtKokauwmcJrcCR/llc4tovhFb7nYjjd+Ng6ULUu0WcJa57NEUYAdR6?=
 =?us-ascii?Q?au6qaqvL7DrNkEaa5j8o4dniHhkicGg29m3VnJ9RJMgS+zy9j+vEr5DCMFHl?=
 =?us-ascii?Q?c9WaTfvcMGy3NQY2PReSYgk1lJA6ZdGI+36zJwqjDgMN18IREPQmLp/gQAsh?=
 =?us-ascii?Q?Z5ElHE/s/Qw3rwFFrF2pS+iMQ7roL41mPlRAnJCTF1P+dYqc1IFlz1GdHwPg?=
 =?us-ascii?Q?BhLzIb+Cl7GhItaA3SnrFTg9R19inh3LNMg0m+3trUzRvmvgn+4feoDcvXIu?=
 =?us-ascii?Q?boHwBrTboFe/2ERBqODnVXGdFIOtTG2WG2MtdPBVegbe+sAZoY+PEIhNWLPT?=
 =?us-ascii?Q?/rdjWkstlngYOZx3tJZ6XO1cPMXHYXsrhJErzhkxaiK8AauqTVJAY0SS8514?=
 =?us-ascii?Q?pDGBUHBXOkzmwkD+gc+ScOwlwLpeDe4JaIim10ILMTaKg74zvqK1EQPdRmHb?=
 =?us-ascii?Q?2hvniKaQL16SfKeB5Cj6WdqkJDCMhTpRHnZ9rgqoSy8ABg8uTRiVdbmY5tww?=
 =?us-ascii?Q?99j5Z3M+YbFel4YefG3JNrsKHkdbTt8jOkkiaxlh1Nae1SkSDVOMwYFv75TG?=
 =?us-ascii?Q?griBo9hkiTTPWIviZ+0jFeYvNguslkx5wp2TektrixE8fZpDAeRrFo8A+Cp6?=
 =?us-ascii?Q?u2nLBctxnRocG4BvwXlzPoqozlDtMqDLaKNJKfRLXv5bUMfPYeGyWYLOHy5l?=
 =?us-ascii?Q?SpHoLR+IncYS/iueQl0oguIDJdgIDXTiyjckxhCKbVhbEMKLAcGq34vFcvhQ?=
 =?us-ascii?Q?uGXIyf8TgHVaCSZBMDsuQNzLk8Ie4NEnHIUm9R2nysdMgei+IX7TKTd4yWtE?=
 =?us-ascii?Q?9rDi54uOF4cM51wyB37pnRLy9C6VkkMDGokELU5h?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f51e9ce-b326-47d4-90ff-08dc0f89b840
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2024 14:05:35.5801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7M95ZSwABg04RruPj+upGNOuZgw+RoWBtTmJ3pR80bLhK2iAJGSM2J9Rh7anyOCdBJpSHLdu0/yHX5dSzdlfNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5411
X-Proofpoint-ORIG-GUID: JWb4hO8-rJxW_JD0IAq3aU-uW4nm_a1G
X-Proofpoint-GUID: mJmkLsuWK_zvVyI_7OEF3Zx3I8mp8MXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401070067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jan 2024 14:05:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193387

Another patch in this series fixes the warning:
rootfs-postcommands.bbclass: ignore comment mismatch in systemd_user_check

Is that patch also staged?

Regards,
Qi

-----Original Message-----
From: Alexandre Belloni <alexandre.belloni@bootlin.com>=20
Sent: Saturday, January 6, 2024 12:02 AM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1

Hello,

This fails with:

https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/7361/ste=
ps/12/logs/warnings

WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: User root has been defin=
ed as (root, 0, 0, root, /root, /bin/sh) but sysusers.d expects it as (root=
, 0, 0, Super User, /root, -)
WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: User nobody has been def=
ined as (nobody, 65534, 65534, nobody, /nonexistent, /usr/sbin/nologin) but=
 sysusers.d expects it as (nobody, 65534, 65534, Kernel Overflow User, -, -=
)
WARNING: core-image-sato-1.0-r0 do_rootfs: User root has been defined as (r=
oot, 0, 0, root, /root, /bin/sh) but sysusers.d expects it as (root, 0, 0, =
Super User, /root, -)
WARNING: core-image-sato-1.0-r0 do_rootfs: User nobody has been defined as =
(nobody, 65534, 65534, nobody, /nonexistent, /usr/sbin/nologin) but sysuser=
s.d expects it as (nobody, 65534, 65534, Kernel Overflow User, -, -)
WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: User root has been defined a=
s (root, 0, 0, root, /root, /bin/sh) but sysusers.d expects it as (root, 0,=
 0, Super User, /root, -)
WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: User nobody has been defined=
 as (nobody, 65534, 65534, nobody, /nonexistent, /usr/sbin/nologin) but sys=
users.d expects it as (nobody, 65534, 65534, Kernel Overflow User, -, -)

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

