Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.35618.1607956698831909858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:38:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YqXpBkl9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id c12so12089083pgm.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DmTT2XNRCnX/v+VNIaHKSKEVrLQfjTtOLcitQd4uH7U=;
        b=YqXpBkl9CGcjNy344K+1qpjiNnEmZ6UGc2x0g3FCpIrO7uEh60mFxW5+wpMEQnd3mS
         G0PpDc+v+j3sQbwlzvkDr4SzS/tpmmtxyltC2JLwtuT1Nqh4f8grcXRTar9rmgiJ2L9+
         iifawtg4q4I7GGZeV2cRGgqBhBQx5ksXRu7GTRruNu7yQDTWeDE1XjGwmK0+udUEPRTZ
         QyklyBUDsj67XS53NhqHIYj13PoxxXvh5f1QCmCiQ8fDUTzSs2wycgYgT53qe3bM1tD8
         l1fAo+1vMgeyi817zttGbKsURu9NrAlN0bap1DyEHIJE+/MRytN96EuDk13uWvusAqsH
         zmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DmTT2XNRCnX/v+VNIaHKSKEVrLQfjTtOLcitQd4uH7U=;
        b=D0AAe6mXTD0Y+IpRtQzjgjcBAf6x6Jw2aUselyBEc3/jxg/6XA2S2oz+zh0wllEY+Y
         0Dmq1+nDTXbfMQoGHyV/BMQzWitz8CoamDGPX4YAtqug4Y+SWOzJPUdpXb3icOsiSW+F
         PFK8iHGJFsvlrwsDCNKGfRIuE2i7AEEjabIwlNIdRQLc6co4bxJVchTjb3QZMN4BJHlI
         Tkd4B1W92yzq9CHfquo2B55bC3/qyfE2YVWDk1OR8aH26kRtqkktkXlcoepQQ4hE08b1
         p4GZfFagmVB5Zx1HOxq762qsviSU8LHyScm9VUBCyYcxaKfWP9X3z+kcsFMmJGuABWO4
         COjQ==
X-Gm-Message-State: AOAM531PNTyKkH7j6J3snsEOzIxn28v1RAPS0C1nF2SCtYPh6q0zWbAm
	+RNU5yyGCZkWWklY9YQWKf+jjjRvyzXuAAev
X-Google-Smtp-Source: ABdhPJycu2rBW0mPLeXQDPMnQxrNrXhDVow66/AWinD6BiNEbBj+ZpfrOH+sh+Yp9dAF4YW4XsIEbQ==
X-Received: by 2002:a63:1805:: with SMTP id y5mr24423193pgl.27.1607956697948;
        Mon, 14 Dec 2020 06:38:17 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.38.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:38:17 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/25] metadata_scm: Fix signature handling of METADATA_REVISION and METADATA_BRANCH
Date: Mon, 14 Dec 2020 04:36:53 -1000
Message-Id: <edbe823ddf53aecc58d28fbcf7de1a1dc2dc79c8.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're not interested in the dependencies of these functions and what
those functions look like, we're interested in the value the variable has.

Force the hashed value to be the actual value from the function. This
means using METADATA_REVISION in DISTRO_VERSION for example now
correctly rebuilds when it changes value.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 005651dc782859c01f170fb974811b2a13cb2cef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/metadata_scm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 58bb4c555a..2608a7ef7b 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -1,5 +1,7 @@
 METADATA_BRANCH ?= "${@base_detect_branch(d)}"
+METADATA_BRANCH[vardepvalue] = "${METADATA_BRANCH}"
 METADATA_REVISION ?= "${@base_detect_revision(d)}"
+METADATA_REVISION[vardepvalue] = "${METADATA_REVISION}"
 
 def base_detect_revision(d):
     path = base_get_scmbasepath(d)
-- 
2.17.1

