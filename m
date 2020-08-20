Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.105577.1597906654116315795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 23:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sX9IBS7W;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id bh1so488085plb.12
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 23:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C2wiqDXjUnu8blyzp9U3PAp27+wcvArVyESgjLjl5q4=;
        b=sX9IBS7WjNhaK3LQ2yCZPjqj8O63ZDwhjcORwJ8McZfzgRygaJG65DwjdC60Ee6YRE
         7aUGJlujXoO3+RUApdcPI7ddEfBOX8rgjg5CYdroE34orV1fXDFy6vhvaMPhm0wcUhPn
         OlXfQpGwVyFyHCwPxTlQ81t45ldCyht8wnpowkKkFiFlhA60YyO6N3yq1tcToiGrhIbi
         NVWL70ZxgswPoPrE6RduK2M3L/fSGLr9TRcksxnCBgH1RsOBLYFgxL4zpJWfEVDUuD5L
         M1BfVTMp3YRTSbyLnzX0H7ZneTkE3CoyfXsUYWUUJzWBo9tiGcm8sRVcwyccVtuPYsyf
         Sn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C2wiqDXjUnu8blyzp9U3PAp27+wcvArVyESgjLjl5q4=;
        b=CF7vffiXkis9kPKi89pJxILIQkbKM5JErYPhpWbG2ZYo2smpDlnmybctnVSkVisM32
         4JpNDCoeMN6mtBVq8i+mk5ECJ3EHMizIRECoWuI2CB861PnNG5DEkgIm6GUif6dLQFg+
         rhqNWhVlT76PJG3/EKkkqQodOpFKPkPJB1dsuuDdEHy8o/fUNlWWAXF+EeMz/k/RxzbH
         tJ6IMjB8XsccrcQTSaTEh+ZMGjGygRDxFTErBtKBIzXwnbO204kDGWoP2U/1jr4lEUZw
         t2PA6+J9IskB5gpfkdfwbsg5mNuIjF1JYPRUhFHt+S1javhRjTMAwh+5IwaNHm+uQwHL
         sghw==
X-Gm-Message-State: AOAM531TqspiLwLQ7psLrS91AJE4aNXP6RIjRNc8ZyjlGbwDwF26pPbA
	FswRqhhX3JhHFUctJGXUtgR2n0RwR99rxg==
X-Google-Smtp-Source: ABdhPJwCpVv+1Z6kuFELSWxu4sKZDh7CQvhlQ+ECw1EcKetrEMGwVuzshr2GPmHr5NyyA+eFeg0dfQ==
X-Received: by 2002:a17:90a:7485:: with SMTP id p5mr1369614pjk.130.1597906653329;
        Wed, 19 Aug 2020 23:57:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id 77sm1534936pfx.85.2020.08.19.23.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 23:57:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] gcc-cross-canadian: Correct the regexp to delete versioned gcc binary
Date: Wed, 19 Aug 2020 23:57:26 -0700
Message-Id: <20200820065727.2589128-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820065727.2589128-1-raj.khem@gmail.com>
References: <20200820065727.2589128-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After gcc 10 this expression needed to be adjusted, its better to use a
bitbake variable which we do have readily available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 49127192e5..e23b21b68f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -106,7 +106,7 @@ do_install () {
 	rm -f ${D}${bindir}/*c++
 
 	# We don't care about the gcc-<version> copies
-	rm -f ${D}${bindir}/*gcc-?.?*
+	rm -f ${D}${bindir}/*gcc-${BINV}*
 
 	# Cleanup empty directories which are not shipped
 	# we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
-- 
2.28.0

