Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E7ACD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:30:03 +0000 (UTC)
Received: from mx-relay83-hz1-if1.hornetsecurity.com (mx-relay83-hz1-if1.hornetsecurity.com [94.100.128.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7382.1779265799051874094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=ODirUnrO;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.93, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate83-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=40.107.162.98, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=pa4pr04cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qNRVuheOTjDy8CS4KixAT8nvd/nZyqYsCxLV+jWeuh4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779265797;
 b=M271oGiBb+89gC6WafxIsTzUgCA2lnUAbzyV7KdzgOZ94BKfQQ9pR5TZHd4HqGYabnaXOnN+
 sCURUF/9PMEMwcpIat1xfwALEZMNVpJ0jduwZrYtFKY8lT2TzcLhTPDsn256ypTWd5bDk2oFcTs
 juKXDBCuIbSWtzlWTukJcCybDnWJLnUOWZ/+zoPcWuxCcp20llbyYbPNU22rR+AQmHGyWW2znCB
 WtmhTgO9RoYufcgs1/UtyzxLgo1mbgv3ZkLWs6djlWo5P+axDZit9TE7jtRHDrWdAps/LenzYS7
 K7fZt/6m3bp2zwkOdRU9BA1DGp9jBF7ZRSdf4ZPLUVoig==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779265797;
 b=aqakQk1TOJ0d2ceFCoClMLbXhxtQi1/QlH4ZAErKoVeh71Slrqz07Pwzg5eM3i3CTrD0J1E1
 2WAyTCOhOq6uCtGBtMB9l2D44qgAEY1fScXhBkVmauuG7XW4Li3Hkhl11cKtfpP4D61cmJTGCkZ
 BuvffOMQcZHdbwYQltsvBmENcl9i8qcMO4qHR+6FtO3UQOXPTDf/JNWLdL98jppwbnk3Vu+v6dn
 kQjADHIcodh+evHuKXcixtKQM6XzKGXVnjkMqiQFhjjErmdeq4UlyBbN6qMJ1B6pWg8MB+7+Uk8
 C9zTdv+c9NS+suYgpZEq1b9vENdDj5uomBTrZDxiFpB/A==
Received: from mail-francecentralazon11023098.outbound.protection.outlook.com ([40.107.162.98]) by mx-gate83-hz1;
 Wed, 20 May 2026 10:29:57 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4ZgdjVwuOssIE0HjSSbz8/SI4D9Wi2xxPQHpqKIWYOdhxhB1OQwtZ5ieE6FwY77vvv3PpmRX7wcc1rx9JQ7tFP534tXE+PAOdb88pdqWq1hXNZCHuGNU/AU7kkehPoWIizsrZdNvFrXDYRmxecup2kb0LTnVNBYdEBDvscEyA/qt3YPkZWb5P7v4b37cIpvr4nHdKRHGv+ocbB1ozTcNHe5Ob767fXYgmVc+T3It7Lq6HBLjuJlPZNmo+/Qj0xTlifqu02sg873KkN1AnIfP7KpdqT2h1fWeMKT9hxepQBY+jdvpTrNa+ELIzmROLxRrO2bu2WkOzM/mJABSDRvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNRVuheOTjDy8CS4KixAT8nvd/nZyqYsCxLV+jWeuh4=;
 b=eHPgzy2WgoBTPobr8Nit7LFbQlRY7L/plmeKTrWqPJ2LZBsf72m2q0799+Y6Bw5R4naBH+RuS+ofiMBcNP66Db4nWh/tSzvumS+jWiGZAxcN8GzIUMd5KSw27s6yskV7Qh8/2BiuFGsokddplouL/v8pQl17PWN6GxPTRhThEANuGO5pl43mjVDAeHGUbKIJg57rj1/M+fsrU7YxO+SuQkwsqHQFF74v1i0R50XeBMYntwOdsPLa7P4lNYobjWS8henTcEJ2nDqTnK+CoY9UUwaar+77bwzNHbs5o6U5gBtG/eV/HrkX54CqeXmhvt3xGeCNP3L8jUaKlhmC4TZYVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNRVuheOTjDy8CS4KixAT8nvd/nZyqYsCxLV+jWeuh4=;
 b=ODirUnrOHTujpdVUgbfqkYXjA+bYf4iaCE7rdIPBFcxhmhjZRnQWvFD9h1A+R/kXBrK8dai/XJlpYiQUIUP8Pt83ikTa/wiI2M7Y1u80VpRjD/CAnORzD7lpmIk9dNONs8oIww2RFFYmwFhZi06xL8kHymqifZ9HeeKH0pTa4h813eIDMP6X/7RO1XZYf3xlR9XTEtId2aDq54II9uxuPIw+p2XT+AXHGdm+bxgFtwOpfKMCxAj2yMXgQbWPgROeMB+JYTtnC5lPUJGP3VYuiHqKsg7lAgiFUJEk6/fzVtetIi/lhfLYdy+k67Tg7b7ZqxSi4MIC4JFHSS6QnkyasQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PA1P192MB3056.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:4e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 08:29:52 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 08:29:51 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 2/3] openssh: patch CVE-2026-35387
Date: Wed, 20 May 2026 10:29:31 +0200
Message-ID: <20260520082932.1979208-2-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520082932.1979208-1-tgaige.opensource@witekio.com>
References: <20260520082932.1979208-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0005.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::10) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|PA1P192MB3056:EE_
X-MS-Office365-Filtering-Correlation-Id: edd6bc17-8db5-46be-75f3-08deb649f680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|18002099003|13003099007|29003799003|12006099003|22082099003|56012099003|25016099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	dcUZd97fNVdo/z6OVX6ZTAj3b4ssmFuLHRzZLV+vbdc+Kml9C0PewebEV25aTaJ6iMHDRfszySMyEAsErH3ZoFyCV/DlKH3pBbZpU7nKgpi5dgDslDXZCuRIZzvdvBnoDjcBaOog1MiC40QHBYDpa5queN2QYeBNE7ETBCFUvlkaUbU0KZjH49fI9pqdnSa+SrT4zRPR5Rvo/Ks40VHgrEaZmUIjudAz/zJNBpy2if27rtRRWuKHxxQj5r4ktfh1ou/+VhaWsbDsthmnKLfRu99pX+5itP8sPZkEcrzsUItlLwpmZ4zf7rmYssoKCC1FQ9O6fdHxMkrwOr2jYRYZFO32IFRJjSSSlTj+mFzte6zFmCJ7044fppkd0oi87QODH5+pMjmWpo+4CK7hk4Fvv9CrkLZ1aRozUteiXQIaO07uo7tFm8h3QIzYEGrcCKbNd46Z+DHgRpWq3wIv4h54x3oC7jfcoTa2D0rGBxCRm+BUleUe4vYFY+h/T0IKHxNI0OhW68jSQAodqRzJF8x5xUP4GhtqvxPyWU7hfHTmQZqLivLb3fzfv4wf3tvsNPajNEq5OWuH+GWZqQcN5VPSmh1HjlmMHTgjjyiws/oj/YCzVwtYuRFrAC56VW3frxk/Pw52LQw55qAVRx0+78FM4DoyMg3rg6fb+qC/IGKDLFrsqtFMgm+0hyiwjsp2SVRPy1wLeMeOT1qCSPqpvu1mjw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(18002099003)(13003099007)(29003799003)(12006099003)(22082099003)(56012099003)(25016099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?knBVAJF7q8hbUgIuLiJxVQtFaTaKlTW5cWq9rBtDh+ZYU8RonHVSk+YgRdqd?=
 =?us-ascii?Q?yL+jRcrvub9MTAGjjwa3fmiY/wVKvWigiN5ZOQ3VhNeSvlLFgFfZSP+Lsr9V?=
 =?us-ascii?Q?roEnKnj3aHUGn/xxzZEcU1tJ58DYDFPApKErQwEH/ewOTM5N8QAhWv5yAq1Z?=
 =?us-ascii?Q?NHT5eUH85HLdDzbs31sA6f9FN3bI4bW/1gJ9nmFN4pSPPaRv9pneHmO59Z5q?=
 =?us-ascii?Q?2zASUpEjz61JqFbq33T2vvvgfZusi2LmUFrqg3wl+FYY5ofWbX1MPAG9gAOf?=
 =?us-ascii?Q?U1bFWs1YGldc7R5uZdMdFjO+eb0vyaBpa569BL/ul+IUnVrSK2eid8W9ekjU?=
 =?us-ascii?Q?LRAxk8kmO2fCu9OPCACh5Jmbflx7qdTkweW4CjkBDjaNKFciadOgS/UczxSp?=
 =?us-ascii?Q?PmUcSYsdVuZTmS32FON/RTUqWaYwLCEnKTIb42OMe07cKJHeXfxQahO+obb6?=
 =?us-ascii?Q?weBTvYh6fqGvOwyASQwK4Jkrns4P8KGNuoEac6XTeXeKqMxu2p3/wCxPkbmN?=
 =?us-ascii?Q?BI3FOOA4zEgGMkO0jyro0mHBp/c0tfc3wXqY+pqIDYpnne9XS1B+zw6nEPrS?=
 =?us-ascii?Q?xXY35pXNWkhQW6cekgr+VNs0Swpp3hYRIhrwGWRUEV+wAFyh//gE6vsVc5xH?=
 =?us-ascii?Q?n5ZIY0bP4jLdoLziqE6W9FOoNLZCrwORyWMsIoDqlP9kTBgux9G1Q/LtaWoz?=
 =?us-ascii?Q?KKT2DD2+zkzAV6vf8uEprtQYzULG/XIRKp6TPaF6vnNmlMj90bBfbQY3iy3j?=
 =?us-ascii?Q?sjcC4rocchgc3+Cm7f2Pg5bZ0462LpJS1OUdhP8BE+ZZ3IcTvK/+x863us1u?=
 =?us-ascii?Q?SbNPEKgnWRj3NX6fIOAnjFc8U0cyBm66nglBY0rmav/kKCTJwGDK/lAF/VA3?=
 =?us-ascii?Q?kXhVRjIPsow91+OrpD2yoTK/8uch0qjZRZ7XelSwHeN4VEYYdHNJKMUiktzv?=
 =?us-ascii?Q?yQch4JxLpYTlCj4CxCjCJ9PwHUnklJl68vE/JEj4j9Kuk6XUx1rNrNI7qbf/?=
 =?us-ascii?Q?SsyNm4vhQ3YDf4z/SXYT0ePyFPethsQfSXDOJ2NPNDnXG4xszX4SdbG7Df5M?=
 =?us-ascii?Q?Ndd564M8OLfbB1g8hcichONHudZDPjdiD7t7vCWuyFBrU2eunM/jY6mpYW+A?=
 =?us-ascii?Q?70c/qQFfkWofUyZc5yW3v6YCAF2RfFpQ7JXPivz06tznNDIXK+WOVHdzc7a0?=
 =?us-ascii?Q?QmfveW10zw2QtDKqRvm0Rjh5cbQYiyEgvKX87ersYg1JuQV5UHpsUqBd+hua?=
 =?us-ascii?Q?hhHHNEk9t1uTDvMNn7+ecZU8Ctue+zz6oT+baOpjgUScztpM4mOOTQklsVne?=
 =?us-ascii?Q?1T/FcT/7PKaeG6OIAuxXrKIlUJw6P80zMXnZblNdbvJrptixoJAuOziUC1sI?=
 =?us-ascii?Q?LkiPVH9f581B5f/KAlqNbp1m0zT8LWVwm7p3cxl0AqrTTlaZ8hPWuVWl6OG7?=
 =?us-ascii?Q?jzZL4STUhk3O+w0SJkm4UKHHovP1wFsy46DnKRDuSts2uQbeU8SBBOhqtg5u?=
 =?us-ascii?Q?Tx5D+/TuamDERqGO7Qbn2uiebZPSJHNOYuOUOoo1dMRxr1zeOxaZM5qS82l0?=
 =?us-ascii?Q?Ln1Nx6TYn91PyLO2TfKVKFpnmCW0Mz8aU5hEOgHPhneJGoUjX9S3Lazisn6H?=
 =?us-ascii?Q?YZF7fJvF4lNSGKeU4uH31TyPEi6q3p8+v2ZE6yGQy9Im6btNUeUWMGADY3L2?=
 =?us-ascii?Q?K+lJIOlGjSZBOH7YVr3zrsJ0VsargoIQDzZ4Lij/Rz1L4414Gu3e/qNddfWT?=
 =?us-ascii?Q?ScozYC/xDA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Xo440vXu1NxALvYlGTJsuByrgjJrpRFiRdkKdQGJUHgL0NKkEXoJk0vZSd/wK00r6/kSYUArKkQIdgej6pbe/mBrBM+fYIgd4JT7qSapp9cEPs9yCH6OrEM9dS4O3wpkTjk+0fsfHeBVvRqEFPx/z+RKAIhQYMNMKENYzoP+9pO0kZxqIuUQ/oYfvhKdd0ACRVfxcJp0nXveJiGhb09CceFeXe1TGrvpre53fCcs/wfwSsgCQDEDoqMYgkSD3m40YJNopeJYfljJ6hgcaa8zg51G5teOdAMMJjKXljfwbt6VSQzy2xsBhb7jQjrKFvj7Tltk5lJEKCx5N9SyKidbSQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	jWONXCeP4b+NMGXB9K7uVqddhoGzz8J/bZ7d8XsRaQgmNs9M3u+lBshmG/8Jb2hKfQwPSVqqz4xPsHQYdZhRbyUNWsoZ7zwccfT2eSdpIFHCEBKemYd8qgT/77egJRz3UTjDj4mswLwL1qdcT4ruRbL4NmBrUNdCyBl2A9Pmex7GLd2pgkTBIf/+Ia8COR9+3rNUjwBxRfk1D9QBDJxM1Oh0bDHkCZtfheMGmi1KzznQDoMHz3cHk/f3wGA3t2n6eNPyaOPe/wj+nSMGESWeIMpi6P6ngSvbl1VECvH67HlQlOX7PxMaOr/auEiZtGgt1CVOSCvY+HIH9Ml6cwg2dC5CceA/sOF3e9qlIykna003gxeVVik5Uno/lZKb+UXamBVXhktQLghDCf1WlipYOW0dwE8dKa9JUVrUBADORvGgZ9g8+Jg8zvf7Waja1oFfA4t9jzxI2R5WGIi0FsEjQq5aljh3VNcPi2TOie+BEEuwNaxlODLaHQmPsZ/eSORJDyMzEDP5bAPvBsvSlYK/EHY12UG9flnHaFsGATyIj6KqkXHrcCINCHwBfSczY8wEcA8s+mTs8y27UajwcNMvv4u9QTfYfDhDuWHQ8HXcfAP3Q9bsDiNnbRtVnUrxA5XR
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd6bc17-8db5-46be-75f3-08deb649f680
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:29:51.8772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoC+6veJD9kpRdbpbu2IphkeoE50Drn/BIgmus0t9iVcvpT5XT0dFPTZh7eMLCDRUoookAbaHS2QLpd1JY6hCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P192MB3056
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate83-hz1 with 4gL4Ts2fK1z2Mc3B
X-cloud-security-connect: mail-francecentralazon11023098.outbound.protection.outlook.com[40.107.162.98], TLS=1, IP=40.107.162.98
X-cloud-security-Digest: 9ff4891eadd9dcbfc861387167219457
X-cloud-security: scantime:1.108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237429

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1] matching CVE description in [2] and change described
in release note [3].

[1] https://github.com/openssh/openssh-portable/commit/fd1c7e131f331942d20f42f31e79912d570081fa

[2] https://security-tracker.debian.org/tracker/CVE-2026-35387

[3] https://www.openssh.org/releasenotes.html#10.3p1

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 .../openssh/openssh/CVE-2026-35387.patch      | 205 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
new file mode 100644
index 0000000000..c4806bd993
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
@@ -0,0 +1,205 @@
+From faaf123656513f16994853379c388ad8cc850f8c Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:48:13 +0000
+Subject: [PATCH] upstream: correctly match ECDSA signature algorithms against
+
+algorithm allowlists: HostKeyAlgorithms, PubkeyAcceptedAlgorithms and
+HostbasedAcceptedAlgorithms.
+
+Previously, if any ECDSA type (say "ecdsa-sha2-nistp521") was
+present in one of these lists, then all ECDSA algorithms would
+be permitted.
+
+Reported by Christos Papakonstantinou of Cantina and Spearbit.
+
+OpenBSD-Commit-ID: c790e2687c35989ae34a00e709be935c55b16a86
+
+CVE: CVE-2026-35387
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/fd1c7e131f331942d20f42f31e79912d570081fa]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ auth2-hostbased.c  |  9 +++++----
+ auth2-pubkey.c     |  9 +++++----
+ auth2-pubkeyfile.c | 26 +++++++++++++++-----------
+ sshconnect2.c      | 28 ++++++++++++++++++----------
+ 4 files changed, 43 insertions(+), 29 deletions(-)
+
+diff --git a/auth2-hostbased.c b/auth2-hostbased.c
+index 06bb464ff..02eeed3f0 100644
+--- a/auth2-hostbased.c
++++ b/auth2-hostbased.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: auth2-hostbased.c,v 1.52 2023/03/05 05:34:09 dtucker Exp $ */
++/* $OpenBSD: auth2-hostbased.c,v 1.57 2026/04/02 07:48:13 djm Exp $ */
+ /*
+  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
+  *
+@@ -95,9 +95,10 @@ userauth_hostbased(struct ssh *ssh, const char *method)
+ 		error_f("cannot decode key: %s", pkalg);
+ 		goto done;
+ 	}
+-	if (key->type != pktype) {
+-		error_f("type mismatch for decoded key "
+-		    "(received %d, expected %d)", key->type, pktype);
++	if (key->type != pktype || (sshkey_type_plain(pktype) == KEY_ECDSA &&
++	    sshkey_ecdsa_nid_from_name(pkalg) != key->ecdsa_nid)) {
++		error_f("key type mismatch for decoded key "
++		    "(received %s, expected %s)", sshkey_ssh_name(key), pkalg);
+ 		goto done;
+ 	}
+ 	if (match_pattern_list(pkalg, options.hostbased_accepted_algos, 0) != 1) {
+diff --git a/auth2-pubkey.c b/auth2-pubkey.c
+index 3f49e1df3..1e07ff74e 100644
+--- a/auth2-pubkey.c
++++ b/auth2-pubkey.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: auth2-pubkey.c,v 1.119 2023/07/27 22:25:17 djm Exp $ */
++/* $OpenBSD: auth2-pubkey.c,v 1.126 2026/04/02 07:48:13 djm Exp $ */
+ /*
+  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
+  * Copyright (c) 2010 Damien Miller.  All rights reserved.
+@@ -148,9 +148,10 @@ userauth_pubkey(struct ssh *ssh, const char *method)
+ 		error_f("cannot decode key: %s", pkalg);
+ 		goto done;
+ 	}
+-	if (key->type != pktype) {
+-		error_f("type mismatch for decoded key "
+-		    "(received %d, expected %d)", key->type, pktype);
++	if (key->type != pktype || (sshkey_type_plain(pktype) == KEY_ECDSA &&
++	    sshkey_ecdsa_nid_from_name(pkalg) != key->ecdsa_nid)) {
++		error_f("key type mismatch for decoded key "
++		    "(received %s, expected %s)", sshkey_ssh_name(key), pkalg);
+ 		goto done;
+ 	}
+ 	if (auth2_key_already_used(authctxt, key)) {
+diff --git a/auth2-pubkeyfile.c b/auth2-pubkeyfile.c
+index 31e7481fb..869c8e055 100644
+--- a/auth2-pubkeyfile.c
++++ b/auth2-pubkeyfile.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: auth2-pubkeyfile.c,v 1.4 2023/03/05 05:34:09 dtucker Exp $ */
++/* $OpenBSD: auth2-pubkeyfile.c,v 1.8 2026/04/02 07:48:13 djm Exp $ */
+ /*
+  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
+  * Copyright (c) 2010 Damien Miller.  All rights reserved.
+@@ -50,6 +50,7 @@
+ #include "authfile.h"
+ #include "match.h"
+ #include "ssherr.h"
++#include "xmalloc.h"
+ 
+ int
+ auth_authorise_keyopts(struct passwd *pw, struct sshauthopt *opts,
+@@ -146,20 +147,23 @@ auth_authorise_keyopts(struct passwd *pw, struct sshauthopt *opts,
+ static int
+ match_principals_option(const char *principal_list, struct sshkey_cert *cert)
+ {
+-	char *result;
++	char *list, *olist, *entry;
+ 	u_int i;
+ 
+-	/* XXX percent_expand() sequences for authorized_principals? */
+-
+-	for (i = 0; i < cert->nprincipals; i++) {
+-		if ((result = match_list(cert->principals[i],
+-		    principal_list, NULL)) != NULL) {
+-			debug3("matched principal from key options \"%.100s\"",
+-			    result);
+-			free(result);
+-			return 1;
++	olist = list = xstrdup(principal_list);
++	for (;;) {
++		if ((entry = strsep(&list, ",")) == NULL || *entry == '\0')
++			break;
++		for (i = 0; i < cert->nprincipals; i++) {
++			if (strcmp(entry, cert->principals[i]) == 0) {
++				debug3("matched principal from key i"
++				    "options \"%.100s\"", entry);
++				free(olist);
++				return 1;
++			}
+ 		}
+ 	}
++	free(olist);
+ 	return 0;
+ }
+ 
+diff --git a/sshconnect2.c b/sshconnect2.c
+index a5f92f04c..a296c9b8c 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: sshconnect2.c,v 1.371 2023/12/18 14:45:49 djm Exp $ */
++/* $OpenBSD: sshconnect2.c,v 1.385 2026/04/02 07:48:13 djm Exp $ */
+ /*
+  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
+  * Copyright (c) 2008 Damien Miller.  All rights reserved.
+@@ -91,6 +91,7 @@ extern Options options;
+ static char *xxx_host;
+ static struct sockaddr *xxx_hostaddr;
+ static const struct ssh_conn_info *xxx_conn_info;
++static int key_type_allowed(struct sshkey *, const char *);
+ 
+ static int
+ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+@@ -100,6 +101,10 @@ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+ 	if ((r = sshkey_check_rsa_length(hostkey,
+ 	    options.required_rsa_size)) != 0)
+ 		fatal_r(r, "Bad server host key");
++	if (!key_type_allowed(hostkey, options.hostkeyalgorithms)) {
++		fatal("Server host key %s not in HostKeyAlgorithms",
++		    sshkey_ssh_name(hostkey));
++	}
+ 	if (verify_host_key(xxx_host, xxx_hostaddr, hostkey,
+ 	    xxx_conn_info) != 0)
+ 		fatal("Host key verification failed.");
+@@ -1608,34 +1613,37 @@ load_identity_file(Identity *id)
+ }
+ 
+ static int
+-key_type_allowed_by_config(struct sshkey *key)
++key_type_allowed(struct sshkey *key, const char *allowlist)
+ {
+-	if (match_pattern_list(sshkey_ssh_name(key),
+-	    options.pubkey_accepted_algos, 0) == 1)
++	if (match_pattern_list(sshkey_ssh_name(key), allowlist, 0) == 1)
+ 		return 1;
+ 
+ 	/* RSA keys/certs might be allowed by alternate signature types */
+ 	switch (key->type) {
+ 	case KEY_RSA:
+-		if (match_pattern_list("rsa-sha2-512",
+-		    options.pubkey_accepted_algos, 0) == 1)
++		if (match_pattern_list("rsa-sha2-512", allowlist, 0) == 1)
+ 			return 1;
+-		if (match_pattern_list("rsa-sha2-256",
+-		    options.pubkey_accepted_algos, 0) == 1)
++		if (match_pattern_list("rsa-sha2-256", allowlist, 0) == 1)
+ 			return 1;
+ 		break;
+ 	case KEY_RSA_CERT:
+ 		if (match_pattern_list("rsa-sha2-512-cert-v01@openssh.com",
+-		    options.pubkey_accepted_algos, 0) == 1)
++		    allowlist, 0) == 1)
+ 			return 1;
+ 		if (match_pattern_list("rsa-sha2-256-cert-v01@openssh.com",
+-		    options.pubkey_accepted_algos, 0) == 1)
++		    allowlist, 0) == 1)
+ 			return 1;
+ 		break;
+ 	}
+ 	return 0;
+ }
+ 
++static int
++key_type_allowed_by_config(struct sshkey *key)
++{
++	return key_type_allowed(key, options.pubkey_accepted_algos);
++}
++
+ /* obtain a list of keys from the agent */
+ static int
+ get_agent_identities(struct ssh *ssh, int *agent_fdp,
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 3a9010a7a4..9267bbd2c9 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-61985.patch \
            file://CVE-2025-61984.patch \
            file://CVE-2026-35385.patch \
+           file://CVE-2026-35387.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.43.0


