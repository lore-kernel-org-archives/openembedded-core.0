Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DA5CDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 13:42:44 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11811.1782394960146427546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 06:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=DOpog+Bn;
 spf=pass (domain: ericsson.com, ip: 52.101.70.51, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3NfSlhGn93Yflo8ifmmge6EEExTFJ/Fnk3LL6oq/mj9rNWSp0jBBNufaxs7vL/vq3HQGbigHVIzfALbz8dINEsqtGJDs11N/XY0SH9R17193eba2XXU1sgAuaSrFNewgF/D2EqO9/jK/BVW1BySbTmisMdjDv9RTgVFZdS815e/UwJd/ttJqBPXv/I5kBXm0oLd+ao3qDL0OuEd73mi9Kf1fSL22OyrBb1kpYSSlEu5V6TKwbB34E7tsdJ1kW5SmWtpCuOq8TJgotgRRvd8+EIimZvqIdV021IAjSC/OcHR+3dlVNfuRLTfIGn9Nvpkx0LWSkRM7JqFB3kzS8LbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdM3n1/K8I8qoDt4PrFuWEjfbR1KN3NuBO3FB+aYVO8=;
 b=To5JEHlc7Cl6PWtjZcn0FPo0RVCJbqE+19EYtAmZZCgQhykssY6YdqSJK1AlKD+lFncoB3lRky61LA9jxiTRq+ghddB1ikBt7kcYiSU5bYNFEv+fPWh6CqLy4vxfZ7nf1j8EV6CKRyXpngXEU40Ab/8EhoLQUgE9IxzMf990MRWuuCBLnWYKKjSBoLrv5rQQDYgkg14Kev8yRub9/vzZSfvjmApAAr4ebS3evNYKcLxJt/MEd9RCAbVwMQe92ynaiBas5RS952Q4tbbPUP9X6T3l1SfNRaOI7c30DpFdhW7lcy8aaJi8L5Rsouak/4aQytNoR1Cw+Alv3+HtdF1y/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdM3n1/K8I8qoDt4PrFuWEjfbR1KN3NuBO3FB+aYVO8=;
 b=DOpog+BnsRIQTtYbOgVTVd+FAv8jOd+nwyyUvy3ughhVRHGFYf388vB2cFiKQn/N/fNeVbB0c2SjXiKHGRoOC+1VDSdoerlPI0XrEoA5a6bELCnxCIWaZiA8RlbgDfvmrkpiWvNn1mpwBgPrNtxIwEMN/L6HpxB26fwdX2cQEZb9hslzaK3rvHypTv0Qn8pGrE9WCT+fb38yF0iHAe6tZAP9chj5i3YHXUjPMBeKGouoa4D5P+YP8ajZM4K3hFm3hXk6ThBJ3LTQvjpUhfB6muWLcT+c2qPn8QiUuV4DeKOsdPB78rsIpTJe4TfXDNXG2gQPKGyZkWyB6vfafryxoA==
Received: from DUZPR01CA0277.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::21) by AS8PR07MB7173.eurprd07.prod.outlook.com
 (2603:10a6:20b:257::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 13:42:34 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::1f) by DUZPR01CA0277.outlook.office365.com
 (2603:10a6:10:4b9::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 13:42:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 13:42:33 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 15:42:29 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 00ADF4020B42;
	Thu, 25 Jun 2026 15:42:27 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id BBFED700DBB0; Thu, 25 Jun 2026 15:42:27 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anders.heimer@est.tech>, <qi.chen@windriver.com>,
	<alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 1/3] dlopen-deps.inc: treat soname list as ordered alternatives
Date: Thu, 25 Jun 2026 15:41:30 +0200
Message-ID: <20260625134210.4046622-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625134210.4046622-1-daniel.turull@ericsson.com>
References: <20260625134210.4046622-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|AS8PR07MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c49ea2f-d87f-4f58-d96c-08ded2bf9c8d
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Lm6xn0BYFpQISEU+f2rgBnmz8N0OJzp4mNkzvZxMa7jdqgs0NWKZY8b99/qURR88VWI9zLKcGt7yTXjyjHxeBynvOPA+f6jwWpB/3qr515GRgqllioHvgCN2p+m9qXrXsawzH5l2NYL8KbehpqZ0kUbwbxBtFedRtdSuDkzBYFdflWSK64F5QOxQL4dUDUQW6ueFGJojUjKvmAfDYSeQFVXPtNdHcrlHYQU5wM4/PAtXarBylo+nalHAZNByExW1u/S4E8Ah6O4k0QY5PSUfTqm11OlOSgdfsAzuBlxB3LJckXEy6pAoyPt+F/oiRtTo4xsj1HBsF20kpWoF/V+X2HfCc1y8KGCcVhU/I+M7wHL6onZi7fNcBSY5AXJBYwEcTH9K9ePUbkhzaL99NUhWnWTt4DFVBU0Rh9YARyeTJFg0HSIAP77m2thyv3huFa+snq9dKtCu+bRtK8fnGwIcQ9FKR28stQmBnlHiKwx0E/02jrk5E/cjBBJpDJIpsGWkW/LTBNyJmIJ+MoxbgINqU2jON347+WDhVFUUBpZUVbkMo9wJYQlx4Lp3RH+8jIYXWcFrf6oyozcyfETi42KxeMfIPSekKVPl99eoPxtX/fPR9d8wjEeBo037t3qoCyewKSQqwNPjYdBTqyl/4pyle4260AaOQ4pCjMYyR3nCbstjleDnPVfaIUDfgHG2d3VJvdd4n8vt7Ctnhogx5c0pQA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BhI05rY6dd/SKOlAzBtlgFNO2C5PDm3e382mrwmzkt9Olzn8qHo39M8vKCnDzI85xdkWAs2ES/Hw/tk/x1O9zv7W7J92+5wKN5H5p953GGcHA/cIrJNl/h9CM9eWi1gTNwmB2/xX8uH996Z67kyb9BUI3S070H845VpCCyjfMylHhr/XXwfWAXF4dSx5eCRJqOGS5swOIhJwqVfc+87ZsCYu8d/R+bYDIPsybkQN3UdJ30ZNIALKM/g/SB9cJupYGFuA24CUWupgfNo17IctnsR/epBS0j79TwqsaAhICWn/jHdoDO5p9EAjS8ZyYsC+oSTFVyHS9nC1aYMuhSI5kQZEr091EJdQpCi1t5vqYyoasnajrnvMxbO5lJD5s0XuGkLeJdB/af24tD1OCOqFrOuZMTZP3oPjQBw4d/gDOeryHg+Us+PizECREu3gSXW2
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 13:42:33.9516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c49ea2f-d87f-4f58-d96c-08ded2bf9c8d
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 13:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239569

From: Daniel Turull <daniel.turull@ericsson.com>

The .note.dlopen format defines the soname array as a list of
alternatives (e.g. ["libcrypt.so.2", "libcrypt.so.1"]). The previous
code warned for every soname that was not found, even when an earlier
entry in the list already satisfied the dependency.

Select the first available provider and only warn when no alternative
can be resolved.

AI-Generated: Claude-opus-4.6
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-core/systemd/dlopen-deps.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-core/=
systemd/dlopen-deps.inc
index e0b333398c..82a2ccd389 100644
--- a/meta/recipes-core/systemd/dlopen-deps.inc
+++ b/meta/recipes-core/systemd/dlopen-deps.inc
@@ -66,15 +66,18 @@ python package_generate_dlopen_deps() {
                     elf =3D oe.qa.ELFFile(f)
                     elf.open()
                     for dep in parse(extract_segment(f, ".note.dlopen"), e=
lf.isLittleEndian()):
+                        # soname list contains alternatives; find the firs=
t available provider
+                        found =3D False
                         for soname in dep["soname"]:
                             if soname in shlibs:
-                                # TODO assumes the first match is good
                                 package, version =3D list(shlibs[soname].v=
alues())[0]
                                 dependency =3D dep_map[dep["priority"]]
                                 bb.note(f"{pkg}: adding {dependency} on {p=
ackage} via .note.dlopen")
                                 d.appendVar(f"{dependency}:{pkg}", f" {pac=
kage} (>=3D {version})")
-                            else:
-                                bb.warn(f"cannot find {soname}")
+                                found =3D True
+                                break
+                        if not found:
+                            bb.warn(f"cannot find any provider for dlopen =
dependency: {dep['soname']}")
                 except oe.qa.NotELFFileError as e:
                     bb.note(f"Cannot extract ELF notes: {e}")
                     pass

