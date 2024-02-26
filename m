Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678FCC54E56
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 14:41:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.138])
 by mx.groups.io with SMTP id smtpd.web11.21659.1708958455668094328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 06:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=Y4CAJFHb;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.138, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLe2kU1e1XvDG6fvCY/C/tYfOif78mmxGHFnyDwUMzjrFmQpE15zxmkQfwbrUkbiveyuPTePfZG3RRRAAtbhLfb27+e3G604kgpjJO2NUgAJV4EvYkI3Ub5ePedm3EiLO4BmkW4I/WOB7xkOLzd5qTdh33L/FdCSzmWjYMhaHk8UJRoTB341J/YkfCVGyT/5goRRTrsPiNrpHWjp6PzdmtPEIhZ6gISbc6hyORGCrPGf9414z1GvVk87S4JBscSegAIUp7ja7pK4N/0gKwKgUhxcxBCb1oEaZ86kyPgfk4cxLvdkr4D8obKcvYyNlptJXU/bZeAzo5+pjLhd8rK/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqH54TYEFAZaieTHobgEyxLwZtbKM4Xxde1XaFi9Y+E=;
 b=I7Tum1qjUXjzZ2yX/37gTKi9i4c7myZ6ssu2GSmS+ShTzoOw96lW/wxRcI5l3A5/c+lxz8hfIMIY4DUGfuGAfuudJOLjocIn3gNYphsMWLheN3tb/TVgaAaH6QLb6y/NXLpr2/EB6pJWXGyR0CXXwzoNKPdE0beowQsbRSMpFlc+FMv2BOIqQYd5O3f6J6pEQlh1C4HNVf9lTNX6Mw4lwDZ4N+5AqDdaqZHGShZN61mcOsOs7cUdgyqiGzti5uJ6m8MI9LrHSR3A32ubwWuQpjgtEy/WL1jcMdKPnq7mw0bq2U7tFFnVNc3DIoygfWoOlQoUhmyyVhXf54h1xOcSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqH54TYEFAZaieTHobgEyxLwZtbKM4Xxde1XaFi9Y+E=;
 b=Y4CAJFHbLPv1Matob8sYjl8tV55GCczaklPRlIOzpvdmradyMOWrMccYaiyuTGeFrF6A5VMX73d4t15KTcJo5en1I4XATbw3VoIlBONuO8GtjCUdUAqwjum4yaBNvZywCUun3zm3RXYgk8uFC7lUfkin4dM3+mnpZ7ItkjwXwUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PR3PR08MB5626.eurprd08.prod.outlook.com (2603:10a6:102:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 14:40:50 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::d003:60c0:6918:8a5]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::d003:60c0:6918:8a5%6]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 14:40:50 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [PATCH 2/4] recipetool: go: do not restore go.mod/sum file
Date: Mon, 26 Feb 2024 15:40:38 +0100
Message-ID: <20240226144040.2007482-3-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240226144040.2007482-1-lukas.funke-oss@weidmueller.com>
References: <20240226144040.2007482-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::13) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PR3PR08MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 104b791a-2287-4667-67eb-08dc36d8ecb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DdrPEdMkOCiDjQWpHMX4l23zXuq8ztGCgtQdRDpdMOxIMOq1vgQ/qX/5uk0dIL8VrsF9Vse8oqarJY16ds/2OjuuU/7d9YkvNpV6CK5k6BngY1AMqS2EiI7OcVK74aUEzTz2vFNysvpJG2oTD10+ogTYKwOWYT1CAgCR6RuoBzKv9PLtmruaOjSj6xkBd0APoOnX1oT/pm3Zu1sAHPKjeiwEndtivBvlfUG/o/psQ0UxwJ93Io/SN0dtqzy6jXWWv5KT7ZlQGrhPP08q9lkmhrKmn5q5SuOyOucPCp2K65p/4sisVOZ67MBTmHlJ0okvjnn5w2sgU5twdwnYhFpw43GlXNANdJM/yMGc0G0ZLZr+LHNW0oN+au2oXwEG/mDvWrGEW/JkZdIpjbI5hQzVyTmzTjP+NjQyYpONulLnhagPpbxAmGuhB9IXSwYN7U5TOHmD7So7ZuN9/47vy0gdimUhUVIwhZllBdqYV1ITuXfhjEn49WUI2tTj3nTYGvX8ax0ZHoB0povcAeBSZzYjN0Dn33i+u2/iUXAvvgOHgA5PPctIBXcNuJKC/vkhaTZs7suDcpOCZa40SulcnXCJC5iafRsTGhC0lIDX3yxFCvjoNYw6h/H0OlGTfQVp5+NS5qQgJAhwwkmajndpz//Y4IxDeqSde3mro5jO1WdXr/eaqPCqqPy0IRLMVCDMVMDXrheE9/8zlAN17bj/bF7DeQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xo6xUSW1nhQ8tJqgfhxFaVQlMyI5FFeCCsGAT9NjXWC5weo78ocEeY2Fs+PO?=
 =?us-ascii?Q?cdowMduPdgoh9q+5mQnrTkLycpQmQWXdgYyuna9ehNAtvc4aBGpBZGm/Nls3?=
 =?us-ascii?Q?nD4U3Jwq7CByB4bLMOQ0WX5JcFdhEKQmspueVSzY1Q6akQocnhsWmmjIEGrv?=
 =?us-ascii?Q?wPMMJSIP9wBkl+AomJ4TSgLXHbZQKugmifi7eoY899XvtpLzitJLDZoSyLCg?=
 =?us-ascii?Q?O+/7Pu3sgJvmUf1Dhi+6xUgCJ+96U/zBMnDynFfrsrDaOFWAS9q+LEDVAkl+?=
 =?us-ascii?Q?NaH629NTQ3kC56LuFRSZWFyz5sOUvYliHXFzteSs6SRHd+FW9V/HdLmRBryx?=
 =?us-ascii?Q?iMUeNceV2JVNp70xVhCBYa9WcYFE+NYjmdnNtu/Tt1Tq23bjcZfJu9v83JuS?=
 =?us-ascii?Q?/P8+jPbHGNhtNiQGG2QoXz9hL8Nlzw3SYhpRBvNt+LE3pccfsNYLc+sX+qVr?=
 =?us-ascii?Q?VzmIGh6sSS9ouC/c8y0j2x/qJgfgQNx/fg9AJf2BzaWBLdNL/yskxiBbf0q5?=
 =?us-ascii?Q?baoI71qmOPlwp2EbkZSnFp2BPI79VK5/o1PnFvm5itAZ1ZHBf8lPWPpOQBwb?=
 =?us-ascii?Q?KB/HSqiQGd5CFTgErQPSdL5KKHYTzAH79x3CsTwHS1bYaEBHREuAmcuIfcJu?=
 =?us-ascii?Q?Zsik2nIJaAiYyzpPNvcFkLwzr2sJgTNy2qWJE2UgMngqY4VOrKi6xwwRr+mV?=
 =?us-ascii?Q?t275g84PFSGkc3uOztIZHl4xUNEMZpOf9yh03kvyJtvmkcsqB66Zr7k5aIV2?=
 =?us-ascii?Q?+0V5J+rL9GnvZy8SBvVW2YyZ/v53hs9YHVdzHnFyr1sfJfkQGMseFxgrH3jo?=
 =?us-ascii?Q?nP4IGHShhLHt9GQ1RWESv9FzxlkYIjP+W2fKVBCEnXOV3UIgw8O2FOBpOp+2?=
 =?us-ascii?Q?0r6y4wQOru6/oDhL6UrVk9KTsuS4VPE/jgWN40rmX49EhDHeHWGqty7e9YsG?=
 =?us-ascii?Q?l0eDAo2RUr9Z3S2EK3ae9Bcu2alpkJfYZC4os2IdjX//fBFbeIB8fsWx3OyT?=
 =?us-ascii?Q?9ZW0XOAwBn0Y+WxAqR4XJOJWgz15xXM4K+pBKOT/sTC70Hi83MAEtYioL/I2?=
 =?us-ascii?Q?oaAmsaCp0Vwd+p+KWd/qEiBZR0H9+zi4KKHo2N0EKxCaFWMujLv9AeonpbCn?=
 =?us-ascii?Q?1WtXovoLDHutX703HRoE/iPjyJMwlMXG1wQZrJEPs3h5m2Yz2REwBIjL+6BA?=
 =?us-ascii?Q?W8fAFyqS2D8On3891GRCU8O+BSNy1LPPcq9182JBN/fnMCgnNh/gi3xInqyN?=
 =?us-ascii?Q?/HkwZkXuldGF1RpP52hu6tMNiLNJKq/98VGxvQXSbGPsoFE2wujuR11wPk0Q?=
 =?us-ascii?Q?HJs1IKumH2oU3lpBdE4E2DJuiJPZgPtivyVBLNX6Z+sNgtzdq+IA0QPvG/RQ?=
 =?us-ascii?Q?lh5Pt5dQlDcZPN3XCQFgAeeb4e29gelKFr68pp+qyXS2Urn2X6aMMYi2JmcC?=
 =?us-ascii?Q?jtwqlwv9JtHdkPnB19mZYENAsdZ7lWHkMw1geVmZrINnfxoN3hcTdfs5xpbe?=
 =?us-ascii?Q?rY8zcQkKjb6UkVi6ISQ9Z1l6kkJLGswtIcyhqoowxyFqB7S+eSkrdU44Fapc?=
 =?us-ascii?Q?2otEWhCeT0XkxbyqvzJ+G4fGQYoBftjCrXUNxQElRfR5I5x+aOq8SNHRiZVM?=
 =?us-ascii?Q?eA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104b791a-2287-4667-67eb-08dc36d8ecb1
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 14:40:49.2409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 601o2yBbF41kVaxRmSKmjDcEcclpHqQ0YW0NzvGkCU0sqvwsJiL4GdNdMyWHqUQYvOPaCXv1J6hlXSJxoE73hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5626
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196209

From: Lukas Funke <lukas.funke@weidmueller.com>

Do not restore 'go.mod' and 'go.sum' file after the projects go version
is updated to >=3D 1.17.

When we leave the go.mod file as-is then vendor manifest is created
using the < 1.17 version. This results in an inconsistency between the
patched (newer) 'go.mod' file and the 'older' modules.txt.

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 scripts/lib/recipetool/create_go.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/c=
reate_go.py
index c560831442..abe1f6e0da 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -598,8 +598,6 @@ class GoRecipeHandler(RecipeHandler):
=20
         # Create patch in order to upgrade go version
         self.__go_run_cmd("git diff go.mod > %s" % (patchfilename), srctre=
e, d)
-        # Restore original state
-        self.__go_run_cmd("git checkout HEAD go.mod go.sum", srctree, d)
=20
         go_mod =3D json.loads(stdout)
         tmpfile =3D os.path.join(localfilesdir, patchfilename)
--=20
2.30.2


