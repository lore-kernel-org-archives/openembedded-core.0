Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D39C35FF7
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 19:36:03 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.2820.1741980963150484952
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 12:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vN7h6Mr2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2254e0b4b79so64080805ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 12:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741980962; x=1742585762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NymLU09W9Y/xdNghmsoOM6ZWCGXd7ZPeLyf+o0Y0adU=;
        b=vN7h6Mr2AePCyk17/rHsin5JURHPTrW0yOeEdNaIT1TQY/S7orPTtva8g7r2BDfTUm
         ZCcBBDnmRVrr9jHgLgzS2lERckHaxIsptU1p6Ln1s/8Dq2wtrCxoqXJjrm/+1S1zUxGL
         EQjMLvtLQ6jbu9aY0wpJtIsmrpPxFSzilnEvXZW+jyRxc+giDUDVYiH5EfoIdNpnADHS
         +yFgIIp9dedg1NcsHN/uK3Vmk5nnZW+RyzHi/tynBwf+x3DoNM53oRVrOh4vHXXs38oV
         DNXFcTox8SDBFzoND0jmv8k2afpYGigLMMHXYfZl3d6TXNm9e+bWu1ieAMJNpHvsGR2c
         mlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741980962; x=1742585762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NymLU09W9Y/xdNghmsoOM6ZWCGXd7ZPeLyf+o0Y0adU=;
        b=FAB9vOcBHI730X4BnvG3p9WGe/+JspxrVF7nstSHRjRln2UptgXKYr5VnsRJcAuZ3X
         dmgHakpMg0dobnF8KRHDi/tiA0SAI7XSjkpXZmQDAnfmpp+F6ocjjjzubVn45pK2/AHh
         eeqWg6+kJE0KLYynflO72Tev9kPSemQnPSuo4npp3mrBEClMCPoa51vFgc12SGXFZO87
         EBvTGJ1zxkVesp2hcZOzjBusZbAbzAtGKMRWE9DbiZv07rlIsGgmgyc988d8gG7CX0dE
         cV4aoN+Z0dcpyDmrmu6Wno9ASjTx6YyCLXIickbCGp7D/bpsntdg/9bbhzjvbXm8ArOE
         ZpUQ==
X-Gm-Message-State: AOJu0YzJq0f6dbddeRml/xyYI4F5n9BRCgMa6TPdOWptqaezUYemJQc2
	zm5ttPLDbk9UHtH11bo1YVhxxRSBnmj2191LV/HcDU+2/JdImkBlFix38Faht8QOnmqmJU9C4Fo
	O
X-Gm-Gg: ASbGncuYMLdzLWmjE34R14vuBN81WaD5qipV3oVd2sykHEwO+shORJ4xOJXKyYg+if9
	7diecNCa+s16O8MgFJt9TR6VtrZv1w94gzNU2SQ57lNj8HXNONc15YX/DSXLPKGkmVsDaUQqUm1
	JGWR5cnXuVYoXb/SUWMadVyYRgA6MUeyPxq8IX3vRrkPwXu8btbmlDNWLLdFrDrsMxGr/tDiMoy
	Xh2ajH0vbZoCu8UdHI4p4ELFd9Musjo8XuFTy67XtBJvyiBZ9Q47uaDLUFD84vPysrQK6BUQXm9
	fHOxobDyvrBupiCqxIG2UZ5wPKyXxwXX55I0
X-Google-Smtp-Source: AGHT+IFnEEuWdef0wAXFx6xIYMok3sCfiqDlmii5ppsOOC77l5u6dPyxBqFV/LjowS1iRz7P7SwyZg==
X-Received: by 2002:a17:902:d482:b0:224:1219:934b with SMTP id d9443c01a7336-225e0b298eemr42199765ad.50.1741980962418;
        Fri, 14 Mar 2025 12:36:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6978:e88e:1ab7:676a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d5dsm32265685ad.153.2025.03.14.12.36.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 12:36:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/4] gcc-cross-canadian.inc: Fix buildpaths error for pthread.h
Date: Fri, 14 Mar 2025 12:35:39 -0700
Message-ID: <d3c294ee0afe4d2eb46320945d41064ebfb5cbff.1741980835.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741980835.git.steve@sakoman.com>
References: <cover.1741980835.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 19:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212863

From: Sana Kazi <sanakazi720@gmail.com>

Replace the hardcoded path with /not/exist as used for other
options[--with-sysroot] to ensure pthread.h does not contain
hardocded references to TMPDIR:

ERROR: gcc-cross-canadian-x86-64-13.3.0-r0 do_package_qa: QA Issue:
File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/
usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.3.0/include-fixed/
pthread.h in package gcc-cross-canadian-x86-64 contains reference to
TMPDIR [buildpaths]

Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index adcaef2b0f..06f0cef864 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -118,6 +118,11 @@ do_install () {
 	# We don't care about the gcc-<version> copies
 	rm -f ${D}${bindir}/*gcc-${BINV}*
 
+        # Remove buildpaths from pthread.h
+        sed -i -e "s|${RECIPE_SYSROOT_NATIVE}|/not/exist|g" \
+        -e "s|${RECIPE_SYSROOT}|/not/exist|g" \
+        ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed/pthread.h
+
 	# Cleanup empty directories which are not shipped
 	# we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
 	# ${D}${libdir}/../lib only seems to appear with SDKMACHINE=i686
-- 
2.43.0


