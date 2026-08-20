Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C82DC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 13:50:12 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7550.1787233806092360893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 06:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cL3iiT1o;
 spf=pass (domain: est.tech, ip: 40.107.130.54, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPfmGmE86kJKruMtYPftqVmDfMXCMpcWlVwgcdj2q7nbJllJfALx8JqlQHSl4zqBtiJVFCfXk3LPHbigqJTNG/iJDsD46njh5WJcltnORHVfE97kTZPgcCgiwsX/FWq7u2GgdAxu+1pYyc3RNdcfITg+MwoawgQ/0HbbBeYcog03u7isZmsISaQ9d17ztDJj05oPJEfwI8659+a5vBb3YVnZsl9shh5LaNDmoc5n6s6ckmpLs2Sd2bC8jMHmPZ3Sa/xNt0VEnazGxc/zy24BlGikuAkLf3LC0bMxx+oOyq78L229SmcnVr+OON7MuPfKgzvAUWmsmT0YUWxgHcKqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCT3ZH9ibZXruZxqM3/7NitF8TwnN9JD/6TpuOfOixY=;
 b=tOrpycZuYq9huzqHMVIBz5x3EwHJl8/S9bA1f3EX9PITlO3gsukz9et4ie6uSIBnk4e7D1K+glLUXIC8+SKVBAY2m0Gf4MJ5uqCQ5FBZNCnjscm2G45fxHOZAzjKvew5nMPE52AHxkVL5ZWNzDrr5Uy+nitmfnNropLGRqO7yEeyoAwIF/2zrefoAbgFndkRvopepTOxCfQ2UnwVeYo091YfYiuKdr5BOooPARRdis7c7khIzo6lk6pLwrCaLD3rJXvavvaS+2cUsIKbdacpFI5fPskqKMuRlnpzapn8TP5FYKUi9bz15kcq+6u19MGBIBwSX+rrZ52s6i7WZ/tWzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCT3ZH9ibZXruZxqM3/7NitF8TwnN9JD/6TpuOfOixY=;
 b=cL3iiT1ouIFS/cSu++DdsZDQi2NZPvdWPeqgdlrZVhSjAjZLtzUGFCPvG0nFtVMFlaB+QB75+FltjG0Epy80EPD9s8pri6Fh3Py7ELHRl+mrxFJ6fA5tO2TwWYW+XAIj8lOtCOfhfnBPJrhaDM95C3mUwyC/QTl+Fudd0kgxMOoKYg/GgwhtfYOTvQjr20SjnhthHRqqj90z86c38FN01r2mEqdf/b4Qo6ATPWIf8ywPw7T/Ev8vu/nsEHlsaUMe2HoEqXPs/VUCRKcjKwvH21hxwziq1zWcRHb7pXfY1sNPiCmyEB/U2v1sJBQbxi3UzbOmwvIHpE6kaxW6fh6tVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DU0P189MB2067.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Thu, 20 Aug
 2026 13:49:56 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.000; Thu, 20 Aug 2026
 13:49:54 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] lua: upgrade 5.5.0 -> 5.5.1
Date: Thu, 20 Aug 2026 15:49:50 +0200
Message-ID: <20260820134950.32831-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0288.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::21) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DU0P189MB2067:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f0c5cf-f799-42d5-3744-08defec1ea3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|13003099007|6133799003|10067099003|11063799006|56012099006|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	uyJ/rRiMbVdqiEW6EVVjNErg652mJ87I9W9vzhUvv+tbk7CIg4TNqfHCiTfzWPWhm7a+lwePbbnDBAPlpCc/phR9Tju7aFEx6zgK3ZHcP8dzOg/cr1hH0UaLKTg8y+nwFoJbpFKxuiAtHLa9uDwxbSGZrZJm8WHsjY/mNMIbHQchrpzU69GwKBw9zZ9L3npJMUV6fpAl05UJoqaFRjhTXWALNvSbuoj3jjSOX9ROtfyKyB2/br235GOKqGPPdhvlBlF7sd5bSL+wUjILP85+ZIGAklzo9PwAPyD7N+nCIyMacsdzO5jMVAqf3Eg3vE97v6jjA0HKpV9tJoEGd4ACF+pFtYUz+Xtn7oPeisOvf8ux6Ei+TjkqDqAjW+c8I/UstmwZ7gpeeXwDZVDekoHch8YPHSC+dz63IGALt1s49yDvQB8wMVk8mp892ye2ePfQ5bWnTVkZosY3CkRr9OZOKfYuIFEVdql6Hwg71ia7LC3zuaJ/7gu3wkpdNyrR8RBboAp5pGmFWFPJGtlCSuuQaskGi7ycmiBRb27ms4L2oLsoCidG7tQwiPthgzCeJUgOPhmRlr7/fBHcIIwiy8XaLE2gIpOT8SWJG545qn3+QuA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(13003099007)(6133799003)(10067099003)(11063799006)(56012099006)(12006099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TId1aN3ItSlvBR1Of73kFIV4k1qodyG39MFbFdZoGVbV+rJNe0qHubEMssBE?=
 =?us-ascii?Q?RR7DxnntGMBsMmygLBL+IvOXXNQfTR5LeOlGquqY/TJIZTz4+Y3/oY8SVAX3?=
 =?us-ascii?Q?v/r0TEe5GIWG2Nke6aMpG97MwxUIJ76XkiMQn7e6DCRg61gVCvYiazcje4f4?=
 =?us-ascii?Q?xLe+TJVfZ93dcHn1xy2C3OQEocU4osBKwviJTMHgUqDdCZpOzJNSeamueKV3?=
 =?us-ascii?Q?H9hyhAPezQ/soJJPcL+kzd3uTAxnrD9umiVkZE2g0jQ9PTWhuXNMrbMDF+mT?=
 =?us-ascii?Q?TzW1oN6DSFXK+YfgrMAcvG4ZmA5+mz2vKUTZPMZLzyY26LKqPcXHcCfnEy7x?=
 =?us-ascii?Q?cLQ58kKAeRjKGcpEsSARrT4AXAurNcu34E8cHYng3DW3gbJ4OYRq9qn7bgCt?=
 =?us-ascii?Q?rHO1nAaAD9sfjWJQbsqoeJva1w0gYXFWif0lT6uHIUM0KQ2RjaZ/qIO4+3IQ?=
 =?us-ascii?Q?C8W6a/VY8k64ze6B8CeXjitT+bxONfJPO6vvaXkY26kE1j8ao6dwdXKmhsNb?=
 =?us-ascii?Q?vTEJ5VHsbDPkXKxh9/EgupXzclisax1IWCPxmyN98K8i0U3kEVAnpT5QqWh5?=
 =?us-ascii?Q?dIGTGjQ6kiBmMA+iJ89dV2lfNuP8C1k+DqFggpuJ62b6ZxZBUFjqt/tfZ/Tp?=
 =?us-ascii?Q?LnKTx+2hzYEbM0L8oamnyhgCVE82oHKxs9DRzkF7CJTHzcUGKDfw7+8Qgz+K?=
 =?us-ascii?Q?yFW9wR0l2mahg/FEPEzh6jc/xjJ1pA8dCHAeEAEJFX8VqgsojCcIjaPgIjbM?=
 =?us-ascii?Q?57usoJBAlFuzNgHKs4UnjYe2w/uQgapypLuA6bqhfoIopYKUqzUYWz52d+W7?=
 =?us-ascii?Q?TJL3965hMb+XkI/KB5kGZh506yFZ99bTKDLYu4gY/8Rna9Lcn0b28hJpUayR?=
 =?us-ascii?Q?OcqOSznD1IQe6xb3YLXwz9wey+b9k613vD8cBi2JIGXRuDken7nUtAifh2Ck?=
 =?us-ascii?Q?r2rMm0EgnEvKJkD0p/LblKA7fdEH9n3QYOAJJOh2UdgdkfIOHDnsOZcqTF1l?=
 =?us-ascii?Q?7B9MkW5U65vCW/BTHWDI07xv4Pad1b0bJ07FEwx7V92qLKDyXB257pj3dnmK?=
 =?us-ascii?Q?/cq8TH0S/BoQTfJ5Yav13gkrTf8kx3DOErvcX3VKlbSJfKg9iEVURjy6F7eS?=
 =?us-ascii?Q?vJ4+ODQ4PgP+YAMEvWUeeZMMY3Qtkr4J//xl43x2fwe9AZ5sM76+hueS9hWK?=
 =?us-ascii?Q?lT2rpPXUJxUK6yoSTiIPE7eC7Tj6s/E/3rbqFuMEV+U8Pho5AWit+hwlfbr6?=
 =?us-ascii?Q?3j92TntME6OxpBF+cwfX/D8BRdQGsY7bZoFIDRvZyaYzq9qf4WXNlh7j1dT0?=
 =?us-ascii?Q?Z/wNk0Sb8Kfe0xvFMZs2c4vZEccizHsTFI1nadKjtvWmCZazcpoEcy1h8YYc?=
 =?us-ascii?Q?v2EgMNrqfAIZ7alBPL6DVT/URhSd0Ugr6FP5mQtFR1TKkHPE1FEj8uTAgX/P?=
 =?us-ascii?Q?qfjG/eAfzuIIP6ML6O4AeCmVxnwngxZXIcB6zr1WVokUt/ao9Zfn8woq0/Jh?=
 =?us-ascii?Q?GiFvK595MOKc71sUFtIC04cDKCCA4IM21y8xZCEN6holaS0OMAWM3/U/TP5p?=
 =?us-ascii?Q?VfZz8OR+SkdGxvlZ8+5xEaD1jdbwtflvQb/pU7keAUZme5zR3lQwtsqkFbBf?=
 =?us-ascii?Q?i6pDxdSUS7c2yKrmlsvEKndGHWrPvynZjC/t+oRxShO+0S5eYlf9JeBwFTl5?=
 =?us-ascii?Q?pOOmYLF+l8VSW9Sw7gF+kw+4JdbzgmAv2MSHUm8P2DQFugkIyehHAvT4BJDm?=
 =?us-ascii?Q?xaXr/5caEA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f0c5cf-f799-42d5-3744-08defec1ea3e
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 13:49:54.5856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEG0w2AfGov65Ex8OY2O/rhogoJuDZvGKBYiLcPqqqEQ5Ew2pxMbvHvPSAH4f/0DMl4BwfEVkiSbAO9js3XuQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 13:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243860

Release: http://www.lua.org/ftp/
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-devtools/lua/{lua_5.5.0.bb =3D> lua_5.5.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/lua/{lua_5.5.0.bb =3D> lua_5.5.1.bb} (91%)

diff --git a/meta/recipes-devtools/lua/lua_5.5.0.bb b/meta/recipes-devtools=
/lua/lua_5.5.1.bb
similarity index 91%
rename from meta/recipes-devtools/lua/lua_5.5.0.bb
rename to meta/recipes-devtools/lua/lua_5.5.1.bb
index 905dd01001..acf62fc855 100644
--- a/meta/recipes-devtools/lua/lua_5.5.0.bb
+++ b/meta/recipes-devtools/lua/lua_5.5.1.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Lua is a powerful light-weight programming language designed =
\
 for extending applications."
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://doc/readme.html;beginline=3D299;endline=3D320=
;md5=3D0e573c143cb6491b41cf02cfbcb8c267"
+LIC_FILES_CHKSUM =3D "file://doc/readme.html;beginline=3D299;endline=3D320=
;md5=3Dc3c162d21db328baa0fc31baece7c9d5"
 HOMEPAGE =3D "http://www.lua.org/"
=20
 SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=3Dtarballsrc \
@@ -12,8 +12,8 @@ SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=
=3Dtarballsrc \
 # if no test suite matches PV release of Lua exactly, download the suite f=
or the closest Lua release.
 PV_testsuites =3D "${PV}"
=20
-SRC_URI[tarballsrc.sha256sum] =3D "57ccc32bbbd005cab75bcc52444052535af6917=
89dba2b9016d5c50640d68b3d"
-SRC_URI[tarballtest.sha256sum] =3D "5e47bbfad7db2965d69580e918ee64edeb8d8d=
32de404b8dae9ce5c6d76a1472"
+SRC_URI[tarballsrc.sha256sum] =3D "1c4b4068d67061f2a2231ad2b5422e77acea148=
7ea9890f6320af614f4373dce"
+SRC_URI[tarballtest.sha256sum] =3D "da07b543872dc0bb2ff12aabd0c248578d78df=
3eb6b67efdc537a46d455c7f31"
=20
 inherit pkgconfig binconfig ptest
=20
--=20
2.43.0


