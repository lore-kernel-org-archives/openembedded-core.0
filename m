Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2D5EB64DD
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 01:17:35 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.42])
 by mx.groups.io with SMTP id smtpd.web11.4945.1690939051365341664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 18:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=XaXldlKz;
 spf=pass (domain: welotec.com, ip: 40.107.8.42, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ib+blWY3ptb7UnThkRd1LmBAHe3Sbp639/JjLMDj4GkpCjLx3uss8NaGQt/U2UKlgW9KZRZVKsCXb/5zFey99tUuSDfclefGjMP8q6dLtTKnhweMHZ86aXvqiKqE0xQ1lWhq0w/ntzMo9lioDcuxCoPfCED9qKzcnmpMkjaM8Bu133U3w0IF7t98npzKC8f1OGFJYUuou3repTAQDc56OsU+jjpydT1ZsQNap/p6mF1cFfW2PLtcvw7XYxumakvW1hG+DwFMC5lNb37sRR3/aidVAzPR4+Bfs5Ktagf5PMLhDDi4hlYGt8023AvHN2NR3KWXrUcbnrGZ4rFdsjK8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktw1vBzYfMRymZQMyvJw0oLDu8lfJyhT7Nc88NucWGQ=;
 b=g9el10wtDTOLBI1XKOXZGNsz10TJh8lN1o+VHeFlRkhHJtxnksCDSO+KR+jlfpvkl1gWajPC48wdohBA9QeJ9dWxYmBONGnlvqCFvMswg8meFiN9oV1FaWeFf/VauYjuDLoZ6+7z9cuwh1Meg3AlvANKx7E5KC0Kaxuh5Uth/mAZ4gjSVYOJTSpp73w4JvWhOgIzQ4lWVCITvGYOz/7BYnuGYt3En97G7nFlKXjPyzDMMtWNNow5WB7TgiVUqq55HuyHiYOE/EOc8hY4ae4IcEoNQCIbDjktiRGgJAPTOqOsdwIuP+c1dz5JBhJd7E1jx6y1UX0lcObAxJmXGj5E7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktw1vBzYfMRymZQMyvJw0oLDu8lfJyhT7Nc88NucWGQ=;
 b=XaXldlKz6l21YFh8Ka/AEmFdpEOCDuOOGy8ylS0hyJ4mdamRxDIDJzXhJBJ22IyJKjB6u+qNxyAJzWFn5/gC1pyAx5BTJ3b5a+9eUyFblkQcMEYCjjjrMia0BqzyMYaYp9h63whj6M6UFy3cCHVU/46tTEdxlFCc5hXmmoqUIcE=
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com (2603:10a6:20b:9c::17)
 by AM7PR04MB6872.eurprd04.prod.outlook.com (2603:10a6:20b:106::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 01:17:26 +0000
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53]) by AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 01:17:26 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>, =?iso-8859-2?Q?Piotr_=A3obacz?=
	<p.lobacz@welotec.com>
CC: Joshua Watt <JPEWhacker@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alex Stewart
	<alex.stewart@ni.com>
Subject: ODP: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Topic: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Index: 
 AQHZw+GoIkE0W6fK8k+8nz7vZaP5pK/UO6gAgAAW+ACAAA8KgIAAASbogAAAXL+AAQZxAIAAA5o+gAARULGAABcLAIAAAz64gACZVrU=
Date: Wed, 2 Aug 2023 01:17:26 +0000
Message-ID: 
 <AM6PR04MB5368ED68378D39F07CE65549910BA@AM6PR04MB5368.eurprd04.prod.outlook.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
	 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <20230727141809d2150cbd@mail.local>
	 <17762A3A069807A3.31298@lists.openembedded.org>
	 <VI1PR04MB537349F74CD4C3E13B272B879105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <VI1PR04MB5373AB9F0C887CF659E739439105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <CAJdd5GYifrOT_9-fct6TT95sw6tDe0L7etLxOcaEgTTGvWFPJg@mail.gmail.com>
	 <972083f47f3513fada3dc64c233f2c229f952aca.camel@linuxfoundation.org>
	 <177710C9CE043B33.12785@lists.openembedded.org>
	 <AM6PR04MB5368B2FF63E716221B740A029105A@AM6PR04MB5368.eurprd04.prod.outlook.com>
	 <CA+chaQfRM855mvJwnxvUKk_JpXq51AS7uXuqM0qv=Uayj4OQNg@mail.gmail.com>
	 <1777455C95C57250.15736@lists.openembedded.org>
	 <VI1PR04MB5373E8E3C680850A6293BC9D910AA@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <2fa1c6d32bae5fad13dba22c328d41063a519eeb.camel@linuxfoundation.org>
 <17774DB8C4C2BE4F.15736@lists.openembedded.org>
In-Reply-To: <17774DB8C4C2BE4F.15736@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5368:EE_|AM7PR04MB6872:EE_
x-ms-office365-filtering-correlation-id: 74de3288-029b-4fbb-b209-08db92f63b85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4fEX96i9zjt/10iBufn/vBxZalGOzppMOMsT10YdjCHEKrXVGYOHddKEaT41zALJvkdv5oUARlzpJ/HTjt8b8rSCLAzANk8AuPGDlq77tcOXbXIVEamMxykFAajqQWbjU/M8wiEakGUcV8DDV1DizVipmTkYNFyisL7ugefKr/ti6Npx8JEeqtGjx86h5WVZMF0hHj5byGObm2L0K4nSzO4vAm2MpvxrcA3SO9+VJaNk4UysXz0UvOu1po74kp1NkC1NalSdfjNp0XXOXW81AIZsWhFeuXAi+ceW9f1LwJ3N21orp6uB5n2xe+jwFlR1s3YUNCDv8HZQVmtiasCuJ9tvvXfRqWCNhyCHB5NXCVB4yfrTVBc+qmg2KmAP+Q9S0W+0FyP5gM0HxaMNmasC3bkUxlwjAdL+NNP2K90IxuxYoumPMO3R/ussi0oH8lLhCK1ftYQI/oU6dCXLxRQBCwZL7KGA2YSXC5mjKmnHWeA5d0BXo/ACJnhkXkU+EVh/l5j7GQHFwyFkdcLe+rzeDzxOk3pJNtRlzG/I8ssKSR5oepIy61yq7wABGUaTRcrOFCqEsxt1FLIywqf/HHU9P1dxQ3Ewq3TJzG5M9af0NCY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5368.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39830400003)(451199021)(6506007)(122000001)(26005)(38100700002)(45080400002)(110136005)(478600001)(33656002)(5660300002)(8676002)(52536014)(54906003)(8936002)(91956017)(4326008)(66446008)(66476007)(66556008)(66946007)(76116006)(64756008)(966005)(71200400001)(9686003)(86362001)(55016003)(41300700001)(316002)(7696005)(66574015)(186003)(38070700005)(4001150100001)(2906002)(30864003)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?ErqxyvHKaKIogAKwQ0BkbSeuNB0qYMee8ka8/nW4YafJrmyAsuActQYRD9?=
 =?iso-8859-2?Q?7ioLwum3Wi57QWU/3VcU+/pgKgQw8w38Q9uKw6lgmVbH1ZrBPSjRXdgX8j?=
 =?iso-8859-2?Q?zZJQYPtU9iVGtlwiJZOQd+TpRbMDYyRnsxEMz+ddkM1N2IWAR3v4ztVDG+?=
 =?iso-8859-2?Q?p8LxomYIY7YrvbpMzyjcZFZQsQFNvEzK5iTKxuqpWpAy3Bmt3gkd7ABWqu?=
 =?iso-8859-2?Q?Z7dPkGgB/yMABdrWmuZUkfPAUOSlRFGiFz7HOMcw3+gtsC+qfdJf5bi7k8?=
 =?iso-8859-2?Q?EVQ3qKvvtel97KBskOxK+rr5hnJmUrNtq4WS9CCNEdMo0oa8l/oBkBnAng?=
 =?iso-8859-2?Q?jXHN0hmny14cP9o/oX2+NdSgivdQC9jnfk2DmYezeg7K1nVg26fOjsq342?=
 =?iso-8859-2?Q?a2ViSL0yoF0PGYqLAN5tgFNeDy4l+zGVJcRFIwfvhpcyjUpqAACL+5H9rN?=
 =?iso-8859-2?Q?+HfjHnis8Mo3jQY+Me4yuByqQXF/7OwiXuZWuU9e5unpDOpmcEK1je9MW7?=
 =?iso-8859-2?Q?xb+HzUimRoYNXeAkp8+QX14IUmMwH+zyAsxNWux+Jk0MMKLKqcTqXOcHC2?=
 =?iso-8859-2?Q?1Vc/+BWZe0snGzlI2zHQsKPb48zTvIoEeniQCCoIkDkN3iouWhIKqzIo+I?=
 =?iso-8859-2?Q?H3roVCeVLcj29t6T21E+x2xVMHxHWATcF8UIbZalKgK7yw2hiPCVZ4k3tw?=
 =?iso-8859-2?Q?V9IJ0zg8N2c7Wqi9Fc0Gm+goIBurXmjw72F9l++k6XRZ3/kkG492a0Q9Cn?=
 =?iso-8859-2?Q?UJ/vsJ8BOZqTbN5cjq8h7+ER1csTZiXRdX/1C0daVt1khFh2URJTNBPPC0?=
 =?iso-8859-2?Q?WrgHgS4cy9jybVDggiHQK+H+4tqzblby6/s74jGNHrkakS5n0NywjJkocn?=
 =?iso-8859-2?Q?bWxuomJqj64DJBJwV5efT7R+KegDEi5E0BhOcDlIxvA6a/p2sz70439gKd?=
 =?iso-8859-2?Q?Kc5PWbsQwgcflKCN5rnwAehuKtFSfZndhjcH0Ee1np4cgm0T3yh9dFI3Er?=
 =?iso-8859-2?Q?T9ZqhIfpfN/gKcNNmwwkn/X56e13Gj2j2un2BEgYnvfnv5fc/IZ2T+HnD0?=
 =?iso-8859-2?Q?rAA8s+UBZtdqoNke+Ed+khhzfDbQwUkom8yEsg7aPr8TCNI0DG5AdwCz2+?=
 =?iso-8859-2?Q?DFxIwr2IjiiwzSAYnmwZr0GWf9cgGlHMcDHw82dPJ2RBuKrDniIOlhxysP?=
 =?iso-8859-2?Q?wtO6gBWK1LZyzeLTjkW733E4zn/+ZiZG1gj3khqE75g3ZSF2et/zS+MDtJ?=
 =?iso-8859-2?Q?PbmoBQGEM83eHIlarJQL0IqfBlE59Vy/zX2rxNxD9q/IGnEpAH3xtKORvH?=
 =?iso-8859-2?Q?qXMkLsPH18l4SqcdyZUs/sMsV+N1AkjZ7PROo84PZ8KjOc09DgAHp9Qev3?=
 =?iso-8859-2?Q?2F+EnOxw1eZOd2TpU98fSb4wey03kdAcJpCeGQumZ2xIl0Z4iENhI0Hs9t?=
 =?iso-8859-2?Q?IFHgVLuRr9mCgI++lR350f9Q//6kxLFGE6lxlygsCgi86gh5LmNBjTP3up?=
 =?iso-8859-2?Q?TRtu6qWLa6EVVKxzWmkhjhJNwXi4vnw08C11V5BZ2mgpnefs5lgShMAq+o?=
 =?iso-8859-2?Q?/nd6o10xlin9r4xUX19vU9Xu9NWykbaJJ+TzjgDIKXIY9B/uVz24/v/dkS?=
 =?iso-8859-2?Q?AUO5vmp3UgnpI=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5368.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74de3288-029b-4fbb-b209-08db92f63b85
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 01:17:26.1275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UaZmfcLD78uO8izYvmoPuSTj+E03MtEpgX1AKnBdtsX+NIblg+PlA1XKauN32G2b3hOsJ7dupTQV6RSVeqVpDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6872
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 01:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185368

Hi Richard,
back again, you were absolutely right I have added in here https://git.yoct=
oproject.org/poky/tree/meta/classes-global/sstate.bbclass#n847
stupid check `ls -R --full-time "${SSTATE_BUILDDIR}" >> /media/plobacz/9582=
beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/sstate_pkg.log`
and than run again the test.

Now, I'm sorry for this huge spam but I want to show what happens:

${SSTATE_PKG}=3D/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-co=
ntrib/build/sstate-cache/81/96/sstate:acpid:core2-64-poky-linux:2.0.34:r0:c=
ore2-64:11:8196f1f3e3094158d888b6ead4b56624c52fa363d1133c447bfc88398e5f7fc6=
_package.tar.zst ${SSTATE_BUILDDIR}=3D/media/plobacz/9582beb9-8774-4d4d-976=
f-63a6f1c87c13/poky-contrib/build-st/reproducibleA/tmp/work/core2-64-poky-l=
inux/acpid/2.0.34-r0/sstate-build-package/
/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/:
total 12
drwxr-xr-x 5 root root 4096 2022-09-16 01:24:42.000000000 +0000 package
drwxr-xr-x 9 root root 4096 2022-09-16 01:24:42.000000000 +0000 packages-sp=
lit
drwxr-xr-x 7 root root 4096 2022-09-16 01:24:42.000000000 +0000 pkgdata

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package:
total 12
drwxr-xr-x 4 root root 4096 2022-09-16 01:24:42.000000000 +0000 etc
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 lib
drwxr-xr-x 6 root root 4096 2022-09-16 01:24:42.000000000 +0000 usr

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/etc:
total 8
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpi
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 init.d

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/etc/acpi:
total 4
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 events

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/etc/acpi/events:
total 0

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/etc/init.d:
total 4
-rwxr-xr-x 2 root root 728 2022-09-16 01:24:42.000000000 +0000 acpid

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/lib:
total 4
drwxr-xr-x 4 root root 4096 2022-09-16 01:24:42.000000000 +0000 systemd

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/lib/systemd:
total 8
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 system
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 system-pres=
et

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/lib/systemd/system:
total 4
-rw-r--r-- 2 root root 145 2022-09-16 01:24:42.000000000 +0000 acpid.servic=
e

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/lib/systemd/system-preset:
total 4
-rw-r--r-- 2 root root 21 2022-09-16 01:24:42.000000000 +0000 98-acpid.pres=
et

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr:
total 16
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 bin
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 sbin
drwxr-xr-x 4 root root 4096 2022-09-16 01:24:42.000000000 +0000 share
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 src

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr/bin:
total 44
-rwxr-xr-x 2 root root 43008 2022-09-16 01:24:42.000000000 +0000 acpi_liste=
n

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr/sbin:
total 288
-rwxr-xr-x 2 root root 193320 2022-09-16 01:24:42.000000000 +0000 acpid
-rwxr-xr-x 2 root root  94856 2022-09-16 01:24:42.000000000 +0000 kacpimon

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr/share:
total 8
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 doc
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 man

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr/share/doc:
total 4
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpid

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr/share/doc/acpid:
total 60
-rw-r--r-- 2 root root 27404 2022-09-16 01:24:42.000000000 +0000 Changelog
-rw-r--r-- 2 root root 17982 2022-09-16 01:24:42.000000000 +0000 COPYING
-rw-r--r-- 2 root root  3069 2022-09-16 01:24:42.000000000 +0000 README
-rw-r--r-- 2 root root  3639 2022-09-16 01:24:42.000000000 +0000 TESTPLAN
-rw-r--r-- 2 root root  1289 2022-09-16 01:24:42.000000000 +0000 TODO

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr/share/man:
total 4
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 man8

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr/share/man/man8:
total 20
-rw-r--r-- 2 root root 9927 2022-09-16 01:24:42.000000000 +0000 acpid.8
-rw-r--r-- 2 root root 1296 2022-09-16 01:24:42.000000000 +0000 acpi_listen=
.8
-rw-r--r-- 2 root root 2280 2022-09-16 01:24:42.000000000 +0000 kacpimon.8

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr/src:
total 4
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 debug

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr/src/debug:
total 4
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpid

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr/src/debug/acpid:
total 4
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 2.0.34-r0

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr/src/debug/acpid/2.0.34-r0:
total 192
-rw-r--r-- 3 root root 10934 2019-07-31 12:21:00.861236271 +0000 acpid.c
-rw-r--r-- 3 root root  1670 2018-04-10 23:51:39.467499913 +0000 acpid.h
-rw-r--r-- 3 root root   878 2009-04-29 14:37:13.000000000 +0000 acpi_genet=
link.h
-rw-r--r-- 3 root root  7339 2012-02-16 20:24:42.515701450 +0000 acpi_ids.c
-rw-r--r-- 3 root root  1118 2012-02-16 20:24:42.544701444 +0000 acpi_ids.h
-rw-r--r-- 3 root root  5264 2015-07-28 22:32:35.499948465 +0000 acpi_liste=
n.c
-rw-r--r-- 3 root root  4583 2013-08-15 22:49:18.764134072 +0000 connection=
_list.c
-rw-r--r-- 3 root root  2725 2013-08-15 20:24:07.562169686 +0000 connection=
_list.h
-rw-r--r-- 3 root root 17402 2018-03-29 15:07:23.716843024 +0000 event.c
-rw-r--r-- 3 root root  1288 2013-12-19 02:42:46.529591162 +0000 event.h
-rw-r--r-- 3 root root  1656 2009-04-29 14:37:13.000000000 +0000 genetlink.=
h
-rw-r--r-- 3 root root  4943 2021-08-29 16:46:00.558827438 +0000 inotify_ha=
ndler.c
-rw-r--r-- 3 root root  1094 2009-11-09 22:03:27.000000000 +0000 inotify_ha=
ndler.h
-rw-r--r-- 3 root root 18544 2022-08-15 14:38:03.122942190 +0000 input_laye=
r.c
-rw-r--r-- 3 root root  1257 2009-11-09 23:16:59.000000000 +0000 input_laye=
r.h
drwxr-xr-x 2 root root  4096 2022-09-16 01:24:42.000000000 +0000 kacpimon
-rw-r--r-- 3 root root 13746 2021-09-20 01:31:56.196781952 +0000 libnetlink=
.c
-rw-r--r-- 3 root root  3028 2021-09-20 01:30:25.930632950 +0000 libnetlink=
.h
-rw-r--r-- 3 root root  1401 2018-03-29 15:08:05.842574608 +0000 log.c
-rw-r--r-- 3 root root  1269 2018-03-29 15:08:02.566518016 +0000 log.h
-rw-r--r-- 3 root root  6155 2021-09-20 01:32:03.418793923 +0000 netlink.c
-rw-r--r-- 3 root root  1066 2009-04-29 14:37:13.000000000 +0000 netlink.h
-rw-r--r-- 3 root root  4876 2015-07-28 22:32:35.453948235 +0000 proc.c
-rw-r--r-- 3 root root  1066 2012-02-16 20:25:02.924701352 +0000 proc.h
-rw-r--r-- 3 root root  5018 2022-09-16 01:24:42.000000000 +0000 sock.c
-rw-r--r-- 3 root root  1198 2012-02-16 20:25:02.925701357 +0000 sock.h
-rw-r--r-- 3 root root  3007 2016-01-27 16:13:18.836936981 +0000 ud_socket.=
c
-rw-r--r-- 3 root root   352 2012-03-20 23:54:18.929518037 +0000 ud_socket.=
h

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/package/usr/src/debug/acpid/2.0.34-r0/kacpimon:
total 80
-rw-r--r-- 3 root root   878 2007-07-20 06:30:46.000000000 +0000 acpi_genet=
link.h
-rw-r--r-- 3 root root  7172 2012-02-17 04:09:31.971838002 +0000 acpi_ids.c
-rw-r--r-- 3 root root  1118 2012-02-17 04:02:39.842852687 +0000 acpi_ids.h
-rw-r--r-- 3 root root  2788 2018-11-07 00:17:33.622466168 +0000 connection=
_list.c
-rw-r--r-- 3 root root  1851 2013-08-15 20:23:36.896169812 +0000 connection=
_list.h
-rw-r--r-- 3 root root  1656 2008-11-10 00:45:55.000000000 +0000 genetlink.=
h
-rw-r--r-- 3 root root  4075 2012-02-17 04:10:45.463835383 +0000 input_laye=
r.c
-rw-r--r-- 3 root root  1151 2008-11-13 23:40:17.000000000 +0000 input_laye=
r.h
-rw-r--r-- 3 root root  4650 2012-02-17 04:13:20.288829866 +0000 kacpimon.c
-rw-r--r-- 3 root root  1180 2008-12-14 22:09:24.000000000 +0000 kacpimon.h
-rw-r--r-- 3 root root 13720 2021-09-20 01:32:49.077869766 +0000 libnetlink=
.c
-rw-r--r-- 3 root root  3051 2021-09-20 01:32:38.182851644 +0000 libnetlink=
.h
-rw-r--r-- 3 root root  5304 2012-02-17 04:15:01.295826266 +0000 netlink.c
-rw-r--r-- 3 root root  1066 2008-11-13 23:40:06.000000000 +0000 netlink.h

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split:
total 32
drwxrwxrwx 5 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpid
drwxrwxrwx 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpid-dbg
drwxrwxrwx 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpid-dev
drwxrwxrwx 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpid-doc
drwxrwxrwx 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpid-local=
e
-rw-r--r-- 1 root root   16 2022-09-16 01:24:42.000000000 +0000 acpid.shlib=
deps
drwxrwxrwx 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpid-src
drwxrwxrwx 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpid-stati=
cdev

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid:
total 12
drwxr-xr-x 4 root root 4096 2022-09-16 01:24:42.000000000 +0000 etc
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 lib
drwxr-xr-x 4 root root 4096 2022-09-16 01:24:42.000000000 +0000 usr

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid/etc:
total 8
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpi
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 init.d

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid/etc/acpi:
total 4
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 events

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid/etc/acpi/events:
total 0

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid/etc/init.d:
total 4
-rwxr-xr-x 2 root root 728 2022-09-16 01:24:42.000000000 +0000 acpid

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid/lib:
total 4
drwxr-xr-x 4 root root 4096 2022-09-16 01:24:42.000000000 +0000 systemd

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid/lib/systemd:
total 8
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 system
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 system-pres=
et

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid/lib/systemd/system:
total 4
-rw-r--r-- 2 root root 145 2022-09-16 01:24:42.000000000 +0000 acpid.servic=
e

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid/lib/systemd/system-preset:
total 4
-rw-r--r-- 2 root root 21 2022-09-16 01:24:42.000000000 +0000 98-acpid.pres=
et

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid/usr:
total 8
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 bin
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 sbin

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid/usr/bin:
total 44
-rwxr-xr-x 2 root root 43008 2022-09-16 01:24:42.000000000 +0000 acpi_liste=
n

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid/usr/sbin:
total 288
-rwxr-xr-x 2 root root 193320 2022-09-16 01:24:42.000000000 +0000 acpid
-rwxr-xr-x 2 root root  94856 2022-09-16 01:24:42.000000000 +0000 kacpimon

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-dbg:
total 4
drwxr-xr-x 4 root root 4096 2022-09-16 01:24:42.000000000 +0000 usr

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-dbg/usr:
total 8
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 bin
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 sbin

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-dbg/usr/bin:
total 0

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-dbg/usr/sbin:
total 0

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-dev:
total 0

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-doc:
total 4
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 usr

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-doc/usr:
total 4
drwxr-xr-x 4 root root 4096 2022-09-16 01:24:42.000000000 +0000 share

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-doc/usr/share:
total 8
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 doc
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 man

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-doc/usr/share/doc:
total 4
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpid

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-doc/usr/share/doc/acpid:
total 60
-rw-r--r-- 2 root root 27404 2022-09-16 01:24:42.000000000 +0000 Changelog
-rw-r--r-- 2 root root 17982 2022-09-16 01:24:42.000000000 +0000 COPYING
-rw-r--r-- 2 root root  3069 2022-09-16 01:24:42.000000000 +0000 README
-rw-r--r-- 2 root root  3639 2022-09-16 01:24:42.000000000 +0000 TESTPLAN
-rw-r--r-- 2 root root  1289 2022-09-16 01:24:42.000000000 +0000 TODO

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-doc/usr/share/man:
total 4
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 man8

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-doc/usr/share/man/man8:
total 20
-rw-r--r-- 2 root root 9927 2022-09-16 01:24:42.000000000 +0000 acpid.8
-rw-r--r-- 2 root root 1296 2022-09-16 01:24:42.000000000 +0000 acpi_listen=
.8
-rw-r--r-- 2 root root 2280 2022-09-16 01:24:42.000000000 +0000 kacpimon.8

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-locale:
total 0

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-src:
total 4
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 usr

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-src/usr:
total 4
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 src

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-src/usr/src:
total 4
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 debug

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-src/usr/src/debug:
total 4
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 acpid

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-src/usr/src/debug/acpid:
total 4
drwxr-xr-x 3 root root 4096 2022-09-16 01:24:42.000000000 +0000 2.0.34-r0

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-src/usr/src/debug/acpid/2.0.34-r0:
total 192
-rw-r--r-- 3 root root 10934 2019-07-31 12:21:00.861236271 +0000 acpid.c
-rw-r--r-- 3 root root  1670 2018-04-10 23:51:39.467499913 +0000 acpid.h
-rw-r--r-- 3 root root   878 2009-04-29 14:37:13.000000000 +0000 acpi_genet=
link.h
-rw-r--r-- 3 root root  7339 2012-02-16 20:24:42.515701450 +0000 acpi_ids.c
-rw-r--r-- 3 root root  1118 2012-02-16 20:24:42.544701444 +0000 acpi_ids.h
-rw-r--r-- 3 root root  5264 2015-07-28 22:32:35.499948465 +0000 acpi_liste=
n.c
-rw-r--r-- 3 root root  4583 2013-08-15 22:49:18.764134072 +0000 connection=
_list.c
-rw-r--r-- 3 root root  2725 2013-08-15 20:24:07.562169686 +0000 connection=
_list.h
-rw-r--r-- 3 root root 17402 2018-03-29 15:07:23.716843024 +0000 event.c
-rw-r--r-- 3 root root  1288 2013-12-19 02:42:46.529591162 +0000 event.h
-rw-r--r-- 3 root root  1656 2009-04-29 14:37:13.000000000 +0000 genetlink.=
h
-rw-r--r-- 3 root root  4943 2021-08-29 16:46:00.558827438 +0000 inotify_ha=
ndler.c
-rw-r--r-- 3 root root  1094 2009-11-09 22:03:27.000000000 +0000 inotify_ha=
ndler.h
-rw-r--r-- 3 root root 18544 2022-08-15 14:38:03.122942190 +0000 input_laye=
r.c
-rw-r--r-- 3 root root  1257 2009-11-09 23:16:59.000000000 +0000 input_laye=
r.h
drwxr-xr-x 2 root root  4096 2022-09-16 01:24:42.000000000 +0000 kacpimon
-rw-r--r-- 3 root root 13746 2021-09-20 01:31:56.196781952 +0000 libnetlink=
.c
-rw-r--r-- 3 root root  3028 2021-09-20 01:30:25.930632950 +0000 libnetlink=
.h
-rw-r--r-- 3 root root  1401 2018-03-29 15:08:05.842574608 +0000 log.c
-rw-r--r-- 3 root root  1269 2018-03-29 15:08:02.566518016 +0000 log.h
-rw-r--r-- 3 root root  6155 2021-09-20 01:32:03.418793923 +0000 netlink.c
-rw-r--r-- 3 root root  1066 2009-04-29 14:37:13.000000000 +0000 netlink.h
-rw-r--r-- 3 root root  4876 2015-07-28 22:32:35.453948235 +0000 proc.c
-rw-r--r-- 3 root root  1066 2012-02-16 20:25:02.924701352 +0000 proc.h
-rw-r--r-- 3 root root  5018 2022-09-16 01:24:42.000000000 +0000 sock.c
-rw-r--r-- 3 root root  1198 2012-02-16 20:25:02.925701357 +0000 sock.h
-rw-r--r-- 3 root root  3007 2016-01-27 16:13:18.836936981 +0000 ud_socket.=
c
-rw-r--r-- 3 root root   352 2012-03-20 23:54:18.929518037 +0000 ud_socket.=
h

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-src/usr/src/debug/acpid/2.0.34-r0/kacpimon:
total 80
-rw-r--r-- 3 root root   878 2007-07-20 06:30:46.000000000 +0000 acpi_genet=
link.h
-rw-r--r-- 3 root root  7172 2012-02-17 04:09:31.971838002 +0000 acpi_ids.c
-rw-r--r-- 3 root root  1118 2012-02-17 04:02:39.842852687 +0000 acpi_ids.h
-rw-r--r-- 3 root root  2788 2018-11-07 00:17:33.622466168 +0000 connection=
_list.c
-rw-r--r-- 3 root root  1851 2013-08-15 20:23:36.896169812 +0000 connection=
_list.h
-rw-r--r-- 3 root root  1656 2008-11-10 00:45:55.000000000 +0000 genetlink.=
h
-rw-r--r-- 3 root root  4075 2012-02-17 04:10:45.463835383 +0000 input_laye=
r.c
-rw-r--r-- 3 root root  1151 2008-11-13 23:40:17.000000000 +0000 input_laye=
r.h
-rw-r--r-- 3 root root  4650 2012-02-17 04:13:20.288829866 +0000 kacpimon.c
-rw-r--r-- 3 root root  1180 2008-12-14 22:09:24.000000000 +0000 kacpimon.h
-rw-r--r-- 3 root root 13720 2021-09-20 01:32:49.077869766 +0000 libnetlink=
.c
-rw-r--r-- 3 root root  3051 2021-09-20 01:32:38.182851644 +0000 libnetlink=
.h
-rw-r--r-- 3 root root  5304 2012-02-17 04:15:01.295826266 +0000 netlink.c
-rw-r--r-- 3 root root  1066 2008-11-13 23:40:06.000000000 +0000 netlink.h

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/packages-split/acpid-staticdev:
total 0

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/pkgdata:
total 24
-rw-r--r-- 1 root root   85 2022-09-16 01:24:42.000000000 +0000 acpid
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 extended
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 runtime
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 runtime-rev=
erse
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 runtime-rpr=
ovides
drwxr-xr-x 2 root root 4096 2022-09-16 01:24:42.000000000 +0000 shlibs2

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/pkgdata/extended:
total 28
-rw-r--r-- 1 root root  121 2022-09-16 01:24:42.000000000 +0000 acpid-dbg.j=
son.zstd
-rw-r--r-- 1 root root   42 2022-09-16 01:24:42.000000000 +0000 acpid-dev.j=
son.zstd
-rw-r--r-- 1 root root  193 2022-09-16 01:24:42.000000000 +0000 acpid-doc.j=
son.zstd
-rw-r--r-- 1 root root 1138 2022-09-16 01:24:42.000000000 +0000 acpid.json.=
zstd
-rw-r--r-- 1 root root   42 2022-09-16 01:24:42.000000000 +0000 acpid-local=
e.json.zstd
-rw-r--r-- 1 root root  478 2022-09-16 01:24:42.000000000 +0000 acpid-src.j=
son.zstd
-rw-r--r-- 1 root root   42 2022-09-16 01:24:42.000000000 +0000 acpid-stati=
cdev.json.zstd

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/pkgdata/runtime:
total 28
-rw-r--r-- 1 root root 3728 2022-09-16 01:24:42.000000000 +0000 acpid
-rw-r--r-- 1 root root  967 2022-09-16 01:24:42.000000000 +0000 acpid-dbg
-rw-r--r-- 1 root root    0 2022-09-16 01:24:42.000000000 +0000 acpid-dbg.p=
ackaged
-rw-r--r-- 1 root root 1164 2022-09-16 01:24:42.000000000 +0000 acpid-dev
-rw-r--r-- 1 root root    0 2022-09-16 01:24:42.000000000 +0000 acpid-dev.p=
ackaged
-rw-r--r-- 1 root root 1119 2022-09-16 01:24:42.000000000 +0000 acpid-doc
-rw-r--r-- 1 root root    0 2022-09-16 01:24:42.000000000 +0000 acpid-doc.p=
ackaged
-rw-r--r-- 1 root root  651 2022-09-16 01:24:42.000000000 +0000 acpid-local=
e
-rw-r--r-- 1 root root    0 2022-09-16 01:24:42.000000000 +0000 acpid.packa=
ged
-rw-r--r-- 1 root root 2995 2022-09-16 01:24:42.000000000 +0000 acpid-src
-rw-r--r-- 1 root root    0 2022-09-16 01:24:42.000000000 +0000 acpid-src.p=
ackaged
-rw-r--r-- 1 root root  907 2022-09-16 01:24:42.000000000 +0000 acpid-stati=
cdev

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/pkgdata/runtime-reverse:
total 0
lrwxrwxrwx 1 root root 16 2022-09-16 01:24:42.000000000 +0000 acpid -> ../r=
untime/acpid
lrwxrwxrwx 1 root root 20 2022-09-16 01:24:42.000000000 +0000 acpid-dbg -> =
../runtime/acpid-dbg
lrwxrwxrwx 1 root root 20 2022-09-16 01:24:42.000000000 +0000 acpid-dev -> =
../runtime/acpid-dev
lrwxrwxrwx 1 root root 20 2022-09-16 01:24:42.000000000 +0000 acpid-doc -> =
../runtime/acpid-doc
lrwxrwxrwx 1 root root 20 2022-09-16 01:24:42.000000000 +0000 acpid-src -> =
../runtime/acpid-src

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/pkgdata/runtime-rprovides:
total 0

/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/acpid/2.0.34-r0/sstate-build-pack=
age/pkgdata/shlibs2:
total 0

As you can see all data have correct timestamps and when I extract this fil=
e /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build/ss=
tate-cache/81/96/sstate:acpid:core2-64-poky-linux:2.0.34:r0:core2-64:11:819=
6f1f3e3094158d888b6ead4b56624c52fa363d1133c447bfc88398e5f7fc6_package.tar.z=
st the disapper e.g.

./package/usr/src/debug/acpid/2.0.34-r0:
razem 192
-rw-r--r-- 2 plobacz plobacz 10934 2019-07-31 14:21:00.000000000 +0200 acpi=
d.c
-rw-r--r-- 2 plobacz plobacz  1670 2018-04-11 01:51:39.000000000 +0200 acpi=
d.h
-rw-r--r-- 2 plobacz plobacz   878 2009-04-29 16:37:13.000000000 +0200 acpi=
_genetlink.h
-rw-r--r-- 2 plobacz plobacz  7339 2012-02-16 21:24:42.000000000 +0100 acpi=
_ids.c
-rw-r--r-- 2 plobacz plobacz  1118 2012-02-16 21:24:42.000000000 +0100 acpi=
_ids.h
-rw-r--r-- 2 plobacz plobacz  5264 2015-07-29 00:32:35.000000000 +0200 acpi=
_listen.c
-rw-r--r-- 2 plobacz plobacz  4583 2013-08-16 00:49:18.000000000 +0200 conn=
ection_list.c
-rw-r--r-- 2 plobacz plobacz  2725 2013-08-15 22:24:07.000000000 +0200 conn=
ection_list.h
-rw-r--r-- 2 plobacz plobacz 17402 2018-03-29 17:07:23.000000000 +0200 even=
t.c
-rw-r--r-- 2 plobacz plobacz  1288 2013-12-19 03:42:46.000000000 +0100 even=
t.h
-rw-r--r-- 2 plobacz plobacz  1656 2009-04-29 16:37:13.000000000 +0200 gene=
tlink.h
-rw-r--r-- 2 plobacz plobacz  4943 2021-08-29 18:46:00.000000000 +0200 inot=
ify_handler.c
-rw-r--r-- 2 plobacz plobacz  1094 2009-11-09 23:03:27.000000000 +0100 inot=
ify_handler.h
-rw-r--r-- 2 plobacz plobacz 18544 2022-08-15 16:38:03.000000000 +0200 inpu=
t_layer.c
-rw-r--r-- 2 plobacz plobacz  1257 2009-11-10 00:16:59.000000000 +0100 inpu=
t_layer.h
drwxr-xr-x 2 plobacz plobacz  4096 2022-09-16 03:24:42.000000000 +0200 kacp=
imon
-rw-r--r-- 2 plobacz plobacz 13746 2021-09-20 03:31:56.000000000 +0200 libn=
etlink.c
-rw-r--r-- 2 plobacz plobacz  3028 2021-09-20 03:30:25.000000000 +0200 libn=
etlink.h
-rw-r--r-- 2 plobacz plobacz  1401 2018-03-29 17:08:05.000000000 +0200 log.=
c
-rw-r--r-- 2 plobacz plobacz  1269 2018-03-29 17:08:02.000000000 +0200 log.=
h
-rw-r--r-- 2 plobacz plobacz  6155 2021-09-20 03:32:03.000000000 +0200 netl=
ink.c
-rw-r--r-- 2 plobacz plobacz  1066 2009-04-29 16:37:13.000000000 +0200 netl=
ink.h
-rw-r--r-- 2 plobacz plobacz  4876 2015-07-29 00:32:35.000000000 +0200 proc=
.c
-rw-r--r-- 2 plobacz plobacz  1066 2012-02-16 21:25:02.000000000 +0100 proc=
.h
-rw-r--r-- 2 plobacz plobacz  5018 2022-09-16 03:24:42.000000000 +0200 sock=
.c
-rw-r--r-- 2 plobacz plobacz  1198 2012-02-16 21:25:02.000000000 +0100 sock=
.h
-rw-r--r-- 2 plobacz plobacz  3007 2016-01-27 17:13:18.000000000 +0100 ud_s=
ocket.c
-rw-r--r-- 2 plobacz plobacz   352 2012-03-21 00:54:18.000000000 +0100 ud_s=
ocket.h

This is rather unexpected, because by default tar is in posix format. I nee=
d to talk about it with tar people, but hell yeah finally we got it :-)

BR
Piotr

Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedded.=
org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: wtorek, 1 sierpnia 2023 18:00
Do: Richard Purdie <richard.purdie@linuxfoundation.org>; Martin Jansa <mart=
in.jansa@gmail.com>
DW: Joshua Watt <JPEWhacker@gmail.com>; Alexandre Belloni <alexandre.bellon=
i@bootlin.com>; openembedded-core@lists.openembedded.org <openembedded-core=
@lists.openembedded.org>; Alex Stewart <alex.stewart@ni.com>
Temat: ODP: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass:=
 add support for ACLs and xattr

That is what I was thinking for the first time, but by default tar is being=
 run with posix,
so, it is not possible that these commands are responsible for this...

My guess is about do_package from package.bbclass and it calls this createC=
opy function which calls copyhardlinktree.
And to my supprise there is also tar command, but it is written there:

        # Need to copy directories only with tar first since cp will error =
if two
        # writers try and create a directory at the same time

and afterwards is this cp command with --preserve=3Dxattrs and according to=
 cp manual we can also preserve timestamps.

Correct me if my thinking is wrong.

I'm giving it a shot and will inform you about progress.

BR
Piotr

Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: wtorek, 1 sierpnia 2023 17:41
Do: Piotr =A3obacz <p.lobacz@welotec.com>; Martin Jansa <martin.jansa@gmail=
.com>
DW: Joshua Watt <JPEWhacker@gmail.com>; Alexandre Belloni <alexandre.bellon=
i@bootlin.com>; openembedded-core@lists.openembedded.org <openembedded-core=
@lists.openembedded.org>; Alex Stewart <alex.stewart@ni.com>
Temat: Re: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: =
add support for ACLs and xattr

On Tue, 2023-08-01 at 15:16 +0000, Piotr =A3obacz wrote:
> Hi Richard,
> you were right. I have made another test with wiping out whole sstate-cac=
he for acpid and rerunning the whole reproducible test.
> It occurs that the package /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c=
87c13/poky-contrib/build/sstate-cache/a7/41/sstate:acpid:core2-64-poky-linu=
x:2.0.34:r0:core2-64:11:a741afe7c0bfc218a844a546735ddc4dcaf578bff5d6a3762b1=
bdedf0819fc9b_package.tar.zst was already containing wrong timestamps.
>
> > I'd guess you need to make the sstate archives of do_package store the
> > acl and extended attribute data and when that is done, the millisecond
> > timestamp data will probably be saved too?
>
> So I'm guessing that commands which are producing this package_name_packa=
ge.tar.zst are producing it in gnu format. Question is where can I find it?
> Is it being produced in this sstate.bbclass or elsewhere?

https://git.yoctoproject.org/poky/tree/meta/classes-global/sstate.bbclass#n=
859

tar -I "$ZSTD" $OPT -f $TFILE *

or

tar -I "$ZSTD" $OPT --file=3D$TFILE --files-from=3D/dev/null

Cheers,

Richard

