Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.19366.1621260894627001666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yvC5aFsq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so2954258pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4RryR48gNOpkLetiqu3DgJVjVVVLCNzPHRlHUHuZgmA=;
        b=yvC5aFsqSc08BbMLFSVle1XgS2/dO55oI4hq04Y4ZbpQ4MFhJtGCPA4Hht/Jf8ieHl
         nqZyRSJe6KPt9BaVu1kMJeyzTmGdA3ff9HrfULOMZ0wNHQd7kwanwNTiSvhC+yUCBkVA
         cAJWkHnoSIT6qEwWoW6yGXSf9n68ry0ARvbRWd4Nl0Bbhu5GdSRUIFvSjH3EJlRhcMgb
         hw305CEouO6AJWsty9yBEWFyz2umwWSJOTOl9YWjU0qbV3fuqejfzXyfM+eFucBZ13KH
         XpvD27WrSsqXlqVS9ZsJmsA9qv/yZi7x0niS2UJs4BiBpoDea9N0LaFVfXTITBWKSYnK
         oa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4RryR48gNOpkLetiqu3DgJVjVVVLCNzPHRlHUHuZgmA=;
        b=gFA0qTIOsuW1sp8wxNjcvH9ctiH3ErIpoCB1GhDKWtookoaZSJseQordb8FpBr+8PJ
         jdzjYkNiGOf9QKWsfoUv4bT36gmLsXHSKmCFHC2fPpkcrlxuIPbA82dat2+YS4dxWPo5
         m0jFBtPYcZbKTkRJt0JvnljaJOkRQmHEi7Qokbc6o0f88H9E/9ajQkYCXi1U6UiVXV48
         RbfquAGJyLYZ5VUbKx0JMMshSo1RR/cdN3H/kaEDNpZZT8o3cDIel6iEIP8JLXV8NQNx
         s+K/6iFJm0Cz4+nVLTifdww9bui95sF10uuklHkGo2pJ/9udFNt9GlHrv1OJSc5Ur0dG
         cU+Q==
X-Gm-Message-State: AOAM530q7T4onH2CDaC1lBS74K7LmmRIe27XRu59c0QIC5q5qmGuGsLZ
	AL0xmdm0LcM7Xbg7yiGyuNI9S8OWKrrYH3HIV98=
X-Google-Smtp-Source: ABdhPJzE5G9JY7RNt695WUFWla/D1DTsr8phzR//gTq3k6Td0MzjJqPwNCNbabtk75qvp4GiGnj8uw==
X-Received: by 2002:a17:902:e543:b029:ed:4852:5493 with SMTP id n3-20020a170902e543b02900ed48525493mr215409plf.56.1621260893818;
        Mon, 17 May 2021 07:14:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/35] oeqa/qemurunner: Fix binary vs str issue
Date: Mon, 17 May 2021 04:13:31 -1000
Message-Id: <8f24a7b35861b6aec39bc8d589e090ea9816732c.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The recent logging changes for qemurunner showed up as errors on the
autobuilder where decode couldn't be called on the returned string.
Since the code returns binary data, return b'' instead of '' to match
to avoid tracebacks.

One of these cases was newly added, copied from the other which has
been there for a long time, always broken.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b8995b27db265b0a0b2d2ca595915f70f9f96e07)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 410789b815..09ef9fadb2 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -646,7 +646,7 @@ class LoggingThread(threading.Thread):
             data = self.readsock.recv(count)
         except socket.error as e:
             if e.errno == errno.EAGAIN or e.errno == errno.EWOULDBLOCK:
-                return ''
+                return b''
             else:
                 raise
 
@@ -659,7 +659,7 @@ class LoggingThread(threading.Thread):
             # until qemu exits.
             if not self.canexit:
                 raise Exception("Console connection closed unexpectedly")
-            return ''
+            return b''
 
         return data
 
-- 
2.25.1

