Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.58334.1622557142188746754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Y4K4MU0X;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id h16so4673191pjv.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xddp9IgHzvGfJMnSa9KyIo6tlSQqgRVtcciPHxCv6nA=;
        b=Y4K4MU0XLZ0Sb7m25zs9dp5uDhu1UcOeuOGu6K8q4J54nLl528e07xBMcalnhrM4ao
         BNnfvHJTz3Ygk4nsZtURGhu7zneZuzWDz6UC0QFci1Jn5ZqNvzcETFtRn+j/AHPBAQWr
         knnzrByYxHNryikZh7kHLp9tYuxjwpp6OL1zOpSZWhaZ6+CT0sdgnvvHQkl8JoxlLIBu
         pQYmZ6HUMw5ozCFoNcZuYKxiRO1rzNFFfhaPA8Itxb3wQLNlPqmwdKP1Z2RAfsZUsgYB
         n3p01h3qY2Ya8mRbaOV3NBvB6yeGWrOWr/purpKqX0pplzN6G8pfn8wueUu2daLG4LSp
         CFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xddp9IgHzvGfJMnSa9KyIo6tlSQqgRVtcciPHxCv6nA=;
        b=o/1SYd8PLNrJ4+8463Aysdsi5BKPBwE4IKSHrsuV4ybAJgKk41W1XXj1fUTgIl54VD
         DqcoPrneD8uIJJUTUeMMfMrQww0J5UWZE3lCM22N69C7QnkXNakBGikvcSFIFVKRMoH4
         sRFcEm5X85LTvq1/nq6fqLHcWBXjA+tMTqJ/XE46qb/ya42MAgeP51c3CN4Ga7peyxnR
         iIoCfoVijvn50E6kEVVMwlF/tIfyvU/gP+HIwpkfx4q+1UTd2mjayIMuDFYW2OnFdvc8
         RydFjS1c2ClBSNiGlpoOCYtzDbcS+/Im5SXpkTNHUUuQgAUXu8fmEnLQJZoYOh1f5n5V
         Bk1g==
X-Gm-Message-State: AOAM532UcXOu5sOfynSvisIbS+H3xZGCSon4IvOkZVheDLykUTaDPPqM
	MNGLP4ttf27d59gvumbiCvzgZkKpJHpHjrXFmcE=
X-Google-Smtp-Source: ABdhPJyxQ5FsAFDuhqBZ6byvBnQKmYI4VKpZTah0k3lytc2xjkUY7LaIPIwEAKvAVQglrEL0kCJYFg==
X-Received: by 2002:a17:90a:bb06:: with SMTP id u6mr24637120pjr.201.1622557141317;
        Tue, 01 Jun 2021 07:19:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/26] libxml2: Add bash dependency for ptests.
Date: Tue,  1 Jun 2021 04:18:02 -1000
Message-Id: <bc1d05429da1101d910b4ccf3de5407ddfbedc92.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

Before, running ptests on core-image-minimal would result in
an error due to missing /bin/bash:

   [ -d test   ] || ln -s ../libxml2-2.9.10/test   .
   make: /bin/bash: No such file or directory
   make: *** [Makefile:2105: runtests] Error 127

Changing the Makefile to use /bin/sh results in some of the
tests failing, so I have added the missing dependancy on bash.

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d2e81298c446aec8d7fcf61fd5023ac30350f205)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2_2.9.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 4ebfb9e556..db660b9869 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -42,7 +42,7 @@ inherit autotools pkgconfig binconfig-disabled ptest features_check
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
-RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell  python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
+RDEPENDS_${PN}-ptest += "bash make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell  python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
 
 RDEPENDS_${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
 
-- 
2.25.1

