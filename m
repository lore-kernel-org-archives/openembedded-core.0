Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F2FC77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 04:38:12 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.58])
 by mx.groups.io with SMTP id smtpd.web11.1567.1685075888994056448
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 21:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=srzzK9Z4;
 spf=pass (domain: siemens.com, ip: 40.107.13.58, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHifN+bSbTte3RCdUGwvBKd426C8F7lj+XehP4P6HPK4gTqIZTQGwDFxtAsWdVN0SBy5JiKOM3ZpGFherrbtRL2DQLcLJZkwvu+xcs8jxRd67EqzI0DEQeKhWVpOWr6IDO4yzS8tPBMLPiKlj30ttqqyXvcurXdLMYBVsVkWaljJO7+rk73s4hVYmMpWAJ+dLuhXYzdI4J0kzCcY5uZovToL1PcoE0ah6uPZ4absAVba+ZXXb51sZW16WBtS5mv+8Bw+Z6cBd9JZOi4xisuS85PNV70wCUKs1r/wvMKbhq6kH5VOh21Ll5aRy4Q/0XXUesvBkzzJpbBQ427Wn+iAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKV/A3l294mB7s9KrkPPwpsu4KLlBQsoHOfyWB3bCrc=;
 b=Nsj1ZwYWhImBVmZSRqlL/VhvI/9UVoaxPe4QgvFT1eigo7TCrZBOC/7N/F7Q2MSHduQhWzSwa7JNOjWcToUrF9MzgDvsig/wvy9ldiDWCCziBfsypSfr1uqOLGTx6GpQTEFX2AVqoujFWttdd8BhPszXQN3ngXcFSfaKcZOhO/hcWLIxLYGhxtahWE+ouMFC3rSD7ejyKl7PHP0GzacAg4KlrIpfFs3EZKqqab5H+dfqk+XCeBmUGbBctTigHdvoQT/rLUfKzJG9lRnoaXzTLNoy1Vn4hO4WofAG0AtprGcqljEysjsYE5eB8wirhi2kamlp0qo+SbSNazLM6dqtvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKV/A3l294mB7s9KrkPPwpsu4KLlBQsoHOfyWB3bCrc=;
 b=srzzK9Z4OvP8u3sklJIksEBelxNnhIlvaEG9G9IEdhd8sbpZKQtMoXoJB9Qkr0kpKWGyN9uxZTRLSWS9vKxfQaEZ07u4htXGVr2y1n6Jx84EfLdH3vyrOp6NammpOZt8gEyX23qbGGZat+gp3mzmGzWH9uRV9yddzFwDv7/mrwVPeCnS60EsHdSIJtPb9Wc/lwKspF+0U6eKr6rNoIVvSKOmlqY5i14bxRuizEijhggn1PYseVmRoRabaFBNlRPrBo2MnsR2eQvTGyZ3Tb8QHAmNJ0YtRE4Iswr1ynBc44lahEaYKuLVBoufEhPHFNn4ScgUAXu3GR5TuxgzUWfokA==
Received: from FR2P281CA0040.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:92::7) by
 PA4PR10MB5585.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:273::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Fri, 26 May
 2023 04:38:05 +0000
Received: from VE1EUR01FT013.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:92:cafe::11) by FR2P281CA0040.outlook.office365.com
 (2603:10a6:d10:92::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Fri, 26 May 2023 04:38:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 VE1EUR01FT013.mail.protection.outlook.com (10.152.2.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16 via Frontend Transport; Fri, 26 May 2023 04:38:04 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 26 May 2023 06:38:04 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.37.138) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 26 May 2023 06:38:03 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v2] busybox: 1.36.0 -> 1.36.1
Date: Fri, 26 May 2023 06:37:42 +0200
Message-ID: <20230526043742.13619-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525084328.77920-1-andrej.valek@siemens.com>
References: <20230525084328.77920-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.37.138]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT013:EE_|PA4PR10MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 051b9d3b-14dc-4395-1f61-08db5da2ff08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kNrkDENWLcf61k2JueO5rBx1B9A2qxMQzWPtX0iQ6zP2cnXmMvUWba4mmf/KlimBfwlILy2i6T2w1orUuPBRri9VabUngQR51Qy6udz1KMOmUyzHJNFyk+qu4n3t1Cz9ZYZrHLcbf/sn9uAInniG9s8VbFV4lhedN50Z83+aLPyfacoVMURpddAHvNARt+t9RgqOmVwQKiEV4PWrcwxyYou3rkkoEVLMlCrq/HGnchDMOUIiPrI1k99OImZc/ob/JGTDj98D6fOi1mjl88P91wBffnQ9dkXhr71gZV5TSROfseQS7vDER6FPy4ICa658lwQM+J3Vqx9cXronS1Gszy9f6kBcGn+PpuNwfQswwxzTlLG0mfnuBwro/Md+IpIKAkU9Pfl3UtRmtMRhopaTXMNT2N5JBU26HvK8rB0uOoPOGDu2ScmoJnDPTk05lGUOwwHRZH0Q/YdbsrMcecyjwmpk4mZF49/H/Y30tnKVeXR0FGjgIq1gQv8B2XfO6WGgFvIOf5Aavshc6JOD08gCXTYfaOLIPOK1CH3BoCxrTfa0GEN5h5rGZ3DECAz7aDIhV+gaikQbruatF2B+1TKv1kmoQm7f2omcG1MsIPsF0UrCvJeELfuuUxVY2TwQ/sn3aB0e00oRNcnbfi+Wo+5N1AwQAmeZKnFD7LlNeN+CT3/LF+pszJwoo5pTsJR0Kmavi90cJeXhZntgn6JfPLs94WKBlMYnpiUNhX3BnujClco=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(8936002)(44832011)(5660300002)(47076005)(82310400005)(36860700001)(107886003)(186003)(16526019)(26005)(83380400001)(7596003)(2616005)(7636003)(82960400001)(4326008)(86362001)(956004)(336012)(82740400003)(356005)(1076003)(70586007)(40460700003)(6666004)(41300700001)(70206006)(966005)(40480700001)(8676002)(36756003)(478600001)(316002)(6916009)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 04:38:04.7310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 051b9d3b-14dc-4395-1f61-08db5da2ff08
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT013.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5585
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 04:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181757

- regression on x86 is still in place

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../{busybox-inittab_1.36.0.bb =3D> busybox-inittab_1.36.1.bb}    | 0
 .../busybox/{busybox_1.36.0.bb =3D> busybox_1.36.1.bb}            | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.36.0.bb =3D> busybox-i=
nittab_1.36.1.bb} (100%)
 rename meta/recipes-core/busybox/{busybox_1.36.0.bb =3D> busybox_1.36.1.bb=
} (96%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.36.0.bb b/meta/rec=
ipes-core/busybox/busybox-inittab_1.36.1.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.36.0.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
diff --git a/meta/recipes-core/busybox/busybox_1.36.0.bb b/meta/recipes-cor=
e/busybox/busybox_1.36.1.bb
similarity index 96%
rename from meta/recipes-core/busybox/busybox_1.36.0.bb
rename to meta/recipes-core/busybox/busybox_1.36.1.bb
index 8014a5c7bf..968dce65e4 100644
--- a/meta/recipes-core/busybox/busybox_1.36.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -53,4 +53,4 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV}.=
tar.bz2;name=3Dtarball \
 SRC_URI:append:libc-musl =3D " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
 SRC_URI:append:x86 =3D " file://sha_accel.cfg"
-SRC_URI[tarball.sha256sum] =3D "542750c8af7cb2630e201780b4f99f3dcceeb06f50=
5b479ec68241c1e6af61a5"
+SRC_URI[tarball.sha256sum] =3D "b8cc24c9574d809e7279c3be349795c5d5ceb6fdf1=
9ca709f80cde50e47de314"
--=20
2.40.1


