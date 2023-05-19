Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC861C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 06:24:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.70])
 by mx.groups.io with SMTP id smtpd.web11.19848.1684477490598250293
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 23:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=XPuGNusW;
 spf=pass (domain: siemens.com, ip: 40.107.21.70, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7SGziDYRIaUrU6oteP8UT+lQnJW/X0NrGxSH5w14rLTndBLxUFoaA9oiNVtsrX3odg4U8ukRDBqSML95f3RIkFoN/hbW1AsHodNHZtCOEKOnNNxGCKLjGeGHP9iCZdA7UexGQwMIxVXWQbvE2DzSL0pTV0rJgVzJJm02gUQIjEiPAVd0d7xPv7Tlm3u/B3BBRHaslU6HIlgl+li9admcnunzJraiZeeEJb1ntXPPEcj9mU/70+O9zRUXuGZ7CNQi1jN9Umb+R27bt4bmBnOe7Kz5l4wa/k/cbL3gbLNBXWyd9pyyVBaVns4K/Sz8BgwXk7EWxRU4FOzS+ENbxg3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3fXT5cf6/nUMG/AmdoPe5mG9DCzCezgA5t3vJ1MOWk=;
 b=VyhAIip9D2EUzc4V7cqQ9rJTGBHwxVMfwygdpRy8UgImyiVy0MmqL0q2XMPF+VqepSVOXTYAiry9PYELeH4yOaNhDjdnRxC91D56CeIAqlHF3TVClB8Wd6QjtaBGRc9GmRUcrz6RR73lAVutN74ZmvJo8iE1QSVf3UzbVK3B6WES2f+68L/9h87bwX8wxu9cX9MBTFKSNtPqN39YMmfRisNHc0bP24qtLwKkZ9rqNF/4CHIAkZIgu5EucBIBTuC2/yM02S9ASxC9nqkiXQporlIWLVdtVdk+LSAw+TDUFaJ4H5vHZyXBGEjq3fYy/qcymDgh0Bzb9QrXkSTQ5phxsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3fXT5cf6/nUMG/AmdoPe5mG9DCzCezgA5t3vJ1MOWk=;
 b=XPuGNusWeQpghEjuYLQx4FoSNQh6leSSQkoJphbsIGjTewuVDKDNbOE6Glo/28VwCAvdvgz5WzJwG/Rka7BygQgmxkKNATsYep7NrGoz8i/UolHKDHupjT6xWWjLptUhRMspL7ovvw0/a2+w4O4kjOLYvculBbRSi/hWliLyFwyttCSxO6e7JaeBZ3Pf/EPKHNZoNmV3VJIa9ejWjAoHzc2MBaDWMZV+xHZyXhjCSNCd7DaTWiClXzbaq+JI4y46GdjFxtOxFfC5YsqyPydXvP8r2kVEG6it1UYhYiD+MtejpG2mdknf19qwAhjMkFh73IjJ2ndeKNJYd+PSx809Rg==
Received: from DBBPR09CA0037.eurprd09.prod.outlook.com (2603:10a6:10:d4::25)
 by PAXPR10MB5230.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:283::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Fri, 19 May
 2023 06:24:46 +0000
Received: from DB5EUR01FT019.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::65) by DBBPR09CA0037.outlook.office365.com
 (2603:10a6:10:d4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 06:24:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 DB5EUR01FT019.mail.protection.outlook.com (10.152.4.249) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17 via Frontend Transport; Fri, 19 May 2023 06:24:46 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 19 May 2023 08:24:45 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.107.140) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 19 May 2023 08:24:45 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mikko.rapeli@linaro.org>, Andrej Valek <andrej.valek@siemens.com>, "Peter
 Marko" <peter.marko@siemens.com>
Subject: [OE-core][PATCH v3 1/3] cve-check: add option to add additional patched CVEs
Date: Fri, 19 May 2023 08:24:18 +0200
Message-ID: <20230519062420.37015-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505111814.491483-1-andrej.valek@siemens.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.107.140]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT019:EE_|PAXPR10MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: 406e1745-c019-4b68-86dc-08db5831bdc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V5pcid2s/hbBU8atYZVhi11qHwPi2SSSM9KDs8mgXV77OahgnA7bqWAuDsOUqTdo9E8KhB3tnT5CZy/zw6Rfu/r+VNu7vaxZ16SAziJdPLbcZJOyvOqOCRKC0qzemw+kKiExdS/j06+SqHi+rzhgSIRjVFgsIWZXcQl+ISUktgbAp9f4mByF1BAAvWsfACmGI/u2yXfT+mmjejPdCaLNYwb7QM9/sr8NJgJGjDk/jM2ztqviamXIffwYZeS5/yeroupfVdcpSompyCcb36KdIYjtOEYRXBB8o20PEvnLrWo5NeDa1OlzYm2DJMzFHkWVwB9VO+o3rQBk9DHT4INltcdlDEeecYGNlpACsMtiFkIXo0WT5m4AeRjbRyoO9CZIG8I8zgCuCn4CG/4U705Pd2pjyWD5yPt3ldl2p8bgRoG+FWnbV9SC8d31XZEMacmYOk8/xcRNrQD0XRJqFKfXk9a9vJoFJNksZjqm6gmOMPdj0pO3AtC7JDal+aW86a1pSYhYcX/5JLSvQuK9K+f+z7Aw4risyFMG75YXAOWS3ns+A2+TX/t/xFEhtRET2fv8nuWxn8Y7FJmEephSHCeCjOQ/CUa1FY9MbbwX3kXX+QiEFsFH/cp2IjeCXB2xXAdSRwIQihg3HBVcK5yuKk0DfabNeBvy5jTMhh70Rl3hTxe4M2cFgWn47+MxqpI3uhzPtjSjyw/zSoZHlQO+eYCNunYI+YA4XFQIZp/MDRfl9s0=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(83380400001)(36860700001)(44832011)(186003)(336012)(47076005)(16526019)(956004)(2616005)(54906003)(478600001)(6666004)(1076003)(26005)(107886003)(8936002)(30864003)(5660300002)(36756003)(82960400001)(40460700003)(82740400003)(7636003)(6916009)(40480700001)(356005)(41300700001)(82310400005)(70206006)(70586007)(8676002)(4326008)(2906002)(316002)(7596003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 06:24:46.2978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 406e1745-c019-4b68-86dc-08db5831bdc6
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT019.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5230
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 06:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181531

- Replace CVE_CHECK_IGNORE with CVE_STATUS + [CVE_STATUS_REASONING] to be
more flexible. CVE_STATUS should contain flag for each CVE with accepted
values "Ignored", "Not applicable" or "Patched". It allows to add
a status for each CVEs.
- Optional CVE_STATUS_REASONING flag variable may contain a reason
why the CVE status was used. It will be added in csv/json report like
a new "reason" entry.
- Settings the same status and reason for multiple CVEs is possible
via CVE_STATUS_GROUPS variable.
- All listed CVEs in CVE_CHECK_IGNORE are copied to CVE_STATUS with
value "Ignored" like a fallback.

Examples of usage:
CVE_STATUS[CVE-1234-0001] =3D "Ignored" # or "Not applicable" or "Patched"
CVE_STATUS[CVE-1234-0002] =3D "Not applicable"
CVE_STATUS_REASONING[CVE-1234-0002] =3D "Issue only applies on Windows"

CVE_STATUS_GROUPS =3D "CVE_STATUS_WIN CVE_STATUS_PATCHED"
CVE_STATUS_WIN =3D "CVE-1234-0001 CVE-1234-0002"
CVE_STATUS_WIN[status] =3D "Not applicable"
CVE_STATUS_WIN[reason] =3D "Issue only applies on Windows"

CVE_STATUS_PATCHED =3D "CVE-1234-0003 CVE-1234-0004"
CVE_STATUS_PATCHED[status] =3D "Patched"
CVE_STATUS_PATCHED[reason] =3D "Fixed externally"

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 documentation/dev-manual/new-recipe.rst      |  4 +-
 documentation/dev-manual/vulnerabilities.rst | 11 ++---
 documentation/ref-manual/classes.rst         |  9 ++--
 documentation/ref-manual/variables.rst       | 33 ++++++++++++---
 meta/classes/cve-check.bbclass               | 44 +++++++++++++++++---
 meta/lib/oe/cve_check.py                     |  6 +++
 6 files changed, 87 insertions(+), 20 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-ma=
nual/new-recipe.rst
index 4e74246a4e9..008f4b1ceb7 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1253,8 +1253,8 @@ In the following example, ``lz4`` is a makefile-based=
 package::
=20
    S =3D "${WORKDIR}/git"
=20
-   # Fixed in r118, which is larger than the current version.
-   CVE_CHECK_IGNORE +=3D "CVE-2014-4715"
+   CVE_STATUS[CVE-2014-4715] =3D "Patched"
+   CVE_STATUS_REASONING[CVE-2014-4715] =3D "Fixed in r118, which is larger=
 than the current version"
=20
    EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' =
DESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=
=3Dno"
=20
diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/d=
ev-manual/vulnerabilities.rst
index 0ee3ec52c5c..ca1ea87ba7e 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -158,7 +158,8 @@ CVE checker will then capture this information and chan=
ge the CVE status to ``Pa
 in the generated reports.
=20
 If analysis shows that the CVE issue does not impact the recipe due to con=
figuration, platform,
-version or other reasons, the CVE can be marked as ``Ignored`` using the :=
term:`CVE_CHECK_IGNORE` variable.
+version or other reasons, the CVE can be marked as ``Ignored`` or ``Not ap=
plicable`` using
+the :term:`CVE_STATUS[]` variable flag.
 As mentioned previously, if data in the CVE database is wrong, it is recom=
mend to fix those
 issues in the CVE database directly.
=20
@@ -182,11 +183,11 @@ products defined in :term:`CVE_PRODUCT`. Then, for ea=
ch found CVE:
 -  If the package name (:term:`PN`) is part of
    :term:`CVE_CHECK_SKIP_RECIPE`, it is considered as ``Patched``.
=20
--  If the CVE ID is part of :term:`CVE_CHECK_IGNORE`, it is
-   set as ``Ignored``.
+-  If the CVE ID has status :term:`CVE_STATUS[<CVE ID>] =3D "Ignored"`, it=
 is
+   set as ``Ignored`` as same as for :term:`CVE_STATUS[<CVE ID>] =3D "Not =
applicable"`.
=20
--  If the CVE ID is part of the patched CVE for the recipe, it is
-   already considered as ``Patched``.
+-  If the CVE ID is part of the patched CVE for the recipe or has status
+   :term:`CVE_STATUS[<CVE ID>] =3D "Patched"`, it is considered as ``Patch=
ed``.
=20
 -  Otherwise, the code checks whether the recipe version (:term:`PV`)
    is within the range of versions impacted by the CVE. If so, the CVE
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index ab1628401e9..2811244b8f7 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -517,10 +517,13 @@ The ``Patched`` state of a CVE issue is detected from=
 patch files with the forma
 ``CVE-ID.patch``, e.g. ``CVE-2019-20633.patch``, in the :term:`SRC_URI` an=
d using
 CVE metadata of format ``CVE: CVE-ID`` in the commit message of the patch =
file.
=20
-If the recipe lists the ``CVE-ID`` in :term:`CVE_CHECK_IGNORE` variable, t=
hen the CVE state is reported
-as ``Ignored``. Multiple CVEs can be listed separated by spaces. Example::
+If the recipe adds the ``CVE-ID`` as flag of :term:`CVE_STATUS` variable w=
ith status
+``Ignored`` or ``Not applicable``, then the CVE state is reported as ``Ign=
ored``.
=20
-   CVE_CHECK_IGNORE +=3D "CVE-2020-29509 CVE-2020-29511"
+   CVE_STATUS[CVE-2020-15523] =3D "Ignored"
+
+Possible CVE's statuses are ``Ignored``, ``Not applicable`` and ``Patched`=
`.
+Check :ref:`ref-variables-CVE_STATUS` for more details.
=20
 If CVE check reports that a recipe contains false positives or false negat=
ives, these may be
 fixed in recipes by adjusting the CVE product name using :term:`CVE_PRODUC=
T` and :term:`CVE_VERSION` variables.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 6ee65e17884..cd5f1d65d27 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1653,11 +1653,7 @@ system and gives an overview of their function and c=
ontents.
          and kernel module recipes).
=20
    :term:`CVE_CHECK_IGNORE`
-      The list of CVE IDs which are ignored. Here is
-      an example from the :oe_layerindex:`Python3 recipe</layerindex/recip=
e/23823>`::
-
-         # This is windows only issue.
-         CVE_CHECK_IGNORE +=3D "CVE-2020-15523"
+      Is deprecated and should be replaced by :term:`CVE_STATUS`
=20
    :term:`CVE_CHECK_SHOW_WARNINGS`
       Specifies whether or not the :ref:`ref-classes-cve-check`
@@ -1698,6 +1694,33 @@ system and gives an overview of their function and c=
ontents.
=20
          CVE_PRODUCT =3D "vendor:package"
=20
+   :term:`CVE_STATUS`
+      The CVE ID which is patched or should be ignored. Here is
+      an example from the :oe_layerindex:`Python3 recipe</layerindex/recip=
e/23823>`::
+
+         CVE_STATUS[CVE-2020-15523] =3D "Ignored"
+
+      Possible CVE's statuses ``Ignored``, ``Not applicable`` or ``Patched=
``, while the ``reasoning``
+      is optional.
+
+   :term:`CVE_STATUS_GROUPS`
+      If there is a many CVEs with the same status and reason can by simpl=
ified by using this
+      variable instead of many similar lines with ``CVE_STATUS`` and ``CVE=
_STATUS_REASONING``
+
+         CVE_STATUS_GROUPS =3D "CVE_STATUS_WIN CVE_STATUS_PATCHED"
+         CVE_STATUS_WIN =3D "CVE-1234-0001 CVE-1234-0002"
+         CVE_STATUS_WIN[status] =3D "Not applicable"
+         CVE_STATUS_WIN[reason] =3D "Issue only applies on Windows"
+
+         CVE_STATUS_PATCHED =3D "CVE-1234-0003 CVE-1234-0004"
+         CVE_STATUS_PATCHED[status] =3D "Patched"
+         CVE_STATUS_PATCHED[reason] =3D "Fixed externally"
+
+   :term:`CVE_STATUS_REASONING`
+      Optional explanation for :term:`CVE_STATUS`
+
+         CVE_STATUS_REASONING[CVE-2020-15523] =3D "Issue only applies on W=
indows"
+
    :term:`CVE_VERSION`
       In a recipe, defines the version used to match the recipe version
       against the version in the `NIST CVE database <https://nvd.nist.gov/=
>`__
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index bd9e7e7445c..44462de7445 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -70,12 +70,15 @@ CVE_CHECK_COVERAGE ??=3D "1"
 # Skip CVE Check for packages (PN)
 CVE_CHECK_SKIP_RECIPE ?=3D ""
=20
-# Ingore the check for a given list of CVEs. If a CVE is found,
-# then it is considered patched. The value is a string containing
-# space separated CVE values:
+# Replace NVD DB check status for a given CVE. Each of CVE has to be menti=
oned
+# separately with optional reason for this status.
 #
-# CVE_CHECK_IGNORE =3D 'CVE-2014-2524 CVE-2018-1234'
+# CVE_STATUS[CVE-1234-0001] =3D "Ignored" # or "Not applicable" or "Patche=
d"
+# CVE_STATUS[CVE-1234-0002] =3D "Not applicable"
+# CVE_STATUS_REASONING[CVE-1234-0002] =3D "Issue only applies on Windows"
 #
+# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
+# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
 CVE_CHECK_IGNORE ?=3D ""
=20
 # Layers to be excluded
@@ -88,6 +91,25 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
 # set to "alphabetical" for version using single alphabetical character as=
 increment release
 CVE_VERSION_SUFFIX ??=3D ""
=20
+python () {
+    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
+    cve_check_ignore =3D d.getVar("CVE_CHECK_IGNORE")
+    if cve_check_ignore:
+        bb.warn("CVE_CHECK_IGNORE has been deprecated, use CVE_STATUS inst=
ead")
+        set_cves_statuses(d, d.getVar("CVE_CHECK_IGNORE"), "Ignored")
+
+    # Process CVE_STATUS_GROUPS to set multiple statuses and optional reas=
ons at once
+    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split():
+        set_cves_statuses(d, d.getVar(cve_status_group) or "",
+                          d.getVarFlag(cve_status_group, "status"),
+                          d.getVarFlag(cve_status_group, "reason"))
+}
+
+def set_cves_statuses(d, cves, status, reason=3D""):
+    for cve in cves.split():
+        d.setVarFlag("CVE_STATUS", cve, status)
+        d.setVarFlag("CVE_STATUS_REASONING", cve, reason)
+
 def generate_json_report(d, out_path, link_path):
     if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
         import json
@@ -282,7 +304,13 @@ def check_cves(d, patched_cves):
         bb.note("Recipe has been skipped by cve-check")
         return ([], [], [], [])
=20
-    cve_ignore =3D d.getVar("CVE_CHECK_IGNORE").split()
+    # Convert CVE_STATUS into ignored CVEs and check validity
+    cve_ignore =3D []
+    for cve, status in (d.getVarFlags("CVE_STATUS") or {}).items():
+        if status in ["Not applicable", "Ignored"]:
+            cve_ignore.append(cve)
+        elif status not in ["Patched"]:
+            bb.error("Unsupported status %s in CVE_STATUS[%s]" % (status, =
cve))
=20
     import sqlite3
     db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
@@ -455,6 +483,9 @@ def cve_write_data_text(d, patched, unpatched, ignored,=
 cve_data):
         else:
             unpatched_cves.append(cve)
             write_string +=3D "CVE STATUS: Unpatched\n"
+        reasoning =3D d.getVarFlag("CVE_STATUS_REASONING", cve)
+        if reasoning:
+            write_string +=3D "CVE REASON: %s\n" % reasoning
         write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev2"]
         write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev3"]
@@ -576,6 +607,9 @@ def cve_write_data_json(d, patched, unpatched, ignored,=
 cve_data, cve_status):
             "status" : status,
             "link": issue_link
         }
+        reasoning =3D d.getVarFlag("CVE_STATUS_REASONING", cve)
+        if reasoning:
+            cve_item["reason"] =3D reasoning
         cve_list.append(cve_item)
=20
     package_data["issue"] =3D cve_list
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index dbaa0b373a3..f47dd9920ef 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -130,6 +130,12 @@ def get_patched_cves(d):
         if not fname_match and not text_match:
             bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
=20
+    # Search for additional patched CVEs
+    for cve, status in (d.getVarFlags("CVE_STATUS") or {}).items():
+        if status =3D=3D "Patched":
+            bb.debug(2, "CVE %s is additionally patched" % cve)
+            patched_cves.add(cve)
+
     return patched_cves
=20
=20
--=20
2.40.1


