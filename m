Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.40869.1590446272897344337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VAB12TrL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 124so2926615pgi.9
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xHzqyEc8nPu+F0W6YbyORHxlcVVYarLqFdGfoOeue4Y=;
        b=VAB12TrLV9ju+PdLWvFdRBFamIL2SEGgRxdTHKdvOM8/nGSc/7HSP/1ANcpSS9T9Jz
         It8+1bjneRbvn11HCoc89+83D3+dnzEs+oNSnwqvB+GjFM7h+QL4fmEccyHzy7vLfyZj
         QX/sHQqzYUiEe1h+fhO1cUU5D1NGOEN69NCpL8BY6HCcgbdWqCu4cHqszdzjCPcF93rT
         /mWaHgNsafebQFiKrMGXJ1WCGS9HHcmELB8BtW8gyZZGUko8Sh4DCzmPtjVxYfco014d
         wHftF8TuuqW0PR+W+8GGi3IksPQFhgqVflTLeNjErCAJ3V1yP0or9rOavR4rjNYbHMjP
         U+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xHzqyEc8nPu+F0W6YbyORHxlcVVYarLqFdGfoOeue4Y=;
        b=quIr3Wv23b71KR6fdE4RlvE+VwqKwNzFS1yX9SFoycJ2KtnyHeQeFP8PUTreaaiCKm
         9I9yQL6P16K0EPRq70ItRgg+UTkJnWstpOQChMj7L+GF/pqWVeCcRfLUMH434kKukIdD
         hO2H34SAldr9UIJb5PJp9y8zGLfn838j54wLBvBFF9ie6in+2tfCiAUwtfh/nk6Y238n
         WYBp+URfwvGRB1dicsmZgV0HqHJyo1qaJ5DG8H7cXKSPt3xC1Ufrxg/O443OhQi0LA7s
         W1/mxK636xk/WKuuNPKsdJh9BXB76gIkjYHvgIe5anZsli+6SFtDFyqDUw31ROte3KBQ
         Dw3Q==
X-Gm-Message-State: AOAM533Zrqm+p7O3sM6gW3bory6fDQrrtnOJcPFVkCc5F2D0D8Kq0wCG
	nzafwZgq9bYGwzwzTiQ5b+lY7EnGrh0=
X-Google-Smtp-Source: ABdhPJwl2TGVONwJADygqzC51j8V/2bUElWun+5/fyiKZc9StKzFr/k2vQPz7rfWpFuDOsDnWLTEvg==
X-Received: by 2002:a65:40c3:: with SMTP id u3mr29535084pgp.305.1590446272038;
        Mon, 25 May 2020 15:37:52 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/17] file: add bzip2-replacement-native to DEPENDS to fix sstate issue
Date: Mon, 25 May 2020 12:36:59 -1000
Message-Id: <5a2bc3bfa9e1a4f37b6e26a5c40a4a9c025d03f1.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: Jan-Simon Moeller <dl9pf@gmx.de>

file-native when built on a Debian 10 host will embed a dependency to
'libbz2.so.1.0' (instead of 'libbz2.so.1'). This can cause issues
when sharing the sstate between hosts e.g.:

 recipe-sysroot-native/usr/lib/rpm/rpmdeps:
      error while loading shared libraries: libbz2.so.1.0: \
        cannot open shared object file: No such file or directory

To avoid this situation, let's add the bzip2-replacement-native to the
file recipe's DEPENDS_class-native .

Details in https://bugzilla.yoctoproject.org/show_bug.cgi?id=13915 .

Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a996574464028bd5d57b90920d0887d1a81e9e9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/file/file_5.38.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devtools/file/file_5.38.bb
index f5ad568936..2d62ead10b 100644
--- a/meta/recipes-devtools/file/file_5.38.bb
+++ b/meta/recipes-devtools/file/file_5.38.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdda1b"
 
 DEPENDS = "file-replacement-native"
-DEPENDS_class-native = ""
+DEPENDS_class-native = "bzip2-replacement-native"
 
 SRC_URI = "git://github.com/file/file.git"
 
-- 
2.17.1

