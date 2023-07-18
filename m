Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D1DEB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 08:05:18 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web11.3061.1689667516628790744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 01:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.8.48, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6CL3xB0rdrWp0ueOtE+icrWjkOMYvGMTg57e+1UZ4aK4AoFMgGRdti6+LNo5nf4ch5DCw//wn3aOfX1JwYuJ1MO6JLrULQQH/0MWMwfJk+/NNthu/Yx/c4VFrg8p+pIa0wV0+c32eXllwsjrWZH42fc0VCio7O2N+SU3gpADP8yE1wAMRJTPDn2YhjIH72sGA44OA1klJbRLvzt7VaVnryIltD9byB+nlFTwG9C7Ac22Xo0PyGnvVauXlWQxw6DBHKG+xEdFwmKnwA9BJG0BNPzDg7k0FhATNTVxqdTRHLhsPdUSYNkPB7edPj48vkCpQ9ywHJ2O30oJE/9rrNeEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Am+0UVEM7qv33kOMUIXDq1nWXejbvPR6TooKqhl5RsQ=;
 b=KwHQl4jKAvRSjgnam1QBccf6/+W3aZyG0jz+ISguLTO31fxbICBjyYjTBAVpm1Irnq0EwzHD8r3lgWNnM9ZIHoAzlul2qU5hyV95dfw8fAxh+55307DeffEG86uiNF+bqYUdL2KSHjBTtKQSMSdWWKVpvr4A8iX157CjcDgXTgCNj4jAuQ5efcgsyB7tlFOl8S3dTh3KPx7avutvbea1+2Guoxcp/4WDZT+p2t99YhwWF+ONYkhfHG5LGHQNymtFO4YsMLNXmcjUrfiNajPr8ayaETCCavBmqzmjqTL5BYk9KsmN7v4xB5iJNGPJEVMrS2f0mo1b0J8ykB2LI+s1Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Am+0UVEM7qv33kOMUIXDq1nWXejbvPR6TooKqhl5RsQ=;
 b=cmvYv3YYfm1SNH3MeiBBDxd/JBawiW37WzP9I9wRNEwmbaaNYjE6w4t7Crh8l5ZhbdQcaiK+DLwQXLMGWguPmPWXIeX8z2HIUEpq7l346Ch3z21vxggpkuH0e/XbnbPtYRufBr+8DxEYcy+Lt1UxLrpE91jxqYeSRt6eE5IOx3k=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 08:05:12 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 08:05:12 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
CC: Alex Stewart <alex.stewart@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZuGykNn9a7NUqXUq7tnxBdTqzWK+9kj6BgAGV9EY=
Date: Tue, 18 Jul 2023 08:05:12 +0000
Message-ID: 
 <VI1PR04MB53737C43B2CDDBFB197010359138A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
 <0cce368f-36b7-672e-df83-94b4914a1344@ni.com>
 <VI1PR04MB5373A7CF0029527D7AA884689134A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230716213857fea03b3e@mail.local>
 <17728F63D7D8F798.22245@lists.openembedded.org>
 <177297AC200D092D.22245@lists.openembedded.org>
In-Reply-To: <177297AC200D092D.22245@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DU2PR04MB8646:EE_
x-ms-office365-filtering-correlation-id: 893d94da-08aa-4132-881d-08db8765b644
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bayKHByvGNqSQ6CM+GY0xod3KcB0T10EzYFfg9vv+BuPfwmfL6HdmEX7jBqL/k+nL/RClMUuvsOFcOzmOaXROaJCSNUE2/q6B0uTf8MFlnkTjcIh9I7qnR3znALP6nq9ArDNvH/R9WUImsPjEdLVaKLOeHDCGtHSlfN7GpGQl4n0mT11z7G6fHIHrBX7vw0ClSQ1C6VGjo0USAU0awGcbGFEEYsKzaBtROSb/1FkADgy1jTiXL21B+VeqI6vdUFvlwE3obvCka7rgpvSh5LL5MvL5RBbICXyKw/J+ktkshrFhaGf4RYWV3ohpVwjRxtlQ++uYwHC/Jeqw2HiR4+wz9nQU1mqNTtCvRkfjR8f28r9it1TeaneJHQyk7WPPOz2FQxDfN/wZNGZwhxgVQdA1al4Q5BgsDmH2YFjKNJ2BKkGXoh80Su0qAah30MBZu0nzUHEQVjHEBR0nwRPCjQxbmfhDVEPrqtFmDzJAo1UKRNTpztLqocAG/GzJlUvyhR2ikyIbAA6xL1K+TiDoMM8qhBbOdx7R2UoV06pkJOmjZEkvyaTqRhE/I1pzvnb4FYHMqYgiG6cbtnh15LL+g0v5UU3y4e0C4ZX2SIGOpo5U5o=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39830400003)(451199021)(83380400001)(86362001)(2906002)(4744005)(8676002)(8936002)(38070700005)(66476007)(66446008)(66946007)(64756008)(5660300002)(52536014)(41300700001)(66556008)(316002)(38100700002)(4326008)(76116006)(91956017)(186003)(54906003)(110136005)(122000001)(6506007)(478600001)(26005)(33656002)(71200400001)(9686003)(55016003)(966005)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?EYzzY9ADTJ2m/E4GFQMw+fHeTCfmmnjJjdbqE+LcrDem/M3nO/MX4qW6fU?=
 =?iso-8859-2?Q?P6RgXjKGSgIIap1wwhDbsXree2bgRZHcbk7oNPvkeKe6QYfJ8wsjlpQBYQ?=
 =?iso-8859-2?Q?iLBf7l5HTN/tbiPD5l29eKa7CyfPBJqsDXgVuIJexPbRX9bXmMN8c2/pNn?=
 =?iso-8859-2?Q?Q81mhpB5YwYJLbz4JqsNQjKZdZ2x3ZC4+zom4iQmxU4QOFcAib+6ixjOqY?=
 =?iso-8859-2?Q?Sz1CIwToQ0lYN3j5IFNJQQ5rsgO2E+bqg/stPx/wTBj/Bg2svoBwgBIB/J?=
 =?iso-8859-2?Q?ygvKEz4HO4+Q9ZE+1TGPofsAASQFV1KvdiVVl0lYgmYR2tJ5/pd+dkKGy0?=
 =?iso-8859-2?Q?85pUavDd4kmvcqXAbSPbMMU5mrhsCBJ49xRhPI0NcijBClQAJurN5hq+3G?=
 =?iso-8859-2?Q?Voza2usMYeNXW51NghmaQNqdsiCPzBzoaTB+DxH26WgkvJqLa2xnPO3YHx?=
 =?iso-8859-2?Q?UEgBsvYce0YrA5RwRseaUtqHvsX1j80JAFILXfnXkmGbulaGP8Q6O5Pxmf?=
 =?iso-8859-2?Q?xBYtd822spaaRfJHVXdKkZ666v7u8nRhiNqgUsx+i0XG5bOypEsSAl+q1p?=
 =?iso-8859-2?Q?dYkV4c0eykNlVtWZ9DM/EeKlaGlXU7EvyTmXq9YHbU86Pc7X2nB502Adnk?=
 =?iso-8859-2?Q?DiyZZ7PI3DqbrmZWx148W55Kji2BRzGjuGuHOFYfam4eUBWjGZm1wxa/bw?=
 =?iso-8859-2?Q?nNhPRoMcL1vRmVwAFRZC8Ysuz0E/ABwyOe7uSoNcnuR5TyfxKfkemIankq?=
 =?iso-8859-2?Q?1BnoM1HwX8DLHu1E/FwRKhJVNUtEvHEOjaCYhRijwYSUrou6F/BZdjTBOh?=
 =?iso-8859-2?Q?jfzVP/T6nhwD2H66I4vIGjweq5wGOmV4Qd5SzdAN9epWSwf+T8Xmlg0cpE?=
 =?iso-8859-2?Q?u+4oaLM411WBENeiVCxkccOnEymicWtfuP1Kay2PNTCUeN3fSLmsL+yWAP?=
 =?iso-8859-2?Q?9PZBR6N1Q/AtAvLzLdfS/EcNdKt9oKdBC5YXpBLFatQslac2v8V/2v3WM8?=
 =?iso-8859-2?Q?r13CGXj5x10bZFHPJlyW2xyDZUP6we3N+bRkGEu6bWp902SmDDcieZpUaB?=
 =?iso-8859-2?Q?mkds/yjLkn8Mr7ufzQ+ObADyWL+4HFzAT6bRsy3sqsAC522JLfK+znCWIM?=
 =?iso-8859-2?Q?nM3BJ78NYId2lBPyL3f7qL4duoLwvGu7wnOcXbXZvY30nCLCpvrbLyXOfv?=
 =?iso-8859-2?Q?0MI00k+Hk2RXcPApsLn+6Wvcw5JdtfCrN/6mgBUCj88aDH5SX1GC4Kq+Rk?=
 =?iso-8859-2?Q?D/tRZCPar7mXYgBsFLLTwMFsXmmi3SR0uUuXYihGHDImvmqiPkgAlSCLBl?=
 =?iso-8859-2?Q?mVCGaSj+1/vEYck6ZAj47XwmMvfFYRNfQZNRFLi61065GvjNoAIIpg++CQ?=
 =?iso-8859-2?Q?edBm0ciLEA1MGKid9+7eMnMc3urSxS0r3AbNBwgPlPeuUjv8vfoyRU8AmZ?=
 =?iso-8859-2?Q?TX9MQV2JY8duEXlx81joiaWNs/ip31R2ZunZctd17KY4ulkyrXB2IHqgvX?=
 =?iso-8859-2?Q?eD3xiQnEMZUR5WqD0Tjr1RISJ5l9kKm/vpqGDBhbv2/Z//CWPrlToBy+E7?=
 =?iso-8859-2?Q?hHCOGiM4LFrfjZ4JYyvcZUIMoB8uMO3LL/M2fsaoCpXHO6UFp+egtsEVBT?=
 =?iso-8859-2?Q?Hu8StqUfnj8Sw=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893d94da-08aa-4132-881d-08db8765b644
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 08:05:12.2266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OS6L2P1eAnFsTp8VCE9NROpweoen12AE8Q5aVGZuYAD0Q5iEuEN0H12We3dNB4tsuj/Ignkh+V8+i9KDrQudHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 08:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184497

Alexander, this message:=0A=
=0A=
> Alex,=0A=
> from what I'm seeing the issue touches opkg-build command:=0A=
>=0A=
> opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-xcb-p=
roto-dbg /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i6=
86-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-n=
ativesdk' returned non-zero exit status 1.=0A=
>=0A=
> which causes you an error. This may happen with bad tar hosttools command=
. Can you please post me which version is on yocto autobuilder?=0A=
=0A=
> BR=0A=
> Piotr=0A=
=0A=
was meant for you, sorry for the confusion. Can you please verify/check wha=
t version of `tar` is being used on the autobuilder? This is really importa=
nt for me, if we're going to move forward with it, because I have suspicion=
s that it may not support posix or it may not be patched with --acls and --=
xattrs attributes https://www.mail-archive.com/bug-tar@gnu.org/msg06198.htm=
l=0A=
=0A=
BR=0A=
Piotr=

