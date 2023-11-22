Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E31FC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 10:48:07 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.82])
 by mx.groups.io with SMTP id smtpd.web10.16542.1700650077155555998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 02:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=L0F6IjeX;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.82, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNiwKL1Jo3DOy9NhsKlx36YsqEVB5Yf+LHSaXmDzYCMjKnVXlLC4WFpv5slAdyEnXqH/UjWNEd5BW/yN+kXWthonCV4zgbFLC8lzm4rXNzA4V5X4klijK8mdaTZf2i4tumgtslgBq82bUD+g3WPoG5imYzNxhGl6mgOuEz+3OB+NvwJc/Oal7U7aqBxFEBt7mOLe9zA23pF52JeZolipcUqG5qTxI9YRRjjv+x8cWToc6EsCE53cl6ckuwF4OnIlyyMP49g34nbMXsf2r3Uxa9RbZIPc1qJ4tOQgFB6NAszt1HOJbdV2WfGVtVV8Jb5uoz9llIWjNBBnFvOR0cyFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ex43j3CwF25gxiO6tfSppeymFabKH+Cl1j6PzsRqV4c=;
 b=JfGox66f/i8PM/A7c+ayZxErTsrBEWDLZBg6P772jFsIGvcG48kYr/xuHrQBPyvJa5jMwarXFcQWPUoo/WYRkuKjTSAdpBG+RAIfQ9Q3FRuQ+WQRSdnVlcW00w2nkFnpJo3X0401qoiHV5SZ5T6fpteWvZ595lnerHeIEGDGtHwjGx8EsR4YRSzVeAl78Oju160IwNhcYsUunHNpUW2ePvByJlivUrvXUIENrcS6gZU130mRccltZNhI9CxSJnQBlMhYR+e8lxORLcmV06vbNopvh20gP4DVpVY2EbLGQNcrJ2uYWJT1kFDzn+bg8+Jy5doAUQNQl6LcXF92C+u8Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ex43j3CwF25gxiO6tfSppeymFabKH+Cl1j6PzsRqV4c=;
 b=L0F6IjeXVLVDRN/a2Ad3yqCiCSTV/7fDDRlsyjurLlQHq0i+1Ry+LX6aEucIEa0lfIP5JeGKaIZqi3sKMJNLbi1PT2fdo5dT3+gM1Jr8hpzdB23iPtlAy8PS/0QIFJQDk8LR/oYs7aq18m+GTfY1cJmjXTA9C8hAbGC5zHgqQ8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PAXPR08MB6493.eurprd08.prod.outlook.com (2603:10a6:102:15a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 10:47:53 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 10:47:53 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [meta-oe][PATCH v2 0/1] wic: extend empty plugin with options to write zeros to partiton
Date: Wed, 22 Nov 2023 11:47:46 +0100
Message-ID: <cover.1700646304.git.lukas.funke@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PAXPR08MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ccd3beb-8781-4ed3-3a31-08dbeb487ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jdQKUHyCDu9oBTBMJVIiVAQ/JuUK/qFLF2olusSMloAp0L+TmBWJgO7RFmW9HWNQ1BVuDqMWRfP2hBJzx6guoVQOO0GSTyP6WeHArp5KgwFiwlh6VJGU3bLnaSoCsOBSH4OV6YvUWZSNiqsOg4NocUUzkXEjjmuM/2WYvq7SPOzfxm1u46Ks0xJprYzK0wxWyAkLUwH8fIrQzssJics3My60n4GRaAfYd8cmrPEhp+5sQPrNRe43nxT6gZ2fpj42AZBrOpS8sX99CdtaM5Goz1my7/oxx2NFMnnrBMf//qp2/r9OOQqevLRSup+YuvkoO3hxByOMGsoAOvB6jleNxJPInyv50nc+JDJxrQlOR3Aa3W1+r2e+muUJE+weCjibLkwKGk0/9oY+NOrI2GpfrIRfrG+P2udjVpX9mkJZCDqN3rhkDrlgBN4hzNFLCCbWtq0n7u2c0mnW6J560WrHt33D98dbwwmGc6kf1Jw9wZHTuN/B2Jw8GezKu9RqwsvTuG2z8jtus1Fwnf4TehYtFTE9n6AfSnJ3mD4sasfVLXcrqsS1Kes9JxIe+/uWDsXS7Y6EaNDz2+O4GdAxWAB5pkhvpMSVRXlrWvn/KeErZ9ksPTFM6OsSDIJ1t6KVBoFa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38350700005)(36756003)(86362001)(6512007)(2616005)(6506007)(8936002)(4326008)(8676002)(52116002)(26005)(83380400001)(107886003)(2906002)(66946007)(6916009)(4744005)(316002)(54906003)(66476007)(66556008)(5660300002)(6666004)(478600001)(6486002)(38100700002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A7MCpCGwSJ16QOl6CiSqOnTCHHNZVro0tb1cf2Uppi52YcNPpHHegKFE7f6T?=
 =?us-ascii?Q?0zSCjdpHHNe820ynrOoSNCsewLZaO4C293Ur7s32dXvDjQyBHwimPhHEaoye?=
 =?us-ascii?Q?AsMWACZgH96joTUeG7gf4lG65DBTgrEsEyfev3B748FKadRq1I/vpILG/4Dn?=
 =?us-ascii?Q?xJbWZsIefDxTnsIUVF8s/RtAFPTKWdEr3CuxSWuh9U4XmRQqJoWu+j58rpy/?=
 =?us-ascii?Q?MIL/TavwAKTVcIGmdlXbTX3KYIA0WvlrBdwv27TjUkFb35M6Z9/cxQJbau8V?=
 =?us-ascii?Q?tBHVKCmcYYDEkFPTvbwv3MGnK9bOXH09xpBUWZnhtRS+654OcIjfkyauF4Ku?=
 =?us-ascii?Q?qemoQxZ0nE6HqsZC+f9f5SeReTXvlgfGTcLb4noaWJ/b81fqYeoqqiT4frSz?=
 =?us-ascii?Q?mWhFip8BHqaMv7SDD8cqS6097mxuiKAm7aBbBw5LeMfMDrRyYlW2y4gda8Yp?=
 =?us-ascii?Q?Hv0j72HQuZufaka799M0udORkEVhmXRQ7PcgmAnZrz2/zi1cC//QiGGXT1No?=
 =?us-ascii?Q?VvWhRtdHM/KRDojzX4RDaRhZX0QFNAuxPKePKqspo7jn3J31b1fstS8Davwi?=
 =?us-ascii?Q?bG08zOC9JvIP6tt0krhj/zpzka61PWzp9uMi68CfQW0l/2XVv8KudziQjF50?=
 =?us-ascii?Q?IUU0WIH/2UfRzWWlHrpXKGYxMI2+UrxAB3KVL1V7jzaRn8ec3e+kMFN1IJuj?=
 =?us-ascii?Q?GIUyuqYdYcJToSpj85MBGvhUNx6jdW6c+BcA3n8T2rqqxAxcocClQYAYsojZ?=
 =?us-ascii?Q?D0El+12H3iYJgXRfSe2lY5ksuAgccSWVhUF4ikSdXWeJZIQHnioPITWE+qhF?=
 =?us-ascii?Q?BMArBnQpjXI+jhZwFOshRognSYvXUtUnY0UmEpHtl5rI/lGPd+1QSoksixUT?=
 =?us-ascii?Q?orgwbXTPUVjLksBOTz4+v0vDVQZRDDmCr+/w17d1F4VbqU/tK63tjvgF/N/F?=
 =?us-ascii?Q?fvHTROcXF2a6QarRcnYAkYsM62L0V2UKEfk6tIvXeAvr85oiWGBWp/upM/yl?=
 =?us-ascii?Q?5nGX7Tv9f9/2d6uEKN5EgIg1qXNAYvLJPxZ+gB3XVejGo7ThlXtp9GFeZNIA?=
 =?us-ascii?Q?8ICOGe3L0CXyolgn/utBzx8L658jM1MUZlc2rsP20DMEMSO7z1VRqSyc+fRm?=
 =?us-ascii?Q?IZ4bW5TNwJRafiEOAlkPTQTfqamf9FwDEJ+OWyDbcNgBXmJmXDVcDdWi+vVF?=
 =?us-ascii?Q?2VYY7MIQr0aqBu2ZsG2y7WfUiy6NEfGIGih0WSTblt8SFyD4gxshb+q7sYdo?=
 =?us-ascii?Q?UTHzirb3puNpTxvZoPV7rxA8GWYI4TWlVXLKDrJKmYo5J9i8oyNc8W1Mzc+5?=
 =?us-ascii?Q?cGNEoZICj9fyVmmAKMZCcSiUDmndYFK2L/jhAFnQ0aYIxsnv7KGrD317zbrg?=
 =?us-ascii?Q?3AmyziYOF22A7wjsu0KvxQ910nbDvoG2m1B35FhKcAArIBtGL1Htc8ioKBoJ?=
 =?us-ascii?Q?LNehb4MRW3TtyrNgD3vZZ/bVHUiGEiKAOIzGMLPqgFG/1GX6HgyVZar/e+o8?=
 =?us-ascii?Q?72lyt+z9s8s5u8zjONj3C5T/xVMoi6TuCxVmddpLDnETeQYvIljrvnP9nU+d?=
 =?us-ascii?Q?SQG+8cHMF0oy40g3e+m3B0Pv027U8DS/FYg0UDv9wisYBZckRElbpFBi4Ntw?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccd3beb-8781-4ed3-3a31-08dbeb487ab9
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:47:53.3512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgZZLxbr4PFtU6N6AWiS6jtFYXhjGpmKHN5H53ZWn36HclSlUpiE5oOaH7Ls3pEe8BAKbuu2dL46o9NFNNgFTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 10:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191057

From: Lukas Funke <lukas.funke@weidmueller.com>

Adds features to explicitly write zeros to the start of the
partition. This is useful to overwrite old content like
filesystem signatures which may be re-recognized otherwise.

The new features can be enabled with
'--soucreparams=3D"[fill|size=3D<N>[S|s|K|k|M|G]][,][bs=3D<N>[S|s|K|k|M|G]]=
"'
Conflicting or missing options throw errors.

The features are:
- fill
  Fill the entire partition with zeros. Requires '--fixed-size' option
  to be set.
- size=3D<N>[S|s|K|k|M|G]
  Set the first N bytes of the partition to zero. Default unit is 'K'.
- bs=3D<N>[S|s|K|k|M|G]
  Write at most N bytes at a time during source file creation.
  Defaults to '1M'. Default unit is 'K'.

Changed in v2:
 - Added SoB
---

Malte Schmidt (1):
  wic: extend empty plugin with options to write zeros to partiton

 scripts/lib/wic/plugins/source/empty.py | 57 ++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

--=20
2.30.2


