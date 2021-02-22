Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.40])
 by mx.groups.io with SMTP id smtpd.web08.29283.1613956910435387573
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 17:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HoXCwbJe;
 spf=pass (domain: windriver.com, ip: 40.107.100.40, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDHJXvB+noJ5VYgIFJ4elSf62rHHi9WaB5wLDSfiZN7uGFOhgpS3bjgfxL6PJSwAK8gpmBlXr7Ok6KgmkI5aFk0ODhzTAAnKpIJT/YbOuGba/UelJGMOPcI1hhRgReXTWv1mvp+IEDi5VX8Lndc7PldUaxn0JvUdO2FL4y3Ul7Q0nDLeJQtHn1l2VIwheGXDHCwooujPL+8lMIf57HLwx4DQIv9VxEvrAKBEZs5KjV3rNhptILdHh+8+XRCZjHo8trChJCxEp4D9GLV8XniU2sOXQoz4q6+ixyBXWZHwhmpOcLQweN73OwH0ihIWqAdl1c1MKVGXqr9PhNJWrldYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D55oGe/pk8vNeWyy2GifXroarV9ppkuEu6wcupL8bI0=;
 b=RwlSL8lNOeU0q5/NPWrtnln5E+c2ajNHmKgAe+UqL0MYHDwSAZezGvZG0fTA69ck/xwUUQJfOrkV4snq3/UuAPrUzfOsb93qpu+/CA/WhxL0H8f7o7XjU5jC4YXivHcmQ/JwOjh0Lfe9BFZ6L40QGI0DxZ0rBxvPP4h8GR+aKygkfvr98oCRTjMt5r6pEbog1D1u3Gh5TJTcP55aSHCuQYrN1N8AuLKovliMTqFQFV4POrcwjJnXgUfJs6uOWFm601ysqKIRRfWUy3be3Oa+VSBjPysZjmiJRwFjz/6jCWbjxBTv83TYV8U2MJP3ignGR9b6cJYdRxPkEQi2qsRDKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D55oGe/pk8vNeWyy2GifXroarV9ppkuEu6wcupL8bI0=;
 b=HoXCwbJe9DYkEH3iXB8tOTwAurYxbt/YLmJIc/yC0CP9YbvuNuzNyXjr9detpNxRmCQcYePMkW4Tjc5vMhnbv17vrmzLgIXYPGNTPuExsmWHP/aWlbYFQLQBTvflj2JFCAL1ohctXlnCXfnPF+KnvdRieQtAep5iminpEf+cYlQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Mon, 22 Feb
 2021 01:21:49 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 01:21:49 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: customize the python interpreter for nativesdk
Date: Mon, 22 Feb 2021 09:21:31 +0800
Message-Id: <20210222012131.45061-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:203:c9::9) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HKAPR03CA0022.apcprd03.prod.outlook.com (2603:1096:203:c9::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.10 via Frontend Transport; Mon, 22 Feb 2021 01:21:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cef7129-c483-4a51-38ab-08d8d6d039e1
X-MS-TrafficTypeDiagnostic: CO1PR11MB4802:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB48021B2D8F9271F133D4F220F1819@CO1PR11MB4802.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UKQ0V+yGGmk0sg9srbOAyYpYRhSOgBS9JPMLw8JKqEXnbnVsFmseruw9DpL3w2e5kMNxeWYIMeQYARuk+p2b1yrgGwFnYp+U9Bkp0+Gtg7ehAHqR6Jjbay6wVLSJFQCE7mK4vjM/SKHin175rYPvuGO/Kz/pDF6qN25zOesXyKg0xQdLb7dCJqWbnNyKr9xMSpWsZUnMLB9wolm52EBy3VcjbFWHbYtYZN9cwWDHUZnlIpjhpISTzvaI8DruarKxmtRyyVDgAJok5s0Ru61rbX7+Xzb5/zeyHJd/5/dPhgJy3mtkgIRmQIUeKF3SvG/4c/1dEeUAveIG/piWldNgYzuv8WoegL/su8itbVsdpsz2bCpx+8ES/lPYj8Vnon/EsQHprB1ePa5Wh7RGKbwfZP2FOVeQeaMfqXN5plz23qUE46ixOQxewP+ijbA3BUNzak2YYECcykC2iNi+2uTCQv/mM7W4Kc8MfCMFizUWR56OMJztXu0RWBQlj4q+dDH9NVTa1x8eGMTR+w5IziDH6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(52116002)(8936002)(86362001)(66556008)(6666004)(36756003)(478600001)(16526019)(26005)(66476007)(1076003)(9686003)(6916009)(6486002)(956004)(5660300002)(6512007)(316002)(83380400001)(66946007)(186003)(6506007)(2906002)(8676002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?T7QlJgVtNfAf3La8rzVeNwpl08VsDgRt+8yRVjGOFfrFUm/91D3slBYMTvys?=
 =?us-ascii?Q?PJNKd8/gHG/PsDYrW3Ou4N1YlJvEpq6WEJwtc4/ETpgmrL1Hece0EjnGncZb?=
 =?us-ascii?Q?ogZvosEqJgiBE8OiDBIGQTI4ZWZrw51S3imuaBvcQ19vC1y8QDYPuVWtmiRT?=
 =?us-ascii?Q?++e1sQkA/XQA1g4Kk/CpSMy79Nq0FAOvlvkkDtlcFns4HxQoLRTdSEzvLKAW?=
 =?us-ascii?Q?Kxih0Z8YiPo4wIRqe8UHGXVVnaIEhpzImqtBVVpx6D9tnnGyrgMKli0aWZhN?=
 =?us-ascii?Q?JUizG+NLs9YlvHfNRX5hqPRPTsFxqR7ktnHtgafb+ZXKtlILa/o6oMhG7tdv?=
 =?us-ascii?Q?EyWTZN9VZShN3PkhBWjiIWDHrOCNuBd+sN0w1Q1LmVHXz0EEYeN29Rnt//K3?=
 =?us-ascii?Q?LnNRrYGAyJs6s1Yr4bMcSr/JIC82C+zaIYQrHjowbJ4W7bhFjDuRBRA80yh+?=
 =?us-ascii?Q?ehpYCx1gOnhfhdwFJCVNgjeNwJYtWm9Yl4i04faFDkNO+JXh9vytmoBlPjb7?=
 =?us-ascii?Q?A23EvKLEoqoL95Dj1Qu7MgilSnSzZSWDkWhPNtzTQMjN4q6Qk/KqebW2JI3R?=
 =?us-ascii?Q?oFmFvoYwLkvGOh4VC9QZ3ClfVIoSnY0NxUVK2lfqMtrTNpZlqxdEf9oWnki/?=
 =?us-ascii?Q?JbKXjbG25706cQoVaDBQeVx000kGUrqTDD910dxm6XSMos0tt6BTjo/UiVK2?=
 =?us-ascii?Q?ea2DXN1ta0HiwAS/DDiC0P+tRWYOc19w2dpR1kPOvYrhWqTWrXXsNS+GzeRO?=
 =?us-ascii?Q?rkdfV8e14TCzBRY5mVAJn8nTx9K7FQBicHWloSLwEvr75vrKdIeDvTFiCypB?=
 =?us-ascii?Q?j+QYc2I9bRcld5xQoKX6Geeu0f7RDDYQZxPZzIrj+Fes57wUCEfK8Pdeb/B/?=
 =?us-ascii?Q?jYckLbr65lS+QxjQZg9Dm3JbHAUrr68zzFh4vB7pngKaq4hicLjbenUYy1Q1?=
 =?us-ascii?Q?REXuQ/e7yR33ymrqaAAZ+echXMftLRd8Usdxv0A7K1Y+Sr6xOobRZCyeWXk0?=
 =?us-ascii?Q?vn0RdHag0hX05oJaCxqXhgA7XIa7+HzxA1As9o0S++VMAaHR6DsDsKFzstNy?=
 =?us-ascii?Q?XctMqZNcG/jmE0oUdhK4wwMtS0tK+fkh2Eh2tKeWgMqmUtEcpmrRf5nSqjSW?=
 =?us-ascii?Q?w5a7klRm0h8WGV39MSkxhnlvobc7smVS6T6vTX5J1xaZETIHQGo3g/kvDVXI?=
 =?us-ascii?Q?I8yIfdVesy6qquPTmHX4sGwTfU8LJHX4spOwQWtahvfdfQUejk0kcKZfF6Lq?=
 =?us-ascii?Q?zqx3HybaYeU8iKoBIYzIpGh3sgsLdCuv7Uo1PKJ6bztOWM503BqX6uAP7jt9?=
 =?us-ascii?Q?Xqd+qYuZjAYYYFNGTnbZIP2b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cef7129-c483-4a51-38ab-08d8d6d039e1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 01:21:49.0496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r72GHa4P1bk1u0FD96UKlxfA4cLcpxvN6zZ45NuDvDR6GOTv9sXb2UeYv3HRVwHm/6jq9FCx+2zTDhb1UdPvKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Make sure the python interpreter is "#!/usr/bin/env python3" for
nativesdk to avoid the shebang path exceeding the limit when install
the sdk under the directory with long path.

Before:
 $ cd ${target_sdk_dir}
 $ vi ./sysroots/x86_64-oesdk-linux/usr/bin/2to3
 #!${target_sdk_dir}/sysroots/${SDK_SYS}/usr/bin/python3.9
 [snip]

After:
 $ cd ${target_sdk_dir}
 $ vi ./sysroots/x86_64-oesdk-linux/usr/bin/2to3
 #!/usr/bin/env python3
 [snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python3_3.9.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.9.2.bb b/meta/recipes-devtools/python/python3_3.9.2.bb
index 87231f97a6..9c87d9d2eb 100644
--- a/meta/recipes-devtools/python/python3_3.9.2.bb
+++ b/meta/recipes-devtools/python/python3_3.9.2.bb
@@ -177,6 +177,10 @@ do_install_append() {
 }
 
 do_install_append_class-nativesdk () {
+    # Make sure we use /usr/bin/env python
+    for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
+         sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
+    done
     create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
-- 
2.17.1

