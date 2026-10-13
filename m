Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBD6CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 08:45:13 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2612.1791881103538193768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 01:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmw.de header.s=selector1 header.b=IOPPz465;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 40.107.159.18, mailfrom: moritz.haase@bmw.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjVufIsyztIonr8UUfXxSBeMaZOyxl3hs2C/0WwunKHo/ppITF5cecM6DnqF0TQN7K9PCWgvJ8yR4uI7bHJXJU0PmDxXAkr5InIiQl+7GN6eEh6iu63fGE0xXxKXFeMHG86T0mz8va8xt/dDcZP8igrHqkZA24eI+PCVBmM4oltxZqiiLA3Mao1GDaidpgaKkB/g7+NVMhNcPnTdZRI+/4M/u/5+a8rfD6fWz989NtFn06UVcEFYYUSBbobTqjbxf4jKGenDa9ujvl57JKKFaII3vsoarATVxmeO3A005X+NSM/4D1B6O7p9O8bHaevRHT9/x1Wo6pK+6XaAap6XtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o76i/MyZNhCOLxrvVjWoc81occ+2Rf2riLMalf47RcI=;
 b=LfO1naTXmGIj//vXch+45/dKic4me7IRBrnvUIjwJ8hjHhhIYwsqMXVkNdN3skLyF1s2it0xVtStBYcuPFoJGN77iQ6ANSe9mKzHiXF1pm7NRQ1ZtwXAXgoeH5KWL2V3JJDkZ5hrOUWnP79E1pb1u5bcTESdTHLxPd7pk7nAOiCvOL1V4UuxCbPVJdl7Zw9ZHOldTlyqBrn+3tIuSXrFQjY7ZzUAdf6BdGL4MpzWHeZ6mOvL53dDS4zL5PfbW21KXDhBlrBWnacKQhAYTOVI2tlDHx8vvmrm7/k8AD+OVjfJEX/VHUCN6mai3ybV4rWVICvtiKyo5In/CdXty3wI2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.109.190.44) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bmw.de; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=bmw.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o76i/MyZNhCOLxrvVjWoc81occ+2Rf2riLMalf47RcI=;
 b=IOPPz465Y36mHZCPX+T2G9IeBtsS1cFZ4+KOT5lh5zTTydwBr+mhA9zARi/1oqco7yZQMAK6O9AzwZlRDWt7r1ypiW/UCyJ5aRW5t+85TrcItvMQPQqF6Mqm31AK2Dp3SN+2O4+UV9PNWRtg+Ll1vT6dDO4IjtuQOTlM4zM01P3OzBvEX8D7zsn2CUm9uXAdlH6VlZSdLFMuiLS3iSKqdC+dm8uWzGU+10B2OySooxzq0YXHpszwJ0xc0kc8Fq2FJppxr4p2vAOtsHSW4TH9jK6AMQPUzGMf6RwTykr+vWCTyy9PEgDzzb+J2Yk7KGn226XqodRdCLFBZXeUnH8jKg==
Received: from OS6P279CA0141.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3a::17)
 by VI0PR09MB8655.eurprd09.prod.outlook.com (2603:10a6:800:335::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 08:44:55 +0000
Received: from CPH1EPF0000051A.eurprd04.prod.outlook.com
 (2603:10a6:e10:3a:cafe::39) by OS6P279CA0141.outlook.office365.com
 (2603:10a6:e10:3a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 08:44:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.109.190.44) smtp.mailfrom=bmw.de; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bmw.de;
Received-SPF: Pass (protection.outlook.com: domain of bmw.de designates
 192.109.190.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.109.190.44; helo=smtpedge.bmwgroup.net; pr=E
Received: from smtpedge.bmwgroup.net (192.109.190.44) by
 CPH1EPF0000051A.mail.protection.outlook.com (10.167.241.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 08:44:54 +0000
Received: from smucmp21a.europe.bmw.corp (10.100.172.92) by
 smtpedge.bmwgroup.net (192.109.190.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 10:44:49 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 10:44:48 +0200
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] createrepo-c: upgrade 1.2.4 -> 1.2.5
Date: Tue, 13 Oct 2026 10:44:36 +0200
Message-ID: <20261013084436.1245690-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.85.215]
X-ClientProxiedBy: smucmp19b.europe.bmw.corp (2a03:1e80:a15:58f::202d) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051A:EE_|VI0PR09MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: e718eec9-6d7b-4743-5b2c-08df290640f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|19092799006|23010399003|36860700016|376014|1800799024|6133799003|18002099003|10067099003|3023799007|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	USvATSmSrEbjliwz9x6s0mQW0meF3OqG9bhr6KbutmrFZCxeOLQk1zACyk6In+KjoLRfprtRmtaIMQMK66s3g0S106N2bHa5jZJMPJah3mqnrDsmrcZ4pHy1waa8rbqyqoxv+ik0DGYNSM9L80YL/20IeEFl5XydcXHC9nT9QMqphFuFZ1VHJZrbYLAjwswnniyrAOUDw6Pz44GLYSBFC8Fv2mNWBPnKLGWBWJAVuoYoiqjVRgILTqTwAYXedCrdCC2LKwOLBoDnL1cxC/BWF3HAWJH0Lt0eAJSLgMZs/2bhfMW5GivqaI4rcUlgNijektSxJC+pI/8K3yMl+rPmgav74s+1dmbtTTrTLKZQs6c+XnpRmEPt2XkHBA/JcPcGE7JdZsaPJ6M0oLehwioNnx0CQxYeZU097UvD7Yfg1rFvkcbQHF0XJ0HDSL3spuk53qbHKDbE42ISJGVDl4CuThVIduf+tjpfSSkvlD7TI/yVBxkR2Tpcvk8uibPNWTNgM5GwIPVRSOQoPA0zMIe4IoeYJmmXKlPpzD1qrZg1yEqe0Ytfxj9P6K+tz1HyKm2bk0hVCtsvv8Aq6qSX42BswOkmrxceVh/8isp8+Ij6lKIiF244hZZrYf/JIrfupOcbt89w7sZjYiGAEXG51hW9CLuuXgQ1cqaX3CpIMBlyx4wBi3DBkiYY9N1LyTqK6vNMvXzPRuSAx2mIQldi6ncuVw==
X-Forefront-Antispam-Report: 
	CIP:192.109.190.44;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtpedge.bmwgroup.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(19092799006)(23010399003)(36860700016)(376014)(1800799024)(6133799003)(18002099003)(10067099003)(3023799007)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SmEjJR7/St4fvDBqpQmSiVRGM/bQWldnDpmCNpnwtOHyPX8h4bx/DJSS46dt8uAgQ0hAdzjz/pKAur+PGCyTzf+ZQLIk2FaBtvJ6NoUT/RbUweI/VnGF86P/RNGMUlrGtcqYGpaTI5+miFFHKun+YprMwK9gR8Ug2hnb4QAH+4ZTQ0Njm+9bcMqwhXB+uCuc8WBzwdCfQN8c3X+kGFdIYiW43VlRuwPNc3z3DGFGzUNlqjl7R0JzhV3zKrRDj8EWt7iBWeXT5vUfCCvBpn5QpWORGSRjVw4h2jGV32/UbuGZUWIG6foT1aRWBf0kob19AUwIpQ4csJOHGxVoGzdS0DVN9fzonrZwj6jD5VStZUw5XZVeMnoi9m1IdAk/BQXnLzaZmB8GYMB4puz67e2nUrvddN5LiGzg4th25kXViwusLlhLyh/IQ0KGEtgo+pG/
X-OriginatorOrg: bmw.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:44:54.5441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e718eec9-6d7b-4743-5b2c-08df290640f5
X-MS-Exchange-CrossTenant-Id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ce849bab-cc1c-465b-b62e-18f07c9ac198;Ip=[192.109.190.44];Helo=[smtpedge.bmwgroup.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF0000051A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR09MB8655
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 08:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247711

Full list of changes in this release is available at [0].

The branch name has changed to '1.x.x-maint' with this release.

[0]: https://github.com/rpm-software-management/createrepo_c/releases/tag/1=
.2.5

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../{createrepo-c_1.2.4.bb =3D> createrepo-c_1.2.5.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.2.4.bb =3D> crea=
terepo-c_1.2.5.bb} (94%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.4.bb b/met=
a/recipes-devtools/createrepo-c/createrepo-c_1.2.5.bb
similarity index 94%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.2.4.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.2.5.bb
index f6da852f0dc4e969899228a2746830f8d4b6909b..7ffb7bce66bf7934b36144a33d6=
90a484c38f7f5 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.4.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.5.bb
@@ -4,11 +4,11 @@ HOMEPAGE =3D "https://github.com/rpm-software-management/=
createrepo_c/wiki"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
=20
-SRC_URI =3D "git://github.com/rpm-software-management/createrepo_c;branch=
=3Dmaster;protocol=3Dhttps;tag=3D${PV} \
+SRC_URI =3D "git://github.com/rpm-software-management/createrepo_c;branch=
=3D1.x.x-maint;protocol=3Dhttps;tag=3D${PV} \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.pat=
ch \
            "
=20
-SRCREV =3D "47ab8a418fb3abd58ef3760a7eace1481610c659"
+SRCREV =3D "6a48c5f599d30a20d15ea13b1dea82a86734d3d2"
=20
 DEPENDS =3D "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 x=
z rpm"
 DEPENDS:append:class-native =3D " file-replacement-native"

