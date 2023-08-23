Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB72EE49B6
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:07 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.13081.1692801420712533727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MWOJe59K;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1bdbf10333bso44909745ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801420; x=1693406220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMDLPHyk0qoVbIGlZ0uMIsfdbFGiJ1KWwdkQ/xLdAnI=;
        b=MWOJe59KLZ93wCHNm1cj2YdS3tY6cpmrREMKX4ophQBxtwe8A3Bx6mFXkAQ5ttDbOX
         2f8nhiMFJ/+E0Gc/lcLEdSLP6G1KLLJAJfg/wsuOSl0+PO2o18zkHm3k9Jy0S2KNz5nK
         F4E/akocR8XdaFRQKTYBKRbaBmVxV2m10bGLGRcABcZNge/++4oHfZpQ1JLuruDT8A+J
         PTVbISkjkd73py9uGvf5tbdkV2FzHVtG3+jeqKpumNKDJa9S+RDhT/6EL/sGGHOB1W0P
         prJhM9290Uwbjd0Q2CX0QLXYWLX+Fba1ygRfvQcySz/TaqdvXl5ALXm1vpkPR5e+ryhY
         qqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801420; x=1693406220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMDLPHyk0qoVbIGlZ0uMIsfdbFGiJ1KWwdkQ/xLdAnI=;
        b=eThtNejGqTFZgwyQ6Oi+yra7Ifs75c17o0vlbHX0bgByrsYUx3sPkcqQq5637EVf6g
         GnN6Ndbv8u6vN6Efm4APzDMuBZ/R1/nmFa+/q9MXk8dyKbl8w5SslHFGqgD+UaPI0MH6
         fSjhcQzXqQSWw4IlESh8tpFUW/yUilvTupYx4ZSmulomQhFDdFTwQoApxTjnZrvO63SK
         Mf0o5wvqxVq/SAqPE6XBV1ndmPTdqXcstU1nfa6oOx0wrYIUswxgzNhI+GHBZ9D3Jf9X
         u7/siXGsuZCBIbmN+eXM7nfNp5qvNKdciX/JzSVRdNh3M8zQI3zPZRLJpjaYYTnUEZwF
         ZuGA==
X-Gm-Message-State: AOJu0YyrVpEFAcUruOMq4lIGJlhZhHCX0KQVucAeQQZfdfMD7zDnij9u
	QzIFZkw+2wVyDUo+JNKoOAW5ruWEkdQDEEynoeo=
X-Google-Smtp-Source: AGHT+IHUT38ycrbzv+m6LCHpqO9d3pN/g/Kafhg4H9pV9v72ZKDippI8lzKS4uN6KZnlFl0QEaXVlA==
X-Received: by 2002:a17:902:7446:b0:1c0:b7f4:5b86 with SMTP id e6-20020a170902744600b001c0b7f45b86mr793753plt.65.1692801419842;
        Wed, 23 Aug 2023 07:36:59 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/36] acl/attr: ptest fixes and improvements
Date: Wed, 23 Aug 2023 04:35:49 -1000
Message-Id: <5908ccf65b5ca4a0473a57774f06515d6bc9f56c.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186600

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a missing perl module dependency for the ptest packages and also
improve the run-ptest script so that the error log is saved allowing
easier debugging if this fails in future.

(From OE-Core rev: fbb9c596b8e6a8a1260dd7aefddf138d20bf64df)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c948fa0250b765bc5f2fbe63c82258601cc77ff)
Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/attr/acl/run-ptest  | 6 ++++++
 meta/recipes-support/attr/acl_2.3.1.bb   | 1 +
 meta/recipes-support/attr/attr.inc       | 1 +
 meta/recipes-support/attr/attr/run-ptest | 7 +++++++
 4 files changed, 15 insertions(+)

diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-support/attr/acl/run-ptest
index 4312823365..3af75c84fe 100644
--- a/meta/recipes-support/attr/acl/run-ptest
+++ b/meta/recipes-support/attr/acl/run-ptest
@@ -7,4 +7,10 @@
 mkdir -p /tmp/acl-ptest/test
 cp test/test.* /tmp/acl-ptest/test
 
+set +e
 make test-suite.log
+exitcode=$?
+if [ $exitcode -ne 0 -a -e test-suite.log ]; then
+    cat test-suite.log
+fi
+exit $exitcode
diff --git a/meta/recipes-support/attr/acl_2.3.1.bb b/meta/recipes-support/attr/acl_2.3.1.bb
index aca04a9aac..c2c9ba9069 100644
--- a/meta/recipes-support/attr/acl_2.3.1.bb
+++ b/meta/recipes-support/attr/acl_2.3.1.bb
@@ -62,6 +62,7 @@ RDEPENDS:${PN}-ptest = "acl \
                         bash \
                         coreutils \
                         perl \
+                        perl-module-constant \
                         perl-module-filehandle \
                         perl-module-getopt-std \
                         perl-module-posix \
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index a4e38f2b19..56028edb12 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -50,6 +50,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest = "attr \
                         coreutils \
+                        perl-module-constant \
                         perl-module-filehandle \
                         perl-module-getopt-std \
                         perl-module-posix \
diff --git a/meta/recipes-support/attr/attr/run-ptest b/meta/recipes-support/attr/attr/run-ptest
index f64244f239..3e7a3a17a0 100644
--- a/meta/recipes-support/attr/attr/run-ptest
+++ b/meta/recipes-support/attr/attr/run-ptest
@@ -1,3 +1,10 @@
 #!/bin/sh
 
+set +e
 make test-suite.log
+exitcode=$?
+if [ $exitcode -ne 0 -a -e test-suite.log ]; then
+    cat test-suite.log
+fi
+exit $exitcode
+
-- 
2.34.1


