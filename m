Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251A6CD342A
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:23:18 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.49])
 by mx.groups.io with SMTP id smtpd.web11.35585.1725272591078618791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=XbQ0jh2u;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.249.49, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTk0f1VwAHOoi4DHjKX1T2kAYC2PS8JbJCVfRmDjkfzqJq57cyr9XLXRBRZHk2qVkb3ZSRdCfl3DVjH1fvdFZ1uv2UhG9euoswtJ5B7ZYCAg4ZXnrScvETuDwh15IyPD7Slk3UzdqpLPtnnzVlLAnx5tCe9PNS8secDGzJmPAdlLEMNvkBURlButXlMaHcI034EZgQZ87OrzXVfvoIWsFsY9gpPIvlastBoFKlS9N1pQYIUielItBBqJbFooOU9NOYIAoQ0LpMxtDff0qf6bpOBVsMeMy2QsrS6rXvATuxX49OqP8xVtp8EPmLG4p1qIdjvByWFsuxJsZ8ZtucsPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjAEFUPZZkRURg46jS8nMwxsT87IDEG3j4BjRMOk5C4=;
 b=mRopx9Ho9ZEmJXNfIVWsX3doig6YsZ/4CDrb8FS0ycmp1Y9Ivgz0gmTMIZuQFNBJBtm9sHI4H6FY46U4/fraHp8U3Cm/GdbKEi+qyuEojVMuHr35De1nyOttcJrarUDoE6B7U2EJlncUIGNUGnZ19lPb/q+BHaTTVCgDPsx3GqMnViQi4EcbWj5erJv674PjyVJmFk4hUqjpmGRW6dXklRDRdNY0tq2IxusSXo6xlsE2YVBcyq4CPsRstoHpuReqUt+d8PjjknJk+0IKhaIprhy+MYWhJIZcUR2ZFGPYb5/3QOSqawg3HUIC3oP98GqyRynRaPWoCZOyb2kmMeqjig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjAEFUPZZkRURg46jS8nMwxsT87IDEG3j4BjRMOk5C4=;
 b=XbQ0jh2uygOFNcx2VoqTKYXQkYkQG4e91ssrSwibFUrGZpNiLz30b0rrXCHMmIgYdSCwXY0LgA8/FPZ6cupmI1fjzEXtUuihltt2YYGsefZgHdOskHo4jqJ/kaAszUzOOYXuJDnl4wFZGmRe/w2UbuIc5HrExztmImKsFtjbcMiZIC8KVvCqfx1SqjRbaqq7HuMRj5k3ae0lkZLFXdle++J7YH64ogNVmyfjrvEex099owhQoDvPnZAFI4G39K6vYl9Tntr0hpPxGiROKI2k0LWlqYm+5IVn+F9/3k3kycV8enINjYRDoBTA/Px7R7Bl/SMzxzIFLxmoJCndVMhscw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by AM9P193MB1427.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:304::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 10:23:07 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:23:07 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>,
	Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 1/4] buildhistory: Fix intermittent package file list creation
Date: Mon,  2 Sep 2024 11:22:37 +0100
Message-Id: <20240902102240.3760442-1-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1ef::18) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|AM9P193MB1427:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c1330c-54a6-4d74-0c3a-08dccb393cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wdiiDsBUWJyFYKVp0VqyF7MUoXdex80HSi6NhpfjTaVF3LdkP9ufU2v6NUSW?=
 =?us-ascii?Q?lkg84aaX7Rd5zLcF5sqIn8uSn9N/1bTRgJOb+zihnalYPKfc/qMCctgmBCTL?=
 =?us-ascii?Q?vc0Ax2R7SmsaKGRcQzOX1mGYuK/NUj5VdY+Cj4U4v8z5bipNYZwuwzZ2Zd0Y?=
 =?us-ascii?Q?sDl6yJJTueIGbxs8iVSuLh6wU3UxSgw+ZhmY8esR2/z4E5h0Alr1zl6T4jlB?=
 =?us-ascii?Q?TnPWZsCY1K+cxoM838rLev7irOof7a6W6Rtu1q5oZc9dV6hQQDZzr/jIaVVn?=
 =?us-ascii?Q?l/NIpjR8DKYiptkWtCGhV348kNGMkyHLqVUYyf4CPGqxsMG3O0Z3Ng1NBVs0?=
 =?us-ascii?Q?aybyLrelrTYY8A6IO9Wv/uOQBuc6VrL+1r0+7ZfKpdttLpbb3WKmOpLjxlB9?=
 =?us-ascii?Q?1Ivodyt23ibUbx/HDg4LyO6br34vyFXP00K034Wcyv/tU8p+d8CoJDBvk5Q6?=
 =?us-ascii?Q?8IX+LxhwwenDhMvg/HYjF3x21gD5bfR6QmxKFfap4VM8VUvAlznNzta5RvPo?=
 =?us-ascii?Q?RcZnKsKqfeMj6taohe64nBPcuvHyT8GvZZd+TximWIDt/JpOgV88DC/rRRTf?=
 =?us-ascii?Q?EBypDdhusczQ98Hmek3Wot72qWqAWJF3yCrcP37Juc8SiNCPbPJydlwvsWCU?=
 =?us-ascii?Q?ooFliuq7Qp/rNOG7ElRAasflh18oLfbWFlGf9fYl3gcB+wsz3sG4VakOLqdx?=
 =?us-ascii?Q?y11ekS8QhfZiY3iSSF+rlfvsXKFeqt35KdrZw1nYHqd3+7wx6FBlfUTaz/dq?=
 =?us-ascii?Q?rTsNv0EdA0LSWLJca0s8bmxcxEdH5ojVH/T3Ud5ZUJuUmPGVtSMKC5sxS75b?=
 =?us-ascii?Q?GAILopeHRaySbNbi1CoNhteH+075qT95cAMEw+HHU3LsKYORDhn/SU48teOQ?=
 =?us-ascii?Q?bpho0n1k8D6l1UN4ssdqYIgy8excyR91zIc0904xbrUoGA+4X9EGWjEoutE3?=
 =?us-ascii?Q?E+AfvupN84r7T35yxHUNwuT5sQ/H6WRd9L/Mt99xSGt1TdbuGRn9lQ/BNoYE?=
 =?us-ascii?Q?sbqC5+4JvM8PFmebVwMoW2TZzYxr9VYyMmBQGz2AgXE9OCwHS45irU+r4UTl?=
 =?us-ascii?Q?UuR2k9UU0wMizzoK8hYTHlhbXiwrLDfZcxYdegoVtBp9l+2Q/XV/gaFL7Bv9?=
 =?us-ascii?Q?OheWkHYZU7SEyVA83JB/nhOspSLkfccSmUZ0IfNWTZEgnWTseERL3ibo70Bp?=
 =?us-ascii?Q?hwGcZQl8r2mLLvXrdxFeFtb7p1Rsuwc64+2fyclSeDko981lsC85j1L/tjmk?=
 =?us-ascii?Q?FIwVNFX1Rxhwf99hDJhewL7ZyTTBWYpfM46u8btlaQOonsM+5Kl/B0xi5EG6?=
 =?us-ascii?Q?x3gDE8dZSh7ebK49fjDZSmS3W6v11FXppRVzSj9X3RjDelvOCuVed6v5dkaD?=
 =?us-ascii?Q?18I/cVKkxz4y9CWINrGV0vzHAp/C1Hyo1/2dL7DYijsPrLvgCw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?40GwbJyGV/bkEO2OA70CGDQF288rah0G9Si3If/LiykYq9gWoTqUQhCBI+7t?=
 =?us-ascii?Q?t2tVNR6ZXFW+4eBXJE6LWu93AY6jkg687wD9zaIbHNGsxwKMtyP+NlnXeyl7?=
 =?us-ascii?Q?WDY/4JtPWzmd27mVlJm5MoQYkTF3w0es71VT31zkefqHuI7IYYNhe6N73Icf?=
 =?us-ascii?Q?TkA8wQh3qUiU2LD1muV6xduOTzBIuVIi3YU43SRO3DTRquU7vVYY02xWNI7Q?=
 =?us-ascii?Q?ZDUrK/IMBaBoaXYlBDXDbVYd0o/QLZvQdMJiDVCtGzrU1fejZjKs65yNWoV7?=
 =?us-ascii?Q?wSOt4VqT7W4abmd6c+9qrJdGAeO13Pdoh+SFLWSkeAuV+FZVh+Wi4UYinvGk?=
 =?us-ascii?Q?XBDlnYmGMyurgtPQcMBc6mqYQVxLTkRKl/fUIilmfzo8JIgWNwBBImKzlvxd?=
 =?us-ascii?Q?8Fwy0mEglk619z/JyeALDnynB3mUW+o0pfC8jXMG+6Bi4SQgZRi4c+X4gQZ9?=
 =?us-ascii?Q?vzmLnok+LwKD4Yf7G4TpCcbaZEd1BVfV/XQrDeltCk/rjAvhEpI4oPWhjejD?=
 =?us-ascii?Q?5xktcY/yo6v71btX2PIKCj0V76f91ZVDgqX73rLMpoHIW8isoiRAHet5DCYI?=
 =?us-ascii?Q?6cTY1MTM3+SD9PfVMVZCUdwOZoHQJ2XSWOU398SHfFCCWalmJvcAk1pKMJF6?=
 =?us-ascii?Q?I2UnuK76O1OV4O8uSY7BA0wgNUWJQrailCI2y3SrI/4vQdlrnqsZoV9Pb0nG?=
 =?us-ascii?Q?k8CoBzBnpE4Zk1Tba0nfdOaraCQTlVT9wqWX09bgv+OdvG5GcnzTK9V+ebvx?=
 =?us-ascii?Q?RBVBQrmNcm4QhAtZbMtHu+2WN/F2qlJYH/unDRxdR+6iMUf50n436KsZNRNr?=
 =?us-ascii?Q?k4W5op/VJHs8ZYMMZYq/2Q9DVfAVqjyejN2Jk+6WIp7DzKHrsMnClgbV/OJg?=
 =?us-ascii?Q?pU1x17useSMCDyk1Z0MewfTZDaBpLAasZIsj7A1msvKNHKi23c71DSOmfUza?=
 =?us-ascii?Q?Kd0sIjvREs6arfzHOPQOtYpDU/Dq6qdyVW2YbHA0g7yzrr/fV/xCCV6+/ZLx?=
 =?us-ascii?Q?BT32ooo55UwUWj8YPrpZo7JF+i9WZyYfDtR629YI5r9VBeRGCr5Pp67Wrl0z?=
 =?us-ascii?Q?/SbCMiXwy6xSbpffZpP8svAQlU6vjDWdLak/OUH+Vhg0ghrO449QkQXu44v6?=
 =?us-ascii?Q?+YIfcaj8wu94MmBYy0loQ+M+gCgayqsGsYAuE177dowegxX1knUfWmLJOYCR?=
 =?us-ascii?Q?7QPpUO76gUzcJSHUx1yeqT3kQHmJf8WYj3y5CQe+So5yk6+fX27lOaDGciBJ?=
 =?us-ascii?Q?wnJKzr0Kq3onICZmnE2CDXtkblSaDYqCfOZGT5ek2Lra8HJoo6+gWpyl7ZHH?=
 =?us-ascii?Q?GO1ASWve0twwY7pWDl1OxEA24TA0guhj7AGwMvymd1TIWC5+8rzdZtL/YorA?=
 =?us-ascii?Q?F14D2mfFh1OLUrmm0Ua+aeWoxOZz9pGhcV9+d7e6DwzAqoVIkbmIABuZ5ihS?=
 =?us-ascii?Q?IMlmtJJq2QhrtDxfVIzcDlxaKXLy2YFJjujDX6LEYR1V9gTO/iRo5Xa39LCy?=
 =?us-ascii?Q?p3gbvnKwKhSOMjxg6ZaPO/pC4+usos1V8GwHzUfp3XgSU2pMQchZalmJe5Rn?=
 =?us-ascii?Q?XU55u+xoU8rSBv0ziVwqou01KUL9FCZG0BkZYffe9NqGhLCoChG/0V3q52Vw?=
 =?us-ascii?Q?vvC4djAy4GQYPKToj0RzVeo=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c1330c-54a6-4d74-0c3a-08dccb393cfa
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:23:07.7672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b40Dn6aoVYd738sqZIa1lNWmOuAEC4mDjLxd0IyH98cEbuP4LWlxHa/jnPPZK268LczSkOMbkbTg0dOGspxF+LmFVwTKDCgUe0eZulSWgRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1427
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204074

The directory that buildhistory_list_pkg_files writes to during do_package
is created by do_packagedata so a clean buildhistory doesn't have
files-in-package written during the first build since packagedata happens
after do_package.

Ensure the output package folder is created to avoid missing
files-in-package.txt files.

Also it ensures that in case of `find` fails we leave with
a hard error instead of hiding the error on the for loop.

Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks=
.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8de9b8c1e199896b9a7bc5ed64967c6bfbf84bea)
---
 meta/classes/buildhistory.bbclass | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index 4345ffc693..b35508db27 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -597,15 +597,12 @@ buildhistory_list_files_no_owners() {

 buildhistory_list_pkg_files() {
        # Create individual files-in-package for each recipe's package
-       for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
+       pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)
+       for pkgdir in $pkgdirlist; do
                pkgname=3D$(basename $pkgdir)
                outfolder=3D"${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
                outfile=3D"$outfolder/files-in-package.txt"
-               # Make sure the output folder exists so we can create the f=
ile
-               if [ ! -d $outfolder ] ; then
-                       bbdebug 2 "Folder $outfolder does not exist, file $=
outfile not created"
-                       continue
-               fi
+               mkdir -p $outfolder
                buildhistory_list_files $pkgdir $outfile fakeroot
        done
 }
--
2.34.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

