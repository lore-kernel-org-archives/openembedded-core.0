Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261EDC5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 21:01:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.45018.1749416454573787995
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 14:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Mn0cN6Oa;
 spf=pass (domain: snapchat.com, ip: 209.85.128.42, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so22972695e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 14:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1749416453; x=1750021253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9S/Tj/WRMfj5YEVb8ZIccJPF9axIYQgRTQZdcZmNY50=;
        b=Mn0cN6OaHjxRLNAFfGBAcnvK2WiTEiv7NDIuLDZ/Gq5i80eMZZQyR4vSDfaFYsIxus
         Xyu9o3W4Pf5G0Dbas99Mx2AnF/53gywTNt04CiqR+9V3W0oUvHDF+f23BCw2EHfK6a8S
         gU0n79W8Ha4px/WJX3vLO5D1Z3Au4YH6xbUxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749416453; x=1750021253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9S/Tj/WRMfj5YEVb8ZIccJPF9axIYQgRTQZdcZmNY50=;
        b=l66x3nrpDIjEfiKpq+XyBBtt705XANbXQBnfz5S07mFAHLoBNA3FKMkL0L8GSFppQh
         mdcq6lkh795u3xU0AI6P+i0SNlZZY158lxt6ygl+bs0k3D4iQ1DOcZK4tTLeBoj6l71M
         DSr8gnr8RfNYM0DmHfWk2MO0HGRkRwu7LWX8xipjYgnsVPKAPaAYqlBOtLEWPD42ZbO3
         vYs/odVrNbByeBQn8JOIvuXz5ITbM8lp400+kAn/CTS7TM/BueamKbLGXRcqmvFR3os+
         OPrLSkwijtlWOibm7DE3gyQt6iUYqgkAsAWRy6XkQUAyINKU8+Ro2dAHJKfMI/kft0i4
         HchQ==
X-Gm-Message-State: AOJu0YytX5RG3cgC+oUKRwicBMoktHlPIirhnLy3UqpzSgwG+93IFWs0
	X4rE14CF6s4GtlHaLNnqUVLyc3K/UBe2avjI36CU/I5r+JdrMAEyPbGCu+XiGE0n/15tk+QRBUN
	RdHL5NPM=
X-Gm-Gg: ASbGnctqeNZ0Rq7BlBg06KcBJuUVR+fNqIz5/x2AMVbyK1GkbKv8XXqGqZ0rcLoK7Cq
	VFnAlMVN8IyzlXPKIA9d2nk6hbbHirdTimpMhzmuuEgPZITQ/WRqKbgSq/+c3oOK/l9DeZcbEQK
	MCcUR1Ah5cwQO+k6mfLyVpFOYhd5N9UnVibVMz4XO0mDD9T3wDyc6ZGnhIA50mZKfkiDvoC4sLg
	VLzQGH7r60idZWRJaAmxWnpGP1KIPK93sLUEM+FGp0onTx7WJ0YvFico/+H6E+dEdFOsSE9H59f
	xlhalAUydu2B1wn45BdgRt2TbAVN2GCEBdFARYAcC7Lg4rlBqiRu+QFP36NiVv0UtuO3Saxbe9H
	MAIMxcyD7XkXz5/r3UrMZTHQ5D+IdwkC9SZ2vbhFX
X-Google-Smtp-Source: AGHT+IHlEBuGGrIcIXEFdly3Zv3sT39Jjx+ql43/z91sRsMfWHiTORIfVqVDFDOzDha+4f++TVQlBg==
X-Received: by 2002:a05:600c:4f4b:b0:442:e03b:589d with SMTP id 5b1f17b1804b1-45201416983mr92521625e9.24.1749416452704;
        Sun, 08 Jun 2025 14:00:52 -0700 (PDT)
Received: from localhost.localdomain (80-108-196-96.cable.dynamic.surfer.at. [80.108.196.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730d15f4sm93117785e9.40.2025.06.08.14.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 14:00:52 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v2 1/2] findutils: use getlimits from findutils
Date: Sun,  8 Jun 2025 23:00:31 +0200
Message-ID: <20250608210032.46280-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 21:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218221

From: Etienne Cordonnier <ecordonnier@snap.com>

Having findutils depending on coreutils-getlimits makes it harder to replace GNU coreutils with uutils-coreutils
using PREFERRED_PROVIDER.
Also, the findutils repository contains a version of getlimits used for the tests, so there is no need to depend
on coreutils's version of getlimits.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-extended/findutils/findutils/run-ptest | 3 +++
 meta/recipes-extended/findutils/findutils_4.10.0.bb | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/findutils/findutils/run-ptest b/meta/recipes-extended/findutils/findutils/run-ptest
index 3dec117067..0c9af47efd 100644
--- a/meta/recipes-extended/findutils/findutils/run-ptest
+++ b/meta/recipes-extended/findutils/findutils/run-ptest
@@ -5,6 +5,9 @@ ln -s /usr/bin/find /tmp/oldfind
 # make oldfind visible
 export PATH="/tmp:${PATH}"
 
+# Add findutils ptest directory to PATH for getlimits
+export PATH="/usr/lib/findutils/ptest:${PATH}"
+
 export built_programs="find xargs locate updatedb"
 
 # this gets substituted by sed during build
diff --git a/meta/recipes-extended/findutils/findutils_4.10.0.bb b/meta/recipes-extended/findutils/findutils_4.10.0.bb
index 57f77de16f..aa21637657 100644
--- a/meta/recipes-extended/findutils/findutils_4.10.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
@@ -15,12 +15,13 @@ CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
 EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
 
 # need od from coreutils for -t option
-RDEPENDS:${PN}-ptest += "bash sed grep coreutils coreutils-getlimits"
+RDEPENDS:${PN}-ptest += "bash sed grep coreutils"
 
 do_install_ptest:class-target() {
 	mkdir -p ${D}${PTEST_PATH}/tests/
 	cp ${S}/init.cfg ${D}${PTEST_PATH}
 	cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
+	install -m 755 ${B}/find/getlimits ${D}${PTEST_PATH}/
 
 	# substitute value in run-ptest with actual version
 	sed -i -e 's/__run_ptest_version__/${PV}/' ${D}${PTEST_PATH}/run-ptest
-- 
2.43.0


