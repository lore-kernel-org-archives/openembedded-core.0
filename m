Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.46207.1609166179394780019
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 06:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Q3nynllu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id v3so5691083plz.13
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 06:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=hcDxyEK8qO/DyGAA5TO+WYM/6VfHzJhA3LoreS7FfkY=;
        b=Q3nynllux7H0cLqHCHkCeKc2hnh0scK54TOO0caQA+ZzEq7hBLgncv57OAMS2BiKPe
         kHAmQSh24BvtEVwRB7bqVED3+8/6snw7WX7p/spRa1AlazIbkkPJLFaVB7T+fyeINxnu
         eRjfJd8ScaqyxLNvf22iKni/2NTncT+rit+9suwdeIQ70PfGBFgGAy2pnxh8ThpsejXK
         t213TKMZvV6d+Zfz+ha+Zk2EXppF5KW0eL47DnHzFVj0u63d2vmE2RrrnM8CQuDg2Nht
         DAFVQNGc3vEto54HAJgmaNF6T+4j3rwkKstxd+vTciVTGgPUquFuwoDxwHStghdqX/nQ
         3nSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=hcDxyEK8qO/DyGAA5TO+WYM/6VfHzJhA3LoreS7FfkY=;
        b=oyyOGmh0k05YQrxGQa4ro26J+rGeg0Z9xsLHzsnXCoVn78ufcXKHRzVx6vpvth88mW
         mpxbXCRAn8WxSezTgvmuk0PG14uVDJxn/PDP/HEE4YTVKMsiINuAmsPY7aD7767tGSDJ
         s2vhz0OEfJDM8ObdXLD5Kn0IVfhNSxes3HA1rDa/OwjZp4Oyu9eutlj4eXIatOtd5TcQ
         kwbJ+xnZB+MSgj67USfJW+tR9R0Snn9+m728r3h7dc07voNR7Ahz14X1ZHl57NYQDDXN
         LCjqtLwlZrAIj56D/V0TYFD8+7z4FmUyXYIQr0Uv1m9aGHfcXxYXw4M478l7gIxf5kLY
         tTtg==
X-Gm-Message-State: AOAM531zxPjyOdHxcY4VxjfYMTe8Kfyj3SILRZHnHVZS7imoahjGvb/L
	9eUFbyQfCAaAoIyGo5qOzwJOqZb2Ryz6eMjH48w=
X-Google-Smtp-Source: ABdhPJwCpoCFlCj+jmzBP4JBLUIjDE3WMjNHzs002VYt4Jdo8Y+8bGMGgvZXIStpxkFcD2KrVFzD6A==
X-Received: by 2002:a17:90a:cc0a:: with SMTP id b10mr21249617pju.59.1609166178583;
        Mon, 28 Dec 2020 06:36:18 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b22sm36422469pfo.163.2020.12.28.06.36.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 06:36:17 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/8] groff: Fix reproducibility issue
Date: Mon, 28 Dec 2020 04:35:44 -1000
Message-Id: <5bbd7b1f6e1dccffc7bf3f0b37fbc74b6e755e81.1609165912.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609165912.git.steve@sakoman.com>
References: <cover.1609165912.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

groff chooses a default papersize depending on the value from /etc/papersize
and failing that, the search domain in /etc/resolv.conf based on the comment
in configure:

"""
If the top-level domain is two letters and it's not 'us' or 'ca'
then they probably use A4 paper.
"""

Oddly, my system sets to "a4" in /etc/papersize which means it defaults to
"letter" since its != "A4".

These defaults ripple through to cause the output of man-db to change depending
on which default value was selected.

To resolve this, set a default of "A4" since that covers the larger population
of the two default values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6cb511bfbd18258c782ee18f054a2590e4daaddc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/groff/groff_1.22.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
index e398478349..0867452ce7 100644
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
2.17.1

