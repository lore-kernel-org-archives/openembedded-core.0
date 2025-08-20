Return-Path: <khangng@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F90FCA0EE6
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 02:56:37 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.120])
 by mx.groups.io with SMTP id smtpd.web10.11269.1755658587961718683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 19:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@os.amperecomputing.com header.s=selector2 header.b=AWJ2Ytfy;
 spf=pass (domain: os.amperecomputing.com, ip: 40.107.236.120, mailfrom: khangng@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlHjl75BKN1SB4evJVmX6vwpdahNYvZ+2AoV5zHbrwc89XbR3ElbIv6vwf0U0c1anU65wWG+WmuwD7L3A9T5uUjpbW+9iI4BALzm5TY2oIgFl65GFMff91ReMBEfHTuGmMRx+jtho4rtAa3NyZPhxpPZRbspx/VDFt2cmKBedmduP0/fOlI1ffwtPPG2py9O/CxSM4dZGB1jOTxcIL3eDa6aVQSR+6K5dvHqEtgoiR6bZUwKUqyni46UuFvvFC9AjOVaiPr/vc672XPIr0QHID8cTNCQ8PTwmerqru7j8/zgackHTXI4hSK//WsNgu9w0if7noEDbOqFSGKErroSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u57gszog7PO1YDnkV+wCAvgpAB4X8Od/WA0oNUZAcAA=;
 b=vEKfAxhHtzZxuAiUTpIfe4NlYU+CU6U9oSa2aDstM8kN4o797X37MNh8YCmNioTatoU2ojzE2F1ikk7qL5fJprWiw/U+Z/llOMa53uUd+PgghXqry8M/SMRSAaeyAES+LNOyOpKzXx4AEXH9FvKuwWahhIUlDMm6DZAofV4mnG1FWZ3mVP2WlvtwZvI2dKx65Dk07+qjgF8JdVXLFm6BC1RE6FcDweq8n88hmhWVB3+OFiBEnKBWcmoVCWR/91VfmNnCS1FOsGcmQHPzaFCHQP30Bt/5I54tvKpmFmm4R4PU3WQkxLI8S+LLdn97Xr5VRiZIv3beYyAS891t80qcPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u57gszog7PO1YDnkV+wCAvgpAB4X8Od/WA0oNUZAcAA=;
 b=AWJ2Ytfy/ygcmqQ551+YAAT0PNWcqbKj34nxZqnWLn0bVAUr0qOKSTNqttKkfVL1jwhduSvgfncy/+qBHxrR2O40Y0nPdVX0JsWkCqq5aC4AX/+nRagINLEyhEsg9oAHbe3Ku/MPuFbTeZy9q+cXpF1JixrfpyKcm3WpNK/LR9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN6PR01MB4384.prod.exchangelabs.com (2603:10b6:805:ee::11) by
 CO6PR01MB7434.prod.exchangelabs.com (2603:10b6:303:135::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Wed, 20 Aug 2025 02:56:23 +0000
Received: from SN6PR01MB4384.prod.exchangelabs.com
 ([fe80::9d63:c258:3b55:1adb]) by SN6PR01MB4384.prod.exchangelabs.com
 ([fe80::9d63:c258:3b55:1adb%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 02:56:23 +0000
From: Khang D Nguyen <khangng@os.amperecomputing.com>
To: openembedded-core@lists.openembedded.org
CC: Hieu Le <lhieu@os.amperecomputing.com>,
	Khang D Nguyen <khangng@os.amperecomputing.com>
Subject: [PATCH] systemd.bbclass: deduplicate template and instance lines in preset file
Date: Wed, 20 Aug 2025 09:55:24 +0700
Message-ID: <20250820025524.1361942-1-khangng@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::17)
 To SN6PR01MB4384.prod.exchangelabs.com (2603:10b6:805:ee::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4384:EE_|CO6PR01MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3fac4a-0869-4db0-d87c-08dddf952599
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Jz1f7mSqZS82Dct6d7kmX5RA70CFzRPWkfyAf5JiF6lM9JeP2p1Mh/yLoTaf?=
 =?us-ascii?Q?HVUrWmu1JuNamp/LtnRgA7YKHk4yTEE8hZtok5YZGAKtcRExJBhGkveh3Vwq?=
 =?us-ascii?Q?oNIgMu0XTcjCrUqScsiQ48Q6tJJMzlftOxz62qVzkUtnkS+lbv3ZWJeyTJWP?=
 =?us-ascii?Q?J3n2lLsToZU0+nNJocXmR6wOMhuLkefJTXFo2DJRhW63eN4z3h0fteZdEOPm?=
 =?us-ascii?Q?ZH17f00fWt3nAjw13I4Pbu44dpRbGnopLcmJqiP2HJ/oBK7ISC6DfQfdbTQj?=
 =?us-ascii?Q?wUHF+wleJL58hEVANt9buyGZ2s3r+TCvcWqJWzwT5MiU6q6pWbaWlz7NkDGx?=
 =?us-ascii?Q?xAyrfwAeKfCPCHbiZPYfwgR9fcOhBYZUNPt/7/7ksGqK24dH98GNwLq9U7G1?=
 =?us-ascii?Q?r3kFiPX9i6idbVKAUzr5pOQZXY0EnBPUcost6gdGd6XF1dI+ObLBkauqlrdt?=
 =?us-ascii?Q?Opa8vaWfQBlT/jk5+/DuzljJi7VEVVXOE4uav2Tfj5DAn06tf8Di8vcT54nz?=
 =?us-ascii?Q?OK2doUGB2d9DbX55mE9kejbrUHFZ/3EK01lgVaUwR26prtVkrQTX0jrhLbOA?=
 =?us-ascii?Q?z21PRH5dt3UMf7Dhya4VwdzdpcjT2oFz/MgiS7ACW2WxkoMKlmqWkeRGHS7F?=
 =?us-ascii?Q?Qu3h8DodNAg+D/O9cSpYprBV0SMDrJPuXvZmDYbuDaZ5ck2025zeFNh2KdHD?=
 =?us-ascii?Q?qGnBaMYOpDP+qoLb9iy46f0BGoFzHq4dF2QvFrVSiOppFcJfwKa9L1V5C8a4?=
 =?us-ascii?Q?UEppsQCddIRqKVb6w801P1jAHYUw7uwFr0PgaFI0xrsF+dX5htqFKioQBZ/T?=
 =?us-ascii?Q?eLczQqbNSZvhvdtH9ULevYxxvZXD1MKvCifMCqHFDuGhDnff8UazjyO33iVj?=
 =?us-ascii?Q?9r8Tiv6KY5KXB2YtB6WqSYUPP3Vn/GymEfxic8Ie6dYAl5NVaL9UFK/jriNs?=
 =?us-ascii?Q?9RIeuEkQ0F0AbB220SIt7XOkODt1nkeJd3HUzhNhQejkbcmjsdfBqgbzv887?=
 =?us-ascii?Q?uFsbHUgi3spOd76zp/nGQFnmDrDtsRFCd8smaIw+F8DY1A+RzpYWTgmqdItU?=
 =?us-ascii?Q?CH0wO0A3Q39KJzwd749zeUgdQ2/Z4bBg9FNzv61u6p+BsLQ8t43xi4vu1dVU?=
 =?us-ascii?Q?JsrPRRCA8DMZ5WiTIzd4uv9GTVaX/jvLpOd7gdIiuXLxwti0at9tSilEtPcp?=
 =?us-ascii?Q?vVA8KKRarwHmP1YSFUMDBfe/1F7y+YWWvBUGZ4S8Q+4aoyUixJeSwwFLYPra?=
 =?us-ascii?Q?n9FUcElZ5eDFsg21cZBzJ91zeZ9gnLLFAhgM6QlFc4iy+Tn1B9YpoLfN9jhw?=
 =?us-ascii?Q?eVutj5oN7XjxhCNW2buiTQGDJjQDopyS2IPHnYlrYk+AvbaORrS6gVuzVMO5?=
 =?us-ascii?Q?x2f9boSn0PFaHaEFHRNHcx6i1XA1fpb2Aw/mesrKPevc/gZE66ThYIAMjOWW?=
 =?us-ascii?Q?+CSJhIuSlQA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4384.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KKmPxbheREGWinSTGZ1heK3rBacorIDRuJqyePuRLQInURF7VvC9aWD6qIj6?=
 =?us-ascii?Q?hbG8Ju9Xx6zA6X5BMQ35V8FHujmDefMtO7tpj/u6f7YfyB5qzAoimtjZS922?=
 =?us-ascii?Q?mFVRgzhUb9CP6vNYOng3VniqOZSGcIOh1NxBg8BTtL3ZQCMojJvlIVsFI4Sa?=
 =?us-ascii?Q?N569g7zzXTNGkq67NdWn2uu9zrYE85KAjJL6yu4epogVJEzeKWxHrj+a48ox?=
 =?us-ascii?Q?UjSK5YNyV88kIgehLaXMF6pOZYHWtrq121OxuRJPe1nHlNlLXqPDxK+1bEtr?=
 =?us-ascii?Q?5D4wb7VDQxBJHC3wfSLZacrpcByjHJUZmfsHBruh1UywRXT3HYRotvldgJq1?=
 =?us-ascii?Q?UREC/rjYsaepmDFn1z12O5go5HTCvxFMGrqk2KB+ADHXgHhj3m811ml4jDNh?=
 =?us-ascii?Q?o05TN3A4SeDdISkYwgWqvhpiRDTDHktFPxlbWGK1V7diMk5KhfXXm0fHFrFT?=
 =?us-ascii?Q?6VCytdDGG7gDb+FigVbvVpjm/omEapiD5lXzR3rinvNSm1j8ah5K1zp6Hhfs?=
 =?us-ascii?Q?M2kDO4dDU2duN1PoTXRDUMHtThcj83cFaM/5WwR5bwzB/gm3iWUUCGqTL1KJ?=
 =?us-ascii?Q?FZjFnm+Jjcq6Gnlgyt9Jb2SJfdVCiJacE5x+Knc2e6ffNjpHmdikDKbWyZHm?=
 =?us-ascii?Q?PXyO62rZZIrwC81VKpSLED4uVQ5JmWyCc7L6f70gJYaNlsHNjCuZgYQDgF+/?=
 =?us-ascii?Q?qRC7O+7FYG+L3hwz6t6pg9+H1WnFkZh69sPVg7qTrJBtr2RC+pXokKp5SSwS?=
 =?us-ascii?Q?CtU4r687kZkpMcsrHYOjwWlGtE6Ci1avlpkhL1fREjPQQCKoDks3eo9eq+SY?=
 =?us-ascii?Q?II2aNZ6OmNzgr65p96TL51fx5KH4VQl15iEsILdtCfFkF+WDjU+1tHKy6uY5?=
 =?us-ascii?Q?kdDxRjwsCU21e+71qcc3urHNa5CSWgEAcpryDLMkPu2n2F7ft3MXlthmfYHW?=
 =?us-ascii?Q?JII73Mvr5m1S3tOSVv8LLFMIabydVacdPynU4yxZZaYS3rRulthqyhBXw/Ll?=
 =?us-ascii?Q?J3rL967LyMuWgcsOOgLVXLTSUQWZIK+9qp1QUKCR9PhguV6uAKyDChAdlqot?=
 =?us-ascii?Q?tuwOzW4S05A0Btg/4ht15FXBDjid5MWs7PCrlPVcf7qFgG/QANNmDBLdcsgO?=
 =?us-ascii?Q?PjSWdOC4egbnAesm19c7gT7Puh+9+kXa6hK5vU/7NIbc9oJx/QQooD1VAn57?=
 =?us-ascii?Q?FFrz5www5CHcax3BGWcKzXZvH6a5oGLGpZuPHy2F2qQ9/0SpFv/1Kt1Ut8ts?=
 =?us-ascii?Q?5tH8y/kUdhrZ/xYFMaLLXD7IbF3Lnwqx78YrbBAdMZ1Q+oQYawTygmme5c1I?=
 =?us-ascii?Q?4F1cejHhfIdD9xFk8XRI+bEmYCs6deYtTwdf2AJAg/S6lp7JgyaXyLloyEFP?=
 =?us-ascii?Q?pkrLcSaUMdGuA9t/1FP+SgrwEMOqEjMCslHiBnrr9IKetm5SN3hL79vSZN7O?=
 =?us-ascii?Q?B0xfK+ljOpkUYzMAiEsRF7DwWOlSio8lKGVp32rjg1mnV9+H6HJ//If9Jcbr?=
 =?us-ascii?Q?piNuxju/a0/N6dw5K2SsMYlYUhm8cv8R8qyjBWXUcJUz4G1TFfmDe6eyLtid?=
 =?us-ascii?Q?4FM2nZfoEhLtUUrOWycHCWXMMOYkGVSHn5xUZ5x0bYq4tBaIgZqZ0qAqwG75?=
 =?us-ascii?Q?CLOYf7CMwqBkbHlYhuUKw3U=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3fac4a-0869-4db0-d87c-08dddf952599
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4384.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 02:56:23.3633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sF3pAxtKAgvXQkakpr7d/zCVd5bqOq2j5jDOqy/IqS3uG6mT44oiWkWXOv6Z3OeSUcLmg5YlRPs0S82zSabxs5UyvU3a+5wghhJIsNH7+hJd1jk0UvuTgOnEZ8YUuzBZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR01MB7434
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 02:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222152

If SYSTEMD_SERVICE contains both template and instance names, the
preset file will contain two lines: one describing the template name
and one describing the instance names.

This is problematic because systemd.preset only use the first matching
one [1], leading to the instances not getting enabled.

For example, openbmc's obmc-console recipe has the following
final SYSTEMD_SERVICE variable:

```
SYSTEMD_SERVICE:obmc-console =3D " \
obmc-console@.service \
obmc-console-ssh@.service \
obmc-console-ssh@2200.service \
"
```

The resulting preset file will contain lines with the same name:

```
enable obmc-console@.service
enable obmc-console-ssh@.service
enable obmc-console-ssh@.service 2200
```

Fix this by interpreting the template name as a special case of empty
instances.

Tested: preset files are generated correctly:

```
enable obmc-console@.service
enable obmc-console-ssh@.service 2200
```

[1]: https://www.freedesktop.org/software/systemd/man/257/systemd.preset.ht=
ml#Preset%20File%20Format

Fixes: f33d9b1f434e ("systemd.bbclass: generate preset for templates")
Signed-off-by: Khang D Nguyen <khangng@os.amperecomputing.com>
---
 meta/classes-recipe/systemd.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 12c59647be..0e9f7cfa33 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -249,9 +249,12 @@ python systemd_populate_packages() {
                     (servicename, instance, service_type) =3D re.split('[@=
.]', service)
                     template_services.setdefault(servicename + '@.' + serv=
ice_type, []).append(instance)
                 else:
-                    fd.write("%s %s\n" % (action,service))
+                    template_services.setdefault(service, [])
             for template, instances in template_services.items():
-                fd.write("%s %s %s\n" % (action, template, ' '.join(instan=
ces)))
+                if instances:
+                    fd.write("%s %s %s\n" % (action, template, ' '.join(in=
stances)))
+                else:
+                    fd.write("%s %s\n" % (action, template))
         d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd=
_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg)))
=20
     # Run all modifications once when creating package

