Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84394D41C2C
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 12:23:42 +0000 (UTC)
Received: from ZRZP278CU001.outbound.protection.outlook.com (ZRZP278CU001.outbound.protection.outlook.com [40.107.167.110])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6667.1765450063316489213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 02:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@duagon.com header.s=selector1 header.b=KtqAFlst;
 spf=pass (domain: duagon.com, ip: 40.107.167.110, mailfrom: bastian.germann@duagon.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9IWXd4xkP8a1GtctijFxfi62CQzwMxfmFE1lqqTqR0FSRr0ojeGUJ8yEgxvmyQO5bmTNViYdLfLI5zmDLF/qlJ+eDpt+oyYyc5X8XtqAasCXI1XoabwXocg9awwF0WB4Qna1uiXXtnSLweP19mc/UMDNOXXmNQkQr1LBLKyfIJCgHgeuON0u57wOzn4krAz1Re5ghVhLVWbJeLmZN36IKG4AOtJ/ejGR17k11I9xNCVy9p0O6RfMyQUDFhBCCDYefIKA5vdbtzoNwVkEIsp77HKQN9Bh/q7yBIcoqbsPmpxue9I9kIw/pyfTCxkyOAinaFCiTKoVK8t1sQDROizrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1GKxdgnzvQIWVrMD9C60XoetDHhBEEb8k9dqLzqQ4c=;
 b=H5Z6gCe+Kj9EDFf1g3xaEPXerGnxf6RsSUGe2KkJkrIA4CQB7LagucS6+R58x4RSvV/NzIl9NIoGX4mtJPkuxHzZuLpgkUcoviJVaKEzdnC1rM02i7jB4XUwwMVQ/5G+xJJd5H2HSAX+75WT/N07jg7+mtcOJxBrR39ynnXWDFjSYQYwlue5xeKbyZjhWZ4KCjfuGRWOZG3IUnhH9t7YKL0TnA5g3fS7WKGLhBTKhXv6FL6ZlxJsk+PwiqA8z/C1ETeMFXoA99aCMl7/so8/CC0aHeRLbI+kw8MYEDg2tZb95kolbIb2Nvp/R3XbZUh/t15hcQdZIaSUeNPLyYw3zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.86.3) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=duagon.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=duagon.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1GKxdgnzvQIWVrMD9C60XoetDHhBEEb8k9dqLzqQ4c=;
 b=KtqAFlstflyvoWZE+bk2kdXDc3Yo/9M8a1tnNB2KQPT31eqi444FpuxRvZkiM8DPJap1uESrCw1OrX8e6CC5WX2fnp+uaAPOfFGuER6nf+yvdaqNTfCwvhaSUBJ07ANz/+NJWvU+/LHc/pCbwfWRksnJNki3Dx/VA4br0EBmb6c=
Received: from DUZPR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::16) by GV1PPFEF42B3130.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:718::231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 10:33:01 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::b2) by DUZPR01CA0009.outlook.office365.com
 (2603:10a6:10:3c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Thu,
 11 Dec 2025 10:33:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.86.3)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.86.3 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.86.3; helo=GVAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (162.55.72.219) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Thu, 11 Dec 2025 10:33:00 +0000
Received: from hz-glue03.de.seppmail.cloud (unknown [10.11.0.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4dRpnm0hb5z4wlN
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 11:33:00 +0100 (CET)
Received: from hz-glue03.de.seppmail.cloud (unknown [172.18.0.6])
	by hz-glue03.de.seppmail.cloud (Postfix) with SMTP id 4dRpnm0ZYnz1xbL
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 11:33:00 +0100 (CET)
X-SEPP-Suspect: f9d150f0f63a4f329ed712f5b30047fa
Received: from hz-scan09.de.seppmail.cloud (unknown [10.11.0.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue05.de.seppmail.cloud (Postfix) with ESMTPS id 4dRpnm00SBz1wLh
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 11:33:00 +0100 (CET)
Received: from hz-scan09 (localhost [127.0.0.1])
	by hz-scan09.de.seppmail.cloud (Postfix) with SMTP id 4dRpnl6byhz19B8
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 11:32:59 +0100 (CET)
Received: from hz-m365gate01.de.seppmail.cloud (unknown [10.11.0.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan09.de.seppmail.cloud (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 11:32:58 +0100 (CET)
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010003.outbound.protection.outlook.com [40.93.86.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate01.de.seppmail.cloud (Postfix) with ESMTPS id 4dRpnj6WFsz2wjL
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 11:32:57 +0100 (CET)
Received: from GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:44::7) by
 ZRAP278MB0094.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:13::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.16; Thu, 11 Dec 2025 10:32:55 +0000
Received: from GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM
 ([fe80::4ee4:c505:4a4d:6b1b]) by GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM
 ([fe80::4ee4:c505:4a4d:6b1b%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 10:32:55 +0000
From: "Germann, Bastian" <Bastian.Germann@duagon.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] fix(run-postinsts): exit on error
Thread-Topic: [PATCH] fix(run-postinsts): exit on error
Thread-Index: AQHcaoiGcAE53GmIMkS/OhJXqqOrrQ==
Date: Thu, 11 Dec 2025 10:32:55 +0000
Message-ID: 
 <GV0P278MB06880222F486E5880988044993A1A@GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-codetwo-clientsignature-inserted: true
x-codetwoprocessed: true
x-ms-traffictypediagnostic: 
 GV0P278MB0688:EE_|ZRAP278MB0094:EE_|DB5PEPF00014B89:EE_|GV1PPFEF42B3130:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a594ed-4605-44b7-b01b-08de38a0a8a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?iso-8859-1?Q?ZCkqLe3+25fvhTXZxrMiCyyp/xAColsTDDFAPUkHEqqiQ8wVeQMU7TG1mw?=
 =?iso-8859-1?Q?2wcXMc3kNkpsHo+hqzwCkFFjK7EdQE6JndTLml2bijLVObL3VEstLYjDFG?=
 =?iso-8859-1?Q?ZrLXFoXlrgk8+Gfo73pfj+ecwBK0UAfHpm4JO8wI7/j7C75lmTqoKuF/ru?=
 =?iso-8859-1?Q?2vggqmcpgFZGTb0LEPjktFyFom6Nr6Gw/tBGlwpONmauU2XNkmVSjnvI6l?=
 =?iso-8859-1?Q?DWl61VazFbc3ajVwlTAdM6F1C0gnG3IY91ARdVC/QA1aAtzIY1pDTf052d?=
 =?iso-8859-1?Q?QWAHeRZWMqx7L6NWev5aax9D7mR7ejQBjBH39oJjpwY3zPVYK3NQFuPc0s?=
 =?iso-8859-1?Q?8iBqZISYJkSOUZgsnkin/caLw+EtbRvcNRjdhtxrh3+btQPxUZAvWxPhH4?=
 =?iso-8859-1?Q?c5UcaO7+JzNpM4mCjlYeKmDPTx2uei0Jl7t1q4dppixyPptK4Exyxo6oLF?=
 =?iso-8859-1?Q?dnrw4Gh75Cz7hutncp5b5be42kxKFFsuG3hcMntR3TeDhG/dE8OGzVX7pq?=
 =?iso-8859-1?Q?gtFXua03ODE19I96075MQuod3Y3/gk2n4bEyUW2xCq0bmMRGCACWLuBKr2?=
 =?iso-8859-1?Q?FqjTVUMM8jccr5GHo8ns4xlASO68/sgciC1qGranrBEPc3NAe2ahEBCSSU?=
 =?iso-8859-1?Q?MFv2K3WG+KcBGgNgK6XF5WUJ5sjYtpOLdLV5ZCtm9CESbrGlltiD7RtnP0?=
 =?iso-8859-1?Q?yMdyhqkPSifSo7PbYK1XPUZyyZKEjGPEtX7S6KyytNZyWFr7kpag9JxRuG?=
 =?iso-8859-1?Q?UwGeDJaZOMGOJ7osnexEnDf5dKODaUgrmXRcUN0cs31WPvdreqyAnJFDRh?=
 =?iso-8859-1?Q?X+LofGPCchzOe509hEdA+l5cQngQkYVEPswubxVpfxGvf8aOc12MgwqEa5?=
 =?iso-8859-1?Q?sYrBSPCqoFGayXMICkphbrAYv9zrtzjqEN5V784DQusHJ2oipiiB2KVc4s?=
 =?iso-8859-1?Q?xQE1e+o/RtKB744gMbHThvk7yMZLdc8MdooSHlAcWKF6kaikbYt3sBu2L7?=
 =?iso-8859-1?Q?b1PtbM+p/FGNkHh/D5dLHP+p1YZNOU0QfrOTEWVECp8GdCuM20PbJ8tN3V?=
 =?iso-8859-1?Q?m+5sUmrvX8M1UeEgljnk6RP4fFweNPhtzW92VUucxV3jvj+qHq0ejm/sx9?=
 =?iso-8859-1?Q?SA2C/zV0LPYXlaa9cov3iF2k/Vbbb7Deo3mYsK+0sUg12+0/zPthK9F6LB?=
 =?iso-8859-1?Q?S1/W2FAUZKzC68wHaR8wgGxYU75pRl488lV31DjGaWHzX/cbCjJagwVAOP?=
 =?iso-8859-1?Q?Q2OoJlbisZaOq2o7OicH+2H+AUuO2z/ro3K6IVLxGQU2jOmYNbEWrfoguW?=
 =?iso-8859-1?Q?wpPuMQTElxxiua/eucFVbUrPH1kSkXoquM7szXyKukq8+g3FWGilS1Wp4Q?=
 =?iso-8859-1?Q?bvykbnifo7pTiT3RZp/0MtsZ9Rqsyw4gYNxjBqxKUn99IdETXFXpOvB5rE?=
 =?iso-8859-1?Q?k4y5gnh3A+lFllmQUUc7Tn5BROD82VSOCzdlvyLH3+W3JNTdAwRU5k2eWn?=
 =?iso-8859-1?Q?3dEi6sy5GFv9GYaBj1VBhyr9/X/+X2nigWTMpulHZt0NhtGdfAUlBCohbV?=
 =?iso-8859-1?Q?Y5NJpMzZJ0nziGloU922kxYCcRVj?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0094
X-SEPP-CCCVersion: 2025-12-11T08:12:51+01:00 9ed91da2
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[40.93.86.3];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender: 
 ip=[40.93.86.3];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
 57816477-9361-4872-c156-08de38a0a540
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|36860700013|376014|14060799003|156008|35042699022|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
 =?iso-8859-1?Q?N4p1YjQf+yOIfKcRPSsmLA1Qq3YcxlIOwm5h8+q5KiYViXpZjVu6Ofs6fM?=
 =?iso-8859-1?Q?/Lid3szZ4arLCQblaXcoNR6LIIriAy/1ojeOZZTum5DmOAnatkzP4bjaCN?=
 =?iso-8859-1?Q?RdHi7eiEVLdLu9B2h7Qz4VLypSQ9TKzy+CSkxD7EKYWU0oOPIaAI961rMo?=
 =?iso-8859-1?Q?Vx1gMPZBYJYO/rjiLR2QUZtww2ABeYMhJ5aQk2y293fu1TcIdl4sJlKe3n?=
 =?iso-8859-1?Q?BitrwO5tqnmTipAfu25NFMKXrw0R/MQBd3ZNmrqXX7wWlfQztsxZTlYbZX?=
 =?iso-8859-1?Q?z4I+KCy9TxKWoybdob9EmgDql+RRhVGkx76y0b1NlOsSGxrA40X7sDNhm3?=
 =?iso-8859-1?Q?yZtynLNgKioH9TQQmWUTjb7IglDpZjRvuDRJ/Vjt4z0I/c++J8hwPyJCSN?=
 =?iso-8859-1?Q?jxcq2gJJ2vDhgxs4kM2QtiPWz56YGXTk87orrJPotrUda5GBLlUinMECPT?=
 =?iso-8859-1?Q?du7CrQ+kfkQ9bKRQ60DkxGz6CaYoFZJEnR4ZZE31CnfPN2iGR4eTtmyPM0?=
 =?iso-8859-1?Q?mz8ig9vPZZs59uKwAX/ivAUyLESAaLkLu3vLIvxr/91M4ktmiG0oPn/EbQ?=
 =?iso-8859-1?Q?jYvVnl0Y4b7P09/UBi3uM8fX8KU0Axyt1z/ZsYWQiJNEWjDjxVoATyyjvJ?=
 =?iso-8859-1?Q?UV9KarZB1KZKH+md8m0xMH8PgG1lk0DLHb6Rx1O4TMC3HGcLF/f4/p1qiv?=
 =?iso-8859-1?Q?ocXY6bkvH3rr2KaYIyTqQzchh8ECJtDFf68Q9Ir/vfXJXlCML0p4eZQrb8?=
 =?iso-8859-1?Q?p79XZzNizW+14zqZLHtiN7nYZCAKGRG2QsG1sJHPNEY4wy0msZEMNgovTB?=
 =?iso-8859-1?Q?6E6EU7vnpjDGfyLCt33yPN2AT6PaVmw4cXkfA+M69L6aMyajzItD0zM4UZ?=
 =?iso-8859-1?Q?RYWxMjIm55wx0igEGISTLR4keZSjaVRQGG/0bLdFKtyPENMG/8+qHRwKgM?=
 =?iso-8859-1?Q?sBQo2U/V7jhk07Em+ARK4qyZSOgKFLeEclRsnj654+EO5eeg56eDLpjkJH?=
 =?iso-8859-1?Q?+t96RIvjNYP6S/jvRLWfBFOX1sG9qExTtnkPm4kEvrOvlflqhKPRGWd5zB?=
 =?iso-8859-1?Q?MLoA+oPu9Gb7Nx3EQHRqqhVA8ubTcKrFDIt3iV6Bo0NVtL5E1d0OmtFjCD?=
 =?iso-8859-1?Q?7De59KMMRVnzHfa/gGv8NEd+DpArVqAvcspKzHP9zh1ccOVOL/?=
X-Forefront-Antispam-Report: 
 CIP:162.55.72.219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandwestazlp17010003.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(14060799003)(156008)(35042699022)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 10:33:00.6948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a594ed-4605-44b7-b01b-08de38a0a8a0
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[162.55.72.219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource: 
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PPFEF42B3130
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227525

In case a exec_postinst_scriptlets child process fails during installation =
we=0A=
want indication that the service has a problem. Otherwise the error is=0A=
disguised.=0A=
=0A=
Signed-off-by: Bastian Germann <bastian.germann@duagon.com>=0A=
---=0A=
 .../run-postinsts/run-postinsts/run-postinsts                 | 4 ++++=0A=
 1 file changed, 4 insertions(+)=0A=
=0A=
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinst=
s b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts=0A=
index a94a769b59..f374b05e8e 100755=0A=
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts=0A=
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts=0A=
@@ -68,6 +68,10 @@ exec_postinst_scriptlets() {=0A=
                [ "$POSTINST_LOGGING" =3D "1" ] && eval echo "Running posti=
nst $i..." $append_log=0A=
                if [ -x $i ]; then=0A=
                        (sh -c $i $append_log)=0A=
+                       if [ $? -ne 0 ]; then=0A=
+                               echo "ERROR: postinst $i failed."=0A=
+                               exit 1=0A=
+                       fi=0A=
                        rm $i=0A=
                else=0A=
                        echo "ERROR: postinst $i failed."=

