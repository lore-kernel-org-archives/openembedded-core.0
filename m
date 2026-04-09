Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A235E98FD2
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:29:49 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128343.1775726988280307106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=dHINPRGp;
 spf=pass (domain: ericsson.com, ip: 52.101.83.17, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQ4CrbUNn0npOQaA4qMN7HcUzPPbP9lxn4mPIJU77wMliktOfxWFJI+xHc5GVeNWnF9igv5pXccw3tgLp97U7awHXoX2WoUnS/qIw5SZPiXOvqprx1pi/8p1MFeRyFkUiAk4JOsav3Lx3esGlmUFCPJFTU78pqjDHoLABuEl3TJ2cszZ4R6x/G6JBJJwXjLRYDPJXBYWXfnJ6R5od2i3rEdspRYiFZPzmJrnYBQVv866kW+iTD6rJpwMeYzmfZ83WlF1aIQEa2kmQ7UwuVfM84aWmMIeCcSUACYQ720En8DpYefxTo5woR3TGXq4yx+fSA30Ms/eQ/qHYlrUdu8Bmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLsF5cipXmOPH159HE3+R3zBX6NZcRW8OM36rU1AwNc=;
 b=a1TD6weNa7LLI3cWqYHSAquM3STdi1m1w0cGyjbZTzyfLbxtw9qQ7py1uP2gsMnhaCDwbF7Ik7K5v1l3vWm49UYRBM89K1CgfwT1ARwCf6jz9LoWgMsZVDpByqKhR3tBpRI3oxEKw47MdsKUJnUtuRplD1P8CReW77cvbJBJfCvcDES/fzphq7dfkxIyn9Qldn9IbXIUZTm4QhsEOR8Oq1VPTeLfdCqE0m7zi2dhGVZQMIrwcBx5hb8FnyWrRt9/iv+dsHbo9cIlPkIhj+a1TMQmeCLk8GKY9HysDSQscfyU4nCGunLatcCRFNYsbaCylbOG097OSgcC3uE14vIM2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLsF5cipXmOPH159HE3+R3zBX6NZcRW8OM36rU1AwNc=;
 b=dHINPRGpR8xTn8IAWTDXin4zRBWuJGNGNtFw+OT1t9Y2+y3sgrzWZGXclquNHD/ZbBYyCyHmbZ1B3rzrNqQzfdQpOvn5wqHwYp0+/NyrQhg+fJTvgLzc0Qa/IXFQYmn8g65HvUsXV4pUzbftoak6vh0cM6CaNAuV7pWgwOqXLnKh6VyIK8DfW3VnOlWBddp6w9OpDBAEgB3tPUwK2o6+O4HXTdyti+FJhPVvp7hTySUwVIWE3Q2iNVPqt+Yviu8i0Yu4v9z42ooABgeBzO02/pT5X6nhbshZVH6toq1XOoS0JMYBz9kwzCAZhvYYIeM+OBtD8H+YD4nqmVmbecFLiw==
Received: from CWLP265CA0294.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5d::18)
 by VI1PR07MB9826.eurprd07.prod.outlook.com (2603:10a6:800:1d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 09:29:42 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:401:5d:cafe::80) by CWLP265CA0294.outlook.office365.com
 (2603:10a6:401:5d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 09:29:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 09:29:41 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Apr 2026 11:29:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 122459569F;
	Thu,  9 Apr 2026 11:29:41 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id E9380700DBB5; Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH 7/9] libatomic-ops: upgrade 7.8.2 -> 7.8.4
Date: Thu, 9 Apr 2026 11:29:34 +0200
Message-ID: <20260409092936.1740143-8-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409092936.1740143-1-daniel.turull@ericsson.com>
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6C:EE_|VI1PR07MB9826:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ea8b31-6137-4e81-a91e-08de961a8755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	eSDep02u+7KtSiFuEt6avp7s9a3eMkXWdhYk8tCHrpiVk4gPlxhfIAPxzVk4lbv3U24MRf69nCaGtDLjWIx9cjLRiq1C6OfwDJXN79tLPEiHdY/YSNT9EkDMpIoVNG6AaYSwAKOowkpgXSGV58x0t4H8K9cg6AEXSPWNleK25RFxpDFgvSP2GsZQV8RI0nYQnBNqC62rewkLt7/DfAYkx3l9MRrnkE0GEqvzo6V2K7dMyyXP6P8+9WpBqpi5nq04Zp3sO8ZDJ9pFbtK/j7Ddkqi/DiUI/+6Up2byIMvFhfIZCxMazEx3uVDRbSz3X2AeB4O3otXTofi981E4pPe6Cl0El4N2nixxJs4RMH+rwL27OkG0rDrQ1vUH/eO9Iqp7rmIdJAJ9K2KVH6K0D/bVxMgqSSFoCyUbcwYIBaYnZyVn+Fd+rjKdZAL/paLhUkYhm7pRm8V3u4viyDkDi4xTUWycQKDewjpHvYLzGs8Zw+F6P5binv+CEuVdMjXM8+otjeP5TKbbI1L2H281tHX1pdKgLYUUjzrNUmbrH/PK2+f/6y50U+w8cgCdpKSdcPe0cYueE+SGmw+oX/W3IgNfnV0mja52HNjgccCyUsgMxwp7KRgPv8JSZWe5VpcWO5+C6k36MTK0Ca/+103MRyRnYgT37nyaAaKcrGTV+2IQVvSy2bWbuHuE3Wc46zErA8GrwgxvvyLEm2FelfQ8w3NO8cDBJmq82RuZExn86+UuCAUpbpCFvm/lZBgl5iE8I9iYGu/9oOO/Q8pJ6IJCvX32qg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iWZ8emCGUwK4552Lf+hhrxD1m/KYDlqun4qtcdHZ14EXD3XqC+LHJTEuFZI+ReHcnXx9YvtgJWDiGN+9qQlg8agPWLctheC8J+U80v7P6/mY0ZidqiBPgP/CHBLOv7pG0u+AJOYbkizT//BHIk+K9gOzcOvm9DfOZCzB2YQolf2cHY8B2W3w0+KMQREQc7/DSx6U9C4MlkrHFCU75uiJJUQDL6Vqrg3l2QaF1/fZ2mbOsB3p2b8jpAD04J8bMXvSDUuyACSezXU8yHMlTXhSeE1flKqgzVtBBLJp3nwCbe6eSHHFaHPotrg4duWyGCRuxn8IE9gxDSJyRkV1jxtWCnPT5eithvQfxc9kuw0g4rJxAofSHWhNcyaJe91GcHswgtTQHmcqXvQlDrap/ob2VNdGamAVhyIEUxQzO6No9GsiTUQNclrI4xEEpEdrK9+L
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:29:41.6449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ea8b31-6137-4e81-a91e-08de961a8755
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB9826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 09:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234902

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for libatomic-ops: 7.8.2 -> 7.8.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

=3D=3D [7.8.4] 2025-09-05 =3D=3D

* Document Win32-specific AO_NO_ASM_XADD macro in README
* Eliminate 'atomic_thread_fence is unsupported with tsan' gcc-11 warning
* Eliminate 'munmap argument 1 from incompatible pointer type' gcc warning
* Eliminate 'uninitialized memory use' gcc-13 warning in test_atomic
* Fix all broken URLs in comments
* Fix atomic_ops_sysdeps.S compilation for SunPro compiler in CMake script
* Update URLs after repository transfer to bdwgc organization
* Update CMake minimum required version to 3.10

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../{libatomic-ops_7.8.2.bb =3D> libatomic-ops_7.8.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.8.2.bb =3D> lib=
atomic-ops_7.8.4.bb} (89%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb b/me=
ta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
similarity index 89%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
index 6269133408..d0bb11eb5d 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz=
"
 GITHUB_BASE_URI =3D "https://github.com/bdwgc/libatomic_ops/releases"
=20
-SRC_URI[sha256sum] =3D "d305207fe207f2b3fb5cb4c019da12b44ce3fcbc593dfd5080=
d867b1a2419b51"
+SRC_URI[sha256sum] =3D "2356e002e80ef695875e971d6a4fd8c61ca5c6fa4fd1bf31cc=
e54a269c8bfcd5"
=20
 S =3D "${WORKDIR}/libatomic_ops-${PV}"
=20

