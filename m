Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A179DC3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:51 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.9401.1724319347405452013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gXl8Zbwz;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5beb6ea9ed6so848790a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319346; x=1724924146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m58ZHKBEMj5cpgGa4ZTmG+rxhe8Gc2ePrFUtOMflV0Q=;
        b=gXl8ZbwzG1LkSuTq6DHL7hFrY7nkQuH489rs0mmt/aFNH7lO4zDxwFGYjk8O3vVrrI
         B9l2gzGu05xS+2AwmtdYLdCnDRpaysLg8c7Msc6u8vzOWR2ozXtKC/jDkm5NcuJ9SnjR
         vtNwjIDv2hAc/Mn+yzKaNutpqv66hoF/njW+rcX5Zci3hpQUIqo75lxZOIaYuJKihLek
         ppIkGkQbdKGqwY7RVik3PT9Zzb1FSssJKoeT/UnnKdWHMhhIf5I49ozSkMyCUla7W95a
         kv0e7Miu0jJvOQ63tJU4GuS1CiOayzKcYWh2FPThkIDsR04P/ySIcC9LEh/T9WCJsS1b
         crVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319346; x=1724924146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m58ZHKBEMj5cpgGa4ZTmG+rxhe8Gc2ePrFUtOMflV0Q=;
        b=ukbAex4JAfiZ7CiHTjksH2MnwUZYHE0TMUJ2Qsoi4HRTJcc0fV2D7Aic3MljASPK4Y
         7Nqg5i+3BXD0Dw5jkqNJaFK4UL0Ry+k/Ab+qlT6SETLJ/tuWBg4wFk1Ph8/DtSBhdZda
         6jxkjnVmxrwh+Ltsr1eSAngY6qvYCbYNGRURjOjcVbtbnNx6T0QvhoxFYiVYgAfyMFD7
         pI5VdEJNnWEPEM+5kjOiGvCAZS3+KEHzpLWxRP6Dbq2x7br9BPENXt1W89ecpoFiIdu4
         rARLjiqYh+nWfG8XZib6ZzwIW3SDD/sS2y6A+A0cven4DmTwHaELC1uNTPRXA5uJGJ/Q
         Pa1Q==
X-Gm-Message-State: AOJu0YyY3GbtGMromubAnrhTk+4Gvizc2deMYqQjStOqsK1KPtD2LbmE
	kG8nxeDZsMmgGaHuaCChrUZdj5dpKsfKPNpsGmWNu8ZXfOndszwDyYoWKg==
X-Google-Smtp-Source: AGHT+IHMxWtJ1swyfECLIGUwanWde5utUw78OZ8aznZxWPHyRczPABF5YKOiqRBSqcF1q9wYZuLWDA==
X-Received: by 2002:a05:6402:5113:b0:5bb:b8e1:4648 with SMTP id 4fb4d7f45d1cf-5bf1f239baamr3098047a12.27.1724319345264;
        Thu, 22 Aug 2024 02:35:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/32] xz: upgrade 5.4.6 -> 5.6.2
Date: Thu, 22 Aug 2024 11:35:21 +0200
Message-Id: <20240822093521.36790-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203647

From: Alexander Kanavin <alex@linutronix.de>

This is the first post-backdoor release.

These are the release notes:
https://github.com/tukaani-project/xz/releases/

There are also backdoor notes:
https://tukaani.org/xz-backdoor/
"I plan to write an article how the backdoor got into the releases and
what can be learned from this." - that'd be most welcome, as it would
be first hand information that sets the record straight.

And there's a commit by commit review of Jia Tan's contributions:
https://tukaani.org/xz-backdoor/review.html

Add an option for landlock sandbox (off by default as it clashes with running under pseudo).

License-Update: public domain bits were relicensed under 0BSD license

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xz/{xz_5.4.6.bb => xz_5.6.2.bb}           | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.4.6.bb => xz_5.6.2.bb} (77%)

diff --git a/meta/recipes-extended/xz/xz_5.4.6.bb b/meta/recipes-extended/xz/xz_5.6.2.bb
similarity index 77%
rename from meta/recipes-extended/xz/xz_5.4.6.bb
rename to meta/recipes-extended/xz/xz_5.6.2.bb
index 3f82e476bf4..96fc691ef7e 100644
--- a/meta/recipes-extended/xz/xz_5.4.6.bb
+++ b/meta/recipes-extended/xz/xz_5.6.2.bb
@@ -3,31 +3,32 @@ HOMEPAGE = "https://tukaani.org/xz/"
 DESCRIPTION = "XZ Utils is free general-purpose data compression software with a high compression ratio. XZ Utils were written for POSIX-like systems, but also work on some not-so-POSIX systems. XZ Utils are the successor to LZMA Utils."
 SECTION = "base"
 
-# The source includes bits of PD, GPL-2.0, GPL-3.0, LGPL-2.1-or-later, but the
+# The source includes bits of 0BSD, GPL-2.0, GPL-3.0, LGPL-2.1-or-later, but the
 # only file which is GPL-3.0 is an m4 macro which isn't shipped in any of our
 # packages, and the LGPL bits are under lib/, which appears to be used for
 # libgnu, which appears to be used for DOS builds. So we're left with
-# GPL-2.0-or-later and PD.
-LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & PD"
-LICENSE:${PN} = "PD & GPL-2.0-or-later"
-LICENSE:${PN}-dev = "PD & GPL-2.0-or-later"
+# GPL-2.0-or-later and 0BSD.
+LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & 0BSD"
+LICENSE:${PN} = "0BSD & GPL-2.0-or-later"
+LICENSE:${PN}-dev = "0BSD & GPL-2.0-or-later"
 LICENSE:${PN}-staticdev = "GPL-2.0-or-later"
-LICENSE:${PN}-doc = "PD & GPL-2.0-or-later"
+LICENSE:${PN}-doc = "0BSD & GPL-2.0-or-later"
 LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
-LICENSE:liblzma = "PD"
+LICENSE:liblzma = "0BSD"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d4378ea9d5d1fc9ab0ae10d7948827d9 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=c02de712b028a5cc7e22472e8f2b3db1 \
+                    file://COPYING.0BSD;md5=0672c210ce80c83444339b9aa31fee2f \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
-                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
+                    file://lib/getopt.c;endline=23;md5=3f33e207287bf72834f3ae8c247dfb6a \
                     "
 
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "aeba3e03bf8140ddedf62a0a367158340520f6b384f75ca6045ccc6c0d43fd5c"
+SRC_URI[sha256sum] = "8bfd20c0e1d86f0402f2497cfa71c6ab62d4cd35fd704276e3140bfb71414519"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
@@ -35,6 +36,8 @@ CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
 
 inherit autotools gettext ptest
 
+PACKAGECONFIG[landlock] = "--enable-sandbox=landlock,--enable-sandbox=no"
+
 PACKAGES =+ "liblzma"
 
 FILES:liblzma = "${libdir}/liblzma*${SOLIBS}"
-- 
2.39.2


