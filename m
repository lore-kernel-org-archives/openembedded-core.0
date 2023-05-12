Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0AFC77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 14:12:03 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.81])
 by mx.groups.io with SMTP id smtpd.web10.25993.1683900715226378454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 07:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=R7/uWlC6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.8.81, mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfB+YlgEpJt/n1WXKO2YGhmaazUORvilh33bscdOtRkJufmiPieu1Qly6q2q0qKCfvAC+hkJ83CYZpicEqO97QsV9hagG/DhGc/ltKK0DGOnkLrPRK7r/b4kUsDnqyCH1MyMroh1w4DMa1cmjlTDDumJoHuZ4wi2gdDgaIclG8WmYxZ00fBg82VbIn4s9+wxq1lQOrwibz4r/dkB//uo2ufM8VgMpe3UI0lqcodlxlwTYVpxV+bUP/U9J+kYtrhz2KMTzkPPsJyoY+Q7qQYg++h5gNHhK2JdTmHLBlMFk5ww0xIPQX6koEKCeUTuMk0QiCWruM0D0Mukrd4q5S1KgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaNnJG0y4r3L8NaX2x7DQfuQl2kLVo1TgCBFdnfQTm0=;
 b=Iyg/mxU2kQCbnAr5aiiZfQpHF7MpcnH1Xe9HwRa8SERTJiEFU4okrXX0DUhDTTTo7TkzvOh+/4ZfVb/g5Dejt1jWoMr9hzExiF6akx49XnTKHeTeHF/meTkjQQSAk9LQbdjqfiugQs5PmdAk+iHPL412ULnuBi+XAtBHu4I52GNUAJfy4nUQsT3OoSPxp58A7HyM7a6qedixQrq/BjLtcjec/yLSYzvjdNU1no8sEWMf1mQylMOMiNg0jjR3PgaKl8dnEjZrMYcZAyNj9A9Ojwf9ASX/JQgZwNVEFbXIy/0+ztUkNYZbFel5na/Q3uI+lghVAbHeM1V0V6kWdJnIsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaNnJG0y4r3L8NaX2x7DQfuQl2kLVo1TgCBFdnfQTm0=;
 b=R7/uWlC6bHvkB0rQMBrl4VFpB+Y2M29VqfWuIXWp9WsGSFo2BtEZhCGohLvA8aBuLViwEwdMBRhfhZkXlRvBeP8wN03Pj7t3daFk9117ZOYfFvt3VWEzj4/opJ6SikY4+pnxOrnOLaLFubEPlHMqM04vDrqpgHk9zbLM2YjiULgokVNWc5nAxhFkG+oYqi1HLI7bMHjnUkNp7u/4fFgFQmtk9Q7jHo9ZjaCRrM482hJBjHKLLVo1TRekXiOwhebc6RSDyyWsA8DIHgrM0oBXizEEHsKcGkhhcFFoBSqJrZmUR5bFgVCoOzZ1TXRNOtTpt8P0JITnkhTx6qHB2etahw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com (2603:10a6:20b:4dd::22)
 by AM0PR06MB6164.eurprd06.prod.outlook.com (2603:10a6:208:173::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Fri, 12 May
 2023 14:11:51 +0000
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::b4e7:5ac:7c48:4533]) by AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::b4e7:5ac:7c48:4533%3]) with mapi id 15.20.6363.031; Fri, 12 May 2023
 14:11:51 +0000
From: eero.aaltonen@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Eero Aaltonen <eero.aaltonen@vaisala.com>
Subject: [OE-core][PATCH] avahi: fix D-Bus introspection
Date: Fri, 12 May 2023 17:11:35 +0300
Message-ID: <20230512141135.308692-1-eero.aaltonen@vaisala.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0088.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::19) To AS1PR06MB8515.eurprd06.prod.outlook.com
 (2603:10a6:20b:4dd::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR06MB8515:EE_|AM0PR06MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c29e79f-4bd4-40bd-5135-08db52f2d4e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fAyAxk54Bnn8aK0Ppm2fcToXkC87LG1hYnO4btPNzXSPwp9610+YEoInFxHkrrELi496jvY7AOm9wGVjs0iWRR/fvOMvT2j/dWifBAK8hK6M9Xw4/91bppVLfKXYFE0a71BUBdJzhcPjqeQgcy3Br5Mz/Lpy32/PJYIUUA7C407tU+LH45rziXApFO/EYuWjeMlyIJR+E2nL9ThET2LeE3ZRiLale+w6jKzYKH092qcBWn0i7g8t16fhCurCw51eL+TsoyCa+7krX1fVq64XWeC3Dkv2Gtnj3WL5zZyFrWI9PotqHZN+v3vgUne1dtzBcjnWPsIfK8OJHUzO2mgN75dRNeJQu0Z2HbSmQinUBhHOo8UHdMV0P3YvmOJztFXwjPTVt9ZO/N7PDCrtfY8ltiptEICJGM7AcNfqCCj6+gXZ0tUgoN4Es2RT+taTfkeEB48glB+arG5N6MQ7CI56qfHi2mXI5XdbwtPpKO0rYp6lhYle16ko4S9FW8OUNW27PDZMOSJ90xJAKtWPKzwwrQTJFz0oOMcFFxnk8Wz6aVBeC6BSj/Wq5C2yJiRvkr9lyK6GrTJRfQdiLW8JVVbYJTvSqXM3VUkRSDDA6dba6VdqDarXuYWU7kuxDKmXu9NH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR06MB8515.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(8676002)(5660300002)(38100700002)(52116002)(6486002)(38350700002)(8936002)(36756003)(66476007)(6916009)(66946007)(316002)(66556008)(4326008)(478600001)(6666004)(41300700001)(186003)(26005)(2906002)(86362001)(83380400001)(2616005)(107886003)(9686003)(6506007)(6512007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iVEGVFt2ChdIOSUqndoi9IwC0+IiMYYqjECNHq45acXAZf7E/DqTCWnwawvq?=
 =?us-ascii?Q?lvVv4aMOKTUChcr2q6NmezG+e7YB2ls5mqd3tyTEoLX9plbEtcTrqN/8QY4D?=
 =?us-ascii?Q?O3hekcqKHZBXmq/92hZpKgOYn/nrqK4FrNp5fwB79JSgo7zMlx93eNPOT+U3?=
 =?us-ascii?Q?Gh2oyMaTLjqPkei38NhmKJvp85THzAAPVszMjeRO1CnSXsaCYkvmhn9jYqIH?=
 =?us-ascii?Q?NWpvHV3r/pgNzvuVfzbrrFC9QMK+1JJPxO3bMbaHBxxJOZF5PR37UtMc/3T9?=
 =?us-ascii?Q?1AaT97rHaLoiRzPHoH5NThPAzD8ZUgHr8IRrk2NBCHcs+3cc7B5ClMS7f4yQ?=
 =?us-ascii?Q?sCwu3X9gguLRqM8eV8veb6uXC7lCoWm5lOW2BKvsRiCwlJLAIXRpDb+ZvSLD?=
 =?us-ascii?Q?q4GxUy8oMso/ObwGsRnZPxd4yg4/onmNWmrp2dV5ybKT9yqUejdFWOB4yq9I?=
 =?us-ascii?Q?mKqYUBdggWIZi92jDxwCHH/u8MsX4z127IFPMwOch2m8faMcYqYOliUIhS0u?=
 =?us-ascii?Q?oPZWmLkGvwdBbvnCUp++3fk/xWeZbGXwD1DpCsCC6vWjPvrKMQEoe4bo7uUT?=
 =?us-ascii?Q?/Bk9Hro6KV3D+AMIYp7IqjFj38iLrCHdFc1o90CYLHdPegLBs1Mo++64506w?=
 =?us-ascii?Q?EKn5Zli3giKGaEDLLfTtmob1Sl7xy74yMMeBrhgK2dx34SgLVbPhvUvtmDvZ?=
 =?us-ascii?Q?3TcmdtXG5pLfH5OTZRmQyYdNrz3m4O7TD+yRsIyr+M2OCvfJhmdHfUipR3pP?=
 =?us-ascii?Q?EMUdHbQHVB9xVVGtzNJR6Ss2BdK76vgZOH/pyoZRtmYGsLOVVBP4PD/jwS5b?=
 =?us-ascii?Q?8uzXpJKz7fKSVJTJn7WpQ1bdEosqUNvSKu/OzyABz4FY5p+VbSYUCOhziiQt?=
 =?us-ascii?Q?FSQNw61w5DRsDQbW7zlzT7btx8p5mO3KbvWidFs9uVb3dhPj2iAjKbLgBCEN?=
 =?us-ascii?Q?03gWQ4rtr6Zsd1biQWr4EuGPoDo5h1HfUSDZO3/lpXXx2drzjXaZNGT+KVY9?=
 =?us-ascii?Q?6UD1r127B7a3Ty0GmnPY8T0Hg1iRnFz6F7vJMavDcug730eWQti+QNjfQ1Se?=
 =?us-ascii?Q?6Bm3dqObL96Y3yWCtQkUhomsCJmLTtVpVOAOmIZvdQHQRIEKYqDe1LUGrNCI?=
 =?us-ascii?Q?MsnugXTrqcX4mV9k11NKu2SrkmxKcLHyBCitzuEyIUONWl1JJ7PQWDYMN/iD?=
 =?us-ascii?Q?Us0sFqI0YBEGywJeg+Gx1CCDeSQ/Kl7o41//o97IyQfSCfJ3y1z3CiDE3oqp?=
 =?us-ascii?Q?o/AuJWJvKHH4BOtAw1h18+Ijep4Cek9iGO5Ov2SwBn1qWfaLUp77+1UZi2BC?=
 =?us-ascii?Q?/GVKtOme27SJdrOqy3XHA9M6xlNrQ+kMbs1YHUiZF5jVBUiiCwZDRFyVolSg?=
 =?us-ascii?Q?sfnaenkK54ODN/ODQ3Pqo9OaUy2xQX/HMx2qHbFZFk3TOv2tD+dgE0BRD6gY?=
 =?us-ascii?Q?2vf+cWz8WoQs/ENjG9PdW/u056Hs7Id08/ch91/GiQZxfjXsxRcL0/FlgaBH?=
 =?us-ascii?Q?oRBe+9JI4OSFukvHIymuA/PtW5pd0oBNVkRe1sm/QWzSKbWTksTTLiMjD3YH?=
 =?us-ascii?Q?eShMF5U9UxPXsK0+ruBFFkjrMMBtYGC4lVE/AzwUug+5v0UAdnsAOOABmFpz?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c29e79f-4bd4-40bd-5135-08db52f2d4e0
X-MS-Exchange-CrossTenant-AuthSource: AS1PR06MB8515.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:11:51.1965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IprxdEz/8NjTnBUgNIRE10Qum46RTS75RtCboMAHvjmCq387Sgex7lO6Q3kD+k32ISOzzY/m9RnM8V9w7x17VWefvsQUQl2GTlbjpwBWa9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 14:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181184

From: Eero Aaltonen <eero.aaltonen@vaisala.com>

When dbus option is selected, install and package the D-Bus
introspection files.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index bf6835e0d6..9385404838 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -83,10 +83,13 @@ RRECOMMENDS:${PN}:append:libc-glibc =3D " libnss-mdns"
 do_install() {
 	autotools_do_install
 	rm -rf ${D}/run
-	rm -rf ${D}${datadir}/dbus-1/interfaces
-	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${d=
atadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
=20
+	if ${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'false', 'true', d)}; th=
en
+		rm -rf ${D}${datadir}/dbus-1/interfaces
+		test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${=
datadir}/dbus-1
+	fi
+
 	# Move example service files out of /etc/avahi/services so we don't
 	# advertise ssh & sftp-ssh by default
 	install -d ${D}${docdir}/avahi
@@ -135,7 +138,7 @@ FILES:avahi-daemon =3D "${sbindir}/avahi-daemon \
                       ${sysconfdir}/avahi/services \
                       ${sysconfdir}/dbus-1 \
                       ${sysconfdir}/init.d/avahi-daemon \
-                      ${datadir}/avahi/introspection/*.introspect \
+                      ${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${dat=
adir}/dbus-1/interfaces', '', d)} \
                       ${datadir}/avahi/avahi-service.dtd \
                       ${datadir}/avahi/service-types \
                       ${datadir}/dbus-1/system-services"
--=20
2.25.1


