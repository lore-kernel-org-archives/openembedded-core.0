Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82353CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 01:32:59 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.21419.1761073374116448560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 12:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UphdgYZD;
 spf=pass (domain: baylibre.com, ip: 209.85.208.54, mailfrom: ukleinek@baylibre.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso10203196a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 12:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761073372; x=1761678172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K5Z5UH8Z5r0jbVu33N++KxJNJmoBnWli5ithxNNWleE=;
        b=UphdgYZD6yloBeDEx99DEu7ikPHYE46xLKDSC8i+YbEXeUoSPET9Yj8Pezsremb94p
         zxtGhiXI6UvTDYrVG0E+1upCOoFxTdlJj13Oo/kIO9espW1HgLjnlmEismikEnoGv4KM
         ijl/Xu26S8YmSW9c1+UcR8w8VdU1iUpa0XqzE7idy9KJEbFSc5GV+sc6ifaO9uOib+Zi
         M3hHIO26KMYfqViOJwJATjtDeTkdACtSfal0IO8YMBVEEPIY9p5JYqjWx/9RYgBLxDeB
         QYSsQ1oJcY+YlXo7JDSlYn1z+Z6YuErRwaXSXdDDB3+vYnkIVnmLijYI4/CU8GCULnYe
         Wy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761073372; x=1761678172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5Z5UH8Z5r0jbVu33N++KxJNJmoBnWli5ithxNNWleE=;
        b=h2VHND4xH4uPrMCq+hraMvsqB/kN4tNDWklQQcuIeFaDviTrS3r9dLwBhZuAgFMnAE
         gbZCP9+fAH1SSWiejD19pa73rbDWfjS2QVReFkjT8Nh5/Cg5++f22OEuUbjKEAO/e3hi
         6cshGe4ZR8meQhn99JqsGnIUNVh8yuA4DA3GE2gwYSQyq/C3EwMA3MSaLGLUp2IxRul2
         WAiSzN/yIu/GvSO+mxulmmGrhILyWwch7xiW0RBAPZvjav+j4Pp5pes9PyTTKEofu3WK
         IgK93L1msJgA1Rd56e/BG7vPkQP/mkzTM7hZunvF/gNaH+t52Uv+xdGJrDmjq0qVb1Et
         w1SA==
X-Gm-Message-State: AOJu0Yy3CsdiubJKl0i5dwnTPXtbXx/fcVC/THk7bW3sH8yvUYbnk1AN
	yakKFxh8c5jk5HYQmNJbuFuTme+Ha0WejOp3lZ7+CtyMclVYrEG9MpIHwwYJjByuCwqwdmiLTYE
	UzyaT
X-Gm-Gg: ASbGncv3q2d6SvL26zb/J7xhlmSu+eJw/QOp6VbuLGXltqqx67NovnUOrmGKeIWD8VW
	qX+Iaw3Cq6MFc0MGjiVrhDx8ICdWjFYtUk2jbMcDxRgHRd1oPJxOf1ztbnxdOJryOFPH1KpN0c9
	CqsKfHdcwMCWMyNKV/d1+Bxf/c5pXx1Le6uMFga5C8DHDRrrEVgBoRnDriamd5JR8GfXi1PuBEs
	6CdGxaXp6FrjMKNCbjMYv6r07QavVMQ0O3IS6INi7JLlFRqVoFtQ9tsWaxkHjIeCd/d/wOj0+E8
	5js7vH5JonF1eryVEipjO7rqin+6C+IOsYqlCdbihQCSkQ6yhgtvvsbrGFdRJESKcOSVkK7fyBr
	+PIwXemsdtE6Dle3OyB/dxAZpBfNV9Si4b9dSvsnL0FBT8hmjMmotx/dugpef3JRdXGF0r6ymeV
	BdF/Mx
X-Google-Smtp-Source: AGHT+IGWaSu5pL6wk6S/wd237sSBo+4t0ObcnMun77E52fb8ZOJaUVp3lLse4r5dakve83zHEp77Yg==
X-Received: by 2002:a05:6402:1e91:b0:62f:5424:7371 with SMTP id 4fb4d7f45d1cf-63c1f631cb9mr17940737a12.8.1761073372272;
        Tue, 21 Oct 2025 12:02:52 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-63c4949998csm9869831a12.38.2025.10.21.12.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:02:51 -0700 (PDT)
From: =?UTF-8?B?IlV3ZSBLbGVpbmUtS8O2bmln?= <ukleinek@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH scarthgap] iptables: remove /etc/ethertypes
Date: Tue, 21 Oct 2025 21:02:39 +0200
Message-ID: <20251021190242.414127-1-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 01:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225166

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

When building an image including iptable built with the libnftnl
PACKAGECONFIG, one hits

Downloading file:.../oe-rootfs-repo/armv8a/libkmod2 * check_data_file_clashes: Package iptables wants to install file .../rootfs/etc/ethertypes
        But that file is already provided by package  * netbase

This used to be handled by
0003-Makefile.am-do-not-install-etc-ethertypes.patch, but that patch
got removed with the 1.8.9->1.8.10 upgrade (commit 4616ada82e70).

I think the rationale for dropping the patch was wrong; the commit log
talks about xtables.conf, which is indeed gone from upstream, but said
patch didn't change anything about xtables.conf, it did

-dist_conf_DATA        = etc/ethertypes etc/xtables.conf
+dist_conf_DATA        = etc/xtables.conf

However, instead of patching iptables to not install ethertypes, and
having to forward-port that patch, it is much simpler to just remove
the file in this do_install:append.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is a trivial cherry-pick of commit 3b9c8d5c26a4 ("iptables: remove
/etc/ethertypes"). This fixes building Scarthgap with

	PACKAGECONFIG:append:pn-iptables = " libnftnl"
	CORE_IMAGE_EXTRA_INSTALL = "netbase iptables"

.

Best regards
Uwe

 meta/recipes-extended/iptables/iptables_1.8.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.10.bb
index f1ee1efe2884..8a1f823dc13c 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -78,6 +78,8 @@ do_install:append() {
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables 
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables-save
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables-restore
+        # ethertypes is provided by the netbase package
+        rm -f ${D}${sysconfdir}/ethertypes
     fi
 }
 

base-commit: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b
-- 
2.51.0


