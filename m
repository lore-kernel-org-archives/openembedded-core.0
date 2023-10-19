Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AD8CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 12:32:20 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.109])
 by mx.groups.io with SMTP id smtpd.web11.26135.1697718737873937227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 05:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=Plh2ikuJ;
 spf=pass (domain: prevas.dk, ip: 40.107.241.109, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUGVzE6FFHnnqpTLWIK/mmv3Hw1vqzxU7zEV2x1HyRic6qgazpGl7zeq8VMygQ4iHwi3qiQ1kLeNEndQ2Q5OAahmSk0ID4G4LReXZ5M1l9tgcAFQsTnSgG7plsp+heg74w+kw2raOje1GbKv3QDcVX3pLjnNXxeBf2AeW/n7ALxx39ymOaYNt+C72jXx3KQu7ZfFGOc68cyPBq6KjPXxZTJKKdoHnS/KviBYkuDys5Xqu8TQy2rEf2XEQes9cG1ybVbBFDz7XmKc8AyGR45Nkej1VBJ896qFOkoLH9BIanrGbWJCktFQbPVMpSBrlRY30v+wxgBuhd+ctBc5GlBiSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp3DSFGKGq3p7HDBWPKJedDdjKRR9bBwWz7ni7AOeMM=;
 b=RD6TvEavjCwrIE59QTiP84DrMJ8Cf9P/n0lBETOtReI3BV53WM+nLhApAAnXgh/3pbH51LJw7E0OVfWUD/7n6rJvm+GfMnm9pXvHG2hyeXSvp9BuRnXn9bM7+x2UdEL9xja8xK4rKULUgaGDrLFRS8457qeiLnSvUV2rWoLaoYtIS/InQStdjAusRVyZcHJm39qpugYfe7L4WBvRO1WwBqXbxaB5676N9/ZE2rDUlVRyskq30QsrCpNUtdV6GxxqJYleB3+MRz/yPMU+IDiQOgPkZzNnZdA7h1Qhj60S+CPZxmzL7ZkTi/SUlDLVSXKfwoa/dLmNjKFKl9Ke3G82lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zp3DSFGKGq3p7HDBWPKJedDdjKRR9bBwWz7ni7AOeMM=;
 b=Plh2ikuJrL5HwPaAWyyqeYoyrsWzD+wDrNuAVmKDB9+ClPnhmzDSQNFUFIRpfux1xMc64BSGeGU1qC0syfkmNZBPHu8A4b0QfaSogGltfv69OftyxUyY3EqH7gdxWXSo1I6L/FhaPf4nHCfCm7lnNiMrBA4nAjwBRx6mrFojY2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by PAWPR10MB7365.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 12:32:13 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::52ba:4d74:6ab:aa5]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::52ba:4d74:6ab:aa5%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 12:32:13 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] perf: lift TARGET_CC_ARCH modification out of security_flags.inc
Date: Thu, 19 Oct 2023 14:32:02 +0200
Message-ID: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.40.1.1.g1c60b9335d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR01CA0095.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::36) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|PAWPR10MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f973515-8937-465f-265b-08dbd09f6bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TD+o1K92m30VHE3NEhV76TJ/K7rVP8o5sUkXqRWIfJHr1hDZsks1bTc41UjZaQVPwiGkfNVonHBYuRU24xJq+K2kg0JXutqdsa73cvOpKGwfgvwVCIJK8h8w1JEL/GGf+0hWTEAFG/upZVVVlcddywzaEoqtmqhfg+elUC7VfB9KiMUMhUOCxcCrtFKc0A6IRzgcdzfy9cwopPJ9HimwMspfxquoHCEwg8z6t2qhLsU/8k7zSDRX5YqQHL5LCEcezgq5C9Lqpdo9cnZWncj4x7z9e7Cfo7GI2tjJoAoRsWrk5NmtbmNMQkC56QzmfFkXpflVIt1bwHraR3d6Qp9Z2Lqo72DEio0bUfi9VoFnlTe/SY+EcNFtd4/O94jZj7k4CVXS7CqjlH0ddAklg3pIe6gUE2cHVa9+OYOb3MlBy0qile2t5j8w6TapDgcMxRLKRTLa6yoKlPRPMopU26fgyWen0o0ShkvJF7zGUgUHu+GxcjcYsDcRV+1c/KnQHpODy7LIfD9/ROnIUASsiW1k+kwkLSw5q7IWkBCA1HOqKQwG8L8pPDk/XcJNTAZ54SOZDlA6jCQcqZW6SH4FaaZFO6vhfWVNKctDVgInGdal0ksuKtVkGf/BxO7G84c1s9Vf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(366004)(136003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(107886003)(2616005)(1076003)(26005)(6506007)(6666004)(6512007)(52116002)(83380400001)(4326008)(8676002)(5660300002)(8936002)(15650500001)(8976002)(478600001)(44832011)(2906002)(41300700001)(6486002)(6916009)(54906003)(66476007)(66556008)(316002)(66946007)(38100700002)(86362001)(36756003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rOFPV9XuopMx/GfWOy+kXqDTMkMZVkclaOQrqHh3ZTxfvEdoFP6xdJC/CQ4Z?=
 =?us-ascii?Q?GXQr6TEiK53JWKD2hdNoxe5/9RAH+lLsMhccaqNYr4PKKW3LwCaQgj6IEy+m?=
 =?us-ascii?Q?SLrXsQLvuEP7MxfD4iW0n5tQ2UoUtEzN1Fn2/7aTQItDjDBOXbBggXvsjEt5?=
 =?us-ascii?Q?LVunw1fkrSUttFGmlcka7DwX9lOoMCU4icyuA291b6OFAM1EAyPK1wFTfC+d?=
 =?us-ascii?Q?kJ5lVaJ4a1wUhItGU/hitFh9jXvXMzV7ntvnG+bf7OnWGYSWn1eT4Oz/wJAz?=
 =?us-ascii?Q?5FdZySs8ve3CJc5agDfzfpSWVMhOCF4F+FOthQg7bw8fMPxZeuX5Y8uq1OlC?=
 =?us-ascii?Q?CrNEsMLQtvl7s4Q5J9waQ3pPD6Z5JK37SJAGnw3rnDl4zE5+Vy5jVBhTqEkY?=
 =?us-ascii?Q?Qst07NhLdmOBNkcm/YIsQl1q3vbPHcN/EWkzGBDekhLr72lGf37kyKuHjsm6?=
 =?us-ascii?Q?s6PSFXdr+8XyUKY87kooRRJ6E4iKxvUYZmtj//lqdzts+6wHD1ly1LjSDaUf?=
 =?us-ascii?Q?HvYMUwqlsSrYzN+QSo6GYOhQLGNJWVGb3CaT9ZyipEtyFBFshK7NMj6yUfHb?=
 =?us-ascii?Q?teINO1E+v+z9aPzVZbFeI2XKEEFgz43VfX9tIX1XUxnX7e1l1M4ybMfeKS8y?=
 =?us-ascii?Q?1cEAQfd1zEj1DmOc/S6Q5dTcyysJ1NqHxuSaAdS+89DEmCQckVXH0xJYGeyC?=
 =?us-ascii?Q?U2DfjKWJb8bm+1hJLPB5fVCHdPxZ/9oy9cew1HxOSCfCQ7tBASQZ/PDVv1NQ?=
 =?us-ascii?Q?5z32dh4lbZykwZn5a7gtXTW7bZWu7x0rmxbBOTM9IdmpCexuMhNusY+h1zUC?=
 =?us-ascii?Q?YFXBJ5RmVca7w6FC5ktwXL7kMGL8M45YTHe4Ew5ZZF+cH1fGEIrxh90N2jeK?=
 =?us-ascii?Q?YUZy1bXyB7y8ZvnAsGRIS5jiCXaPkATs6Q81WGSI/un+vLIyb8AkOrR1edfG?=
 =?us-ascii?Q?yROEVxmGGeIneMJIt5ApTlPys1BBlymNUIlpA07jiZeMs+j00jDTi5fJ4DSM?=
 =?us-ascii?Q?+xE9NBxf/8USYSyZ0+izqhdh1Xqi64gONB+h9cPtug4oDtd6JMtOk3fmTAHE?=
 =?us-ascii?Q?wk3mIZfDwLZ6EIhIbGb0ST6H6wMy5cWmln1di8Qzl+9IKDhO+wwoTkqfBMBa?=
 =?us-ascii?Q?T5amJD33tAus8cTsizaIlaOiSACEYfi1CyCC/sjXwd8qZpTPagaVozqAKRtZ?=
 =?us-ascii?Q?Z5tVbyZh61eOTnU2wVXlBD5+U8cVxD93on76A0+gwftBe+1cO5Mn0ZnnOBbv?=
 =?us-ascii?Q?LFjzZERV0T4VUZKHRoHyiBskOiswulaeMC3oYBjPqVvIdUyxpmSuTVObl3RX?=
 =?us-ascii?Q?pZRzadaOMBDKj3McZEGFQgzhoExDlTINKQRe4AntrnVA4OmO0MOwDpqFbYqv?=
 =?us-ascii?Q?5Seey4KjHZFkU9a7ByJb/qstk/xFMX1V/GzkrmiJf5Cr8kfh+hLPKMJrSrpN?=
 =?us-ascii?Q?sk3tGzKPyvOnkfY64wQH9T+c0Dbn9F9O0JXdulKBciN+Skr3L5ldsRh7lGje?=
 =?us-ascii?Q?dCONf9169A5UdJPZYPNCR+5MToOyhx+as7arFjD9wpq7j0vT6+M/wBzYo5PX?=
 =?us-ascii?Q?h520Ae1WNMvsk1SVzycQggbHa7RMB9RYBJtUy4BNIPNwNE5bZthehPT55ck2?=
 =?us-ascii?Q?iQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f973515-8937-465f-265b-08dbd09f6bee
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 12:32:13.4002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTJtCjcEueobA33bG1ZR3GACul6DmPp42Dr8GVN4pNsHDVxjXoXYo1B8BHDd9riskp+G6uSXHlTmDyWEbCc8OeLsEWsEdERLhcTyQRRXSTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7365
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 12:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189451

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Building perf without security_flags.inc being included in one's
distro results in the buildpaths warning

WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/trace in
package perf contains reference to TMPDIR

because the ${DEBUG_PREFIX_MAP} does not get used. Most recipes get
that from CFLAGS, but the perf recipe explicitly unsets that.

Now ${SELECTED_OPTIMIZATION} of course contains more than just
${DEBUG_FLAGS}/${DEBUG_PREFIX_MAP}. For most TUs, perf's build system
adds its own optimization flags (-O6 for odd reasons), so for those
including the -O2 or -Og doesn't change anything. But looking at the
.o.cmd files show that there are some TUs which currently get built
without any -O flag. So for those adding the distro's
SELECTED_OPTIMIZATION seem to be the right thing to do.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/conf/distro/include/security_flags.inc | 1 -
 meta/recipes-kernel/perf/perf.bb            | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro=
/include/security_flags.inc
index 2972f05b4e..d97a6edb0f 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -69,4 +69,3 @@ SECURITY_LDFLAGS:pn-xserver-xorg =3D "${SECURITY_X_LDFLAG=
S}"
 TARGET_CC_ARCH:append:pn-binutils =3D " ${SELECTED_OPTIMIZATION}"
 TARGET_CC_ARCH:append:pn-gcc =3D " ${SELECTED_OPTIMIZATION}"
 TARGET_CC_ARCH:append:pn-gdb =3D " ${SELECTED_OPTIMIZATION}"
-TARGET_CC_ARCH:append:pn-perf =3D " ${SELECTED_OPTIMIZATION}"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index 675acfaf26..a6110dedc9 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -72,6 +72,7 @@ SPDX_S =3D "${S}/tools/perf"
 # symbols and this is preferred than requiring patches to every old
 # supported kernel.
 LDFLAGS=3D"-ldl -lutil"
+TARGET_CC_ARCH +=3D "${SELECTED_OPTIMIZATION}"
=20
 EXTRA_OEMAKE =3D '\
     V=3D1 \
--=20
2.40.1.1.g1c60b9335d


