Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AACBC369D2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:12:58 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.102.160.18])
 by mx.groups.io with SMTP id smtpd.web11.9779.1744898735099865308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 07:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=kQ/z9fhK;
 spf=pass (domain: nxp.com, ip: 52.102.160.18, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vpb4NZI2KT0jigOr8nBYRp/LCPUxTJuPHOfhrLhNQs0PUaPXPdXTGFph3CQrCyKEHbUh4p0CoGJJJTX//iz93oa8oX1/wIgcJIb8Y0xVRYbgmXqwY1i9Rw2se57GF85Q7A9eMYZ7sWOWVIjBzu3mMzsrbZh2/9WjsQEkOeDzqwuh60vVtYV9Y3wxyqzBmx0aki0msdwdE6HdIJL4M6FADC0mSAe/Z93y3RlVWs+IqM7NldJFwawN3CDz4So1YRhYuw7RBYu8sg6KbV2A8r6HsCM5qSccXmqFal333PdJbnKBfqAr31BjTjLwIz6zhsXcd2Zhfq/speaLmLWKL5epCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAmSflRw1m65cJV1LziKtxY4qyjZvS4rJ3Mw+adQTFU=;
 b=p8YEPUAllmkm2sbd/E5BdEVR9zDg6c2HUZlc55YTwm7qqwgeotQ0OtX7DcHLafnbAfffI+zK//vAGonSKF5TS2jVj7S6jvBCUXP8jC9+je+nXe9BgFieDg5s+MQobcOpAQCt+2SFFa5CO8ta8j3QHM0br2sJ1JvcyjzyDNFBMtIZRF1Qoijo9PUFDPfPymMcceXVuhX5ZsUewRd/kGi1FjQOELh7caTkT41B+dkf7R++e2/qS+MnR6S6qs4IA+MnogEBuCjHLavPWRWGCG6zfBt78zFRXOlsX+X7VfBR76uoSg5XNRvMSsRvK6LufKuS+V8FQng7N0B5IfAb3srkCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=none; dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAmSflRw1m65cJV1LziKtxY4qyjZvS4rJ3Mw+adQTFU=;
 b=kQ/z9fhKWALHJtBnFofanx6zY0JPMPURR0OBQQeTlrKOiKzbh6imfl/yHqlNgV2WzWqqyanlObgKP5wmM7E/0JMSU03SoyYbwHdeK3vfZexlbHPG+dAfPdo7ARrCCLjQfma0jFIcm62E8kNLhT5m/pkRVkee0MpBNjh37ozZBVHX9VckBnGxDQTCemk0Ll6Ca3jyMOYc8NQwhuddSMwtWuHKKh+768iNrcL26Z7IOyVxvlE5ecA+Ps9mK2c+9+d0hUO/iAxQOzOvrEwGS92UKfwhVJqUKJ9Jl7geUeyhj9OKaYL3eraMnuICyvB3MxCRbiwmWnC7PcW/QYs5AsipZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8349.eurprd04.prod.outlook.com (2603:10a6:102:1bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 14:05:33 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 14:05:33 +0000
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v8 2/7] toolchain-scripts: Add Meson settings for Yocto build SDK
Date: Thu, 17 Apr 2025 09:05:13 -0500
Message-Id: <20250417140518.1720796-2-user@yb20>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417140518.1720796-1-user@yb20>
References: <20250417140518.1720796-1-user@yb20>
From: 
X-ClientProxiedBy: BY5PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:180::35) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e1ec83-6699-499f-57f0-08dd7db8eb16
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|366016|52116014|376014|38350700014|1557600111;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TJW4g/TksM31nw29OhPw7Z5JwIYH6oCdOs25o6E9nMG9S+2mO5JtHuvQ7pYz?=
 =?us-ascii?Q?clEGUJa5Ah27qW+XKv+us6tVbgl54Lod1g9u5kwSKgxQ3AUAoxZoGpqgCNyh?=
 =?us-ascii?Q?TaklvAZAZhoftnzT7KSW7ZGSvgShDeYOWbL+ELfIfseCeVonSPImLZCYblw4?=
 =?us-ascii?Q?dvFdPUX0Zd7Hiv20G3KeKl7jkQnHvL45MmpEzzJkkNFBdumX/gHd9LEZI5X9?=
 =?us-ascii?Q?lYahxPojqK92sRlt35JvY+/bX63ls9wYZqhxC0LSHLSZmyZwr2lDt4CV4+4B?=
 =?us-ascii?Q?r/G5g6jkHQ6AVkeLd4aaYHxTo1p2q2FHhFQAk9zsgv1p3UjlFIwJO0pOTt04?=
 =?us-ascii?Q?bGBkFPohEyNilwtt9WwDaOxW822+2bwIjto8Gmm7fjrehxg0aHuh68S3gH9O?=
 =?us-ascii?Q?qFh0RHhpxANmMDku/QNcXdjXCVXwhyBCWNJR7IJVTuJ33CYHU4H7Vu570V7k?=
 =?us-ascii?Q?jrKfDQ3iMvAwtDWdEa8X2U5MdcghN6L055ekpQX0/Z0O6zJ2pmJIpeZbQctC?=
 =?us-ascii?Q?S5zgjkVBCyzYrE97NSR10Ehi2O8Jx9hQODL0G6598B53ILZ4mCYODgUU0iCr?=
 =?us-ascii?Q?chkyfcxN0axTxf0j5joXrg3WZfvxzWx9eHrmVIQfa35ooURloGIXt8/KBLn9?=
 =?us-ascii?Q?13Ul+jg8NRzFfmiLc4RKSzWVYM0iFGMvgwljzg/OhP/rrJfoW6fHYswwfSK5?=
 =?us-ascii?Q?lDzUTePw0zDEFOI7Ejv+PF3p8o9vHH5REURuDW0CFRr3uch4nLSaKgO6VChe?=
 =?us-ascii?Q?xm3KbQkdIW7LAyjvPlmPuk1Ahx9yoDNsLzTEtOIL0oOfSWaYCkU68UVBFRZP?=
 =?us-ascii?Q?BuGZMtZ7FiYAf6PbqG+NalovSlODNf1ajUXin6NziPFaGu4vA3Zzk+24mP+N?=
 =?us-ascii?Q?bvI3P0azG6grSx0juO0kxpRbFDkhi2rj3ig5gFPXk1HS8/t1Z3EWkNLVAm2k?=
 =?us-ascii?Q?aTk34ASR0pE3DG8LKrCxcOnwdkQq+RwVfKyNPvrQht6gtfnHOKGPgNVxhXdi?=
 =?us-ascii?Q?+5FVnVrpw1pYmgM/CIICHp5BK3NNpWy8ItEOj2ukHXSPgQ4V3qdKdNN8QlVI?=
 =?us-ascii?Q?Z1XnmJZafWiuEUZwhRe1I4AzUWoDnDawKxAsHJHnOqYEcwiLFFtuL0wgXnZo?=
 =?us-ascii?Q?gA6Oa9KPp6aQqiiOnxbnZDeM6gogAobW1SDMseyyy2XyacvRCxQaA1WC0U4D?=
 =?us-ascii?Q?eeJvHZ+5dLvCAnEv3TKFLCKvoJRaqgjj0uJCXVVwNg2i2G2IWd8CgrKUnp+Q?=
 =?us-ascii?Q?KmmcEGQ+WIpHt8mpZJp0WDorGbbfyR7GdkCJ/ptT74BZcdc+a2/1byWxFbyn?=
 =?us-ascii?Q?YrkHyyeQZb2x6jMxlr1kxISZKhTQ6tSimcOJfdJaxuElmJ1+L56T3fNKxsv1?=
 =?us-ascii?Q?v+kbpOOc+ezDc/6H6GU505EkTBCb+Zu+ZYmxYcF0EQw2C4sFVWH44FEch2dd?=
 =?us-ascii?Q?e0ebEa3v2llk6O8vVpCZ6V8kDegm38OgVxsq4AwTj4aGYs9DXFQ5lIqM2hMs?=
 =?us-ascii?Q?PCWzKvMChkZojL1z3E0x0H1OBCMex2wbJdWpsXnX5Oqld5rKWISWDFDrLGin?=
 =?us-ascii?Q?WIK+dumSi6C0NefhecleaBP+jZS6LR2EoMO4FZvopngpq+9NJfnJrUjerquj?=
 =?us-ascii?Q?TjbLNJjCQbVfD+7EV3CZ1PuCRV/bSBrgjL1pe9MqLnURbZpH8xKamd1QP1ER?=
 =?us-ascii?Q?Vd+XYFo5qFfqunbKKaYfY5P95RgepAtM3sagJ72RKPZtA5jARyNym7HaD16p?=
 =?us-ascii?Q?wEO8OcWPClHUvTYCxWjsYy5xfBeLLQKXb+AnLEJ1wVUv4TgcPMXKt1SmON7y?=
 =?us-ascii?Q?Ay0+jLzQn2SY4baSXgp9aoaAK8nNYuu7VH7Nt1WqYocdI944RF6SSnsbrmfH?=
 =?us-ascii?Q?JYwPFwLYEKqmhVIGCYd17rdD38+xqp/CxlZSth+3I1/2Lslxqn64PaMnSXfp?=
 =?us-ascii?Q?jPm7WsZF51vdiFxEKH7U7I1g7orbEjU34WQmHrUwLXo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:6;SRV:;IPV:NLI;SFV:SPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(61400799027)(366016)(52116014)(376014)(38350700014)(1557600111);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3FPogQAM16JmgLayZwGAdgNEb1/IQchRFn1lw3PelQBhhsGpytsabdFy3kQg?=
 =?us-ascii?Q?zilHMn/bL7rcmYZdp5bsq4xvgMYeAtvU4SUJEX1S6rmnYLkqdAdNIszibNa4?=
 =?us-ascii?Q?uCQ43Ym2xv1cFMlT7kPZW5iuIYbuDpd2UX4Zgie+eI5u6vcLFAFQHC54EzuG?=
 =?us-ascii?Q?Qbvh3lhJddRFp0nfyqDkOEB9ETXEeopPX7aNtMAq5FDG9cSqwO2+v56d16No?=
 =?us-ascii?Q?Fy4aYACsy+JqMROHj2VcQBCXhSy0yCOOjcFYU0yVlzt0HvmCb7DOgjPQs+ZI?=
 =?us-ascii?Q?/S5n/NF6TRBKQGaqaAROXGCyaLNoVSCh3eYJ73QXNeaHTrG00DeFT8Bx8ORw?=
 =?us-ascii?Q?jb+PJxdfB4iUt7TUjZEO2jYNO17F+YxPXe9bXkrFmpqCj/0gVme/AryWU++2?=
 =?us-ascii?Q?n/1gsQH7tyEYTp5VJ9ioC12p89mwmV8IsgzfT2XLJEpIj1I2ST55cEJREWuj?=
 =?us-ascii?Q?ExuW3+yv9NoUDVbi4hwKt9l5BYD7kP2654wiuE/0jaz7UGyYZplfRu/NJ6Xt?=
 =?us-ascii?Q?+iAsxWHXVfCkR0iZt6MdeEqqtWQSMz/6N59MsP8U2ZFzo6+YpDoXL6SL/x+6?=
 =?us-ascii?Q?WMm5Kx03FAD1OK2MSLYXKnF1a2IJ8PiBf7SKONUeSe+mKT0Vki9H31KR6HGZ?=
 =?us-ascii?Q?Q9ZxD4alPYvaN3dXwnqXsve5VOfjViuj/+jWv5HdlAHc5WR7MxvonKOJHIO/?=
 =?us-ascii?Q?hxeUUiDuTPV4p7IXUzJlkmih3Lggo7HDnGrRtqCOBtjCtEksdBh/F+CePj9r?=
 =?us-ascii?Q?RsCLW/fiSZ7Wfpll1a8Gc2CzLa2DboEgKiuPH3WC7V1mfxQ8CT83cqkGkhz6?=
 =?us-ascii?Q?rrrdof/J1K16do8eGhIKumNsvDMXRovSOrVcrPvC9eUFonhlVZcZ5H6rvr4J?=
 =?us-ascii?Q?1SfvKJovQugEuK9Wc4gFeK4VAQXLNUlK0SHHR7GumpdT6Wpji4KcKOp12J3e?=
 =?us-ascii?Q?uImK5VdHMLCYbrXKzk7uR+S69IM61t6OX7rWJQTyIYQIkjtnfJ56GR6Xrwcj?=
 =?us-ascii?Q?qIGjldWfB/cPPqbbnFDBOygSITohO52KUx6sEXk2ae9LRnDs9iHJLvSvFZ01?=
 =?us-ascii?Q?bj/6DP+V+qJL8DGHFCHkqprNi3Tl/+Flypo1tsWg61HsIbVh7RwxkyRmYXaa?=
 =?us-ascii?Q?ddpN2J/BDiv8yiV965SiG7vsP+DCjowj9iC8+aN3voyQXtDAPN2Oc4n3N2kB?=
 =?us-ascii?Q?yE8+WBSiMzGwjFKgRZEdBPkgloOEpVCjomP0wnw+CJSZn0IbSfRD8IQrilNi?=
 =?us-ascii?Q?BoZznDKgiMn/TKPDPW2UTIjfMnzs0BswMomgIEqMCFGWPbo1yWwUuie75lQc?=
 =?us-ascii?Q?Xf/W0ve2VKo99en+twtakR4qBHvb/f3Hpa78m18qewg4ic73ic+fCVL8Hp+C?=
 =?us-ascii?Q?NR9gQRGgk5NtpT3kpxWIhxsamFnU/oR1Rqtajg9r9lWXlMxuRHHxeJR8snfd?=
 =?us-ascii?Q?tLf2IdkMGLPrysXl2gakXjlYrcs4uGKn66KDDwplvKxJvP4/w7Z+QviNyy7h?=
 =?us-ascii?Q?m7QHpLATl6Q3KFuy1kRQripbjE+YXb0cfL8eTjfEVySdORagKG5LfjQD1T52?=
 =?us-ascii?Q?yKNndCvKzxSvc6t6FqxhX+jKRTh/FYlRVzJEsozO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e1ec83-6699-499f-57f0-08dd7db8eb16
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:05:33.1150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJVSkrSFnDmKyJMqlZZlN7pORMsbJQ5Cf/W3IFBpvE2aZTSZqTmo5PjrE1EteM5TCdACU7r81PbKZQPq3w/vmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8349
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 14:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215092

Caution: This is an external email. Please take care when clicking links or=
 opening attachments. When in doubt, report the message using the 'Report t=
his email' button


From: Tom Hochstein <tom.hochstein@oss.nxp.com>

The Meson settings for the standalone SDK also need to be available for
the Yocto build SDK, a.k.a. meta-ide-support.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index b59a295abc..9e4320f876 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -99,6 +99,8 @@ toolchain_create_tree_env_script () {
        echo 'export OECORE_BASELIB=3D"${baselib}"' >> $script
        echo 'export OECORE_TARGET_ARCH=3D"${TARGET_ARCH}"' >>$script
        echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
+       echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-=
')}"' >>$script
+       echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'en=
dian-')}"' >>$script

        toolchain_shared_env_script

--
2.34.1


