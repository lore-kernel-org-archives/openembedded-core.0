Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69716C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 01:42:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3321.1652406149340310075
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 18:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Z22TKHkV;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=213232f529=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24D1gTqv014918
	for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 18:42:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=kQC3DqNwCuPJ997fosPgJ4rC8pCl98cfvVG1Y7Ctr8I=;
 b=Z22TKHkV+SQ0MXrfaQpo0OEwN7qCDGauaWFN13B+XAqESqzOE5kBIO3EyQaGQ2L3Bsez
 sr74X6kxfHp/mcSnPhTQ/XDW6LPU0u3rAfjCGTdWHyOJcQjlMJbVVautCUHK4DANRPGF
 2Dqppikzt4acpmgZms+jIQ8SOudGmhibrdK2Qx2jezW0vTRgZgclMUUO4mlICLa0eIgL
 8fxeWJJuxPwe1UFNBj/Q970YK5oSU4aWI0jrfe2IB9yRYlGpbTLZrPITv2mJkh1t9FJ3
 UILgQ5ADcVGy87SC6p55Qni3u/V+/ZKyGK6FCAvxZhMTRIWc5tkqkcyoAnouc1Bz2ZaN iw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fxde5kr9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 18:42:28 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24D1gSHR014913
	for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 18:42:28 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fxde5kr9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 May 2022 18:42:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DU5zY3TeuFApmwk9sGj8fRTJ8/MnLEjC9F/2cxXhVqLtvOYVYBZzfvVtjYBncjDCE0/6bScOl0kOuQLl6I/xyA4X3mvgJYJpsc44W8BPP/j7m/NhKMnVtxsgYulQvt2Woaw0aMOfN8NIUKDybz2b9mitRRSvRs3UrOuIZuKHeQW3jxCM1m+JRX9OiZ3JIYLJtP8WxJEpzIKDZqJ5/HqD21pG/+0nSwym9yhxXSxx6ZZDYrUeHuXbGBjzUGu4TsOpLv8e+FVLsvbRcWLZB9SAvrXDqf/+J/RzVm3aR0Dd4Wred4OVOQY1TeytFwP956mK66MGP9CALMZqNOyoU92ncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQC3DqNwCuPJ997fosPgJ4rC8pCl98cfvVG1Y7Ctr8I=;
 b=XqaNupQA549h4+HaPsytzeIwsbU6SvV8jsg2BzLGDjn9LasnpCL5KGSe49lTM1TSNgMvCCLiak2hRmr/M1aNLP6zdLncvpWJX+hay38WPMM/dthTIcIotoyReI/ocAu2WcKaZJ3xG0pSJnNUnP6F3BQyFGrZPLGPemk1l1iCWG+btF6yg0IP9OANJ2zjF2t+bzdzVa7s0q6lYsnSHYUIJKVp14dn1JYdL54exRO1NWvr2AGrQySx2khSPNXqtQk0hIuvzaZjtAT7+MpLVSlosYCTlKHoDgunrMz7OJEqeVC0NBr3K/W1hbjWanV+Xt8bPxfcoLNiq6kDqh7y05queA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by CY4PR11MB1686.namprd11.prod.outlook.com (2603:10b6:903:30::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 01:42:25 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c103:34e:6b82:8f92]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c103:34e:6b82:8f92%4]) with mapi id 15.20.5250.013; Fri, 13 May 2022
 01:42:25 +0000
From: "Li, Changqing" <Changqing.Li@windriver.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        Alex Kiernan <alex.kiernan@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
Thread-Topic: [OE-core] [PATCH] eudev: create static nodes from modules
Thread-Index: AQHYZdRZqwkCY9rhpkqR+6R+bYoS160bC92AgAD6iqM=
Date: Fri, 13 May 2022 01:42:25 +0000
Message-ID: 
 <SN6PR11MB25578B38EF44CB5A0D00A40782CA9@SN6PR11MB2557.namprd11.prod.outlook.com>
References: <20220512054303.429208-1-changqing.li@windriver.com>
	 <CAO5Uq5TO3gZQNkucAy9s8aiJ=0+nMJDe-zw=SBT+wOjbUQwniQ@mail.gmail.com>
 <dbf5957af1a1afd39a90465b47eeae90fa6f350e.camel@linuxfoundation.org>
In-Reply-To: 
 <dbf5957af1a1afd39a90465b47eeae90fa6f350e.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5be4da32-3f5e-4cfb-436d-08da3481d4e5
x-ms-traffictypediagnostic: CY4PR11MB1686:EE_
x-microsoft-antispam-prvs: 
 <CY4PR11MB1686EA8D0941F1C21F69129582CA9@CY4PR11MB1686.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZheQmsKuFFhR0QOczAhp6uprRPjVo1gx0yX4VURgol/1kDmQk4OMspCWe9chZHIl5fwVyowcLpXt4Mp/5NYpYvrzxsp/ZgI1bPAun69H5GcrLFfMS1maIpVKTaGi/M9/xToGBRSMisdKjCD5nUVSO+9VPrtRP+Rtbclrn5XIU4QCY9hKz42BzFl8dQERx8djXw1Og6UMlZdpLu3GyrsG7r/wCAkOBuM/kK8wa2LO6RnzwivtwJdkEitV9946QVE5CZMjEJJRcP8pyPuxMdULxVqeo6phkPFnBbhwrPzxJKoJyAk5dXSs0vj8kCVQQ3qdQkMgqpEkXZtqfxDbT/2sx8eonmutW7R7qd9cjk1rOI/ZBBnQUhc3pg81RkWBef4YJW2hT44Z8h1FHhwuAyLX8AQG8RDzEJwR0YgjcmS1gd+Rr74IIBMIy8Ww50foOwwcUG1O1MBWpNWPElpB2z04FBOCKKR6YxjFwqi4DAIVbulEe2zfWRKFJQWrQbIctLXj7cKylQRchlRO5oq3JAX6LOlkp7JQb2vnN86t0ST5jRFDWO5vBb+eS0wgXmyM8Miwbn2UUjTL5Lz3WvN68N4nkWg3zfB7QPw7KRwIGgZlEzYUtwB7CsC7ozx9o4a0J5QzJMBRHtlTkbJBbsvCi/iWkuVorPuzZ/583YT4zkiaq9QJw+BAAOeYhJWL90yQV10Piro30/z0b0ZxC5RyOqSD7Jo6ZNKe/DG4mLSTDRjEfD35pwRiuxLQGyaJ9uorLf0aMO519QUNuK0eFtT4nJf7yw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(5660300002)(52536014)(38070700005)(2906002)(186003)(8936002)(71200400001)(86362001)(8676002)(76116006)(66946007)(66556008)(66476007)(4326008)(64756008)(66446008)(91956017)(966005)(6506007)(55016003)(508600001)(53546011)(19627405001)(7696005)(26005)(9686003)(110136005)(33656002)(122000001)(316002)(166002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?rAy968empYPvb7oyUUeAu9iApoiUOEhuoXGExAjnQDI0mkX14BKJmUfipz?=
 =?iso-8859-1?Q?wMTU0jdRpfN/hXVLrZ2gqWXbjsld83al3VpPyDLe4B3n+rxh83F+WsXtCb?=
 =?iso-8859-1?Q?lfSOseKt8xPC2RBeE3oxw//xB0o8TcAKQy9ndKamkVw+zMUoiDQeI/jJFU?=
 =?iso-8859-1?Q?Or8yZ0W0y0KcEEfYqDkv2JsMokK9l9K6GeG3qOxs2kEc8XNzneCBj38NBl?=
 =?iso-8859-1?Q?VttfOjgl+mVakLPm9ZQwC+ETpNUCzKRoALKQX5hst+IlWl1igRVqjIJCsu?=
 =?iso-8859-1?Q?0u3GX/HDOgBdck1lbJ9TecaDR8Ai/K6CBuDL3FoCtxKUC31F2UWTs7MZ2j?=
 =?iso-8859-1?Q?+7EieoyeM6LWV+dbkRmBfHEq4PkmgAWoE4hO+k2YW4F7fypx5DFzKedEPR?=
 =?iso-8859-1?Q?6D9QZ4UTYNeB5/6H8TTJKmZAONZdRopkbmaQvm3l0ShRlvW4NRcvREKpa/?=
 =?iso-8859-1?Q?pZQ7IWuVz6BzpwTVgZdlbBDEMogaYHjjgqJQMU9lnAu+DnbTCCqIT0RXGc?=
 =?iso-8859-1?Q?sPLV05yqjvbBIrkOkYOHN3WlMYoBOrIHBPKwBuU80YyPkJ7LJbPFknKTXt?=
 =?iso-8859-1?Q?gVsXez9Kl0a9mcCulYB6j4Xd9rzJO37X5E+T/xogbkeHn0fDpN8Rv21Suh?=
 =?iso-8859-1?Q?kUXBhkZTjJvzASiDotvGKk5SUdKFPi5Lb8vuKau/bkEw9Og/ijXynUEA1P?=
 =?iso-8859-1?Q?+IOU0iFvtA5Z2mMQ8uq1TxfzB9NPQDAsNahST8uXdaFIxQ+5wmKRfOKQmo?=
 =?iso-8859-1?Q?DWSgiE/ZFvz+kPTw7lMcnua108DU7kTgXASFAlYQpRZXUmrG1XhRCaVh45?=
 =?iso-8859-1?Q?Tnk6YS1TIyEsYs6G6L03szi1AX50WdipE59KSRc4IBqXs2SAEiGQhQRrsN?=
 =?iso-8859-1?Q?W2Yt326R1ubYlWGJN6ORjJOg+EkfqtTHEjJJLH5NLxEWB6ezwZytwAdKuW?=
 =?iso-8859-1?Q?X7VyQVS6DAr+Exfkc2/hIPz51Oq7svXMvSK9+6FTrMdJOJpzwqjlDZcwIN?=
 =?iso-8859-1?Q?9PW4G7yp84XEOco/H81/BV3i9BE5baTALBLQ4S3KREuubiVcqiJB/iFcIZ?=
 =?iso-8859-1?Q?u7LGXjZtMwsfxPDuPo7UydAHzhCBftERZ0W/eRyW6tXV0dsbrXVdHXlJ55?=
 =?iso-8859-1?Q?kPAXN81/iPq2XHHSSZsjIGhdUe8yfcBTyQZyjpcy9hSeeEAGoVs7y1PU+y?=
 =?iso-8859-1?Q?1n/0TSP8L11P+qu42DkFVNakdhoGOUNbaxzB9Jfm0r4b5HenD1tuIiL20Q?=
 =?iso-8859-1?Q?FnXoFg86/ZP8zFcS61O1TiN+hIiV/iDuIp4dd0hpGO9VXxTgDBjrZeKgm4?=
 =?iso-8859-1?Q?LK9dX0/8TfPkRz8MRoeHGjJHsSuOqPzdzvR/oDLYQZCrD4uU65ADaxo5Zw?=
 =?iso-8859-1?Q?i3FzWx/run79VlYRFK/OvwikTvdyUtTnXV2QrKVoPqpRjGW/IdvWj8Nob6?=
 =?iso-8859-1?Q?IfOehK/DphWAgspicmi/Oyv3UYr6sSn6AtSDnhnsVpgIZ3EEFliLQ4dkjn?=
 =?iso-8859-1?Q?hGrRT45Aw7NsatAg9+JK9k7Mdl5WXrJMfe+F7JpxFQWqQ3YV53X0es1LUX?=
 =?iso-8859-1?Q?qSvJy6NUNmcNTkzC87lgcc55jwwYStNC3AJ8vdv9zsuFfou68HcM8AKAdo?=
 =?iso-8859-1?Q?E0P24JzyCNx1w7e/dN/ngHpMNG4ZtNBMVG9V0B0iSAOENft+It++apOtUD?=
 =?iso-8859-1?Q?Ki/pvyjigZLos9ccdetGVgoX6Qq6n3lCK00fc+SFnbQuU1F8/+T/lDO5uL?=
 =?iso-8859-1?Q?5ReywbZsd0bkyXn8m1vtnIjZumi5a5NoIAfV4MqK9EV8k8+/bT/PTBf458?=
 =?iso-8859-1?Q?q/rWgtWeMQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR11MB25578B38EF44CB5A0D00A40782CA9SN6PR11MB2557namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5be4da32-3f5e-4cfb-436d-08da3481d4e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 01:42:25.3254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 PTfPxTTPMmOVecRmDafP83blRnlt5FhDzUaEHIrO5dS64Mxv8m5jVwUc7ZN6Xd84/DSQurkt7KDahNr1il8E9389yfgvsekV3ToTcgsE7Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1686
X-Proofpoint-GUID: l-N19qlbkDhWrXViagKwSUi6FFG9aOqS
X-Proofpoint-ORIG-GUID: Mlrp_Ik8H3IKfqDk8ppwr2AzeNaLgg5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_19,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205130007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 01:42:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165542

--_000_SN6PR11MB25578B38EF44CB5A0D00A40782CA9SN6PR11MB2557namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.or=
g>
Sent: Thursday, May 12, 2022 6:33 PM
To: Alex Kiernan <alex.kiernan@gmail.com>; Li, Changqing <Changqing.Li@wind=
river.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@list=
s.openembedded.org>
Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules

[Please note: This e-mail is from an EXTERNAL e-mail address]

On Thu, 2022-05-12 at 08:45 +0100, Alex Kiernan wrote:
> On Thu, May 12, 2022 at 6:43 AM Changqing Li <changqing.li@windriver.com>=
 wrote:
> >
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > dev in modules.devname should be populated in /dev on boot.
> > remove create static mode from udevd will make these devices
> > cannot be populated. When use sysVinit, devices like /dev/net/tun
> > will not be created.
> >
> > more info:
> > udevd in systemd also remove create static mode in udevd, but using
> > service kmod-static-nodes.service and
> > systemd-tmpfiles-setup-dev.service in systemd to create these node, so
> > systemd works well.
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  ...dev-create-static-nodes-from-modules.patch | 115 ++++++++++++++++++
> >  meta/recipes-core/udev/eudev_3.2.11.bb        |   1 +
> >  2 files changed, 116 insertions(+)
> >  create mode 100644 meta/recipes-core/udev/eudev/0001-eudev-create-stat=
ic-nodes-from-modules.patch
> >
> > diff --git a/meta/recipes-core/udev/eudev/0001-eudev-create-static-node=
s-from-modules.patch b/meta/recipes-core/udev/eudev/0001-eudev-create-stati=
c-nodes-from-modules.patch
> > new file mode 100644
> > index 0000000000..19611f4e89
> > --- /dev/null
> > +++ b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-=
modules.patch
> > @@ -0,0 +1,115 @@
> > +From 573d6c4106d5b3828da43d2843c1d599ae3cd1cd Mon Sep 17 00:00:00 2001
> > +From: Changqing Li <changqing.li@windriver.com>
> > +Date: Tue, 10 May 2022 14:04:35 +0800
> > +Subject: [PATCH] eudev: create static nodes from modules
> > +
> > +Revert commit <src/udev/udevd.c: remove create static nodes from modul=
es>
> > +https://gitweb.gentoo.org/proj/eudev.git/commit/?id=3D2b7abd5ec9cc47a8=
b895df6db77fb1537c6f1a39
> > +
> > +Upstream-Status: Inappropriate [oe-specific]
> > +
> > +Upstream intentionally remove create static nodes from modules, it is
> > +expected handled by tmpfiles services, refer [1].
> > +[1] https://github.com/eudev-project/eudev/issues/229
> > +
> > +For yocto, when start with sysVinit, to enable systemd distro feature,
> > +and install systemd-tmpfiles is not proper, so revert this commit.
> > +
>
> Reading the upstream issue, I'm not sure this really is an
> "Inappropriate" upstream. eudev has dropped this commit, because you
> can use systemd-tmpfiles ("as it works without systemd and can be
> compiled individually" - presumably using our unsupported musl
> patches...) or opentmpfiles (which is dead and points you back to
> systemd-tmpfiles).
>
> Feels like this is an engage with upstream rather than carry a patch
> forever which just causes us to be perpetually divergent.

I agree, this does sound like something we need to address to keep the
project maintainable...

I tried to suggest  upstream to add this back,  but  upstream seems prefer =
to use tmpfile solution.

Regrads
Sandy


Cheers,

Richard

--_000_SN6PR11MB25578B38EF44CB5A0D00A40782CA9SN6PR11MB2557namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size: 11pt;"><b>From:</b> richard.purdie@linu=
xfoundation.org &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Thursday, May 12, 2022 6:33 PM<br>
<b>To:</b> Alex Kiernan &lt;alex.kiernan@gmail.com&gt;; Li, Changqing &lt;C=
hangqing.Li@windriver.com&gt;<br>
<b>Cc:</b> Patches and discussions about the oe-core layer &lt;openembedded=
-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] eudev: create static nodes from modul=
es</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">[Please note: This e-mail is from a=
n EXTERNAL e-mail address]<br>
<br>
On Thu, 2022-05-12 at 08:45 +0100, Alex Kiernan wrote:<br>
&gt; On Thu, May 12, 2022 at 6:43 AM Changqing Li &lt;changqing.li@windrive=
r.com&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; &gt;<br>
&gt; &gt; dev in modules.devname should be populated in /dev on boot.<br>
&gt; &gt; remove create static mode from udevd will make these devices<br>
&gt; &gt; cannot be populated. When use sysVinit, devices like /dev/net/tun=
<br>
&gt; &gt; will not be created.<br>
&gt; &gt;<br>
&gt; &gt; more info:<br>
&gt; &gt; udevd in systemd also remove create static mode in udevd, but usi=
ng<br>
&gt; &gt; service kmod-static-nodes.service and<br>
&gt; &gt; systemd-tmpfiles-setup-dev.service in systemd to create these nod=
e, so<br>
&gt; &gt; systemd works well.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br=
>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; ...dev-create-static-nodes-from-modules.patch | 115 +++++++=
+++++++++++<br>
&gt; &gt;&nbsp; meta/recipes-core/udev/eudev_3.2.11.bb&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt; &gt;&nbsp; 2 files changed, 116 insertions(+)<br>
&gt; &gt;&nbsp; create mode 100644 meta/recipes-core/udev/eudev/0001-eudev-=
create-static-nodes-from-modules.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/udev/eudev/0001-eudev-create-stati=
c-nodes-from-modules.patch b/meta/recipes-core/udev/eudev/0001-eudev-create=
-static-nodes-from-modules.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..19611f4e89<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes=
-from-modules.patch<br>
&gt; &gt; @@ -0,0 +1,115 @@<br>
&gt; &gt; +From 573d6c4106d5b3828da43d2843c1d599ae3cd1cd Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; &gt; +Date: Tue, 10 May 2022 14:04:35 +0800<br>
&gt; &gt; +Subject: [PATCH] eudev: create static nodes from modules<br>
&gt; &gt; +<br>
&gt; &gt; +Revert commit &lt;src/udev/udevd.c: remove create static nodes f=
rom modules&gt;<br>
&gt; &gt; +https://gitweb.gentoo.org/proj/eudev.git/commit/?id=3D2b7abd5ec9=
cc47a8b895df6db77fb1537c6f1a39<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Inappropriate [oe-specific]<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream intentionally remove create static nodes from modules, =
it is<br>
&gt; &gt; +expected handled by tmpfiles services, refer [1].<br>
&gt; &gt; +[1] <a href=3D"https://github.com/eudev-project/eudev/issues/229=
" data-auth=3D"NotApplicable">
https://github.com/eudev-project/eudev/issues/229</a><br>
&gt; &gt; +<br>
&gt; &gt; +For yocto, when start with sysVinit, to enable systemd distro fe=
ature,<br>
&gt; &gt; +and install systemd-tmpfiles is not proper, so revert this commi=
t.<br>
&gt; &gt; +<br>
&gt;<br>
&gt; Reading the upstream issue, I'm not sure this really is an<br>
&gt; &quot;Inappropriate&quot; upstream. eudev has dropped this commit, bec=
ause you<br>
&gt; can use systemd-tmpfiles (&quot;as it works without systemd and can be=
<br>
&gt; compiled individually&quot; - presumably using our unsupported musl<br=
>
&gt; patches...) or opentmpfiles (which is dead and points you back to<br>
&gt; systemd-tmpfiles).<br>
&gt;<br>
&gt; Feels like this is an engage with upstream rather than carry a patch<b=
r>
&gt; forever which just causes us to be perpetually divergent.<br>
<br>
I agree, this does sound like something we need to address to keep the<br>
project maintainable...</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">I tried to suggest&nbsp; upstream t=
o add this back,&nbsp; but&nbsp; upstream seems prefer to use tmpfile solut=
ion.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Regrads</div>
<div class=3D"PlainText elementToProof">Sandy</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR11MB25578B38EF44CB5A0D00A40782CA9SN6PR11MB2557namp_--

