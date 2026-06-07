Return-Path: <zuzana.valekova-spitalova@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0356CD8C8C
	for <webhook@archiver.kernel.org>; Sun,  7 Jun 2026 17:40:28 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37555.1780854020233681709
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2026 10:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=VypbcLzq;
 spf=pass (domain: siemens.com, ip: 40.107.162.36, mailfrom: zuzana.valekova-spitalova@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gu9LvAP+3st5MdL+oZeUUXonuIzHdDswlmPTcyORv4SkbKlDkwJ0Vjky1Edu2mttosSoG9+s5qMk/MK0hSPO7VjaX1W2azuKQLEodjyszyaynncGOQujvU/RI4xaPy+USC/cmN0hdtlW1YLtiuS2UQHswZVzNeKZk86AdPVyy9dcsGONS9CeiKKR2xxGnlkzmePexY3ZAu1K3qaVeMM1TIMUVKzmQUlgzKUf/TkFGQAWzp9Uodsq2NjiOPGL7a/bK8XVZfEhl/SfWMbRZHYyKhPrgW49cPn9bwMfT5MeKmlfSH4rwseUHI8F+xaJcNbCyY++1AzsmxXqQP4gTuIZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MqWWATWNtph/foL5JKm/tL2X5oLBXIvamgI5GZ0wgs=;
 b=OKDZ/mF/6aztAvmq4fKn6N4WXWk6mmPzHKVLz4x3TqQjJfZwZ+RXRFyLSP9Hec/9okHbZ6vnqiOGJHzyLqJ6TbKE24HQ1IWOL+PKSJWcLegkVnVT1hrJvcqPXsZCl8RZp5oS5GoI7W2q8g9fSIw/LqGgZq3nlCreR09Zml5NDJWdygxtUP4CPh9uI0IPnFLgNtMq479cu1OsezhdQAkhxGPUw0mJyynAdUnha+WGLvgGr1Nwfq6bm4cYYunC14ZwsXQCKV86doU9Vkpj3pvyVPB2q2LWKebj3JPiPFkkm3M+bjER14CMBMcKPU7E3631aNzNJ3VP8bqCYhGQDCfeQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MqWWATWNtph/foL5JKm/tL2X5oLBXIvamgI5GZ0wgs=;
 b=VypbcLzq16uHvKeJmsEPlCOgZ8TlwEAedZKslZeP3ZTX6IcQznTQGDZc5vIGSzaY8J5ona485acadPWCye5BK5yIA8V+IiVPCgFIlPYsfIs9YY5JBzAu0HimRg6Dtvs/EELuBMEn24aJ2zTPu2Ej9GVHsZvvP4fymvgsSTF9uaRd8aiOFtrsZ+opv3yH5O1h4eqhb1CWQBepe2HnisX2SydMKai07d3RyOrmVef2HyfZKqXQnYEqm9+W2jlVoW7WxVIZtuJBB6NAbUgdvz1wiob5X5ljSQ3rHJhRzcGbagGXKZbThFKwWCS6hdFhSzJ/UuaM+Q7EuCLxUfyhtHFCFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PAXPR10MB4701.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:150::22)
 by DU0PR10MB5725.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:310::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Sun, 7 Jun 2026
 17:40:16 +0000
Received: from PAXPR10MB4701.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e3e5:29f6:b55:b0b]) by PAXPR10MB4701.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e3e5:29f6:b55:b0b%3]) with mapi id 15.21.0092.011; Sun, 7 Jun 2026
 17:40:15 +0000
From: Zuzana Valekova Spitalova <zuzana.valekova-spitalova@siemens.com>
To: openembedded-core@lists.openembedded.org
CC: adrian.freihofer@siemens.com,
	Zuzana Valekova Spitalova <zuzana.valekova-spitalova@siemens.com>
Subject: [PATCH][oe][meta] runqemu: introduce unique instance ID
Date: Sun,  7 Jun 2026 19:40:13 +0200
Message-ID: <20260607174013.36552-1-zuzana.valekova-spitalova@siemens.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: VI1P189CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::27) To PAXPR10MB4701.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:150::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR10MB4701:EE_|DU0PR10MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: beed4837-a4e4-42f5-7d80-08dec4bbd59f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|55112099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	W7HbDlHWBKHJn71Fo9PLp+ft6Qc9CgaQ3mBPRgp5bHdQX5OaqqhXXSsEiMtCCLrHemloF0ktNNObnHDZ4pT0+w1n0euPLzjrEfvGwBCqKXnzyrOeeK6a1L87G2gqegUrbhAutP1vk+K580+e8Ud9KrEPgc4IVOhi7Az88TOf56789gqbLIfpDsESGxtHBb2biCJKipkqAzETyXtM2EYbFq22VgYa/jxxlxPiASUV9pw9k0BrC8M794XkJ3UXSVDd1zF4V1E7THyaCTF4FwMFDJgJDwGQSPm8p1EU7jGiOIef5+ROzsj3OlH/eUMrDkZa9EdFk2+JIc9yG/N+K2PkZUWpQzNMJ2V7GyMQLqO4iWdCspBSPtY3V6QtVZJY5yQiaWxll+O/nozYlwNtP1Qp9ZUKLjYD3IRSPTtUof82hB8QfQKX0LpS+K5Thw2E5RcI4FlsFzoiPr2Mbrq7gEINUQJEV7r6osDujpB5LF2vNwonKPPUwqq2iiqlgNVykZ8eRT+I5cllRt4fS9X1VGjaRN3b03sfpCh6ZBZOIO+olBL6S6Ua2ajiST0EZ3VHC6ov1DH8mrqJKfBr6e/dSJEl4hk83XVHvdaBXS7Nfp6Tig5PsMVsesN7QRY5025hhKRKmqrDh59hoF8sTYoGzWzM9iE5c3EU+QuKZhrM1foKw6a02p2N/wZgMRJjCqZrSCb8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB4701.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(55112099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vXn+S+qT0KlNOlpPJF4Wh+9n5AbbxVKKd3ISz5+5jqXr3c58mWRgSpVML/fS?=
 =?us-ascii?Q?l9Y4ZijpiukaHynvAVTjWha9qtTxCEuJBjrKBkWklD601DSmiRksOhr9jtrK?=
 =?us-ascii?Q?QPo5nSp91naYfD4peZ1C9CIijhOJjLiHF7UNpfFnwEl74JgktRo8GlK6USRZ?=
 =?us-ascii?Q?eYGa5CUUkUYRLmKbDEIbxqDLnqbMzYQYE82e1bm7Qn92ebduKHSJeVFJmBQl?=
 =?us-ascii?Q?PBD2vmLJ5apnV26N2MV34UEw4GEWUZ/Tp1mf/zWCxfzDsp1Pj6vAmdOZRfNq?=
 =?us-ascii?Q?LPOK47ej2D3qjdCHibJyuy5ipdwYSerPrMaJk5I65h5D1i0Nac5rXynT7x5o?=
 =?us-ascii?Q?TDD9uL8cth3nGMIUunr+8V1/hDlYi8QiXyfiFahQhanp4neN5kxG6QUFS7ws?=
 =?us-ascii?Q?bDGKz04QM/oGCGF56rcNAwA/CjV9VGnkmSEk0nnDltCxPkenalxt4C/bE0Kk?=
 =?us-ascii?Q?2+Tau4bHBUA8IjU0v5eZiq6CTkslwfpDbPPvDHmVqnL6Of1ez1XXlKSYyJ1s?=
 =?us-ascii?Q?hq5t8LMBvDbySEhePqp2ILdeBhYwXGUZdtwBz53y8+Sc4NCtSm7r5aIobnfi?=
 =?us-ascii?Q?FtyqamT+aIDzMy9ZYDghcl7Fv//gTvGuutPPcO9ijDUHge3M3RG+sK7Deq46?=
 =?us-ascii?Q?1a40AgtpscqvzTnaCExmYOhsQ14fH4Qwcs48C5OY0AdTyUAFAVN/q/kf8jDZ?=
 =?us-ascii?Q?V+xbJUgNQu5IA9e3HfhmtcctHdPgh8XcsXtDG4iqkoq2G26lfztXmztjoZ3U?=
 =?us-ascii?Q?Og31tKh7M5EhFyIimBGEGRDyfvqSyGjJothhzpaYA6u4eoqXuaym6N1XN5v+?=
 =?us-ascii?Q?vsvDEEXprhPTArMZg0+xeuA83N7W7GPjySXlrs+FHIe5BWsP+29Ehibpn7X4?=
 =?us-ascii?Q?pw4djxpSfUKmrrMdnYCEIedlnQjCB8sObOc3wO+4RI1l7iQNFMhkqfL3wiU/?=
 =?us-ascii?Q?tq/v9bu7SG60vkcf1lD6k43Z2Y0BFIwkQlEAG425o7nrWhdtV3ueFZmbJU7l?=
 =?us-ascii?Q?Mn/MKu/XfuVvK5BRAV9mDYdZc3MjfQyhxDnLdmhatcZbCTvxmAbAhNOALQ3Q?=
 =?us-ascii?Q?Wuo38R4Fm/QuYBrf2b3hgJ3FCl2A6kjgOr9PshaoP5kqKbCiLMHjg1I49liI?=
 =?us-ascii?Q?Son6Xun2bSm92+UD+IQ7NNuRz3O3k1e8DWOEBeSXp4aKdnRl0r04fUTGDpAT?=
 =?us-ascii?Q?zXBAMs9KziKbTeCzl9wRIdWi0bPXKvSxENA6cW1zLw0luwiwMUJt9wfTSeHs?=
 =?us-ascii?Q?c+BZYSGV/rgSGwfJS/1XJ+DTnSZF6AYakiTdMUa703DBTuOrxf+YdciqUAgV?=
 =?us-ascii?Q?4UGnu5yilh8lNgH9hbs3C3cON4ZbhPjFsBn3whG3mk0I10HEyUEutnlQT18H?=
 =?us-ascii?Q?KfNTX+uW0ijj+MMorhpdhgZckbje25mAxYDzl9t5Te2qXqCNiU9WJuSqPKBk?=
 =?us-ascii?Q?r9E+WWUUPULbKA1T1wQ1PHHwm1G32LtbmrA7dnSp1f3FmXOlCC/uzDub8COL?=
 =?us-ascii?Q?Kd9ktvRAV41FswyL+e+PB12PZ1kpc7+ieshAmHzo3lth3O+Mk1IhVqJU9EwZ?=
 =?us-ascii?Q?nGiyASCVqe8a5QJ5RuXj9fk74gPMPXjFn2TVCFoZ4GJ83oyJn/69ooZ614dP?=
 =?us-ascii?Q?m/bq/603HmwitMwq1PUz+ygNMXv20aC6ZP8BbeAal3kI8jrlc4/zrC+SxD4y?=
 =?us-ascii?Q?Otujw3OjWPoEzeyBvKLOEycL3wswK2Kzp4ZLHf90kQyBBtJusr8/WoiCTNrA?=
 =?us-ascii?Q?nsi3aEMGsCky5+mzJp3t3USE5VXuD1pksxW1XSnAVDthNoHb/GGq?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beed4837-a4e4-42f5-7d80-08dec4bbd59f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB4701.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 17:40:15.5962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTcWMOiQnvRJqxlNpElodyfgtO70H7ckj8rfSHIto+TkKcRmKsDj1/3PPTuAvr4Wd7nWVnT6AUTOfyqCSWQ3xPnnkU56ezbKlaJTXOK5+c+x4yJEVPCad0E/NG09btwv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5725
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jun 2026 17:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238224

In some cases like running multiple QEMUs, would be nice to have an option
to distinguish between them. For this reason I introduce an unique instance
ID based on time. Later in cmd, the '@INSTANCE_ID@' could be used for QEMU
identification.

Signed-off-by: Zuzana Valekova Spitalova <zuzana.valekova-spitalova@siemens=
.com>
---
 scripts/runqemu | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2c126e7f54..2de69dcd7c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -227,6 +227,7 @@ class BaseConfig(object):
         self.qmp =3D None
         self.guest_agent =3D False
         self.guest_agent_sockpath =3D '/tmp/qga.sock'
+        self.instance_id =3D None
=20
     def acquire_taplock(self, error=3DTrue):
         logger.debug("Acquiring lockfile %s..." % self.taplock)
@@ -1111,8 +1112,11 @@ to your build configuration.
         self.nfs_running =3D True
=20
     def setup_cmd(self):
+        self.instance_id =3D str(int(time.time()))
+
         cmd =3D self.get('QB_SETUP_CMD')
         if cmd !=3D '':
+            cmd =3D cmd.replace('@INSTANCE_ID@', self.instance_id)
             logger.info('Running setup command %s' % str(cmd))
             if subprocess.call(cmd, shell=3DTrue) !=3D 0:
                 raise RunQemuError('Failed to run %s' % str(cmd))
@@ -1623,6 +1627,8 @@ to your build configuration.
         if self.bios:
             self.qemu_opt +=3D " -bios %s" % self.bios
=20
+        self.qemu_opt =3D self.qemu_opt.replace("@INSTANCE_ID@", self.inst=
ance_id)
+
         cmd =3D "%s %s" % (self.qemu_opt, kernel_opts)
         cmds =3D shlex.split(cmd)
         logger.info('Running %s\n' % cmd)
@@ -1647,6 +1653,7 @@ to your build configuration.
     def cleanup_cmd(self):
         cmd =3D self.get('QB_CLEANUP_CMD')
         if cmd !=3D '':
+            cmd =3D cmd.replace('@INSTANCE_ID@', self.instance_id)
             logger.info('Running cleanup command %s' % str(cmd))
             if subprocess.call(cmd, shell=3DTrue) !=3D 0:
                 raise RunQemuError('Failed to run %s' % str(cmd))
--=20
2.43.0


