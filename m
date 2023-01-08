Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8000C53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 17:25:42 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.65])
 by mx.groups.io with SMTP id smtpd.web11.49685.1673198740475685748
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 09:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=dkPSwqGq;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.65, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEhZNWimNzE2Fjy15Ycrflpyhae4rKssH8GYbV9nQ8g3yqcbsxgc5lyjvjj9fne2SXJr+tw0q+cXi18xisJq6kZZZhi9A54uez6hYsnWIVZazRduUfoU779PFBk77PiIlRYKKrr3qvwwyqoFtek4MyUkW7MnMYCUcHZIbnI8STkww0bpBbaYu3HhP80LNP5IdGDYdvbONSsTNc7BfsNO4ih0xq7E+9cX8PtZy/OKxGv5MXntiJJBXTMcA3Aa4qOuUvaBAAxyd4A1nd6HoCXIel3MjdM9jcmP0RL1jjgz3DHommYg4shqeYTMPHIv45nqosnYZ4ZAljQrDK0tmPbEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4owHhEtvgpj7/rvK6VyORd7ZUZ/bR+M6CDO4tElS64Y=;
 b=eu2cPCNi7BEPn+ZtW0eMicrcyigA5eKh70GH1lQpykpbTpgVBtnamtYZXxplTz4ZIz7hIyM5Twiyk5/8BButqAXU38GcBstr8jRC61Z2ep1mhbA/7demxUpmYXRjZqCwRkaFD0sJWHsrx27RDUtHKiKWoEkMfG8md/uzbjWaHhVE04TyhJZG8LtlUvScTr6czl9gfv1arNZOUsejHs4+i4DTdYb/z/J9kfrecN1bJqmMZIhVLGDUHoTSMD4z6dILgYVwK9Uc1k5u9XOz1+grvuwO5cQAnuds2RFMEh1JRzpE66EwWX+9dDhtAHu40rR9hUYXkNCBjRdQCREQ/5ALuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4owHhEtvgpj7/rvK6VyORd7ZUZ/bR+M6CDO4tElS64Y=;
 b=dkPSwqGqjoiELmN8uGRO7RrCS6IalIengX7R2Cy4W8QZtaXgBP8Nrzi598X7bQokYwaQypa6zIz9ZrBWWFbIuTJtnw4aouwgo57seVZzzVeo4AsG5dplbKTNOgxzgrTegPUjPtHcVJrKB8rurYzSheVPyLDo7rlH40r+krmpD2Y=
Received: from BN1PR14CA0009.namprd14.prod.outlook.com (2603:10b6:408:e3::14)
 by SA1PR12MB6800.namprd12.prod.outlook.com (2603:10b6:806:25c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Sun, 8 Jan
 2023 17:25:38 +0000
Received: from BN8NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::82) by BN1PR14CA0009.outlook.office365.com
 (2603:10b6:408:e3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Sun, 8 Jan 2023 17:25:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT083.mail.protection.outlook.com (10.13.177.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Sun, 8 Jan 2023 17:25:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 8 Jan
 2023 11:25:37 -0600
Received: from xcoapps69.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 8 Jan 2023 11:25:37 -0600
From: <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>,
	<michael.opdenacker@bootlin.com>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, Sandeep Gundlupet Raju
	<sandeep.gundlupet-raju@amd.com>
Subject: [OE-Core][langdale][PATCH v2 2/2] kernel-fitimage: Allow user to select dtb when multiple dtb exists
Date: Sun, 8 Jan 2023 10:25:35 -0700
Message-ID: <20230108172535.2366114-2-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230108172535.2366114-1-sandeep.gundlupet-raju@amd.com>
References: <20230108172535.2366114-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT083:EE_|SA1PR12MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c63924a-c708-406e-88c2-08daf19d5bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hbtqsxrCBShgC9BSRi27EMrHZbPVRov9w5pyGHLtoSYnYJXsysHB81ZP7BWzbuGEPtCMYpO7QYiCkxbZW1f0OhyBsm/EVBAlGXxJocX/WqGNg6DGne+awruRo1WU/ituYj5XAKbKnxyUcgvPnh//ZfUlemirSBQ2zAKFHy+bctgH0HcdYu6S3w7gTF6cO8MmvPyYjbBYHc6kP9yZZUl7TMdIDm2LLhCPpziWmLiYB8/q8zwwaBLupZf7jhPwBNNGyTrKBzOAw7NwnJn+ufTSysmBJvxMOU6dOVxUuz/js2G6WKwu1ew68nlDlRiiusr3cCE/il3wkic6N1MYUVKk0N54pL+eAqySDXLhnS3ckNf1GQtKThi+pNPUErjdY4tQYWB5uQzQPeELQX4pX6NHytLWyp0rhqKWCvAbkpJKNugAAc+IFzNJiXc9Mfzmoj6jU7kyk1CaqDhcQvxVQpFUgBwoYB2Bx5RLfY6tg0TfgKb+uZIIJB7B9pu/OCZhYJvV/sSWkzObL5S5reirCyx0kSLYgNKYBZMdMvcNEUZkjiYRzBjrOEIB+XFG0/AnOVlG/nS97XN+T84fSA5MzbdSKAl917xLaJ0GmqAbkEYpnB38ch5bfPRNFtHLyS73joDu+QLjPj11FgxnlJ5ihIKYAHgTkGOklRGO/rud16b77nDvSHbIYyvj4qL8CgwinA57YivSKNeMsrqQ3ZfKy++t+mwSDbi0z8swqsYRHR2KJ7A=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(356005)(81166007)(36860700001)(82740400003)(86362001)(41300700001)(70206006)(8676002)(4326008)(70586007)(110136005)(54906003)(40460700003)(316002)(40480700001)(1076003)(8936002)(2876002)(2906002)(2616005)(336012)(83380400001)(426003)(47076005)(5660300002)(82310400005)(478600001)(186003)(26005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2023 17:25:37.8102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c63924a-c708-406e-88c2-08daf19d5bcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6800
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 17:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175634

From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>

Allow user to select the default DTB for FIT image when multiple
dtb's exists.

From machine.conf or local.conf user can specify the default dtb
for FIT image as shown below.

FIT_CONF_DEFAULT_DTB =3D "board-default.dtb"

Also fallback to avaialable dtb when FIT_CONF_DEFAULT_DTB doesn't
exits or empty.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---

Changes in v2:
 - Add check condition if FIT_CONF_DEFAULT_DTB file doesn't exists
   and fallback to avaialable dtb in EXTERNAL_KERNEL_DEVICETREE
   path.=20

---
 meta/classes-recipe/kernel-fitimage.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 06cdc4f1ec..f6d82ce061 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -73,6 +73,9 @@ FIT_CONF_PREFIX[doc] =3D "Prefix to use for FIT configura=
tion node name"
=20
 FIT_SUPPORTED_INITRAMFS_FSTYPES ?=3D "cpio.lz4 cpio.lzo cpio.lzma cpio.xz =
cpio.zst cpio.gz ext2.gz cpio"
=20
+# Allow user to select the default DTB for FIT image when multiple dtb's e=
xists.
+FIT_CONF_DEFAULT_DTB ?=3D ""
+
 # Keys used to sign individually image nodes.
 # The keys to sign image nodes must be different from those used to sign
 # configuration nodes, otherwise the "required" property, from
@@ -375,6 +378,7 @@ fitimage_emit_section_config() {
 	bootscr_line=3D""
 	setup_line=3D""
 	default_line=3D""
+	default_dtb_image=3D"${FIT_CONF_DEFAULT_DTB}"
=20
 	# conf node name is selected based on dtb ID if it is present,
 	# otherwise its selected based on kernel ID
@@ -417,7 +421,17 @@ fitimage_emit_section_config() {
 		# default node is selected based on dtb ID if it is present,
 		# otherwise its selected based on kernel ID
 		if [ -n "$dtb_image" ]; then
-			default_line=3D"default =3D \"${FIT_CONF_PREFIX}$dtb_image\";"
+		        # Select default node as user specified dtb when
+		        # multiple dtb exists.
+		        if [ -n "$default_dtb_image" ]; then
+			        if [ -s "${EXTERNAL_KERNEL_DEVICETREE}/$default_dtb_image" ]; t=
hen
+			                default_line=3D"default =3D \"${FIT_CONF_PREFIX}$defaul=
t_dtb_image\";"
+			        else
+			                bbwarn "Couldn't find a valid user specified dtb in ${E=
XTERNAL_KERNEL_DEVICETREE}/$default_dtb_image"
+			        fi
+		        else
+			        default_line=3D"default =3D \"${FIT_CONF_PREFIX}$dtb_image\";"
+		        fi
 		else
 			default_line=3D"default =3D \"${FIT_CONF_PREFIX}$kernel_id\";"
 		fi
--=20
2.25.1


