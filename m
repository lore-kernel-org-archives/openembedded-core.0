Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154A8CCA481
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 21:43:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.32716.1654897403672915518
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QFZM93IX;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id x17so184200wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uAMPa++ia1KnffFugYvd8o2vuvtd+oNHzbTD5UJLnpo=;
        b=QFZM93IXCU5P/+t6yPVu8rTfziWH8FYXhyf0dJDKlFsF3X80lLQ+LNbCZxgNZ+Y/eQ
         aArKKpOXK86ON/6JkdWm5Vpj1sco7BG6zlUknsaBEgQyUw0CKyRDm9tcR5/4IE2zG91S
         6Fd/vS/gVZpZMQfUg+sSNrcfFV1m8GMbns8XOAmuGge3iaDvz3Xe8zfTGnRvF0bvcPpD
         CRky+fkAy6yVw38ktlLDrB/KXje6W6gBKebaa8OHHXZFPylyd6F7SdHWn4D5PI7nfRf9
         PsW6Kj9YF6VWGvGA5ecJhZYXqfs2QVf4boONvqz0LIQVIe2tv53doI0SCDwPD7HM5enr
         rG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uAMPa++ia1KnffFugYvd8o2vuvtd+oNHzbTD5UJLnpo=;
        b=8NSHihXmK5bfcsO8lZLC8hpmmumaZajeYY5Enio0p44L1qAuAMJRensYGydHyuDUtU
         +0ixk4YGdvdeIoxtzIZwyEECOTOQtnbGSrdDOsERJ16+l2njjyoJviFVb6tKkwPQ5O8P
         xyrb+7zVQ0TUrmpiQi4wY28GUI0B4OG4d5YMdv6yU5NdjlfnUJca0ydBwZWYZ5H8YBDm
         A5PDpMwaZnpxJnyCDwSWhXe8DAcAqcbczY73dROysWtYLMTdPzPvq/XErH5gJjTSurD6
         IFsnING52td44Q8AyFXbL7UTS6zSxZGzB2Dj/tVnttWlqW5f/osfhtaMA45zG9Xv26hJ
         jzeQ==
X-Gm-Message-State: AOAM5300HOC6TqG+VpzBr4C2lKRB5GBD+wlKsqV9U6oj/lfxKBpXxNTj
	knDKrSQp+hJX27/3DraqNgX+fPLyEQ==
X-Google-Smtp-Source: 
 ABdhPJxBguDjhLUUfNde7jEIAxb6ICK4NwoyI684KOOom9Z4Gp1sNyAO8oMIkKnX27KqnQnSxnY9Lw==
X-Received: by 2002:a5d:64aa:0:b0:218:4287:3c98 with SMTP id
 m10-20020a5d64aa000000b0021842873c98mr26908284wrp.453.1654897404121;
        Fri, 10 Jun 2022 14:43:24 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 e15-20020adfe7cf000000b0020feb9c44c2sm579309wrn.20.2022.06.10.14.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 14:43:22 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v3 4/7] oeqa/selftest: Add test for shebang overflow
Date: Fri, 10 Jun 2022 23:43:11 +0200
Message-Id: <20220610214314.2754247-4-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610214314.2754247-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220610214314.2754247-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 21:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166816

Make sure we do not stage any executable with a bigger shebang
than 128. Fixes [1]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 .../sysroot-test/sysroot-shebang-test_1.0.bb         | 12 ++++++++++++
 meta/lib/oeqa/selftest/cases/sysroot.py              | 10 ++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb

diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
new file mode 100644
index 0000000000..6c834be897
--- /dev/null
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Check that shebang does not exceed 128 characters"
+LICENSE = "CLOSED"
+INHIBIT_DEFAULT_DEPS = "1"
+
+EXCLUDE_FROM_WORLD = "1"
+do_install() {
+    install -d ${D}${bindir}
+    echo '#!BiM3cnVd1Amtv6PG+FynrQiVMbZnX5ELgF21q3EkuB+44JEGWtq8TvBJ7EGidfVs3eR3wVOUbLnjYDlKUWcm7YC/ute7f+KDHbwxziRUSUBZAUqgjiQdfQ0HnxajI0ozbM863E9JV9k13yZKYfh9/zR77Y6Dl4Dd3zOWS75LSpkAXV' > ${D}${bindir}/max-shebang
+    chmod 755 ${D}${bindir}/max-shebang
+}
+
+BBCLASSEXTEND = "native"
diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
index 315d1a61c2..9457f1e3ac 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -35,3 +35,13 @@ TESTSTRING:pn-sysroot-test-arch1 = "%s"
 TESTSTRING:pn-sysroot-test-arch2 = "%s"
 """ % (uuid1, uuid2))
         bitbake("sysroot-test")
+
+    def test_sysroot_max_shebang(self):
+        """
+        Summary:   Check max shebang triggers. To confirm [YOCTO #11053] is closed.
+        Expected:  Fail when a shebang bigger than the max shebang-size is reached.
+        Author:    Paulo Neves <ptsneves@gmail.com>
+        """
+        expected = "maximum shebang size exceeded, the maximum size is 128. [shebang-size]"
+        res = bitbake("sysroot-shebang-test-native -c populate_sysroot", ignore_status=True)
+        self.assertTrue(expected in res.output, msg=res.output)
-- 
2.25.1


