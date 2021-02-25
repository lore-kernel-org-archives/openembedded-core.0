Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.87])
 by mx.groups.io with SMTP id smtpd.web11.71.1614278504753620391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 10:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BBiczS7G;
 spf=pass (domain: windriver.com, ip: 40.107.244.87, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CS6LRp3yO+sWhjt0kFzGGoDhfyJQ1jo296FHdvXhWqlTe0sYOi2g5VTa2rFmCSV8B7srOrAMPRlNBf2hakrqA+V2Vh7sYVwgG9h/ZI9A3Fl3IiBs4jQqTz3RetMkAZSNSF5RSztvToTsOwoObf7/4dOk+rIPQdJN+ndqWojR9NX2jAme2LtUhLgvCgA6NHcvwAX9t4yEw4NSx/nIR7pXqVseUWJHHxgbaro7ZncAmVbYUNKiyTZr+4EVJPqMFupRVKkov8NfVRilNhkglapYgq7isM5jwV27LduvWNIyT8irlpPFUetIIBJzdE4PRwNyKaOYnd4WwSCafxGrnrPkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGHdLAI/IWQxv20myX0+gxoVehnRrxKPE1saGC72FQc=;
 b=KbHKI4V/FRfqqJb0meIhiXE42QXmy0w1jGpiwPmpnmswmoLDPpIulqUKuZDmT5Dip0lRqlYygxxdW5xSKziJAKxibquome276bVVmKD9fd3Cbfo/wabYpx2fHJuOeqAWp0q4W8gDjRjMN4gEIZwhggBwNloLVldHWwKR/L1tBjSrJ+GCb6uUZkufyWsAk7IN/IVs2GUnWeke963jefW3AbIQo3sysS07/QKR9Ojhctw7owAIeGHx1rArRTtJEm+nF1fPLdux0y8wh3CMliwf1C9iVjdrdMI11/rKPwJkeC9ZD/AZSgt1h+pzUf4snqVbMJx8jSWCGZGE23eDJ6IcUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGHdLAI/IWQxv20myX0+gxoVehnRrxKPE1saGC72FQc=;
 b=BBiczS7GFBWWN9Ql8YkL1DpF0b0lK5weHBQC4X6sMmUrmuPPQmv5vZntkLrIgZZZ0KS30nP2pCC3XLHBzUO5Mq19v6cTMmYgdY3CBY5qOkzYNklweIO9z2qyNDrkI01lov+1iBr62Tf0LK3yO6NiaddfKRjf56UQzBaAwKP+U1A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BYAPR11MB2871.namprd11.prod.outlook.com (2603:10b6:a02:c5::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 25 Feb
 2021 18:41:43 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0%6]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 18:41:42 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] cups: fix CVE-2020-10001
Date: Thu, 25 Feb 2021 20:41:27 +0200
Message-Id: <20210225184127.7132-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR07CA0168.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::16) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1PR07CA0168.eurprd07.prod.outlook.com (2603:10a6:802:3e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Thu, 25 Feb 2021 18:41:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 957759fa-e406-4a28-87d0-08d8d9bcfed9
X-MS-TrafficTypeDiagnostic: BYAPR11MB2871:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2871378C85AB69DAAA11388FF29E9@BYAPR11MB2871.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GQxVhc4aKkRYge1M8P4MqOQSC1jXbqds3HUQVXtLUITQn0Lib9O9xNlC9NHnEn2ERU3ValGa1ZXj+4JiAv1vtibfTfxjFROPK85FiGJ7Aj1qYZd72Bh6rEKNEq0p7z2tp/9YtnJj0/ehPx1PyidiYntnFqDD1dlOuM23gNmnB0okX7wpdNN1d9v74lQAbRtWlQSQPnRUbB5Bh7lFDK3qrWEJX3EfdTc7yDNGG8rkTF3vuHSiDIdegxHK3kRaf502VzDKsA+KA15szfPJ67hKd03zoP2ocq7hxQzpSTDK/nXZp6bYbUt7bp4w1gHcABvIivKQKQLmjMHgOtpGneXZnoSjxIifGgNgI7Q9g3tnFeiN7lyp0cT7jt/WsyiSrOmQMlpFz99dqYzz1MKWj2Hisx8m7LerH6hGjMghPLUCyprZdSn9L8Kjiq9l0oZ8u/rH+eqZQbJ+A1OdCP6Uo/UealW6GMiWUQG0G0wLAWjXlhhWGQJt0LkF9RV3ScqSTIaAOTIW8AUg8bUYkt0dp3hdgBumVkfAuUwg7KGzqlJHZ0VwQepwZeFj4pHOIKwY4i0HcRtemnkDt+Iu6HZzCk/rMvOGZFqD3qLia+O6TxjgEB7ZfPD5zM1vmv4oPMIqYYwdiR2Rm9WplcnQeXxsip7UDHbS8YiIE6VKUVs0S+BHZWOC9VbvdhpOPJCY1RRwzZqT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(39850400004)(396003)(8936002)(44832011)(83080400002)(66476007)(66946007)(1076003)(5660300002)(86362001)(36756003)(52116002)(6666004)(478600001)(186003)(966005)(66556008)(2906002)(2616005)(83380400001)(956004)(6916009)(316002)(16526019)(6512007)(8676002)(6506007)(69590400012)(6486002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?LXFPt9Zr1qqB/qdkS3gtdWHStOxX+v6cop5f/hz89JsfngG6Y9K6//DS1e0I?=
 =?us-ascii?Q?VS35GSDHtKXGEEvUT/k5/JkfiiU/K07JMq4uHADWQim4mhMG2J7lrm8Nveax?=
 =?us-ascii?Q?vcak/QLCQABhtsgl9OcfQ570fz6AsQpF8Y7E1a2pvEGWB1sd6fMkb0UWxR8x?=
 =?us-ascii?Q?adr5GUq+sRGk4Z1ncBO2T5qKcuxbjsI9D6yngmqN12oZFGY2UkTdSSI+sg1u?=
 =?us-ascii?Q?H8RrWddnjSuCqb+BKsYM2jAYLRX631oaVLJOyn21hDku+fBUxfHIbmXI8t+A?=
 =?us-ascii?Q?xtp5a38dPx6Z3QlftiPJdJzy0lSKE6tbOzMDrmYnpC4N2tNfbPyY63mzn8zW?=
 =?us-ascii?Q?GZMYU+7KKRMVqkcuAZzKrAdoNCngU0N9zB7h5CnjdX8Lt45XC8f7qvICgzVg?=
 =?us-ascii?Q?Rr7wnPHrtC4mDJmAJXpnNDcQ55X9nVhWO8EROrBXfkw09uXwnfkhEB1YRKUo?=
 =?us-ascii?Q?vd0ztqJl4K2dQ0PBEPDN+9sqbBpSy6tbqNxs4eV3VMjsOrXR39+TllGBbs8X?=
 =?us-ascii?Q?g0c9J+cOzvJkMCq9VkYcNmFE3mX7jGcqVsZGxgEBf6OAPzyus9dgCIbT2z/i?=
 =?us-ascii?Q?3TJRMa/XxjdLh5o1jq5oxo+UNy0sqyCo+8EVCTT9JfPm23vbtny1q7u+4c3T?=
 =?us-ascii?Q?bNjvVXUlD3DM1DVpT18lCV0EOVJxmtpPRoiOJWzpEGN/ticCbUWYKBbyWwKB?=
 =?us-ascii?Q?JXTPN6NFUMEdyQ1qWDkt9aMapsC947nn3hAzSU19Z7YywSgofcVK61B2JepT?=
 =?us-ascii?Q?k5+nPr1IOyh8hZA+04nDg1Yd8QwUKlh/Evh4RpBZ797gW2NVZWdvWk4JHNFA?=
 =?us-ascii?Q?nZbxiPmwTPs1YAjMivFG+tmgCJziRIfoj4JKALAF8S+3l+fJ6jDd1cKKNGJE?=
 =?us-ascii?Q?TlKjFiy13Utmgd5e5uLPwaoZMraEIcfh04TUvfbrkngsONl9SWSsSFZ4cKBH?=
 =?us-ascii?Q?fmrTKx6L459oQTAD47PHf7eP53dE4XZ+SREr7TwUUJFOlU2ML/AlUhpoAWrv?=
 =?us-ascii?Q?/aw3h/aPYi22Bd6jZX1IrLLgiVicFsekSon2y8BYm5PxTLDj/8cqb0MmSkV6?=
 =?us-ascii?Q?9bMnbyiKv9NDt4dDwdmjCXrMqVMbejdO70lqswSjnX4H0uP1dOgEsCw7nzjv?=
 =?us-ascii?Q?O0rgPi/3fagtLUGMBUjFks3PVL3YAy0LECftxXH47ue4uO8ovOiswQvOOgcv?=
 =?us-ascii?Q?KFKXKkFFssmaNTMIlGBvpJJl9UrynCX+iIW9HOX6zmPeY3rCsQWefzt60SV4?=
 =?us-ascii?Q?orgv74DXXehN8Qgaa4qJbdzOxNh8tti/JoJmNPQoMdKJvuNQIYCD21GmWQvJ?=
 =?us-ascii?Q?ZdzmbNruj9wmJAu+l+xtaeDO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957759fa-e406-4a28-87d0-08d8d9bcfed9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 18:41:42.7544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiCR0STiigkCXKmUJtFXPL3ACTReqKSS8t5ZNVAKIus7KrhFrUgCHN5Queg2ID+LVrhXbt8NTY+07JMamIWq6ca+OAx475LC4iQfLeJEFK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2871
Content-Type: text/plain

A buffer (read) overflow in the ippReadIO function.

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-10001

Upstream patches:
https://github.com/OpenPrinting/cups/commit/efbea1742bd30f842fbbfb87a473e5c84f4162f9

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2020-10001.patch            | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2020-10001.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index e7a704134c..eaf7206480 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2020-10001.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2020-10001.patch b/meta/recipes-extended/cups/cups/CVE-2020-10001.patch
new file mode 100644
index 0000000000..09a0a5765d
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2020-10001.patch
@@ -0,0 +1,74 @@
+From efbea1742bd30f842fbbfb87a473e5c84f4162f9 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 1 Feb 2021 15:02:32 -0500
+Subject: [PATCH] Fix a buffer (read) overflow in ippReadIO (CVE-2020-10001)
+
+Upstream-Status: Backport
+CVE: CVE-2020-10001
+
+Reference to upstream patch:
+[https://github.com/OpenPrinting/cups/commit/efbea1742bd30f842fbbfb87a473e5c84f4162f9]
+
+[SG: Addapted for version 2.3.3]
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ CHANGES.md | 2 ++
+ cups/ipp.c | 8 +++++---
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index df72892..5ca12da 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -4,6 +4,8 @@ CHANGES - 2.3.3 - 2020-04-24
+ Changes in CUPS v2.3.3
+ ----------------------
+ 
++- Security: Fixed a buffer (read) overflow in the `ippReadIO` function
++  (CVE-2020-10001)
+ - CVE-2020-3898: The `ppdOpen` function did not handle invalid UI
+   constraint.  `ppdcSource::get_resolution` function did not handle
+   invalid resolution strings.
+diff --git a/cups/ipp.c b/cups/ipp.c
+index 3d52934..adbb26f 100644
+--- a/cups/ipp.c
++++ b/cups/ipp.c
+@@ -2866,7 +2866,8 @@ ippReadIO(void       *src,		/* I - Data source */
+   unsigned char		*buffer,	/* Data buffer */
+ 			string[IPP_MAX_TEXT],
+ 					/* Small string buffer */
+-			*bufptr;	/* Pointer into buffer */
++			*bufptr,	/* Pointer into buffer */
++			*bufend;	/* End of buffer */
+   ipp_attribute_t	*attr;		/* Current attribute */
+   ipp_tag_t		tag;		/* Current tag */
+   ipp_tag_t		value_tag;	/* Current value tag */
+@@ -3441,6 +3442,7 @@ ippReadIO(void       *src,		/* I - Data source */
+ 		}
+ 
+                 bufptr = buffer;
++                bufend = buffer + n;
+ 
+ 	       /*
+ 	        * text-with-language and name-with-language are composite
+@@ -3454,7 +3456,7 @@ ippReadIO(void       *src,		/* I - Data source */
+ 
+ 		n = (bufptr[0] << 8) | bufptr[1];
+ 
+-		if ((bufptr + 2 + n) >= (buffer + IPP_BUF_SIZE) || n >= (int)sizeof(string))
++		if ((bufptr + 2 + n + 2) > bufend || n >= (int)sizeof(string))
+ 		{
+ 		  _cupsSetError(IPP_STATUS_ERROR_INTERNAL,
+ 		                _("IPP language length overflows value."), 1);
+@@ -3481,7 +3483,7 @@ ippReadIO(void       *src,		/* I - Data source */
+                 bufptr += 2 + n;
+ 		n = (bufptr[0] << 8) | bufptr[1];
+ 
+-		if ((bufptr + 2 + n) >= (buffer + IPP_BUF_SIZE))
++		if ((bufptr + 2 + n) > bufend)
+ 		{
+ 		  _cupsSetError(IPP_STATUS_ERROR_INTERNAL,
+ 		                _("IPP string length overflows value."), 1);
+-- 
+2.17.1
+
-- 
2.17.1

