Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD07C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 17:19:40 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.114])
 by mx.groups.io with SMTP id smtpd.web10.60287.1697822371185065204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 10:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=QRby1Xbl;
 spf=pass (domain: ni.com, ip: 40.107.244.114, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igW1Yeuo5YsqmElk/iTm6VbH2OsvioldxZvMkiAa38U9A8TAW9JU4Go97jUSMTwx8OepxcGJ5saDfzy/WjaPDUN9J7/WPpPRD3ec7n5qVJg2LMIjd97xrud7v4KnfCdwB6ndwebVhiMzNut2a1gdXL9elzNnwxMalhs7fPddzyssm+vQrzpghd/3NcbAY2Gai02r68gan5FKK0DxEPZ1Mk/EeLTbpWSO2/NiBQ5/mDZ83uYT4RlDhaxQSiaPpy5wFV4c4IOz+5e19N6BPGdeIwS+nWES4Ak6H0f8wjk9+Cugy6tLvBBMALVkndtF1Qt5Qqn6Ej7NifewY5DQwf6q5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vepikeVPeRk8HyYRm4shXJ1utYHV8KnU6JZHsSPGkVE=;
 b=Ky+Agwuj7ggLa5j5eaSJv3tcBseK25NesFkG3cZSjqmG2ZEdo1v98C6gx8WYMk684nEcPTxUPfItI2Fd1VR8UOkdpc77uhZaEMP30gyjPzX97n49ybMOv0Ru7Yd6wbodL44p0SUwue5KETKpnVL1Pa3BBdvy+vld2uRigQ8xebkXXaqJa534Qa+7gvyx7CYAGl6KJ55fVYjp0UD/qgJpFbXPvgTY9D95NDv4V5pwOMwxilT1k/SzCcCgzWnTVcv9IwjgIMIaSLJGro+yPVH/9yLcNhulULGxs0eJL/Ip6U205gk5JErtoo72Jif6O6kUgjuZZ/XP3K6Gf3I5fe3BdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vepikeVPeRk8HyYRm4shXJ1utYHV8KnU6JZHsSPGkVE=;
 b=QRby1XblkACcN0UcNph5AprJsS5L82Z9VsBtRWB9LJXirAL5216MNivO1ceRgvKXzqkJdMp7O38rljrGdVvhV5UUAOcHXVNQiW792gCQMID6MA/7QBiAXaVOb1cmqYDr9fKRiBgkil/IL7u+Wg+8Uj0+25ouHtaIUSf2w6cO6Cg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by CO6PR04MB7777.namprd04.prod.outlook.com (2603:10b6:5:354::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 17:19:28 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::7011:ebc:fcad:2076]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::7011:ebc:fcad:2076%6]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 17:19:28 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core][PATCH] libsndfile1: fix CVE-2022-33065
Date: Fri, 20 Oct 2023 13:19:22 -0400
Message-ID: <20231020171922.2269700-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0510.namprd03.prod.outlook.com
 (2603:10b6:408:130::35) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|CO6PR04MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: ea8b6a95-c08d-404d-0be1-08dbd190b61e
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GwRG4A8bUfzD+CwzabNonIXkmGECMSnsF039WangoHS1xMrttlsENPIFk70EEgYuZjLgUIcNZH5wpOa7lqcOfHfmSzpREXwiCAobKX2eejkwAd9Pqd7gD450wiSBrBWWZ3D4hifE6Lskg2cMv1BfwmeYKtz6r/bKHJ5a9sNpRGeu+cjnZfESrV6eXW8Y+81HgRET14PdbUJJ6d9JX8dABbhFCHNLRgUmCQSUrJo1VV8PKKkcniyBO5WwgWcKUXEtqUwVnUwqNIF0iusnukiaSrGN2IB43xUvnwEQwsKzwojxSVp6IG3GBIMt9g+okfcdDdoWq0xaIjqn6usn44EGoX2fhRz4qHFtPltVrmnwjSVVkGBOvA7+gceRgKIYZSMbYfPPlDbubHMI2GwoTmHXT7b2uycqi5/XeypnmHm62PeRDObyAY0snIU3eGmw1A59iqTVkOr+Vn6eXBBHIPU0Z+OluYZz6s1TIKnHUg+gmia7vEikbCAEePzyfxvVbh3EqHg9WmfNibhoJ/s1CnHVLXaqT+agKQo2Nou184LT3JlLW0uw9LTaOZT9c08nj++SiArr/kGaOc58nCq/apDi4UsLP35lRgSb7K7ZbvfMJQj+fbUsVpBvJGEesSzVBbTymUoHdRPLqwYjA5roXg0hvQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2906002)(30864003)(5660300002)(8936002)(8676002)(4326008)(83380400001)(41300700001)(44832011)(38100700002)(6506007)(6512007)(2616005)(1076003)(6666004)(86362001)(36756003)(6916009)(66476007)(66556008)(66946007)(478600001)(966005)(6486002)(316002)(473944003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yUhsuQE5DfzlAvVIlb8XDojFYtz2QxkvIZaVEnlBS+18XVvZSJY/9qczAlTq?=
 =?us-ascii?Q?EHPcEVXXM5VfY4+wZmgFSSv55Tk4ZOkvlWZBrO5eGKzQ2x5aWEsuvNpj8sXI?=
 =?us-ascii?Q?lVP0+VEk/z5XbywN8B1y2LP8hIc4T0za13tdDKNK7xX15uz2aPXwyVYqWBwd?=
 =?us-ascii?Q?Gc0M96PcWwajT23pZzGPaJ6FzpYqf0s82auEeL+os7pWnqkoS781AhKrV4mE?=
 =?us-ascii?Q?PoLq6iEd9jUpbJ4NxDm0qzr/s2v5ElfxH/spjvpakPCA05SzbJq3lKZ6HKwz?=
 =?us-ascii?Q?2GaNEwD+QMyiwYjYvugLeyRckGJiYSWURq2RAOYcd+OqwL4HyY8Gc7wKLxdT?=
 =?us-ascii?Q?bxFwXRZqIdxYtXY5Pkxcmn+6kRHO9kOt9i/ST92v+NOZN7rlKLdAKy/3jBAM?=
 =?us-ascii?Q?0eGxbpgI4KLb5NJT12wtdn5YFL2iWhAY2NxKPRw+1Pj1wMfxq4C6luVV1tjY?=
 =?us-ascii?Q?9kGcjGZdNimy2OKvAOKh5xbtOMshD4jrTCg30YvEHO+WBDPHqn9frA/uzOj4?=
 =?us-ascii?Q?CN29BCDceZnvn9ijKdgqfpaZJE4mQjdPS52jBSevPgHWmhkVOP+UBUfzfkIn?=
 =?us-ascii?Q?ZL/H+A+kO+ilItrhUp+w4Le8/0MeeIVL8Tdry290Ygp1p6QDaQsOcBlbPavi?=
 =?us-ascii?Q?r9/fn4dKdc3DsKrn9xgUcAsIEfZPnAghcU9/UXx8OeCyg9GonKfpOTmWvdOi?=
 =?us-ascii?Q?MVrmOesZRHhERWEjJWWni//HyAPYBl+GXr0TNusUBcdTjhpwC+hiprWZCrm3?=
 =?us-ascii?Q?i3tLbEOVURMRmwraw/WJcnHgIwTVjR4vC/HCtx4BTacFSq5N1UrP6/LAb5Qi?=
 =?us-ascii?Q?QND7i8hPQ3HEEDvDL+7leO21RrUMQAMBp9kkYA4ALEu0sVSTybuiI/lyKHXm?=
 =?us-ascii?Q?J/wLODppY+cnTa5wsJdV6NoUYlhX5e9FBRcoqBcXtqMw5JsmLMEYOYH1PP2B?=
 =?us-ascii?Q?VhPcMmqVFNWWRxpHHYhuDro9jfH8uva4QuEmOZp7RU85d6BvjuVXn8wULJTt?=
 =?us-ascii?Q?/l1Xo+9UVpTf54bSBDsj0NWIYnDdbWaWBcm+4WPFZFRKE0PFqU4+6z3FA0dz?=
 =?us-ascii?Q?oSTZFlS0jwwEDt54bVnZ1jDW0tPYALabHOsYaRquxf/Y66I6GrGG310Q8HzZ?=
 =?us-ascii?Q?FQs53y/0DoBopva7J8KGAqDdmOfn1CmPoawXea3MT9oUjpp26lCej/j4KkZe?=
 =?us-ascii?Q?AAH3Lv7SOu8kZ34bh/HhzlDXXhhNrJlh1cqfIquY/7vYxk1mCaxReL1WYCwt?=
 =?us-ascii?Q?s77Ocm31TT8lBdjoxnU+AJr/GGcgA4VDX0QGs+jS/oRWwHdvSdPQHxzymorE?=
 =?us-ascii?Q?cU51l5+JDBGh7q7RweXtdRAPZ7cRHwyZaZVafqhLozQuAB5aquz6gOwXNMFj?=
 =?us-ascii?Q?zlsy3oiKEeoTxWCOsVQfs0uVxWNat/NJwDARjj/r/vtV2ObPjM01IEOhRGww?=
 =?us-ascii?Q?C5q2+93SvmtSTvuXvUgtbwSHGBTcMfwgi+sgH9eT43H29mtxfMUqiqJAyFyT?=
 =?us-ascii?Q?BI2Leqo0y6T5hJE/SJQNtYUhUA2x9zdmExaJ7xs27N2R4z8pj5Easpm+MI42?=
 =?us-ascii?Q?1gZ2UOZZRz8RNBTNpEVBDukiOyW2l73Xj66ik0wsJnorsN+BhyHXHpyfW9b0?=
 =?us-ascii?Q?dzFWrc2nOVXyvTfX9e7hJbw=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8b6a95-c08d-404d-0be1-08dbd190b61e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 17:19:26.6498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QGVLx8/v9W9WnmuGOGWBwKuhJI0ysviQbH1aIHFgKmVfMj/NopnLx7QykrebdBnPcgFo/WElk9by5W5Ke9m9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7777
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 17:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189576

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 .../libsndfile1/cve-2022-33065.patch          | 739 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |   1 +
 2 files changed, 740 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/cve-2022=
-33065.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/cve-2022-33065.=
patch b/meta/recipes-multimedia/libsndfile/libsndfile1/cve-2022-33065.patch
new file mode 100644
index 0000000000..fa4b2fc08b
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/cve-2022-33065.patch
@@ -0,0 +1,739 @@
+From c7ce5b0ebeeb58934825077d1324960aa0747718 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 10 Oct 2023 16:10:34 -0400
+Subject: [PATCH] mat4/mat5: fix int overflow in dataend calculation
+
+The clang sanitizer warns of a possible signed integer overflow when
+calculating the `dataend` value in `mat4_read_header()`.
+
+```
+src/mat4.c:323:41: runtime error: signed integer overflow: 205 * -10066329=
6 cannot be represented in type 'int'
+SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior src/mat4.c:323:41 =
in
+src/mat4.c:323:48: runtime error: signed integer overflow: 838860800 * 4 c=
annot be represented in type 'int'
+SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior src/mat4.c:323:48 =
in
+```
+
+Cast the offending `rows` and `cols` ints to `sf_count_t` (the type of
+`dataend` before performing the calculation, to avoid the issue.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/789
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Upstream-Status: Backport [9a829113c88a51e57c1e46473e90609e4b7df151]
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+---
+ src/mat4.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mat4.c b/src/mat4.c
+index 0b1b414b..575683ba 100644
+--- a/src/mat4.c
++++ b/src/mat4.c
+@@ -320,7 +320,7 @@ mat4_read_header (SF_PRIVATE *psf)
+ 				psf->filelength - psf->dataoffset, psf->sf.channels * psf->sf.frames =
* psf->bytewidth) ;
+ 		}
+ 	else if ((psf->filelength - psf->dataoffset) > psf->sf.channels * psf->s=
f.frames * psf->bytewidth)
+-		psf->dataend =3D psf->dataoffset + rows * cols * psf->bytewidth ;
++		psf->dataend =3D psf->dataoffset + (sf_count_t) rows * (sf_count_t) col=
s * psf->bytewidth ;
+=20
+ 	psf->datalength =3D psf->filelength - psf->dataoffset - psf->dataend ;
+=20
+From 842303f984b2081481e74cb84a9a24ecbe3dec1a Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 16:36:02 -0400
+Subject: [PATCH] au: avoid int overflow while calculating data_end
+
+At several points in au_read_header(), we calculate the functional end
+of the data segment by adding the (int)au_fmt.dataoffset and the
+(int)au_fmt.datasize. This can overflow the implicit int_32 return value
+and cause undefined behavior.
+
+Instead, precalculate the value and assign it to a 64-bit
+(sf_count_t)data_end variable.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+---
+ src/au.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/au.c b/src/au.c
+index 62bd691d..f68f2587 100644
+--- a/src/au.c
++++ b/src/au.c
+@@ -291,6 +291,7 @@ static int
+ au_read_header (SF_PRIVATE *psf)
+ {	AU_FMT	au_fmt ;
+ 	int		marker, dword ;
++	sf_count_t data_end ;
+=20
+ 	memset (&au_fmt, 0, sizeof (au_fmt)) ;
+ 	psf_binheader_readf (psf, "pm", 0, &marker) ;
+@@ -317,14 +318,15 @@ au_read_header (SF_PRIVATE *psf)
+ 		return SFE_AU_EMBED_BAD_LEN ;
+ 		} ;
+=20
++	data_end =3D (sf_count_t) au_fmt.dataoffset + (sf_count_t) au_fmt.datasi=
ze ;
+ 	if (psf->fileoffset > 0)
+-	{	psf->filelength =3D au_fmt.dataoffset + au_fmt.datasize ;
++	{	psf->filelength =3D data_end ;
+ 		psf_log_printf (psf, "  Data Size   : %d\n", au_fmt.datasize) ;
+ 		}
+-	else if (au_fmt.datasize =3D=3D -1 || au_fmt.dataoffset + au_fmt.datasiz=
e =3D=3D psf->filelength)
++	else if (au_fmt.datasize =3D=3D -1 || data_end =3D=3D psf->filelength)
+ 		psf_log_printf (psf, "  Data Size   : %d\n", au_fmt.datasize) ;
+-	else if (au_fmt.dataoffset + au_fmt.datasize < psf->filelength)
+-	{	psf->filelength =3D au_fmt.dataoffset + au_fmt.datasize ;
++	else if (data_end < psf->filelength)
++	{	psf->filelength =3D data_end ;
+ 		psf_log_printf (psf, "  Data Size   : %d\n", au_fmt.datasize) ;
+ 		}
+ 	else
+From 0754d3380a54e3fbdde0f684b88955c80c79f58f Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 16:46:29 -0400
+Subject: [PATCH] avr: fix int overflow in avr_read_header()
+
+Pre-cast hdr.frames to sf_count_t, to provide the calculation with
+enough numeric space to avoid an int-overflow.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+---
+ src/avr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/avr.c b/src/avr.c
+index 6c78ff69..1bc1ffc9 100644
+--- a/src/avr.c
++++ b/src/avr.c
+@@ -162,7 +162,7 @@ avr_read_header (SF_PRIVATE *psf)
+ 	psf->endian =3D SF_ENDIAN_BIG ;
+=20
+  	psf->dataoffset =3D AVR_HDR_SIZE ;
+-	psf->datalength =3D hdr.frames * (hdr.rez / 8) ;
++	psf->datalength =3D (sf_count_t) hdr.frames * (hdr.rez / 8) ;
+=20
+ 	if (psf->fileoffset > 0)
+ 		psf->filelength =3D AVR_HDR_SIZE + psf->datalength ;
+From 6ac31a68a614e2bba4a05b54e5558d6270c98376 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 16:54:21 -0400
+Subject: [PATCH] sds: fix int overflow warning in sample calculations
+
+The sds_*byte_read() functions compose their uint_32 sample buffers by
+shifting 7bit samples into a 32bit wide buffer, and adding them
+together. Because the 7bit samples are stored in 32bit ints, code
+fuzzers become concerned that the addition operation can overflow and
+cause undefined behavior.
+
+Instead, bitwise-OR the bytes together - which should accomplish the
+same arithmetic operation, without risking an int-overflow.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Do the same for the 3byte and 4byte read functions.
+---
+ src/sds.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/sds.c b/src/sds.c
+index 6bc76171..2a0f164c 100644
+--- a/src/sds.c
++++ b/src/sds.c
+@@ -454,7 +454,7 @@ sds_2byte_read (SF_PRIVATE *psf, SDS_PRIVATE *psds)
+=20
+ 	ucptr =3D psds->read_data + 5 ;
+ 	for (k =3D 0 ; k < 120 ; k +=3D 2)
+-	{	sample =3D arith_shift_left (ucptr [k], 25) + arith_shift_left (ucptr =
[k + 1], 18) ;
++	{	sample =3D arith_shift_left (ucptr [k], 25) | arith_shift_left (ucptr =
[k + 1], 18) ;
+ 		psds->read_samples [k / 2] =3D (int) (sample - 0x80000000) ;
+ 		} ;
+=20
+@@ -498,7 +498,7 @@ sds_3byte_read (SF_PRIVATE *psf, SDS_PRIVATE *psds)
+=20
+ 	ucptr =3D psds->read_data + 5 ;
+ 	for (k =3D 0 ; k < 120 ; k +=3D 3)
+-	{	sample =3D (((uint32_t) ucptr [k]) << 25) + (ucptr [k + 1] << 18) + (u=
cptr [k + 2] << 11) ;
++	{	sample =3D (((uint32_t) ucptr [k]) << 25) | (ucptr [k + 1] << 18) | (u=
cptr [k + 2] << 11) ;
+ 		psds->read_samples [k / 3] =3D (int) (sample - 0x80000000) ;
+ 		} ;
+=20
+@@ -542,7 +542,7 @@ sds_4byte_read (SF_PRIVATE *psf, SDS_PRIVATE *psds)
+=20
+ 	ucptr =3D psds->read_data + 5 ;
+ 	for (k =3D 0 ; k < 120 ; k +=3D 4)
+-	{	sample =3D (((uint32_t) ucptr [k]) << 25) + (ucptr [k + 1] << 18) + (u=
cptr [k + 2] << 11) + (ucptr [k + 3] << 4) ;
++	{	sample =3D (((uint32_t) ucptr [k]) << 25) | (ucptr [k + 1] << 18) | (u=
cptr [k + 2] << 11) | (ucptr [k + 3] << 4) ;
+ 		psds->read_samples [k / 4] =3D (int) (sample - 0x80000000) ;
+ 		} ;
+=20
+From 96428e1dd4998f1cd47df24f8fe9b0da35d7b947 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 17:26:51 -0400
+Subject: [PATCH] aiff: fix int overflow when counting header elements
+
+aiff_read_basc_chunk() tries to count the AIFF header size by keeping
+track of the bytes returned by psf_binheader_readf(). Though improbable,
+it is technically possible for these added bytes to exceed the int-sized
+`count` accumulator.
+
+Use a 64-bit sf_count_t type for `count`, to ensure that it always has
+enough numeric space.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+---
+ src/aiff.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/aiff.c b/src/aiff.c
+index a2bda8f4..6b244302 100644
+--- a/src/aiff.c
++++ b/src/aiff.c
+@@ -1702,7 +1702,7 @@ static int
+ aiff_read_basc_chunk (SF_PRIVATE * psf, int datasize)
+ {	const char * type_str ;
+ 	basc_CHUNK bc ;
+-	int count ;
++	sf_count_t count ;
+=20
+ 	count =3D psf_binheader_readf (psf, "E442", &bc.version, &bc.numBeats, &=
bc.rootNote) ;
+ 	count +=3D psf_binheader_readf (psf, "E222", &bc.scaleType, &bc.sigNumer=
ator, &bc.sigDenominator) ;
+From b352c350d35bf978e4d3a32e5d9df1f2284445f4 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 17:43:02 -0400
+Subject: [PATCH] ircam: fix int overflow in ircam_read_header()
+
+When reading the IRCAM header, it is possible for the calculated
+blockwidth to exceed the bounds of a signed int32.
+
+Use a 64bit sf_count_t to store the blockwidth.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+---
+ src/common.h |  2 +-
+ src/ircam.c  | 10 +++++-----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/common.h b/src/common.h
+index d92eabde..5369cb67 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -439,7 +439,7 @@ typedef struct sf_private_tag
+ 	sf_count_t		datalength ;	/* Length in bytes of the audio data. */
+ 	sf_count_t		dataend ;		/* Offset to file tailer. */
+=20
+-	int				blockwidth ;	/* Size in bytes of one set of interleaved samples. =
*/
++	sf_count_t		blockwidth ;	/* Size in bytes of one set of interleaved samp=
les. */
+ 	int				bytewidth ;		/* Size in bytes of one sample (one channel). */
+=20
+ 	void			*dither ;
+diff --git a/src/ircam.c b/src/ircam.c
+index 8e7cdba8..3d73ba44 100644
+--- a/src/ircam.c
++++ b/src/ircam.c
+@@ -171,35 +171,35 @@ ircam_read_header	(SF_PRIVATE *psf)
+ 	switch (encoding)
+ 	{	case IRCAM_PCM_16 :
+ 				psf->bytewidth =3D 2 ;
+-				psf->blockwidth =3D psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth =3D (sf_count_t) psf->sf.channels * psf->bytewidth ;
+=20
+ 				psf->sf.format =3D SF_FORMAT_IRCAM | SF_FORMAT_PCM_16 ;
+ 				break ;
+=20
+ 		case IRCAM_PCM_32 :
+ 				psf->bytewidth =3D 4 ;
+-				psf->blockwidth =3D psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth =3D (sf_count_t) psf->sf.channels * psf->bytewidth ;
+=20
+ 				psf->sf.format =3D SF_FORMAT_IRCAM | SF_FORMAT_PCM_32 ;
+ 				break ;
+=20
+ 		case IRCAM_FLOAT :
+ 				psf->bytewidth =3D 4 ;
+-				psf->blockwidth =3D psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth =3D (sf_count_t) psf->sf.channels * psf->bytewidth ;
+=20
+ 				psf->sf.format =3D SF_FORMAT_IRCAM | SF_FORMAT_FLOAT ;
+ 				break ;
+=20
+ 		case IRCAM_ALAW :
+ 				psf->bytewidth =3D 1 ;
+-				psf->blockwidth =3D psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth =3D (sf_count_t) psf->sf.channels * psf->bytewidth ;
+=20
+ 				psf->sf.format =3D SF_FORMAT_IRCAM | SF_FORMAT_ALAW ;
+ 				break ;
+=20
+ 		case IRCAM_ULAW :
+ 				psf->bytewidth =3D 1 ;
+-				psf->blockwidth =3D psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth =3D (sf_count_t) psf->sf.channels * psf->bytewidth ;
+=20
+ 				psf->sf.format =3D SF_FORMAT_IRCAM | SF_FORMAT_ULAW ;
+ 				break ;
+From 3bcd291e57867f88f558fa6f80990e84311df78c Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 16:12:22 -0400
+Subject: [PATCH] mat4/mat5: fix int overflow when calculating blockwidth
+
+Pre-cast the components of the blockwidth calculation to sf_count_t to
+avoid overflowing integers during calculation.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+---
+ src/mat4.c | 2 +-
+ src/mat5.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/mat4.c b/src/mat4.c
+index 575683ba..9f046f0c 100644
+--- a/src/mat4.c
++++ b/src/mat4.c
+@@ -104,7 +104,7 @@ mat4_open	(SF_PRIVATE *psf)
+=20
+ 	psf->container_close =3D mat4_close ;
+=20
+-	psf->blockwidth =3D psf->bytewidth * psf->sf.channels ;
++	psf->blockwidth =3D (sf_count_t) psf->bytewidth * psf->sf.channels ;
+=20
+ 	switch (subformat)
+ 	{	case SF_FORMAT_PCM_16 :
+diff --git a/src/mat5.c b/src/mat5.c
+index da5a6eca..20f0ea64 100644
+--- a/src/mat5.c
++++ b/src/mat5.c
+@@ -114,7 +114,7 @@ mat5_open	(SF_PRIVATE *psf)
+=20
+ 	psf->container_close =3D mat5_close ;
+=20
+-	psf->blockwidth =3D psf->bytewidth * psf->sf.channels ;
++	psf->blockwidth =3D (sf_count_t) psf->bytewidth * psf->sf.channels ;
+=20
+ 	switch (subformat)
+ 	{	case SF_FORMAT_PCM_U8 :
+From c177e292d47ef73b1d3c1bb391320299a0ed2ff9 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Mon, 16 Oct 2023 12:37:47 -0400
+Subject: [PATCH] common: fix int overflow in psf_binheader_readf()
+
+The psf_binheader_readf() function attempts to count and return the
+number of bytes traversed in the header. During this accumulation, it is
+possible to overflow the int-sized byte_count variable.
+
+Avoid this overflow by checking that the accumulated bytes do not exceed
+INT_MAX and throwing an error if they do. This implies that files with
+multi-gigabyte headers threaten to produce this error, but I imagine
+those files don't really exist - and this error is better than the
+undefined behavior which would have resulted previously.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+---
+ src/common.c | 36 ++++++++++++++++++++++++------------
+ 1 file changed, 24 insertions(+), 12 deletions(-)
+
+diff --git a/src/common.c b/src/common.c
+index 1c3d951d..7f6cceca 100644
+--- a/src/common.c
++++ b/src/common.c
+@@ -18,6 +18,7 @@
+=20
+ #include <config.h>
+=20
++#include <limits.h>
+ #include <stdarg.h>
+ #include <string.h>
+ #if HAVE_UNISTD_H
+@@ -990,6 +991,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *form=
at, ...)
+ 	double			*doubleptr ;
+ 	char			c ;
+ 	int				byte_count =3D 0, count =3D 0 ;
++	int				read_bytes =3D 0 ;
+=20
+ 	if (! format)
+ 		return psf_ftell (psf) ;
+@@ -998,6 +1000,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *for=
mat, ...)
+=20
+ 	while ((c =3D *format++))
+ 	{
++		read_bytes =3D 0 ;
+ 		if (psf->header.indx + 16 >=3D psf->header.len && psf_bump_header_alloc=
ation (psf, 16))
+ 			break ;
+=20
+@@ -1014,7 +1017,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *fo=
rmat, ...)
+ 					intptr =3D va_arg (argptr, unsigned int*) ;
+ 					*intptr =3D 0 ;
+ 					ucptr =3D (unsigned char*) intptr ;
+-					byte_count +=3D header_read (psf, ucptr, sizeof (int)) ;
++					read_bytes =3D header_read (psf, ucptr, sizeof (int)) ;
+ 					*intptr =3D GET_MARKER (ucptr) ;
+ 					break ;
+=20
+@@ -1022,7 +1025,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *fo=
rmat, ...)
+ 					intptr =3D va_arg (argptr, unsigned int*) ;
+ 					*intptr =3D 0 ;
+ 					ucptr =3D (unsigned char*) intptr ;
+-					byte_count +=3D header_read (psf, sixteen_bytes, sizeof (sixteen_byt=
es)) ;
++					read_bytes =3D header_read (psf, sixteen_bytes, sizeof (sixteen_byte=
s)) ;
+ 					{	int k ;
+ 						intdata =3D 0 ;
+ 						for (k =3D 0 ; k < 16 ; k++)
+@@ -1034,14 +1037,14 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *=
format, ...)
+ 			case '1' :
+ 					charptr =3D va_arg (argptr, char*) ;
+ 					*charptr =3D 0 ;
+-					byte_count +=3D header_read (psf, charptr, sizeof (char)) ;
++					read_bytes =3D header_read (psf, charptr, sizeof (char)) ;
+ 					break ;
+=20
+ 			case '2' : /* 2 byte value with the current endian-ness */
+ 					shortptr =3D va_arg (argptr, unsigned short*) ;
+ 					*shortptr =3D 0 ;
+ 					ucptr =3D (unsigned char*) shortptr ;
+-					byte_count +=3D header_read (psf, ucptr, sizeof (short)) ;
++					read_bytes =3D header_read (psf, ucptr, sizeof (short)) ;
+ 					if (psf->rwf_endian =3D=3D SF_ENDIAN_BIG)
+ 						*shortptr =3D GET_BE_SHORT (ucptr) ;
+ 					else
+@@ -1051,7 +1054,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *fo=
rmat, ...)
+ 			case '3' : /* 3 byte value with the current endian-ness */
+ 					intptr =3D va_arg (argptr, unsigned int*) ;
+ 					*intptr =3D 0 ;
+-					byte_count +=3D header_read (psf, sixteen_bytes, 3) ;
++					read_bytes =3D header_read (psf, sixteen_bytes, 3) ;
+ 					if (psf->rwf_endian =3D=3D SF_ENDIAN_BIG)
+ 						*intptr =3D GET_BE_3BYTE (sixteen_bytes) ;
+ 					else
+@@ -1062,7 +1065,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *fo=
rmat, ...)
+ 					intptr =3D va_arg (argptr, unsigned int*) ;
+ 					*intptr =3D 0 ;
+ 					ucptr =3D (unsigned char*) intptr ;
+-					byte_count +=3D header_read (psf, ucptr, sizeof (int)) ;
++					read_bytes =3D header_read (psf, ucptr, sizeof (int)) ;
+ 					if (psf->rwf_endian =3D=3D SF_ENDIAN_BIG)
+ 						*intptr =3D psf_get_be32 (ucptr, 0) ;
+ 					else
+@@ -1072,7 +1075,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *fo=
rmat, ...)
+ 			case '8' : /* 8 byte value with the current endian-ness */
+ 					countptr =3D va_arg (argptr, sf_count_t *) ;
+ 					*countptr =3D 0 ;
+-					byte_count +=3D header_read (psf, sixteen_bytes, 8) ;
++					read_bytes =3D header_read (psf, sixteen_bytes, 8) ;
+ 					if (psf->rwf_endian =3D=3D SF_ENDIAN_BIG)
+ 						countdata =3D psf_get_be64 (sixteen_bytes, 0) ;
+ 					else
+@@ -1083,7 +1086,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *fo=
rmat, ...)
+ 			case 'f' : /* Float conversion */
+ 					floatptr =3D va_arg (argptr, float *) ;
+ 					*floatptr =3D 0.0 ;
+-					byte_count +=3D header_read (psf, floatptr, sizeof (float)) ;
++					read_bytes =3D header_read (psf, floatptr, sizeof (float)) ;
+ 					if (psf->rwf_endian =3D=3D SF_ENDIAN_BIG)
+ 						*floatptr =3D float32_be_read ((unsigned char*) floatptr) ;
+ 					else
+@@ -1093,7 +1096,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *fo=
rmat, ...)
+ 			case 'd' : /* double conversion */
+ 					doubleptr =3D va_arg (argptr, double *) ;
+ 					*doubleptr =3D 0.0 ;
+-					byte_count +=3D header_read (psf, doubleptr, sizeof (double)) ;
++					read_bytes =3D header_read (psf, doubleptr, sizeof (double)) ;
+ 					if (psf->rwf_endian =3D=3D SF_ENDIAN_BIG)
+ 						*doubleptr =3D double64_be_read ((unsigned char*) doubleptr) ;
+ 					else
+@@ -1117,7 +1120,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *fo=
rmat, ...)
+ 					charptr =3D va_arg (argptr, char*) ;
+ 					count =3D va_arg (argptr, size_t) ;
+ 					memset (charptr, 0, count) ;
+-					byte_count +=3D header_read (psf, charptr, count) ;
++					read_bytes =3D header_read (psf, charptr, count) ;
+ 					break ;
+=20
+ 			case 'G' :
+@@ -1128,7 +1131,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *fo=
rmat, ...)
+ 					if (psf->header.indx + count >=3D psf->header.len && psf_bump_header=
_allocation (psf, count))
+ 						break ;
+=20
+-					byte_count +=3D header_gets (psf, charptr, count) ;
++					read_bytes =3D header_gets (psf, charptr, count) ;
+ 					break ;
+=20
+ 			case 'z' :
+@@ -1152,7 +1155,7 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *fo=
rmat, ...)
+ 			case 'j' :	/* Seek to position from current position. */
+ 					count =3D va_arg (argptr, size_t) ;
+ 					header_seek (psf, count, SEEK_CUR) ;
+-					byte_count +=3D count ;
++					read_bytes =3D count ;
+ 					break ;
+=20
+ 			case '!' : /* Clear buffer, forcing re-read. */
+@@ -1164,8 +1167,17 @@ psf_binheader_readf (SF_PRIVATE *psf, char const *f=
ormat, ...)
+ 				psf->error =3D SFE_INTERNAL ;
+ 				break ;
+ 			} ;
++
++		if (read_bytes > 0 && byte_count > (INT_MAX - read_bytes))
++		{	psf_log_printf (psf, "Header size exceeds INT_MAX. Aborting.", c) ;
++			psf->error =3D SFE_INTERNAL ;
++			break ;
++		} else
++		{	byte_count +=3D read_bytes ;
+ 		} ;
+=20
++		} ;	/*end while*/
++
+ 	va_end (argptr) ;
+=20
+ 	return byte_count ;
+From a23d563386e7c8d93dcdbe7d5b1d63cad6009116 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Thu, 19 Oct 2023 14:07:19 -0400
+Subject: [PATCH] nms_adpcm: fix int overflow in signal estimate
+
+It is possible (though functionally incorrect) for the signal estimate
+calculation in nms_adpcm_update() to overflow the int value of s_e,
+resulting in undefined behavior.
+
+Since adpcm state signal values are never practically larger than
+16 bits, use smaller numeric sizes throughout the file to avoid the
+overflow.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Authored-by: Arthur Taylor <art@ified.ca>
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Rebased-by: Alex Stewart <alex.stewart@ni.com>
+---
+ src/nms_adpcm.c | 85 ++++++++++++++++++++++++-------------------------
+ 1 file changed, 42 insertions(+), 43 deletions(-)
+
+diff --git a/src/nms_adpcm.c b/src/nms_adpcm.c
+index 96d6ad26..460ea077 100644
+--- a/src/nms_adpcm.c
++++ b/src/nms_adpcm.c
+@@ -48,36 +48,36 @@
+ /* Variable names from ITU G.726 spec */
+ struct nms_adpcm_state
+ {	/* Log of the step size multiplier. Operated on by codewords. */
+-	int yl ;
++	short yl ;
+=20
+ 	/* Quantizer step size multiplier. Generated from yl. */
+-	int y ;
++	short y ;
+=20
+-	/* Coefficents of the pole predictor */
+-	int a [2] ;
++	/* Coefficients of the pole predictor */
++	short a [2] ;
+=20
+-	/* Coefficents of the zero predictor  */
+-	int b [6] ;
++	/* Coefficients of the zero predictor  */
++	short b [6] ;
+=20
+ 	/* Previous quantized deltas (multiplied by 2^14) */
+-	int d_q [7] ;
++	short d_q [7] ;
+=20
+ 	/* d_q [x] + s_ez [x], used by the pole-predictor for signs only. */
+-	int p [3] ;
++	short p [3] ;
+=20
+ 	/* Previous reconstructed signal values. */
+-	int s_r [2] ;
++	short s_r [2] ;
+=20
+ 	/* Zero predictor components of the signal estimate. */
+-	int s_ez ;
++	short s_ez ;
+=20
+ 	/* Signal estimate, (including s_ez). */
+-	int s_e ;
++	short s_e ;
+=20
+ 	/* The most recent codeword (enc:generated, dec:inputted) */
+-	int Ik ;
++	char Ik ;
+=20
+-	int parity ;
++	char parity ;
+=20
+ 	/*
+ 	** Offset into code tables for the bitrate.
+@@ -109,7 +109,7 @@ typedef struct
+ } NMS_ADPCM_PRIVATE ;
+=20
+ /* Pre-computed exponential interval used in the antilog approximation. *=
/
+-static unsigned int table_expn [] =3D
++static unsigned short table_expn [] =3D
+ {	0x4000, 0x4167, 0x42d5, 0x444c,	0x45cb, 0x4752, 0x48e2, 0x4a7a,
+ 	0x4c1b, 0x4dc7, 0x4f7a, 0x5138,	0x52ff, 0x54d1, 0x56ac, 0x5892,
+ 	0x5a82, 0x5c7e, 0x5e84, 0x6096,	0x62b4, 0x64dd, 0x6712, 0x6954,
+@@ -117,21 +117,21 @@ static unsigned int table_expn [] =3D
+ } ;
+=20
+ /* Table mapping codewords to scale factor deltas. */
+-static int table_scale_factor_step [] =3D
++static short table_scale_factor_step [] =3D
+ {	0x0,	0x0,	0x0,	0x0,	0x4b0,	0x0,	0x0,	0x0,	/* 2-bit */
+ 	-0x3c,	0x0,	0x90,	0x0,	0x2ee,	0x0,	0x898,	0x0,	/* 3-bit */
+ 	-0x30,	0x12,	0x6b,	0xc8,	0x188,	0x2e0,	0x551,	0x1150,	/* 4-bit */
+ } ;
+=20
+ /* Table mapping codewords to quantized delta interval steps. */
+-static unsigned int table_step [] =3D
++static unsigned short table_step [] =3D
+ {	0x73F,	0,		0,		0,		0x1829,	0,		0,		0,		/* 2-bit */
+ 	0x3EB,	0,		0xC18,	0,		0x1581,	0,		0x226E,	0,		/* 3-bit */
+ 	0x20C,	0x635,	0xA83,	0xF12,	0x1418,	0x19E3,	0x211A,	0x2BBA,	/* 4-bit */
+ } ;
+=20
+ /* Binary search lookup table for quantizing using table_step. */
+-static int table_step_search [] =3D
++static short table_step_search [] =3D
+ {	0,		0x1F6D,	0,		-0x1F6D,	0,		0,			0,			0, /* 2-bit */
+ 	0x1008,	0x1192,	0,		-0x219A,	0x1656,	-0x1656,	0,			0, /* 3-bit */
+ 	0x872,	0x1277,	-0x8E6,	-0x232B,	0xD06,	-0x17D7,	-0x11D3,	0, /* 4-bit */
+@@ -179,23 +179,23 @@ static sf_count_t nms_adpcm_seek (SF_PRIVATE *psf, i=
nt mode, sf_count_t offset)
+ ** Maps [1,20480] to [1,1024] in an exponential relationship. This is
+ ** approximately ret =3D b^exp where b =3D e^(ln(1024)/ln(20480)) ~=3D 1.=
0003385
+ */
+-static inline int
+-nms_adpcm_antilog (int exp)
+-{	int ret ;
++static inline short
++nms_adpcm_antilog (short exp)
++{	int_fast32_t r ;
+=20
+-	ret =3D 0x1000 ;
+-	ret +=3D (((exp & 0x3f) * 0x166b) >> 12) ;
+-	ret *=3D table_expn [(exp & 0x7c0) >> 6] ;
+-	ret >>=3D (26 - (exp >> 11)) ;
++	r =3D 0x1000 ;
++	r +=3D (((int_fast32_t) (exp & 0x3f) * 0x166b) >> 12) ;
++	r *=3D table_expn [(exp & 0x7c0) >> 6] ;
++	r >>=3D (26 - (exp >> 11)) ;
+=20
+-	return ret ;
++	return (short) r ;
+ } /* nms_adpcm_antilog */
+=20
+ static void
+ nms_adpcm_update (struct nms_adpcm_state *s)
+ {	/* Variable names from ITU G.726 spec */
+-	int a1ul ;
+-	int fa1 ;
++	short a1ul, fa1 ;
++	int_fast32_t se ;
+ 	int i ;
+=20
+ 	/* Decay and Modify the scale factor in the log domain based on the code=
word. */
+@@ -222,7 +222,7 @@ nms_adpcm_update (struct nms_adpcm_state *s)
+ 	else if (fa1 > 256)
+ 		fa1 =3D 256 ;
+=20
+-	s->a [0] =3D (0xff * s->a [0]) >> 8 ;
++	s->a [0] =3D (s->a [0] * 0xff) >> 8 ;
+ 	if (s->p [0] !=3D 0 && s->p [1] !=3D 0 && ((s->p [0] ^ s->p [1]) < 0))
+ 		s->a [0] -=3D 192 ;
+ 	else
+@@ -230,7 +230,7 @@ nms_adpcm_update (struct nms_adpcm_state *s)
+ 		fa1 =3D -fa1 ;
+ 		}
+=20
+-	s->a [1] =3D fa1 + ((0xfe * s->a [1]) >> 8) ;
++	s->a [1] =3D fa1 + ((s->a [1] * 0xfe) >> 8) ;
+ 	if (s->p [0] !=3D 0 && s->p [2] !=3D 0 && ((s->p [0] ^ s->p [2]) < 0))
+ 		s->a [1] -=3D 128 ;
+ 	else
+@@ -250,19 +250,18 @@ nms_adpcm_update (struct nms_adpcm_state *s)
+ 			s->a [0] =3D a1ul ;
+ 		} ;
+=20
+-	/* Compute the zero predictor estimate. Rotate past deltas too. */
+-	s->s_ez =3D 0 ;
++	/* Compute the zero predictor estimate and rotate past deltas. */
++	se =3D 0 ;
+ 	for (i =3D 5 ; i >=3D 0 ; i--)
+-	{	s->s_ez +=3D s->d_q [i] * s->b [i] ;
++	{	se +=3D (int_fast32_t) s->d_q [i] * s->b [i] ;
+ 		s->d_q [i + 1] =3D s->d_q [i] ;
+ 		} ;
++	s->s_ez =3D se >> 14 ;
+=20
+-	/* Compute the signal estimate. */
+-	s->s_e =3D s->a [0] * s->s_r [0] + s->a [1] * s->s_r [1] + s->s_ez ;
+-
+-	/* Return to scale */
+-	s->s_ez >>=3D 14 ;
+-	s->s_e >>=3D 14 ;
++	/* Complete the signal estimate. */
++	se +=3D (int_fast32_t) s->a [0] * s->s_r [0] ;
++	se +=3D (int_fast32_t) s->a [1] * s->s_r [1] ;
++	s->s_e =3D se >> 14 ;
+=20
+ 	/* Rotate members to prepare for next iteration. */
+ 	s->s_r [1] =3D s->s_r [0] ;
+@@ -274,7 +273,7 @@ nms_adpcm_update (struct nms_adpcm_state *s)
+ static int16_t
+ nms_adpcm_reconstruct_sample (struct nms_adpcm_state *s, uint8_t I)
+ {	/* Variable names from ITU G.726 spec */
+-	int dqx ;
++	int_fast32_t dqx ;
+=20
+ 	/*
+ 	** The ordering of the 12-bit right-shift is a precision loss. It agrees
+@@ -308,17 +307,17 @@ nms_adpcm_codec_init (struct nms_adpcm_state *s, enu=
m nms_enc_type type)
+ /*
+ ** nms_adpcm_encode_sample()
+ **
+-** Encode a linear 16-bit pcm sample into a 2,3, or 4 bit NMS-ADPCM codew=
ord
++** Encode a linear 16-bit pcm sample into a 2, 3, or 4 bit NMS-ADPCM code=
word
+ ** using and updating the predictor state.
+ */
+ static uint8_t
+ nms_adpcm_encode_sample (struct nms_adpcm_state *s, int16_t sl)
+ {	/* Variable names from ITU G.726 spec */
+-	int d ;
++	int_fast32_t d ;
+ 	uint8_t I ;
+=20
+ 	/* Down scale the sample from 16 =3D> ~14 bits. */
+-	sl =3D (sl * 0x1fdf) / 0x7fff ;
++	sl =3D ((int_fast32_t) sl * 0x1fdf) / 0x7fff ;
+=20
+ 	/* Compute estimate, and delta from actual value */
+ 	nms_adpcm_update (s) ;
+@@ -407,7 +406,7 @@ nms_adpcm_encode_sample (struct nms_adpcm_state *s, in=
t16_t sl)
+ */
+ static int16_t
+ nms_adpcm_decode_sample (struct nms_adpcm_state *s, uint8_t I)
+-{	int sl ;
++{	int_fast32_t sl ;
+=20
+ 	nms_adpcm_update (s) ;
+ 	sl =3D nms_adpcm_reconstruct_sample (s, I) ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta=
/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index 9c1f601aab..a9ee7c3575 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -9,6 +9,7 @@ LICENSE =3D "LGPL-2.1-only"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://noopus.patch \
+           file://cve-2022-33065.patch \
           "
 GITHUB_BASE_URI =3D "https://github.com/libsndfile/libsndfile/releases/"
=20
--=20
2.40.1


