Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80353C021BD
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.137])
 by mx.groups.io with SMTP id smtpd.web11.1143.1739286064813401053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=DTTB8FbC;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.137, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDTi3KewfLUpAxxUizsi7BQYmZVOvMvcTgeuGy35PJPh48Zzomeg7BYXn0BXq8NEcyrwWxZ8pdrB141LdmPGCZsFcz3HCtip/DmqAHiD77YrfBEtZn61nshZYE2ZFb8X6knmYZlmBGdl5bIX7E3c5jCBha/OTAwkCC2KzKVermjXL3GSfMv5ZLKRjcESVBh5dOW6iFspKEE+u1Z5Cs0+VWGIsVRSu0941H3Fz+lt4TuO15ThE6Ao86vX6oqSCaHOVInViNhhusAbLU4+9VxlnDZ8WI9k+Ve9xTVwM7iASpVVTN+lwXxNL6ZMOgCCYoAbqQxqa5kefUlobFgmKR6Jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gxi3G7sEktc5G6E6X4ZTOicCzTpi14bEYV5mfinI4Co=;
 b=VNq91e3y0JgJxWK4fvm23Z4Q87MCP8s/kZv+Hdo7eXyEnq1nj8gtqZFSzH7ApJYgFcNwO9DXdJqMKW1A38XiUlf8l9lze3tURcksEVOs7+n2LeL4W7xeZOCTLEjM7PWnrjuOxXJ0N6LU74AvUqXU+q1OEEOBu/WYD/PCeoCTm6OC902tYRDv23SET+JhVoyLgQePo7do8zm9KEG+B4k3jWASfUSqmsfLBL1gJa2q+picm3+hNNypERBRFop3nq9ybbdoRi0L2398QUXPMyYd9Qm/NVrp8QJ8ebPwygDUzcFJopVsv+Beqe+LlLvE4XLQYr3iyZ2ySaLwIykJizwGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gxi3G7sEktc5G6E6X4ZTOicCzTpi14bEYV5mfinI4Co=;
 b=DTTB8FbCTk2xcFiT8t8HMvzL35JqC6djRWfMnXIMCBHZc8GAQlP6coRwVQk28EuDwZBWEn0lKW5WvGLZGOoEh5wGUns/iSv++xFIpVTf1C+ztkF1caIRxjeJsWF8dUhP7YlpFH8EoGRYJCkWXnZE9gIos45G754HWzqyKlsNcVXx3DbI7X9PHGFeP54mDIwsJTulg0BOJp9PtkMLkvwcU12pAfSf7AMW78AdaY7Rb3vcpMpekntQzfrQKLuj7Ouok+4meb1fslTPmE2cBXqFbUbJd/mb+BcPwVC3Hcb5H63IZiySDNCwsYoxHWBwHJfT72M0MVjqC9JXp4xlqza8rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 15:01:01 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:01:01 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 18/30] classes: add vendor class for go
Date: Tue, 11 Feb 2025 16:00:22 +0100
Message-ID: <20250211150034.18696-18-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AM7PR08MB5399:EE_
X-MS-Office365-Filtering-Correlation-Id: 428ca8ea-5e9f-41be-0e15-08dd4aace234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?06qvnxWBg7/MvmnSxCwFEv5aRFT/T/Ckb4KamCQXp/5mYPo1HPYC+c8NG60R?=
 =?us-ascii?Q?hKJcHddyLNbjmrUtC0ATS4hrZVIFRFCWyfwGqrwcKJ4jfKi3qSeK8fPPaopO?=
 =?us-ascii?Q?N34ood4CLUoh7jLRoaAikOZKd7++ktltOt9Iz9Dlo6q0pQPVn83QOtSbNqnf?=
 =?us-ascii?Q?UDMCNFW0IyLEhuJQ1YYV/sF1Q+el9oHXsJUzZxTddVdJ8eSJNxESPR1ubRY+?=
 =?us-ascii?Q?eWgCxoVIXcR27maZ/iKoODaVB6tjZquaBwPcupFnHVqdMumaFUSCFst94y0/?=
 =?us-ascii?Q?ac2nhLGQWmVGYLGCS3vDAgxHk3zmmT6xGk3M/zF1dt5XaYX5CDW9MMcfNr6n?=
 =?us-ascii?Q?Ml2jZ+4aOClYpLWhGA5XcVmoIWyXptypLP2IDhiG7QN8NVNJV/kQsHd4B0Yd?=
 =?us-ascii?Q?T956oyhJibLRWrW536uloWX2FEhijIvyl5r82JIb5pty4/twBoGlcFRUlqKH?=
 =?us-ascii?Q?9jOFBAQwfyE5AmZGKOw6zJPXsLweb4GmMQv0sMx7pgTGqjTs/tqwwwpE04lG?=
 =?us-ascii?Q?1VA9ioFFr1L108eV7oj/enS/8xVdRyFWTueEPgN2ux9jsu/B30m3tlfoZaOA?=
 =?us-ascii?Q?/aSQuZqxe1rkQ3hOCMF+DsvzcEfV9xtVqpxKJ4KdHNSqEKSy/fwIM6uuagmm?=
 =?us-ascii?Q?oRFgg386IAnsMAtWJDXt9AcmHBkGC8svfw5cQ3UGKJmp+yLuVyA8Ph/66FWk?=
 =?us-ascii?Q?VrU1JjebEByHlppyBDPzDZxDk7da9Pn/WeeM5xYjP04TL+LCFuN1o2wVzCgC?=
 =?us-ascii?Q?KipNiKDSYnXonmkmshwmL9bX7osaZiHfKPQUnJS7EFRbiH/icXKNw/5gU/VC?=
 =?us-ascii?Q?d3klr1oUGSbMuDUFIE8RFL+CcXbQAnc+cO6EO8Go19UueL9j7tCaidvDjdvL?=
 =?us-ascii?Q?pYvAuF5+3o5hOaPn1fbsGapOIkEfaUmH+pcwi8uQjUVuL1plv5YPRGurS87n?=
 =?us-ascii?Q?FW1CN8Z2mvsnZGEzBqStCr2SMbCy6THOZcXqRcHZuBNSUbiwnRL0VaoBnyjB?=
 =?us-ascii?Q?lJeklmhY0yWqob4mywNjceUFR+yfNJJA9VlMDRDLHKq+2ZoGzONoZZDEb3Nb?=
 =?us-ascii?Q?QppZa4d7M8Td3APXmqc/9Q2pT9LmIuiiOpZdZW5/n1ADtGuBSF4zf4ynRm36?=
 =?us-ascii?Q?UECLCuf5pRXoNC6OFnPwVYHV1BMupPR1Cm0b42tF3QTQ6b1gtOVEf/fcoR3/?=
 =?us-ascii?Q?scId9IMlc+wNFIM5gDu6ehkasbt47jkHP30Crm9w0yCnRT5EyqpPKPYESyou?=
 =?us-ascii?Q?YSgHabjcgEdDwCEngTPLV317wNNF4hOeD56yERsQ0OMh9JuT5oXlq7mVYdaD?=
 =?us-ascii?Q?q6d5RXA+bwC/jK5LHzubUpo46wQP297jur17ocV3ze1Gyfzb9Ys3LENitVso?=
 =?us-ascii?Q?FHb818hdjM/Nmh5YWS3Z5iimgt8j?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?99QXNi/kwP0QtxPSHvsKEJJGPyWSqhcVSEjvFwX/a4h3Nahm9pQ+ZUUV8vcn?=
 =?us-ascii?Q?W+xdh02qiWzhezI3Mx12wu5XpOneWHIruDH3Poi1OVNmfdasUyYSw1UUtES9?=
 =?us-ascii?Q?80k3GefQJZJBaLzBmRec/4wPUE64CGSviIK74d3pWRQzu/1it3pmMdgmaJlL?=
 =?us-ascii?Q?Fo5pkT95j9XnykL/p/0xiE7OwCz8aO04sTbzahJxAglxy7lUrpvnwVJDwGyv?=
 =?us-ascii?Q?DLfnYl4WdQ+MNVjspXw+txDf0gr2IbNV+XHgBj72EGEi2ixim/uE6VAjRcRb?=
 =?us-ascii?Q?SAqaRS0ayD5c7NndSIpk1cpRNoxft5QrFZfl03hETBLWoNduBLbmjNip30du?=
 =?us-ascii?Q?mrhv/Fm3qbGcbgJ9QfE/9wYQNVE5exNuySZ4euFcPDorMDXZgdmj+gAw/FQo?=
 =?us-ascii?Q?QYz1GcCTtmMhfhBwoWCkW4MhcBn4gOzdUJnSdzmI8FLME6ueN74+H7MHEd4m?=
 =?us-ascii?Q?aqplNQV+LF49Hbj79GPOuYnboXgtYqsx65KXekd+Phi3VgigPZH4LlmuyIZm?=
 =?us-ascii?Q?UbZ0y0TwvDXlceHbeeF85GwaUMhP7VYvqy4aN2LnlDHsyQWfnN2hDrgW8AAz?=
 =?us-ascii?Q?no+rZWfVzEmvmtAbEjP2VmZTE5QDAup7ngxgZDBuh8ABDca2UWZftproOFi8?=
 =?us-ascii?Q?x0vGDtL6otkTfiAgJE1g3Ry27fv5mkKmkwqTKj5in8F5S6IOHDXVHSjdoJh5?=
 =?us-ascii?Q?NHvO38fTz6ZVpa1uEH6gi6+tzxv8mRPRBxzOipV5w6Zsy03+1pzKuFRZa5dT?=
 =?us-ascii?Q?UENzHGZqUPWePCaDlzvzL5rC7E6VGXFG2Jpzkb861on/YTlAh3MHUdVYihr1?=
 =?us-ascii?Q?Je6H82+nI+MYuvFlx2lxAYnNWi17onBwl13Y7i6MnEiziFQR3GPZABoV8L7T?=
 =?us-ascii?Q?L0j9DL+c6+QPVSWbzcZO8DbPRZbkBs7FSyID2a+d9aVbYPGYHPPh5pbreVCV?=
 =?us-ascii?Q?h1YsSdFLr9xAN/w3D730vehVfOPd6su/4iyW/n/MPSJo3wcjk1+7BjyAvn03?=
 =?us-ascii?Q?z3krcsZuLSe9g5AW5t6rC1HOmVKwi6YWDFLjbWkqbg8+q12/tHXEF2FbRIIo?=
 =?us-ascii?Q?5qDHSA55D2qUAeQtAYxZbpewmO+F1yvNpCxs5Q94vaLtn9OhW4UFwi2MHIsV?=
 =?us-ascii?Q?J26Ho8Syn4WZP2SwyOgQeoFwSgx/dH1MMDw+2xAzxgcU1F3fYChjGe1NmjzM?=
 =?us-ascii?Q?ui/zb02pgGlJRf8gEWzYYmzGNYGmABQl1ZGgPeblfPw75mW+VkGwEplMJrQf?=
 =?us-ascii?Q?hCvvl99FsALvstn3nQB0cKiLA37b8qwDak2wrPiz7pzkqcTNwm0h1uQaPY0Z?=
 =?us-ascii?Q?JiFGv32hLEJ26NfT21UtRaw6Pd7sOK/mi7xinynGvtbmqXCGMF3eW+kJH8GP?=
 =?us-ascii?Q?rM2kdbhBgIQ7jw+rQT/aSAiP+igAFfCuUhR6eQD5UvBTHUWEKYLb+3Sj1w6a?=
 =?us-ascii?Q?DFdJgeC+7o2hg63MKr5/2HbacBQ+wL6ZfJoS5T7SKgRhPUfd4687iEdg8GXi?=
 =?us-ascii?Q?oP1J9ppfWxtHMlfMxztKhubrrz4+8R/qU+bXWW8XDi2q8PR9ocm/lelvADl5?=
 =?us-ascii?Q?/Gz/iqWcjvSjceeW/5gaID508HQkoiHAxHDeyW8/RYzpSgL8ReYI0R6luT3E?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428ca8ea-5e9f-41be-0e15-08dd4aace234
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:54.7687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zy5606IH8bIeozSxdRMbXKskDFhk9mkGtPwpG7gDD8npoiqUFlaKti1GjVmZq8DYqiT5M+6wDfmxHfCU30l8+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211143

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a vendor class for go to resolve the dependency SRC_URIs from a
go.sum file and run populate the go mod vendor folder.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes-recipe/vendor_go.bbclass | 59 +++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 meta/classes-recipe/vendor_go.bbclass

diff --git a/meta/classes-recipe/vendor_go.bbclass b/meta/classes-recipe/ve=
ndor_go.bbclass
new file mode 100644
index 0000000000..dc5f8d1d8d
--- /dev/null
+++ b/meta/classes-recipe/vendor_go.bbclass
@@ -0,0 +1,59 @@
+# Copyright (C) 2025 Weidmueller Interface GmbH & Co. KG
+# Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+# The directory of the go.mod file relative to the root directory, per def=
ault
+# assume there's a file directly in the root directory
+GO_SRC_DIR ?=3D ""
+
+# The path to the go.mod file
+GO_MANIFEST_DIR ?=3D "${GO_SRC_PATH}/go.mod"
+
+# The path to go.sum file
+GO_LOCK_DIR ?=3D "${@os.path.join(os.path.dirname(d.getVar('GO_MANIFEST_DI=
R')), 'go.sum')}"
+
+# The URL of the go proxy
+GO_PROXY ?=3D "https://proxy.golang.org"
+
+GO_SRC_PATH =3D "${S}/${GO_SRC_DIR}"
+GO_SRC_SUBDIR =3D "${@os.path.relpath(d.getVar('CARGO_SRC_PATH'), d.getVar=
('WORKDIR'))}"
+GO_SRC_URI_FILE =3D "${VENDOR_DIR}/go-source-uris.txt"
+SRC_URI_FILES:append =3D " ${GO_SRC_URI_FILE}"
+
+inherit go-mod vendor
+
+GO_INSTALL_PREFIX =3D "."
+GO_SRC_PATH =3D "${S}"
+GO_SRCURI_DESTSUFFIX =3D ""
+
+GOMODCACHE =3D "invalid"
+GO_MOD_CACHE_DIR =3D "go/pkg/mod"
+GO_WORKPATH =3D "${GO_SRC_PATH}"
+GO_MOD_RECRDEPTASK =3D ""
+
+GOBUILDFLAGS:append =3D " -mod=3Dvendor"
+
+python vendor_go_do_vendor_resolve() {
+    import oe.vendor
+    import oe.vendor.go
+
+    lock_file_dir =3D d.getVar("GO_LOCK_DIR")
+    lock_file_subdir =3D get_early_source_dir(d, lock_file_dir)
+    proxy =3D d.getVar("GO_PROXY")
+    cache_subdir =3D d.getVar("GO_MOD_CACHE_DIR")
+    src_uris =3D oe.vendor.go.resolve_src_uris(lock_file_subdir, proxy, ca=
che_subdir)
+    with open(d.getVar("GO_SRC_URI_FILE"), "w") as f:
+        oe.vendor.dump(f, src_uris)
+}
+
+run_go_mod_vendor() {
+    cd ${GO_SRC_PATH}
+    export GOMODCACHE=3D"${UNPACKDIR}/${GO_MOD_CACHE_DIR}"
+    ${GO} mod vendor
+}
+do_unpack[postfuncs] +=3D "run_go_mod_vendor"
+do_unpack[depends] +=3D "${@oe.utils.build_depends_string(d.getVar('DEPEND=
S_GOLANG'), 'do_populate_sysroot')}"
+
+EXPORT_FUNCTIONS do_vendor_resolve
--=20
2.39.5


