Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25165CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:23:18 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.49])
 by mx.groups.io with SMTP id smtpd.web11.35585.1725272591078618791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=WdNM+h00;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.249.49, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fpdgdu1ej5x97r3e3GWqEgwqBkp3cN0OhJHD18BP8JTgGnZgJH+Tw0QXD5WGQ534GfB37XrdoTaMykUrvx6hMd1NKIhdQirBY1MBPc1WePgjexfd2OonDETkD7QGY8eZhnSzGiw7GH1sLp5D8IPp9OuqBuR6TpCnfSs0Hw5Wjo8WHSkta9KM1tnrfIN2YnqQbl5iSlFRO6R5sqm17+Ewl+Q2WL5hlLb7tDC+N2aVnuQPs/2gU9B5+79TGLtTRL9ZDaGr9HVia0QQ8ZuNCVbdzcepT+2WW1CoHu5mb3ENIyfvKaL4XdFPQtZEGI7k1T74haiB+kjwKp2JaqAEk22HUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPUQBzO+Y1QoHLJ8yGjMBqgX20LbBiSHM/Mb6XeuRPY=;
 b=KKVnnBc1biDrPUWKddzni5cjD48ztmmA5rlrq7DXq/fhW9LG270ekt7XEgU0/kEhTsvzzCNKY85t4ubYW80h7bpZZ+w+vxiOq4PcBQDv1QBNIohqzBaedvyr6+Lk6Md7Jf7BWq+X+8ZQVSyH2bvLzMuCk3Dp+T0BRmvz1wpzGHEZm2mKyQEKAZ7xkEnXL3wwbrjXEGKGCjtL+VBeEOZGhgllA/5e0p6duONZFG//YclyRn6d4CS9cdKeLaOdZCMXewJiX59EN1LdZ9oIA9xbCqglcHtiFRh+IysFOArXHgrjTVCWmiDSSoG1KuLv2hd+zQnou7BmdPdobOpjGUFtCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPUQBzO+Y1QoHLJ8yGjMBqgX20LbBiSHM/Mb6XeuRPY=;
 b=WdNM+h00NT0JJ5wle/bIAkncftAQqNRSFGqtmMqGuSIiCPSnniSO+5g1gbfe8JWMBVHzma6i4WFDdZWjbQ2x4/+VZibvtRiRmQYj+81pGp4ZTgLg4JKEwEmvqLyHZMt3dC4LelvGZIRAtoec4rgkTrfy2LgiK0b/R1DY5w6q0A9CGrcUZqcdyIlQDTsRdH9HEMQkuMGwrKZyyOnVdquF6dc++R7JXE8H0+HAx66mPpxs4lyG+bVVlObJdjXCp3SXeeEHq/dJI4eVBm335Ug7hOgyoYOE+j0dyoz/SGH9FPsW60dc0153grjLcA2+/ZKaSQNquCRbY26HPib0X/1w6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by AM9P193MB1427.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:304::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 10:23:09 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:23:09 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 4/4] sstate: Drop SSTATEPOSTINSTFUNC support
Date: Mon,  2 Sep 2024 11:22:40 +0100
Message-Id: <20240902102240.3760442-4-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902102240.3760442-1-pedro.silva.ferreira@criticaltechworks.com>
References: <20240902102240.3760442-1-pedro.silva.ferreira@criticaltechworks.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1ef::18) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|AM9P193MB1427:EE_
X-MS-Office365-Filtering-Correlation-Id: f5073bdd-a79d-4ca8-62b3-08dccb393dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Z+Fm7h1268JNFvXDLH/FcytjIM8JEBnzlq45OCJwF+Hkjyos5rnNSVlMUmzf?=
 =?us-ascii?Q?2VgsSYxGu1C8GEaca44S9sy4ekdh9640UyiHyVJpWHvkUHrrULGNj6rWQk5H?=
 =?us-ascii?Q?9IftuPickQYKylrn7V89/DH4jn3n9Cq2c9UucewI1+RRFneQpmeFQVyn5Q8W?=
 =?us-ascii?Q?0h43XT9XW9woxsybYg8ssECwvENC4Vk3k9XBqNOC3lYXmzxXAbNmdwqX35aN?=
 =?us-ascii?Q?r9y8ZL/2TlZo29VMy3TMjp7j/85YjRj0YFGhm3VPwbXTYfbekZHtesn9INHl?=
 =?us-ascii?Q?irahzFMze8IxeAdNJkQJTQkHQjGF1sh+LwA+8qhMnMDt2ExmEt2V66raTLiL?=
 =?us-ascii?Q?gqBo+je6b7VY0vS30hhzCou/kSGGw3XEttiEDQNgOweHp5braEDLzfxmQczp?=
 =?us-ascii?Q?IxVss83a7zixLtaBEstdhW/MVhmHrYn4AU+VfkJBXPr3FwMz6LN0I8JNV0aq?=
 =?us-ascii?Q?iIxwFpbvHpMEr+zA/aTbd6otIAdUMNdORdj0FUZqny/hItCVpM967Pj1+SK4?=
 =?us-ascii?Q?T7KbllXoxjKX7kmLPnF14JzIHrj80d752k/8zfj4gQMlW8t6Q/fgVTqM2cXQ?=
 =?us-ascii?Q?P2osrzdIWMWObFGuIZVLm9JdEYeCqEEGez1w26vmjpYwsDafveCV/uVriB/j?=
 =?us-ascii?Q?xLgZznrAEopO3MRhw5ii+nKUV/R2/Wr0KQgVjuT9sS1Catm9aBV47AwzeXH1?=
 =?us-ascii?Q?dn/eeI/OMEnsaLN7tUQ7Pl2N2j19HcTS+aYEPpgdYDOYo9yFERgpOrNzrDM7?=
 =?us-ascii?Q?Gehd1MzySuMWxen/COW9VJBkz0m9JiSpcl4usN2qL0ahzkdHvUsS8lmbNiIl?=
 =?us-ascii?Q?5S44U3V7iebF6ynec0yPu66aT7IcIaLDEwR5lV46tFno0WIn9Denva4xTCyi?=
 =?us-ascii?Q?P68vD7vJQDujXprl6yobwphvo6G324J0tjgDbWh/VaTpPL63HiN3sprpTwVn?=
 =?us-ascii?Q?pXHUbkUyybG0swlU7Z8diG93xmouGsMN8weOboIKC4bWRvTdLCK9dbyBuZb8?=
 =?us-ascii?Q?TyG3mh1Oeu7tu3J4JkE5wHJhi/wQVpOcexL4mFZoyPmgxxLV58Ub/bZANa2+?=
 =?us-ascii?Q?ma3WQxN3XxXB9uR/PENgt9AJT4FwggH5M4im2pnwCBzVxg/zSDnmVFPrUu3k?=
 =?us-ascii?Q?inpj1fcwTpfk9sNcaEcAWbRCbvRwoCNFH8/OKhpUA9C1gjRG/+Sp6hDQWsr6?=
 =?us-ascii?Q?uwrkdWY9rq1CD0GJE6PD9Kl0dRzby32gUgf96W6F4rtbtE6VQUg9W2lTUUHO?=
 =?us-ascii?Q?qvlzem9IEukVzMB/IktQwNOyDqKRilP8h0QuqRt5tHPhdakDYVMsXU9LlZwQ?=
 =?us-ascii?Q?qwoPL1VR0GJUhe4liBVkxIuBPfRCLBMrefn+AfDwpDxgLuAKMY3hl6iGPTXX?=
 =?us-ascii?Q?IUx35sVGk6exs+u1SMKhn6XbZ1mc0yFaemxJRxSUvaEQMeXpCg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bjbawvm0bvnleqyVwPFglOEwkNIYi/IKwEfRMeh4visEukXoC8CekZYt92lh?=
 =?us-ascii?Q?Zlb417/fqcuAh1wE3gbERqmqzFBlpjCXbXIt8z9t1H7BPFXzdDGMjXs+gc41?=
 =?us-ascii?Q?pFMhhVr2w7PCwJdo+4CqkFvk9LFILoohavGkxYQllTEUN9b/t5xTNwr+bQ6Y?=
 =?us-ascii?Q?Y0fA95IdRyT+K7haoYhMj9pyVtAk2mY8X8NF4rqLYTMRDp/nFV9wR41qR1Lj?=
 =?us-ascii?Q?cFBM+ImPqLze6KtqCTFZhcAbLhqOF03LWympmgPVD/3qYxESX7PEW2m4x/vE?=
 =?us-ascii?Q?rV6AWlXAL1b4vviPu4pGeAStTAyl5r8WVyPFmKtdr9tlVKLROcLqaHBncOku?=
 =?us-ascii?Q?ii3rSkfC67cu3WBljmNEgu0aOv6XkZPPautbbE57C1bns8X2I7GjFtJEy9Cx?=
 =?us-ascii?Q?7SwKW76EoWiyuXExCwh1UWhtL9jnjTg0Xr9hdmsWgSJBr2PDTi/JQYsK06BG?=
 =?us-ascii?Q?73VE8Dh0CGRyqv60vmOyCAZw+TB2vabCYEOYgz+2ZEayaADKls/lVGR9DQyt?=
 =?us-ascii?Q?MjVWZxtP/lmnNQMRBAVQvnBRfBTBaeRGYPUgu/0rHZg4sB+QfFmb5q/j7B69?=
 =?us-ascii?Q?Wk/tjbEIXJmHm9vy+D65zMmvAAJs6S3wWGqr7mU7rCuouT8luA91vZutoEH7?=
 =?us-ascii?Q?Y3IhytsBxBuiA+q39lezmZUz3UybkHERTqb89drNfxxRI42tzYYOGu7YqCmX?=
 =?us-ascii?Q?ZrRh5t6gzEOFm5ViVzNrsRSms7/NiYyI1OKQaa5CySW/h5Tiip823e8WfNoA?=
 =?us-ascii?Q?wNCbiAG0Zu8s7Ol7gmjhj6zsynm0mwzuPkHeFuzyXTSnDjgLrjsV7JbzJqcW?=
 =?us-ascii?Q?oXMCElfeK7u0U+5K+OS8HOQ/LxS742IgyoncXYyJKGGYVfjeTrgxW+k4GjKz?=
 =?us-ascii?Q?gDkJOXDTvIaoiDWTn2veGiq4szefuU+vP3ATlDjZwhB3x0DjtNbPo85Gckxm?=
 =?us-ascii?Q?FBP9L0BaD99wy9G7WV6Vm/wF1Rsidh0OyzeymC3wPmAT+H06ulXTU/kUmN8z?=
 =?us-ascii?Q?yQc9TvWz4XzrmN1WL2afpom1ugE0m/vNVvw5E5a4WpbxHY5HB8n1V09/r1F3?=
 =?us-ascii?Q?8xMX4dEkKcB8cdSf0UM9vPeSU3/srHYYQTfjUuKNzkLj822i5G9r5KrLP1PF?=
 =?us-ascii?Q?Nbv/4s3EWaZAonsmmx0ut08t3WtMB1GW96Ud7bEfajXTvzc+kbVnLFivkqb5?=
 =?us-ascii?Q?+zo2J0QmIxs5HkildHecQ+GRv15uRK1JwiAXkzp3lJiYa0NmSaW3NHXgy5Wr?=
 =?us-ascii?Q?Xjp9WcG2ENOwMk4RjG/+ny3isG33sGOIBhbuaK31BllQpkoUwc8RQgTFh3W4?=
 =?us-ascii?Q?YVrUBF8ARLh4Z1wMbtelLhkVoUTG/9pBC6Nwe7veVLb9lOru7r4ioweY88mS?=
 =?us-ascii?Q?2hYNWpi/MgrVV9mDgINNgqZXX70/T6GvO2docbjbFqhYtXGR0PA1bMxi2hjX?=
 =?us-ascii?Q?8PEX5tIaUmFbTaLGxizYFW1jwda7/mA1ELV5hPdSkoIi2Wc2VnqhQZsUxqSa?=
 =?us-ascii?Q?Bo59jFprlWxO5e+070z1hzHORkzVGJYeUiUjvuB4zdjdBmNUCN0ahQsKSDXA?=
 =?us-ascii?Q?bKfZcjLeroPhZLismaXWdpf3mZa7dgPVak2zSwegjxgHAxioih5XAq4gJYP4?=
 =?us-ascii?Q?8sxwbhjh0cdlIMEasW3vrbw=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5073bdd-a79d-4ca8-62b3-08dccb393dc4
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:23:09.1883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPNr4UITE2lUzLg8QayjBazEfcvjQuDj//PFzM0Y9BlHLeaGLgMixG7ngGiYPHKuOW2yhSLQXdoOeO01HZQHD7Y5W7x3rOmZVBe2pB9m8hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1427
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204077

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This was deprecated with the introduction of postfunc support for tasks
in general and only used by buildhistory. Now that usage has been removed,
drop the code from sstate.bbclass. Any other users should be able to use
postfuncs too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7dee571d4969725c04b1e4fd1f4f114c07284138)
---
 meta/classes/sstate.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 91d42665c1..0741583aa7 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -98,7 +98,6 @@ SSTATECREATEFUNCS[vardeps] =3D "SSTATE_SCAN_FILES"
 SSTATEPOSTCREATEFUNCS =3D ""
 SSTATEPREINSTFUNCS =3D ""
 SSTATEPOSTUNPACKFUNCS =3D "sstate_hardcode_path_unpack"
-SSTATEPOSTINSTFUNCS =3D ""
 EXTRA_STAGING_FIXMES ?=3D "HOSTTOOLS_DIR"

 # Check whether sstate exists for tasks that support sstate and are in the
@@ -345,15 +344,10 @@ def sstate_install(ss, d):
         if os.path.exists(state[1]):
             oe.path.copyhardlinktree(state[1], state[2])

-    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS') or '').split():
-        # All hooks should run in the SSTATE_INSTDIR
-        bb.build.exec_func(postinst, d, (sstateinst,))
-
     for lock in locks:
         bb.utils.unlockfile(lock)

 sstate_install[vardepsexclude] +=3D "SSTATE_ALLOW_OVERLAP_FILES STATE_MANM=
ACH SSTATE_MANFILEPREFIX"
-sstate_install[vardeps] +=3D "${SSTATEPOSTINSTFUNCS}"

 def sstate_installpkg(ss, d):
     from oe.gpg_sign import get_signer
--
2.34.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

