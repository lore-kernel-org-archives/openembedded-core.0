Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8663C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1132.1739286057297610302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=7xtGZKGC;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKNkn7H0IgTBQyh7FS15xoaw4Yhw51mnM6SoQkNZC1XR7xF38PG4xdv2+4DrLmyDs1dvbK0qtn9Xa0slfJ8OC934HQ5nj8/bG+rD0wQfWyA4kAdyWtvPb4bpGBSCufpeeDmSKgE4OxDo9ILq1/qquiPuDrvEwUeo/+zA+aAD/TqBR8YEGah6PqaCyauZuZ2FzJgQTgZRLRKze5B7yNAdE0PlAF1D9W3ZfAeXo7zRGsTL/65YsEDiSvQwbl89/tviiCLdtf7T3ImQaI2d3W2hpF8RnwABq8DB3IsDbF2pfKr1vb4KAUFk1zqoIY9zy1+2MJRcPbZnPvmeu5HXac2ixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOzZ4TiC1epFNlcEVMbofJyQslrNTrBV5UwzDmKLMio=;
 b=S3yNWaMvhgOvQSQ/ociu/NGVUUVt4ankse+u5oKpolbiMbS9R/XbyE2/bDuMYdDTjoLRoctlD/e20KOFwgKkMHuPDhw89baHvqKaEib8oPjChaniCJb2WiXDHewPWtJuTc2DQQMdfyXjUAxfV2avh5d2ov00wBooqZTOF8pZounsDHsqarVV/g1RrYKLl3M/bdQFKUMkJxM/4cWh7c4iioNccgOEfBk6FfUb4cgsX/5aua7j2iFyu04qmI+HvdJ2xqT+RwDz+iiInSLBmMTiqmSfsbUyrtHkIzkdqTKA3SsJHjzk/UkjncNDEgL8QrWUpAEpsHyhHrlYVwiWvJfOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOzZ4TiC1epFNlcEVMbofJyQslrNTrBV5UwzDmKLMio=;
 b=7xtGZKGCgsvcs8VAktWGocBamACWfAvbz5rmfZ2gu4hJUytIgAhQZ2Mi2YvEsrqAyrLOVvDIE2bho/9UyDv/D5TXMSYV6ZAoQPXkm/KiBks78FB5Wt2ghRjIGKcyCU9c02n5P2lzYLyTcJRloHAemVObqYt1UjOKBGBb8rsltSF5jEk628hCzIjCTJo5OJvAVv5izPRJwstpFvis1A8WtWgd5pL+EC6Oab4XMul5g5NqFqcdY9nB5/BZJPj+pkNn1NXQYFyVaXDGwPqw9E4YVWANGihEjTHYa266AZAXLAVjFDh0BKnyyDa5IWHJ2I2QPzENPBs9nxYseP3Do1GiEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Tue, 11 Feb
 2025 15:00:54 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:54 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 11/30] classes: go: make source directory configurable
Date: Tue, 11 Feb 2025 16:00:15 +0100
Message-ID: <20250211150034.18696-12-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad9d258-3e4b-4326-fbb7-08dd4aace02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V3NUjdPzK9JMhAzRRg3yEQJpT6fZge5m0WkOBiNZKD34IFAvNn43bt/2sW5v?=
 =?us-ascii?Q?tmtEFcl7Nbq53wTHgIEOHI435hS3gA5iK3T5kZFVhOscBxdOoFjGpWJwKTsX?=
 =?us-ascii?Q?QNzOUlktg9qWzfMKYpy3tB/EPKyPFh4jFzXO2pXUX/NH6MeEBxwGMIm/6zQe?=
 =?us-ascii?Q?egrfrHFG7avaTCA9fZHDOupSlIR/iBsvPFNbfud878HPF6oT1ceaYo7zfPXP?=
 =?us-ascii?Q?jRD3cm29yYMe7IRWfiQ6Gtsc7gslAp4Eh/BEa0TsIRpOjST9lBCiNyMOsKBv?=
 =?us-ascii?Q?B1iH9NuP0ez8f465LjNaYpwTGewVmmIa9Sl2h1AUzseXVwQl42x413C2vwcu?=
 =?us-ascii?Q?tBcOAdjZmEVp4YN6S6nHq0e+C6yV6VofzhBSKHA8AwNqiTS0XqKSsXB5n9wi?=
 =?us-ascii?Q?r2bWwWweeUArOwbbcL9lza7EkrfZayS4e3uIiyfOSmldKSI0gv4gs62z3ZgZ?=
 =?us-ascii?Q?PcceKhjBoJsPJbqU4LjBlF4aya+TgfWIEtJvefpNSVjw6+QUPTLkWlGjGH6f?=
 =?us-ascii?Q?KcQM1t4x+qjVXABmRkOyAZ3sK+nVXSsKEq7nvKeA8kyOQ+oL3FPtK6Hgeykd?=
 =?us-ascii?Q?BxMlmgWCZjjRsLKYe/vQgn00kgqPyURV6mF98ktX4e16zhibeCOIv2etvQuT?=
 =?us-ascii?Q?yaUg0bHwxBeSPCZYreyOr0F33YTvoKMOLwXBOCEaEacoznd0LAHm5CW1H+WS?=
 =?us-ascii?Q?rm3yl73X5GZSLfMB9XszJr5NfxWp8KxqVbFUoT6mXXHHg5r1RFBZWe4DHv8+?=
 =?us-ascii?Q?wttbLL3mcdDJlh897Zqpg8kmFByNoZOwy5IiK71aiC7tUYzJ6wnFlbHX3dty?=
 =?us-ascii?Q?bkXgDlQYUt9Wg5Hb+v78QamgXBI5Blv3neKG1z0qvFJBgLLT6w0Sl47HYPH7?=
 =?us-ascii?Q?FsdlUVLp4uHfjVe2XrcSE/AWUaepPq3xasZmGmEVf4SQsQ0WuI402CU0wlP/?=
 =?us-ascii?Q?yfrPNMVWJJuzg1O//MgUcKLUEV6M1Qjpx60BHgzf58yvxy/cLE/1g+tTCm8l?=
 =?us-ascii?Q?nakUKgFTlUIxV5Qc0zkPLNr+tZxFVCjm6ySPPU9mE48df7cuT27+4oTAWnKv?=
 =?us-ascii?Q?sVROt/O3XYL/nuZhGPO3D/QoxF98LomlHLMeicdzSOtMCe3G0SkD3fZGMR16?=
 =?us-ascii?Q?KC2F+EUf5sWtsQTJR6xz1n/JD57FoEKP6Snm9dl002dJIJorAsDA0kAbyx2w?=
 =?us-ascii?Q?RtiiXGFThQVc3cYkOt7R7mWeZi4JL84QNAEaE6XQBAevaATyH9Dqpog2yUs+?=
 =?us-ascii?Q?wR0+VEU3f3s5hiDysl/m3veb3nn6z8IgV2gJJlr1hrGnGdDdJWILU+skmEhO?=
 =?us-ascii?Q?FQOCy/LniEMs13btCEE85TsVKCaZ1uTb9yBCB2yzhUrLKP6U1NcN0vE/jaty?=
 =?us-ascii?Q?Y8SfFjF5FRR/uHVggYKSJAEAdKwi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i/o/SjvP8f737VixojWbHJTzTwel+kLEPzIPVpRsEZ/AOY3Jftm3G74965M5?=
 =?us-ascii?Q?C41rgB7F6mZQ7zZwpuRCGCA6ceECb3UPDqKAJHX0Kzjgo5p3ogua2gQ6+c6L?=
 =?us-ascii?Q?nWr6fUbgMqV1YsQhYXxHikTslS04V1gjXseLaWnCMyGUxBHPuaNahgP8jzOo?=
 =?us-ascii?Q?aRnp9nho6OnS2KQ6IeOxUrk62VSRCpMONQQWJcPgsUbohXoELOD+QN3svNJH?=
 =?us-ascii?Q?ShiTKRxKVJWhBfMg/M12ekc5k37OEi/jarnZLg9LdcZ6FLI3KsQtO2we0DKO?=
 =?us-ascii?Q?GjQOUxiJ19inAMWclhyYLtMpqiqio2JS4D7iFCtA69ORsqu+chqK6QUJRl/D?=
 =?us-ascii?Q?UyadsbhdJUNJePwD56SR1Fy9wATgmPq1HwljIYcKO5AaLZylBdg3xg0YZXXI?=
 =?us-ascii?Q?QbxZ4iT9i2tVd2vyRytBeqwyHW3AiP7ItQ7ODeB/bRBdJzidIW4yRMi2I/N6?=
 =?us-ascii?Q?vE75v+WWzC9/A8Z0E9uuYQci0BWXIxtG6rgdoQniaOSx+iitdWOyEpPIECpy?=
 =?us-ascii?Q?VibVHY8uL6egpqMdIvXmFodFQcCAPGC7P0UMgqomYHJPHGsmsg4MePQetvnD?=
 =?us-ascii?Q?3Y7/PlaTOcVbXt8Imc852/HPN7eNXkcP94Jcnvd1cpUvqBssNI4auvw2dTAw?=
 =?us-ascii?Q?nwZmFPO2PwoY3Ni+AfmV5cFu99HTiFjKbKj6ddIQAqVD0Ru8SXmh8AgqevKG?=
 =?us-ascii?Q?iagqFduxtlMYod9M25NqdsAZ8wLa7/1gs2tmMskc1NQ4p7eI0o1y892g+1Zk?=
 =?us-ascii?Q?OU2+mrUoCmN3V2ZcNx1/hUvUdESk7bjf/k3z7j/uCCx1/Q2N6vgLB/faG0+9?=
 =?us-ascii?Q?7VWNfmFFgjffxF8L3UIn3Xiu0c7f0w+SIEsud0XpT+ZGGpMuWr/18kR25IDC?=
 =?us-ascii?Q?3nUod9o7U1kRlPZ/IBDiEGKjkKGTjGE6UB1f5SJ9nmt9FBtVs2MtdNn77Cjc?=
 =?us-ascii?Q?NaWiIvKZQqYXZNE8zIgdqmOiCy0iiYDPNLBJSoXxKj+Cd1xC5GBWpSAQI1TA?=
 =?us-ascii?Q?9BXEUDaHbiUPmPsyXHplVQTnRCTBXI8XZKePAZOWXYgz39slIh9EovIxLfpQ?=
 =?us-ascii?Q?Obt39d+y1uWEaIZWQ6e4DKTPUBnbeJF7gsCCGG9i0i1xZV7F0qI6drM+q5U/?=
 =?us-ascii?Q?xEQuO0dyCL1B/qENcLwobmbeRM7oZB86VoHNkzdwCHKFYQTPGSnuaLmHtU9d?=
 =?us-ascii?Q?/zIHi6KZ6Ply89bHzQlEOnycJRek8ruKYbBdGUWzPsYJH+onP2ADtLcgRGFa?=
 =?us-ascii?Q?wUS1QM2F8YVpamyqgG3hI+kpAJNaiqyZmxCqnVWDiD2mXEw8sVRor9RLn4aB?=
 =?us-ascii?Q?piztAxs8FW6elJ6HPVxnx6kbiNoVdqKOoZiDz9EnQZBcpQAoxtDpE8yFZU4l?=
 =?us-ascii?Q?ij144eEM2vdJ1dZUXMBO9uomO4kg187BhQU5i9hYR4zcrv/2iRlyLgjI6C5t?=
 =?us-ascii?Q?Ov9BbT4GfSpb+1xct6VFi1fV5F7wgCgF5CAFRKV1Sku5Le3yaaVOFPAnN8vD?=
 =?us-ascii?Q?zFU08TFfsBmVexIlg6Jgyc7B5QS5DfI+P+gjK7VkgN/9D0+PwTZkY0Qa8hlQ?=
 =?us-ascii?Q?QsF0wShwbHn+k++z1bae89YcXmK3PCO0amOT79tHYIS1vQ6dzKOs71JK/ciy?=
 =?us-ascii?Q?Bw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad9d258-3e4b-4326-fbb7-08dd4aace02c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:51.4496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbTqtl3+01pl8eXxClyt2ZZPvzFSlNWzmmmdcuNON8OvxWiNghKpbkDqhIBfSIHmjDuwYKxzmIB6jqkqR2PaMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211139

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The go class assume a specific layout inside the source directory and
requires the GO_SRCURI_DESTSUFFIX as destsuffix for the fetcher. Make
the source directory configurable via GO_SRC_DIR because it is uncommon
and isn=E2=80=99t required for go mod. Additionally make the unpack directo=
ry
configurable via GO_INSTALL_PREFIX.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes-recipe/go.bbclass | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclas=
s
index e3e4782025..cd6367278c 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -70,8 +70,9 @@ export CGO_CPPFLAGS ?=3D "${CPPFLAGS}"
 export CGO_CXXFLAGS ?=3D "${CXXFLAGS}"
 export CGO_LDFLAGS ?=3D "${LDFLAGS}"
=20
-GO_INSTALL ?=3D "${GO_IMPORT}/..."
-GO_INSTALL_FILTEROUT ?=3D "${GO_IMPORT}/vendor/"
+GO_INSTALL_PREFIX ?=3D "${GO_IMPORT}"
+GO_INSTALL ?=3D "${GO_INSTALL_PREFIX}/..."
+GO_INSTALL_FILTEROUT ?=3D "${GO_INSTALL_PREFIX}/vendor/"
=20
 B =3D "${WORKDIR}/build"
 export GOPATH =3D "${B}"
@@ -80,7 +81,8 @@ export GOPROXY ??=3D "https://proxy.golang.org,direct"
 export GOTMPDIR ?=3D "${WORKDIR}/build-tmp"
 GOTMPDIR[vardepvalue] =3D ""
=20
-GO_SRCURI_DESTSUFFIX =3D "${@os.path.join(os.path.basename(d.getVar('S')),=
 'src', d.getVar('GO_IMPORT')) + '/'}"
+GO_SRC_DIR ??=3D "src/${GO_IMPORT}"
+GO_SRCURI_DESTSUFFIX ?=3D "${@os.path.join(os.path.basename(d.getVar('S'))=
, d.getVar('GO_SRC_DIR')) + '/'}"
=20
 go_list_packages() {
 	${GO} list -f '{{.ImportPath}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
@@ -95,7 +97,9 @@ go_list_package_tests() {
 }
=20
 go_do_configure() {
-	ln -snf ${S}/src ${B}/
+	if [ -n "${GO_SRCURI_DESTSUFFIX}" ]; then
+		ln -snf ${S}/src ${B}/
+	fi
 }
 do_configure[dirs] =3D+ "${GOTMPDIR}"
=20
@@ -114,7 +118,7 @@ do_compile[cleandirs] =3D "${B}/bin ${B}/pkg"
=20
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exc=
lude 'testdata' . | \
+	tar -C ${S}/${GO_SRC_DIR} -cf - --exclude-vcs --exclude '*.test' --exclud=
e 'testdata' . | \
 		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
 	tar -C ${B} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' p=
kg | \
 		tar -C ${D}${libdir}/go --no-same-owner -xf -
@@ -127,14 +131,14 @@ go_do_install() {
=20
 go_stage_testdata() {
 	oldwd=3D"$PWD"
-	cd ${S}/src
-	find ${GO_IMPORT} -depth -type d -name testdata | while read d; do
+	cd ${S}/${GO_SRC_DIR}
+	find . -depth -type d -name testdata -printf '%P\n'| while read d; do
 		if echo "$d" | grep -q '/vendor/'; then
 			continue
 		fi
 		parent=3D`dirname $d`
-		install -d ${D}${PTEST_PATH}/$parent
-		cp --preserve=3Dmode,timestamps -R $d ${D}${PTEST_PATH}/$parent/
+		install -d ${D}${PTEST_PATH}/${GO_IMPORT}/$parent
+		cp --preserve=3Dmode,timestamps -R $d ${D}${PTEST_PATH}/${GO_IMPORT}/$pa=
rent/
 	done
 	cd "$oldwd"
 }
--=20
2.39.5


