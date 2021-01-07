Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.71])
 by mx.groups.io with SMTP id smtpd.web09.6249.1610013336439252966
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 01:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=nPFGSgFM;
 spf=pass (domain: kpit.com, ip: 40.107.138.71, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqhV5si7ET1K+kZ1+sOZZWSoMgKSvLKOwmMQzMyOS7KoaeU/80MT30He/MmuVpLW5QVGsNvuetf5IMg4vT3YQuNLDNN+0aI+ew2QxB3EXCENDgQ4uu8J+b6qDEDNwfyUWNayzJ++onJUYiMayj6tLG7AuDdfhYvLoywrSTVitY4WsBem+2BPf3cX+Amc7WKNSHRXW/SwvGzdwmg1qESgcFPKWIec2721B9v1eVacrKQLwRYyCr/frbMKpXATkVDI+e5TujM52qMPkz2Zt6Nu1zFfRed0adTeVOPxqyFBYSIpfVZ+iwkAYpWnULUdbEvjp+rvMa0j5hf8BlgYqWVx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAZ+ZN6Wmr69IVqsk3gUq1ti5ko7V6DOuHu5QvFBgYA=;
 b=cvEOvXVOhzjE1U3WEi7AXv/5BpjYtlEZ5Vclf9RTWTmsILN9wm2AgNCum7xlNSrzKZrSN4UQAedgqpx/8mldEDzq3eTn1g1IGglFpFfGGy3G07gqS91YEOzEI6ZHh7sNKv6mPLdDwR+7x77MisBPvrAj2E4B0q7LrB1Q5gnyR1J7ZbhRZRl+cFnvphwwkg+vrGTsqgsw6rKRayrVLhGUZesTTN3oNffotZoYiPJAvhlTmDHft1YgJBl9Cpz3mMrnVO9tXlcoHPLikUefIf7cKVF1FjooHw4APKip6l3QlZXTumo/6aGuhYYfvoZdMKlgI9+nO0NzO6YyYwUXf8/ioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAZ+ZN6Wmr69IVqsk3gUq1ti5ko7V6DOuHu5QvFBgYA=;
 b=nPFGSgFMCAjflr3v+7NqNXqvHYYEX1mAqf/Xvh5F3V3ToJq8RyKoWTiI7i4ilMnfKXuTdIeAd5nFQktjRKS6Wmp46EZMkCjdx5RIKbWzRcSGoxc31FKN1Jw75XLy3NQv6+/x+KdF7sw/CwrDIU4uxFe8YoSX0jDhg0In4t5ZkMA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:79::22)
 by MA1PR0101MB1702.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:2b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 09:55:27 +0000
Received: from MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c0c3:d811:3987:df57]) by MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c0c3:d811:3987:df57%5]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 09:55:27 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com,
	Harpritkaur.Bhandari@kpit.com
Subject: [poky][sumo][PATCH 2/4] libsndfile1: Security fix CVE-2018-19432
Date: Thu,  7 Jan 2021 15:25:10 +0530
Message-Id: <20210107095510.32569-1-sanak@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:5194:2007:f9cf:4c7f:ce96:878]
X-ClientProxiedBy: BMXPR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::13) To MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:79::22)
Return-Path: sanak@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:5194:2007:f9cf:4c7f:ce96:878) by BMXPR01CA0027.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 09:55:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a5650859-274a-46bc-9484-08d8b2f25c37
X-MS-TrafficTypeDiagnostic: MA1PR0101MB1702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MA1PR0101MB1702CECCD51CB7BB12B2B47399AF0@MA1PR0101MB1702.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4JXXT+8pkKHiUY6Js6K3hC03Tv2qfVZ7qPQ5ybFOtZS/UVrlpQKu+mmVq8XZDxRL2zUNybc3+t9GZVpLRgG4S8KgTJY6R9GSnadx2n09DSsbq+GrM/RSckyf5tHqp1iGt+qVItVdxET3lKAoLh3dAgQdhmOed5xbPqQ9xvJq267Mo2zBxaK+z/YW2Ry+CHoHJBnfIEldV7rzlNrGPMq0b4L45PjgK63qLhxofCSxFoMbQnX8+tOvN9QHALLt0gFv/begNF4Q7+64RE5aSTm8QqzZFEE091p1aYjbPMmPche9AqDBlqQGRM3xE+pzXCCfUGxQ0pBxNdfsI72SYZ0FcUs5qj2/T5oY7rh62wBYmLqlRg4ifd9W9U/BorwsZLx6q8TVEJ56u45saLDhM2YjuBYMb0NwaqZbkXjNGNqhMed1K63ALWKtejIXQb5pqZOBvTz3cduezljJEQB+4x/XNnDYK+QB+PfA7rJGP7CXJVzQ4PUiDDuptea2MeSSmQzsJmleygLBUxfFvRWXbYGbbQwDvD8RhibQB7PCM7jdxlI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39850400004)(366004)(136003)(66556008)(8676002)(66946007)(66476007)(16526019)(186003)(83380400001)(2616005)(69590400011)(1076003)(6506007)(107886003)(478600001)(8936002)(52116002)(6666004)(5660300002)(36756003)(15650500001)(316002)(6512007)(4326008)(6486002)(66574015)(2906002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?xgJPY/2fTpOq5j0UsgJIWVv7teF7NrMfKcrA1t8ExkZWU7UQ8dQZd6IsRghq?=
 =?us-ascii?Q?/FB8ujHfJQK5UEpA17VgEXZQ49y1liHvSjB/NdCTtUieFf8i1j3d5lLtzKgy?=
 =?us-ascii?Q?/r7UK3OKeWRYpNUpdar0XvwYKfKc+Nq+Yl2oavwgESDO7zznsSRNjguBxjZr?=
 =?us-ascii?Q?TS8SqGRmBY8kU+JVHHPiq+2b8/w2OzvNzoOVpy8HPDsCa/2ilehgtsgorhTz?=
 =?us-ascii?Q?J0IQugzho4m9mr18hNdHZXzFlMwKzkJxb7WVrPjYkjwf52YeA42sTZHKo+uf?=
 =?us-ascii?Q?yLxNjiovVlh79rJ4SPEbxmjV6IaqZW6f5z7WrWCLDmpnUIWo4V3tp6do8fsa?=
 =?us-ascii?Q?im4l4mK2Qm3x3lMY82bQ3u+l038YfDuopSK/k9769Fm7e1/WSLSbUac74Xfh?=
 =?us-ascii?Q?2ALcyMIEx5AmFLEIXdnGRUxvwFk0CXJQsjot5UlXSffX/l66eEDssoeUxHTV?=
 =?us-ascii?Q?58BXkLP6yXApzqoZL/Tlj5GQzA+gKb9KqX+0KZodHDn+rvuUpZFOwiPTEzuh?=
 =?us-ascii?Q?9jfRvkJ9jF5qAqOv3BWMhCGExtFx/qbLNhy0mBKpp5Vi/XWEPnWYR5R8X6FG?=
 =?us-ascii?Q?G8LDHB/SwcDyizx5n6s8Lyftf3VfRu2Lr0M1bL1ZN174AKRo7tbBnpDDK/vr?=
 =?us-ascii?Q?Yd/4sPSfZDbXc6EGLfp8xRgdeiLms7cCmlcMGNnaG48xzs+WMG9+rB4HR/pM?=
 =?us-ascii?Q?UjggdjYfIE/NyG7EgYkrEnrq0zkslZpIuzLa/UHsBjfLcsRAbKC7pA7N7ZMO?=
 =?us-ascii?Q?IY5Co38ICIaWHCfBrTlpbLurb3B9Tneoh64UhQ8rIBDKXJl0vzpjdQYbiUIB?=
 =?us-ascii?Q?3YLXDgZgt7IJ3K2oEKG7IdYmpk36PRjLdwHsCNa2Gnz+k6FmJxtXmMwDVbvJ?=
 =?us-ascii?Q?iT7Rc9UVrLmU54WwW+HGLNNWOcEbbGKDLDPoa+hOKPQ/yYTwwjr3mWLpA3sg?=
 =?us-ascii?Q?HZ0sIu5NLnqTrJQB+A8TaMLOi3O9gVcvJfMRpcjRJZxKKhL9kjy8KDfLwCM6?=
 =?us-ascii?Q?wopIB5eGzNE+LmmfS+vzPWvdpJDKWBnrQj48mKjvhLH6eHyZ02NX9G+30skr?=
 =?us-ascii?Q?Xw9l0Yb8?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 09:55:26.9582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: a5650859-274a-46bc-9484-08d8b2f25c37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNLxgc6VobAjoMRQLNAT5BDvRZC0z1lh2o7e84cq6amQ/LKHO7Z0Axkx27WAQ75j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR0101MB1702
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Changqing Li <changqing.li@windriver.com>

(From OE-Core rev: 6f010c9b7777aae5ce2108122d0c6d3b1d630a21)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 .../libsndfile1/CVE-2018-19432.patch          | 115 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb          |   2 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018=
-19432.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19432.=
patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19432.patch
new file mode 100644
index 0000000000..8ded2c0f85
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19432.patch
@@ -0,0 +1,115 @@
+From 6f3266277bed16525f0ac2f0f03ff4626f1923e5 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Thu, 8 Mar 2018 18:00:21 +1100
+Subject: [PATCH] Fix max channel count bug
+
+The code was allowing files to be written with a channel count of exactly
+`SF_MAX_CHANNELS` but was failing to read some file formats with the same
+channel count.
+
+Upstream-Status: Backport [https://github.com/erikd/libsndfile/
+commit/6f3266277bed16525f0ac2f0f03ff4626f1923e5]
+
+CVE: CVE-2018-19432
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ src/aiff.c |    6 +++---
+ src/rf64.c |    4 ++--
+ src/w64.c  |    4 ++--
+ src/wav.c  |    4 ++--
+ 4 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/aiff.c b/src/aiff.c
+index fbd43cb..6386bce 100644
+--- a/src/aiff.c
++++ b/src/aiff.c
+@@ -1,5 +1,5 @@
+ /*
+-** Copyright (C) 1999-2016 Erik de Castro Lopo <erikd@mega-nerd.com>
++** Copyright (C) 1999-2018 Erik de Castro Lopo <erikd@mega-nerd.com>
+ ** Copyright (C) 2005 David Viens <davidv@plogue.com>
+ **
+ ** This program is free software; you can redistribute it and/or modify
+@@ -950,7 +950,7 @@ aiff_read_header (SF_PRIVATE *psf, COMM_
+       if (psf->sf.channels < 1)
+               return SFE_CHANNEL_COUNT_ZERO ;
+
+-      if (psf->sf.channels >=3D SF_MAX_CHANNELS)
++      if (psf->sf.channels > SF_MAX_CHANNELS)
+               return SFE_CHANNEL_COUNT ;
+
+       if (! (found_chunk & HAVE_FORM))
+@@ -1030,7 +1030,7 @@ aiff_read_comm_chunk (SF_PRIVATE *psf, C
+       psf_log_printf (psf, "  Sample Rate : %d\n", samplerate) ;
+       psf_log_printf (psf, "  Frames      : %u%s\n", comm_fmt->numSampleF=
rames, (comm_fmt->numSampleFrames =3D=3D 0 && psf->filelength > 104) ? " (S=
hould not be 0)" : "") ;
+
+-      if (comm_fmt->numChannels < 1 || comm_fmt->numChannels >=3D SF_MAX_=
CHANNELS)
++      if (comm_fmt->numChannels < 1 || comm_fmt->numChannels > SF_MAX_CHA=
NNELS)
+       {       psf_log_printf (psf, "  Channels    : %d (should be >=3D 1 =
and < %d)\n", comm_fmt->numChannels, SF_MAX_CHANNELS) ;
+               return SFE_CHANNEL_COUNT_BAD ;
+               } ;
+diff --git a/src/rf64.c b/src/rf64.c
+index d57f0f3..876cd45 100644
+--- a/src/rf64.c
++++ b/src/rf64.c
+@@ -1,5 +1,5 @@
+ /*
+-** Copyright (C) 2008-2017 Erik de Castro Lopo <erikd@mega-nerd.com>
++** Copyright (C) 2008-2018 Erik de Castro Lopo <erikd@mega-nerd.com>
+ ** Copyright (C) 2009      Uli Franke <cls@nebadje.org>
+ **
+ ** This program is free software; you can redistribute it and/or modify
+@@ -382,7 +382,7 @@ rf64_read_header (SF_PRIVATE *psf, int *
+       if (psf->sf.channels < 1)
+               return SFE_CHANNEL_COUNT_ZERO ;
+
+-      if (psf->sf.channels >=3D SF_MAX_CHANNELS)
++      if (psf->sf.channels > SF_MAX_CHANNELS)
+               return SFE_CHANNEL_COUNT ;
+
+       /* WAVs can be little or big endian */
+diff --git a/src/w64.c b/src/w64.c
+index 939b716..a37d2c5 100644
+--- a/src/w64.c
++++ b/src/w64.c
+@@ -1,5 +1,5 @@
+ /*
+-** Copyright (C) 1999-2016 Erik de Castro Lopo <erikd@mega-nerd.com>
++** Copyright (C) 1999-2018 Erik de Castro Lopo <erikd@mega-nerd.com>
+ **
+ ** This program is free software; you can redistribute it and/or modify
+ ** it under the terms of the GNU Lesser General Public License as publish=
ed by
+@@ -383,7 +383,7 @@ w64_read_header    (SF_PRIVATE *psf, int *b
+       if (psf->sf.channels < 1)
+               return SFE_CHANNEL_COUNT_ZERO ;
+
+-      if (psf->sf.channels >=3D SF_MAX_CHANNELS)
++      if (psf->sf.channels > SF_MAX_CHANNELS)
+               return SFE_CHANNEL_COUNT ;
+
+       psf->endian =3D SF_ENDIAN_LITTLE ;                /* All W64 files =
are little endian. */
+diff --git a/src/wav.c b/src/wav.c
+index 7bd97bc..dc97545 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -1,5 +1,5 @@
+ /*
+-** Copyright (C) 1999-2016 Erik de Castro Lopo <erikd@mega-nerd.com>
++** Copyright (C) 1999-2018 Erik de Castro Lopo <erikd@mega-nerd.com>
+ ** Copyright (C) 2004-2005 David Viens <davidv@plogue.com>
+ **
+ ** This program is free software; you can redistribute it and/or modify
+@@ -627,7 +627,7 @@ wav_read_header    (SF_PRIVATE *psf, int *b
+       if (psf->sf.channels < 1)
+               return SFE_CHANNEL_COUNT_ZERO ;
+
+-      if (psf->sf.channels >=3D SF_MAX_CHANNELS)
++      if (psf->sf.channels > SF_MAX_CHANNELS)
+               return SFE_CHANNEL_COUNT ;
+
+       if (format !=3D WAVE_FORMAT_PCM && (parsestage & HAVE_fact) =3D=3D =
0)
+--
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/met=
a/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index b28f675286..9700f4a6e7 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -13,6 +13,8 @@ SRC_URI =3D "http://www.mega-nerd.com/libsndfile/files/li=
bsndfile-${PV}.tar.gz \
            file://CVE-2017-14245-14246.patch \
            file://CVE-2017-14634.patch \
            file://CVE-2018-13139.patch \
+           file://0001-a-ulaw-fix-multiple-buffer-overflows-432.patch \
+           file://CVE-2018-19432.patch \
           "

 SRC_URI[md5sum] =3D "646b5f98ce89ac60cdb060fcd398247c"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
