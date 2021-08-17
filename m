Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.40734.1629214059084269595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 08:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fwXim4qm;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id t190so10107115qke.7
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 08:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmySVGUm4MBZlhLnqD74a/2m6Jf9pnIyb+qxZdiK/0Q=;
        b=fwXim4qmfiwGhi8YmqSVnDA6ERP269f6qOpTaA6x5Cyov/pdpS9oxUH0Qhp6KpBnAv
         T/Il7KPTiQGXOcKfJ7gNZmhPeaAMyRdyPvocFRKBvvsAVSC5N2iWSicZhHySXlFJ07i5
         nkYAuqnTGAPZC5rRjLdj6pZeFqw8mSe1YVVzPlfFC2M9wFlgyjHSCpTtdqkOdd+ocKZP
         KPClzUg30BJyjWWx6THpItTLZ59wmL5uKKjLTfOdLpfsyilLKQWAG1RvQ5OCVhg/l98V
         jDXFmLLbR4N0qgsUNUMXeyJXg7GIUfeAd9t6JKotbgE6f3HBAovmieW2XAKedmmRu6cF
         j5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmySVGUm4MBZlhLnqD74a/2m6Jf9pnIyb+qxZdiK/0Q=;
        b=DZpRKOTgsHD5dperhjrFqu0+mDl3R4ilIRDBrcZiHCs5DqodbIHJ6OOpkXB5QIqB8r
         uvkrWnz75VY9rGjg9dYAsGUiRGqLkuDRsSTWIyJxOSJt2tw2sPPRB+swXz7+PbgGGab2
         F0hqZsyQ2F5KqXG3RF5MDkjf3d0v+3arVzjK2fL0S81aCpUfdlVJGNwo+a02AG6p/IeN
         FxBMsDQnQrfw0I3eg+MGgFfcdu1NQyxexJZ31ogdeB9CWtVz/gfkwfJKdMiSRqQQ/vmM
         NnG1RpqXP8QQigLwyNQFWPDKyTxtYYi7q1CT7Tj2JxDLK3pymhlI91uUWRBjcgXGZ5lk
         oktQ==
X-Gm-Message-State: AOAM531g1tbuPH8U5nPwqPwkiTZMsm5tNREUkXWa0N9YraxbfHQfHBRa
	33tHtRTSc5P06fXIS1DQGPn0ZcNytwadSQ==
X-Google-Smtp-Source: ABdhPJzISKIdMjqaERNp53aHg03sxshCQUFRT+2AnAY6Go+US/NQn7/CQ1uamNwrXhMfyl+UimOO8Q==
X-Received: by 2002:a37:9d92:: with SMTP id g140mr4284279qke.189.1629214058183;
        Tue, 17 Aug 2021 08:27:38 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id h6sm1175744qtb.44.2021.08.17.08.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 08:27:37 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] kernel-devsrc: fix 5.14+ objtool compilation
Date: Tue, 17 Aug 2021 11:27:32 -0400
Message-Id: <cbca24944ce779af224add9874a94341719d84e3.1629213685.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1629213685.git.bruce.ashfield@gmail.com>
References: <cover.1629213685.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In v5.14+, x86 requires not just elfutils, but the elf headers
on the target to build objtool (required for 'scripts parepare'),
so we tweak our RDEPENDS to ensure that the right headers are
on the target.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 23de1a4917..d39573965f 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -322,7 +322,7 @@ RDEPENDS:${PN} = "bc python3 flex bison ${TCLIBC}-utils"
 # 4.15+ needs these next two RDEPENDS
 RDEPENDS:${PN} += "openssl-dev util-linux"
 # and x86 needs a bit more for 4.15+
-RDEPENDS:${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils', '', d)}"
+RDEPENDS:${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-dev', '', d)}"
 # 5.8+ needs gcc-plugins libmpc-dev
 RDEPENDS:${PN} += "gcc-plugins libmpc-dev"
 # 5.13+ needs awk for arm64
-- 
2.19.1

