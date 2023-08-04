Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B403AC001DB
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 08:48:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.60])
 by mx.groups.io with SMTP id smtpd.web11.7222.1691138910622027701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 01:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=Zt1AHqfD;
 spf=pass (domain: welotec.com, ip: 40.107.22.60, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crrSTAAoZf2BJJl3rhFxuU8Gw3eCc98UoH2HDOv0cltOuoEm4MoAbmOrEd5pqGlK/hGf8mIAqel2bXnR/bl694sKje23voP8qGjbRmH5bnvgfuUpk+T/U4I3d4EXG2YaY0VW1B0dXuvh3a321H8Z4xMZMoqK5U4sRjxMrnbs4H3MPr1oMLkoeZG4+x88qtvLN/vxFDv+ByurIztOSJswpt/iRti8Vfr7R+J+Ci0262mdqqiOdGeNxH5Q4Oec9aG6R3pW7eh2U+3pkQWX/fQqTe49BH+VuaO7xeRQF+hYvq7X0QAr2yLlDd4KC+3VtgszdaaLl1U6Oihjna+fFxBYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcFPgW9AjwcHvUaWUJwyqtTSGsEDkPxD99gpSlnquTk=;
 b=WHuGvpjsQdy3PsHLvhyySTbCT/NhUfggrQjT5tQNxH8wzZ6HpESBCqfmlTRSYCqSguvkjmIv1MJQDNPEQ5DE2S/eylZUtbjcrPgWuNXD+Oip/rge7r2wv0e2D/eM2JtdfpcUzeFJfqyHgFUHdZnR6aSUpzqpAInE09DL1/L8zN6qawRm1diUgpRpFryHPKV16kI6YVxw9iL+lIzWBT4s1VFKPgWOp7YIgOmTZmsxBZ2l3C1Mk56Ymxiif4oYbbSBrNcM6sGUKhIM5R1UoCIewLazElcsrMO4Ol2SpFe7eTPiyOrUWQc2NW3sZKDGnjWnjzojDgCeuMpekXB2hm7yuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcFPgW9AjwcHvUaWUJwyqtTSGsEDkPxD99gpSlnquTk=;
 b=Zt1AHqfDAG40JPmv3YwcARlm6ghyceMPH/GxDy+jtGRP3mHUMxNRp06Hv17JCd780LaD1kpPFF67kPh35EFdSStcswwWsxp4+z/n244Hx8caf8/TFHw+4ZDyWuuXmwqKGBsR2dVZ1AsfJaXN4xt+st/XTCY4D7Jlj1rhV8qFRnM=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8587.eurprd04.prod.outlook.com (2603:10a6:20b:43a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 08:48:27 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 08:48:27 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Richard
 Purdie <richard.purdie@linuxfoundation.org>
Subject: ODP: [OE-Core][PATCH v12 1/7] path.py: add support for ACLs and all
 additional attributes
Thread-Topic: [OE-Core][PATCH v12 1/7] path.py: add support for ACLs and all
 additional attributes
Thread-Index: AQHZxq/4yomck7DpJEm9qpMHFkJ0e6/Z0qTH
Date: Fri, 4 Aug 2023 08:48:27 +0000
Message-ID: 
 <VI1PR04MB53733C1B75A5F09E4AD466E99109A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230804084315.55768-1-p.lobacz@welotec.com>
In-Reply-To: <20230804084315.55768-1-p.lobacz@welotec.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AM9PR04MB8587:EE_
x-ms-office365-filtering-correlation-id: 75d60037-9840-4d18-f981-08db94c79204
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gBdNOBZfYOPFYN0Cd9p1pLTXgRrOjqRI3vj7TsnzvGfSNzVSSpeouQ/k75/2wLHR/lIyFQap+CfI9DsaZAKrnjo9Q1wqK9089hip9f2E7fb55io1m1S5/+4FCkvm7xRBVIERC5JxQ3feEYCKm44NGEyRw8z69hAceo3manoY+/ZOSHu5pTZnI7pToa292rp6Tb4IOUnu01z8qwQCs/a0h8ivDHOiTVwcuTO4vQES30ZRQuC0CpkptxR5joOgVvKr0rknBNS666D9HtjW/hhaYJ7IRlv4j8QINDGDgihjXZGDT4pi4wFK9B95llBuPaBFdjynX/0Dg8HtTcOzQND9f62JuAIHWXdA/gg00YttmA/EqWpd7MFugG32VjF8mmJsFIM13rsWyE2V4Tz7K1kLoObZ39bOhw4RR9Hz4EiyG0yFv1Sa1LrGx85x/qr+z/2EScccv0oaz7dKIHPiMdEMt3chu/XUMJ8fdKs170ygBsRV+h00j9T01b9IoEffnXQBgng7Ajb9/Smo1znqObvhI0MN4M8phyTwnYS/fP50B3s02VLVuwiwhLKSpUF1nWhC7PE+p4j5JWb1ZWixlAw+olJeXoG3bwTlBhWf/Ivo0rg48W7NM5OxmJSBpumTPIBM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(366004)(39840400004)(1800799003)(186006)(451199021)(316002)(83380400001)(66574015)(122000001)(2906002)(33656002)(8676002)(8936002)(26005)(38100700002)(6506007)(71200400001)(91956017)(52536014)(5660300002)(41300700001)(64756008)(66446008)(66556008)(66476007)(66946007)(76116006)(55016003)(4326008)(7696005)(6916009)(478600001)(86362001)(54906003)(38070700005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?Y+QD0urJN1UQyfTrmFVSecFsfEOyLVe17LmMc/koJftdL24VhfgQ1TII?=
 =?windows-1250?Q?ALRQUMRUg3Q/d1gQLJKNt4DEkIMco2MdD06lO36/rPDure0eSvgmH8s7?=
 =?windows-1250?Q?CE3Hwrs8VqYknEfs3/kE95aXwuBRiKjA3zH6aGmcSxnrkT6h/3qtzK8L?=
 =?windows-1250?Q?o8vRcPLDqtInVishvkkvLqfHMGHa/8QHkoVnpXBf97dg+amDWOu9EyvD?=
 =?windows-1250?Q?37Kjfl+9cBbTj+ZTCmzsy0Q7JvvlMgMqfl7j27yABL3Ta20fGgUQLmR8?=
 =?windows-1250?Q?F8Zk6YbLKRNuVlFw/Sfk0YORO2qAdkpc6qO4e4vRDq8iikM0p+V3NRf8?=
 =?windows-1250?Q?eVlUF0AmwtJF1CKBj348kfVVsYLS1ctGL4CogrLVN31TgA9EtUqEnhgM?=
 =?windows-1250?Q?dCOaRnZErPV+PZfsa1Uor6x5arBQqgIbTGRCVELOW/+6gItASNV/0B4v?=
 =?windows-1250?Q?dtS8EPE8g6TpKNOhF0erpyOeGqXblntNGFopxgbBVkg5LjussVFB61ul?=
 =?windows-1250?Q?pd0WEbv7Z3jjRvZJjRKdRcVcKCrj7/QRgr/lWhDY1YHy2oPW9cKnxkKq?=
 =?windows-1250?Q?mqjK8XNt0fMezbjWvR3yGvmP15RLD5i7da2mxX50V0yBUM9GOhSjLd3K?=
 =?windows-1250?Q?7NPx3N51kVAnUyeNFVsx67PpRlB+ldG+yQpc/yPCmoUU9Gh4M0xBebzm?=
 =?windows-1250?Q?DCqgUar8qCzqfmbIUMytIL+1m0Y6S1gcSGPm9whDyoX+PluK8Mx/ID/v?=
 =?windows-1250?Q?PB8Xue1Uiq6QDb9mU5cOs8/RfYt3r6J/fpBj12HBhOl+3lPKntUworeg?=
 =?windows-1250?Q?Gw/YsjPIPHBAgo0x1a6s5/arpLgXpbzjhGe66AQYytTGsX2DRdN82zmS?=
 =?windows-1250?Q?R+rA3gd/rhF+klPEmwYlC7wqRCLxs7NCqYgZVIpbOvkKHmdMCp4ZU7M5?=
 =?windows-1250?Q?Zmc8O7sSOibQVJb+hYkDgVtLYy1uuH0DZfufTxaCy9Fg7qnW7XHA2RqX?=
 =?windows-1250?Q?4lVF3W+lPBGtXhhyUsL/iX4t/YeXWcqvbNA9I6GptqRdqWE8oYm9DZuf?=
 =?windows-1250?Q?1B1efttmvcweuSKQdmXGC3da1sdkhWF4s9VbOSTqVqsRfH0/mpgwJ51o?=
 =?windows-1250?Q?UyymGdq+jD9jB1ULDUe6LOaaad5VF4sIH2iol9JuuN67nf8PR9rs7A59?=
 =?windows-1250?Q?VcMwatKjOUKE8kIbw0UfqTYQ0uuZPJmj5KMJ/qppM7/yEo3Swmcce0/k?=
 =?windows-1250?Q?a4nbrXVp5xxymUrQEfGAoDogcEY1kQBprV9fDA2cmHuirWv7qcMFbFob?=
 =?windows-1250?Q?wkSmdPDHYmPxhL0djnzraXl3bMuLe5x2TVUEBU5FFipUB9ldUbyo8GWj?=
 =?windows-1250?Q?fObmjWhjmx8QPY/oa1XAVkEzICsZ4gWaLqKfP077F5nEuJacBgMujCLw?=
 =?windows-1250?Q?Lcrr12nPg/nU94oxzr3rgG704t8QiirQG7xzLsDxBmljCUvAPVdsrYrl?=
 =?windows-1250?Q?yJvP3u1ot8eGKr1Zx8NJSjgu3eofjnmGOfug9GTHJbVOlzQ7Brs6BqKr?=
 =?windows-1250?Q?vQHg7wRNzDZYiDWHFjpNij0osFK5AUK8BQzhsTNfv9kf3zArWSCh45In?=
 =?windows-1250?Q?JKP1pS4oG53LC00yNx1KepEscF5lFGqRNmMmo7pZimrQuwVdwtFnpASO?=
 =?windows-1250?Q?+1LGcKEjbzU=3D?=
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d60037-9840-4d18-f981-08db94c79204
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 08:48:27.2174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FslsPcfV1u0/RfNDX7Tm7avSw8oJCP0P4v5WLUYI0gf6Uq9eCCy5qR2TS4HpCC2lIPLz5Jcpwnp+aw4cnoWqag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8587
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185518

Hi Alexandre, Richard,=0A=
I have finally fixed it and testes with `oe-selftest -r reproducible` tests=
. which resulted me with:=0A=
=0A=
plobacz@latitude:/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-c=
ontrib$ oe-selftest -r reproducible=0A=
2023-08-03 10:31:57,100 - oe-selftest - INFO - Changing cwd to /media/ploba=
cz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build=0A=
2023-08-03 10:31:57,100 - oe-selftest - INFO - Adding layer libraries:=0A=
2023-08-03 10:31:57,101 - oe-selftest - INFO - 	/media/plobacz/9582beb9-877=
4-4d4d-976f-63a6f1c87c13/poky-contrib/meta/lib=0A=
2023-08-03 10:31:57,101 - oe-selftest - INFO - 	/media/plobacz/9582beb9-877=
4-4d4d-976f-63a6f1c87c13/poky-contrib/meta-yocto-bsp/lib=0A=
2023-08-03 10:31:57,101 - oe-selftest - INFO - 	/media/plobacz/9582beb9-877=
4-4d4d-976f-63a6f1c87c13/poky-contrib/meta-selftest/lib=0A=
2023-08-03 10:31:57,101 - oe-selftest - INFO - Running bitbake -e to test t=
he configuration is valid/parsable=0A=
NOTE: Reconnecting to bitbake server...=0A=
NOTE: Retrying server connection (#1)... (10:31:58.417913)=0A=
NOTE: Reconnecting to bitbake server...=0A=
NOTE: Reconnecting to bitbake server...=0A=
NOTE: Retrying server connection (#1)... (10:31:58.417913)=0A=
NOTE: Retrying server connection (#1)... (10:31:58.417913)=0A=
NOTE: Starting bitbake server...=0A=
podpowied=9F: U=BFycie =84master=94 jako nawy pocz=B9tkowej ga=B3=EAzi. Ta =
domy=9Clna nazwa ga=B3=EAzi=0A=
podpowied=9F: mo=BFe si=EA zmieni=E6. Aby ustawi=E6 nazw=EA pocz=B9tkowej g=
a=B3=EAzi do u=BFycia we=0A=
podpowied=9F: wszystkich nowych repozytoriach, co uciszy ten komunikat, wyk=
onaj:=0A=
podpowied=9F: =0A=
podpowied=9F: 	git config --global init.defaultBranch <nazwa>=0A=
podpowied=9F: =0A=
podpowied=9F: Tradycyjnie by=B3o =84master=94, a inne popularne to =84main=
=94, =84trunk=94=0A=
podpowied=9F: i =84development=94. Nazw=EA w=B3a=9Cnie utworzonej ga=B3=EAz=
i mo=BFna zmieni=E6 tym poleceniem:=0A=
podpowied=9F: =0A=
podpowied=9F: 	git branch -m <nazwa>=0A=
2023-08-03 10:32:00,173 - oe-selftest - INFO - Adding: "include selftest.in=
c" in /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/buil=
d-st/conf/local.conf=0A=
2023-08-03 10:32:00,174 - oe-selftest - INFO - Adding: "include bblayers.in=
c" in bblayers.conf=0A=
2023-08-03 10:32:00,174 - oe-selftest - INFO - test_diffoscope (reproducibl=
e.DiffoscopeTests)=0A=
2023-08-03 10:47:31,527 - oe-selftest - INFO -  ... ok=0A=
2023-08-03 10:47:31,528 - oe-selftest - INFO - test_reproducible_builds (re=
producible.ReproducibleTests)=0A=
2023-08-03 10:48:34,404 - oe-selftest - INFO - Building reproducibleA (ssta=
te allowed)...=0A=
2023-08-03 12:11:54,419 - oe-selftest - INFO - Keepalive message=0A=
2023-08-03 13:35:14,459 - oe-selftest - INFO - Keepalive message=0A=
2023-08-03 14:58:34,500 - oe-selftest - INFO - Keepalive message=0A=
2023-08-03 16:21:54,537 - oe-selftest - INFO - Keepalive message=0A=
2023-08-03 17:45:14,574 - oe-selftest - INFO - Keepalive message=0A=
2023-08-03 19:08:34,618 - oe-selftest - INFO - Keepalive message=0A=
2023-08-03 19:31:24,469 - oe-selftest - INFO - Building reproducibleB (ssta=
te NOT allowed)...=0A=
2023-08-03 20:54:44,489 - oe-selftest - INFO - Keepalive message=0A=
2023-08-03 22:18:04,509 - oe-selftest - INFO - Keepalive message=0A=
2023-08-03 23:41:24,579 - oe-selftest - INFO - Keepalive message=0A=
2023-08-04 01:04:44,794 - oe-selftest - INFO - Keepalive message=0A=
2023-08-04 02:28:04,857 - oe-selftest - INFO - Keepalive message=0A=
2023-08-04 03:51:24,904 - oe-selftest - INFO - Keepalive message=0A=
2023-08-04 04:19:26,061 - oe-selftest - INFO - Checking deb packages for di=
fferences...=0A=
2023-08-04 04:19:34,627 - oe-selftest - INFO - Reproducibility summary for =
deb: same=3D12137 different=3D0 different_excluded=3D2 missing=3D0 total=3D=
12139=0A=
unused_exclusions=3D['rust-dbg']=0A=
2023-08-04 04:19:34,661 - oe-selftest - INFO - Checking ipk packages for di=
fferences...=0A=
2023-08-04 04:19:42,786 - oe-selftest - INFO - Reproducibility summary for =
ipk: same=3D12127 different=3D0 different_excluded=3D2 missing=3D0 total=3D=
12129=0A=
unused_exclusions=3D['rust-dbg']=0A=
2023-08-04 04:19:42,830 - oe-selftest - INFO - Checking rpm packages for di=
fferences...=0A=
2023-08-04 04:19:52,644 - oe-selftest - INFO - Reproducibility summary for =
rpm: same=3D12127 different=3D0 different_excluded=3D2 missing=3D0 total=3D=
12129=0A=
unused_exclusions=3D['rust-dbg']=0A=
2023-08-04 04:19:52,738 - oe-selftest - INFO -  ... ok=0A=
2023-08-04 04:27:21,489 - oe-selftest - INFO - ----------------------------=
------------------------------------------=0A=
2023-08-04 04:27:21,490 - oe-selftest - INFO - Ran 2 tests in 64523.097s=0A=
2023-08-04 04:27:21,490 - oe-selftest - INFO - OK=0A=
2023-08-04 04:27:25,783 - oe-selftest - INFO - RESULTS:=0A=
2023-08-04 04:27:25,783 - oe-selftest - INFO - RESULTS - reproducible.Diffo=
scopeTests.test_diffoscope: PASSED (931.35s)=0A=
2023-08-04 04:27:25,783 - oe-selftest - INFO - RESULTS - reproducible.Repro=
ducibleTests.test_reproducible_builds: PASSED (63141.21s)=0A=
2023-08-04 04:27:27,913 - oe-selftest - INFO - SUMMARY:=0A=
2023-08-04 04:27:27,913 - oe-selftest - INFO - oe-selftest () - Ran 2 tests=
 in 64523.097s=0A=
2023-08-04 04:27:27,913 - oe-selftest - INFO - oe-selftest - OK - All requi=
red tests passed (successes=3D2, skipped=3D0, failures=3D0, errors=3D0)=0A=
=0A=
So I think that this will finally work as well for you.=0A=
=0A=
BR=0A=
Piotr=0A=
=0A=
Od: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
Wys=B3ane: pi=B9tek, 4 sierpnia 2023 10:43=0A=
Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>=0A=
DW: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
Temat: [OE-Core][PATCH v12 1/7] path.py: add support for ACLs and all addit=
ional attributes =0A=
=A0=0A=
Extend `tar` command inside copytree() and copyhardlinktree() functions,=0A=
with additional parameters, in order to support ACLs and xattr. The posix=
=0A=
format doesn't need to be set in here, as GNU tar switches to it whenewer=
=0A=
is uses --acls and/or --xattrs parameters.=0A=
=0A=
Additionaly change preservation of additional attributes for `cp` command=
=0A=
to all (meaning mode, ownership, timestamps etc.) not only xattrs, which=0A=
were previously.=0A=
=0A=
Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
---=0A=
=A0meta/lib/oe/path.py | 6 +++---=0A=
=A01 file changed, 3 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py=0A=
index 0dc8f172d5..56e8e214ac 100644=0A=
--- a/meta/lib/oe/path.py=0A=
+++ b/meta/lib/oe/path.py=0A=
@@ -92,7 +92,7 @@ def copytree(src, dst):=0A=
=A0=A0=A0=A0 # This way we also preserve hardlinks between files in the tre=
e.=0A=
=A0=0A=
=A0=A0=A0=A0 bb.utils.mkdirhier(dst)=0A=
-=A0=A0=A0 cmd =3D "tar --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p .=
 | tar --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)=0A=
+=A0=A0=A0 cmd =3D "tar --acls --xattrs --xattrs-include=3D'*' -cf - -S -C =
%s -p . | tar --acls --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, d=
st)=0A=
=A0=A0=A0=A0 subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess=
.STDOUT)=0A=
=A0=0A=
=A0def copyhardlinktree(src, dst):=0A=
@@ -119,7 +119,7 @@ def copyhardlinktree(src, dst):=0A=
=A0=A0=A0=A0 if (canhard):=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 # Need to copy directories only with tar first sin=
ce cp will error if two =0A=
=A0=A0=A0=A0=A0=A0=A0=A0 # writers try and create a directory at the same t=
ime=0A=
-=A0=A0=A0=A0=A0=A0=A0 cmd =3D "cd %s; find . -type d -print | tar --xattrs=
 --xattrs-include=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | t=
ar --xattrs --xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)=0A=
+=A0=A0=A0=A0=A0=A0=A0 cmd =3D "cd %s; find . -type d -print | tar --acls -=
-xattrs --xattrs-include=3D'*' -cf - -S -C %s -p --no-recursion --files-fro=
m - | tar --acls --xattrs --xattrs-include=3D'*' -xhf - -C %s" % (src, src,=
 dst)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 subprocess.check_output(cmd, shell=3DTrue, stderr=
=3Dsubprocess.STDOUT)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 source =3D ''=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 if os.path.isdir(src):=0A=
@@ -130,7 +130,7 @@ def copyhardlinktree(src, dst):=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 else:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 source =3D src=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s_dir =3D os.getcwd()=0A=
-=A0=A0=A0=A0=A0=A0=A0 cmd =3D 'cp -afl --preserve=3Dxattr %s %s' % (source=
, os.path.realpath(dst))=0A=
+=A0=A0=A0=A0=A0=A0=A0 cmd =3D 'cp -afl --preserve=3Dall %s %s' % (source, =
os.path.realpath(dst))=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 subprocess.check_output(cmd, shell=3DTrue, cwd=3Ds=
_dir, stderr=3Dsubprocess.STDOUT)=0A=
=A0=A0=A0=A0 else:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 copytree(src, dst)=0A=
-- =0A=
2.34.1=0A=

