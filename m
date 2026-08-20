Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D950C5DF85
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 14:07:52 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7985.1787234870004385295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 07:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Cx9sGjWq;
 spf=pass (domain: est.tech, ip: 52.101.83.64, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHJZJnJetWlXgrjjWJd+aKGtfEYBYZEIpx1e5sUlxx3f7pANHv6iXUCV0lyz6kx3I+veTC2AygV7ZuR8hBl3O8BYhP9dm4uCffhZ5mKEasuiSZyDsgW7lcpGDFfLZlwshHRCZfMlOZ6eSfFQWAYhZga0y2HtmC9mBcb2v9lMBJ6OG97yK9SYup9wCtHarzPvElrg8d909x/Av4QT9ol92WfJXFbCYN6I2BL6liyobXpzy9jU0jSCm9QB7TjR60Lic1RpY682vsROASk6RnDgAUmOUpQDeBLb5ZDHyoZlPTJEF0wVBuZV+JaCHVFjaWj3VSrW6Ix/xsgH6wCm6112lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a72gJ6E3fw930ieaNXwdfnWvQxJX8By1u1bBxRzBL8A=;
 b=mi5pDDdBmJ0V0IxAj1xl24NyXltMrtWck+NPbyXRRCuMW+8XDLRXRs4Y7FPpCam4OUcoSQn5vXkqnIKpCt1StH4N1SmoXICbFIPkuJ5iltRAUqYlQrYM5POGCBYCnyHg1ufFVy/i4hKMxvaNeffDHPq/6ttw4jTv/0ALjJU1lJcZVIlku9M+oL1F4IFvnWYBNzXgZbfWzwI5V/eM5iw3K7hozMP3CnIYyqCklhXS7H5POy+WfkQHRVSNEq4SOaZfJM2OGdG9McGogS3h1fTr1tbu4r7I/shZUDnPWSc4qLNNClvyrxWCFzN5CtcqHkfYQQXjbOpnVnA1lO4bAM/MiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a72gJ6E3fw930ieaNXwdfnWvQxJX8By1u1bBxRzBL8A=;
 b=Cx9sGjWqvo8rcy3Pt0cNloNEdk/HZ2AiEAMKS/MENs3EIvDgd7bLo01jo3Wz/pd23Myapu8gSp4kx6CxpPVqGEyweLbErCR9exe9VTyP6ZQ+ZwDrWDFknfdbxxV1nz+ieXC7G3utW/ZbLt2GvjAlYqmgAGpM8u5yO87CGk++Q/zhmIJSMJrEU4+z1QtV6SoSlOvyeKamUgkpT19MnS7o7swQh4j/VjwfJx0ciAapO24jepnpjgodDpA7TlN2XG9TtNLBzJpv8yYvr8lpN6HAaqYCGzD6DPe07+5RXNLo9HdjOcSOXVpRFFXSgrxQUB08w8i6S+yg9a11G5fBrdS4fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GV2P189MB2405.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Thu, 20 Aug
 2026 14:07:43 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.000; Thu, 20 Aug 2026
 14:07:43 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2 1/2] lua: upgrade 5.5.0 -> 5.5.1
Date: Thu, 20 Aug 2026 16:07:38 +0200
Message-ID: <20260820140738.34575-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820134950.32831-1-pratik.farkase@est.tech>
References: <20260820134950.32831-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::25) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|GV2P189MB2405:EE_
X-MS-Office365-Filtering-Correlation-Id: f818b97a-f3d4-447f-3a23-08defec46780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|13003099007|56012099006|10067099003|6133799003|11063799006|22082099003|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	9ssUockZ0VTcUALP+1JGH9LsItSfvJ0b3PMKN8jXmJy6MFzagLkF/znQmxMnOhCRcOo6f9/fpW7M3/HBhHvIxlkMtN64SM4jV19OT/OTCfG+Wjg4zxun0htO8bi/BaaXeqWTq3EettBei4ZbDdrq3ugLNxc3U4RT+m8vphlWshkhVyiL3XnCwbJLQeojJxaKuibqGx7DAyR2iPztPcu+sAJQjttM2FxtjYx4AKiQk2W9D5Lvxyl+UsgcE2i/NjpLGapPeS+Kgz2l+N4TESi1c8K5IhpHnjp+JZ9+unQBe4M6dConrn/NhdFmq/8RHw0SE5KmmNKE4DkGbfsMG8MFGbc5pKzyMgYfFKnZm1/gPhI70N1I6OFqVFLoKzmEICJBUpbX/tsyNkVJM+zOjIMvyiiOb1mT5HpAsVrug1Qy02/WGip4PiXm5ORJm0lE5WK3D6K5HYfvp+FOnrCavJluZTpaCmGjkGN+0taoZzQgoST5sjcnHcHeYW9VKiPjtuI00eY0g0RkYpnDkaIB1QpiXvcRaWCM9m6c51NgGIQhKeVKFA48BQxFvMsfK/P85o7iCGBwdufjpzmFh2+HovEGLCsWZQCVMVeD6uIy+2sIDW4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(13003099007)(56012099006)(10067099003)(6133799003)(11063799006)(22082099003)(18002099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oTgZmq4bMvHEL3CAhpM5HBFRXchWWm81wZQEFAqNhgHj3JyufkWff18E130w?=
 =?us-ascii?Q?oISe08nGY6ul8LVHixtpuOmm18fyoSXzuCBcfOPIsqCyYQWP/helEVSEjX6N?=
 =?us-ascii?Q?RyH+e4taDnhJgSARrfnm3gKT0/Kfbeb7s/ltsCFsdj05h4jmpLvxo7B4TY8z?=
 =?us-ascii?Q?Em5uAThychtG7Nxday0A21mH8wvw82eRhv/NR3ovMdyhIHn8yqhT4ae+auDZ?=
 =?us-ascii?Q?oHqTKinQHiP0dO531i6N2/SAJLQegw6D5MjvVVZ8yXFsCT4C5CvfRWIGwKk2?=
 =?us-ascii?Q?o4yzp8XiybrC+bjvtvYv4q4NrdSEX1qXMcubv0KVXelvYyFSxVDGfMz6BmE2?=
 =?us-ascii?Q?V43m6d+HAO1A512A83Jov9vTZ4nZHBZ0vX53Ez0ZFFT+Yi7R6BK227VzU0x/?=
 =?us-ascii?Q?LvLREwqhaDPKogwmfHB9aKB/avj8U7WF+GqE20qsSYfZh7kBpXSoiUvxnlUL?=
 =?us-ascii?Q?aE7vdSRN6LpZI+hFnglLJvkxaOzHHygtci3WRB03W7HtEruWkmcZp2kBsY76?=
 =?us-ascii?Q?quqHS1313Tt6ZcVDyKkM927q7KM6qTsq14VLLlq4ew8suTG1q/ngRmfyCdRp?=
 =?us-ascii?Q?lTuaLkmdoX+LmCgqRhBjiH7t5R0hie5WFgLpuzxn7Q1HDLiHqbsCXRvLtjGM?=
 =?us-ascii?Q?oq3rVi21GitNZm0nf827ixbDkuaDQKh02KPf3dbeMH9D6/KHUHixXrSRTPmT?=
 =?us-ascii?Q?DvatXeBPSrluSL4NGwPBnmt5xon5/RrfA7KIopMw6wRHdeL9XKIsG1GV4MKX?=
 =?us-ascii?Q?0xFElitiIAsbNkw2AvahYwyFEiuCHSvqvNe5gQUi3QqvtnQbcchuFVXpMOPo?=
 =?us-ascii?Q?6OEjnmjykg2VgvNRA41e4BSl8n1A/N3+E8R4EBhd7kXMnQmFaco2izHCCmM5?=
 =?us-ascii?Q?gU6oQ4/vZAeka1FbLkcdt2ByCHslTw5rMo1U4vL9VcDw5QzxzMpAxsr8q7LY?=
 =?us-ascii?Q?Tn4lNEFrv6kBiBtrwndMjYDLR8moA2LaLoF4LuI/nPnpL05ZMiPZWCOzLa8h?=
 =?us-ascii?Q?I4xaP0E+6xnjRqPzWoJwZAtaKxsJGQa8Rnh/a6gtx888VMqLWO5Vr12RqrWY?=
 =?us-ascii?Q?6v831BvCJztEB69zp2xcBb2lxBwWSi0TdxnViGvdBkrF/bfHJXpTTOHVTTLZ?=
 =?us-ascii?Q?iu7EcUnwmR6N6HfRsqPTEFVulIPW7lw1FB7sCYDaZOQu+2ufhvYkxF72Wo4U?=
 =?us-ascii?Q?bX6g/KlORtx7Iebrvmvh1TO4nXrazT3Cb9SdWQvJZPfcfJcdNRdxmEJ7554g?=
 =?us-ascii?Q?aGo1yJVp66lcP+qkO/qgkUONrAIfUhaidbsfx5k1aCFay/aYV3GcT3hYdOv8?=
 =?us-ascii?Q?MpWqPJifNICoDc07ycmRjSDgA8JYyk0EN2XX+0tqsmmT8ihyBVIS34SaaEB/?=
 =?us-ascii?Q?GRmpjY2fpM9hFIfitnBMv51OD50buD4YD12LRnKXB7KDDH3zfLG9/W97NlTw?=
 =?us-ascii?Q?jw/Uo34khUTJbMsQr3h8Aphvx1IuU3Dj1wLrwjcfXyaJrxLernowDaLH10/U?=
 =?us-ascii?Q?KehsHiI16V25hIhDI7TNGqcOUFRWN0apLrRRzVjHT+h2Vgntt/n0j9N7177+?=
 =?us-ascii?Q?SOlxAi1o7XMYDak1bHVRHXjCzEqJETGiOU3wI2I7z6MCiYrNWN7yd0syxrhT?=
 =?us-ascii?Q?JhGoyGobfaU7zkrdZNreJyNbBVaq6Vf5BvRvYwjbDdmGA72aym0/r9inI97G?=
 =?us-ascii?Q?rG3YwLe+CuU6VEJD5QCw5eWKocJMpUMAQMHmdmon+w9b6P5JkbCaIAQy+qPp?=
 =?us-ascii?Q?CyqLNHfo8g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f818b97a-f3d4-447f-3a23-08defec46780
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 14:07:43.7214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyuLL9VVjaxlgvtRP82MR3q6zyJHlwYYtBBNwbHPug/3kP/C2I/pgcJVVZrxGa4bXYbauIarbRn+O6Alpbe4aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2405
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 14:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243864

Release: http://www.lua.org/ftp/

License-Update: Copyright year changed from 2025 to 2026
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v2:
- Added License-Update tag for copyright year change (2025 -> 2026)

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


