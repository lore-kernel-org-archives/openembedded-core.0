Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C32CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:32:18 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.68])
 by mx.groups.io with SMTP id smtpd.web10.35610.1725273129449070220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=JV04GD9t;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.241.68, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USIFi1W+GAd8F1xZYLbSC3uOsqtsopVVz00TyDDVcxoW5gNEpD185kBlZxgZhnTHlbZfMDjubokZ0g93NSZtJlANAe5z6HK6PaHjeKrMoVohl823VJ3Sk5gdOVmkXJE6+lmHLtIQy2VJWzisYvD3TaOHuB31FKsLIXXtHhUH+AcD8MHlykUEcK9g8lYrEhY9jZy1oS+29zMlisf9ehklnicnVdNhneznzGa5pKaO97P88Pn7ilLWJjTiZ2Oi+MeWILZ5mJyumwaen9G6I4q569QWsPUM7NE6TvQofx/BKndpj2xilRAo98vyqumTySp9wqp6nOQF82/E2hQTeq7onQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzEsrRWS69FEHOLQDmlu4Eu6Ovs07WFvcpCFjt2Ja78=;
 b=KJlIWWi3cCz3xiVogUzupU0cek0iodDQNYc3s1vZ2gAyrGxmPEwW3ezgI7MBnxMnA+CXVxolsqg3wpSIo/wlSTf4xM6jgcB1QZklgfP0XWMnEivJx0Qee+1FVXRbupK4qFV4JZKVf0jacUnN+3i8tSbVB+sTQPpsTI/YDFBVSKE/mhkuy8+cnBUIQ7SYu3zEFLJgrDWgpnS6VDocZ5y2j+UpuoOJykxfOaTtwOYohgWcuqYm51pBYJHOpsUao3RCia2rVWW2OPwaAdEUFiaMPlj/4DRXlTRkPEU5TRLsTJ9EXP98A6uHZ8S4X4y442E2FgOna6lJZNQ6Yd717cIQUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzEsrRWS69FEHOLQDmlu4Eu6Ovs07WFvcpCFjt2Ja78=;
 b=JV04GD9tKskmK0FmOyy/Fi0Kl12ExpDLFwxoHZy9U7uMvdSWzCZ+H7qByindOAdgbekEth4TwMTqhn9jUvbsorbqLH16jusaviXypeLbylwKFTQfTNNHq+zdMEzcOKhR6GB0znQan+m1JSRQY22j4drmzEIcg/5IinSPpPZLH8qCzXxszCfU2KF8IEotlsR/15m2U5EOwKsx7PvDhlkA2Ya7IHskzBbjRoS0lMMmPfvGwoakbsRMQpZF2szwLuluCMRa+7hRUXB/fBqphnHpjkd0nrg919chsmAMd37Rt58JopyAFSV6v/qkcha5nKP8MU4wIQ5NnZ3G+pOZQY6VlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by DBAP193MB0890.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 10:32:00 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:32:00 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 4/4] sstate: Drop SSTATEPOSTINSTFUNC support
Date: Mon,  2 Sep 2024 11:31:48 +0100
Message-Id: <20240902103148.3762538-4-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902103148.3762538-1-pedro.silva.ferreira@criticaltechworks.com>
References: <20240902103148.3762538-1-pedro.silva.ferreira@criticaltechworks.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0502.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3da::27) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|DBAP193MB0890:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a4cc4ae-012a-410a-f15e-08dccb3a78c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UHJLhGKl5LW7MPOs+aj2DVX5VhxjtuQtP8mBj9NHHWmnXrPrTidY6BUIDPaI?=
 =?us-ascii?Q?K8CDGL2cjSUo+8GQU/mY5e1J/uWPCgvZCGwqKfSz9k2Xnpp4ac5Bryvr4jtO?=
 =?us-ascii?Q?R0fKI6VretntFXQVFXCIgDsaqThw/EuUQfCEXwbihvAz/rW3/T81wiYsZMWC?=
 =?us-ascii?Q?sHgOWgBhA3pYjQiILvKgl2zv0owougeRugF5ZLvd9WInEHZOspr4MQDPmfbM?=
 =?us-ascii?Q?f0T24+dWZsQOxkoHILzZryMP8O7KPiwm/AoU+FSsqtTrU6MVWYZcuySzArZU?=
 =?us-ascii?Q?uiDUfp3gIOgM13qKhC1bJAHx/J0X1Qtinl0e0Kph5ihdDQlcF11njSdyGbWu?=
 =?us-ascii?Q?dQrXZH4aeEc5QE3t2ynDivqSUCfiEpqkSnmdFhBzgmoJhrNRSVE63fQJbdPu?=
 =?us-ascii?Q?1j0FBscFaNTcXp/68hImPrOFlZit4H9mn9QyC/KFRSU34PxNi1zEw0HhhMDh?=
 =?us-ascii?Q?LibDP96M/c36A2453tiwPVwv5059ouXqxyhW7MzM4JZ33iceADE4lHCkL2NV?=
 =?us-ascii?Q?1cG3g2fcUbAJ9FgAB5WJy/3JCUhgJHJB/WGqaNE68X9YPzT2mHliuQL2sfDr?=
 =?us-ascii?Q?Z4AqX6BYkpvoiyOl6jEyyn8XroTUKMRlzsvaJQcTFgV3oXGQTHOa5y2OsG8K?=
 =?us-ascii?Q?G+3pbH+mUNIgq8hT8z41a8p3GUyRvbI1ViHSUaO38Ju0hD3NViwXONjYPUNA?=
 =?us-ascii?Q?9Ae/0xPPD50Z8RiC4PSQNOBFFULPPQex4UwQb7Pj4ISxItk3DQZvrFH5ltiL?=
 =?us-ascii?Q?if4l6GbWeEdaqNBvHNs/9Q8wH6F7Me3KnopUFV7a+EZ+3lFwvrxDilrwnuWj?=
 =?us-ascii?Q?n+uFE+M62eKupTjAZ4QRwu9QU+qahDSdW0gE2SQKivYy7dyMq0No2PQicab2?=
 =?us-ascii?Q?nPROoZuYeU1Qbu8rd/BORTbtF4tQ59knEm1/9oi5+TbSdC/SUW27/azEJZA9?=
 =?us-ascii?Q?lwR2Ck/KwsTIoO18kb1Cmg5PENWnwgjxZQJjtDFVS74hu1RwU6B5StHTK+l7?=
 =?us-ascii?Q?nhZksYSdeXdb7WXeyZVcKOLaCAS9JwbXrMl0CbHkNk3w0IRECvnf5c+T248P?=
 =?us-ascii?Q?jENwB1mvhtxf2/lrRSykRpuRUCZ0MI/7dasNRt6+v+2ugdo725u+DBkxcznt?=
 =?us-ascii?Q?WLYTOBav4BB8HmNc+mLZbP9r6wt62n3Ojh3X8WeH5WnqNNQzVX73Og8dbo9U?=
 =?us-ascii?Q?04wLxzWI/XnaAxfLpyhx5VJlICDyZzjTKC3KON+StbkfDosHdsp04KiLMf1g?=
 =?us-ascii?Q?FA6ZaKNMfAw8/pJvyX9QAwKO44Db3Ypx0+KJruIAYdD8QZx66fT98xdm2L64?=
 =?us-ascii?Q?9R+n9MG6xvgqzr8TyJrEc4SfnHnzF1TyZKQmYohBIIemsOpW2C8BO5GmTN3T?=
 =?us-ascii?Q?9+4EAJAGQHtY7rtpggjnkGxanRTLaEwGJni2zEN1S6XeZjsklg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MlVzX/r3DUglJ4VZufHf12D6WFvN8vQ0tXxokbsrQvdNmOpl0QzbR0xZNnvN?=
 =?us-ascii?Q?C2vdtXnuCJBna2917ECZAH57QVEzOKFBUsL+ApBCOzYf8tD1Ft9m1J7agXE/?=
 =?us-ascii?Q?XQ94xig+QV7c1+todyDWlqmiJSWgUPvwUucBs7kZrT5URuzfKHQVGl1rx64G?=
 =?us-ascii?Q?QQSDCJ5RdtgI+KQGjdQQWJwRa6weFcno9boyhfvKWlOyRZaMtp174pvVvBd3?=
 =?us-ascii?Q?BTQ6n/shD6dSeGXucJuQaOM5i10LttkvNYdJ9In/8bFU9k6t8gc1k7Kqrryh?=
 =?us-ascii?Q?L6pQ/EgwBIb41GbhsdKcqLhrm3MvO+nZ7KYeQIp+z2ed2o+knsvYcEFsSSg8?=
 =?us-ascii?Q?bFSMigKmXn6v/RsR1y51oWd2lYmVTJu+dP353kJ6huA59ov8JUX4ICUznEBo?=
 =?us-ascii?Q?iS8Yczoch4vBzgKaEyh5hZzTmoYVWAbTwrQCmk2pPdVadGvqnZwHFEZ7def3?=
 =?us-ascii?Q?hLqkDA75h+/vFoQ35NpZMY5BnSLzjoAgwgGXRbCf1mHF/1AFRsOqwZXHOzBP?=
 =?us-ascii?Q?7o1TTsH3T7Dk++ZbExLy+AscTc0vEHdxMvI9PXajonPBg/f7XQG7/Ddy3CZ0?=
 =?us-ascii?Q?ftUYb+Jf0TD6/WfPImsLFqZfbVfauR4vM+Z0p23YbTe2hOTNBfFOHcIbDmmv?=
 =?us-ascii?Q?OhcaliwfrxgW8Z+oa6X0fc+hWUu4QCud0iq3pgFdWN+2sovI97z6DIMibKvs?=
 =?us-ascii?Q?hwbdkNR8PE0sA2WQvuzQI8j7XDD2PNm/miTQkws3Fn+9y+jr2zQG4h2LUmib?=
 =?us-ascii?Q?yprC45o/1gYeJbQPFolhvoZjmrlDqj+sdvoB4UMB8RDZ7iHVJKuiyxaIA8py?=
 =?us-ascii?Q?iAUdYSdcaeKvcdG1eMgs+lkTi7NcSK/ufEZxiEwVXQb6pGIJCSd5SqnZ3xqF?=
 =?us-ascii?Q?ydEv9aH4dAgrggY0fRR/cYIMGQSWgV9ABbJWEdCM1g6N/4et2LHNoxRKsris?=
 =?us-ascii?Q?MSLKVYxuBCxsaNPHhEK0eiC03OTCYYCgkONTioTqaovu2yZf6TGRJeKim6YT?=
 =?us-ascii?Q?+x+aqbWS6bhB6HBsi5y+ucHAAz2R+Egm9rA6KXFeXlqDpt+ZxEjUKWn8Xfe7?=
 =?us-ascii?Q?xe9/unbGgeJ54pZIF+ukgzkbsqhfZ+Xk1KxZ6hbrCRi2i0+fRXmNOGUtaeNo?=
 =?us-ascii?Q?d0R6QDIxz2/PHHnIyssBBkbQjcspGXUesB8RXQLl4wwV9IdBffyteG3iHXif?=
 =?us-ascii?Q?N9Pz2VByEh3ftwPbHkg5qlaD0S/FSMWzn9eHNrHc7F/B6FsEuFCG/2Z1XjSV?=
 =?us-ascii?Q?uRu0py1uj/V/W43nqWXFpl0E7DSnCnnNi82rtzv/j7DEScl1wZpExi83udOF?=
 =?us-ascii?Q?8hZHUJtmI8KwGJngSdPiqd6t4k0OZbKIE5elhqvoiTUc6oLdj7PdbUsJGbhc?=
 =?us-ascii?Q?KkKclYy6Fnxb6WnHhH4lFa7vhOBdBj2hrOPcblIETdSVVl3FFreUTnHF7ZZp?=
 =?us-ascii?Q?VOWM12/1OsgZeaAMby4DSoPtIiMM5BEj9IUwZZEuM9F7GoOfvQGC0sZgxgND?=
 =?us-ascii?Q?cBF5+6IbWrtCU3YjsvhDcvw3oDpoLmV++Ha0i9GNwadWGfq8CWKC4LfNhTOV?=
 =?us-ascii?Q?pcfpa5YBU8rYN7q+EctXlrxG/B1Rf37fQuO/Dtakk1E/YYOj/8Hk3erJ6hJv?=
 =?us-ascii?Q?GJLeqp/MkelwEyMZmEPU0P4=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4cc4ae-012a-410a-f15e-08dccb3a78c2
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:31:57.5502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNKT89hC2FJHkCAInOmiVPc1MKdq4Ukhb5xzYDg6kzLieIcGOkI2Lw7RcxwTi4OX/XPK18YpBeHQSoeG6AonQnkAHPrjiC8W7tBFi0FijYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP193MB0890
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204083

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This was deprecated with the introduction of postfunc support for tasks
in general and only used by buildhistory. Now that usage has been removed,
drop the code from sstate.bbclass. Any other users should be able to use
postfuncs too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 93df5fa9e6..42b7e03513 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -103,7 +103,6 @@ SSTATECREATEFUNCS[vardeps] =3D "SSTATE_SCAN_FILES"
 SSTATEPOSTCREATEFUNCS =3D ""
 SSTATEPREINSTFUNCS =3D ""
 SSTATEPOSTUNPACKFUNCS =3D "sstate_hardcode_path_unpack"
-SSTATEPOSTINSTFUNCS =3D ""
 EXTRA_STAGING_FIXMES ?=3D "HOSTTOOLS_DIR"

 # Check whether sstate exists for tasks that support sstate and are in the
@@ -332,15 +331,10 @@ def sstate_install(ss, d):
         if os.path.exists(state[1]):
             oe.path.copyhardlinktree(state[1], state[2])

-    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS') or '').split():
-        # All hooks should run in the SSTATE_INSTDIR
-        bb.build.exec_func(postinst, d, (sstateinst,))
-
     for lock in locks:
         bb.utils.unlockfile(lock)

 sstate_install[vardepsexclude] +=3D "SSTATE_ALLOW_OVERLAP_FILES SSTATE_MAN=
MACH SSTATE_MANFILEPREFIX"
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

