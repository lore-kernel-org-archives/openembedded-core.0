Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.3211.1608571924448066407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 09:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U7dSmXmg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id r4so11664753wmh.5
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 09:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B+dAxCRN82R+sAEdp8tIi0XOps9kTNlDwGWnBVOF3V0=;
        b=U7dSmXmg+SmSDRHi3CKYucP0SaS1i8xjVo3L+xHnyT0cEuvANYOL+syYGWwIDEk8yj
         rKxSCt1xqzRXbATZIi52/tU9cwse/7WAqU+mKEZWoVpM46FIsQYA2zXJO+Wscrpsg5wZ
         7ajZzjB4dksQLNYh+0o5FvwX1xukB6ZJD/ruk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B+dAxCRN82R+sAEdp8tIi0XOps9kTNlDwGWnBVOF3V0=;
        b=e7q6zUj/JML9zWCniYv/lHPkBBCGv4ADisgZjlqvc/VsuOoNI52oQZqpdM8NFcBuuB
         O4VW/KF7Z4Tgqf5tbgvKfso+igSU3Vkq6y8KlgNIV0v/5nM3UD4l6dVWXfjLAna2vzIf
         xqUrvt2RFNg4dnd4WX+T/5pX+z1E4OIHZQ4qOOHFzrZ9KQWtAdcFPR19P9/ogX1MyU/8
         y8YTW5TwT/284mDZxRi2LC/bHPWUL7EYU7nPIu6B+1it79fP8vakXDs2OH8PCjpeuVqg
         gg3tDsXzCkJH+nUvXbQPlv8/5yrg2zi1eDH8RZpyqaeGzlWsdtOYSEenuF9ROG7KclCs
         n6zA==
X-Gm-Message-State: AOAM533HEP66ryLO1wtXW0jci1N0S5Vc3w8uKXyGz3RGYsA/ZUC+WdEM
	nefpEdu4TI+2bGTqYFz77QW99m7zt7lmBw==
X-Google-Smtp-Source: ABdhPJyYg/OAk3tgq/Xezcte0ICzasAyqCHMSeWdeUyTxJTThTDKN2bKeDIPJYhCyVVpOyo+ojbIuw==
X-Received: by 2002:a05:600c:21d1:: with SMTP id x17mr17479766wmj.160.1608571922746;
        Mon, 21 Dec 2020 09:32:02 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:67de:77c9:ee2:94bb])
        by smtp.gmail.com with ESMTPSA id h4sm26626699wrt.65.2020.12.21.09.32.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 09:32:02 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] groff: Fix reproducibility issue
Date: Mon, 21 Dec 2020 17:32:01 +0000
Message-Id: <20201221173201.15771-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

