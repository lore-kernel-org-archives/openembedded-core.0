Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.66755.1595886907294653196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 14:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cPA0utTh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id y3so16312659wrl.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 14:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xI4Q/j0QmM51lhykpMqRP3jZqSKSZxJJhOtVRSSw2+8=;
        b=cPA0utThrn7Jy2oHNMl/xMXi3eWLBjQPB8EHOC0zu2y4htx4P/Zo8GWLdEYvD5ggNl
         lYQ+bLmkxo2DIc8kYrZHzmzmcThwC3KRI2Zhd0eAeq5gaEgU2iiWj/R4GH/4yOvGtc48
         o1VZTe+Nmk/Hq0TEHGe3yNmj+edIOG9AZIJEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xI4Q/j0QmM51lhykpMqRP3jZqSKSZxJJhOtVRSSw2+8=;
        b=qKK0+UunAJubp+oTDz+/xkagUrwHFDWBNhtWJ1pnY5Wyda5J86RfmoX4wTTUsOh3z0
         wH8v0YtNvQ5DmOHNUd6eeG/ifi3unq1HlbtbffZyWVSgebwV5IoE18sXmMKeSb7xnjcN
         vvJKqFQFjXLOte5JlR+cvr7ak5VjFTwoBaFBDumhxygaqWn/vyPyRDqni4G1Vag62bbs
         Cqhi6gB4OfbfnbTHYIMTQhAb6wl71K7GISGBZ0WXgke4BMqPu+dfL33LK8C4V9fkV53e
         /EGLOQ04fhaGtNWWXNPve28nnlxTK+Lxr8wNkx3brDCOLxqxK03DvC4MsMWtaasJugYd
         liBg==
X-Gm-Message-State: AOAM5306/a5x33SuOxtlB96YorgN9WNBbcRsoUKuD9U/eZ0FJzDPVIXV
	QNUF+gmtrMraBFldYiGMOYq9aPwzURsdXQ==
X-Google-Smtp-Source: ABdhPJyH6HzJvDFQ57e9IGPiGR0U7Ugb05w1VUhJlOnpDp6+ae+a3Vxr6t4Iadv234YkYqeVXWTwBQ==
X-Received: by 2002:adf:fe0c:: with SMTP id n12mr16859137wrr.48.1595886905019;
        Mon, 27 Jul 2020 14:55:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id b63sm1111674wme.41.2020.07.27.14.55.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 14:55:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: Fix mangled patch
Date: Mon, 27 Jul 2020 22:55:01 +0100
Message-Id: <20200727215501.319386-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To quote Zhuang <qiuguang.zqg@alibaba-inc.com>:
"""
A few days ago, I tried to compile a gcc plugin with the toolchain from poky sdk.
It failed with errors about missing header files such as backend.h etc.

After investigation, I found that the problem was brought by a gcc patch:
0012-gcc-Fix-argument-list-too-long-error.patch (which is considered derived from the original patch)

- headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
+ headers="$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; \

It changes the commands of install-plugin, making the sorting taken effect before the shell globs.
Thus results in the header files under gcc $(srcdir) being not installed.

By checking log.do_install, we can find that the `headers=' statement to run is incorrect and will not work as expected:
headers="$(cd *.def) *.h ../../../../../../../work-shared/gcc-10.1.0-r0/gcc-10.1.0/gcc/../include/ansidecl.h ...

As the patch says,
"The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle it, ..."
my suggestion is that we can simply take care of PLUGIN_HEADERS
using the original proposed sort.
"""

This fixes the gcc patch as proposed as it does appear its been
broken over time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0012-gcc-Fix-argument-list-too-long-error.patch         | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-argument-list-too-long-error.patch
index acbd75f139e..88e1715b5cc 100644
--- a/meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -17,6 +17,10 @@ $(sort list) doesn't need this.
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+RP: gcc then added *.h and *.def additions to this list, breaking the original
+fix. Add the sort to the original gcc code, leaving the tr+sort to fix the original
+issue but include the new files too as reported by Zhuang <qiuguang.zqg@alibaba-inc.com>
+
 Upstream-Status: Pending
 ---
  gcc/Makefile.in | 2 +-
@@ -31,7 +35,7 @@ index a67d2cc18d6..480c9366418 100644
  # files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
 -	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
-+	headers="$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; \
++	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
  	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
  	for file in $$headers; do \
  	  if [ -f $$file ] ; then \
-- 
2.25.1

