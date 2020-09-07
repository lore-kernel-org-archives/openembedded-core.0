Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.1775.1599498164969322984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CWXYBO7S;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id j7so1876680plk.11
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QnM5IX+jDPTYCqbBKJSstLi7MqlI4wKj7R6aVMGtWhI=;
        b=CWXYBO7SvFkpAnZs3rcjHer+NoxqR3i6s5Ypk143Cg0Jyvh8g6vHO0FOoY1Qxo1WQn
         FGgJ1wLl9oPh2bfnUKc4YXL9pCwzQxCu5E7tMoPA01vT4OJL/AMtrY7/5xiNjUuF+JhF
         hCBggupJVxUtb7KkvhTo1Az+EW8W3NllQRsUUzcCOUShbckdp6EMDIgqmrAIBTBPVLyr
         MOG1/0jT45a7bDjYl7H/CK9cp6efldJmZ3a9/rxCIsa9BaAPP6HmrsyeKoVRTU4cE8Fv
         K790QiXurfanKpFMH19xv9GDNzXoki3aPQ+rDoFV4SPbJQNtbWXKt5Ubg/sw+ElhosYr
         WWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QnM5IX+jDPTYCqbBKJSstLi7MqlI4wKj7R6aVMGtWhI=;
        b=pfAxGhj+1xO+gfoq/B+UhzBluikpR1b+Bm1J98NHf1Tkik7Hzgq9QNlPrhRmiMR7jd
         AanaxF2TvVDF4yFShRswIK29n8iYQVu/YJHJs/qzoggd2e+212rRvINBw0usw2lMTEWp
         7tV0AsXCT0uOO7clgq4Gq4TTuYHChNA/0o5eHs1Zlkv3jPHaqZfMj5G/uf88UFTY6XnG
         wNf36s9JWD6dBbOg/5dcd1OzK/85mnIutPgdj8dCK0oR9qS9BqKQB4QUQtJa/Z8938Aj
         oVMT+bl5O2htchAAV1+vi9bPgnlb6XpUK+Jj0F8DoSuW8SaY7Q2WFFjQasF9qWJHKiQE
         2ymg==
X-Gm-Message-State: AOAM533eRvmrk+eHvwQB5ezHH+5sDVwcO5g/eKNLzKVu2ugsxHFDGal+
	4ygSjkRx0hKBJi/apyHiyMyUtTXjYNVOoObs
X-Google-Smtp-Source: ABdhPJzX7tlvBTjTf9vEGkTtTwswmKP8/IWZB5yKqgtEi/RvxJa9TxLB6RakhOyIphXwAcHrahMfsA==
X-Received: by 2002:a17:90a:c907:: with SMTP id v7mr214588pjt.204.1599498164054;
        Mon, 07 Sep 2020 10:02:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/18] sysstat: fix installed-vs-shipped QA Issue in systemd
Date: Mon,  7 Sep 2020 07:02:06 -1000
Message-Id: <89cb403fce24c853be49e4190d2020c6911b6a31.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

From: hongxu <hongxu.jia@windriver.com>

While enabling systemd, there is QA issue:
...
|ERROR: sysstat-12.4.0-r0 do_package: QA Issue: sysstat: Files/directories
were installed but not shipped in any package:
|  /lib/systemd/system-sleep
|  /lib/systemd/system-sleep/sysstat.sleep
...

https://www.freedesktop.org/software/systemd/man/systemd-sleep.html
says the files should be dropped into /usr/lib/systemd/system-sleep
(that would be /lib/systemd/system-sleep in our configuration).  By
moving the files to another directory they'll be packaged but not
loaded by systemd.

Suggested-by Ross Burton <ross@burtonini.com>

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3bdd40ea09e50067f11c12290ab465a9ef229fc4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 8fd87b943b..e5e134c038 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -62,6 +62,6 @@ pkg_postinst_${PN} () {
 	fi
 }
 
-FILES_${PN} += "${systemd_system_unitdir}"
+FILES_${PN} += "${systemd_system_unitdir} ${nonarch_base_libdir}/systemd"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.17.1

