Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.3137.1608571583705386370
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 09:26:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SlQtMA3r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id t16so11857879wra.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 09:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NVIYORY+ltUQEOJIAKROp0f2run5bJLIxeP8xgif0ww=;
        b=SlQtMA3rdyEluoTar6DgTAwPwifXgfYwJqbKoQQBKpBKivxsmCpS5qWQE0ZOuLj01Z
         DCEZ1orVebP0lYqZmkcqzXm1dDQKPJ6SpDgISAIqlTwcMH7Mh2Ew658+DdK4BuT4xdUH
         jccjcfUkgwdL3J+y6jySvzIkrypFzYjHxC7Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NVIYORY+ltUQEOJIAKROp0f2run5bJLIxeP8xgif0ww=;
        b=KUxi/WYyaeXcljHrkOuRmSP2LWzP/4HlGIoYZBqQ8gMh/EvidEDvSDmmpg7rrricxk
         Jluyxoafs5bY71xjJmGVLWIHw/2xUWE4aIRZBEbIVNHBX5FsGwub5N5TutZEDhYNx8Qa
         k02Uu1C3KSfjuz5BSC25pN2ISzaVHboEoDv3jfjcHXZlxk5OYiAHa0px22oEMRO43yOb
         iPKJVE0lzTuKXWqwAAnub+GUJC8gaF3ZHSrdY7Hp86BGdGOHw2JV1a7au9hd426xh2xj
         KfB0Y6UV44eWfeaR6v727HV+ZV9gR83nuytQ+fNkd+n4vAluLU517eqCpYJnEd1XuqDp
         lvFw==
X-Gm-Message-State: AOAM5329RsddbpBDxdj9dCRwrYSE6f+kfH/C2ulD97FxyP89a6Eta9KI
	GrTyJiivvFUvJbNprN8EaVAnNjQfVWrbmw==
X-Google-Smtp-Source: ABdhPJyk2dUaG3GebYXWjBBs+va2ZZf1WDwcEmNDG0fEFPxeJC8+IYElUGsMovM+jmzq50aYfOc9Ag==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr19117770wrt.223.1608571581872;
        Mon, 21 Dec 2020 09:26:21 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:67de:77c9:ee2:94bb])
        by smtp.gmail.com with ESMTPSA id i9sm27025489wrs.70.2020.12.21.09.26.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 09:26:21 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] groff: Fix reproducibility issue
Date: Mon, 21 Dec 2020 17:26:20 +0000
Message-Id: <20201221172620.15452-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

groff chooses a default papersize depending on the value from /etc/papersize
and failing that, the search domain in /etc/resolv.conf based on the comment
in configure:

"""
"""

Oddly, my system sets to "a4" in /etc/papersize which means it defaults to
"letter" since its != "A4".

These defaults ripple through to cause the output of man-db to change depending
on which default value was selected.

To resolve this, set a default of "A4" since that covers the larger population
of the two default values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/groff/groff_1.22.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
index e3984783496..0867452ce7b 100644
--- a/meta/recipes-extended/groff/groff_1.22.4.bb
+++ b/meta/recipes-extended/groff/groff_1.22.4.bb
@@ -28,7 +28,7 @@ MULTILIB_SCRIPTS = "${PN}:${bindir}/gpinyin ${PN}:${bindir}/groffer ${PN}:${bind
 EXTRA_OECONF = "--without-x --without-doc"
 PARALLEL_MAKE = ""
 
-CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl' ac_cv_path_BASH_PROG='no'"
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl' ac_cv_path_BASH_PROG='no' PAGE=A4"
 
 do_install_append() {
 	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-- 
2.27.0

