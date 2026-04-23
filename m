Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641F8FC0351
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:32:41 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.399.1776958356163675703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IHJDeWoq;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-612d8a59ca0so4371705137.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958355; x=1777563155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XZDqQYjqeA4FvkfFXwpqEWP9FEQ7J5cW4IvCaRMwKE=;
        b=IHJDeWoqwrqSDw+pJuPyIJKGUNacsxd92tL0H9auzzrVpDKocHA+fm4ldXPW7YOlGS
         48SyALJBc06dvGNYfQPIlGeL47qS8rCApL9HfZUMlhgsv0An//M8+32Lnm7FGO47bPMW
         ebNaptNVe3uEkOQWclBV0CEsSMbDhlSxBnIdlxKuEUuwqF4cOrOJcOC3aXdsX5JBPEOt
         CQ2LxNAvq1O/L2TKLp2/NfU1xnT+Mj0SlmJYfWDGEfAkZIPa7HJSdJbus7kd1dQPaat4
         AwBGlClUVu0BGGfAf8kDD27pL9H5hatH40b8Gwnu6Jp6V6ltkebkfjIIM9LSRyLvEJHu
         yOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958355; x=1777563155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XZDqQYjqeA4FvkfFXwpqEWP9FEQ7J5cW4IvCaRMwKE=;
        b=jzYcC1BE/CbBoNrz+ncfyztgmCUZnr2Sig3A98igSvWZcNHxsAJUOp7l8ENUYuCJT1
         BIky7VmtUuA17wUBV8LRYtiCTYRG982sZWvB6wBL7RLV5ULpCF3Ic1TmDdR2c/q+W6Jh
         /LVZDLO2e8gMVZxzfjNkNA3FIe56PXymnnNrE5mgH+p+gibmUS7vdoNJ1VS0jDLEQrLv
         /hgcfG6KwHtfhmBdejZdFxAFEQzy2qOYTvpKButrEeLUgvLAYRUoFdLc3+OyMIhU1/x0
         x1jIX5ibFBfFp0F5Wb6OdxDAuAsSmhDC3d0bEJ2mAo1qQkhMU9JkFIZmOqnGiSYqE9ev
         zklQ==
X-Gm-Message-State: AOJu0YyqOB95wLOgD7SSfYimTf11H0T9fpkQGFW6HGp+StjxO0JQe15n
	90tFzLI2XHSwMykpuZc1Muy2var7J+gbpqU8hyKP/6dwdi23XxbJ4h4p/3Gf0k1J
X-Gm-Gg: AeBDies7IbgRMBGgSuMDe5+Sd9HKNoUvGhfqieUK4wnH7BTKVoWnd8FezsdCd5piCD4
	Af+Nlt5M5kRM4UK8GaMlmIHZkIMbojvXoWp4H+Dot7zDIfi0dJA/E5nxVF5i+g+dDVy1WfOWiIb
	3OfG/3LS5AjfMbawH9MqiSJGoPPZNFKAvfMlrlqAIvkn6WFkr9fLqltlDxABRZcVwyOzFqXOw/i
	+k5vBju3QrNKysCMP2xUUejikdy6Zx+Jpo2fEr2vkzN/87eD8nlTgixxDzbrjL3Ru0JVOPDAIg3
	kshX9T839UljsmCCMko1naafvT/YLZQ3dMlOYMdrHXNIvrRndptM4p4jR+cSLOw9mFFRWgG5odM
	K6+ErP/cAHV9ki4BDlLwLojyunbENmRUaGUxuf/r/kUDQ4eWWqc2V8EbrPO+RateFQhLsz0c0Jh
	/11RwvgT9fhTGwyyy1Dfl67fuId7TDBNxr2sFq4V7+5/Y49vfZVDMdiX7S2Dt7d9YDfi8PmVdkt
	Stm01zAWSKIW8hLhzjjn/Y/RLdw2gKHVIGOBsiqiY7pVu1j6as/zt/lXaPwT3LlRk4+Iw==
X-Received: by 2002:a05:6102:f14:b0:611:3bcb:aef6 with SMTP id ada2fe7eead31-616f16429b5mr14195654137.0.1776958354811;
        Thu, 23 Apr 2026 08:32:34 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm160765996d6.2.2026.04.23.08.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:32:33 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 08/15] linux-yocto/6.18: update CVE exclusions (6.18.23)
Date: Thu, 23 Apr 2026 11:32:15 -0400
Message-ID: <20260423153222.1932256-9-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
References: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235783

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 205 changes (128 new | 77 updated): - 128 new CVEs: CVE-20=
00-5001, CVE-2005-20001, CVE-2008-20002, CVE-2008-20003, CVE-2009-20012, CV=
E-2010-20110, CVE-2010-20116, CVE-2010-20117, CVE-2010-20118, CVE-2010-2012=
4, CVE-2011-10031, CVE-2013-10041, CVE-2013-10045, CVE-2013-10056, CVE-2014=
-125120, CVE-2026-31192, CVE-2026-31434, CVE-2026-31435, CVE-2026-31436, CV=
E-2026-31437, CVE-2026-31438, CVE-2026-31439, CVE-2026-31440, CVE-2026-3144=
1, CVE-2026-31442, CVE-2026-31443, CVE-2026-31444, CVE-2026-31445, CVE-2026=
-31446, CVE-2026-31447, CVE-2026-31448, CVE-2026-31449, CVE-2026-31450, CVE=
-2026-31451, CVE-2026-31452, CVE-2026-31453, CVE-2026-31454, CVE-2026-31455=
, CVE-2026-31456, CVE-2026-31457, CVE-2026-31458, CVE-2026-31459, CVE-2026-=
31460, CVE-2026-31461, CVE-2026-31462, CVE-2026-31463, CVE-2026-31464, CVE-=
2026-31465, CVE-2026-31466, CVE-2026-31467, CVE-2026-31468, CVE-2026-31469,=
 CVE-2026-31470, CVE-2026-31471, CVE-2026-31472, CVE-2026-31473, CVE-2026-3=
1474, CVE-2026-31475, CVE-2026-31476, CVE-2026-31477, CVE-2026-31478, CVE-2=
026-31479, CVE-2026-31480, CVE-2026-31481, CVE-2026-31482, CVE-2026-31483, =
CVE-2026-31484, CVE-2026-31485, CVE-2026-31486, CVE-2026-31487, CVE-2026-31=
488, CVE-2026-31489, CVE-2026-31490, CVE-2026-31491, CVE-2026-31492, CVE-20=
26-31493, CVE-2026-31494, CVE-2026-31495, CVE-2026-31496, CVE-2026-31497, C=
VE-2026-31498, CVE-2026-31499, CVE-2026-31500, CVE-2026-31501, CVE-2026-315=
02, CVE-2026-31503, CVE-2026-31504, CVE-2026-31505, CVE-2026-31506, CVE-202=
6-31507, CVE-2026-31508, CVE-2026-31509, CVE-2026-31510, CVE-2026-31511, CV=
E-2026-31512, CVE-2026-31513, CVE-2026-31514, CVE-2026-31515, CVE-2026-3151=
6, CVE-2026-31517, CVE-2026-31518, CVE-2026-31519, CVE-2026-31520, CVE-2026=
-31521, CVE-2026-31522, CVE-2026-31523, CVE-2026-31524, CVE-2026-31525, CVE=
-2026-31526, CVE-2026-31527, CVE-2026-31528, CVE-2026-31529, CVE-2026-31530=
, CVE-2026-33254, CVE-2026-33593, CVE-2026-33594, CVE-2026-33595, CVE-2026-=
33596, CVE-2026-33597, CVE-2026-33598, CVE-2026-33599, CVE-2026-33602, CVE-=
2026-33608, CVE-2026-33609, CVE-2026-33610, CVE-2026-33611, CVE-2026-6861, =
CVE-2026-6862 - 77 updated CVEs: CVE-2026-0539, CVE-2026-1930, CVE-2026-201=
33, CVE-2026-21997, CVE-2026-21998, CVE-2026-21999, CVE-2026-22001, CVE-202=
6-22002, CVE-2026-22003, CVE-2026-22004, CVE-2026-22005, CVE-2026-22007, CV=
E-2026-22008, CVE-2026-22009, CVE-2026-22010, CVE-2026-22013, CVE-2026-2201=
4, CVE-2026-22015, CVE-2026-22016, CVE-2026-22017, CVE-2026-22018, CVE-2026=
-22019, CVE-2026-22021, CVE-2026-22746, CVE-2026-25917, CVE-2026-33145, CVE=
-2026-34267, CVE-2026-34268, CVE-2026-34269, CVE-2026-34270, CVE-2026-34271=
, CVE-2026-34272, CVE-2026-34273, CVE-2026-34274, CVE-2026-34288, CVE-2026-=
34289, CVE-2026-34290, CVE-2026-34291, CVE-2026-34292, CVE-2026-34293, CVE-=
2026-34294, CVE-2026-34295, CVE-2026-34296, CVE-2026-34297, CVE-2026-34298,=
 CVE-2026-34299, CVE-2026-34312, CVE-2026-34319, CVE-2026-35587, CVE-2026-3=
9808, CVE-2026-3362, CVE-2026-40342, CVE-2026-40614, CVE-2026-40868, CVE-20=
26-40872, CVE-2026-40878, CVE-2026-40884, CVE-2026-40887, CVE-2026-40895, C=
VE-2026-40903, CVE-2026-40906, CVE-2026-40923, CVE-2026-40926, CVE-2026-409=
31, CVE-2026-40943, CVE-2026-41055, CVE-2026-41060, CVE-2026-41320, CVE-202=
6-4089, CVE-2026-4111, CVE-2026-5501, CVE-2026-5749, CVE-2026-5750, CVE-202=
6-6236, CVE-2026-6823, CVE-2026-6830, CVE-2026-6857
        Date: Wed, 22 Apr 2026 14:13:54 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 214 +++++++++++++++++-
 1 file changed, 209 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipe=
s-kernel/linux/cve-exclusion_6.18.inc
index 2429851ff8..9e446741d5 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-04-14 21:26:55.774766+00:00 for kernel version 6.18.22
-# From linux_kernel_cves cve_2026-04-14_2000Z-2-gad6d9150d01
+# Generated at 2026-04-22 14:47:41.674823+00:00 for kernel version 6.18.23
+# From linux_kernel_cves cve_2026-04-22_1300Z-1-g44d8eee41e5
=20
=20
 python check_kernel_cve_status_version() {
-    this_version =3D "6.18.22"
+    this_version =3D "6.18.23"
     kernel_version =3D d.getVar("LINUX_VERSION")
     if kernel_version !=3D this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but ke=
rnel is %s" % (this_version, kernel_version))
@@ -21260,7 +21260,7 @@ CVE_STATUS[CVE-2026-23392] =3D "cpe-stable-backport=
: Backported in 6.18.20"
=20
 CVE_STATUS[CVE-2026-23393] =3D "cpe-stable-backport: Backported in 6.18.20"
=20
-# CVE-2026-23394 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-23394] =3D "cpe-stable-backport: Backported in 6.18.23"
=20
 CVE_STATUS[CVE-2026-23395] =3D "cpe-stable-backport: Backported in 6.18.20"
=20
@@ -21458,7 +21458,7 @@ CVE_STATUS[CVE-2026-31405] =3D "cpe-stable-backport=
: Backported in 6.18.19"
=20
 CVE_STATUS[CVE-2026-31406] =3D "cpe-stable-backport: Backported in 6.18.21"
=20
-# CVE-2026-31407 needs backporting (fixed from 7.0)
+# CVE-2026-31407 may need backporting (fixed from 6.18.24)
=20
 CVE_STATUS[CVE-2026-31408] =3D "cpe-stable-backport: Backported in 6.18.21"
=20
@@ -21502,5 +21502,209 @@ CVE_STATUS[CVE-2026-31427] =3D "cpe-stable-backpo=
rt: Backported in 6.18.21"
=20
 CVE_STATUS[CVE-2026-31428] =3D "cpe-stable-backport: Backported in 6.18.21"
=20
+CVE_STATUS[CVE-2026-31429] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31430] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31431] =3D "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31432] =3D "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31433] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31434] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31435] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31436] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31437] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31438] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31439] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31440] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31441] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31442] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31443] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31444] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31445] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31446] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31447] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31448] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31449] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31450] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31451] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31452] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31453] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31454] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31455] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31456] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31457] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31458] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31459] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31460] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31461] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31462] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31463] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31464] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31465] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31466] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31467] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31468] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31469] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31470] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31471] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31472] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31473] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31474] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31475] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31476] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31477] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31478] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31479] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31480] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31481] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31482] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31483] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31484] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31485] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31486] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31487] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31488] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31489] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31490] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31491] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31492] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31493] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31494] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31495] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31496] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31497] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31498] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31499] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31500] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+# CVE-2026-31501 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-31502] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31503] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31504] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31505] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31506] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31507] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31508] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31509] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31510] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31511] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31512] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31513] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31514] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31515] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31516] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31517] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31518] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31519] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31520] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31521] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31522] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31523] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31524] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31525] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31526] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31527] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31528] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31529] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31530] =3D "cpe-stable-backport: Backported in 6.18.21"
+
 CVE_STATUS[CVE-2026-31788] =3D "cpe-stable-backport: Backported in 6.18.20"
=20
--=20
2.43.0


