Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CD0C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 14:29:25 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.115])
 by mx.groups.io with SMTP id smtpd.web10.149415.1723818559322610263
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 07:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=yCmG9Sug;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.115, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECkGGEWZmHBbBrA+BFIpAawfwfpIPCx/45+t3ie2CfnfhkJz/TN2sZCD2aCuxn2w8+kTGzdMQcjOgxQK9jWwFQ4nVwnaERq4YDA/aN92K8ZgzvAiRgoPY33k2lWq5VivtHz4UukTfxpIsgRTT6m+q/5L02wL0Rsoo7wSUF1+Wv3TAkwD05wIRyS3Xl2ZKu/D2XpS9oSGg8uPB+P+gAGfrwRG9fNJDfPOlXmgMsu0ASoOb2T/lfIOYlevThxhICHcPpU8uDSIiOAnfh+tiGSXgNa39R41Cm7TIbWcfSslQyNDs7v83A8+9XBALn3UkA5dm64v9UVLXLAfMJx4Beyljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jo4yW619K9x9SJY/+9ELu2UoLxMV4Q8Uy4VI59FJ420=;
 b=XUGyby2HxYPrQv3L0IRJxOUccR2gqKpD+kzf9zaHnS1+mAiDTKKiOFwJgU58zk8p3Y+BMZTVoEh+PDU0/gAL/yhN4kgVPJ7KePuxaljxd+PdPoGzruzKe0MiaTdBOu2YjQDy8mYwtYU3fGLXgULl2IOb4T2dUjIbN8AHSrlwZ/iWVGAV0psjhZh3FnDoKakWoD3lXwhpyAHwHOtVdH6buG1voLeza/zW0/YllcPMugAqSwZf0kCbdBksiBLN4hYMdtESYJ20JXEPlZCPAQN+COMVVU97NVcNO79ji0pzmGKDkw5YMz30YpEqvHxQyitsCq/+z4I25RvpAFPbG14xEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo4yW619K9x9SJY/+9ELu2UoLxMV4Q8Uy4VI59FJ420=;
 b=yCmG9SugQ3tNjwGbnvkNxlKKkmph2Vza+jWW2UV5GY6QbR+4Fy2aJlORhrln00HIBBkxvlI+YmkxtJ0O2eS8yN4ZkCm3p09xDxIsNYWEDqbM+50IlCMPMQN81XJotA1BiTEhrUtll8W7wM2MDcQN4u4UyPibUb8XlO0VeDLdcXTtEe64NR8WcG/tVPiVhZJBSSkU8Px0fvzZkWmM+ePhj7ogTSlQG21P5mjSb6hFkKw05j451phSNZXVhVLsZAQyvgqdvsSuDTi04xEH7xZn9m4YO4VVJGNuuloEn8rTrQRbkTUIiOMlNI83eljr1yak+LZlXhT3aeP6VWk3jwL1yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM8PR06MB7458.eurprd06.prod.outlook.com (2603:10a6:20b:369::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 14:29:15 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 14:29:15 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] image_types.bbclass: Use --force also with lz4,lzop
Date: Fri, 16 Aug 2024 14:29:02 +0000
Message-ID: <20240816142902.1709123-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0020.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::30) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM8PR06MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 355ba915-74bb-4213-3f9c-08dcbdffce61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NJRxjTJaG53tuU6Bui9BEekbKicmEskWYg8WSsrGZJVE5BCPW5SliappSMN6?=
 =?us-ascii?Q?sPRwog8b1ddZabUKmwnf8V143aZQF2l8iXQnQwwqmcyGfnf6dHqoMGZBL2s1?=
 =?us-ascii?Q?ag52JIAlJX/SoDQSAqKS/nVktFarmFL210diSsxY0ZLJ1wMGhD0rGxG0hd8b?=
 =?us-ascii?Q?x3k6dkm0FyubXc1cIpftmNtTNS3kX9LMyqEOX992jKt5xNkneruY7OXBfKX9?=
 =?us-ascii?Q?lH84QzTZslO5FsMi/D2EFJu6akiTKD06R3s7NL8N8Rzb/qVfgKdmBG8Nmvs9?=
 =?us-ascii?Q?0ZLiRkL01aenKegY7RxGyAsOmFjfd6xfUHy+Lx98sxTTct6l/DkjhxNSX9TC?=
 =?us-ascii?Q?TzC3ttNRYWs/XO/c0EK8eAgxPzJV0Y48eWYKiPUe2UodRq6Iam7N37JtYhqb?=
 =?us-ascii?Q?j76QZLQyEplVkfd8zL5OeIhXDlUn7O/AjxglfuiTt9HQoTHVO57fY16oE2hX?=
 =?us-ascii?Q?ga22GmtmfbiTCrjWOq/2JTBz+xhJDhvC1yVMWrKC8tKkIDxOrlEfoDsQAFsf?=
 =?us-ascii?Q?MVovvYayDRQZX4GeFvKXrjPSM6+gkfqI7v38Ph65UddQKePUncv61+yBSWe8?=
 =?us-ascii?Q?uoO9Pi6H+Mf3z2ziyM2ZgXjdo2yxDIkwdfSxjj2aHHALXkN6utfUei8EfLp0?=
 =?us-ascii?Q?svkiP/y1lwUpGy2aUzE+Ics0EEkDz0Jv/REmvHUJEzJULlC+kRrlZ96OZv3R?=
 =?us-ascii?Q?4Hsk0IyPLxD4RoKb75giQ7CuGM9Fnk1qYsxrVRdDX4ZZ78a6Gpsfh4X2Ijr3?=
 =?us-ascii?Q?au/KXumhGaT8eZ6ot3Xl48Dt0+EsGTnZt7M8DpGTKlkEmsnwimPCj0s2VPiP?=
 =?us-ascii?Q?yQl329dJXgm+cXmXebrywvTHLQGwgfv/px9/2NoxH6L0CC9nldvjSwJTd7M2?=
 =?us-ascii?Q?F9ujtxsy/4dKlOJJVxd90ZBmILUlMj0n/4sKtu53Nwesa5QZ66NydNcmnAwd?=
 =?us-ascii?Q?AZmHfjFuT3HrNEM8p68V3bNLlayYyS/Gno71eLXZyLUH7L8+kz0AbhRUewMs?=
 =?us-ascii?Q?QdW8vC7513rK9CgGXx2Gpk//Vh1W7oIPJNBB57oZx14Id7aC1/eP5cIroEic?=
 =?us-ascii?Q?Ep4Ehj8oEMGjZ52BEtefoXrWkitFcEnZswK2SUrAGY1VX3Q7Ta8xHYwFmnIt?=
 =?us-ascii?Q?knZ0wrRIra8Q4a8fUVinWqBTDZXOBYQ6RZLc1n6afU2PORhpvVwrm9xKXqTH?=
 =?us-ascii?Q?FOlJCaiQXEefOSV4xhQqNCq0msGWE2ATW8y5/3jUJmiJVkuS3rXbLY4iwU5d?=
 =?us-ascii?Q?LUxFMMuwDIk7vIjknwxPCxMI3RfMc9Yh9VmZHa4X8F1Oia/EJztnT8FGROZz?=
 =?us-ascii?Q?G1jxFNai2dSUh1l3A2Ai9FodTS7zz/6rprJIj8v6ansuhqF6bVLlndIUPdMw?=
 =?us-ascii?Q?sAbHuDvu3uPCwWabRHFVrKJ+fZntw0tT5xAgAmX81dRhA+Ffng=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bfUaNMY5MWp6X4hLqR9b816YPrxFFledrIoQvCnJA0vH1YnxewsHpSvYXRo5?=
 =?us-ascii?Q?eJuC9/wGupqyimyMrAt7YfBoBRzGPwrMLPkvq+vjwmDKSnzydJ6zLu6R/Bct?=
 =?us-ascii?Q?648G4+i1vVqfPSfCY/Ka6bTrT/+V1skzcoGGAsyUa3Tl9UZe5Mn3Emr4tDVJ?=
 =?us-ascii?Q?29l+Vmz8oX1zC6SaVeWDX5DdHIN2+Epvelf1V4VM9iCZ060raJ5zwBwHmJmK?=
 =?us-ascii?Q?7sO9YTxEtxMnnkY/RHmmAxrNkSTmKDC7Oh2oKvvZdxAjZeTOiou7olPyRuiS?=
 =?us-ascii?Q?VBECAKqbYDsi/1o/HDBNXDx8+bBET3QBMlqi8wHb5g9JZo4wMdRHAba673Ax?=
 =?us-ascii?Q?5mSoqp0gj7FeBuYDaobmcgB7i1ndaFLs3STBSDVKr+Uqpag19GWPtqJVJGDA?=
 =?us-ascii?Q?BidSvIimzMCRA8Otqn9H9C5x0fMOVgL0kxvBLC6GfulTCkuQuVAa2csT/itR?=
 =?us-ascii?Q?lgSH0YkuMokbj9sM7yjlgdQaylHhmQfMvIYKbcZPyyhcacgozoQj62ydr5gx?=
 =?us-ascii?Q?DbNvY5SDxgZOjwbKWaluk9sJC+hQmyEJMUOmJlpWhA0utm1hVPs8pPedKmGJ?=
 =?us-ascii?Q?k+A45s9vQkL5Yf4qw7MEQOgX+dwlzA8GWssrfp4KDsi3bZbAFmWQuk4l3srI?=
 =?us-ascii?Q?eNNKTFCGii8Lvyn1zb9cfPCC7faY6wm8qf2EE9gyRB+ECexxhjXwasJqn1Ir?=
 =?us-ascii?Q?0KlLg4967I+ee+PlgBd5++2A/wYmupcWRpU/duWsXnnlLnxWQowpfAeCmAdD?=
 =?us-ascii?Q?9zs6qSroRVMK/Mtne07IhQdjeU5VwXU9IikcK+D79bMtH5hRI1aVpp6wyZZQ?=
 =?us-ascii?Q?tGIe2uP4CI2yQSqJWf/WOUmH3Jadmfpy1GAqsP1SrFL6NH7jGlU73yWGk7g6?=
 =?us-ascii?Q?47PccQCrVltlW1tcMDTwnaoYWsEH4hqdlFZPzYI/xOQkQ+QOpLfnlZFUTqE/?=
 =?us-ascii?Q?iGkmJt+32fswy/zKH7G0MamZ/cRhHef0jqE8FkDrz459GEqtSDVf2+kpRTud?=
 =?us-ascii?Q?oCxJjg5Fx9Nk0Gg3gFfxv8bvX3qtOzByGYcWBD2RAl7zwAcgVM3RquAKyrfZ?=
 =?us-ascii?Q?vvOLBkRYWgDkY35LQNSdescK4O5pCG3zGouBZSnWngjUvsQv5UqJ7+NdPKmM?=
 =?us-ascii?Q?Jq/wu4uh2ZBvUVuqGdRepSxXq3ypbR0/FysSnS1mgPPSNJxegpa3lj5WmrkF?=
 =?us-ascii?Q?WywsA9QSNzLyjMxPqEtXFCeWL4RYe3qXE7nmPcNCpKvmROXE/eY06qfOKtXl?=
 =?us-ascii?Q?e8+/RqaO7CVaQUQJ+MQQFde29JMmQTgozztuh/Ach0uWn7oPLxWsQZ2hIK/r?=
 =?us-ascii?Q?H1Xx4GXQ/GiKXAy+xYXwY86QXUHSmvw+7Vwn7dM9h6/x2KANIaa/Uj20+lvu?=
 =?us-ascii?Q?tro5FFdLAu2FutnIxV3xrIHNARToHfLTX3jWhoY9Eglxtl2rRHGxes620K8K?=
 =?us-ascii?Q?CGF9+pACdc/XqygkXifEtbLPXKWRyk+Iyc3Cvts6nVgDa7yASxVdogaf4zOj?=
 =?us-ascii?Q?oDTb9X462jY5BQFICc0KmNH5opdv7j7EhMlTuUpncrW+o+jPPerKe3HXNfNa?=
 =?us-ascii?Q?Hr7msCI3QPxlHST9KmgLVxW7WnHAPAu3OcnWBnZVlcUC3c0VQdLg9t7NVchF?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355ba915-74bb-4213-3f9c-08dcbdffce61
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 14:29:15.7779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ljn5wc9WlcRbAJ1vyKiFUHq/9DjCLv8itX1hzZHRBn0kJ2sDw2YNuocsLEBL/haSB271iFWeVG9j3kF8jaaATA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7458
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 14:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203468

Several conversion commands already make use of 'force' option in the
compression, which enables overwriting existing files without
prompting.

Since occasionally an existing residual destination file from a
previously aborted or failed task can prevent the re-execution of the
conversion command task, by enabling the 'force' option also for lz4
and lzop compression commands we can avoid following kind of BitBake
failures with these compressors:

  | DEBUG: Executing shell function do_image_cpio
  | 117685 blocks
  | 2 blocks
  | example-image.cpio.lz4 already exists; do you want to overwrite (y/N) ?=
     not overwritten
  | Error 20 : example-image.cpio : open file error
  | WARNING: exit code 20 from a shell command.
  ERROR: Task (.../recipes-core/images/example-image.bb:do_image_cpio) fail=
ed with exit code '1'

(From OE-Core rev: 623ab22434909f10aaf613cd3032cc2a2c6e3ff9)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class
index 9d5f8c68a4..72245019f4 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -292,8 +292,8 @@ CONVERSION_CMD:lzma =3D "lzma -k -f -7 ${IMAGE_NAME}${I=
MAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD:gz =3D "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_N=
AME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD:bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype}"
 CONVERSION_CMD:xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} =
--check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >=
 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
-CONVERSION_CMD:lz4 =3D "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
-CONVERSION_CMD:lzo =3D "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD:lz4 =3D "lz4 -f -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.=
${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
+CONVERSION_CMD:lzo =3D "lzop -f -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${typ=
e}"
 CONVERSION_CMD:zip =3D "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_=
NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD:zst =3D "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IMAG=
E_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype}.zst"
 CONVERSION_CMD:sum =3D "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${typ=
e} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}=
"
--=20
2.39.2


