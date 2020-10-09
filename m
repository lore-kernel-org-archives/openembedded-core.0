Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.12968.1602248304408417670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 05:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LeuX0iUW;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id a3so12868740ejy.11
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vo4aom3vICqeQNs3R1LS8yl1CKDzTiFrSMA6YKTu4ek=;
        b=LeuX0iUW18pthW1JtFJQxr1dy+xTCKOoyOu8kSU52V1cXfdiSLAGEwkwMKSe02i7XV
         YIEKNWywpTrqdsc98WurExIkSVoQKlffF4CIV7Z25NLwGps0KX7jKUBK29L+dYEV0rsm
         UQsXvgEsWbubnwlFRmj2zspCuLCQzNnaw9/Drz55EVR+6UFSQv9IHyhH7PIVuYLf+I/1
         LKIQL4wYKQ6xlVt/YPIzfgU0wgzRqCLCmgvrPpnpyBpJ0vC0jBLMCGflRbfY+KMMFAzy
         12dcbfzo2VY8d3bKwXet29JOK8dVL9IpaTAzd3jlcwxax+/e1WYikOV0PYK5pOR4gzSH
         wbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vo4aom3vICqeQNs3R1LS8yl1CKDzTiFrSMA6YKTu4ek=;
        b=VO7TFEqCj0tKmcIzEME3jsZbQhhGXP+f4NPALg99jg+dO1nzQMbeA19wl+YeeI6UY8
         cdJzFNqHPix92VJ7bqNvtUZIdRJbIvcE9f1wjhoUvVcWmV2Rr63FAxkvZDfJvK2zaeuv
         VOBPbfPgQlMLytaNIZ+iSYUkXlosLqTIK20tOYwrtf8CYc/Awog6I5vU+KCRrP+OGu7R
         07BLIwELa/8iNvPNAmAvFOkoT6AX45OchMLsrMII6+w83ACxmSaBdOml8PGRX1Go1oOc
         PNl0EJdMsnazTTzqHncwKtmyY602NfcUlElyAdfGzAq6hBSx1kEBnGrPw5Y3VNEuT+LI
         x4fA==
X-Gm-Message-State: AOAM532GP4jDDPybbJEV6IV2Ppql12+mKlcOqPwfPm9iZ9MMXPgJn7gH
	1b+jhY+2xuxT4ufXmiO2dR2p8ptth/M=
X-Google-Smtp-Source: ABdhPJzizJA0kAYAlLVw7VwbCtoG33XtS9nWIYtO7SH9OxSsemJzeX5Wza8xZ4IkKpHhgYV+8PxZYg==
X-Received: by 2002:a17:906:2ac5:: with SMTP id m5mr14045971eje.210.1602248302630;
        Fri, 09 Oct 2020 05:58:22 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id me12sm6275627ejb.108.2020.10.09.05.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 05:58:21 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] base.bbclass: warn when there is trailing slash in S or B variables
Date: Fri,  9 Oct 2020 14:58:14 +0200
Message-Id: <20201009125814.3035266-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201009125814.3035266-1-Martin.Jansa@gmail.com>
References: <20201009125814.3035266-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* to make sure we won't hit such corner cases in future add a warning
  to prevent trailing slashes and duplicated slashes even when they
  in most cases don't cause harm

* only a few cases were found in layers included in my world builds:
  oe-core: 1
  meta-oe: 7
  meta-python2: 1
  meta-qt5: 1
  meta-aws: 1

  will send patches for these once this warning is approved for oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 62e34d0079..5a0b0c6b3e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -388,6 +388,11 @@ python () {
     oe.utils.features_backfill("DISTRO_FEATURES", d)
     oe.utils.features_backfill("MACHINE_FEATURES", d)
 
+    if d.getVar("S")[-1] == '/':
+        bb.warn("Recipe %s sets S variable with trailing slash '%s', remove it" % (d.getVar("PN"), d.getVar("S")))
+    if d.getVar("B")[-1] == '/':
+        bb.warn("Recipe %s sets B variable with trailing slash '%s', remove it" % (d.getVar("PN"), d.getVar("B")))
+
     if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("S")):
         d.appendVar("PSEUDO_IGNORE_PATHS", ",${S}")
     if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("B")):
-- 
2.25.1

