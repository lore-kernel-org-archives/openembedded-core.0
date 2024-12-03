Return-Path: <marcus.comstedt@requtech.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAB3D49797
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 09:14:03 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.99])
 by mx.groups.io with SMTP id smtpd.web11.15367.1733217238117597505
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 01:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@requtechse.onmicrosoft.com header.s=selector1-requtechse-onmicrosoft-com header.b=SGQfjhXj;
 spf=pass (domain: requtech.se, ip: 40.107.105.99, mailfrom: marcus.comstedt@requtech.se)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRtxPvonklmpwZarzaFv5KvDV26/6yW1/Q86fDvf2UUksglva2Nw7lZip/KCvi5LD/NblUDna8SKfdS4qpW1D0jf5iaZ2SS7tPmtNx66DjsX6KH/m2RkztkmNn1XeXpnOE/sH1H1270QGEhPUjudkcmzbmiVRoEelWPzEhBOOOHu8nobtu46dzR6pB6IESQQvgz98SEglvDWjbgVEIwbw+ZV2RTlZuuDZgMFFNgmiHH2tGRGOq+XdyaE2ayhGp0awXbTlVZYxlbBnvUwSi5+VAjG+9vU5ncHv9hk1yI/DRnIw9YojF04Qeh+kKBvXwSsjJ9SAB2VgcOWwR4Y254Trw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9JGI64Jr/szFr5NS9c9eGFwNn/NKG20upSmLQxKSbE=;
 b=N0WLChp9g1W4lp044DZJNAkjGcdoH394SZ63CzeFQQH+d4s/N4NIvcGZ2QxJX80Ce25kO/+eQg8nRlqOMCu98Owpb0uXojENqgANHoU87vDjBcBSZzgDiXeOv79TtW6B5+hefoXo675cut9cbuvu+QZRSKjiJRz2pZelmNxufBFEjfqKG9zhDO494lQGHhZw1+WnVXgq0DnxCMwvqU/5taA11bepSmKZaftWD4Idg103Zf4yb9wg3jl9j8XzWOc/gEKr0CRcen3ZAp5q5vgQBsAPotlduyi2LAOFi64iFkIWKfqtmOX3N482zoxKDeLPipY8c8zBiumgnH9CJrioLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=requtech.se; dmarc=pass action=none header.from=requtech.se;
 dkim=pass header.d=requtech.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=requtechse.onmicrosoft.com; s=selector1-requtechse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9JGI64Jr/szFr5NS9c9eGFwNn/NKG20upSmLQxKSbE=;
 b=SGQfjhXjUPRnc/YcnQJ3kCRGjQHeLvAupDqBD0CeXoxfa/tw2GgVo9zD+0YYZzGtaOwlsm4ey+U+6pGknuiRvjeXJUmRABQwi8OX+0Ef5XDQyWfBuR/gvQFn+e8snIoPyYqZu8Z3AhuNv6jEzyzCIqd/B4PCV7CJn55ZBfRSmrM=
Received: from AS8PR03MB7940.eurprd03.prod.outlook.com (2603:10a6:20b:427::23)
 by DB9PR03MB7515.eurprd03.prod.outlook.com (2603:10a6:10:22a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 09:13:54 +0000
Received: from AS8PR03MB7940.eurprd03.prod.outlook.com
 ([fe80::968d:6f52:e45e:3007]) by AS8PR03MB7940.eurprd03.prod.outlook.com
 ([fe80::968d:6f52:e45e:3007%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 09:13:53 +0000
From: Marcus Comstedt <marcus.comstedt@requtech.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Steve Sakoman <steve@sakoman.com>
Subject: [scarthgap][backport] Fix packaging of stale externalsrc recipes
Thread-Topic: [scarthgap][backport] Fix packaging of stale externalsrc recipes
Thread-Index: AQHbRWOsxCghuxOasEGDYzUmUuzyRQ==
Date: Tue, 3 Dec 2024 09:13:53 +0000
Message-ID: <87mshdgmcv.fsf@requtech.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Gnus/5.13 (Gnus v5.13)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=requtech.se;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB7940:EE_|DB9PR03MB7515:EE_
x-ms-office365-filtering-correlation-id: fd89783d-c291-4148-2f8f-08dd137acf04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?VcUdcSw8V/V6s6II/t3FDw8fMtgXsQGAl00xNoeixDzkGK+dcNTgkm/CUO?=
 =?iso-8859-1?Q?7NCfkEKgWbNuyw9hH5XX84mxyDWM4taDs/HELqO6NIbMjjl5J9nFVCmvvz?=
 =?iso-8859-1?Q?HY8AJ4/L2qNbxf02O4dEaCcV07MvDSdgocfDN31EkEY5BxR4HYVBzWGYRQ?=
 =?iso-8859-1?Q?oRStR/5Yt+nbk7+f07uaAlR9WvSavwUuEpRfGMy6dsojNkrs7SZdQYdFmy?=
 =?iso-8859-1?Q?LF6aD1eYZ3BuXa2/HwmJ4ogwaHn3+RFgVL3n2Cbe9yzYB5YD8tpNrMvoMM?=
 =?iso-8859-1?Q?FPVnHpOWjOa3Oqq0zUT8HHR38ERwPxTvEK3uMDz0cO4pldT1SDgJBE4DQr?=
 =?iso-8859-1?Q?VHRt5qEPVNQFiPBoBnnsPJ1mv/fCfHM/QC+TTvRz4n4Zkcx2R2ecjl2M7z?=
 =?iso-8859-1?Q?CoTXx5dSwTPgFESNTknWGxv7CgSzeeUXc8azMaOoncuj6jXL0VB7P02HqN?=
 =?iso-8859-1?Q?r+M79lFO95ZvAVyhl+lCTqZIClgYgA8LgIivr+RLhx27I6nVOkpyT/HQlz?=
 =?iso-8859-1?Q?vIX8cfBII7hur9Y/yS7nykxowPVR7xSWPJlf81WzMfkmOzU6ywq5a0+yqq?=
 =?iso-8859-1?Q?aGq6WhmHjF8U3KDVRk8hvtiRxX9PmqalNk3atqL3FU/8rXPTZnBj6eloAJ?=
 =?iso-8859-1?Q?Jij0NQFEa7FgrGwjeAka8lMg5/U3P1Yufr1tdhccVAQ4s76AHA+qATlXlR?=
 =?iso-8859-1?Q?LwEXPfX6A/PdSbYAPo2jpY0tkoHCa3fwahEGAt1l7iGhbkZF4kC5jjHQdC?=
 =?iso-8859-1?Q?lTb9Hn3rbf96ky4ZkELZyjRp6wv91Zs9kAL4X/BPd7eqg/WxSDgE/WFCJO?=
 =?iso-8859-1?Q?uxXWOqh/Zh7RAVZV9Cys6qb6LVwKp+TyEmqfhY3xNwQE+EWv5nf90zrDh3?=
 =?iso-8859-1?Q?5XQCKLEMH8hkPfVpveiXXnquyDHQRBh+ZTmEHNSE0oCM+bP1F4GTgzSaeH?=
 =?iso-8859-1?Q?zgoe1c6ICxgTFadhhuH7PFIFGfJFzXG7f1OzqTG50uEDh14us6brgeJkCW?=
 =?iso-8859-1?Q?vYfnyVZQH+xi6eQ5A1a/nYb+bn9kOl2ePrAC0GKUWEIRq85OxiTQFcW7g1?=
 =?iso-8859-1?Q?qvHtYTBDfYJlUVs5KzsZVN9Chwoicu8dbdYHR3TBsovG4qlMZ8RJKtGEdr?=
 =?iso-8859-1?Q?f2/iNRjLPe2dzdDXN4N4WNOOhjXDc7XPk4E2xP4mxS/04YcvyAg2UWEYTp?=
 =?iso-8859-1?Q?wM5DKhl9we+5hRz+TviaVphuiOAoT/jqoSEqXLTkL1DlYeX5d2cqJPpY++?=
 =?iso-8859-1?Q?//UwiFdt2xVYKY4ESvUJj+wA84oOJUhvCsSw/lAotf3HWS/zjNFAufL7l8?=
 =?iso-8859-1?Q?bgKdi+d62vALNh1rkQb4e051mFJz4SZDGD2dMAAoOFSleJMOchTSEUSmex?=
 =?iso-8859-1?Q?oSmDpxiUbj0WILzR4lSPZA0pXbx7qcwYsBRg23/c/2X/CKIBtSlR8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB7940.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?MOzBTTVk8IzMiFIgd5eUKRcBY+33tVGDE0Jn/iny3VnzxwWTuGFzOCogi0?=
 =?iso-8859-1?Q?KdSDZm/i+jbWQAwwLc2GUP/Ib0WGvM6mdUhccAkPwfBXh6lCfadiw5cR4l?=
 =?iso-8859-1?Q?hETM08rBzid6YKWdVfT4hYXmDNW+uwpUOU62JiEdXOONJNchtuM7RpcqWJ?=
 =?iso-8859-1?Q?M0A8UK5Lmz+cyECQYrteiY2KGJqBvRJqCg7VomvP/zhfGTrP7vMcdjP3Br?=
 =?iso-8859-1?Q?2lNQ0HvglFFb56b7P3KSvUme+xpzXPvy2JUSMGMyTiC51KQud0zMoJC4gB?=
 =?iso-8859-1?Q?boxDEv10+spBvShLMAwrKo7jpE3f+9YXPiIHBj94l4rGFk9NBhi+jFxwAI?=
 =?iso-8859-1?Q?Fec9Ljs4v78/NSD9Zd0Qd/rTP3Pl0f8qbHU4DM/PqcsmoRWvh+vu8LHiXS?=
 =?iso-8859-1?Q?gW9cPJHGXWB46tbkeLk9W0HAWdy3iCz4WjP5U+sIruEeUW81le4AqIZVNq?=
 =?iso-8859-1?Q?l97K0B0eGPPosJwP2R4eURje3/zxTf6fQAUaEheVGiu4U/fhi+T16ygcy7?=
 =?iso-8859-1?Q?V3JMs66AiHq+3CfH1mDJwNrGQgCXdfrn8ohxnZQ5KisyQ1We9LKMs7QFDW?=
 =?iso-8859-1?Q?reLWtByynIBEZjIVkrw85hvcs8uED0HU8EyQez96hrzOB+5V0d+4/DozCY?=
 =?iso-8859-1?Q?SYQ/OV7FFI90TGZIZVII0UNwmO7fCkv85xjo9bmeIvsJQb9iPGM2Iv8Jkb?=
 =?iso-8859-1?Q?2JcaMWszlZT6M4QAHH6H3r9DXLWXt4h2Yb0EjvZCDTd3KiOz+ogj8p61Ml?=
 =?iso-8859-1?Q?hr0/5Ubo7Vuh1yt1JfsjMAk0Btx7XANY3oz6bEyefVVukiBgjc5WAGiTGf?=
 =?iso-8859-1?Q?mBuTTVRS/Ktszm/a2+T9n0xll2dJANTmn8dO5VtHQ9ZQYgn3Ph9J19gCMZ?=
 =?iso-8859-1?Q?BzTv8ZNgSWRyGALdXBzI73Ktg6FhUY0YxlnjFhXFmuifoWaim6VXgpxC+v?=
 =?iso-8859-1?Q?wDApZnPrG17qc+uIxkDnYdaD1gNbDNHA3KBn4HnS9cUIVITe7DDZCUi3YI?=
 =?iso-8859-1?Q?2iQ0QwHqFRo9ciKbXMnWoCNwA8IAcB6x2cyDVYSmscBYFmcA/R9Q+6Gfbc?=
 =?iso-8859-1?Q?sZ5TaZsz9NOk3jXeo0OXTFJbxmGyR6tuXEOcKNhKv9zgblP6Wc880npQ03?=
 =?iso-8859-1?Q?IEJLA86SsdHomleohfpVgJR1AmA5UVsl+Tf/ZLgqvR7zO/5A0+6peB6O3p?=
 =?iso-8859-1?Q?Nfmxa51DBX7+GK+It7h/zovnhAQKaGncKXD6gTmI2v/X5yQ61VvHQVa+0E?=
 =?iso-8859-1?Q?H6bxjXBYbQb4FuFUeSU8fidFJ/njC+uea9OOVb6svCLN6V4pS2X1SMJdbL?=
 =?iso-8859-1?Q?owYsBwb73dzKIwgvseXLacCdvEaxbe9G/2IwNjNb8bg4KzMLO81/SLxd7G?=
 =?iso-8859-1?Q?6/ZO6Bl4lFuChh4fGP1DoephUpcsusjRk5mbLPBhJOXysoLalrvG7TYEMh?=
 =?iso-8859-1?Q?KC3cZ2AMRZL4a78Q56Nx0rpyyM56IHHbf0Q7Gp0u8WY8o5dBkYIUpbwYdV?=
 =?iso-8859-1?Q?UFf5oJZFy3yBeeXr70NFQpb+0c60Fq1ZxGUCqJu3DxlCWse7gVpoujpOHE?=
 =?iso-8859-1?Q?0uzyyhBcSI89toUgs18FLQV7bC0K/K57dZCjT3XHFmPvLaZhjayH6B+HGg?=
 =?iso-8859-1?Q?Nr41/mQXO3sNAhRaNxIdWYzaJg8X77fwXG89h+qHTm0juI/o8jz7spqg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: requtech.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB7940.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd89783d-c291-4148-2f8f-08dd137acf04
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 09:13:53.6083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e044354c-f2a5-4c20-982c-eca7968ce9ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WJKZWjlPaEKqkfvcKgJqRh15ZY51+8n+svXDquaz/j0Fz5yS/fYggupOCeh0g+B4B1HLLJJLG8vz464VwkNyRHTM+SmKYPVpzUHUVcbUpPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7515
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 09:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208183


Hi.

After upgrading from dunfell to scarthgap (due to the EOL of the
former), I discovered that bitbake would occasionally package versions
of externalsrc packages that did not contain the latest changes.

The details are in this bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15646

As Ross Burton noted, this issue has already been identified and fixed
on master, in commit

475759fdab7200488b2a568b2ba1aa31a456d113

I have verified that this commit can be cleanly cherry-picked to
scarthgap and does indeed fix the issue.

Since this is a rather serious issue (at least to me, and probably
anyone else using the same externalsrc recipe in more than one yocto
build), I would like to see this commit backported to the scarthgap
branch.  The only alternative for me would be to fork openembedded-core
in order to do the cherry-pick myself.

I believe the same issue applies to kirkstone, although I have no
personal stake in it getting backported to that branch.  And the same
for non-LTS branch styhead.  All other affected branches are EOL, AFAICT.

Thanks


  // Marcus


