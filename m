Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1221BC43217
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 07:05:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3015.1668409545052623345
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 23:05:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8317b30afd=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AE6ZRf8031934
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 23:05:44 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt7n9941g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 23:05:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAeSSekxd/vgFscRLE/YPR5mlOV3bEoOsJYYvn4Fhb4dOggYSAvEZaCpiwss1Ur86hQG6LzpShWc/k4WoGl2pyw4spDWdo9z27TPdpDpjt8r5Mu7RJ0vOaa6vIE6vC6ikdJjXQlnMyp5tYLCo2HFA1ymGI4QXKn9R+/8ZUXhcw2guFXiCe/C11Q7e1STojgkwBfArIp33j5IbJ4jRbIPEziEf3IbHRfh/Eini988aQePaf9vJe6tiHyttCYOjYiXahyEZv2p0tmfbuyDWl+N7nJswTHmMaZ3uvwRpDQxIxNTjXXv7oX1AKn2zlVwVR8wGy8UHWS4jLe7TSo/Lvo8LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bCNrSHD01ForppbxC92Vm3MljtD0zm/MAlf7oRFRHQ=;
 b=FQeGlob5LGd6ocrjz7ux6/eFXlL7S47dIjI4uLyk0Y0OfChStWOzT3koEhhs8ZMfwph+uqJ1SQN01mULAAg2a1ZYBx2xl44fk77rQKEIkLb8bGqEDuXrh5zgGStIXZh0vhZWox6G7WnBFc+zn4tKvmlBEsBGCvRj+kivtBg1sMe3V5HVTBnK4vx+9Ci93iKVGMzQhMJVdFewPw3HTZRY34wwsiN1SxAE+HQhpU3hazHAF9nw3bX/GKL/uJVjadsj+8J/fD4zi2WR7kPsPqAMc9NkqfuBev8U8PEish0glgiI+HFOiHfDb0GbVrcLB+eG+KG+h3+W0u4gA6w5ziIgBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BN9PR11MB5291.namprd11.prod.outlook.com (2603:10b6:408:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 07:05:40 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 07:05:40 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] dbus: fix CVE-2022-42012 dbus-marshal-byteswap: Byte-swap Unix fd indexes if needed
Date: Mon, 14 Nov 2022 15:05:19 +0800
Message-Id: <20221114070519.111966-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:3:17::31) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BN9PR11MB5291:EE_
X-MS-Office365-Filtering-Correlation-Id: be501b1f-dc7a-40fc-b1c1-08dac60ea33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BvqYtvhmHIbnMjYUowBOUSh6vtNmgplccd7xKE1tsSX2r4VUMd1LOYfE2nI2LpSJEIYlVxmctImV3M0v2EnVvWkuZDmi2KT9ediwC0cburQLlLzyMoDa6RCbu1Wf3YKE9xNEn7OLevZcGnL7UIzaXg1unXH9geBNN2oOKYA1U+/QG/DH0bUrN2Sewfra/aaskubx19SHqSdlbXhvp4Jyqro0k0QUBjp1Cj9epKLb+lHQ2icaTlTch1B4GqrQ420dSTd2NS+Uyl8s67UWUfRotG2o6uUQhD9M4UVAIMrOz/SzX7kqKekkgv3KKxtNlZFHvfRUYLgyhczwEL8B8caU07juZ/1BdH5pbSZNg0NkA93ZT9rXIjhMSbYOpMomJBDngiNTKT3aZPjBQS7WLOFTGcb1DG0N8z9Pm3j5YkFZivwTUWwann0uqPAzV0UlOErQ82t6x01qKJQe6wTImc0iTS7qCcrv0iYLHDiLefHJizibg/uPFzxjhgnJxfKrAwSdh8rGtXSnhoikMkDx7yauRjhSvQ6tw1xlo2eqm7n64ACQ1mUOxdvCA2KSGpHaeJl1neO4b/T6SCep0Rn5/kCQsw4THBzsyMz/q+vOY9jXQ0ifhNMSbG2zvjdZORuEe8uhU80ESE50p+5DMlXzwKBiZSjedmjEYS7f309MfDGMk59+PI7YXtW9WH94D4MUZpfbZyQ/XyC9geA43zOV7pG5GQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(39850400004)(396003)(451199015)(2906002)(66556008)(2616005)(6512007)(66476007)(66946007)(8676002)(41300700001)(1076003)(6916009)(316002)(38100700002)(38350700002)(6506007)(83380400001)(83170400001)(8936002)(5660300002)(186003)(44832011)(52116002)(26005)(966005)(478600001)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qR3wHq9Ft2B4aWjU/YlD7ylviapoYT0zQWZsiiuDr4+X81YDc2LYf2dUjebg?=
 =?us-ascii?Q?CXL9Df4yLCo1hI/0uMlQq4n8w0zPYP3EuY7D1+pXKb0cSXSd7wlZgUmV1BTq?=
 =?us-ascii?Q?IyHIqHieYi7eIuDduxQYKaRQW5m2U1+zZ6AMSTLzjoK02ANpHbABD5qLIAuc?=
 =?us-ascii?Q?w3mlJnVgWMw+gJ2CVv/IC8dx4LIwdmg6n1rHsFsbQwnCbFm3CT0pwtdnFz5r?=
 =?us-ascii?Q?SLn4DQCS+elI5G1V0x/8IVy4FKdVCnSXFmckp/hAwDe1VYSBCdy2qReks0bf?=
 =?us-ascii?Q?IBeCXD4tXaMLXk8ivQVepB1sprK2lFUEDHllpOAWf/4HFIXrC9DvtvzgH8HP?=
 =?us-ascii?Q?cLMHY6GwN4ItwnzqwXLoaxCI5sPoDQGXMUe9GAaUdLjlG5lu7nbGgEtIipT3?=
 =?us-ascii?Q?rkVXDPGGtSPqewl6k71Ep5r1Py/K4+TtCkOV8hSPTnRrJBTt5Oc1Xl3kn5dY?=
 =?us-ascii?Q?sPZG4/atXdMdzKbJIe+Dn22liFA68h8S8vk/JnF18nTKvAjLozbcojrArLO+?=
 =?us-ascii?Q?8n27jQ5Z7wjztou4TfHEzW5XzNt8PVIwQGU92ekNX5H/Mn6BiMXT5X/Yew4/?=
 =?us-ascii?Q?8hIMCdnfg5gphCbcZ2kJLdgx9kE2tPsnQTddSzFQfpb+6pGEYiXVG6lZpoLk?=
 =?us-ascii?Q?Rb7UFXeOzySaFnFP0RnHkcmiOQFY2l6heYbbeCul0WXe+72QJdDq2XaFWB7+?=
 =?us-ascii?Q?hhHfkdFEGF1I3YtXJ6m5+l4sEyjVl3tPuocEk9DWQSYXIll389FWhSqacR/N?=
 =?us-ascii?Q?6ppKaUb0cnyDeJR95gxd5WljLQ4iWLg5bDgFfpCbyLHJQAWL4VH9BBOvKX8I?=
 =?us-ascii?Q?jaiq6wwkJI24AKot9WdySsFqO3DTpHP5CNx0x15lCxqDae5Gx9NsF7sxw4KU?=
 =?us-ascii?Q?yNxQwFDZ0U5R0RXofsSJaIvdGocI4wt8tM+9Ju+rTmIw2q8LsIsZP9/m4t7F?=
 =?us-ascii?Q?/1VY6cwM/P0ghZON27PUtm72nzlLI4jn+0TOBwCyO3h/+V8kcAx3YP2SmrmK?=
 =?us-ascii?Q?CN36RX/+BSxsFSqsqNk6S0Gq3iHKXP58LqqA6r4XVaL0fHDOXo9CzUc7mNUs?=
 =?us-ascii?Q?Ix+ksi0R5U07esiYVTILUSaq48bNhsU+co2OndrsIVkQGT0AR0Q7ABGe+WbP?=
 =?us-ascii?Q?+jKGG6Qg+zMODwyPpGX7BxNPxGhKxe+iq3WtAEAzzUUFjfSTwBxiwAeZt+1B?=
 =?us-ascii?Q?lP6s1SOWcYGAxmaKPt77Fioydp6li0+sl6g+k9rV9ghmznM2W6fVpE5sog5j?=
 =?us-ascii?Q?0h9xXtnHPDasvulOTQukZZuuve4knzcs3IM0/Y79By+PKABgLPgQ7IwjbXGa?=
 =?us-ascii?Q?RDDpNHFlCdBMNk7tmj6OrEs5BVy2Ur3TJT6hvld5ya94IIGhdUQfP1Ijam7r?=
 =?us-ascii?Q?GwB7AZeJ1veXpYMD67Y2Zr5mKWS5r8lX2zIEEp3yNXs3PDVGkcbKwGDFzBsC?=
 =?us-ascii?Q?YlKg90QbubDHYQHJ3TJaG3xRbUDkLQc2DIcu4vQ9RnvvCSlKhrknnO4GtQi0?=
 =?us-ascii?Q?NMdZIZuhCmy2+YAh9weBLlBenNs9dWGUzfd4an6GZf780ixdjq2Nru4s/HpK?=
 =?us-ascii?Q?5kTiA8wmrT2IOkzRgv+5K2671bfQSFM5qI5edoCroJGeMkWOUYeT/1XpOkGm?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be501b1f-dc7a-40fc-b1c1-08dac60ea33c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 07:05:39.9195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkgUu1gBcJrUUQMm9n7MeQBcFKUfi437BgaEzZkKJ1bE/WcHK7rr0bCioiQlFWx/W5Y8nlvPzpUUwMOZzqETysXBzB1WVTIJTpeJxtqXBQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5291
X-Proofpoint-ORIG-GUID: Fbr788vJErrLLaT7wgggIgXGbdBkO70v
X-Proofpoint-GUID: Fbr788vJErrLLaT7wgggIgXGbdBkO70v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_06,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211140052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 07:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173227

Backport a patch from upstream [1] to fix CVE-2022-42012
dbus-marshal-byteswap: Byte-swap Unix fd indexes if needed

[1] https://gitlab.freedesktop.org/dbus/dbus/-/commit/3fb065b0752db1e298e4ada52cf4adc414f5e946

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
---
 ...eswap-Byte-swap-Unix-fd-indexes-if-n.patch | 76 +++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.14.0.bb         |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch

diff --git a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
new file mode 100644
index 0000000000..47f4f1e0d3
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
@@ -0,0 +1,76 @@
+From 3fb065b0752db1e298e4ada52cf4adc414f5e946 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Fri, 30 Sep 2022 13:46:31 +0100
+Subject: [PATCH] dbus-marshal-byteswap: Byte-swap Unix fd indexes if needed
+
+When a D-Bus message includes attached file descriptors, the body of the
+message contains unsigned 32-bit indexes pointing into an out-of-band
+array of file descriptors. Some D-Bus APIs like GLib's GDBus refer to
+these indexes as "handles" for the associated fds (not to be confused
+with a Windows HANDLE, which is a kernel object).
+
+The assertion message removed by this commit is arguably correct up to
+a point: fd-passing is only reasonable on a local machine, and no known
+operating system allows processes of differing endianness even on a
+multi-endian ARM or PowerPC CPU, so it makes little sense for the sender
+to specify a byte-order that differs from the byte-order of the recipient.
+
+However, this doesn't account for the fact that a malicious sender
+doesn't have to restrict itself to only doing things that make sense.
+On a system with untrusted local users, a message sender could crash
+the system dbus-daemon (a denial of service) by sending a message in
+the opposite endianness that contains handles to file descriptors.
+
+Before this commit, if assertions are enabled, attempting to byteswap
+a fd index would cleanly crash the message recipient with an assertion
+failure. If assertions are disabled, attempting to byteswap a fd index
+would silently do nothing without advancing the pointer p, causing the
+message's type and the pointer into its contents to go out of sync, which
+can result in a subsequent crash (the crash demonstrated by fuzzing was
+a use-after-free, but other failure modes might be possible).
+
+In principle we could resolve this by rejecting wrong-endianness messages
+from a local sender, but it's actually simpler and less code to treat
+wrong-endianness messages as valid and byteswap them.
+
+Thanks: Evgeny Vereshchagin
+Fixes: ba7daa60 "unix-fd: add basic marshalling code for unix fds"
+Resolves: https://gitlab.freedesktop.org/dbus/dbus/-/issues/417
+Resolves: CVE-2022-42012
+
+Upstream-Status: Backport from [https://gitlab.freedesktop.org/dbus/dbus/-/commit/3fb065b0752db1e298e4ada52cf4adc414f5e946]
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+(cherry picked from commit 236f16e444e88a984cf12b09225e0f8efa6c5b44)
+Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
+---
+ dbus/dbus-marshal-byteswap.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/dbus/dbus-marshal-byteswap.c b/dbus/dbus-marshal-byteswap.c
+index 27695aaf..7104e9c6 100644
+--- a/dbus/dbus-marshal-byteswap.c
++++ b/dbus/dbus-marshal-byteswap.c
+@@ -61,6 +61,7 @@ byteswap_body_helper (DBusTypeReader       *reader,
+         case DBUS_TYPE_BOOLEAN:
+         case DBUS_TYPE_INT32:
+         case DBUS_TYPE_UINT32:
++        case DBUS_TYPE_UNIX_FD:
+           {
+             p = _DBUS_ALIGN_ADDRESS (p, 4);
+             *((dbus_uint32_t*)p) = DBUS_UINT32_SWAP_LE_BE (*((dbus_uint32_t*)p));
+@@ -188,11 +189,6 @@ byteswap_body_helper (DBusTypeReader       *reader,
+           }
+           break;
+ 
+-        case DBUS_TYPE_UNIX_FD:
+-          /* fds can only be passed on a local machine, so byte order must always match */
+-          _dbus_assert_not_reached("attempted to byteswap unix fds which makes no sense");
+-          break;
+-
+         default:
+           _dbus_assert_not_reached ("invalid typecode in supposedly-validated signature");
+           break;
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
index e1efa9e058..484629e987 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://dbus-1.init \
            file://0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch \
            file://0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch \
+           file://0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch \
 "
 
 SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
-- 
2.34.1


