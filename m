Return-Path: <florian.bezdeka@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F7AC05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:04:22 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.66])
 by mx.groups.io with SMTP id smtpd.web10.23772.1675260251937087437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=TbWx948F;
 spf=pass (domain: siemens.com, ip: 40.107.104.66, mailfrom: florian.bezdeka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkAIfu5ylWk1BJlVjd4l801Q707IYdnPFoUdO8LeGvcSwY2CKcLfJpPt1w5YBmL+i1A3btFnX4ey8S617/uuoCQKZBr5tWNCVJhNa8dqs67vj1cEHU4lBI7LQiBgsN/f5SUyh5GsTmj6BWwXZF+VWd3IrX63GbrfOuZzqlOpuLwb5SkEEW4qcSEAMuoQ8apBz3fQKmpb5kyOMzQOXIA+8IxDu7F6mRRdQIovoqUs7daE17QLVhDFfFbpz8vDT5zZEJyQzfkghvaH59ty+ezTHcmFVbmraaCZlN2qtrsCtt6Tqh2G23w3pHaOMoMUU8cOUzl+AmhBLKuttYsZoPg7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sYSvyawOxwC6iHRAyxLfLxzOOr2jYL90jh+Vwf+5Og=;
 b=RCWdLdYDrDqhoWCqmbOe7MhNBvtw4Omp9WnqlSJkVnijUCt6/TiBGejNI68aVJVF7/+FPKnRzPw0UJWYdDlp/RRKZAIpsQUAnQDbQeXDoK5+ya+pcpTAHfR7UYcXcXAHJHUU5vLonrSs6qRm31CADNewXoHIKIpAB6WFOdkDU0cKBk9QAsGCb5Zz/+JVeyBQTuduFFkvaCi64FBxcl+lvZBt1VPUr2Mj4hVewGp5XjcnK1w5lgUKje8MhvaOLl4j3xphvqBlSkgReqaiYC7YzHAnp9lEI1zocfacUr1JVV0HhQv8B7M/Wtyh8vO1//T2Trw0Z3EZedlbGJ+IsZiDxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sYSvyawOxwC6iHRAyxLfLxzOOr2jYL90jh+Vwf+5Og=;
 b=TbWx948FyAoDbnS8oXuX8I2o6tAlNXWjbqUS8upJkI1+cCtKWhMknu08WahzwT/NKMLMeRwEZzankNUBEtZSkMetTpKy1BZT/PUz1PKQISM/cAVYG7B9LPO6JDQa/iDqRGRfrovNro/z1m1UCyn3KjAbXeMiT6ZMieKQHp7GZ4e5SUqs2t9HHb4gkXpbLRRoojMRuDMxoYZ4v7KF/dAuKHoBEKgvxw3DAn7a6BBn95MQrwTyaSp7Qalujswq+HqkM5W5JOzAl5WYhEqpYWG7Qy4vcD72CL3jw2LQIlz1bz8PPLCQuO0h2HTI+ir4poUxBctYmgLi4lH9YxZu/E+Mcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:248::14)
 by AS8PR10MB6435.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:56a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Wed, 1 Feb
 2023 14:04:08 +0000
Received: from PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2533:fec7:4a5a:fcbf]) by PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2533:fec7:4a5a:fcbf%8]) with mapi id 15.20.6064.022; Wed, 1 Feb 2023
 14:04:08 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: openembedded-core@lists.openembedded.org
CC: Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [OE-core][PATCH] oe-git-proxy: Enable oe-git-proxy for git >= 2.32
Date: Wed,  1 Feb 2023 15:04:05 +0100
Message-ID: <20230201140405.40726-1-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:248::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR10MB5712:EE_|AS8PR10MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: c68eb72c-2f52-4f1a-3590-08db045d2f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CmOJiqEpTZhV4SdDYXCfM3HVDF+1C6BkwiB13s2J8iLx//Cvc73kNHCeGJXifeh9Vsliwjsbz3vgH9I1O6NI0ejHrzRvVLicgjZxrxvUARKxU0A5ZYQTjaMkqjJlVUJLYJrhdfBfxCdbSpgVBIhZOpIAyP0v+CPpi/DKMM10tTdp4Hh0yJ3P2CZ+zmO+xZ4AocvGTY/ghmVanGy3ad0pfhP4XnFmzrUmaL23wUJ8me5mfFfJgJs/deYMddrkisA0FKA85ado8pfh1FJ4tSbkfCQh88PrpNDA2zxpkrP6PiNNIGKl2utSE7zbA9c/XMU0qhWRF9Mq81UJx6tK7NCboMH1CrnyGgwqDfSd4y35eVWUg1A17eGIBlTFGBLX1lBJEx2PV350hxTCPNTRN+EG8Vtv6OQe2Ae3cezb8aOZGyAKj1TeNTw79d2M5jjGG6HpXsU41zey/1LtfHwasNo2iuQZOQV+bwegwsA0AcMqjHa6a1PANNY2f86Bb3JUr8O8J7Rd4KO8aZq57BsfR/z5rSAioO+3F73hjVvkF/QbLUP5bbtTUn9K+VZKrgilLR2LCPoKk6pfRM1Fje5VOCDKGnIx9mk/+3rl6ym8iQZZs4ukudyMs7b/7m+ulMyRG6WiAFo3m1hYM5xTAHia9fY47szn3qGYIokmSyMOcTWl3IQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199018)(36756003)(44832011)(83380400001)(2906002)(2616005)(82960400001)(38100700002)(86362001)(186003)(6506007)(1076003)(26005)(6512007)(478600001)(8936002)(66476007)(66556008)(8676002)(6916009)(66946007)(4326008)(41300700001)(6486002)(966005)(107886003)(5660300002)(6666004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rJRvrvY6N+vnIqwTiI0riUu2L0TgkiAFkMyYUOAFj5lFT7Kru8m1lBqxoXYD?=
 =?us-ascii?Q?3hLrPwEl7kosrxo+C7aLNqM/pBBxP8RiT9y3u28U3CryXZY4dDO67qHLf0pA?=
 =?us-ascii?Q?plE2OGU+ydA742MI48p+A18+Ty2OxlQbiBm+2m/3SksOJ5ZygKM4GtgHTkCa?=
 =?us-ascii?Q?OYlB5fHXoQSmHJya978FmWrX1x21iLc5UmiD61wi1L4RuWnbHY3kdDUkP9Cc?=
 =?us-ascii?Q?JcScTI1NoLu+eLCUZjFW43g/4CWt9a4wMScNK8o0R2fdPXTFmKsSIw4YiE26?=
 =?us-ascii?Q?PSccMFgYdfQbouHhh5d4wP/sksgxh7SA81DU4Oe0QWnP2WjlmEUMrBKQRvTr?=
 =?us-ascii?Q?0wsmvAcqN7dH9q66vz+mKHSAbB46NH96sIlY2oXrunFbFPM93ll/ASPd0uS+?=
 =?us-ascii?Q?E1xLRLDOi3OTtGd5eNK9v/4stxmLp87ycyCs55+pyFkt9+cqPtyWj5npGo9k?=
 =?us-ascii?Q?qjiuA57oVgOMAK+GxFyL1HfQKDPJU5R6obdr4tfk8iSUaFdpTRgnkSWM9ggL?=
 =?us-ascii?Q?3Zk68XdLRKJguPq5yeTK0/F0w5ML8uQGa6NodDtGCYYuU4WZah/rxa7RCUKN?=
 =?us-ascii?Q?GT6Hukfz5AFO4a0ULmx7/KRNSh3ZTEQ2fEkDk1cMEg4SkbnCuTqyalnrLvct?=
 =?us-ascii?Q?HIYXSIOqwDTTgRqhvN1zx0xkbmxcZOcT0C991ojOaF3D6J1E7DXOAgWKydVP?=
 =?us-ascii?Q?L7NQb1YhXMCLUbqB3cYFzGGdODytr9jnqHRk8GhnSxbbPx7F1fyDi0YgcuRG?=
 =?us-ascii?Q?yEbSWSqafVaK7js5Hp6mbcjlXANVgq0Uw/V5exQRtbP1Inh2s1I5fpFejUai?=
 =?us-ascii?Q?EC/KuzfXyaDVD8QujVkmbvMb+t4PnME84EUdH1vr7BTJwRN01FLjhxRpbmuc?=
 =?us-ascii?Q?Imb7/jOh6oFBXyzGTBpiZU5GGlt6WdbIAg/zj3ickQzpFk1iKuBcIe4GdunR?=
 =?us-ascii?Q?trpaorZ37ZmTzxk3XTPYauFGYSf3J5HotjN5GcfDC3QkJkG96lax7QiEYQtu?=
 =?us-ascii?Q?v/5zBEEeuSWZN/853Ymo4srJALUCUEk1+H2UQdciiQojKprIhs0GfAN67vIm?=
 =?us-ascii?Q?JJM1PbETZnBT57Iv7Ng/2wv+YiCzpfGpooVEnFas3URE2OkNGy+c9QM607Yi?=
 =?us-ascii?Q?kKVmtwA1j4zYxQeAkzdrEP9koxIucg4/o/xiTkvt3amHsgcTQDxq06Y/G87K?=
 =?us-ascii?Q?13i9KdB8lpNrtr9XgDNafeM9zGyS9PoNM4CniIW/BlkPxnHyFYspHSuVrAHc?=
 =?us-ascii?Q?CmXgQEgQTHUuLXkrRno5Zv3/9YaKKml0CGe9wiKt/mfy2m3X4ayw6bJvcQ8c?=
 =?us-ascii?Q?cSHS0bWQHvOTmr5ouIPU+U5hJgzo82o/CMhl8K26ASRUbFZ/tqlXfGVNgRPl?=
 =?us-ascii?Q?a7FTx7NRH8VY5BFE7/ubXXn8gnELVQRkqcukGgG3ErTKyQiHzOvYJqew/AKC?=
 =?us-ascii?Q?ckpa9mMVsIWb7YWH12MVlR739Ufsdg3sTeDdfgQRe+X37gb3lrq675kWW6c3?=
 =?us-ascii?Q?HYY+fGpPkSjiZcewTbBxgBpNJjRzkf/QibJkCYSWK/We4RNOuPU+ljy4rW3j?=
 =?us-ascii?Q?ffsk/s5YikkqBXyxllSbL1X3NyMeM9D+es7cfX58YmyO3MswXKXP7+H/orhi?=
 =?us-ascii?Q?ekFLfFic5L3YM1be1yui/5U=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68eb72c-2f52-4f1a-3590-08db045d2f9e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 14:04:08.1830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flNB9A5vnfYn1L/cFurJxJPwfrtQQStMp6pN8mq4Tw6ZHVMLNQivwHXateHxnYLPVwDpKRFrkgANhht6F6b09BYSgGIsnXaJZCMqDii8vDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6435
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176533

Modern git versions (>=3D 2.32) have a optimization enabled where the
socket communication is moved into half-duplex mode once the client has
sent all necessary data and is waiting for RX. git is simply closing the
TX part of the socket.

There are proxy implementations out there that will shutdown the
complete communication once the partial shutdown was received - breaking
the git:// protocol.

Using socat with the ignoreeof option fixes this issue. Closing one of
stdin/stdout will not trigger a partial shutdown of the underlying
socket.

ignoreeof is a stone old feature. It will not break in combination with
older git versions - where the partial shutdown will not be triggerend
anyhow.

Link: https://lore.kernel.org/git/4831bbeb0ec29ec84f92e0badfc0d628ecc6921d.=
camel@siemens.com/=20

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 scripts/oe-git-proxy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index aa9b9dc9a9..80a7a030a7 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -184,4 +184,4 @@ else
 	METHOD=3D"PROXY:$PROXY:$1:$2,proxyport=3D${PORT}${PROXYAUTH}"
 fi
=20
-exec $SOCAT STDIO "$METHOD"
+exec $SOCAT STDIO,ignoreeof "$METHOD"
--=20
2.39.1


