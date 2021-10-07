Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2864EC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:13:58 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web08.9630.1633601632378690486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=NZfarG+B;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.78,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHYuYmJ2UZOpJ8YAbUpwFJ1HqXFuxb7m6IXRHNYfW6u5xiInzQa6KEGLVHw3m7MIDrAIbdkYQqwowZM/g/nEX+M7EiKszFq3d1kkf0mZbbvIoc40uBvzx6y+9GZCI7AdZUjaodiI9udJr3nOcQ17QSn08+j8ToqCYPH7298OBfdIRZnIX/w7UlyUrJUzleSglIRuBH/2yWpP6/kqz0EglFuKx3e8qETZmdsQdH09YlOt0VnGcS7BOwqnfQaywYm1YxFU+m0gxpPgl6EKq6pMwT/OliVpOLS4Tmlu+4lgjPFfJaiQi6vtOUSDdshUj/uX/m4HDOLQW/dxAlGvAABZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pd9a95O2nWGpuNVv6M5zVfSdaB1EMHhgQQDL/P1G98Y=;
 b=Ar8BWYPSRExBquLI6EgKnYt++Z6RqDAxtd21M09EIciGcrjuqyjQr8MXxeY6/W0Vf9kYuOeF4M34E950NUymsF+QNXhBmkb7RMgqtHNZtwY0hVdK0tGbkQKOOZggQlTn+Kx66mtsxOs4Gx4Lt2savzGpAQ62DDG0xJUr32jkQzavKhp+F2gokFfQ1XLojeimIvEnRdv4Tb1zvi+lH1W0e/4IEnzW+Hy2+sW1VjW3SaO49bXVJZu7ijcIXVNSPxF2k6koyagrQokoO7GI0Wepexv3gnJR2Za6eM3P02ckq3elRvrvcPEJIzLY6+4JOxSfkOlE7ryRjbUi7nWCoxSFIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd9a95O2nWGpuNVv6M5zVfSdaB1EMHhgQQDL/P1G98Y=;
 b=NZfarG+BysGcSK8HrRXGaBEJDyWk4tFyOrykLckQecWkAOb5SomPKjIoedz2CAiKa5N3OYYCNHDD+49JM/hjSlx2Ic3/hiu+UAoWWoJMKsweHzupKWXcLLo2aNqgOWbXlCRy1lIAtVKpHFrQHfWM4miSeUHo+7InXX/9xdIDM1A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4649.eurprd08.prod.outlook.com (2603:10a6:101:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 10:13:50 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 10:13:50 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 07/12] recipetool: Add logger info for missing license entries
Date: Thu,  7 Oct 2021 12:13:21 +0200
Message-ID: 
 <20211007101326.11075-7-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::12) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.103.254) by
 AS9PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:20b:464::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 10:13:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a142320a-1da6-4cdf-2f16-08d9897b286e
X-MS-TrafficTypeDiagnostic: PR2PR08MB4649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4649DF6DE65F15ACC70994F8D7B19@PR2PR08MB4649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OFakqHDxkh6CzD7PmOwfy/C0szoMeW+d7k/0R3IJtoE0l9PoJkZDF0JQxDqzfTBdOqDfSAmOSV07LvmjDDoOSf65X05S+yBSg1uh4GHslNJczkioxw54lwKYpLA41qCJL/I3O0Xx4YthO+o7OpGQaWHVRls1eLDayvDh3Silu25AWfeGlUWE6VqldMN59ZVX+2VvrHUY260+IkbyviTCozlgKXC440rqxpkrrhDUjpoGU0wi6PwmIpbvzRTDRjFNAR7ByC/thtbjIlsZlYHcvJeRM8RINWLwBE2HqqF22OKIIvN4h2FFaAVVH2edLs1d69B9/06XwWrde3ZIqdHGaxXUMWA/XQlqHvAHEgN7fJxRzy+pAg9Lh0MV/cEOprEO96K68Hib9xULNny/QcYfhOIZfIrdy/AIuBaENDcuZTVc59sVHC9t7aQPBr2xiP+NEzyFC73rjC9smnF+czbsdjcuPI7zgfNHpxloI8SafwdcznHjEOnM5qSC+iYU7uBbwdYKg8FQZvDLl7ZNdbuwU8Y7Ef8POq6CvWruq3Wyenj/iqrF4NzjslN3v30ruWMKh3WM3JxDUP8gevJfQ1avxlDK9x6n4kTWrm4EAajJsMWXRP8oChZC1f0LrgO7xH5xwV+I83uCg8uahKIno45cWFGJ8bLeA5t9iMWP5OJ3AbuX3QVlwJkslipvBgHiQCdogYMt0wlEiwTmG99tkmsC+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(86362001)(6916009)(8936002)(66556008)(508600001)(5660300002)(6486002)(1076003)(52116002)(6666004)(7696005)(2616005)(4326008)(956004)(66476007)(2906002)(186003)(66946007)(8676002)(107886003)(4744005)(36756003)(38100700002)(38350700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lqvoDTY+AbFAyzf5vKsnpvg1rOFz39aDcY9BISiMt7dQhtW4C5FtZ1BU/ltQ?=
 =?us-ascii?Q?jvzPct1KhU1x3YnR/fF1vxkHCLapVoH4PjtMZHOyrc1uw5Hox9ZIAAdopHoO?=
 =?us-ascii?Q?g6RNcEkAfvO5tLd/nFaaqBVzdfZVIWCMpKClVBg3KVe/W4Yip87k4wO7XSYa?=
 =?us-ascii?Q?G/yTLuTLemeOTkO6OjLRBI0aGyzySGExK7Lf7xvjTVCxYuPB67E80ZSEhPOJ?=
 =?us-ascii?Q?hN+KBzQs6GQ6CLTQNvI0yN1/51wPxwsHRVj5OV/n7rHZqJTI91HDV0ZJReju?=
 =?us-ascii?Q?H7/DtCHdi9ONEeOrisKJ0KifXdsJbA3CVifke10a61XhLhVccg+VZ1qS9li5?=
 =?us-ascii?Q?1b//u72j7oGX3x7I96sI+FXse2r4/2IQW/lHPLHWmGdrsXEFc7M6ZXaKD2TB?=
 =?us-ascii?Q?536tLwdnceD8etiOoTigJ5gJW2AwSuGtBEQ2alXSjNs9N4W40suKcZHMrZHZ?=
 =?us-ascii?Q?q+50oxXaIJNMRoRAtNdHDCpsxwy4EOT1LipJ9Bu3mMcmd7pWHuO7VeK4aY8B?=
 =?us-ascii?Q?6LGE8UpKKgaQXYf0tNPyYiBM9VBeF0BnMUf5xRQQ2KBG+PE3Sio8/Hugmni2?=
 =?us-ascii?Q?FMuCGOxDLrlEgDN8xQEnN12lidrDrGMQr6k2IG5w3h5K+nMjlb9Y45E9QKRw?=
 =?us-ascii?Q?zxz/eVhL6SNMfRkRNl3ynhXk5bXdENykBoPyVg4CqC48R8hTAJi5jvGx1ifY?=
 =?us-ascii?Q?Fk8x+6HffqNH+yHJLBf1fpIl5dxIzPyEA0fhHlQ+SmpQkkWVkwJvyqHzkrI1?=
 =?us-ascii?Q?hA30/P8oFsq1tLYdlbWzbe4g1WSGOT6yDksEp9S9rxTk4k8eUb7e2jTBEI/j?=
 =?us-ascii?Q?YS+HGe1MK6vt/O1wTZKcfYXptamL7tkQOhSh5pdYelOSgHJUeBKw78lvGeN/?=
 =?us-ascii?Q?B01teHWlrdzaAs8Wzcoo5a2CWJGnsiZjAAaUyO68+gPLf++tS8lHsqhL89bX?=
 =?us-ascii?Q?hJf9MbN+nzWmpNqGF5QBPbWe9imzNhzzvCyUNXBbWUqssl0VO4sygGnm1zpi?=
 =?us-ascii?Q?hStbEGt4K0J0IbjHod9P2p9AHi0VKh/DjkDyb5SGhkzvC/IxoTGTuldenm4w?=
 =?us-ascii?Q?hkyG7LEtrT+v6F0LNxpBIL7FhNhsjD5LQS/Mz2RkCG/wTb6AUwLa7yr0oW8w?=
 =?us-ascii?Q?2knwVt29GVdbVaRfsMyU6GB9YihE7nCNF/1jB/pTrMo+XlkVu7X965szz11d?=
 =?us-ascii?Q?Mt/cmW3vAjFlWRExUGRUyOV4Ui/yobNP8K7pCnpdOEDCIwJpE1ZCxklNwhq8?=
 =?us-ascii?Q?pabZY2UU0Yt8SGnPa834uMTXsLtmGJF3387pb5is20Iy9UqKoC7G6ULfVL09?=
 =?us-ascii?Q?lXB+0TN04Gzow8wLXIrD2NiS?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a142320a-1da6-4cdf-2f16-08d9897b286e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:13:50.3590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7cZnPe7mTWpHEvsV4O3Pi2xFKa+Y/JpaF+eJVVMDAuSFJT5jUrHxPRm1H9TSuEQNpZpeqvUZcG/X1HU40oV79Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:13:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156713

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 071c845ed4..047462d389 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1127,6 +1127,9 @@ def guess_license(srctree, d, licfiles =3D []):
             license, crunched_md5, lictext =3D crunch_license(licfile)
             if lictext and not license:
                 license =3D 'Unknown'
+                logger.info("Please add the following line for '%s' to a '=
lib/recipetool/licenses.csv' " \
+                    "and replace `Unknown` with the license:\n" \
+                    "%s,Unknown" % (os.path.relpath(licfile, srctree), md5=
value))
         if license:
             licenses.append((license, os.path.relpath(licfile, srctree), m=
d5value))
=20
--=20
2.20.1


