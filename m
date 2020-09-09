Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.9672.1599642981723828662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 02:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eFPT3B1K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id k15so2081938wrn.10
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WApRT4cxsEeNZ2GEkG+c8/Md89DE1mybwE44zwzCpsM=;
        b=eFPT3B1KHSDG00m5GqPl2yJNCBe79zthe3TcHCGOkzpIh1UwPhYK+LgvJYQ4UanqgJ
         sa0Gz1HyVmosoMzENhC5WF5aY2+GCJDIKqUt1zFNmJtibU7fu8y8m0gIPhyAqgePaf1K
         riOrdnw7QjAhkPdAB+H3tgzneHk27zDoqf54A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WApRT4cxsEeNZ2GEkG+c8/Md89DE1mybwE44zwzCpsM=;
        b=O+w1NXH5uKiGD7g3qoYm3Hhy51/Y0xJsV8g9FF6VCldfW6Mj9ORoL57P+IjE1YcC83
         YYcODJp9r4grWZ7pSwyq3c9SldMTeyYbWmrcgVkAX7MRbAhVK7Kbcq+1orfA5ogvuDW0
         hXdzC5yOBV/jhM6fF9dSkM+VIGQxf0znlc1S4UNRgkitYFREtt67AOCwb8UAEImWdNJ5
         N6B7xghD9ddu9oyQoj44n1E3kPNZlgGsZIecWQ832hB0JTCcE8d0R/hQ9QJQAdb/TGk8
         VBTnUi/Rnwa+yZtTbton5Q2j78owIWpZXOvpBqFPjd7VFfqFs8OqmPEWlWHPFoghk3gJ
         h62A==
X-Gm-Message-State: AOAM5304BPHay3IaUqpvjKVuiJetwm/gMkZ+N9c1bdU/9KUoMqpXoJBg
	HEdrDjqaEdz7tHPNFSJE0TFOhzR+UfnfOQ==
X-Google-Smtp-Source: ABdhPJxXC1IC8FdQ9OIymaBUXDEx0XxaFsVoXMlarLFcbc1xWcGMxpvqK7j67srSwdLXP5xN9ek45Q==
X-Received: by 2002:a5d:60c6:: with SMTP id x6mr2968804wrt.26.1599642979730;
        Wed, 09 Sep 2020 02:16:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id y5sm3136403wrh.6.2020.09.09.02.16.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 02:16:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus] acl: Disable parallel make install
Date: Wed,  9 Sep 2020 10:16:18 +0100
Message-Id: <20200909091618.2007950-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similiarly to attr, do_install fails on newer versions of make with interesting
and hard to debug errors. Disablle parallle make install as a workaround.
Later verisons of acl in newer releases don't have the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/attr/acl_2.2.52.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-support/attr/acl_2.2.52.bb
index 6bc77d868d5..31ec64a43d4 100644
--- a/meta/recipes-support/attr/acl_2.2.52.bb
+++ b/meta/recipes-support/attr/acl_2.2.52.bb
@@ -25,6 +25,9 @@ SRC_URI[sha256sum] = "179074bb0580c06c4b4137be4c5a92a701583277967acdb5546043c787
 
 require ea-acl.inc
 
+# Has issues with newer versions of make
+PARALLEL_MAKEINST = ""
+
 # avoid RPATH hardcode to staging dir
 do_configure_append() {
 	sed -i ${S}/config.status -e s,^\\\(hardcode_into_libs=\\\).*$,\\1\'no\',
-- 
2.25.1

