Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE63FC61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:06:52 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7578.1787731606841660291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=DYbDrZNd;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 40.107.159.41, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEUh4ijMacwj9AGOfjO4NJ5Wi+D/eYhifw09ClT7U7EPZbB5KOA0VFECFxUGqFknxN/26c/p2r3WjvsK46936lfEWDH/nAQtv0n1fLwD8eWX+jL7/AoSUelO9NiXoRAgyXByMqe6+qUAxUYE6RVP7CpErQWpkGf4d89BIbZOtL5o27hZYETfD82QUMh9NkdvN40KPfleBuAPcisf4fAcdfqIBauzyVNaj27oCaM5Ec5VLzbqf9AiAb2CUsWFfZ+uyhEBj28owzpLIz0tiGLkuetKIQehlDp3CNupvWKW65PIlxMBWpmw1I6MokJUXOCZcQ5IFLNFEKLcpmnbPYmvcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOnfuBtYgNHSIsnQuQSzreRHYsy+x3f9Iub1tXHgmqw=;
 b=GvyiRBYnImobFsl96y7QVIenk7X23sGqIDXetm+HUVLkhyUe6AMyv/OmRpQtgAD8PakvrTl9IxNxwtBNMWEf31CX1WqbhNNNf1pIb7DiybRLklZomlYxeZaBDXzky1rqTgBBiSzSNo7VRqq3e1pRzraXQxPfKVis6VaOZ+KpXC9EWPxs/uBRTqH/4twCMx0OA/95OIelpj9hQxPrmWWPwow7aKWiDmxGBGQDKy2FyiZNhfvKrDp7kAGMhxGXhAEQc/vx394OdAQsvG9ADQEGYeY6hEh6xDRPpam79FeTwNlqwdw7ykfDn1/+wYG+gHSllR69SBy8ChgF1c2rm6t9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOnfuBtYgNHSIsnQuQSzreRHYsy+x3f9Iub1tXHgmqw=;
 b=DYbDrZNdOSaXmTq7LrXkUjNoXz5uo5qjihOhpj7xhgLX8s5bsmJKVhDf50JNSNmV8Gm6V8JI51zuS1H7isywjVhYFGMI/zTrBpiEB+d+aBz/PBkBLs6ZTY9VfJ/eZdSkv4frdlNTcmZBm10mQ5qAC7uReUx5aTDnEuq45nS9G8Md9zR7lj+T1xaNc+yGunFhxjCx0UzzDa44FdJxnfCiU4r1EO0KQmBMUKWPMaygJfK+QVFlAeM/fMAKNXk5CA4vsA7gr6BD3froNV/DmECvOeFRVaYpOXZy5xR6KeRF2kFMv/+KSLCBOy48YI4sw2NExKhMpN4dx2pd6+d+txOGlQ==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by DBAPR07MB6662.eurprd07.prod.outlook.com
 (2603:10a6:10:180::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 08:06:42 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 08:06:42 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [scarthgap][PATCH 2/2] gnutls: fix for CVE-2026-42011
Thread-Topic: [scarthgap][PATCH 2/2] gnutls: fix for CVE-2026-42011
Thread-Index: AQHdNTHUDs5v+Dfbe0yqacTN5D+pTA==
Date: Wed, 26 Aug 2026 08:06:42 +0000
Message-ID: <20260826080602.17100-2-jakub.szczudlo@nokia.com>
References: <20260826080602.17100-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260826080602.17100-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|DBAPR07MB6662:EE_
x-ms-office365-filtering-correlation-id: 4912cc8e-3d04-4ecb-f00d-08df0348f6dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|13003099007|38070700021|10067099003|11063799006|56012099006|22082099003|12006099003|3023799007|18002099003;
x-microsoft-antispam-message-info: 
 AQXa7gkDPgu2tkxi6lSw/wWomwmmE85hC+uvbfe60VBSceUIJO0KYiczpC7Bqvdk3Dm2toRP0q8ZZRLTy0mrcNr4/6XFaCGJhaNoIL8gGbr7dUQvAp4ccjczAQqWSo4jwuBBlCV1fBFZe6nSFW3GIy0CcBMUNWca8vEikcn0jAOUhYSpT0d4SCuzNvnxTIJMYBqvCxKDL461ctJkrO1nvJR+lCcjz+uOIGCaVGdhePqvRHccTB0xz47BuhWkg4VN1t2vEVN0cs4osfkTmQW41w5n2+ACe1VGzJSWPoPqemHjK/gCSbOYr0hYxGr7Cfsw1DEVBi52CuyM91Vwd/P1rsKJ5LVdSWVQKwaIuXSZoF3rpU/ziGSFdDpaF1KGWFZRDkoSE58tUgUO2QHpfqTBqRa/ImpkAzOaszFYhAAmAL65vxewZg7O0Gu59Os/+GIm4TOlaaJh8+PnXa6iUSqbqEIleU8DFQXqC4zbKAUQ6HJII99LA6HBJnrSGsjN+PZcTu5q5ta/stBHLciHnOKd5X4EoVBZKipyytQAfdCuLRAEpl4SafA9EF8Dvn9A4mDPbsopt/5R99MKgZatP6M9Urez/FRd6kMCTFTTlQK/BIkwovbwQDS04/xsEvc0Ynogz1LOMKhQB7qwxof8v1YaDR9m+X8CRq8xG+eQouN2DTaQIncSaH4moYsSl0T8O3Ra53VPkIa/40iwalD8CUMKHVqALsyKnr/Ve0hUMQ8nL/0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(13003099007)(38070700021)(10067099003)(11063799006)(56012099006)(22082099003)(12006099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?U70y7p8jrdGGl8DSdZkcIVkCnK3HxgMS5eutPUGV0Qa6UC+dI3w+haFrTk?=
 =?iso-8859-1?Q?ENlRCU06IyM1xRR6au+++5cr2vmG/P7BUzf5CDRWYuD4pqYBJg7IYSYwRx?=
 =?iso-8859-1?Q?w/lHQLqgSvLcP0UKSIl53Jco8Z4pj/hRS3g5J4NxigSp4QzBbjCzUEy0K/?=
 =?iso-8859-1?Q?skHFmC4cE9gayyRbRurFQoSIGPMU2nvNIhx2PT60mxZyPCnuPxI2EC3eo3?=
 =?iso-8859-1?Q?f/p7Jo8NoemdzuR0FbzhGoSJvQReGEQKip4V/3RueIKO/jq+DFidw1EofL?=
 =?iso-8859-1?Q?TjWqpk8BCvGHlkExd10r7puCJRiGEWZjWvhDIzL3nEFa4M/HleI0h9K73R?=
 =?iso-8859-1?Q?NJCPcjWdG+hrupHASV5NFvSzovzhsLAvoqSIC2coFCCWcllw8xhCSYREGU?=
 =?iso-8859-1?Q?avW8vD5yW4VEvwoITRnc4L9jbji+SZ0oQ7UPXPD8ka8EcnxwpmEFZf7X9x?=
 =?iso-8859-1?Q?9ymp8BAvMg1RurSyqhPOqpgNqhgtCMCg8fYpaoQUyhMuEPR5aPWLnwk8XC?=
 =?iso-8859-1?Q?N2Hkp/88FAA9qLIEHwXUxG5lLSUqGWR/HDMonVxBmmIiWmb/xAYyHUScWZ?=
 =?iso-8859-1?Q?q0YxdL4YfMMIAU8ZKCb7+SJbjgZwbUPVOfhaTtTs43Rw9ZEB6dQHG+EcOF?=
 =?iso-8859-1?Q?97eJNFyMzMo3hyr5BDcNBAkHgbNgmRbrsrE7DJN1R/BqJZjQfoAZEUGz+0?=
 =?iso-8859-1?Q?G5E9b1imtHC4JjumYK1Ah7lHNeNQXo729SAg5o2D3xq5ucyreNPctP+Q/k?=
 =?iso-8859-1?Q?n+E68/fswx9//CuO7eTrY30ia08DBhKqGUMH7ITlYHP8evUZpyDLF3b8ve?=
 =?iso-8859-1?Q?AgVOd0pJ4hzcXdfFkvx2NthIpbR0bRyuXT/9tH8hDd8k+WI7uxae5h223U?=
 =?iso-8859-1?Q?QQQC2ajHmUJMVezUdF1AUCheQ83DHXi63OQ2sdo62f5bDQ69YGLVN69LE3?=
 =?iso-8859-1?Q?+DkxGvA+7GI9RlnsiXkeKeDr2rZD9TN0ZS1Ld5l77N/lEu54Slxid4NPK3?=
 =?iso-8859-1?Q?Un85It6adfgHxdRL5VdGKat8g+JH7BLeB5QFWcEgbnwV57sy0zg1/mvqhq?=
 =?iso-8859-1?Q?7BkjrbjekSuKvjYYJUMQqH96aTcYk1i41wTwvZDsrRILBkz2HehsI6Le/w?=
 =?iso-8859-1?Q?+eqY/SKDbaoLaZPrqP2cZjQ1F/2DSSe5eJDR7qCqQBtahEQqiaQWJMcbmA?=
 =?iso-8859-1?Q?MPFxY96wEQrq725/mcTQo3waaN+xPCB7D5+rHlZOwTHXEsMP9yLIE5KXAj?=
 =?iso-8859-1?Q?3uV7hwVaduE6Zm26Ki7qMxpDEOGcWPWAoaTYuxi4HH47Z4cdc2Vc6aeGIu?=
 =?iso-8859-1?Q?F8IJVd1nBPOyjuaQcD9wRa/1vExM6cnhHOloykkPVOMSwKlJm3WX8oDPdB?=
 =?iso-8859-1?Q?N8NOnXB2MaySX8ggk5zG4v+0wKh8qHxPQpc7oa8/2dNmlaUvtEvowEEORQ?=
 =?iso-8859-1?Q?9x8R47H1sJ1hqx9mPYsLCyCnCUrNygyPxAaqq4HhU60VkAdIMnHh8/JQyt?=
 =?iso-8859-1?Q?vYEfV6FCeP2vkZ3nUzZ/OAT5W8GC2LKD22JXRmGbmS9nCOj/WNA3jHD2s5?=
 =?iso-8859-1?Q?eZ+CaiEDpC/4J3oRWjUhL9eKREoo1i59W/EfCVcbX3iL0mOMwDCKg4h9Db?=
 =?iso-8859-1?Q?DquTcmXgyAluRDRiiuNcUVy0lNXASG3IK2H/rqrc4XHJKQ/1mKG8kjG+Go?=
 =?iso-8859-1?Q?V9B+0ndAgujgL1RDr9d/lWQ+7C5M2cZSzlQYfwsyh4WdU6DvDKdQb2Bx8q?=
 =?iso-8859-1?Q?8FntAKr8/sISc9NpTzqhCei1/eJvm1gStAwXLqJZCq1+h5eIOcQG6DGh9o?=
 =?iso-8859-1?Q?yV/Giu1JWw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4912cc8e-3d04-4ecb-f00d-08df0348f6dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 08:06:42.4069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vFdAPMq2/2fffTLVaZwBsyKMb1pnwXWlmgVLeItywuuC1WWATUWiBnXe+wGZdm6jMsKFEQKgBYFfWPDBbp1HeK7nMmbskOJvC+uMMcO/gmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244326

Backport patches to fix CVE-2026-42011 and extend test for it=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-42011=0A=
=0A=
Upstream fix:=0A=
  https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f20d44=
2df192b83=0A=
  https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22ccce4=
f5ce05c84=0A=
=0A=
Tested with ptest=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../gnutls/gnutls/CVE-2026-42011_p1.patch     |  43 ++++++=0A=
 .../gnutls/gnutls/CVE-2026-42011_p2.patch     | 141 ++++++++++++++++++=0A=
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   2 +=0A=
 3 files changed, 186 insertions(+)=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p1.pa=
tch=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p2.pa=
tch=0A=
=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p1.patch b/m=
eta/recipes-support/gnutls/gnutls/CVE-2026-42011_p1.patch=0A=
new file mode 100644=0A=
index 0000000000..62a9714c6c=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p1.patch=0A=
@@ -0,0 +1,43 @@=0A=
+From 1dead2faec6320aaba321eb56f20d442df192b83 Mon Sep 17 00:00:00 2001=0A=
+From: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Date: Tue, 14 Apr 2026 17:41:30 +0200=0A=
+Subject: [PATCH 1/2] x509/name_constraints: fix intersecting empty constra=
ints=0A=
+=0A=
+Permitted name constraints were wrongfully ignored=0A=
+when prior CAs only had excluded name constraints,=0A=
+resulting in a name constraint bypass.=0A=
+=0A=
+With this change, they are taken into account and propagate.=0A=
+=0A=
+CVE: CVE-2026-42011=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/1dead=
2faec6320aaba321eb56f20d442df192b83]=0A=
+=0A=
+Reported-by: Haruto Kimura (Stella)=0A=
+Fixes: #1824=0A=
+Fixes: CVE-2026-42011=0A=
+Fixes: GNUTLS-SA-2026-04-29-6=0A=
+CVSS: 4.8 Medium CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:L/A:N=0A=
+=0A=
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/x509/name_constraints.c | 3 ---=0A=
+ 1 file changed, 3 deletions(-)=0A=
+=0A=
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c=0A=
+index 04722bdf4..232d466c4 100644=0A=
+--- a/lib/x509/name_constraints.c=0A=
++++ b/lib/x509/name_constraints.c=0A=
+@@ -723,9 +723,6 @@ static int name_constraints_node_list_intersect(=0A=
+ 	type_bitmask_t types_in_p1 =3D 0, types_in_p2 =3D 0;=0A=
+ 	static const unsigned char universal_ip[32] =3D { 0 };=0A=
+ =0A=
+-	if (permitted->size =3D=3D 0 || permitted2->size =3D=3D 0)=0A=
+-		return GNUTLS_E_SUCCESS;=0A=
+-=0A=
+ 	/* make sorted views of the arrays */=0A=
+ 	ret =3D ensure_sorted(permitted);=0A=
+ 	if (ret < 0) {=0A=
+-- =0A=
+2.53.0=0A=
+=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p2.patch b/m=
eta/recipes-support/gnutls/gnutls/CVE-2026-42011_p2.patch=0A=
new file mode 100644=0A=
index 0000000000..29eb6bda43=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p2.patch=0A=
@@ -0,0 +1,141 @@=0A=
+From 24713b8c63137ce0665b495d22ccce4f5ce05c84 Mon Sep 17 00:00:00 2001=0A=
+From: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Date: Tue, 14 Apr 2026 17:49:50 +0200=0A=
+Subject: [PATCH 2/2] tests/name-constraints-merge: extend to cover #1824=
=0A=
+=0A=
+CVE: CVE-2026-42011=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/24713=
b8c63137ce0665b495d22ccce4f5ce05c84]=0A=
+=0A=
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ tests/name-constraints-merge.c | 113 +++++++++++++++++++++++++++++++++=0A=
+ 1 file changed, 113 insertions(+)=0A=
+=0A=
+diff --git a/tests/name-constraints-merge.c b/tests/name-constraints-merge=
.c=0A=
+index 70376aaa7..3ff8d6c60 100644=0A=
+--- a/tests/name-constraints-merge.c=0A=
++++ b/tests/name-constraints-merge.c=0A=
+@@ -473,6 +473,119 @@ void doit(void)=0A=
+ 	gnutls_x509_name_constraints_deinit(nc1);=0A=
+ 	gnutls_x509_name_constraints_deinit(nc2);=0A=
+ =0A=
++	/* 6: test intersecting empty permitted with non-empty permitted=0A=
++	 * NC1: excluded DNS excluded.example.org  (empty permitted)=0A=
++	 * NC2: permitted DNS permitted.example.org=0A=
++	 * Expected result:=0A=
++	 *   permitted=3D[permitted.example.org], excluded=3D[excluded.example.o=
rg]=0A=
++	 *   unrelated.example.com is rejected=0A=
++	 */=0A=
++	suite =3D 6;=0A=
++=0A=
++	ret =3D gnutls_x509_name_constraints_init(&nc1);=0A=
++	check_for_error(ret);=0A=
++=0A=
++	ret =3D gnutls_x509_name_constraints_init(&nc2);=0A=
++	check_for_error(ret);=0A=
++=0A=
++	set_name("excluded.example.org", &name);=0A=
++	ret =3D gnutls_x509_name_constraints_add_excluded(nc1, GNUTLS_SAN_DNSNAM=
E,=0A=
++							&name);=0A=
++	check_for_error(ret);=0A=
++=0A=
++	set_name("permitted.example.org", &name);=0A=
++	ret =3D gnutls_x509_name_constraints_add_permitted(=0A=
++		nc2, GNUTLS_SAN_DNSNAME, &name);=0A=
++	check_for_error(ret);=0A=
++=0A=
++	ret =3D _gnutls_x509_name_constraints_merge(nc1, nc2);=0A=
++	check_for_error(ret);=0A=
++=0A=
++	set_name("unrelated.example.com", &name); /* entirely unrelated */=0A=
++	ret =3D gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,=0A=
++						 &name);=0A=
++	check_test_result(suite, ret, NAME_REJECTED, &name); /* #1814 */=0A=
++=0A=
++	set_name("permitted.example.org", &name); /* permitted, direct */=0A=
++	ret =3D gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,=0A=
++						 &name);=0A=
++	check_test_result(suite, ret, NAME_ACCEPTED, &name); /* sanity */=0A=
++=0A=
++	set_name("sub.permitted.example.org", &name); /* permitted, subdomain */=
=0A=
++	ret =3D gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,=0A=
++						 &name);=0A=
++	check_test_result(suite, ret, NAME_ACCEPTED, &name); /* sanity */=0A=
++=0A=
++	set_name("excluded.example.org", &name); /* excluded, direct */=0A=
++	ret =3D gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,=0A=
++						 &name);=0A=
++	check_test_result(suite, ret, NAME_REJECTED, &name); /* sanity */=0A=
++=0A=
++	set_name("sub.excluded.example.org", &name); /* excluded, subdomain */=
=0A=
++	ret =3D gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,=0A=
++						 &name);=0A=
++	check_test_result(suite, ret, NAME_REJECTED, &name); /* sanity */=0A=
++=0A=
++	gnutls_x509_name_constraints_deinit(nc1);=0A=
++	gnutls_x509_name_constraints_deinit(nc2);=0A=
++=0A=
++	/* 7: test intersecting non-empty permitted with empty permitted=0A=
++	 * (same as 6, but swapped to ensure order doesn't matter)=0A=
++	 * NC1: permitted DNS permitted.example.org=0A=
++	 * NC2: excluded DNS excluded.example.org  (empty permitted)=0A=
++	 * Expected result:=0A=
++	 *   permitted=3D[permitted.example.org], excluded=3D[excluded.example.o=
rg]=0A=
++	 *   unrelated.example.com is rejected=0A=
++	 */=0A=
++	suite =3D 7;=0A=
++=0A=
++	ret =3D gnutls_x509_name_constraints_init(&nc1);=0A=
++	check_for_error(ret);=0A=
++=0A=
++	ret =3D gnutls_x509_name_constraints_init(&nc2);=0A=
++	check_for_error(ret);=0A=
++=0A=
++	set_name("permitted.example.org", &name);=0A=
++	ret =3D gnutls_x509_name_constraints_add_permitted(=0A=
++		nc1, GNUTLS_SAN_DNSNAME, &name);=0A=
++	check_for_error(ret);=0A=
++=0A=
++	set_name("excluded.example.org", &name);=0A=
++	ret =3D gnutls_x509_name_constraints_add_excluded(nc2, GNUTLS_SAN_DNSNAM=
E,=0A=
++							&name);=0A=
++	check_for_error(ret);=0A=
++=0A=
++	ret =3D _gnutls_x509_name_constraints_merge(nc1, nc2);=0A=
++	check_for_error(ret);=0A=
++=0A=
++	set_name("unrelated.example.com", &name); /* entirely unrelated */=0A=
++	ret =3D gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,=0A=
++						 &name);=0A=
++	check_test_result(suite, ret, NAME_REJECTED, &name); /* #1814 */=0A=
++=0A=
++	set_name("permitted.example.org", &name); /* permitted, direct */=0A=
++	ret =3D gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,=0A=
++						 &name);=0A=
++	check_test_result(suite, ret, NAME_ACCEPTED, &name); /* sanity */=0A=
++=0A=
++	set_name("sub.permitted.example.org", &name); /* permitted, subdomain */=
=0A=
++	ret =3D gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,=0A=
++						 &name);=0A=
++	check_test_result(suite, ret, NAME_ACCEPTED, &name); /* sanity */=0A=
++=0A=
++	set_name("excluded.example.org", &name); /* excluded, direct */=0A=
++	ret =3D gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,=0A=
++						 &name);=0A=
++	check_test_result(suite, ret, NAME_REJECTED, &name); /* sanity */=0A=
++=0A=
++	set_name("sub.excluded.example.org", &name); /* excluded, subdomain */=
=0A=
++	ret =3D gnutls_x509_name_constraints_check(nc1, GNUTLS_SAN_DNSNAME,=0A=
++						 &name);=0A=
++	check_test_result(suite, ret, NAME_REJECTED, &name); /* sanity */=0A=
++=0A=
++	gnutls_x509_name_constraints_deinit(nc1);=0A=
++	gnutls_x509_name_constraints_deinit(nc2);=0A=
++=0A=
+ 	/* Test footer */=0A=
+ =0A=
+ 	if (debug)=0A=
+-- =0A=
+2.53.0=0A=
+=0A=
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.8.4.bb=0A=
index eb66bfd19d..6e602ec8cb 100644=0A=
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
@@ -47,6 +47,8 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar=0A=
            file://CVE-2026-42009_p2.patch \=0A=
            file://CVE-2026-3833.patch \=0A=
            file://CVE-2026-42010.patch \=0A=
+           file://CVE-2026-42011_p1.patch \=0A=
+           file://CVE-2026-42011_p2.patch \=0A=
            "=0A=
 =0A=
 SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44c=
dfa7f36ebc3a9b"=0A=
-- =0A=
2.34.1=0A=
=0A=

