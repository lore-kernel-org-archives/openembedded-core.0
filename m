Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A038C369D4
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:12:58 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.102.160.18])
 by mx.groups.io with SMTP id smtpd.web11.9779.1744898735099865308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 07:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=HfeFOIgI;
 spf=pass (domain: nxp.com, ip: 52.102.160.18, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8ErEGX6qHrIqDGSTzGi7I4SM2wAMCZ/VHojEWVyq85XynSFHOaYBMTnkahLmh+oAd35CVswWJ5SW4YJNtcjtBvsCNLFNUoeRvx5LrNOwCqp/srhfL0qFT/HSKwCb4dV3BrohsENhzN5L+FGLldHG+fCmA6VNNTorxSP8vB3Yvq4LZnkaTUZ7n6jcCR2RLpz7bndMbgrI56Tc1kqju6NR7SuXBX6a8h6DRfwscS12sBzNjx5odhlVABDkKLLX30gt6UpAk7B1KHMXwgohu8RfspmR7d9RA+xK04lO9ev5dsYXW8bcRXMvVD+ussVnuXdo6IrhS7mv6FEJzKQYSTauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cm2u9ijYeea1Vvol5NiylbJNEw/kAt+mo2Aq0D9zgJU=;
 b=D3EjlTQa+ntrC/SwS2wdvX3em59RorVVh2q0plFHjQQeTO10otwwX2yOGWoB8y2wnTXBZFDIU/VUdQsxOiul1//yGviOP8Figez3lrWQ1nwCrI1NhQ6oh0MFuGG2XMObSj9G40g+tePPQORJn/TrFQUo7uTPRtgKjGVYUMcg9T9pftfaFh8AUtrYUWZQmgEfViwWMi6tSUYSIqxGhBsMGtKgxQ4Eq3d0H9z0xMiOsAZTki1QoTHElIxcUZzahVkL/ZDGFa4lPsKtahTZfaTAxGG2YhUluoEGIdWqPPmns7KQjb/MR345IeNgS/N0jEfJTUxwS6AfWZRtOKp8a+M1Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=none; dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cm2u9ijYeea1Vvol5NiylbJNEw/kAt+mo2Aq0D9zgJU=;
 b=HfeFOIgIkvgwAHuSLV8fzJOSH0rjHXAy20ZGMY4TP/uYPlJu78dXtLkAFzl5xXzwqN9povu/DNLZtfNck4rw1qdxFa4tky/DJYvLM+CB4rRym2cIANLDA4vb75C/NW9zglhJUDhF/PGkdcpfe1DlTHDoCWD5OF9StrXtBC5g982nQFpmvRS0rFaliik4tZJe6b+oopgm3tsYPiVN1krN3l9w9HhS3e5qz1svqy1V+0LrBavrTI+TMpuKVklajPK0ZT05mMuTUw4Oe+qKnWVOd8ndZfID0jJqjLRRBnRCTbM+QpCwl7toTE08sa3xjWsBCfkSIekYvvm88j+fZcDyJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8349.eurprd04.prod.outlook.com (2603:10a6:102:1bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 14:05:31 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 14:05:31 +0000
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v8 1/7] meson: Allow user to override setup command options
Date: Thu, 17 Apr 2025 09:05:12 -0500
Message-Id: <20250417140518.1720796-1-user@yb20>
X-Mailer: git-send-email 2.34.1
From: 
X-ClientProxiedBy: BY5PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:180::35) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c7ceb8-bc4b-4fa2-e9e3-08dd7db8ea4b
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|366016|52116014|376014|38350700014|1557600111;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IynulMwNKqm0sOIVtRh5ZdRofjKYF1RNl5GVABzTHQBgvXCQkcN91Fz2SCb4?=
 =?us-ascii?Q?otKE2Du/TWXBAD9EWnGnNcBgd474QPk+hjxYtRXZay9kRKFGUthP458fE75v?=
 =?us-ascii?Q?ITAKPCfpnGqws3FoycUcbqW1w7jxWMdexaNuAXgUP3FrgqZXT9lISCBk7OeI?=
 =?us-ascii?Q?mRFrbX2lfjD4xjcXLZF/yWIeFNc2MF4T0g8csPLGg5TDPmQVkJ6M19SrzbT1?=
 =?us-ascii?Q?QC2YrMbczFCqSs2C84hdSoT7+Asn72v4+XRAk6f3jyjSvnAfFw3jjf0XmFlN?=
 =?us-ascii?Q?SgvxSJr9q1Z4E1AI7VYqdXxSxwu1XVMr4qESIWUXYwtWbajD1GGhWBhHlNHK?=
 =?us-ascii?Q?s10wHTY2y4lH8+l7GUjiPzFjK9bSk8CfvuhJfeHD3UituelBRAhsQlDpwrdb?=
 =?us-ascii?Q?MQtinILelxhsoAlhHvNWrGzWlUqGN8k62QfyJbVPa7ylb6LaSNnpE6BUd61n?=
 =?us-ascii?Q?lJ0WvpYd1ZCU2XUbFBWCtmmay4mDLsyPsN6nAtgKus7ybFAFjFSIG7l37yfm?=
 =?us-ascii?Q?mz4YQSyCJaqW82r80h//rZldvMBmjTv0Cx2GWGPIDAGaewqathfKX+tlDFNE?=
 =?us-ascii?Q?vgRHgBD3pykSXAA2ZQOy33l9W6fAWJcnGLXqv1KuF7lGAkYvQabcpVIGzb1s?=
 =?us-ascii?Q?hMLB/ZNEegaOSk74s+d//w2ziBKmOWbWZGbF6MlY8sk0hrXmq/29M+9KrHPq?=
 =?us-ascii?Q?NBS0emV9p5TQuCFcqdFI0iRDUX0l0Jpj0rSIlT/fNwJqQYSAkCrV14QOtQ/G?=
 =?us-ascii?Q?XGO3jCBqw3iSlWDsHFsZKWcp70eUY+o2x6BNjIh1unbWl4LNSZeaq/Gi88hB?=
 =?us-ascii?Q?lS0xEuNFm/ixPZ1v0M3+JkO0HMVMpV0x+8YyCc195VD+bZ0nVPmI9n5dg8wd?=
 =?us-ascii?Q?wJ1YQ36y4EKsfne+A34hQWrLfcMaWvjeqIas+sABo/cjQy66JP33wcuHR7QV?=
 =?us-ascii?Q?5KnreCZBoW/b70UyRkfo8dNj87vLZm2MRrH1PUqZ9ZlJ4xtEwTeH9EQvhNrR?=
 =?us-ascii?Q?Z1bgOfFsq+7Unk/olG73NxVnZjVQtM55W3IayoM+o3/durnzasPiLkDOi4NP?=
 =?us-ascii?Q?XM0N5LatJFWkdILscVVIciAdaFcNMWyZ97nOgbNulDztgt4ynq1wgjtPFCqF?=
 =?us-ascii?Q?ZpiZs0alXWx3y89WWY+joYwYFcd21u9EHtr/drTjYOZtXBtkK9EgLIyv0Fl0?=
 =?us-ascii?Q?8Pb43Dzzzzsl7PBT+4OpQL3LsbYM++gKssgEq+QmfmHy6JUwaspc6oUxyidu?=
 =?us-ascii?Q?qnu7tPze+IuBUt+Lejk/CjFo9YjPYH4VTiJ9ClG/b8l7lmmizu379NJ8YKoR?=
 =?us-ascii?Q?u1UPQJz32MtGGh7HSP9IIta7hAXnJRvvMewpgq9PRa1e08UoJ5Y/B440slUF?=
 =?us-ascii?Q?kaDTNHH0AeSTkaacBddGxcmWleWOc3NHH62LaUt51KJSn19nZm7aGrfXn3Ux?=
 =?us-ascii?Q?524tYzKr2Nk71PgfIzCRQRgwmXz+qB/JlVKNFHNRVGWfZ3WIVyh0ndKwpv+7?=
 =?us-ascii?Q?TyWTNcErBQj9Ki+dUL7IP0qB3i0PdVkC5sEOpnCdsgsPvDy19TzoQwr+hZDz?=
 =?us-ascii?Q?dIztp3RasfQ5LK8lY3R3lYoPYjMA4eVOTJnQ+hPRpu3Ac67VjBXzFtZGWRaT?=
 =?us-ascii?Q?HAb8yT46gy4YNycdcUaNMWSxAanQ4C2JvHuGicP6YwL5r0guABid1FD4JGU7?=
 =?us-ascii?Q?ilxilDvNk/qw8VZ5TxydXnuzE2LDvwj1GoDCyXwpwV9xdpRZIMUHAcejLjmr?=
 =?us-ascii?Q?49FN2+0/uhztvSpSLQB+deL6CNSFGcskmTtsFA8PKeDjsIwc1m6F6CoV2tbW?=
 =?us-ascii?Q?3zcDTpRpoGQp58C17zWllAKA++50a4bcQkOgII6w3d4IGWKRdhirTfubOE4G?=
 =?us-ascii?Q?q5DZSFJv0aEHRJgvlnVwLTr8+/E4UNWZR9cqR5ZRrHkFEqVTPBjrXzVtpphd?=
 =?us-ascii?Q?+PAAgILT/rbaY91Q6XXh1l/GBlwuyzEDsIC0799uPEAKkQMPJf6rtxAJxg/8?=
 =?us-ascii?Q?UX39?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:6;SRV:;IPV:NLI;SFV:SPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(61400799027)(366016)(52116014)(376014)(38350700014)(1557600111);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1HLD+JyN4upBNxkORpHIxwOEFSTLHFZcDLwvWVcdFkaac4w1m8T1o1AdURj8?=
 =?us-ascii?Q?LFkr0HDpbrK2dQKyTv2vkJEKC5VOjPLEU1Dkaj+gn4xAIe3MTVysp4Xoa2n9?=
 =?us-ascii?Q?kSNH6a2SsDCku+lrsv0DBSDf5Xunakr7o0AJRXYkNT3hmxtFnOXOTgbFO/Ba?=
 =?us-ascii?Q?dOlBTZbbVkIoKWjXYNTUI8ojwYWe75Ms587H1cJRXXhdPtutDA1FwW9ABuc8?=
 =?us-ascii?Q?9dvHA3k6+wXliRf4qhF18rdlF7Eno+c7a87U2Fgj3VMUvezXX2q1eAQ+t/b1?=
 =?us-ascii?Q?91G86T14kMjJ0zcx0E4s8U1XfSo+u/ethXoIc3hpJjsoQJIcyTaeIqud0myq?=
 =?us-ascii?Q?EJT9qnyHRVeqFmIozdqFnaCBeGMNUTiNRjDKzNz38FjWVkBQRHU+Qsx78YZN?=
 =?us-ascii?Q?zZgjqyq+qcA2Ff5uMM4sDexg9vencC0PDhj8LVfU1dGCKw+NfVP4M7dRIt7b?=
 =?us-ascii?Q?AtTjzCzuAhSaP9/yfbCqXP+OmftS3K3s2QLU9DWYAK1zgHyyGwSiwzXZP4UU?=
 =?us-ascii?Q?hDUMPeAq++l1h/1fRK/vPmlGlxBMljk5iivVcW+zr/XZOdh5o7ErSXmU7fKs?=
 =?us-ascii?Q?gcsRU65IS6oYJaUsvI84nnAzcJq6SmQS5JVz3YWgnu1iDLEAlDekTNM4Fsna?=
 =?us-ascii?Q?Q5k2HqW1kYHSo4ipxk1k9k2pS/BS5M9E+hTkCWFe8NSqq3G4lQu+Gh4jmLa9?=
 =?us-ascii?Q?Idy+IIsYfSHjDwLaOh9wF3680Ti//L1ahxrypbI5vfoPZW0SuwVxcKlBqFGP?=
 =?us-ascii?Q?wQFg9vNKXuOkdE4XMZtS4j0GgrfxtJ8DgdaSEAOK8dQijAPIkkoa0wM+QBDL?=
 =?us-ascii?Q?U1TzCKmJ0anBomdQHFLih9k5b2r+JEL8BYUcJ2m+iVNvsZIP2nrKxU5K6SOG?=
 =?us-ascii?Q?0JTE4j44gt4FbqumrQ6rPzuNidyChwYm70goffxvuSpI2aVBCdjsUZKbm4YG?=
 =?us-ascii?Q?Oq8FC5D9MlL7kxOHQVQtGQi8gy2zoRKoBK8bVTw+CiM4fasEpHha5eDMoWde?=
 =?us-ascii?Q?PJYxhlkAdzU575NXakk2IJfmmjjozOsvDVp51cuHfcwPFvNxii1bVBFF4DBU?=
 =?us-ascii?Q?gxtFv2JVu7NeT0+66Vc1aLKhdu2xx3YcnoDT5n6jTwEnZGS5UFxEj0JcTgvT?=
 =?us-ascii?Q?PAULEJUbgzKUYekMD6d+uw1Y4WRdhcuNboidRg+rTcBAlJbUn15lyPp0x4EV?=
 =?us-ascii?Q?3XbfiIfNPjI3q863BJKvIIjPbh5kkrKuTxqLBINFK2j9S0kD+Y8ZcFjoLjhP?=
 =?us-ascii?Q?3PGuTtxxctApFMG4Ip7zdknYiLvU1wsWL1Fjalk/Mo1psQ49MXiYJJgG0iSs?=
 =?us-ascii?Q?f/mrdAcoTc780iMkS9ubHh/81+6x/8RqUjHFcDKuH1GvKSDrRNl85/93/1+U?=
 =?us-ascii?Q?wKPgtETN4WgvFYQxioqUSW+zgIOoTa1akUoBoFsN3ePlj2ube9dn8QqqKPbM?=
 =?us-ascii?Q?jRfhjbCQyrSznnp59sDPNnDUBY3mu+MpmTd1wQD8KRkEnQ1bmq14O6lrBiaq?=
 =?us-ascii?Q?u3CggmQi5iSBsU50zv6ycxeS8AfCSL5mJ6pdZ9fhLYRFHo/zwAkvxzp0libC?=
 =?us-ascii?Q?qXI1EypOxUYq1aV45W/sivfIFvFyJDIF6jYz5A+u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c7ceb8-bc4b-4fa2-e9e3-08dd7db8ea4b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:05:31.6914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoszYkwxNvwKgngySjqRggNYWiwtTvYPBD1A+E65dE7+1NXxTgHkX9CGD3+aveogOi/tEanIcp2Podk15p0TKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8349
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 14:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215091

Caution: This is an external email. Please take care when clicking links or=
 opening attachments. When in doubt, report the message using the 'Report t=
his email' button


From: Tom Hochstein <tom.hochstein@oss.nxp.com>

The user cannot override the setup command options --cross-file and
--native-file because the meson-wrapper places these options on the
command line after the user options. This problem was noticed when
trying to build with an SDK using a custom cross-file.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/meson/meson/meson-wrapper | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes=
-devtools/meson/meson/meson-wrapper
index 7455985297..3aa1a93520 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -14,8 +14,14 @@ fi
 unset CC CXX CPP LD AR NM STRIP

 case "$1" in
-setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewrite=
|compile|devenv|env2mfile|help) MESON_CMD=3D"$1" ;;
-*) echo meson-wrapper: Implicit setup command assumed; MESON_CMD=3Dsetup ;=
;
+setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewrite=
|compile|devenv|env2mfile|help)
+    MESON_CMD=3D"$1"
+    shift
+    ;;
+*)
+    MESON_CMD=3Dsetup
+    echo meson-wrapper: Implicit setup command assumed
+    ;;
 esac

 if [ "$MESON_CMD" =3D "setup" ]; then
@@ -27,5 +33,6 @@ if [ "$MESON_CMD" =3D "setup" ]; then
 fi

 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
-    "$@" \
-    $MESON_SETUP_OPTS
+    $MESON_CMD \
+    $MESON_SETUP_OPTS \
+    "$@"
--
2.34.1


