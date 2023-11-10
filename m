Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0ECC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 03:13:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20581.1699585977380271578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 19:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=967886f530=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AA2lpXA031506
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 03:12:56 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w3y2kyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 03:12:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWbezBkrRDXpcZlDSw59xfPRF+rpCEwKL5x/uQVeDpiJclGumDr1gktSjZtoDfWDBmdI3y1znr3R71LN7kS5XD1C0JUHvB621kNXwoYeng/cgR+awljF5FBAhNRDxQo8osgF79BUuamA4x+ye5WsRiyn3ZFyR5hXhS2xMhW+IJDPKn1B0w9wmA9/w/AzFXmQPY8zHkI1qI5GbIS6lSwlHx38DXLBuq8ziJ5IpD5skANSoQkl0nyUt5roGwRnZmlVGceBok8dErtkl0cWNyIGA7S6UZ/iGL5pSHAuLrhlV7vBVVAI+o5U1VYPu5+UNsrR+PPtffJsIG2gCB/JlOx3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2e3to2Y2dI1W0xbp7WmaeCRF6j4rn8kNwS1e3lAxFAg=;
 b=E9/0av75SQHIRXf4C0OH5+eLWUxWMScAdoBQR2PvYITq33jswgY4ZqM725sn6EnRGMG1kZm3fpaQr8scUn+J7ex0KhFW/Lc6w/QLNgBzexRyFyykjxjBnyoXgQ/DB+4qgPLexVanaNq3uVcb4UbJdO1zaqH0mTfSCSgloeO7hWpwcwFU5zWwKWw/EjGd3kbMj2/gi+wzSyBUafdl9gimhiFbsCpfnLrQ1cVJmwHsxmvepCm+T6RHx3JUF1OplpQzRswOSr5KcHIRDauq+SGpalILIZjwudqrHEJFQB2kNBESrGPtA68uoz3C87SkRR2s1cxf2r6zl5ErhUTTyf3vsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA1PR11MB8574.namprd11.prod.outlook.com (2603:10b6:806:3b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 03:12:54 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.6954.028; Fri, 10 Nov 2023
 03:12:54 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] sudo: upgrade 1.9.14p3 -> 1.9.15p2
Date: Fri, 10 Nov 2023 11:47:12 +0800
Message-Id: <20231110034712.2491591-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:404:f6::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA1PR11MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: f1cb2d07-ef52-42ce-900b-08dbe19aee3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	THAakBT8B8yW6FCMjxq5LuftVzSPZmV+6ZC27sNT0XklZthJkOObQzps8c8fR2N4GB3KRvthriq1FkFXYu3EBjHBaDDITBqFFE7pHgIcFEqSDtWEFFmklrEw3BCl+18gcGkT66nuxYfalUdpCO5x+CSi3vVOSFkJShfgTroAHnLXfuYglL3it5391Of1dGVvs+2RR6mB4We/J8xC6LW3E11TkjBHHl35fii6a+TQa/uzl1Nv6WHGFqerC+hzbITsKpZyTJ/1uiHXOteljMcPbWh9bsHy1qX7lNwyASU+kApTFAMcpSC5ZixC/20vk5beB9Ui185hMacb5U/SxQsEznyLH9LTqYbv5sPewOV6dsQlFAZmCo4kn6/LawS8RjrrA/5rJ1a/VwoNLnb4oQzh08nLodIZH6B2mQHyy/ULRH4gAt2QQrTINSWaMOLB/usQFvwepxBzEBHhKZM0zoW6ns8Gp+KafDy6T/fEzOuJLdD11JHuZrENeXmuX0dGBgfLQC4c/M1oQliTBg5A9hlDh3Nj/IpM1GwVM58PGBMJuFCyB2UdJxdKIsr4+Utjy8keb4Fz+wqI1vHLi9yupWt3VJjcILGHc1dOrX3lUVxgRoOHth95z8JZil/PIiERLBEAQ3lKgecqHC8s23sQitrLqA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39850400004)(366004)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(1800799009)(64100799003)(451199024)(52116002)(6506007)(6666004)(83170400001)(38100700002)(1076003)(83380400001)(6512007)(8676002)(38350700005)(5660300002)(2906002)(41300700001)(44832011)(66476007)(8936002)(66556008)(6916009)(15974865002)(316002)(66946007)(26005)(6486002)(478600001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S3VKmADgMV3ZzJNB4M8BfQnw263LkW41J57dxD7/Do1bKlMbnX3vcXMzuuxq?=
 =?us-ascii?Q?DjU8JZS969ghyLkjFoNGIdXEaekfMfDFerm4kvwRAkmSLMbWO/O5/5i4bJig?=
 =?us-ascii?Q?B5a9NCjHfdNf9gUv5S58zbA/nuT5x2vmlEBGQ8OqktEuKm5WGlpo+Ly0GBFW?=
 =?us-ascii?Q?MOXs9jUPjFVQyMRf+4Aro3UgdSvin+AqEUcXRIiH6Al6ndPxg+IxVFbx0v2G?=
 =?us-ascii?Q?YBaF25ENwC8P6F+wjfKS8pbSoqtL/pn+wpPETQUThdEiUx5BJ+5/ZzgVDbMn?=
 =?us-ascii?Q?Izlcrfxh7jCoYEJahVYY6ZNHp5NZGn3cPLrV47Nm2IrSml7rYDsNDKaY6Mr5?=
 =?us-ascii?Q?ixSqYYyYOujh92XGtGHcFsHixSgJQjfWFq+KWqjzTbqaxXpCjnX1jrRTsGiq?=
 =?us-ascii?Q?bfrIrOnYH8dZ46ExghKaJGnLExWyYeW+ey2ZueoCKkSs6dIDmc/Lk0w+Bplm?=
 =?us-ascii?Q?J/HIP+saMRbrTAq5syrfgHz5RcGzYo4SrNHcUu6GJEh6R882arH1ZfKDrTrG?=
 =?us-ascii?Q?QoRFQHn5N8zcxlrEh2ozDzgtPCcPJxqQJ+oDSWKapM+Xdmh2KNA0HCIffYh6?=
 =?us-ascii?Q?snQOFrzNqE+uqFEQCl2lnQ8JV8KgwwaEThBok32VITXC0xITGjuVnCVWMKUf?=
 =?us-ascii?Q?C6PircltKFVZjzJYORL2F7UNcut5cG6huPUahiJKSQ07OxeC30dOYgeTPvO5?=
 =?us-ascii?Q?rPnwYxOAezu6moq/AXOxn0rbV35UP51CmnQxMxfTUpfd536HvG/ULrsq9NFu?=
 =?us-ascii?Q?DuDtvmHq7qPv+zNGD2R9+6nr6KMSxjZnC7a/GBDEjwXAXrW8o8dvASTd6Vkj?=
 =?us-ascii?Q?iWh2cpBiEzx5o9YNfUxuivbzUI3p9LDmle2WJMKg43neMB3UTSf/phb1o8IZ?=
 =?us-ascii?Q?g0siWgQrrGEddc3W3pbI8yNwhQHHfQW9ORZV+HdsdHm8fvMMqmYDJ2cFM4na?=
 =?us-ascii?Q?gNfeHJZwRuUvmOdYCw1biod41zJX12gle1a7fljGPX2Wxy4HLu1DV7I5HyBB?=
 =?us-ascii?Q?nbvXYuWyv7Ea7DsmonpP5KMrINLlPoMxZnbE4RODEQRzGp9nPuKfjCxz7LNh?=
 =?us-ascii?Q?WM1Rt22Z2A+d5emLpuev4vFFIe/KQDfGTbfe2+aJUhbi65Di9FCeoBXRoJUn?=
 =?us-ascii?Q?iDh0FsiC+6+q2ighQeTeCToJ7Efp3ApQXQoRwOH6mgX3bCj3G4V/rbEq+IPu?=
 =?us-ascii?Q?hKHFFrAgrzdVsLe6/OdKBPFPd4S47aj+WsRSfyOXRCKqoOk6CAeZzjiPFhCN?=
 =?us-ascii?Q?29W4sBLMcdd+gguWhKcaM10W5VXxsBzh39wIs/+yZjoBH7HlpwIInTTQdEsq?=
 =?us-ascii?Q?qG66/yCTWV3eWoo7hG2r+NWwms0vCkXC4OGbBpWLuKZaKA2jy1jjpbXk0a9a?=
 =?us-ascii?Q?FLD3nrSzA4vIqwM2QE1fLVUXGhVnwwBo7py+euzoYvj5lfU3/pB9aiskMy6X?=
 =?us-ascii?Q?zXFFI2Y7cU3Pq05gEYsAESuWbYvGePbdbhH1ENWS8Hdz/rkEuWItOQZm2j/2?=
 =?us-ascii?Q?k462wFB8WPRqGjQ2EcvytAWF4if0MFJCihhFW14nTt2kG741z3ZOBhAM45oi?=
 =?us-ascii?Q?mY/AqBXKvy7FbM/Ks5ZgUO/wQhoKXvHBUHUTMpoXpJ48ZrNnwicF6frLdjYF?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cb2d07-ef52-42ce-900b-08dbe19aee3c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 03:12:54.2724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RaHZSri3V97T02uqzXo6lyEAt+u3tEwPTPI8g+KZY28X4rXaoQRvVnNTnJHwPZi6LI75afmQTusjaAFiimMDZ7Tm42s03xWEX0Ilwtafcg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8574
X-Proofpoint-GUID: rki3EbqFo-Bc_gfeJMhDpcsepE5Ue7pa
X-Proofpoint-ORIG-GUID: rki3EbqFo-Bc_gfeJMhDpcsepE5Ue7pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_17,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311100023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 03:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190396

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Changelog:
===========
1.9.15p2:
- Fixed a bug on BSD systems where sudo would not restore the
terminal settings on exit if the terminal had parity enabled.

1.9.15p1:
- Fixed a bug introduced in sudo 1.9.15 that prevented LDAP-based
sudoers from being able to read the ldap.conf file.

1.9.15:
- Fixed an undefined symbol problem on older versions of macOS
when "intercept" or "log_subcmds" are enabled in sudoers.
- Fixed "make check" failure related to getpwent(3) wrapping
on NetBSD.
- Fixed the warning message for "sudo -l command" when the command
is not permitted.  There was a missing space between "list" and
the actual command due to changes in sudo 1.9.14.
- Fixed a bug where output could go to the wrong terminal if
"use_pty" is enabled (the default) and the standard input, output
or error is redirected to a different terminal.  Bug #1056.
- The visudo utility will no longer create an empty file when the
specified sudoers file does not exist and the user exits the
editor without making any changes.  GitHub issue #294.
- The AIX and Solaris sudo packages on www.sudo.ws now support
"log_subcmds" and "intercept" with both 32-bit and 64-bit
binaries.  Previously, they only worked when running binaries
with the same word size as the sudo binary.  GitHub issue #289.
- The sudoers source is now logged in the JSON event log.  This
makes it possible to tell which rule resulted in a match.
Running "sudo -ll command" now produces verbose output that
includes matching rule as well as the path to the sudoers file
the matching rule came from.  For LDAP sudoers, the name of the
matching sudoRole is printed instead.
- The embedded copy of zlib has been updated to version 1.3.
- The sudoers plugin has been modified to make it more resilient
to ROWHAMMER attacks on authentication and policy matching.
This addresses CVE-2023-42465.
- The sudoers plugin now constructs the user time stamp file path
name using the user-ID instead of the user name.  This avoids a
potential problem with user names that contain a path separator
('/') being interpreted as part of the path name.  A similar
issue in sudo-rs has been assigned CVE-2023-42456.
- A path separator ('/') in a user, group or host name is now
replaced with an underbar character ('_') when expanding escapes
in @include and @includedir directives as well as the "iolog_file"
and "iolog_dir" sudoers Default settings.
- The "intercept_verify" sudoers option is now only applied when
the "intercept" option is set in sudoers.  Previously, it was
also applied when "log_subcmds" was enabled.  Sudo 1.9.14
contained an incorrect fix for this.  Bug #1058.
- Changes to terminal settings are now performed atomically, where
possible.  If the command is being run in a pseudo-terminal and
the user's terminal is already in raw mode, sudo will not change
the user's terminal settings.  This prevents concurrent sudo
processes from restoring the terminal settings to the wrong values.
GitHub issue #312.
- Reverted a change from sudo 1.9.4 that resulted in PAM session
modules being called with the environment of the command to be
run instead of the environment of the invoking user.
GitHub issue #318.
- New Indonesian translation from translationproject.org.
- The sudo_logsrvd server will now raise its open file descriptor
limit to the maximum allowed value when it starts up.  Each
connection can require up to nine open file descriptors so the
default soft limit may be too low.
- Better log message when rejecting a command if the "intercept"
option is enabled and the "intercept_allow_setid" option is
disabled.  Previously, "command not allowed" would be logged and
the user had no way of knowing what the actual problem was.
- Sudo will now log the invoking user's environment as "submitenv"
in the JSON logs.  The command's environment ("runenv") is no
longer logged for commands rejected by the sudoers file or an
approval plugin.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../sudo/{sudo_1.9.14p3.bb => sudo_1.9.15p2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.14p3.bb => sudo_1.9.15p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.14p3.bb b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.14p3.bb
rename to meta/recipes-extended/sudo/sudo_1.9.15p2.bb
index d5c5718ea5..431dfba3c2 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.14p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "a08318b1c4bc8582c004d4cd9ae2903abc549e7e46ba815e41fe81d1c0782b62"
+SRC_URI[sha256sum] = "199c0cdbfa7efcfffa9c88684a8e2fb206a62b70a316507e4a91c89c873bbcc8"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.35.5


