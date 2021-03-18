Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.40])
 by mx.groups.io with SMTP id smtpd.web10.208.1616090575017609585
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 11:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@spinetix.com header.s=selector2 header.b=r0a8Mwin;
 spf=pass (domain: spinetix.com, ip: 40.107.5.40, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8IimKkuvlYq4s43DKPIcsgQeIwFZSjseSVIU6oAuHABSSV4UXgSzo3fEXV0q8A7DYXsu8OJpsvpkSaiVJjKrtUDWFB6By2Dr+zq2brdCm6UxXZ4oODVPLZef1qCdz1yGwFRK/wBrhNVGmX7EWRZw5PdhD5NWt0K0oWjGMSWmjk8G41tthXxeVkEYRFv3r3WutGmnPjHN4FY2DCRRk8HuntcF54DFDhVHKK4csMJeQ+q5qg817Nbs8nT/EAKhuHVS+0d9rhmJYGG4sDJ5oLutoQRDl7+0Lkfb9jjejShZ/0BLKFqtH5iuvCMWkz16+2mh6Bi0OYSVgxbUDftkKph6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cdX4JVEq6hjCaFbUfixj7vWb5dEGRjrTpUwsWPX7ek=;
 b=CFwdM2y+iwRYdi0LiUbTr8iiLkPwEdjVjek7yTkwqOnNm3/lIpWteX8Tt3HkBpt+Z58Cnwj+IS+h3E0wY6Ui76jUjaFLIt+DcWhhUsygW0HTEFudBDfEeShMauVwQ9GLPK3PmIRZ9JmoJGSA+nqnpi8Hnbqd/8eEIEK/Y7qtaof3TfpfgG6QyQwDOkYKD7NaUI5yJO5FGYlnmBbfRJiKGFKB0h8CA3Wes1msh0PdCk7cnD4R9NsDjxQ4b1hdHwzD+btXzzDXYVti0+q1KZQKYPTdwqsnkJ2egIfj4ndu7NCIxDumEnnUNZXwdePSAHIT1jkpSFTyKVCSh6FAdhsS0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cdX4JVEq6hjCaFbUfixj7vWb5dEGRjrTpUwsWPX7ek=;
 b=r0a8MwinjxgYTRqdY2LseleTASePMrN3l17gddSeKs24mJZAum9RL/12Dt4wm2nChcV1EYPmkqvBS1RxHnD7JNmZHE50leRuwDhEvKh67H/66dlZUPRSjO/e7psLqeuG3TM7AkbDqJCmWX5Va2EC5RDJMDkiEHlS7adBXaxQ3oE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB8PR01MB6341.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Thu, 18 Mar
 2021 18:02:50 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b%7]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 18:02:50 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-core@lists.openembedded.org
CC: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [dunfell][PATCH] iputils: fix various arping regressions
Date: Thu, 18 Mar 2021 19:02:17 +0100
Message-ID: <20210318180217.23002-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZRAP278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::20) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZRAP278CA0010.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 18:02:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8be856e1-ba17-463d-16dc-08d8ea380b55
X-MS-TrafficTypeDiagnostic: DB8PR01MB6341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR01MB634124EB12B227C48879512388699@DB8PR01MB6341.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k/l4B7fEYe7x60P3fBKMGLri96fL9nPbaWod3LvIQQEY0j9f2mTK5l60LR2y988FDkX7Qbzj9Qnww6DTUn+13YNZza5EGDlnsoRPxwfl9HPYJBAq2CbBwLMgbUp1vqcYxsO82oD/2uQQMvo8imiN4o3TFYYNXsq89rwsT3Xq6JoNthkdshrXI94zBOV0jeRKLyl0PCyYRPgLgtkEG8rwMr+UKkwZ5/mIdROptIjFg1nfKH6A/CscyThiV8H/fKixR9eCmGEDARQY12V13R56I/JGBPU8GcEAFYzDpxFSiyF8SVQBY4rXbFcZHr/qCCKmex9faY+rxR3Lw3PNeSaZv/NuD0XnZ0jg9ztCLWjFk2rUDbHfoK4rmhJ/EOhVYSJB55zZ7uit+ewEQRXGtWAeeewOX7OgH5V7paFMgNLMvrLHzraZtPU3xcXBlvfKD2OjwMEASuqTUbaFxWnHh7lWna3NepTXNwEi/pgYWcWTulSmUyqWzlqZOpe9A5mrqV1pCEihDYafV2mChlTuQtr5ICLY1ukMcdxhuA10ksMnedGNLka0nO/5FbRaYK1imC5UWrNksrX0ypR0O9mf6QntQpEYwPad3WHCEOGoC1oHZwGSQa9INqEdyw+pLKTTNCD4hrq9j+pO6yZdE763m7ej5i7o4lnDxra3H2Y+XuVyIaeA9GJXy8pXr34kD8eo5HVl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39830400003)(366004)(376002)(2906002)(26005)(16526019)(6666004)(6506007)(52116002)(186003)(83380400001)(36756003)(4326008)(2616005)(5660300002)(6916009)(86362001)(30864003)(966005)(66946007)(66476007)(478600001)(956004)(66556008)(1076003)(6512007)(107886003)(8676002)(8936002)(38100700001)(6486002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?wKsbb+ahYynxcyP1dVap96c13IJuaZNk7OgO+ekIdUBpbcwXTQmR4ioWhWen?=
 =?us-ascii?Q?cgi2+jGhcgbB8MSQTUF5/51IMwuS5hJ5p+Xgpxp5JMc+6abRfEoKPo6Wwr2n?=
 =?us-ascii?Q?glQz19exmIyBUegw1Uw8fBVRQvrvuYpxx+yG+7ntzjvWa8gkZUvPZa6Wz+hs?=
 =?us-ascii?Q?K8wvrSeMiOdZ2g6v9cOTouhBh3dQN1/6Mw+MHvgbljr8ro7A9bEzq1+3Zd+0?=
 =?us-ascii?Q?bhmF5PKSuE1wviMuuvCaVqJ/ZjErEtL1Krkp8YFwVpA4BJa0APlxtra28Kn8?=
 =?us-ascii?Q?qJmhY+e/Umd5lAvWOWYEWYnU30QaFMwlaRgv28XEahQQFPjmxQKvGTY45J8z?=
 =?us-ascii?Q?TqMKSBpZN4XI6Hnay6M6lrJ3HpStBy2xnDGSx2DNrfsbiPYwJTjX2hw6ABMC?=
 =?us-ascii?Q?3XzbOBZiNjLKi9GeFLaCX/IEihfbKP/lKfp8nMEgcC6xBibDBPc3KsmLnLho?=
 =?us-ascii?Q?wrkgOAylaeePV6xxEB62pv+8340qJQ8uBLKtN9ec26qL0eWqc6oIWkK2MVik?=
 =?us-ascii?Q?pGkWaIjbRMUY7qTuINeKZZ324UhmWD3HXKpeER8GhM5d5nxba7wn4Bct2tPH?=
 =?us-ascii?Q?mZqJcBbS0+TrYM3dkaXjLjV8N0vZnxd9HNCbeIfZIKElHSClGG9vivDi7gZJ?=
 =?us-ascii?Q?U3criRzubrYq6r83CCvwQN+trOBkdhDu9wsdzKSPOSAbBsDrVabJTU5T5KOs?=
 =?us-ascii?Q?rp0A6s1DIeCQkc7ipGkSAbmL+oMonH6KJmt+W2uVRIXM+EKmwo3Iz223tzdX?=
 =?us-ascii?Q?6qJzz1az2mKrlrzgf5grQ8lqOyPsnEwck/OvS7FCTrIKKqsjMvswnpWUHLo1?=
 =?us-ascii?Q?xfa+Jro4RVWsNwu3m2jbu9IZQBg1h2JmJjhw+IMoWFqChqEqHZhz9B8Y5rmm?=
 =?us-ascii?Q?ohnrTNqlJ87Ca4bXJPxijkwWYsGS6Uu4SN4Kbd2S+s5dUjBOzpVqdlZWei8V?=
 =?us-ascii?Q?ZpK+R7OPMt6/9nEkgeW41ds3kL5vLldNPy27ZTQUpyuSiCxt6QivNiqmFooS?=
 =?us-ascii?Q?3ebnTSscA6bxuS6RYK66pIgBwGeyVKE+eSYRnkwk3+gowNOcOHgGdQ4grgWq?=
 =?us-ascii?Q?dGsmk9tKVs14SCvizcoaz6K5xK8qwAAwqjOgWnsLYGoidAcQUi+jLzj5mXFp?=
 =?us-ascii?Q?yW7fS/PbhzcpEOu21v+GIbDuw/bGy+MOgwBqhp+3T1Fr9Kxhq8ukkhEFCmBc?=
 =?us-ascii?Q?RkWUYAJqgGb1hyTCD2kPG7B+rDt07H+gOsla8+Kndb3gvnDVI5gxtRSOY/nW?=
 =?us-ascii?Q?O0KPPmmB9ptAyFakqKlyA9hf1wexZ8oUdwuUoHIAq5Z94nHM+VRn8v5lk5ZA?=
 =?us-ascii?Q?I2mV4xzxjJbpU34rb/Ucq5ey?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be856e1-ba17-463d-16dc-08d8ea380b55
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 18:02:50.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0ncfrsFUn4QRfwuNFSsFF74Y6bxurcimVJNgEiIUH7cpJlgyDb1BCbDONGbK71YB8gsraLvetOlBLit4SsweFqJrUmSAXBa8d62hqXTbIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6341
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

arping in iputils s20190709 has several problems, this backports the
fixes from s20200821.
 - -D, duplicate address detection, always returns failure
 - -w -f does not behave correctly
 - -w option hangs arping
 - -U option returns failure

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 ...rtially-fix-sent-vs-received-package.patch | 39 ++++++++
 ...fix-f-quit-on-first-reply-regression.patch | 39 ++++++++
 ...rison-of-different-signedness-warnin.patch | 37 ++++++++
 ...ccess-when-unsolicited-ARP-mode-dest.patch | 45 +++++++++
 ...ional-timerfd-to-control-when-timeou.patch | 94 +++++++++++++++++++
 .../iputils/iputils_s20190709.bb              |  5 +
 6 files changed, 259 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-arping-rever=
t-partially-fix-sent-vs-received-package.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0002-arping-fix-f=
-quit-on-first-reply-regression.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0003-arping-Fix-c=
omparison-of-different-signedness-warnin.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0004-arping-retur=
n-success-when-unsolicited-ARP-mode-dest.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0005-arping-use-a=
dditional-timerfd-to-control-when-timeou.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-arping-revert-parti=
ally-fix-sent-vs-received-package.patch b/meta/recipes-extended/iputils/ipu=
tils/0001-arping-revert-partially-fix-sent-vs-received-package.patch
new file mode 100644
index 0000000000..8495178879
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-arping-revert-partially-fi=
x-sent-vs-received-package.patch
@@ -0,0 +1,39 @@
+From 18f14be80466ddc8fb17a400be82764a779c8dcd Mon Sep 17 00:00:00 2001
+From: Sami Kerola <kerolasa@iki.fi>
+Date: Wed, 31 Jul 2019 21:28:12 +0100
+Subject: [PATCH] arping: revert partially - fix sent vs received packages
+ return value
+
+Commit 84ca65ca980315c73f929fed8b6f16bbd698c3a0 caused regression.  The
+arping -D needs return value evaluation that was the earlier default, in
+other cases the new return value should be correct.
+
+Addresses: https://github.com/iputils/iputils/issues/209
+See-also: https://github.com/void-linux/void-packages/issues/13304
+Signed-off-by: Sami Kerola <kerolasa@iki.fi>
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/18f14=
be80466ddc8fb17a400be82764a779c8dcd]
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ arping.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/arping.c b/arping.c
+index 77c9c56..2c87c15 100644
+--- a/arping.c
++++ b/arping.c
+@@ -792,7 +792,11 @@ static int event_loop(struct run_state *ctl)
+ 	close(tfd);
+ 	freeifaddrs(ctl->ifa0);
+ 	rc |=3D finish(ctl);
+-	rc |=3D (ctl->sent !=3D ctl->received);
++	if (ctl->dad && ctl->quit_on_reply)
++		/* Duplicate address detection mode return value */
++		rc |=3D !(ctl->brd_sent !=3D ctl->received);
++	else
++		rc |=3D (ctl->sent !=3D ctl->received);
+ 	return rc;
+ }
+=20
+--=20
+2.18.4
+
diff --git a/meta/recipes-extended/iputils/iputils/0002-arping-fix-f-quit-o=
n-first-reply-regression.patch b/meta/recipes-extended/iputils/iputils/0002=
-arping-fix-f-quit-on-first-reply-regression.patch
new file mode 100644
index 0000000000..a5f40860dc
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0002-arping-fix-f-quit-on-first=
-reply-regression.patch
@@ -0,0 +1,39 @@
+From 1df5350bdc952b14901fde356b17b78c2bcd4cff Mon Sep 17 00:00:00 2001
+From: Sami Kerola <kerolasa@iki.fi>
+Date: Wed, 28 Aug 2019 20:05:22 +0100
+Subject: [PATCH] arping: fix -f quit on first reply regression
+
+When arping runs together with -f 'quit on first reply' and -w <timeout>
+'how long to wait for a reply' the command needs to exit if replies are no=
t
+received after wait period.  Notice that the exit in case of lost packages
+will be 1 signifying failure.  Getting a reply results to 0 exit value.
+
+Addresses: https://bugs.debian.org/935946
+Reported-by: Lucas Nussbaum <lucas@debian.org>
+Addresses: https://github.com/iputils/iputils/issues/211
+Reported-by: Noah Meyerhans <noahm@debian.org>
+Broken-since: 67e070d08dcbec990e1178360f82b3e2ca4f6d5f
+Signed-off-by: Sami Kerola <kerolasa@iki.fi>
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/1df53=
50bdc952b14901fde356b17b78c2bcd4cff]
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ arping.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/arping.c b/arping.c
+index 2c87c15..30884f6 100644
+--- a/arping.c
++++ b/arping.c
+@@ -764,7 +764,8 @@ static int event_loop(struct run_state *ctl)
+ 					continue;
+ 				}
+ 				total_expires +=3D exp;
+-				if (0 < ctl->count && (uint64_t)ctl->count < total_expires) {
++				if ((0 < ctl->count && (uint64_t)ctl->count < total_expires) ||
++				    (ctl->quit_on_reply && ctl->timeout < total_expires)) {
+ 					exit_loop =3D 1;
+ 					continue;
+ 				}
+--=20
+2.18.4
+
diff --git a/meta/recipes-extended/iputils/iputils/0003-arping-Fix-comparis=
on-of-different-signedness-warnin.patch b/meta/recipes-extended/iputils/ipu=
tils/0003-arping-Fix-comparison-of-different-signedness-warnin.patch
new file mode 100644
index 0000000000..ebd122c157
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0003-arping-Fix-comparison-of-d=
ifferent-signedness-warnin.patch
@@ -0,0 +1,37 @@
+From ec821e572a640bd79aecc3922cb9001f4b6b26f2 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Sat, 7 Sep 2019 06:07:19 +0200
+Subject: [PATCH] arping: Fix comparison of different signedness warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+../arping.c:768:45: warning: comparison of integer expressions of differen=
t signedness: =E2=80=98int=E2=80=99 and =E2=80=98uint64_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} [-Wsign-compare]
+  768 |         (ctl->quit_on_reply && ctl->timeout < total_expires)) {
+
+Fixes: 1df5350 ("arping: fix -f quit on first reply regression")
+Reference: https://github.com/iputils/iputils/pull/212
+Acked-by: Sami Kerola <kerolasa@iki.fi>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/ec821=
e572a640bd79aecc3922cb9001f4b6b26f2]
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ arping.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arping.c b/arping.c
+index 2d05728..88319cd 100644
+--- a/arping.c
++++ b/arping.c
+@@ -765,7 +765,7 @@ static int event_loop(struct run_state *ctl)
+ 				}
+ 				total_expires +=3D exp;
+ 				if ((0 < ctl->count && (uint64_t)ctl->count < total_expires) ||
+-				    (ctl->quit_on_reply && ctl->timeout < total_expires)) {
++				    (ctl->quit_on_reply && ctl->timeout < (long)total_expires)) {
+ 					exit_loop =3D 1;
+ 					continue;
+ 				}
+--=20
+2.18.4
+
diff --git a/meta/recipes-extended/iputils/iputils/0004-arping-return-succe=
ss-when-unsolicited-ARP-mode-dest.patch b/meta/recipes-extended/iputils/ipu=
tils/0004-arping-return-success-when-unsolicited-ARP-mode-dest.patch
new file mode 100644
index 0000000000..923e06e30b
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0004-arping-return-success-when=
-unsolicited-ARP-mode-dest.patch
@@ -0,0 +1,45 @@
+From 68f12fc4a0dbef4ae4c404da24040d22c5a14339 Mon Sep 17 00:00:00 2001
+From: Sami Kerola <kerolasa@iki.fi>
+Date: Sat, 8 Feb 2020 14:12:18 +0000
+Subject: [PATCH] arping: return success when unsolicited ARP mode destinat=
ion
+ does not answer
+
+Manual page is making promise answers are not expected when -U (or -A)
+option is in use.  Either I am looking wrong or this has been broken since
+at the beginning of git history.
+
+Addresses: https://github.com/iputils/iputils/issues/247
+Signed-off-by: Sami Kerola <kerolasa@iki.fi>
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/68f12=
fc4a0dbef4ae4c404da24040d22c5a14339]
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ arping.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/arping.c b/arping.c
+index 996cf2b..5180ae0 100644
+--- a/arping.c
++++ b/arping.c
+@@ -794,7 +794,9 @@ static int event_loop(struct run_state *ctl)
+ 	close(tfd);
+ 	freeifaddrs(ctl->ifa0);
+ 	rc |=3D finish(ctl);
+-	if (ctl->dad && ctl->quit_on_reply)
++	if (ctl->unsolicited)
++		/* nothing */;
++	else if (ctl->dad && ctl->quit_on_reply)
+ 		/* Duplicate address detection mode return value */
+ 		rc |=3D !(ctl->brd_sent !=3D ctl->received);
+ 	else
+@@ -943,7 +945,7 @@ int main(int argc, char **argv)
+ 		}
+ 		memset(&saddr, 0, sizeof(saddr));
+ 		saddr.sin_family =3D AF_INET;
+-		if (ctl.source || ctl.gsrc.s_addr) {
++		if (!ctl.unsolicited && (ctl.source || ctl.gsrc.s_addr)) {
+ 			saddr.sin_addr =3D ctl.gsrc;
+ 			if (bind(probe_fd, (struct sockaddr *)&saddr, sizeof(saddr)) =3D=3D -1=
)
+ 				error(2, errno, "bind");
+--=20
+2.18.4
+
diff --git a/meta/recipes-extended/iputils/iputils/0005-arping-use-addition=
al-timerfd-to-control-when-timeou.patch b/meta/recipes-extended/iputils/ipu=
tils/0005-arping-use-additional-timerfd-to-control-when-timeou.patch
new file mode 100644
index 0000000000..3b8a8244da
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0005-arping-use-additional-time=
rfd-to-control-when-timeou.patch
@@ -0,0 +1,94 @@
+From 60a27c76174c0ae23bdafde2bad4fdd18a44a7ea Mon Sep 17 00:00:00 2001
+From: Sami Kerola <kerolasa@iki.fi>
+Date: Sat, 7 Mar 2020 22:03:21 +0000
+Subject: [PATCH] arping: use additional timerfd to control when timeout
+ happens
+
+Trying to determine timeout by adding up interval values is pointlessly
+complicating.  With separate timer everything just works.
+
+Addresses: https://github.com/iputils/iputils/issues/259
+Fixes: 1df5350bdc952b14901fde356b17b78c2bcd4cff
+Signed-off-by: Sami Kerola <kerolasa@iki.fi>
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/e594c=
a52afde89746b7d79c875fe9d6aea1850ac]
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ arping.c | 29 ++++++++++++++++++++++++++---
+ 1 file changed, 26 insertions(+), 3 deletions(-)
+
+diff --git a/arping.c b/arping.c
+index 61db3a6..7284351 100644
+--- a/arping.c
++++ b/arping.c
+@@ -670,6 +670,7 @@ static int event_loop(struct run_state *ctl)
+ 	enum {
+ 		POLLFD_SIGNAL =3D 0,
+ 		POLLFD_TIMER,
++		POLLFD_TIMEOUT,
+ 		POLLFD_SOCKET,
+ 		POLLFD_COUNT
+ 	};
+@@ -686,6 +687,13 @@ static int event_loop(struct run_state *ctl)
+ 		.it_value.tv_sec =3D ctl->interval,
+ 		.it_value.tv_nsec =3D 0
+ 	};
++	int timeoutfd;
++	struct itimerspec timeoutfd_vals =3D {
++		.it_interval.tv_sec =3D ctl->timeout,
++		.it_interval.tv_nsec =3D 0,
++		.it_value.tv_sec =3D ctl->timeout,
++		.it_value.tv_nsec =3D 0
++	};
+ 	uint64_t exp, total_expires =3D 1;
+=20
+ 	unsigned char packet[4096];
+@@ -709,7 +717,7 @@ static int event_loop(struct run_state *ctl)
+ 	pfds[POLLFD_SIGNAL].fd =3D sfd;
+ 	pfds[POLLFD_SIGNAL].events =3D POLLIN | POLLERR | POLLHUP;
+=20
+-	/* timerfd */
++	/* interval timerfd */
+ 	tfd =3D timerfd_create(CLOCK_MONOTONIC, 0);
+ 	if (tfd =3D=3D -1) {
+ 		error(0, errno, "timerfd_create failed");
+@@ -722,6 +730,19 @@ static int event_loop(struct run_state *ctl)
+ 	pfds[POLLFD_TIMER].fd =3D tfd;
+ 	pfds[POLLFD_TIMER].events =3D POLLIN | POLLERR | POLLHUP;
+=20
++	/* timeout timerfd */
++	timeoutfd =3D timerfd_create(CLOCK_MONOTONIC, 0);
++	if (tfd =3D=3D -1) {
++		error(0, errno, "timerfd_create failed");
++		return 1;
++	}
++	if (timerfd_settime(timeoutfd, 0, &timeoutfd_vals, NULL)) {
++		error(0, errno, "timerfd_settime failed");
++		return 1;
++	}
++	pfds[POLLFD_TIMEOUT].fd =3D timeoutfd;
++	pfds[POLLFD_TIMEOUT].events =3D POLLIN | POLLERR | POLLHUP;
++
+ 	/* socket */
+ 	pfds[POLLFD_SOCKET].fd =3D ctl->socketfd;
+ 	pfds[POLLFD_SOCKET].events =3D POLLIN | POLLERR | POLLHUP;
+@@ -764,13 +785,15 @@ static int event_loop(struct run_state *ctl)
+ 					continue;
+ 				}
+ 				total_expires +=3D exp;
+-				if ((0 < ctl->count && (uint64_t)ctl->count < total_expires) ||
+-				    (ctl->quit_on_reply && ctl->timeout < (long)total_expires)) {
++				if (0 < ctl->count && (uint64_t)ctl->count < total_expires) {
+ 					exit_loop =3D 1;
+ 					continue;
+ 				}
+ 				send_pack(ctl);
+ 				break;
++			case POLLFD_TIMEOUT:
++				exit_loop =3D 1;
++				break;
+ 			case POLLFD_SOCKET:
+ 				if ((s =3D
+ 				     recvfrom(ctl->socketfd, packet, sizeof(packet), 0,
+--=20
+2.18.4
+
diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/reci=
pes-extended/iputils/iputils_s20190709.bb
index 545f3d5e87..d652bfcaad 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -15,6 +15,11 @@ SRC_URI =3D "git://github.com/iputils/iputils \
            file://0001-ninfod-fix-systemd-Documentation-url-error.patch \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
            file://0001-iputils-Initialize-libgcrypt.patch \
+           file://0001-arping-revert-partially-fix-sent-vs-received-packag=
e.patch \
+           file://0002-arping-fix-f-quit-on-first-reply-regression.patch \
+           file://0003-arping-Fix-comparison-of-different-signedness-warni=
n.patch \
+           file://0004-arping-return-success-when-unsolicited-ARP-mode-des=
t.patch \
+           file://0005-arping-use-additional-timerfd-to-control-when-timeo=
u.patch \
            "
 SRCREV =3D "13e00847176aa23683d68fce1d17ffb523510946"
=20
--=20
2.18.4

