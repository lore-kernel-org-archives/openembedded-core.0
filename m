Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA20C61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 19:07:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30064.1787684869382375265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 12:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=FkrGUnTL;
 spf=pass (domain: axis.com, ip: 40.107.159.56, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQR0W4aJt1fIPJr8vTWe7ocpsVSZMeADGFwYfeDUMtqvOVwVhzIPtN5YKoi5i+gxeuMX122DWrzLcbyNbt6eddJ+lnqqgB+RmJc6zf8nXY1YA7Fc3hPopV8hP9NJuCwP/+HiRPDfvBjGTuuRx0YPm/xOUW6HoMcWObE5zrr/ATEUMF1JBMdBmbeZd3xzYXC79XnWq/T4GIkdEfRV7H8jBrk4ZYGEdxLGkmAPY+bUm36E+m5npsQuy/mWFgha099Dmo6CMwMk3Lvk41EUull4aVNSyLTJ+Het0aoN/girBRsKICwFyBoCUDv38+kmIz7Q2DO19jNQzlbp+0QQ7NGcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXu5PN42ueWSEKukx6tZXo+0i4iTsKGdz4TOf6jh9Tk=;
 b=l+W7DodoT+h1kaiwQaBszjKlIsQkxmFW6tCF67LE1XnlSmsM2HEcrwCow81lix4lf+b3htRSm/dnbtSCTvjSrwtRVXWCn6qEdm0aoU/BwNkgV+NqQOVF8ZVSEsvDisDHrRxN/HucXHeSdYp+0xu4URmrNXqtr9gko1etF1HeTUJKmy8JRVUkPADD0+EdpJgDosCKxe2nBVxIF01B0sn7nIKX1eIcEdyn5VrUKm5CVhynCZ+hISX77wT1i7Nl2HEjTMbbFCiDR9O6d3g7z6ZVhAes12yS4wLSywv60ob16JbrVP+Ej+k74jQwJ57VxibrsXIAbFtSUrBV3V5OIjRVTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXu5PN42ueWSEKukx6tZXo+0i4iTsKGdz4TOf6jh9Tk=;
 b=FkrGUnTLslOt+biGlp6r9Nc+v+hloNmlg2wKCyZaMs+sgCJVtS3hBGxgf2ivxtOJjM1/sO7I1vgvwMhDvhT8bOSPSaaqbW/hF4yFFXqVfqrvwffmhTslda6XHdzZOj38t6vHhfFe8wn0lomC/8FbK2TwuOkXKt6sMGzsqpWV2io=
Received: from AS9PR05CA0302.eurprd05.prod.outlook.com (2603:10a6:20b:491::30)
 by DBBPR02MB10627.eurprd02.prod.outlook.com (2603:10a6:10:536::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 19:07:43 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:491:cafe::6f) by AS9PR05CA0302.outlook.office365.com
 (2603:10a6:20b:491::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 19:07:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 19:07:43 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 25 Aug
 2026 21:07:43 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 25 Aug 2026 21:07:43 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6A12543B1
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 21:07:43 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 66D8D12B48D; Tue, 25 Aug 2026 21:07:43 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] archiver.bbclass: Add ARCHIVER_MIRROR_INCLUDE
Date: Tue, 25 Aug 2026 21:07:40 +0200
Message-ID: <20260825190741.3011162-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825190741.3011162-1-pkj@axis.com>
References: <20260825190741.3011162-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A62:EE_|DBBPR02MB10627:EE_
X-MS-Office365-Filtering-Correlation-Id: 69963712-c741-4879-7679-08df02dc247c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	wtyQayrSXXfa39rZaoVTZ7K+FAdq3U5hu5pCf3iETOvV+9MtFMZVL6IY1J1Njt0MGTqARx30XtrzGFre+5GeVNzJgmB/66ZzKQ0Is0zPxGHbnHQdMZ5yQjMB3Cnb8ZRrq/eCM6MwsE1OQ5QNGb9VQFxmh3jqw+cc5Gr3dLfKJ9p+uVOywrBuXVbS1cYagl8cu6AqU6O7Wut+vNnt3kkCZyNSMSDH+25B7rXvVgaKUZe7JA5jtd74gwBqCr0ArV5yT5tTc3DJRWMWElmUd4T6o4TvWHcC4iOr3gqVfvo2p3FAFRnGtNNSphJIkktAo0iWOqf2lbgHkfwM8BTrgMuNlw+nmMQhy5xA0huhwl7oa8Q/clN8KDeFEqtxxfGvKHtykAtA1t59BxPuAzEKQd4bvAmjR4Ymx+SxycVgMKSUaxOix0961HPimrQWTj+HwyY8OGAyon32O5Qabg9Wnc0jAMgSNk70it6vvViVdugyfdKP6RwtYG6++Bok/+M72SgiHx/df2fTOV/Jk18yXewdUM90XYIZ7bjGYsOF8fKmQ1Qbo9hfacx9mtP0nOWOmdv8+ofl8PpxGcoM43prpGKxMZaXaKEasjYqCiHPLOetV68hdpTcbRxW62oXpCoOnluCRiEPofxRXTnt3u0Cl42z0MSAeh/2bNWWGwDJv8/hOg01zmHrfCXb1Vac6IqOn+2N2Ge5FaZhKYpPc27/g15HNw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4NiK332aaAm0rL+M3by0zMEXeEV0SCAmcmMLD96ZFipfeoEcMtqg96NYHBuTm08vnjpznTxmfbgTuQU/1nUFaEnqR3ELxjSuH3BrNg/QmLj2j8CF3XvPM1sOWAeaY+BhFDZ5jty2KMsNyxqw4CzqzTI2rQxChArhvVLAeDSnwNJv5WWczG254uIC8dCsUxvngvWIBlhkebmzL5+HwWmEGRkEpPovA7ILtw7UWUSRMDSNoYwZNXcV8+/1zrIkpCPBs6Yf55D4SbYNoVxktLNlcPpTnFrRvJSOdN0wGANV2LJCNTdtdY6V2lwPZ4b9RC20JE5ECFc8bKZcGsjWhICXcA8kILaxaGJhfmaHaxvQ4y6aqa4UoVfjRL0VnENLU0GZZREpQE1MqkbV7fvXc4yXtdOR72L6rKoKTpZzssylXY2Yxce0x29ogdNF2l5piiBe
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 19:07:43.7704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69963712-c741-4879-7679-08df02dc247c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10627
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 19:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244269

When using the archiver's mirror mode, ARCHIVER_MIRROR_INCLUDE contains
a list of URI prefixes to always include in the mirror. This may be
useful if recipes that are included in the mirror (due to their
licenses) depend on some recipe that otherwise would not be included in
the mirror, and that recipe uses files that are normally only available
on a private server.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/archiver.bbclass            | 35 ++++++++++++++++++++++--
 meta/lib/oeqa/selftest/cases/archiver.py | 24 ++++++++++++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index f38409774d..db8b60916a 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -33,6 +33,12 @@
 #    ARCHIVER_MODE[mirror] =3D "combined": All sources are placed into a s=
ingle
 #    directory suitable for direct use as a mirror. Duplicate sources are
 #    ignored.
+#  - Source mirror inclusions:
+#    ARCHIVER_MIRROR_INCLUDE is a list of URI prefixes to always include i=
n
+#    the mirror. This may be useful if recipes that are included in the mi=
rror
+#    (due to their licenses) depend on some recipe that otherwise would no=
t be
+#    included in the mirror, and that recipe uses files that are normally =
only
+#    available on a private server.
 #  - Source mirror exclusions:
 #    ARCHIVER_MIRROR_EXCLUDE is a list of prefixes to exclude from the mir=
ror.
 #    This may be used for sources which you are already publishing yoursel=
f
@@ -72,8 +78,9 @@ do_ar_original[dirs] =3D "${ARCHIVER_OUTDIR} ${ARCHIVER_W=
ORKDIR}"
 # This is a convenience for the shell script to use it
=20
 def include_package(d, pn):
-
-    included, reason =3D copyleft_should_include(d)
+    included, reason =3D archiver_should_include(d)
+    if not included:
+        included, reason =3D copyleft_should_include(d)
     if not included:
         bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
         return False
@@ -94,6 +101,29 @@ def include_package(d, pn):
=20
     return True
=20
+def archiver_should_include(d):
+    ar_src =3D d.getVarFlag('ARCHIVER_MODE', 'src')
+    if ar_src =3D=3D "mirror":
+        src_uri =3D (d.getVar('SRC_URI') or '').split()
+        if len(src_uri) =3D=3D 0:
+            return False, None
+
+        mirror_inclusions =3D (d.getVar('ARCHIVER_MIRROR_INCLUDE') or '').=
split()
+
+        def is_included(url):
+            for prefix in mirror_inclusions:
+                if url.startswith(prefix):
+                    return True
+            return False
+
+        fetcher =3D bb.fetch2.Fetch(src_uri, d)
+
+        for ud in fetcher.expanded_urldata():
+            if is_included(ud.url):
+                return True, "URL matches ARCHIVER_MIRROR_INCLUDE"
+
+    return False, None
+
 python () {
     pn =3D d.getVar('PN')
     assume_provided =3D (d.getVar("ASSUME_PROVIDED") or "").split()
@@ -154,6 +184,7 @@ python () {
 do_ar_prepare[vardeps] +=3D " \
     ARCHIVER_MODE \
     ARCHIVER_MIRROR_EXCLUDE \
+    ARCHIVER_MIRROR_INCLUDE \
     COPYLEFT_LICENSE_EXCLUDE \
     COPYLEFT_LICENSE_INCLUDE \
     COPYLEFT_PN_EXCLUDE \
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selft=
est/cases/archiver.py
index 8c5aa75e9b..78118db448 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -249,6 +249,30 @@ class Archiver(OESelftestTestCase):
         archive_path =3D os.path.join(glob_result[0], target_file_name)
         self.assertFalse(os.path.exists(archive_path), 'Failed to exclude =
archive file %s' % (target_file_name))
=20
+    def test_archiver_mode_mirror_include(self):
+        """
+        Test that `ARCHIVER_MIRROR_INCLUDE` causes a source URL to be incl=
uded
+        in the mirror even when the recipe would otherwise be excluded by =
the
+        copyleft license filter.
+        """
+
+        target =3D 'selftest-ed'
+        target_file_name =3D 'ed-1.21.1.tar.lz'
+
+        features =3D 'INHERIT +=3D "archiver"\n'
+        features +=3D 'ARCHIVER_MODE[src] =3D "mirror"\n'
+        features +=3D 'ARCHIVER_MODE[mirror] =3D "combined"\n'
+        features +=3D 'BB_GENERATE_MIRROR_TARBALLS =3D "1"\n'
+        features +=3D 'COPYLEFT_LICENSE_INCLUDE =3D "CLOSED"\n'
+        features +=3D 'ARCHIVER_MIRROR_INCLUDE =3D "${GNU_MIRROR}"\n'
+        self.write_config(features)
+
+        bitbake('-c deploy_archives %s' % (target))
+
+        bb_vars =3D get_bb_vars(['DEPLOY_DIR_SRC'])
+        target_path =3D os.path.join(bb_vars['DEPLOY_DIR_SRC'], 'mirror', =
target_file_name)
+        self.assertTrue(os.path.exists(target_path), 'Missing archive file=
 %s' % (target_file_name))
+
     def test_archiver_mode_mirror_combined(self):
         """
         Test that the archiver works with `ARCHIVER_MODE[src] =3D "mirror"=
`

