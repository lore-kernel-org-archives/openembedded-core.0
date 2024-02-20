Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E32DC48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 22:43:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2478.1708468992940127322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 14:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cGuKz1ed;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2780e2dca7=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41KKlUQ1016134
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 14:43:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=0rKAfx0NxWaOs+A17YDdOIWr3e31ie639IWHGZEuGfk=; b=
	cGuKz1edyXLlWK5fTidPNJPpjBViKkBGsb3vEjTRL2+KswzbwYhRjBL4Bg6mg5z8
	j1n6L2zZR1TjKP9iivK2qvlKOT5NZGgNk87WWmqmn1VT5+SATcyAm+4YbWok1x1B
	vQQoG+h/8JGhzI0+v2EowH3bsN9CcWbWV5a98LTzVos1caLq3zwk5eY7atKe9cD2
	RXcUcM/TM1rfR+daOtLZY+hq3TwLquv0z9c16h16cVo0U4uxV0k71I327IFCShbN
	5xJoCxT/s1edL6xW0trHfc/bB3+v4KDtxQ2pV4qGy6oN7FaeYM0Jnrvcrz2jMzz8
	BW4KGw7p7WhWr4vqcSvPBw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20cr6ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 14:43:12 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41KMdp3T013065
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 14:43:11 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20cr6ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 14:43:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmWEKuzOxhu0tq1GNVENLgHhf6J+tDyBcJBdN+ubibjw+JP+WI7xtB1OGoNYr71BfRYGZUIaNqkfWdJjpSDRzPQkWiVoUmvnxAmMieBq+pePg0Vb6gL8fVmM3qBzM5ocOn/hr0qqVpoMoaXIFLv2Mu8z5h7EVL1M/6QWk7AfFSaihVO9Emle3qD2z9iR5qqcT7SWDCQNOxqDl8sPcX6I3Gr1PDioCjpE8jBbYj/Zqo7CGNZX0MuLvrj7Glu0t+2Infu3rvgb/rPyXOMP38yWY+gY73/LV4t3hiehxrqj/Hyx4R6WGz1lK0AkBABR7L3QSOxC2dg5cqe4m8P2VDgzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rKAfx0NxWaOs+A17YDdOIWr3e31ie639IWHGZEuGfk=;
 b=I4IdqAo5u+QaLzMuEOJZe0OQfKdQAHuzUqStW9q8MCi5GUJVXxcwNJr/gkGnaVA5X+eK9wdfppOiUwfzK6zWb5/7fxcHjsTFpuXLYItzj/cooLwjLfztQn/skLrsa/Vqmek8YfuyJllKU0yny76mSsFddD7LLFHXNWcMbJqkV/HysUn0wVdBIANhl0CYSsZXlIVlp9fBxVcvaOHqWcp7D6+PgNNOxuTo1R1kNIxGJnPHQJgepvunEE2N0sGk9wCesZ9hkXCuULzHWnp0rgoCEINxSibANy0pNaCL5YoRfXxYO1+4pN5M9vm2qKQUjr8+cyh6LFg5bHqsIRDLVUEPfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by CY8PR11MB6986.namprd11.prod.outlook.com (2603:10b6:930:56::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Tue, 20 Feb
 2024 22:43:09 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::9d88:f871:9dff:e539]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::9d88:f871:9dff:e539%5]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 22:43:08 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [oe-core][PATCH 1/1] qemuboot: predictable network interface
 names
Thread-Topic: [oe-core][PATCH 1/1] qemuboot: predictable network interface
 names
Thread-Index: AQHaWGT8wCqMC+zsL0mBriELEdBNbLD9r9gAgBY6sjA=
Date: Tue, 20 Feb 2024 22:43:08 +0000
Message-ID: 
 <BY5PR11MB399294C387AA2AD9BB568BC188502@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20240205185608.1497595-1-joe.slater@windriver.com>
 <202402061911421ea0ded3@mail.local>
In-Reply-To: <202402061911421ea0ded3@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3992:EE_|CY8PR11MB6986:EE_
x-ms-office365-filtering-correlation-id: 3f5caf5e-71de-4387-05d5-08dc32654f90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SK1ux5PM6U5/QMors1yLuzTDvfAUCK8LLDl3h+feZp5D3aMxGLj6vRT0h9Ro4k7hho4Hl5pLsWh8ZkRdSy5Bmi0ga05NpSqvucvBf3ko/sQCFd1RZS/6Ujx8m/LFlrWm3fDZqFj/1JnfBJh0LMEIJOP7FwXPPTIA35oXtmxe/+xMwWRhL3rYFexC/Z7pipYzEGHg/J3xii9o/eDTrB1a9svee472CNsC9N+K4/iGz3K1b+Cgp48IElmPoF343kFgQKGnOx2NekNUkJChIIq1vtcxRnW+me6ruAI6jVlvk8yDPQGcTnymtQv1HhZsxhUgLuH5lw0QKdv37LD2NdAe1GqmVmHnJps6SENG6H/i8eq4G1yTjC388NsZkpYm2clDSgn4Tmyxn4aypS8wPBzv/7Shn1y9sMCrZbbqw+9/yGv5IMJzskcdur52JgH+XHKAL72h7VQ0K78rNOVmhgwzwQaKiqUVHecdSxxzC73sY9PnOqZSm51lBMNtpYeHQ9CI0dDMPBFGnfQ0GzDsf1KGysUfR9yMf5wqGjl/ssURK5DducD94v3+glSRLzjh2S0sZPPpBn5Nq0ZmWT37hJLRE5H67s/8b5S0q8pm5ZiY80U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aJbMqtrbRsG//48FL5kyeiYMC/iqgRdsnj4+Z3BII8ZxLm9KSNezOjePLL7z?=
 =?us-ascii?Q?iT8XMwGMVsgHbU+fUf0jhJYpoMqVBhy9t3Y5Qzc5qV6U1IJmSeGGWG1qeNSU?=
 =?us-ascii?Q?YNaY9N5ZMk8mWhu/18+j+VqCq49Wp6N6zD2mExJ6SXVCJAYwTKedTtLTqGwS?=
 =?us-ascii?Q?d2Cc+Ygvnvzt+IZL82YJasAjBJMGMF53zbHGKr1JjevjTL+zzTAig83yGvoC?=
 =?us-ascii?Q?AbhbcglPmuDn1BqExVlZqMh8Z82cw5kaBYpE+aGqCEDoai70CIwg+6jq7E/x?=
 =?us-ascii?Q?MNr5x5E3XR6pxuUXqcOICy3j+qUzVRg2GhCh5MeLaqOwYETvnJyawOOfVHj0?=
 =?us-ascii?Q?DFVZ+N+PRWv0WqMTPEZkonebLD30EOD6+5SiWIzczSmehYh6f9AkQycRWu9k?=
 =?us-ascii?Q?/WP72oYFBnY9ktqMFcMuR1KV6t7j+Zh/BavQFsGYW4nP28G/B8paoUNC3JBH?=
 =?us-ascii?Q?5KEumLvYM+xTm7sNHrnStmcCCougbqzSZhJg7xetjOt+XZnktHTltS9vYtpO?=
 =?us-ascii?Q?iJrd7My8ZMCuwy6ZAWVhRlcV70bVius7f0kAGvD+rGkyb946a2EymJHdz1Dt?=
 =?us-ascii?Q?iLS73tcBuRFGFvLUj7507gASilvFh6oSKckrE6Cqu+xAufdxUcg6AlHvS0ZX?=
 =?us-ascii?Q?MV/XDxfVEMgU1xm1aN62IHze8W9fJtz/661A01mP0Dchn6IR0j3nGwqZOoBd?=
 =?us-ascii?Q?Y0NfnVu8ww1l7Q9FQM2F6DKxsjhrAZwb1FD9pvWByZxuIoeIgHL1oL+Xb2Ts?=
 =?us-ascii?Q?xDQpQOwY13mpLlsQn7auhJ8CjguhJ2TuUSn0wAC8mWYyMeJCOQf96oUKpyu3?=
 =?us-ascii?Q?H0t1Q43oQLMATkRw2R7vp2mnlUNNOilY0QhEjzLrSlZIi8QiJcAsHvD/n3ga?=
 =?us-ascii?Q?cMam3tHYrZ7DEGV0N6YTPS82ariJggJ979p7EUG3hGMs1CFWoSjmachtHROl?=
 =?us-ascii?Q?y1iZE9iQXeDb3Wv1cfEv8ouHrLkvI9PxcyXok7eJ9SBPYuy9YSRlSTqSawLR?=
 =?us-ascii?Q?jAzeCUr/f6k+YviaohdrgOqiOA25t0N/iG1Zq2fpOiJJFMaAgimXTByexpvm?=
 =?us-ascii?Q?SIDC9J6T2U3zBVYyycwwkrEtqlU6tOd+YlX8YHPGkZK5R5SkV/hmuD1y6wT/?=
 =?us-ascii?Q?FcnzStKDtFcXzegAXF/tiYfM5frcby2BQuluchB+zKqvwGLxAOi5NoZnOXWN?=
 =?us-ascii?Q?Zl+g9K5cMcPxkP4xuhoxK4HeNo+JKcHe0gdMicDut7+/H9dUhEFjHw0uwD3T?=
 =?us-ascii?Q?sawK8avSCazwdwuM7jRXQRE2cq59uTunPmtE9gRNh3GE49g7/Nxex8TgQTa6?=
 =?us-ascii?Q?VdVCaxkRhAdGusxcU6sk7I/SJIgWhSbJiBvw/s+hQ4l3NS6M9/6LbyDWz0b/?=
 =?us-ascii?Q?VaxnbMtgJjhEMc5+AtxNOi+5JTVKWcT8D6L6RuRf+I/gxKY6/m1dP44FRCBb?=
 =?us-ascii?Q?+xY6bb4eaXRR5G6iVLpJnL51cwVS3LSqVJBi6SBnEjsgo3+R6UDBBlNcu9hw?=
 =?us-ascii?Q?QvhV+9d7HC5VbIgRyI3GWEYVk5WOOWNU3MB8qFiADc5JWhG1g2h/dTKFflht?=
 =?us-ascii?Q?59hoeGQ1Gr+SA/EBfVTfw3c7ObV8oxJehGyOmLhQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5caf5e-71de-4387-05d5-08dc32654f90
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 22:43:08.7304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R9T1pKN21FApNedqh4sIgjKUD73+ffVUoZrSkDy0h5BJTKkh/O+kjylHYk/yI9bzVj+V/2sbVNlndBgK9WQhii2rVApEabNlEMSQvdXUl5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6986
X-Proofpoint-GUID: RJB-I9vfxxntJ9mGx4-A_UhSqWCeU1Wi
X-Proofpoint-ORIG-GUID: 1qJ0oUGMurbjuhrU1GnpSFjg98IlBiuI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402200163
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 22:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195930

Looking at qemurunner.py, it seems it will not find the ip info if net.ifna=
mes precedes it.  I will submit a V2 of the patch.

Joe

> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Tuesday, February 6, 2024 11:12 AM
> To: Slater, Joseph <joe.slater@windriver.com>
> Cc: openembedded-core@lists.openembedded.org; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: Re: [oe-core][PATCH 1/1] qemuboot: predictable network interface
> names
>=20
> I'm pretty sure this is the cause of those failures:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6396/st=
eps/1
> 4/logs/stdio
>=20
> On 05/02/2024 10:56:08-0800, Joe Slater via lists.openembedded.org wrote:
> > From: Joe Slater <joe.slater@windriver.com>
> >
> > Allow interface renaming if 'pni-names' is a distro feature.
> >
> > We do not add QB_NO_PNI to QB_CMDLINE_IP_SLIRP because renaming was
> > never suppressed for slirp.
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  meta/classes-recipe/qemuboot.bbclass | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/qemuboot.bbclass
> > b/meta/classes-recipe/qemuboot.bbclass
> > index ff32aac902..4a2a6f1ef5 100644
> > --- a/meta/classes-recipe/qemuboot.bbclass
> > +++ b/meta/classes-recipe/qemuboot.bbclass
> > @@ -101,8 +101,11 @@ QB_DEFAULT_FSTYPE ?=3D "ext4"
> >  QB_RNG ?=3D "-object rng-random,filename=3D/dev/urandom,id=3Drng0 -dev=
ice
> virtio-rng-pci,rng=3Drng0"
> >  QB_OPT_APPEND ?=3D ""
> >  QB_NETWORK_DEVICE ?=3D "-device virtio-net-pci,netdev=3Dnet0,mac=3D@MA=
C@"
> > +
> > +QB_NO_PNI ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', '=
',
> 'net.ifnames=3D0', d)}"
> >  QB_CMDLINE_IP_SLIRP ?=3D "ip=3Ddhcp"
> > -QB_CMDLINE_IP_TAP ?=3D
> "ip=3D192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.
> 8.8.8 net.ifnames=3D0"
> > +QB_CMDLINE_IP_TAP ?=3D "${QB_NO_PNI}
> ip=3D192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.
> 8.8"
> > +
> >  QB_ROOTFS_EXTRA_OPT ?=3D ""
> >  QB_GRAPHICS ?=3D ""
> >  QB_NFSROOTFS_EXTRA_OPT ?=3D ""
> > --
> > 2.25.1
> >
>=20
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194963):
> https://lists.openembedded.org/g/openembedded-core/message/194963
> > Mute This Topic: https://lists.openembedded.org/mt/104182965/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>=20
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

