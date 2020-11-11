Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.46])
 by mx.groups.io with SMTP id smtpd.web09.1615.1605062976529275026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 18:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BVdQneax;
 spf=pass (domain: windriver.com, ip: 40.107.244.46, mailfrom: li.wang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WstBSFFJSpeDbFHeMhsiW0HAoia3CzSEbBP/lN6XbZIO/bQM3cx5w979zLHxhH2ZWp4nB6Kae+W4HBORsAnBUaeryR1mI6MVuizg4eTWMpoEWKOg0twSJH7PAYeONsbT3NV9Fxy3FMoepJFOJjZUaj4xjSyzbSo7JFB74qte0rOfF5EL30uRV13KCVDAudQHMnnMHty6iP1WU9ozI+LLd1uGieXhJBQuITWTFBhPdn+dh0rvI/QVabvpC0ZuEMuJ+OHnUoqnGEiK2XtgxK55ogL8mmlxdpi9r70H4K55SO4coe7Ezqf5eAad9U+hLxVSv2uHS5+z50Xi38MfhfcTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkL7TMDbVBhS8B+cS3fdouDd1kx+IKaHDDM2fH4JumY=;
 b=HN5bq+penwMvdGDusCeXlq2wptDzYfQtvttjU9X5JlDT3XjDa6ZvYbydm6i7Q3G1+DPX7knzuCOrS66Dpsg5iZFUdZTPEMr0e8O/FYKB5nK6zh9uDJ7T679NFOmN48U2oiAnkKoYPO9zuinMCst6E8gqXaoNtOH4gIlRSMMsP4x5r3XWUPvpVl+OpXmsljgzLJ16DqsK4mUfVkfQ7aL4JXej4TmXTGxLaSyQMMkxiRo9IlHSuDTwbWBh4ki/t6maUX5Zy0Ky1xkwGh1mpjK3P9fQE3FWglqD3RsWUP2WKV95/92rJPwJr5BuQwggbHttSo6/gAR4rX4rMu2Ur8+evQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkL7TMDbVBhS8B+cS3fdouDd1kx+IKaHDDM2fH4JumY=;
 b=BVdQneaxLgMQztRZ6fl0Nz3yGQE7VPI86UTzDLBXO0yY2kQ6e4s8Td/kH50C7rw/gWPoepcbZUdFMOc+RpQdzzXoZZTRd9qzVXdDcRcG9qZP9BaqJVkKmbcsR1LQ2lATVj1hpeOzb/XRX68bV89kv5qpKzNv3M62SCrOmukt/Xw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16)
 by DM6PR11MB2715.namprd11.prod.outlook.com (2603:10b6:5:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 02:49:35 +0000
Received: from DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada]) by DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada%6]) with mapi id 15.20.3499.032; Wed, 11 Nov 2020
 02:49:35 +0000
From: "Li Wang" <li.wang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH] qemu: CVE-2020-27616
Date: Wed, 11 Nov 2020 02:45:56 +0000
Message-Id: <20201111024556.11183-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:203:b0::32) To DM6PR11MB3595.namprd11.prod.outlook.com
 (2603:10b6:5:142::16)
Return-Path: li.wang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bfbf5eb70dd2.wrs.com (60.247.85.82) by HK0PR03CA0116.apcprd03.prod.outlook.com (2603:1096:203:b0::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Wed, 11 Nov 2020 02:49:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db067ab2-7ec2-402e-83bc-08d885ec6c62
X-MS-TrafficTypeDiagnostic: DM6PR11MB2715:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB271591FA142AE31894DBBB3AEFE80@DM6PR11MB2715.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XXNHqKv9IOR65iKl0soY8VLCzciK/aFHIWGpB7e+rEzhJ6gzHmPKUAk0/HfxZ7gdffX/x5RDOFwmvy0ODIBymgMA+yeTC9/Sg6LMko8U1rVLJ2yrrF+Kjnlr5K6Eu/TQdiCAqp3dIgK7KqhzvjDI2/9e60fSXPp3HTzeFlKw38soxJIJq0qwPDkI1WgRo5228f+9vpriTyoWyOZfDDMNDd2P/sigMm5nVLBJIkDQHe0ORk78TLUKAcDCg1tVTVNbtF0JTMPMsH6S9vAi3zdMf0KBxfOsAtU+OqrW3xP2YvM9YIPskcpW64m3w9V2Wr86yCwZpSSS8PFGRzncO3nKC5nbX3p9TZ7WUCHDquGj14z7cZ2cqOIw8IivStxqqnVAKRRWe0Q3CujsDPs5s28v6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3595.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(39850400004)(396003)(26005)(83380400001)(8936002)(44832011)(66476007)(2616005)(8676002)(66556008)(52116002)(6512007)(966005)(16526019)(6506007)(956004)(6916009)(186003)(66946007)(6486002)(36756003)(316002)(478600001)(2906002)(1076003)(86362001)(5660300002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jOFEFQlysq/rKGPjUqpohBiVq4Xvz/yObpCJ477k1XE60nubh279VrYym3KeXW3+coRx+M7zumNR3wcSxXAXdePCA4wnWhDhNjrEu/+EJ1u13v/hd5/zhDDnB13+ym2WJDoYCl406Ow4JzER5gR98/Uej0nM0pUsNDr/93eYF7sz18KvZgymPwU0w2ygRUDF+RcxSlVneSXZQfxoOTDRbWeEO/DdW2c/67Lel/RtTDW3dEyaBNA8GcGPsRjIUxcne1CPDZAwSziXhDNtFymReqctBw1v/7rs5sNBl5JFYCAmCzy91804C1F/T2Glh3lLa0sef0gGN6hAbLbj/Xt0JkmrG1XNLET0kSnmFj9LdCDnChaX+uNKSFtaQFL5IxQ7z84ov+vFaD8N5+H4GxgwWPoeY+Oz0YkFWxSRItWwZm1B2J1eip1+FkRw2/qwoakDOJaXCDZ5psofiWCngPXtRQQWQ/GiUlmawCG2qFDytM2hsVN7F1ZVbXHZDN9NzEswbksmWNPGHUI8Zoa49OPyImg4Bz32U7MGa6JLaQrJUofgqizjHOr2RwnC6+L9qSfo/oSOqwCA2o50oPAujE2fP8qu9fSGoGa1ZpHG7IQDhWHiJouCIbHzBwLnBLS0q1wyhpxk2uFhwayMr5kbV/THog==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db067ab2-7ec2-402e-83bc-08d885ec6c62
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 02:49:35.2325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Il5SFV2t5SonbfUhGICh74l94MXb+2DQkeROne32juyBZqo13TWnmFsgON1bpxwAiFisdPgN5/9JNQdg2IK/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2715
Content-Type: text/plain

backport patch from:
https://git.qemu.org/?p=qemu.git;a=commit;h=ca1f9cbfdce4d63b10d57de80fef89a89d92a540

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-27616.patch            | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-27616.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8f2d9e824b..0d20f0ccd7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -47,6 +47,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-25084-1.patch \
            file://CVE-2020-25084-2.patch \
            file://CVE-2020-25625.patch \
+           file://CVE-2020-27616.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-27616.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-27616.patch
new file mode 100644
index 0000000000..76c2271aee
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-27616.patch
@@ -0,0 +1,53 @@
+From ca1f9cbfdce4d63b10d57de80fef89a89d92a540 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Wed, 21 Oct 2020 16:08:18 +0530
+Subject: [PATCH] ati: check x y display parameter values
+
+The source and destination x,y display parameters in ati_2d_blt()
+may run off the vga limits if either of s->regs.[src|dst]_[xy] is
+zero. Check the parameter values to avoid potential crash.
+
+Reported-by: Gaoning Pan <pgn@zju.edu.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 20201021103818.1704030-1-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-27616
+[https://git.qemu.org/?p=qemu.git;a=commit;h=ca1f9cbfdce4d63b10d57de80fef89a89d92a540]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/display/ati_2d.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
+index 23a8ae0..4dc10ea 100644
+--- a/hw/display/ati_2d.c
++++ b/hw/display/ati_2d.c
+@@ -75,8 +75,9 @@ void ati_2d_blt(ATIVGAState *s)
+         dst_stride *= bpp;
+     }
+     uint8_t *end = s->vga.vram_ptr + s->vga.vram_size;
+-    if (dst_bits >= end || dst_bits + dst_x + (dst_y + s->regs.dst_height) *
+-        dst_stride >= end) {
++    if (dst_x > 0x3fff || dst_y > 0x3fff || dst_bits >= end
++        || dst_bits + dst_x
++         + (dst_y + s->regs.dst_height) * dst_stride >= end) {
+         qemu_log_mask(LOG_UNIMP, "blt outside vram not implemented\n");
+         return;
+     }
+@@ -107,8 +108,9 @@ void ati_2d_blt(ATIVGAState *s)
+             src_bits += s->regs.crtc_offset & 0x07ffffff;
+             src_stride *= bpp;
+         }
+-        if (src_bits >= end || src_bits + src_x +
+-            (src_y + s->regs.dst_height) * src_stride >= end) {
++        if (src_x > 0x3fff || src_y > 0x3fff || src_bits >= end
++            || src_bits + src_x
++             + (src_y + s->regs.dst_height) * src_stride >= end) {
+             qemu_log_mask(LOG_UNIMP, "blt outside vram not implemented\n");
+             return;
+         }
+-- 
+2.17.1
+
-- 
2.17.1

