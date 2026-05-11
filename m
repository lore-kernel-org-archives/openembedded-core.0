Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F922CD484E
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 20:25:25 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59985.1778531123576201933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 13:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O2g6LbXD;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50d87610513so46889371cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778531122; x=1779135922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToSyXl5lk8VSh4R27JMUlyGoiS741mkeo8hr/4POjF8=;
        b=O2g6LbXDN9q8PgXpIG9HIj/Lq8/TyRpsoEoqx1z+kSjiaAYknUTCrPaFYmZSc5rq9D
         thbTJzhSJX+RLl0odTyIzw6z+886tqNaho87DiwxAfEKANJOPYJLW/XlsAI4hwvbEHG0
         Wh9Py4CJcEA62ZqF+4b2/LvROxUHSPUTWPi14pnyAL0Uzpmi4pc76DLekS9jM7HlxsOQ
         ePRf+Dtmj3XFOX5YSmQ5RzSAw4TFXbCgK5VIq9x0cCoC+fUchGqOeN1rrJyciV/4gojn
         NhWjt7wgDMBcQfUIW9ZtTo+PNxFAgmwLIhcbL17CgZQgvjPuDSS6M3wGflvvyEue53jZ
         uv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531122; x=1779135922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ToSyXl5lk8VSh4R27JMUlyGoiS741mkeo8hr/4POjF8=;
        b=qqd/g66LNevI8JRNl5e4Nay7lY0Mn/YPsWpx7rdFpArEgiAhfniymsmoUQ1G1jSiyS
         GIXdHVT9vNII8Lsr0nQTcsMKtr9o8xghuVu8P4G1zXjwwaZy0GCxggA/bG2W9HmDRJ+n
         mri/0NPF645uBAMW6JWrsAYTNqnEW9PGbHwSoIl6bWDMcat+8dlW3lVNDzyZhqMDW52U
         QlCohId3HlOBaw6mlv1XJ2KYXrLPjNb2SVS0Osfjsh2Gk6lVVy3nnqtO02nHYWuf4eta
         cSQy9ACDK+zGbt3wZgGNrwx9jATpUjfDp4YTDX8iFDyqvO4gVB6LTLmgwLYj+3pgS4Vj
         QFHQ==
X-Gm-Message-State: AOJu0Yy6tPvgd8uOtKAKEp7Ngllpc9kBMEMGjnoj+5NSQrYVcSPR56of
	/4WcotBcfK3HQ1oQa/v1mFIb4E68yN7y0sAFnaHKQBkIBQAgSOSGAMmE6pNZqsxQKnAwTg==
X-Gm-Gg: Acq92OHWGLKnXog7+6shaKBR8iDkpeHVbFLza9E1dhh2LF6lxZlf4KFIGuuo7QAiUen
	aJfL3Jz9QRXAN7hIWWLng6q8wQIXW7s1zELhxzwq9oNWvuHjdEms2Kxwn6S+QI36dnU/6T7XoiS
	NmOKeGcojOKNwCecyX2+1mS25+73aRHPni2TnpBSn+oDpMedn4c8/is0lCj/VDTybXXF5yKeNMU
	9Lbw1e/bnKxCycDwoJNSa4HuispQhTfPHnneEXT/iQb/5ANbe/CD7OmIL9PtSaY3LyK2ZolZhTT
	uf9ghmTigj7JE3IoVZ1aEtD9hQkXb1Up6/vmdt/ILYibyaCb3wRezvIH00hezjQaaBNhFATaD9B
	wR4ZSrdC6BXTTwx5lVpJ4JQS7wpU1yqqSNceRRMofh14ik34w1IqsXQ0KlTRNOsH7bwF65se1WA
	bbYhDfR+D3lSRtb1T6zoDGhfa5lrD8PbU6c2AkTudB3CatAiG0d/MtslxVqhk1NWJvrbuTYxuTW
	R2DDLMuqlWFn0mw/kPWPiWDEOKkNZPoEl6ggfxYkuFmNGS5s1tJs1/xALc=
X-Received: by 2002:ac8:7dd6:0:b0:50d:8049:2f22 with SMTP id d75a77b69052e-51461be03d1mr347566821cf.3.1778531122345;
        Mon, 11 May 2026 13:25:22 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e83aa2bsm98213401cf.28.2026.05.11.13.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:25:21 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 02/09] linux-yocto/6.18: update CVE exclusions (6.18.25)
Date: Mon, 11 May 2026 16:25:09 -0400
Message-ID: <20260511202517.1648910-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
References: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 20:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236827

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 83 changes (9 new | 74 updated): - 9 new CVEs: CVE-2026-27=
760, CVE-2026-40556, CVE-2026-40968, CVE-2026-7282, CVE-2026-7320, CVE-2026=
-7321, CVE-2026-7322, CVE-2026-7323, CVE-2026-7324 - 74 updated CVEs: CVE-2=
024-46636, CVE-2025-10539, CVE-2025-48431, CVE-2026-24354, CVE-2026-24361, =
CVE-2026-24367, CVE-2026-24368, CVE-2026-24369, CVE-2026-24370, CVE-2026-24=
371, CVE-2026-24373, CVE-2026-24374, CVE-2026-24375, CVE-2026-24376, CVE-20=
26-24377, CVE-2026-24378, CVE-2026-24379, CVE-2026-24380, CVE-2026-24381, C=
VE-2026-24382, CVE-2026-24383, CVE-2026-24384, CVE-2026-24385, CVE-2026-243=
86, CVE-2026-24387, CVE-2026-24388, CVE-2026-24389, CVE-2026-24390, CVE-202=
6-24391, CVE-2026-24392, CVE-2026-24521, CVE-2026-24522, CVE-2026-24523, CV=
E-2026-24525, CVE-2026-24526, CVE-2026-24528, CVE-2026-24529, CVE-2026-2453=
0, CVE-2026-24531, CVE-2026-24532, CVE-2026-25422, CVE-2026-25423, CVE-2026=
-25428, CVE-2026-25432, CVE-2026-25451, CVE-2026-25453, CVE-2026-25459, CVE=
-2026-25463, CVE-2026-25472, CVE-2026-25473, CVE-2026-28130, CVE-2026-28131=
, CVE-2026-28132, CVE-2026-28133, CVE-2026-28134, CVE-2026-28136, CVE-2026-=
28137, CVE-2026-28138, CVE-2026-40966, CVE-2026-41365, CVE-2026-41371, CVE-=
2026-41525, CVE-2026-41602, CVE-2026-4805, CVE-2026-5779, CVE-2026-5780, CV=
E-2026-5781, CVE-2026-7156, CVE-2026-7178, CVE-2026-7237, CVE-2026-7244, CV=
E-2026-7267, CVE-2026-7272, CVE-2026-7309
        Date: Tue, 28 Apr 2026 14:21:46 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 326 +++++++++++++++++-
 1 file changed, 321 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipe=
s-kernel/linux/cve-exclusion_6.18.inc
index ade11d8025..8e6357700d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-04-23 15:18:10.087069+00:00 for kernel version 6.18.24
-# From linux_kernel_cves cve_2026-04-23_1400Z
+# Generated at 2026-04-28 14:31:45.750135+00:00 for kernel version 6.18.25
+# From linux_kernel_cves cve_2026-04-28_1300Z-1-g3f42726e029
=20
=20
 python check_kernel_cve_status_version() {
-    this_version =3D "6.18.24"
+    this_version =3D "6.18.25"
     kernel_version =3D d.getVar("LINUX_VERSION")
     if kernel_version !=3D this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but ke=
rnel is %s" % (this_version, kernel_version))
@@ -21356,7 +21356,7 @@ CVE_STATUS[CVE-2026-23440] =3D "cpe-stable-backport=
: Backported in 6.18.20"
=20
 CVE_STATUS[CVE-2026-23441] =3D "cpe-stable-backport: Backported in 6.18.20"
=20
-# CVE-2026-23442 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-23442] =3D "cpe-stable-backport: Backported in 6.18.25"
=20
 CVE_STATUS[CVE-2026-23443] =3D "cpe-stable-backport: Backported in 6.18.20"
=20
@@ -21708,7 +21708,323 @@ CVE_STATUS[CVE-2026-31530] =3D "cpe-stable-backpo=
rt: Backported in 6.18.21"
=20
 CVE_STATUS[CVE-2026-31531] =3D "cpe-stable-backport: Backported in 6.18.24"
=20
-# CVE-2026-31532 has no known resolution
+CVE_STATUS[CVE-2026-31532] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31533] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31535] =3D "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-31536] =3D "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-31537] =3D "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-31538] =3D "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-31539] =3D "cpe-stable-backport: Backported in 6.18.11"
+
+CVE_STATUS[CVE-2026-31540] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31541] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31542] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31543] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31544] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31545] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31546] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31547] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31548] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31549] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31550] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31551] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31552] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31553] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31554] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31555] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31556] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31557] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31558] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31559] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+# CVE-2026-31560 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-31561] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31562] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31563] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31564] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31565] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31566] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31567] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31568] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31569] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31570] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31571] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31572] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31573] =3D "fixed-version: only affects 6.19.6 onwards"
+
+CVE_STATUS[CVE-2026-31574] =3D "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-31575] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31576] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31577] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31578] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31579] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31580] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31581] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31582] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31583] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31584] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31585] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31586] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31587] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31588] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+# CVE-2026-31589 needs backporting (fixed from 7.1rc1)
+
+CVE_STATUS[CVE-2026-31590] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31591] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31592] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31593] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31594] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31595] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31596] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31597] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31598] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31599] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31600] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31601] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31602] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31603] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31604] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31605] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31606] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31607] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31608] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31609] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31610] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31611] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31612] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31613] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31614] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31615] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31616] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31617] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31618] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31619] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31620] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31621] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31622] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31623] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31624] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31625] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31626] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31627] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31628] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31629] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31630] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31631] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31632] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31633] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31634] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31635] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31636] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31637] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31638] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31639] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31640] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31641] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31642] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31643] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31644] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31645] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31646] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31647] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31648] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31649] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31650] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31651] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31652] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31653] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31654] =3D "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-31655] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31656] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31657] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31658] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31659] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31660] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31661] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31662] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31663] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31664] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31665] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31666] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31667] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31668] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31669] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31670] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31671] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31672] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31673] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31674] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31675] =3D "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31676] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31677] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31678] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31679] =3D "cpe-stable-backport: Backported in 6.18.21"
+
+CVE_STATUS[CVE-2026-31680] =3D "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31681] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31682] =3D "cpe-stable-backport: Backported in 6.18.22"
+
+CVE_STATUS[CVE-2026-31683] =3D "cpe-stable-backport: Backported in 6.18.20"
+
+CVE_STATUS[CVE-2026-31684] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31685] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31686] =3D "cpe-stable-backport: Backported in 6.18.24"
+
+CVE_STATUS[CVE-2026-31687] =3D "cpe-stable-backport: Backported in 6.18.12"
+
+# CVE-2026-31688 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-31689] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31690] =3D "cpe-stable-backport: Backported in 6.18.23"
+
+CVE_STATUS[CVE-2026-31691] =3D "cpe-stable-backport: Backported in 6.18.23"
=20
 CVE_STATUS[CVE-2026-31788] =3D "cpe-stable-backport: Backported in 6.18.20"
=20
--=20
2.43.0


