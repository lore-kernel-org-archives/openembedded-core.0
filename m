Return-Path: <aplanas@suse.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC61EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:46:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web11.2239.1687157164046250305
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@suse.com header.s=selector1 header.b=rUtkRxAW;
 spf=pass (domain: suse.com, ip: 40.107.20.42, mailfrom: aplanas@suse.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5OZ4cotT0fLgHVrCNlR1U0IEcI7hxbFztLXe/4vozW7SGz5tSTn27R5AMKsOSqU710cQffjblzvnbAY/T+yGH53fx6o0bT0he0jbuo8jIJxCkDHC4/2Wie5uaWampKsZ7jI9R5QQlPRcvnld8Su3LegLtwmQnfBHXecEFvKztCB4RsbvU7QxkXaELldm7S9HjVERJq8Qwn4NqafV4v1+hB64gXZtZIsfXk1WeuO2C0IpChfK5hl7tej3gQh5oB1p1IYusPy7UFHQeIVCFBt8qGWn9NdejBdNfXdY487sbvfdRgbFM0C+qkqw4HKXL6t4uii2r80mn1QUQ2cQnXpFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6ztF66e4r47U6P/QFtuymEVdVvqKOtTg2D6AnURT5o=;
 b=AUOCcTJQMDR8t+zD8hCcyf9TOB02EzQHmqf1FmEkaThuM1Zwr1X79/qjyyXum5k9TcpzXMyXqGcSmIY98rijsORurWO0shgybWgiPRmUF2bM+1V+nAhzjU99egW1UP7Ax3Iirgbup7ljIYvd5glNOXtmifJh78LdNa/eASvgop666SZ35YQCyh23ZOvLfoD0cgOluCe85cW8oewCrsj2ZH7ip1fMHWOGWHNvKdsfKzYsMBcoXm+dPvt5XOSQPEJmj1wzkzUjJh7wjoBWQ3/RdkwU5+ZAgGdP8eVQ6STxonsumH9Et+R9aY2bfzdsvZN07S37gIcghDSccNj01PIQPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6ztF66e4r47U6P/QFtuymEVdVvqKOtTg2D6AnURT5o=;
 b=rUtkRxAWR+sgmN+pRlIxBufN9Iko17hd/AwvwaTiJsF97zYsIxgheMy5tn0LRWoSzhRGdRquDe+gmIw9PcdsfXVul3bbc5k853F9Xe58yfZQalchsWEhz4XNnvvYBGmht0aW0/cIBb53ToEvAbkEDfp9HD1XDaEnJ62UpolUkwGM88Aw/Ffb6J4z32eukSZSNupNVsHX/W7UcCP4DWIH819Iz57qcxo2j0bnX5Mjq4KR6+bpphL6Eq1d4V9dDvGomCXeTwoAfm7gSPSknM20Rq4nnFciXCjXVdDcPuvUOoO0oSLfEARjfpPxB2mLIvAcoGyrjW+MljErJ74dUxmXfQ==
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
 AM9PR04MB8258.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.36; Mon, 19 Jun 2023 06:45:57 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::81d0:fad5:788f:4b02]) by DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::81d0:fad5:788f:4b02%4]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 06:45:59 +0000
From: Alberto Planas Dominguez <aplanas@suse.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] rpm2cpio.sh: update to the last 4.x
 version
Thread-Topic: [OE-core] [PATCH v2 1/2] rpm2cpio.sh: update to the last 4.x
 version
Thread-Index: AQHZogfMdoEzUV60bUGxpJocRBDY0a+RrpCb
Date: Mon, 19 Jun 2023 06:45:59 +0000
Message-ID: 
 <DB7PR04MB466607F049FDE72DC596FDD0C55FA@DB7PR04MB4666.eurprd04.prod.outlook.com>
References: <20230615105447.29690-1-aplanas@suse.com>
 <CAMKF1sr7RqtX9uiWoVrL+6RHE2hx8_nEHQ9qYdTkTNhN0m0jWw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr7RqtX9uiWoVrL+6RHE2hx8_nEHQ9qYdTkTNhN0m0jWw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4666:EE_|AM9PR04MB8258:EE_
x-ms-office365-filtering-correlation-id: 2ea86ccf-4e43-41c1-7796-08db7090d733
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rDWTQLChb1W+LKkxz+bfh2EdjxKeQg6xL4frEslPc5TZxQF2lJRCY7HNvd0XbMmFaNDYEZlmCIyjHruSZg20kcqHcw5zax1EAeCXs57cr2Byv33PDPI27nFxW4XltgQbgCvGjIapTtrnI6tFebKmh4R/1U8XsPr2m7EboEaZn3myp8BYozRYmCxj94815aevt1xMs47yn6ckgN/m/dPIB4UYSQ+rotL+IEIBCHA70TG+cfErZZb1xlE3Ec1RKUmuPR0wS59aOQHt4mKPTu2vW46eG6b0n5JVMwyzCBs8jF8B1ptFN9q0vyHEmrW0s6VV6PcbXTyB2FiUqW5tMESU/Bnh4g80DTnS96FTw8MBfKjdOP0Qiw9GLKxNUZnADwlrd2YvmStDhmnJZdHVUK76dvmk9Gc91DmE4rs3m/2/Q+YXL5mRpzd89+xxJNQzMauM77HFNua/mIuzzYQ2iKbiWclb2Jdvntr2TcSl2Pq/m8v9zKE1FK8zBWWMFmNMhnfOL08NvAUu7vTMYIIBCesY8UbkAuelWXTKd4hMM9d6jpIdOSfHvL2gDMvGkIcO1G7JdrGM58h6uYqLm6bt/YZyVxLDz5NIXW9sksoqaPc/V3I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4666.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199021)(41300700001)(5660300002)(52536014)(8936002)(8676002)(2906002)(38070700005)(558084003)(33656002)(55016003)(86362001)(9686003)(26005)(6506007)(186003)(478600001)(7696005)(71200400001)(966005)(122000001)(76116006)(66946007)(66556008)(66446008)(64756008)(6916009)(66476007)(91956017)(4326008)(38100700002)(316002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?k6PkDbe73B4Q9k3xqqvqyShQP+Mjh2KjlhcYD7mZsJzHYNjlv4SUIO2OB3?=
 =?iso-8859-1?Q?6s5rgKypf95j4duSs4GeL7w5LkVmoxp0eQXor3ghatDZleO63/K6DhJm2J?=
 =?iso-8859-1?Q?UJpumlmjHrmn4/+Hvm5AE1KEf+T1KTbd8Zd5/bXlFdqFshzVTl4VEO/VfK?=
 =?iso-8859-1?Q?qV3BKgKKom6n3LAWRvLrYEevN2OphhyytbS+0rZTPmIPUMv4R3Z0BFQeW6?=
 =?iso-8859-1?Q?L4JmKHKZ5AQTxsk2rP2q5QfekPrZ6fhzAp19XqztmLtC7vhk5GC3Ju2ZKy?=
 =?iso-8859-1?Q?RunPxnT4If/h1ZEH11QoYB+QPRZybCGWAe5ea27TpA7s3K8v+YKsO92SJU?=
 =?iso-8859-1?Q?W2UvlfkjQigukb11zdvAHHZPl1OsBouXp75QKTpeX23dlpM9BJIiBcJYKg?=
 =?iso-8859-1?Q?eUZNdwhonSTMvqjRA+kJy+doKzc70huc4iU+oRiJGgPAIB+zjNtAKd4CNz?=
 =?iso-8859-1?Q?eoDnlZq+1Mr0n4IBjmbVCiLvsF0cap96TEtxMheW0OI0nA/Bp1pNpvRQfE?=
 =?iso-8859-1?Q?tM6X79nQjj1TEJtOfhpNj1eyHLa0T5Nf7IaKcgUdL8AFC7psMRfWj7DwkM?=
 =?iso-8859-1?Q?T2EHpNXJndNoql3PRAXGfnhjri++ljQxI3ZimyGWWhAasYg37dNc4U7iQu?=
 =?iso-8859-1?Q?d3urQIeX0vj2gDdkGnr+xyCgxc40JaTxfkX9x8C5Bnnec0/c1unHbnwoGg?=
 =?iso-8859-1?Q?hAyG1Czh9grxHaFH59tDRo54bE7T1Cfz4rzqLsxn5h3eVAgis6CNGt/M8c?=
 =?iso-8859-1?Q?djqN2TigaAgWAlIb/Elgm/Wrz7u2s0chdIy+dP4dPhAbHeZIB+NbsTP+34?=
 =?iso-8859-1?Q?mi73c1OY/Cb03ZHprFOERKSAF5Hv0U6pWQb67BHkVWc7e7RgiSUtFPUxm3?=
 =?iso-8859-1?Q?DwvGXql5MjGXTkc4M6nX2uRYyLhdGA1yay663ffippOqBe2nLxhk56M2Y7?=
 =?iso-8859-1?Q?R5CPgE0pwbBzFL3Qxy7eWzHCSnPxBXUp++hzjKxeM1a/MJX1/tJpmccxKQ?=
 =?iso-8859-1?Q?ks55dYUGSl0O4vqIy16lSNtMU8mBG31pB1LxlKdDu+w21HITIQLbsyRXom?=
 =?iso-8859-1?Q?qiGQJ+/15W5PYWYVFVoZB24tC0rAet3a2ma8I4gUYzacIgrdY1ooe2l5q+?=
 =?iso-8859-1?Q?7gdlSxEZSMgoHbKLu7XZ+bNvtzGFQ4bRQTHIXcEsWDbhTU7MxItTAVx+Oy?=
 =?iso-8859-1?Q?iviGg7NqoJ6FBrR2mQ88URHTXIbAwu3Av5m1aDAyPwdMaPP2DdnNF7/Wo6?=
 =?iso-8859-1?Q?HVyTBAePoEZbEbgGbGgX7sC/ebGfyHexvM24cexHBwOt9/js0nkztGwCHp?=
 =?iso-8859-1?Q?HfjHeaAcWhBnZrufpWjp9+uSvfVtxGK5fqbXpr8ThzSK9rhgcTmflJvlu3?=
 =?iso-8859-1?Q?TukVOEN0nq0FmTkqrffcjP8l9yVMreR4BTvlhFzNgA7QV/+LTwCA4nFfWE?=
 =?iso-8859-1?Q?PVwKp3jJDi9ElfcCvyiVCny1CABp+9Lpa6Os/Ax30JGdKpJDw1b8JSBtvG?=
 =?iso-8859-1?Q?4mvHZc/7Za1z33NYto8ygZmqr0xN8q6/0rG2YwRNAUbVtYIPnP6Lpk32KU?=
 =?iso-8859-1?Q?fVG59mkUAueNQt/94iFPEZjemBDufUkMuTEP3ucTEgVULz/jEY70eLZ5R0?=
 =?iso-8859-1?Q?ff/ZoI2xUrhI4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea86ccf-4e43-41c1-7796-08db7090d733
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 06:45:59.0912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NXtlPPV6ymoi1qzRyKTPsvqc76UUvj2TjyRYbRzjyZ+hs2Edqd7ITSTrsWCs26xagytR2hR/AiKNb67ELTm9bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8258
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 06:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183092

From: Khem Raj <raj.khem@gmail.com>=0A=
=A0=0A=
> I am seeing some race condition see=0A=
> https://errors.yoctoproject.org/Errors/Details/708923/=0A=
=0A=
Confirmed. It is the second time that I do the same mistake. I hope v3 fina=
lly fix it.=

