Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969D9C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 07:03:49 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.109])
 by mx.groups.io with SMTP id smtpd.web10.115079.1698044623862224913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 00:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=jl0AFOy6;
 spf=pass (domain: prevas.dk, ip: 40.107.7.109, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0EVrmuXaHJwY1zCLe0vD0t4GrBBwigpmztk7UaDG0Ph5X+Hx81pLsOwYUOr/9m9NdCTONgsLY6Qo+XVOsT60XAs/BUWEDo1coJDEq2zTNu4TxIX9W2zUcUIj/8ewDVlylUJJBrUwjswLoKtAnWIx0h5nEdfraUD550lNAV9VwGr12ZrA4xwBpHcaTUaGkF/P4OnoPNc+2iIpM8zcjE4EInpSk1Xt+Pv/HjkVExDSMo2Q9ByEaD0EoCEwSGYGRZzJgFLUPmLy+uzLFQm7SIQAZBbGZ+zH7aBmHhPqc23i6URMTxf8KYWpBComk5LjT3ppXv3NFtYBvoWOiNJ6xiCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LChgNRhgwDNow3sYZXEblmsseZHka2Mfq67iW8o0Dnw=;
 b=FrstIp6AyneM03mT4BsvfDlbcxHpW3OZPQ9EnfcHYmsDa31INbb7DUT5aM40xjW6Y1LRKb94tQy6Rves5KX9Wis0Hd+F/fWeGad6PLhLH/alV+ZkuvvQDzBjbBu62bxEWVxhb0ivh9YyHaFFfO/TsWaiOV0oSEiK2C2QcUyxF8wL8oPKKkNTXZz9EOA12kP9yo9H+ivIiTcJcANRTTN8e3GeFgD9F51AT6/GVPBJ5jV16FrWK+spLKaBcwCvGRy2GhLopiyPMCnapaXlB8gBjZPKWND1oSDKDjmh0uc+2nygYISIDLBRid7KvGkIhLGDe0RZvlG8w8lCBdQaHWkFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LChgNRhgwDNow3sYZXEblmsseZHka2Mfq67iW8o0Dnw=;
 b=jl0AFOy6YfQRpVhY411no1yztVg/kvwwkGtcbymiJ3vllZHsvZZvBf8q0lNMUfkpl1aakjCj+jIqEP2fslwTldQgOTFtrb58+oqoYtNlERtgdJ57B7FDd9+eZzHjaa8wvaCKkiMoDgVJK5BeCSkT95jPk6nATJ7b1Fferwk5MPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS2PR10MB7348.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:604::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Mon, 23 Oct
 2023 07:03:39 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::52ba:4d74:6ab:aa5]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::52ba:4d74:6ab:aa5%7]) with mapi id 15.20.6907.030; Mon, 23 Oct 2023
 07:03:39 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v2] perf: lift TARGET_CC_ARCH modification out of security_flags.inc
Date: Mon, 23 Oct 2023 09:03:30 +0200
Message-ID: <20231023070330.6984-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.40.1.1.g1c60b9335d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0086.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::10) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS2PR10MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7841f2-3d4f-4f96-57c5-08dbd3962f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2Vtw3ZN+KeZiZTaIjR50rwU2PwQddQTyrIDmga2Sy9mKBl6QIt7s2lt+YmwdSqFfpwOdTcyfJwm9mjO2lgLyatmM/XTITEAB9XS4c8GnoQxzrFniOnaRfFE+MCrLjhtEZtYqycZ1ynTJEaaDx51WWnEdDUktysixCcb/WQndFuhnT4bgv+klTkQ9vYTNh5273UcfK+QhwPCuZ+6MhtFLqvHjsINZXwXc7mEkeRm7XjldqVlkY+lXDKD+A1HTyk07OFInZppGWUawDFGAXqJnek5KNZngtWmv2YQbyFwH5cm7+shJCQBqVAsUnfi+aDi6M8U5MikssFdAyltOy5w/DNpTx50sb2LN4ot/FYTmKAOn6pojNhkwdYystT5k5yXAu7cnmeIDShIjPlvagSSRlhh/KAwqM1GM/FvkAzg175diPmjZnHnIeMXaqmcJSHPM0TXtnEBHZg+jTksvNbUpvd/OxozTJMerYjXBq7Kq/wu31e+AlxyzTmHWhJq5wIOS8ZtEjvOfSQ0XjUji6EaJZ9aJYByzmGo+rJRcXj/JYkwQNbG3nCdYH3oYSm6AwHRVWtEx2H+o/flZlU3C6z8w76mDKgC7eduAEVPMXQmdwYDG0kKOxbKmRzwfgYnBiP/a
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39840400004)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(52116002)(6506007)(2906002)(6666004)(478600001)(6486002)(8936002)(15650500001)(8976002)(8676002)(4326008)(44832011)(5660300002)(66556008)(66946007)(6916009)(66476007)(54906003)(316002)(41300700001)(26005)(83380400001)(6512007)(38350700005)(36756003)(86362001)(1076003)(107886003)(2616005)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ap83AcOIvyh0mbcMHAd4LsQZbWfQuAT2mrQqMNHWRrs9c+zubyjScFEXQ3+p?=
 =?us-ascii?Q?VuOeAnm1l/zOYXHR5YIBmHWuOU21aaJh+t1wS4vOmTXRojAjJySiR2B/ZN9v?=
 =?us-ascii?Q?Xz6jdqgK0K15uzEUV1njSWernlQFesciiXA4CT2+Sa3hrJqanqKzIbG/b9+9?=
 =?us-ascii?Q?hhFpjCjPfGTlUxQQGWQAAPYq2hPO0/CLfiLqBY/qLmQFLZbgcVu35uccr82b?=
 =?us-ascii?Q?VZ81idSCjsu1Y/YLOIzIRK+7kKzaQgQ+nG0B0Z9Y0roE80dHCr07lzGY6l9j?=
 =?us-ascii?Q?MkVN4zFZUMEK4bf8P/1a63jjDwkRCMDKW3qYg7/qPIIwkvPqJrzXUToOMvEI?=
 =?us-ascii?Q?hf2LmK5kvyuj0incuBqa6H4PYe9U7jyWMg+0d5EPJ+vgBtRQ0BQ8S9cbA5zQ?=
 =?us-ascii?Q?aEp0b5sDeC6fJ28DXKF6ToMRltqFrGIUJJaD0/HV4geOzXjQGCb3s8QqCjhV?=
 =?us-ascii?Q?oJ/UAsU1JO1KYW6APGayyRj51t5tc2CLSCnL18GhK7QZmxHS2LL72OL0YqUM?=
 =?us-ascii?Q?I1wo+FPhbfHL7U8TadfertbTWkCsbQPcmb4C1AQKpHP5qiS7ECj5IfjNVJOo?=
 =?us-ascii?Q?h4XDMH/0g3xnK/n4xsDAf3aAHrFQ84O3i40Nwhfv/tb1MxUONVO0zIlcy8bX?=
 =?us-ascii?Q?VGEYHojdAFOK3nLodPxc4JAEeaTHkqOAin/QwH5OSDfGnTMbZPHLNRNv++R4?=
 =?us-ascii?Q?bCHoZVUFECo8VB1VmrMV3461wvvDaZti7PNT3RXmLxpfkhwQpxCPFWvpmaCi?=
 =?us-ascii?Q?CBKRNmWNyWlpY1H8bds3IxWffpksPdiK4Jgl96YLvWP6e/zbmqEijZw04hcj?=
 =?us-ascii?Q?8ufYJDbwqoihDuD6cPZzGVDIpA1sy0VG7iZ5YQXwojgVX30T0f+0icBOMHGi?=
 =?us-ascii?Q?zIxKTN9grxFT0HphoEkAYpaTCnp0zxOGxrdlBrVLZrFrHtpsAWHF88uuVUXA?=
 =?us-ascii?Q?o6tYMk4WfZBKd73hpxjF3y2dyckgPl2hIVZmQJj+zJb3citLYEhGrQfzPnDC?=
 =?us-ascii?Q?/x4RETTuno6VaLZfHtS0uAVzVq2Q4rrHplAYhjFYgFE5rt6eSMtZnYmyOUpO?=
 =?us-ascii?Q?vsOFHA234y2gxax7sN9xvrVdbFC4H/4hnB/w/AstdzBvgmog7StnXaQvIJQ5?=
 =?us-ascii?Q?IgabB+tPwMOzoGDJQmHmKvupdE0GMx+w6/cjGAyFboKbc13RPXUdkjhd4VTj?=
 =?us-ascii?Q?KkZ9/xDQ2NSVBka2nOJO+HCXp5JD939YYo5SrQpJfWMJPm4B+rY86zT/IGTj?=
 =?us-ascii?Q?1A3NrXOJ71nhdjoHyNBoRVlaYPV+Q5Q3rZ4sXc0EfI36UxOmy23Ii8/ezFtw?=
 =?us-ascii?Q?l7pD222I9tOgz3K2TsBJAucyqAsYfVDzOILqg234edHKEaf4aYb3+YwQLEMt?=
 =?us-ascii?Q?NEQ+2AyUt9fR+3SEckXbY5vKhUxsKVTS2XiHbi2rZgplKhCCcyGshaiJysOj?=
 =?us-ascii?Q?L7LvMDkZmlzgEIPhFYLybnd1BlxYfIceqjRI9Bpj0Lcu+bA/ttVuoevYh5ri?=
 =?us-ascii?Q?IdhYeCYkTuS1qJRfGOqndFxcSR9iOqjgVN2YjOHeffqaK7NTs8rNgZCY9UX1?=
 =?us-ascii?Q?GK3K6t5MI2zGLPtFOUOOROYKyj46+l654WV8xEZHFPJU6m2HmXxriX0zs+UM?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7841f2-3d4f-4f96-57c5-08dbd3962f04
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 07:03:39.1459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: St2WmgePC0l20zCQLuI2gmi7JhWHDQzgTVggcrD7efmYuytLLJyJrxydOIvZb8hQvp7ib+7qZz7ZV/aUCr2rfV6vjpym0I5GoMmmeFepD00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7348
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 07:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189615

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Building perf without security_flags.inc being included in one's
distro results in the buildpaths warning

WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/trace in
package perf contains reference to TMPDIR

because the ${DEBUG_PREFIX_MAP} does not get used. Most recipes get
that from CFLAGS, but the perf recipe explicitly unsets that.

Now ${SELECTED_OPTIMIZATION} of course contains more than just
${DEBUG_FLAGS}/${DEBUG_PREFIX_MAP}. For most TUs, perf's build system
adds its own optimization flags (-O6 for odd reasons), so for those
including the -O2 or -Og doesn't change anything. But looking at the
.o.cmd files show that there are some TUs which currently get built
without any -O flag. So for those adding the distro's
SELECTED_OPTIMIZATION seem to be the right thing to do.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
v2: add comment

 meta/conf/distro/include/security_flags.inc | 1 -
 meta/recipes-kernel/perf/perf.bb            | 9 +++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro=
/include/security_flags.inc
index 2972f05b4e..d97a6edb0f 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -69,4 +69,3 @@ SECURITY_LDFLAGS:pn-xserver-xorg =3D "${SECURITY_X_LDFLAG=
S}"
 TARGET_CC_ARCH:append:pn-binutils =3D " ${SELECTED_OPTIMIZATION}"
 TARGET_CC_ARCH:append:pn-gcc =3D " ${SELECTED_OPTIMIZATION}"
 TARGET_CC_ARCH:append:pn-gdb =3D " ${SELECTED_OPTIMIZATION}"
-TARGET_CC_ARCH:append:pn-perf =3D " ${SELECTED_OPTIMIZATION}"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index 675acfaf26..a392166e73 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -73,6 +73,15 @@ SPDX_S =3D "${S}/tools/perf"
 # supported kernel.
 LDFLAGS=3D"-ldl -lutil"
=20
+# Perf's build system adds its own optimization flags for most TUs,
+# overriding the flags included here. But for some, perf does not add
+# any -O option, so ensure the distro's chosen optimization gets used
+# for those. Since ${SELECTED_OPTIMIZATION} always includes
+# ${DEBUG_FLAGS} which in turn includes ${DEBUG_PREFIX_MAP}, this also
+# ensures perf is built with appropriate -f*-prefix-map options,
+# avoiding the 'buildpaths' QA warning.
+TARGET_CC_ARCH +=3D "${SELECTED_OPTIMIZATION}"
+
 EXTRA_OEMAKE =3D '\
     V=3D1 \
     VF=3D1 \
--=20
2.40.1.1.g1c60b9335d


