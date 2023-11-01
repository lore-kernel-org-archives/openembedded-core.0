Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5A8C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 08:48:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2331.1698828522087281070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 01:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FU7YHrgK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9669c8c021=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A18HMjB012383
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Nov 2023 08:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=SfM5/jnzyI+YmQe02U
	Pj7Moi7dqbKC23smjsTs7kLlE=; b=FU7YHrgKxo3I/Nr7U/Ts6B/q6uT9OPEwDt
	xMjkUTSpP02cn6VJEPi7TSRcl4MAjT8kO1xwPWgqBxCGGJFn02fsEPRcl0aAV7XT
	mcAIbLr6x/DoDZwWohKxyjCMjtAYzz8+0zeIEx3E8Db8B+tSJ6GK+6W8JGS/Qz8s
	OD7r5qOrlmEkiNZ6r/Ug8sRmZrmsjwQyvfkrRX1ucBoBkiSnJhYR5R2j/ncyrpCV
	KpbLYg4Dy3xiYo8BT2/F1vUSlg2TS6/Lae3fqM5VyzwRvn0tTQtytHBEIUumnNd9
	EZk+rfeAsCpEANYlF+7Sf5a5zP6lsRQPodfrW5NRzEpBQg//FGzQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0s96cnjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 08:48:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeptCXUH6mJdjuJZA1MYJ1RiUSpJIKEws0FiF59fq6i78IYbuqPRLTdhwz4Q04Ypm8tRzLGycwWdmIZI0oO7kXcU1CrlYuIuvvv3ht8V8H2+0YkmhF290Dy2YY01XWiEIXNX3bCvANXEQC+fKsuWuN9b4yJn+wBRwKnIfwCYHvnkacbNn8QKSZ/nDRJBt76ysp59JJ6n5mWt8QJplUjituIiojsqz3rzjkMMQg32WsLCz0k+tLA/qJz8iWS9elvPF7HrqwqSWsF4LwyGc3D8nzen9xhiSO3/re2lnRT291NKRjK63kos6gB5hAam4TAapJYGK72L1ew+5iGGwZlTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfM5/jnzyI+YmQe02UPj7Moi7dqbKC23smjsTs7kLlE=;
 b=YX03s3r4HXNAdS8/nInq0BxuNqPW9j3UqnpqyJ+M/Zi1YIAv2j3Dz6HseQZNbrCT5ZIQzVxM/8jWj9UyrLLV5Sl0iLuLlMHsFItjPHOO1++PuiPNNMHICxq2e48WS8VeeAcTZFBW2nSE4hch1HJdtUDf2mROiuc7eKdI69A7uKn1cpIDqU1eRLE882acQ3IC1+L0PL5xwoRHUrAquzRO/bjnJyXpaGosMi3EkfWk5wRrRMRh77Oi3ADbYetTDwmD7kcbK+ggN2FE5SkOJScspxzgcXS1l7grM4RDvhDxjHrjwZ+r1qoO1ExVqq8B0vyal/h3695rfQB1/xg2CveVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Wed, 1 Nov
 2023 08:48:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6%3]) with mapi id 15.20.6954.019; Wed, 1 Nov 2023
 08:48:33 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] systemd: fix DynamicUser issue
Date: Wed,  1 Nov 2023 01:48:22 -0700
Message-ID: <20231101084822.1887693-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c9362f-f0ed-496c-fb5b-08dbdab754b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IKOkogzDb3YbkWYtiXWxR0Ot+okjamtUEaT/pYfgkZzsdu7ekejXIxCuqZUgxexqjYyXTnfCRx39vxaRhon6ZyZLJZN1syqDZ6WsAHsWWsVoLCgbOYb69kcaLBlE0FaTzdVVyZprIet22voTfP8WRMQN0GoGHQ/CLWEU+eCQkva3Yf3RYOh0zj0ynH1rOooHckZyB9YH3UU0qQU1PFXeW5b0zMXZAlMln/p93BI+NvZGtSTSMOH84CYr9nyO0h6GcV3kK0YUZSij3/TiKoWMAfl2LIV0Hasid7zZbqs/KZeTHMu+g6+en+Ni61hHwq7pfCUtiilst6XxfsEowzdYCYiiIqHHPBEizF5onpV23eyfRFiul9ozGcK+oas2Bv8Csc95x9hlw5JPCA3krkO7X+1rsGAUEyFwYK5lMhq/vvionKgpwjWIiqnPT5eO29J/WIu+P4aXkTBEthAfBz9hmuhgLp0swG8T8yTmfDhx9n5+MIwNc92lyNxPh2a6g/0ORlvMYmodCZf0h8iK/7eACyJbyBUi/vSp/4cJ11kfFQjInv72EXs4IMKxBonIdptSvcDhX36owvxYocn8O2mnBrZfxl2uWWaCEh2Av6uJKEF17AVQwEzUjSJJNKWNeId3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(39850400004)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(8676002)(8936002)(5660300002)(83380400001)(66556008)(66946007)(66476007)(2906002)(6666004)(478600001)(6486002)(41300700001)(316002)(6916009)(6506007)(2616005)(52116002)(1076003)(26005)(9686003)(6512007)(36756003)(38350700005)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lx5Vry/qu2ys3c1uvRf5U3pWbub25pvbrxG0es8MhsVWU4+J1oVvyLkZB7ud?=
 =?us-ascii?Q?pXkNqtE6Ja3pu0WCSdWqahL38N0Ikh1FNwYp++434vnYu3gdiiAXZRTu1xRk?=
 =?us-ascii?Q?ihowJYwi5CeFwJeIzKWkDwJITSECbGW75S5qjo3XhOzE1bdj7u54JYsgqcYY?=
 =?us-ascii?Q?XPO9MQI67ED+nUS1trTBCe8KcGTtwHzYkPO2nr3P7O6kBYk9SK3VNk8+aiMN?=
 =?us-ascii?Q?cyTm121rMtJlfc2bRgCkzNB0MzDJLra4EIsb6A2jVDkCBu8lGIzWJm/YYTl6?=
 =?us-ascii?Q?BP6qBk6s8zWo5D2iWE192SKChzB2CwVoh1ADh+DhJOJQnAzMqcLzau1NfT9B?=
 =?us-ascii?Q?EC3cBklmXs+jHQAinrlnMNhlQM9DdD+0xITbvX7Bm9KIyz58WMY6iFrxFBgo?=
 =?us-ascii?Q?Hhe04CBgfFiC5VlKekW7A0oPO5ivFPkzaAvOiTSmoopDrbHU7PZNuxE0z/vD?=
 =?us-ascii?Q?+zvBpkZG2/9oSRBZzpCavc27C76dkAwBKBZ2L4F5eXqIN+UMkJV8gjv5nEQk?=
 =?us-ascii?Q?9WxQX/G6EN5jSdVZD62mAueIkXgxEi2bHE9gp8t9z9Ogu2qT1k0YZZepvrZQ?=
 =?us-ascii?Q?n7nSCExejWchVr9FCxRusYsqhl/OWTj7iw2fewWvUXYmquCvG49EFXQB6Kdt?=
 =?us-ascii?Q?v4PSWDg+hEfwc++Uc6KgK1aniob68fzJge7qKzHzhwwJnbTqybq6LvnVCnLk?=
 =?us-ascii?Q?7tG0tsUaqrETCz/os/OZz83T1ZsaO9jR5YaZyqaz97PguGPaV5lEd/OM5ess?=
 =?us-ascii?Q?KKhiSnX76ny3+tQTcTFz9zkZ/v+cliqw0sfu4f1Ye+4EYDoCWzy8c1yWKxfs?=
 =?us-ascii?Q?XnNwTc3l4tnRvUgfMXVFineYzAqVwfFpdp+HTrWQKlLyjrnkuk3vDQA4L4MF?=
 =?us-ascii?Q?L7VBmcMFFlmNQKnbkNokM1oIrp7p9MVKNxbLUadGYn3e8PlCy5ieXV2Je/Uh?=
 =?us-ascii?Q?+HM+IizSKk9TWwYNnRAEVTID2kmXz00ZT4VxTQa49vag2giClcekZk6uTn/2?=
 =?us-ascii?Q?WRBLczbinPBiqLg1Hk/2JBZabQ+IRWJ9tXcU6tb8SJTUNd+8/k00PNUZu3pY?=
 =?us-ascii?Q?9NBoR4kMUqApOig2vkWXRF3KNec6GrmikKa11H9ZksFitmvZMeKf7/uAI53a?=
 =?us-ascii?Q?a/1CPRG9Xzp1wH59rnm2KiGF/GQhJFpes66g+5X4W4O6YTt4WgcVFnjvBLdb?=
 =?us-ascii?Q?PdoNLAUCin2Tue416nrPcc5F97QW+1Ddc/Obz7/th4AEXqkR+ri1GM7Wnhqr?=
 =?us-ascii?Q?Mos2AK+Z7s7fKVj7xdo2hlHrO50hHSgniv6SK3X0yqpMOw7FjANkO8BGPVZi?=
 =?us-ascii?Q?vXoI3humvHBAciiEPm4fOZ2SI5isy5uPmDba0P0SgsUsFjpToiyHIfiIVVhc?=
 =?us-ascii?Q?7epRa58GWTrpghwhcNEs1x3A2se7ENWkqwIak0eSt3N2jGMfOzvj/9diqoZR?=
 =?us-ascii?Q?7/V1ksZnYB2VOdD59u0EsmtZCXiqTvW+C0vY+TNBPXsgKZ/qwk9mIL2wLk9h?=
 =?us-ascii?Q?3AMlN/JEX36dVyt1waKBOayJdTmIfSc6XbZ/LMr4DwmQ52twFRbpcIDk1Szm?=
 =?us-ascii?Q?1wou6tKPTs6+E481HX1JMual1QvsTUKNgwJGoG/Z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c9362f-f0ed-496c-fb5b-08dbdab754b6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 08:48:33.9374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3puOphmfDwkWQZnDjb/7VwFY2fwTEhTeyhWRzcPfedSn7HmhUGhHo6iKK8ipGzQe9K3GWPzugkPZUC2w1BuqUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
X-Proofpoint-ORIG-GUID: IN7yPGDD0ijmFKdSxeAYP28nXhNLX6uK
X-Proofpoint-GUID: IN7yPGDD0ijmFKdSxeAYP28nXhNLX6uK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_06,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=605 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311010073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 08:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189898

From: Chen Qi <Qi.Chen@windriver.com>

The DynamicUser needs libnss-systemd to be installed to function
well. The tweaks to nsswitch.conf should be conditional on PACKAGECONFIG
values.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index ef29116bf9..b3066b7c42 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -179,7 +179,7 @@ PACKAGECONFIG[microhttpd] = "-Dmicrohttpd=true,-Dmicrohttpd=false,libmicrohttpd"
 PACKAGECONFIG[myhostname] = "-Dnss-myhostname=true,-Dnss-myhostname=false,,libnss-myhostname"
 PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
 PACKAGECONFIG[no-dns-fallback] = "-Ddns-servers="
-PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
+PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false,,libnss-systemd"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
 PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
@@ -839,15 +839,31 @@ ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
 pkg_postinst:${PN}:libc-glibc () {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'myhostname', 'true', 'false', d)}; then
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
-		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
-		-i $D${sysconfdir}/nsswitch.conf
+	    -e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
+	    -i $D${sysconfdir}/nsswitch.conf
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'nss', 'true', 'false', d)}; then
+	sed -e 's#\(^passwd:.*\)#\1 systemd#' \
+	    -e 's#\(^group:.*\)#\1 systemd#' \
+	    -e 's#\(^shadow:.*\)#\1 systemd#' \
+	    -i $D${sysconfdir}/nsswitch.conf
+    fi
 }
 
 pkg_prerm:${PN}:libc-glibc () {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'myhostname', 'true', 'false', d)}; then
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e '/^hosts:/s/\s*myhostname//' \
 		-i $D${sysconfdir}/nsswitch.conf
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'nss', 'true', 'false', d)}; then
+	sed -e '/^passwd:/s#\s*systemd##' \
+	    -e '/^group:/s#\s*systemd##' \
+	    -e '/^shadow:/s#\s*systemd##' \
+	    -i $D${sysconfdir}/nsswitch.conf
+    fi
 }
 
 PACKAGE_WRITE_DEPS += "qemu-native"
-- 
2.42.0


