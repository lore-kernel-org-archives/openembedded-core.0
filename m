Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759ABCD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:32:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web10.35607.1725273122732170815
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=WXc/u7CU;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.22.84, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyP1Kumb4+fpd3ZzBLM+Z8SBETu67Y1NKXrClxfoyauljgIuhJahhyuttbbaAEfETcvRYhpN6HR0iat0vFvgARK3Z+HpwNiiymhpLqNoNQOJt4ROXwFhS2e8CQhfPV0rzKeW0w+f7kXwAUFKIyReSkTp21UZdWusNEVhA2EDGzuzAbTAUDM0HL03+53Gwb0lWUYkfU7l8Tpij5DKF5+KL+OkasH1cBA0TEuubqS57rGyv3/T73PEBuL3PQ56t+KkhI+iA2FJ/9bCvqUX/rh9h643i0c+BBJ0/KFzqWryfBKvWnT4hjxLzI9UaUGX7ATRpp73R3P18oHtQmmVvfWLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h57vZLkjF+iXFPLDTIysrCjmF2EfwomZvHFyCiFCYiQ=;
 b=l6RrFay3cQKNnLcaZSNnc7HsuWYTj3vKA88Oa7jlLOQoMILnNtfPEdeDaA4/zQlxO8yM81zgPFCxZ0tMcKSvyT/puD5clRluUZX9Fjz3AVbO1ctlMPfhd+sUr3H1rJMGFIPvSBC22CC0bWlyCIQ83GL1LHrFZt4P2WQh9MxJ/GZMJdOArzZKrkxXT6THPcoLqOB9QWRJmGsnUCyydpcxcEfBx+0/ysmDxN+herRs8JohgP/wXGaqB0RNHlKZYFvl88tqiyN/gXqQKosxzl6l9AAlQ2KXV0eFOhcfqOhEAvCfmZnpnaF42I4MOTFDKZEmCwWTVBGd+AnpJZXGmjEcSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h57vZLkjF+iXFPLDTIysrCjmF2EfwomZvHFyCiFCYiQ=;
 b=WXc/u7CU++oT81yzEQ9yVmYZWuH+4NZgVlWed3Su8P0eTFaLEJLjlS2apmMwrJow07OtOz2WB7f957yGX0M168Trt6UfqEtHDX1wp3PDLUwL39VyWoAa5DdhcN11FpmInOrCfD1rH7vQrz46KGlOxoHPD2mxi4MpVXEr3FQIr0EtTac055qqFC8VVVPPQzsloSu0snPwMYLaHhRUzgXalLdEg1AAGG5pxMfpLC5kuFtJXG6Z7ZeV1Tl9B9aoDPJDLUJDVIojaMb++CP8SjPs2RmAqfq2cvKqCyuDkB8afhCbYm01HD0aW9UnZQlkHb4NnyR2Vd9KsFbCsz3Dgiavgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by DBAP193MB0890.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 10:31:56 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:31:56 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>,
	Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/4] buildhistory: Restoring files from preserve list
Date: Mon,  2 Sep 2024 11:31:46 +0100
Message-Id: <20240902103148.3762538-2-pedro.silva.ferreira@criticaltechworks.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1bc3b715-7990-49b5-562d-08dccb3a7853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?smw4TzuG1ikIbV2pbqtSxUgaUhPMjdGiXeGhUIYxmBYeMaMfwN0Jm+67/OLa?=
 =?us-ascii?Q?YD1o19y02cfu4kV0AjneIpzVNrD3oKkLve7Pj5jTRp/u7yc0uLKSvvRYE6Bf?=
 =?us-ascii?Q?Hn9Cbw6xo87c8pHYvh13KDi8N1oSfn90APuxlZWH2uhTJ+6FbEMoov1s32pz?=
 =?us-ascii?Q?nzAedXNQT4e5BXFpwuzQTXFZUEEEmKJJvOxXM6VkStE1tpC944IPzP4m142R?=
 =?us-ascii?Q?P6SDx8+kcIGwgKZYBMUMlCsnOqA66DAK5ltiXgSHO+nqy5ARUJnBggGhcQoD?=
 =?us-ascii?Q?yCgTWIRfN5wfWvLNZsrXx66H5Lk3a0KawsIj3bFP3l9t3sCSxTdCpkfYecbs?=
 =?us-ascii?Q?x3JAo6bqoODcqNMUxGuU4mExP0nZ1atD3/o8MqnheyDyOTLKImME9BabEi9e?=
 =?us-ascii?Q?SnRxqM46Tfe80ZAru49qLATHhMvl3Q5cdERGaCsvY8gwktt/w8gS4XC3TZmm?=
 =?us-ascii?Q?pTO9tb1j6Noslhx2XRdY4EIa6JM3jNYzjzgfGGyppeOuP7QoR0VTNcMI9F8b?=
 =?us-ascii?Q?UCYl1a6cH950/Acc5UxO/GMfjw03/qXyINL1ZmPm3ge2q13PWJqSVxYr3fTl?=
 =?us-ascii?Q?Edx6CskcQGMyDgqFf0aaoXoo8DtTUeMsZ6ueLBnGVASwWp9nircViteTOUM1?=
 =?us-ascii?Q?wcivNFowwpuZ6GP7GbvKtX3pgpxp1ycGz1GTlD9KbDwBMyhk3SLMI9hsgJIE?=
 =?us-ascii?Q?VKPaCApetssesMe2LlyixNM/o0RbfaLK0ZghVhXIc9ssgWnkrXB67r67Gs2V?=
 =?us-ascii?Q?MbAbAGzeaMlNt/t/1bXbCOTQCe7tHhApXvISukSrWe4fy8s0P/NVhdqgYOxA?=
 =?us-ascii?Q?XH/EtouhOu8VA7rlHcYN5KLBgVPrT3zS4HSRKzmmWpiXrD5J2x0En6InXmWv?=
 =?us-ascii?Q?CCOCGYd4gntZWbhfAI0PqB+lLXkeAEpAvVcTnbasyhPRv9c1QUrw5eOVHp/c?=
 =?us-ascii?Q?Mf4VH/CMq/twFDLM1DIkeogWf71z0WLRFTIYiUf0JOs2LkR5ix9rZ3+92C2D?=
 =?us-ascii?Q?FctB4i/kQ3Mw27adQ1qYeYOEEBns1t40T6LBAOX9bMBA01QcJ0re0dElzDhS?=
 =?us-ascii?Q?Kco8KOf1ev4zpMHkDQX7VjqlwFJyryONK3HA6vcZkJmLK9sYdlVlylEBVtTm?=
 =?us-ascii?Q?WV0/++2GGB3fnFkogQcnNiLNKl/CbNO38r0TvugIWtQXKckKRPKjVO5XaBtK?=
 =?us-ascii?Q?d/8a7AFnElQn5PBHXbJp+rUi8Eq/0NVo97SIsUI51SqrbFf3/Ae1eIoMXOIy?=
 =?us-ascii?Q?HZqUyuQm4cDSv+opq7i3smpwRGVU9QfUurtFgpVBvS2oHiLYXkXXNbvpvZ+v?=
 =?us-ascii?Q?6LDw23G54M0Krbv4WZEiukGkmVhBFVrVFR3dGbgeagVI2sjGOmT8qBUm4iie?=
 =?us-ascii?Q?clBB9otSFKL/lIXDYDk5BzGXDoHGlQFFsHRVt8fAPwjgixskDg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HStBYfMhFh/aeDjuDw3EFlZ2ktwcMl58uUah+Gzj4DEI+n5JIumAubN2r9Ru?=
 =?us-ascii?Q?HkP0wprqv9+hjZyR7FggWsfGwma7I0e1ELbpje35Bm1PGKC/eicOh2W0Zo/j?=
 =?us-ascii?Q?22LeBjo7mv43t61oNTn75zewb+lpu7/G9mFMZ2mfjtqUVqlHZoBPO8iW53Zc?=
 =?us-ascii?Q?qXXTpV/d+EcW+H0jofokv4f+RnDotzQbFx7NkhwRvsiO9eKHbxTc9Zq5hB3r?=
 =?us-ascii?Q?bm3Dmq1/ON1XWJIYkV44nnjF/6Jd1H4nVqmd+OvHMCNcJtSMSC4eFVT69RGd?=
 =?us-ascii?Q?2VZ6NzMhgGcs2t4mI8yakaumHSRyrzif3IbUGnWqbBqKR4Hsw5lhEw9r1IOO?=
 =?us-ascii?Q?K49oOjl9ZoNomJ3igRqkcfu4EaTWo8g49NPga7wndnxrh/266Gk8TM4Z7zkQ?=
 =?us-ascii?Q?pLrLbe1H+f6uGryI/78qszBNPbVivMTW9XyZHpPVeNyXntomXR38p+GV2Mcu?=
 =?us-ascii?Q?gGJYAWuROWZAmNCyqL1K7nKkMfC04QdPb2aw6ZQNeEIGtajun8x36bjaYgrQ?=
 =?us-ascii?Q?6vXhDk6iWEqLsH2BgD6fttuNNam5DrtkFavaPVtW4RZkkQWGwAghhDFGabQ6?=
 =?us-ascii?Q?b+xC6uwriWdxHv2bVLCgp+HAJ4lcQWwGkBs1R+hs/KDxgvkKyLK2daGUCMGt?=
 =?us-ascii?Q?zQQ29DFKYgKoCSXcPxrle7Qy/abIva0fGp3440VJ9vFGvUWNzYIvKI5abr6i?=
 =?us-ascii?Q?4AX8WmIs4Y/TQ4tXngSim8b5MQIehkGXcNDNo6UcA85/7uw6NKJrWArBVcDe?=
 =?us-ascii?Q?VlnKOtvruN7mDMOjiPc9EGh7WgR++baZG+0SA+FTQQg4MBuK8UiBVovZdEBK?=
 =?us-ascii?Q?W4CQYvM2oPegbm5W4ERwBjeB20Sb4upDZEy57S0CKIvmLocIZq4fTQE3+tG5?=
 =?us-ascii?Q?bb73nDXeAzJGvO+DvmFzUbQc6UpyxeOoGbBHQfNujHFX+5g7oWNF7Tdkjogy?=
 =?us-ascii?Q?RLOBzwAol8e3iZRojtY3ZNBHga8C+GT3wmdpq+WYpV6el7jC+2b0hwZQgFdN?=
 =?us-ascii?Q?KBgzXxHo0sWsMkQ7dtMm8xAYG/dxBgX+TYCmvXWfEPHw+SmI5OgLVrRhvJBm?=
 =?us-ascii?Q?fueaI4JFNkucFS8JZfnUR9AfszdfEhrcj/Sb6kOO/woO7lbRksHXqc1tNU05?=
 =?us-ascii?Q?BokV2rcKEGe+iMjwM3wGhPALXdAE8Jo47J0yNCpsnynenw7P7jOUhGgrq65l?=
 =?us-ascii?Q?u/9lGEr4xF43y2JCAcXLwKUvAQGiuNLFU3hcLMq4+Qh44Icxb7eacPlIbNUR?=
 =?us-ascii?Q?Otrcdt6Tf0UmW/gPvf85R0i8js0giyhBTWIweIoqT8tiwiTF/Nl7kXo6XndF?=
 =?us-ascii?Q?Zrgp/rtyMSEin6QZG+jCxVV6CwdgH36b5j/e9PwDQ3X+526jwMTnMVkSfpoI?=
 =?us-ascii?Q?gjWrjYHZMnRNwn4of9xrXoVLhHkxqJsONnxWtTk+Jd+EvQ/Ojw/QVD3Tqhe7?=
 =?us-ascii?Q?SIzLCFpCvDuyQCJYrZlEtIKkd5FzwlZGGJcLiJPbYH2R2KJGPouoUpOIAE8P?=
 =?us-ascii?Q?IWMO5fVIqfEpgU5t9YFeV/QPN58louiBeyU0hdf5emqHEBQoMydD0PUhAP8b?=
 =?us-ascii?Q?HKmAHpTgHkm1+KEhCUxWPbtqxx6r0kstrk0kX1RyQMv0idVvh7oqNFtsIC/b?=
 =?us-ascii?Q?EBX++6XlH506Kt9Zf0GjFD4=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc3b715-7990-49b5-562d-08dccb3a7853
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:31:56.7940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fh69cN6JtUAdOACO1ZyEDp8GNFdfw0aRwD+PbThvpoj9UIE8ApsUXm3PjJJYmbvTjJtWF0dOwxdVra+KRGWss/XPdyHIJI9GKsKqWviw5Ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP193MB0890
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204081

This fix will ensure that, when we activate feature
`BUILDHISTORY_RESET`, files marked to keep on feature
`BUILDHISTORY_PRESERVE` will indeed exist is buildhistory
final path since they are moved to buildhistory/old but
not restored at any point.

Signed-off-by: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index d219519f86..08970aafea 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -110,6 +110,7 @@ python buildhistory_emit_pkghistory() {
     import json
     import shlex
     import errno
+    import shutil

     pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE')
     oldpkghistdir =3D d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
@@ -223,6 +224,20 @@ python buildhistory_emit_pkghistory() {
         items.sort()
         return ' '.join(items)

+    def preservebuildhistoryfiles(pkg, preserve):
+        if os.path.exists(os.path.join(oldpkghistdir, pkg)):
+            listofobjs =3D os.listdir(os.path.join(oldpkghistdir, pkg))
+            for obj in listofobjs:
+                if obj not in preserve:
+                    continue
+                try:
+                    bb.utils.mkdirhier(os.path.join(pkghistdir, pkg))
+                    shutil.copyfile(os.path.join(oldpkghistdir, pkg, obj),=
 os.path.join(pkghistdir, pkg, obj))
+                except IOError as e:
+                    bb.note("Unable to copy file. %s" % e)
+                except EnvironmentError as e:
+                    bb.note("Unable to copy file. %s" % e)
+
     pn =3D d.getVar('PN')
     pe =3D d.getVar('PE') or "0"
     pv =3D d.getVar('PV')
@@ -250,6 +265,14 @@ python buildhistory_emit_pkghistory() {
     if not os.path.exists(pkghistdir):
         bb.utils.mkdirhier(pkghistdir)
     else:
+        # We need to make sure that all files kept in
+        # buildhistory/old are restored successfully
+        # otherwise next block of code wont have files to
+        # check and purge
+        if d.getVar("BUILDHISTORY_RESET"):
+            for pkg in packagelist:
+                preservebuildhistoryfiles(pkg, preserve)
+
         # Remove files for packages that no longer exist
         for item in os.listdir(pkghistdir):
             if item not in preserve:
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

