Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F289CDB483
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 14:58:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.77])
 by mx.groups.io with SMTP id smtpd.web11.94698.1697381922963273726
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=gq6nKnAF;
 spf=pass (domain: welotec.com, ip: 40.107.8.77, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glT1x9aTUqCERAgJ2OiEaKXmBPVOwdpHp8lvk9rcDfKVOQ7HtF7pgqyiG5g1Ce36VAwx5ac31Nv0j4pmfbxEL/C4rOeKlgmrdBdUZGRVgRySH9c93kVHXd07Meeidr+1q+3izZ4UQQkUBDd/lHDS7r+cb0qHTmfGp7reDyywwcm6DalzoqT4TrVOASk5SCnc0vbE1PAi8cQymPiNYaRjJaqFFnLAU2AmZoN9M9MFC/QKGMe13EZmQsTmPjZlGKAcfRnKfEDdm2MtpdPV8FJviVv2zcT8Ug7yz7uwkjlT5pFLoOEE+6VmzcLUPc6k3arNQBOoz7rdCzF/925ohzEUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=962+Qutmx7yOQMSpDwCTL5Y8ribZgRBYEVAZLIMnMYY=;
 b=lBUbkr7CXWNVOv3fZOJL7shmL8xAidg2xspGYzt8wvyM3GjGQJC812RMKNEYjQWoO7T+pkBGxO6I0aQFqHqPzre0y4LP9jySCNxGv4dQdcQWXGmMkxOmikxTu+Ung3RBeDA+DwUTj4uFsZrXYYKHrMotpQEPAJMzEjOAOEAr3CNdVVklPPL+EGC9pQgY3LHmHsJiBFekEZ4CsSwHKGvvqaFVoIaJNKN8gCO41PfRB8jxF9h+R+nksBRhHhtwmyU79Y2CPcUwPKEolf975kzGybMx0ZtzeSK3Eu4GjzO6SLRPjARz7gSF7D8IVsqUZ2VG5xSsEQkU5uesLj9OhduUtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=962+Qutmx7yOQMSpDwCTL5Y8ribZgRBYEVAZLIMnMYY=;
 b=gq6nKnAFsTqot5Sgkf5e2kBccdpsWs8/q953kmwzAPFbQU9IOsZ/tfpaH50fV8T5Cd4gx2dwbYuc/xkfaVR3GjIYCeBx2GPJe/Lsv0CvJll+7SleetcwDOQrYdSSS6kf0mU2fJIgOEPlhfdTOH+K8Q2G1COKHjQJKbgZbFiGnElu+addfgPGF90riKJO1gu1sBnCFF6AQfR2aCeZA/OMO5i04IaHEfjWLO1hUp2km4B/kNdq/96dAuPTJxdlI/hg+ZrMW1WZnitvkwulpiAjJozhYIs4y53PtCKU27dfmSNGNw6ddDN/zRP2JT78HUpMBw5qs8LCIIX4J78U/2C6lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7613.eurprd04.prod.outlook.com (2603:10a6:102:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 14:58:35 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 14:58:35 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 07/11] sstate.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 16:57:45 +0200
Message-ID: <20231015145749.69995-7-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015145749.69995-1-p.lobacz@welotec.com>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dfa274c-96e4-4b70-33cc-08dbcd8f34c6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NXMbX9K+GX7xnnkFMxNqrC2vXaaXfLZUSSpiVu3jaGLAZvx3Fb2+N3uaoyZ8qj6TCiOOtX+q1sD9WajTbmrHu8Wrdd1qawsdKJabOSswgHexdN4dc/vXm4cN6H7lHP8Q0F29iEeedQGhbaqsUHxpwocx6pbm/AAxjyXq2fJQoq4zp0EABdQmgkPv1TyW3gPUNXdjl4+QIMCpmL46HEKbR4ZLXa7LWP2ABcdMxEg0Bd9Kijon2DADOU7KaRTQe+1AN0SGN/4XzTvXWXXmq+aw8xtX/HFZ3MQXJnLfHbp5UcoBNY5A44FprfnkquN3rk8wL7g/ICxMj53sjYVmOMpk3xuZl8EWI3ZN110YjuKsQkZ8lUc4VjGkcD4+2N9pKtb52FS25WpHNnIAdZ2YGXJC7Gbp818okyCrn62zqTMvTK1SKPh1BbG0584NhdTn79zTN162TkOtYw7xldNn6tK+klRNYaVh9RL/6HRvm3825+k2QeBWr3G9G9AqFKOV3+tQKLdKX+UrmHfA8qFooMY1bJ+DNDMI7ADoHHZICyWlLZQKbkeujjmtg/XrAff/UAHlztb+p1r9FeE4aifdZ3qCc5/VwtIQbUsVv//Dp+l9hmM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(366004)(136003)(376002)(396003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(66946007)(66556008)(66476007)(6486002)(966005)(4326008)(8676002)(8936002)(38350700005)(5660300002)(6506007)(52116002)(38100700002)(86362001)(6512007)(2616005)(107886003)(26005)(36756003)(83380400001)(6666004)(1076003)(2906002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eVlXdtRB569F/weVtTl0s6kzdJsWFm36Mvz0QBR5Ri6/FX4qBxq9InJS3yP2?=
 =?us-ascii?Q?RRXiK6KhDzhe2VEaT4ZtPRX3ckiNpdSJ/ywh/JQG4MS8aMm5YOHmFJ4RxE9D?=
 =?us-ascii?Q?f0Cq/fgcbxRUdZXZz5yiIrs+SGmuR+FjaLnRj7+goQJxek/slhkKMEa4ooOV?=
 =?us-ascii?Q?29TyZMshb73xcOSUd4GCwFFA1828ArupXcGrMPnWLk2SBYjY1jEZzM/p9QZp?=
 =?us-ascii?Q?1bJCVTZXOziRsIJrTDCSM6KhvugNEVFPs62mDQY97yhdEC/vxmvdPb2ScGMp?=
 =?us-ascii?Q?YDmpe+fuR0VlvOHrMChAhZpOPIWKNhDV8InZbn/syWR8GimEqpMIjVbLnsgR?=
 =?us-ascii?Q?TXm16ADFna1YZFtNCetTNZUDiiO4UOxwnOG+Qz0dTvCeZTAV1IoPmcjywoVT?=
 =?us-ascii?Q?zLJNrhSjn6DbVjNfu77u9ohcG//bLKhwQCgPiNJDhlRlhdI2Bq92ygBS4cJX?=
 =?us-ascii?Q?NfMg4IcmHmordXHfFNdvAR8W9ffSuqxFPzRl6r3JPRFlMffBFeaHgGjiXZdo?=
 =?us-ascii?Q?L0J6DVbyncIbvWxG3ZuD53EoqMFJyv8pEZN0qHI3pIea/JalHaA8L48VB5bQ?=
 =?us-ascii?Q?v0cBuzTj2nDLy6XmiBSpGXxiWOthfxtDb7IeBlhc5UMSScfbDpgTO79eUDg6?=
 =?us-ascii?Q?vFDfuqEnBijmsmU/UiuH0zIIQNMpM/wd2WMXXivHAq7lm16rXFNsD2Qg0v5p?=
 =?us-ascii?Q?rwgM4cGxlANqL9dcA5trpeloYRNtBxVsXRfaVndk6smQCfPVj8bXXaGfN84f?=
 =?us-ascii?Q?phjuCv26X2cD66oJqIqTkqnaYqqOr75a/Ul9FffItTuyxBK9bK37ij+6SfG8?=
 =?us-ascii?Q?tWueVk4Nr0PPlxDryk5ex3pEomNDvdyvQ0uPmASUt7TukZIBsNXoJznWzh2g?=
 =?us-ascii?Q?Cl9pR2k93p0xh3ygBV8iqWXu+AdPYwoh+hKgjc4D74FsbE2SA5hfAFh4HQEv?=
 =?us-ascii?Q?uNG5bf2bwfiA7uLl3ZtWXg1i6iY3y9p77xMw3KTAPnxjHz1I/WyYci1euW+w?=
 =?us-ascii?Q?8VVxMhTwPKhYd+wRP//+UMGvvLwrcKJs0kBUbywoAvM0ige3w6V0BbX4ryAt?=
 =?us-ascii?Q?oFBoWu2tAHHeQ+5pgxcww9NWynpfoqjQXtQRhNafj2dmnimXod/rgVxusXRl?=
 =?us-ascii?Q?7ttKdjuCVX6OH+nuJO3MsjBUe4ueDzAr/JSVPlzuIhFZOhE/2CgUC4upH5u7?=
 =?us-ascii?Q?RCRF/3xze8jzJetnTM6FLmZrm3iwxgnTtwg+0xcNPbOFfL4JOxcXz331zqYY?=
 =?us-ascii?Q?9eyLRat/OfCTha6YNattuvTczTNwwfOdzBnHQyv7gekQDGiJ+SZ98xOhuNHx?=
 =?us-ascii?Q?PzeskILgEu0BIByihnPWN8EYHzaTR1a/iWAP7TuhMmZjvnb+cm7R3omXiCx+?=
 =?us-ascii?Q?/Wttex8bN5P8qyWafFkk/I4W8B9rPqHM4nxLnAjeiR0B2Y3Bsl5mHTaHB5+Z?=
 =?us-ascii?Q?bXvX0rv4Y3p4Mu4GrPQhNVWJsefhfA6P6jg9G5iHOCGp3aO+8MMdluma9ZxE?=
 =?us-ascii?Q?sEa3lKf7SNN8a+Oq4xaMPwQiHi5RfKvBwddFQjYYsnqMafOrtEPRe2a40Vow?=
 =?us-ascii?Q?erX9CaemYW7VtQQVk66h0helQnKojFWyjQg9UW6g?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfa274c-96e4-4b70-33cc-08dbcd8f34c6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 14:58:35.3857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqdoS8MpGvZ7aDzVR+gu7Kh8tWX99Xv+EVCRpq+mARUiLWufqZNeZ/yQK7uq8DBRFRWSb6wu2nm9KQXtG5KSnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 14:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189155

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Additionaly set archive posix format, in order to preserve
milliseconds in timestamps for reproducibility tests.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/sstate.bbclass | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 5ae6f515f2..3e7b2ce474 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -829,7 +829,22 @@ sstate_create_package () {
 	mkdir --mode=3D0775 -p `dirname ${SSTATE_PKG}`
 	TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`
=20
-	OPT=3D"-cS"
+	# Notice, that if you create an archive in POSIX format (see section GNU =
tar and POSIX tar) and the environment variable POSIXLY_CORRECT is set,
+	# then the two archives created using the same options on the same set of=
 files will not be byte-to-byte equivalent even with the above option.
+	# This is because the posix default for extended header names includes th=
e PID of the tar process, which is different at each run. To produce
+	# byte-to-byte equivalent archives in this case, either unset POSIXLY_COR=
RECT, or use the following option:
+	#
+	# --pax-option=3Dexthdr.name=3D%d/PaxHeaders/%f,atime:=3D0,ctime:=3D0
+	#
+	# https://www.gnu.org/software/tar/manual/html_node/PAX-keywords.html
+	MTIME_ARGS=3D"--mtime=3D@${SOURCE_DATE_EPOCH:-$(date +%s)} --pax-option=
=3Dexthdr.name=3D%d/PaxHeaders/%f,atime:=3D0,ctime:=3D0"
+	# --clamp-mtime requires tar > 1.28. Only use it if SOURCE_DATE_EPOCH is =
set, to avoid having a generic case dependency on tar > 1.28.
+	# this setting will make sure files generated at build time have consiste=
nt mtimes, for reproducible builds.
+	if [ ! -z "$SOURCE_DATE_EPOCH"  ]; then
+	        MTIME_ARGS=3D"$MTIME_ARGS --clamp-mtime"
+	fi
+
+	OPT=3D"--format=3Dposix ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-=
-acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs'=
, '', d)} --numeric-owner ${MTIME_ARGS} -cS"
 	ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
 	# Use pzstd if available
 	if [ -x "$(command -v pzstd)" ]; then
@@ -895,7 +910,7 @@ sstate_unpack_package () {
 		ZSTD=3D"pzstd -p ${ZSTD_THREADS}"
 	fi
=20
-	tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
+	tar -I "$ZSTD" --format=3Dposix ${@bb.utils.contains('DISTRO_FEATURES', '=
acl', '--acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-=
-xattrs', '', d)} -xvpf ${SSTATE_PKG}
 	# update .siginfo atime on local/NFS mirror if it is a symbolic link
 	[ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch=
 -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
 	# update each symbolic link instead of any referenced file
--=20
2.42.0


