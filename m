Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E944C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 18:38:57 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.41])
 by mx.groups.io with SMTP id smtpd.web11.2427.1662575936217153250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 11:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com
 header.s=selector2 header.b=RNAyliBd;
 spf=pass (domain: nxp.com, ip: 40.107.5.41, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mbnzhhtzqblvu5gL/K8L8jTb2VMGODvsitlMyZaMK9+X9eok0jqowsoZd/70HR+8B5qaBzIwc90saBH5mNspiBWYBQ0X6VX87pBh6XSa5wx2lCnyo/mfLeQ60C/KC/0xJ0Rgv29iyWIIBeq3UhdIjA1fjR7e9Diry+Eh0TPlwD3Z6zPfJ6yxgtp8GQgWM4s5swrGUjFNJFab/LpJOlkTqqhrG03dGcCwOQrq6o6+Q8mW/dUabXwDezaR5N4seQVrxBPfFvu5B6/4HqKOmWLg5erN7VS5hAW9L0cxRu5/74uEdkv3jyXIwWGpogdSnTHjrCUjvSVwAqyW5tGiwk7O6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECmQhjcP1RiQ7wS1abwwe5KpAS/xOIHjhkknz9685jU=;
 b=VC1MN6u7Th59i4DxcqTefHfNtWTXaTca4yIbctgxQo0WtHozVcrAYoz7XDdYIc42C3YwFd0lY+l3cjl0ZuuuUADHsk0lY1b0187A9u9v68bLet8w+PLASCWG4zE+EY2ckoLXEmh8unqIE8HFgNiHrpZpa4Vdz1WeQ5x0Sqr69JHWKmyytldeHoKnzer/UWdzu5F5MUMz93FgIzDcGBIvrSR5oEHUuGWCEslUyBpNewbn7U7YxHipzTuUmf73446dTnSwn8m1eNgwZpEeB3Rf4JSirGNqMis/dqU9secbVwBIAXo/EUcV7w+hPjzH1q5Q/9nrN4JRzm0DvPzqaA6XOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECmQhjcP1RiQ7wS1abwwe5KpAS/xOIHjhkknz9685jU=;
 b=RNAyliBdaBqDtxiJQmsFgzauUIP8CXcoEsOSDILyi4hp03cPwdQgkzt3MZ4TfeqHFYY1vh0qXojnTP01mVrYPTIgdox6hBME7rS9Px7k7qoVPiI72IfG2OVXinJcF5IisXLLoQNIsd5xVGuvZYSrHRSmwQqHr1CSfUXxj2SkzYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21)
 by DB7PR04MB4475.eurprd04.prod.outlook.com (2603:10a6:5:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 18:38:52 +0000
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::2f0c:165b:8713:d1ef]) by PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::2f0c:165b:8713:d1ef%3]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 18:38:52 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] connman: Drop redundant nfsroot handling
Date: Wed,  7 Sep 2022 13:38:33 -0500
Message-ID: <20220907183833.3734735-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::23) To PR3PR04MB7308.eurprd04.prod.outlook.com
 (2603:10a6:102:80::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7308:EE_|DB7PR04MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd039f9-a143-4b66-1bd8-08da9100363b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SJHKulATjiZ3cD1gNOBIBlGD8ZKfOwxBjrTm/9BNTPI0F2MH21eGWsf6ZExT4MWS6aUzHdeo+75nXArcNw8Kd41PFoNbvW4JZ/VrYJoPo6V1v1W8pEPbvEZb9fwPQGFhrI8PXOOHjs6OzjwAKgZ+mCzqyFDXlEBIlv3TG00BPaQRqM9A9Qz8CB0tJsKmoHoe8y+GCT2MI47STcrSx1LCpV3+PobMQoQz8L0PqvyC40CC0UJamUIAT0odwDu9OZFr80Ur/H0Cel57LllZiFHQcCMNpBRgDUZ8mluDvZ19TUh9+8bZHaFrerux5nyBpCpz1vs5EIAEMtM/JIt+CKI5nAeJ1bk8f3BA6xcSIUwuJBosMwfUC3uaEDAdjGb+7cSFr2pFDuH0GKXYBRZJZ7U/l3FO/VuvV5jJcutK8DBjit30sqEtNFPMXsKqy2Q9YVOghGhvU6JYnUcwLF44G7UoMLTHrr81+lAG32Fc+PkUYya3SwdmGZv8hNDnzDLwXiwmVblokAtTmH/wk9kNLJICJ0E3iGMr/Pe4DlPA1kjH6g+7QYfbUCw3gi8AMr/DCng0lscpr9PU+IqwSbhWJKOVdiEMCiyq0z6OQtOJ4eWN5L0vcZ83jburlmBOfATj2WsceKa1zfQB9jFnIIjSEDdA8esqL9dq6d2h0nvqgO+z/rzuG2rFEtMZqBqjdqhd4e7cCaKkOkN73K8uFPACaK/FSJ/TqUrAHSKQW7JE3S+7zqEvOvvnQQJGdIoGAdPSTX8aMNHkooLCBM7zHLbENQu5r7p0AyyNFAvQXKJq9oH+9XE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7308.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(38100700002)(316002)(66946007)(36756003)(4326008)(66556008)(8676002)(66476007)(86362001)(38350700002)(966005)(83380400001)(1076003)(52116002)(6486002)(6666004)(26005)(478600001)(6512007)(41300700001)(6506007)(6916009)(2906002)(44832011)(186003)(2616005)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aVzBSEow7zfWbGyxRGNU0mFZ0H1z3onIXbJM0omyPt9kk/nb2uOkQgsXQpyK?=
 =?us-ascii?Q?+knKmuvtqo9ageHkcuIsdwmExkcmKRTB7g0eqk1A8g/nXT6WNltjvh5zd6YW?=
 =?us-ascii?Q?YmU+ruZG6IeBZZirgm2ZvmVOSBGjQlhlY+LohksoQ3iGA0qGrLBgMtABilG9?=
 =?us-ascii?Q?JqOld1nTy7kHQBMZwzET73dEszUHEXnouAQ89tcl0C06g0jt4Itj3Ca4i+Xy?=
 =?us-ascii?Q?mgQAr+SDf+8duYZv4Kz4F9reZ1oxVoDDhgwDnMvj0O5FBV4MCWCxYYcHa5BT?=
 =?us-ascii?Q?CFaqzpYyG0uLbITNIjr5uykmQC3D9IoqeyTTRugJXI3IJj22nOJn96Va0fwj?=
 =?us-ascii?Q?6JiBIPBG4SZQFzDjZh/Ku+jnUngvidxpJqEZ3mch9Z75QpGeLCL8ws71Yhna?=
 =?us-ascii?Q?2GO7BuHpNZ5TNVa45hLFDItfoOvatw4Ojov+EpbE0vKY7vTcSIPS97HeTMCk?=
 =?us-ascii?Q?bj6BPRsCBoV6+fATm07+MdD9M+Ya2/WTCPsowj4p0f9Rjqsv+F2BFBFyBk9c?=
 =?us-ascii?Q?BgcmIZXcMNPGCGcMHcWNE9amr4Ly3lt8ekVQxuyHR1YGA6Q+k3bIyCf/eqH+?=
 =?us-ascii?Q?UeETXmjRkiLaeJttEn2OQIkCu+sWTTnCpS/BDA/CHRt4gFcxVaCgx8zSbKhy?=
 =?us-ascii?Q?sakr438e0jFfsTM8KMWC1NqEj0gsWbUDB5iWuW/SaZj/UPOqd467ObaJ5TTn?=
 =?us-ascii?Q?Q5jecHX8VSCm9rN1QWNcUrLJL7L96+b8LXGnGE3u40BHKZYIMCjxOLZoGhbs?=
 =?us-ascii?Q?rSLbgKonKgJe5nQ2t7eYyuFontc058UJ6DaY+nsjU+szsCOzjP0T7p2qLfgC?=
 =?us-ascii?Q?xBq8s3Nlgboj3g9u1ED4jIOsveZSmHJ+fIlj9QKQFol4A8iWPnwIrvkDm5yD?=
 =?us-ascii?Q?fn3G7ed/oUKq0fddMK0e/04HrCSVKY8GT9Y9+H6rGuB4TCfZKzv/lInZzcWA?=
 =?us-ascii?Q?YLwrFTCJaU3NxRzx4/+PPCvnfZAgPg2uIHGe2zDxVmpkNlGvXBrx3h7rV/oJ?=
 =?us-ascii?Q?m8rS3KZ1YH2w1MSY5100Uaw7HUsxq3JC8x89sduuIwCkBEPHJYa2RHZHYgVv?=
 =?us-ascii?Q?TZkb63Rqk03YPumT9GsASxH+acib62vDuXs20umnUo1byW9fv4YjqYPkvbPK?=
 =?us-ascii?Q?c+7GKec7vtof3D+s8K0WiBHInntKpagM00THjZQRdjlnkU8Tek9rGPsB/uG9?=
 =?us-ascii?Q?lzthc/cv7lm31e+mwc7X1lFGsjEE9NBT465UIEvRUJDF2ODciXphccHmroFO?=
 =?us-ascii?Q?EFlPlgtYS6FcG37k9Nk5W6i1CDnaALq/OetkthS4HQiCMkxDII1wJX1GbuD0?=
 =?us-ascii?Q?8FLvNHrpiw8l8hjob0CHzwE3o5Lpgu4jfQbPbz1ZPTgUEhSu1MMpS7SnQAit?=
 =?us-ascii?Q?Rusl91eAmGuIcauGBT/SSu4oBroeG1lN8Zrp5zO0VURqlJzAjkNbBTcHq9s4?=
 =?us-ascii?Q?BjgcVbNn/02LXnfoA8x1n8da5UAIPAkHgHMWQgTiZbo4L69/620tDLX7zHoe?=
 =?us-ascii?Q?zq9bik+vI9evJM4L0A0nPIUSZza7s/VMlkljmFsa6WkQd79AZs2gcKB8nwYP?=
 =?us-ascii?Q?WC7Ny6J1JTcS2GYdOp3YVOXKifZgd6ZtLdCOFD1ypkGjjskhjvVy96qosWZH?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7cd039f9-a143-4b66-1bd8-08da9100363b
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7308.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 18:38:52.5341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UsrBGdCQ3vZv2tt+cQWSwR6L257cm7RK7vQXJnMA41djdVQ2uKbWEhW1ndzQXPY0KBbO93Ge3c8fTuj20aewJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4475
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 18:38:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170425

connman has nfsroot support built in since version 1.34 [1], so the
nfsroot handling in the init script is redundant.

[1] https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=
=3Def0d26e6ef2b883193469f016117d8238c1c9658

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../connman/connman/connman                   | 39 +------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recip=
es-connectivity/connman/connman/connman
index 310a696863..a021fd4655 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -10,48 +10,11 @@ fi
=20
 set -e
=20
-nfsroot=3D0
-
-exec 9<&0 < /proc/mounts
-while read dev mtpt fstype rest; do
-	if test $mtpt =3D "/" ; then
-		case $fstype in
-		    nfs | nfs4)
-			nfsroot=3D1
-			break
-			;;
-		    *)
-			;;
-		esac
-	fi
-done
-
 do_start() {
-	if test $nfsroot -eq 1 ; then
-	    NET_DEVS=3D`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/=
p'`
-	    NET_ADDR=3D`cat /proc/cmdline | sed -ne 's/^.*ip=3D\([^ :]*\).*$/\1/p=
'`
-
-	    if [ ! -z "$NET_ADDR" ]; then
-		if [ "$NET_ADDR" =3D dhcp ]; then
-		    ethn=3D`ifconfig | grep "^eth" | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
-		    if [ ! -z "$ethn" ]; then
-			EXTRA_PARAM=3D"$EXTRA_PARAM -I $ethn"
-		    fi
-		else
-		    for i in $NET_DEVS; do
-			ADDR=3D`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\)=
 .*$/\1/p'`
-			if [ "$NET_ADDR" =3D "$ADDR" ]; then
-			    EXTRA_PARAM=3D"$EXTRA_PARAM -I $i"
-			    break
-			fi
-		    done
-		fi
-	    fi
-	fi
 	if [ -f @DATADIR@/connman/wired-setup ] ; then
 		. @DATADIR@/connman/wired-setup
 	fi
-	$DAEMON $EXTRA_PARAM
+	$DAEMON
 }
=20
 do_stop() {
--=20
2.25.1


