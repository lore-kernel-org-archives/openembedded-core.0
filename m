Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.22119.1622304397713333263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 09:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RtaFHKEn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id c3so6243250wrp.8
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+tDpEXvJJC40SK0+wtIbaTkdwAIasUQAy2L45h7sp7I=;
        b=RtaFHKEnBI0gH2t6dXkDsP3TMlwMDVuzPyp4y7eu07JTVbPKSfq4jnbceloKx9LIOI
         X2EkL4F/xdLA+D1tl9xU2FKt/9/WJpnDqiJVVj0LVEAk8NicdhJ1wcgqdhdidqxCMT/m
         l6VB2OJ+VJxbDSulqFnRHZx4/CA+e+bibw0cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+tDpEXvJJC40SK0+wtIbaTkdwAIasUQAy2L45h7sp7I=;
        b=g0TBqbtzhpcITNd5PmIv19WqnTTixFNCWl1N0D/RFirwtWsehB46CZZRYnj3WTROm8
         mFdajEk50o0qo8LAjrtdn/s0aCdcJ6RBHQB4DXu14r8jbYbKa2Mh5lDmoIWYiPQC4YSi
         o2s/sJ4qYhbP/QLXGvhiz6M44KY3xRaR8ZpVS/VsRZZ9jca/P59dr4SIghSskreSxaLd
         mSsE0UBn0VXle698S148TfMx+mfUINRs/jDBoVjyY5FobYvG/X5U2olphqZpKghQvg4M
         xVF+T+Sa9q+bbj6zMtA9rVQtZN8r+FGWkUJ3kN5pnrwwlXE+YFZMlF7KmKqMiq5ZgNpW
         9rBw==
X-Gm-Message-State: AOAM530Oqjr26DstJYe5OMRMQOzQewd7A2VTtkPmTAFkiduZLBvWfyXt
	5D1Blz35ESDyCi8MtpV5HdUuiEZkw2trYw==
X-Google-Smtp-Source: ABdhPJwqvqJmCo7db/vGNOSKbM/8Iivh69Nvj9Au+j/y7Zdia9S3uhpYEmNsnTIMBUloYJwhcnZczA==
X-Received: by 2002:a05:6000:186a:: with SMTP id d10mr14561494wri.41.1622304396212;
        Sat, 29 May 2021 09:06:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:314e:6a46:a163:7356])
        by smtp.gmail.com with ESMTPSA id q20sm20873615wmq.2.2021.05.29.09.06.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:06:35 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 08/10] grub2: Add CVE whitelist entries for issues fixed in 2.06
Date: Sat, 29 May 2021 17:06:30 +0100
Message-Id: <20210529160632.2796977-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
References: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're using a pre-release version of 2.06 so these issues are fixed but
continue to show up in the checks since it is pre-2.06 and the CPE
entries are "before but excluding 2.06".

Adding these will clean up CVE reports until the 2.06 release comes out.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/grub/grub2.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 6de683ee1c5..f0fa86b1823 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -27,6 +27,13 @@ SRC_URI[sha256sum] = "2c87f1f21e2ab50043e6cd9163c08f1b6c3a6171556bf23ff9ed65b074
 REALPV = "2.06~rc1"
 PV = "2.04+${REALPV}"
 
+# Fixed in 2.06~rc1, can be removed for 2.06 final
+CVE_CHECK_WHITELIST += "\
+    CVE-2020-14308 CVE-2020-14309 CVE-2020-14310 CVE-2020-14311 CVE-2020-10713 \
+    CVE-2020-14372 CVE-2020-15705 CVE-2020-15706 CVE-2020-15707 \
+    CVE-2020-25632 CVE-2020-25647 CVE-2020-27749 CVE-2020-27779 \
+    CVE-2021-3418 CVE-2021-20225 CVE-2021-20233"
+
 S = "${WORKDIR}/grub-${REALPV}"
 
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/grub"
-- 
2.30.2

