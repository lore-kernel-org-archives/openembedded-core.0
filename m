Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79844C5DF8C
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 04:28:55 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102.1787200133422421375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 21:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=A0g4HnSn;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so1771588b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 21:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787200133; x=1787804933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Daa5zVIFOWqzUk/60PpTtGhG77DCJeZ/T6vEXRdih/k=;
        b=A0g4HnSnORsDXF0zSYVNs4oTKen+OzZeHHbpFJXsFoONfyCCh5zMA+a2gqEFC5L8H2
         aVbewR+LaxB236gCHSgggDfwNPQe14ZQPWw3cs4JB/KEr7uvAJkCbSjBvS+fb3xR3elo
         fcj503aV/MzfMN9grNtU424XB3fCQ7ibpKwUNXRq4Tb6mwnwqNbxqffzMXzf1LgEgi9L
         wOhH8692MRPp0vGX4X85iVVePqfhq0MVqKOwheBP2tbvwiPRLhYGZRSM9GSmr+cCmVL9
         e32qwhvjwtb1X/dQ/2hy1Mi4Nu1irmvAf8k+bWTgZzEiwoohrnXBRgKzSrCqtJ57ae3Q
         nQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787200133; x=1787804933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Daa5zVIFOWqzUk/60PpTtGhG77DCJeZ/T6vEXRdih/k=;
        b=C8gnP5Vt7gFlVsa3zTCbCLTvRrY3RYfMBrk/SJLGCSVL4ZE4R8aBGm7ExY9DZOfYZs
         QUIY1+IFWVMs0kPfYTsdOgFqL+bGbnba6R8jtXVWqfl4ikobFdX7RFCJq1uBUZO3fQYr
         oqhxtH/ke6XBOtZWTvZlqgOBa6Qvnm88la/ypp1qRPVw3xJ5CxZlg4YyEeFy5NIyKliN
         t7z8t4pKWK4gEF/psrivFlZWnZOVTXSp1+HQLOMVlBnCyiwQrYHjsY6+e7HKNpQ+mUOL
         gG5zBWUiTzzZ6WZMn+4j9jCxzI/jfqrutdN9gPPs5be9F8NfdvPXbgt0hni9kwwuaZMm
         lWrg==
X-Gm-Message-State: AOJu0Yx55S2w/4JRzBRrCl4Oqhq+rTAgPZOqk9cfJxnxDMeEh+lQ8gBe
	XpLlZIn8LBw2v3cvj9Y0aO0myUupMJV291kz5r6XD45zRBWiXpUs8WlO5GHz7wZVocZIlg==
X-Gm-Gg: AR+sD11ITM/bPH60+YOqKE/ncpQEjyy5zZ5Br7lyCGs20Ts1q2RU05m7Vhze5ihBkZF
	ppX/FBdCVn8jb6qWTunF3RWoC1tLFcsnYyvKKlmkBtTHPM8xOPPZKtbj/nwsQOQIat/7RdTe+fE
	fNOiz0dGHtqubDWd1XEwyGoqI7zruyZsjPfX9eAtSogFwjyemJu/ecBVc5oZRkfIjVu8V6rA+oY
	XVUYVew/oHs5kT9ZWbiLg/kH/Z1JBqzZtNstWl2Ai02uee7jUcYT5mnZkUfewTJ4cba+DGRpzce
	jb0PJstQWPpDz91Yyct7amU7Q203G0ikVaSGQQS9/uax0o4QxVEK9yXDj/Uj6MdypQGAf2hsz3T
	5txF6hrK1wXqVRNTVxsKRoe7AnLN+dYHNPekrICKWpBSxbFXSep+hdonId6FqbF2hDKtPxJLN/8
	xugpUR0aW+uqfLPWmNe+rIjNI/Ret0o3e/7z1cmf47Dt4XfWXnSF/WpQ+6lrAs
X-Received: by 2002:a05:6a00:2383:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-851d38eef2dmr15687220b3a.9.1787200132555;
        Wed, 19 Aug 2026 21:28:52 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3615eb0sm1221189b3a.28.2026.08.19.21.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 21:28:52 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] python3-pyopenssl: enable ptest
Date: Thu, 20 Aug 2026 04:28:51 +0000
Message-ID: <20260820042851.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 04:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243800

* Do not install pyproject.toml into ${PTEST_PATH}: it sets
  --strict-markers, which fails collection on the pytest.mark.flaky
  tests because pytest-rerunfailures is not in oe-core.
* 432 test cases pass with no failures.

[YOCTO #16391]

Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
Tested with testimage on core-image-ptest-python3-pyopenssl, qemux86-64:
432 passed, 0 failed, 0 skipped, 118s under TCG (no KVM on the build
host; the suite takes 11s natively, hence PTESTS_FAST).

 meta/conf/distro/include/ptest-packagelists.inc          | 1 +
 meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 370606ead7..ce6c0a2d76 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -86,6 +86,7 @@ PTESTS_FAST = "\
     python3-pluggy \
     python3-pefile \
     python3-pyasn1 \
+    python3-pyopenssl \
     python3-pytz \
     python3-pyyaml \
     python3-rpds-py \
diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb
index 6246375afc..0aa1e8991e 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb
@@ -7,7 +7,7 @@ DEPENDS += "openssl python3-cryptography"
 
 SRC_URI[sha256sum] = "28dfcce0162b9211413e26dfbfdf1d24317fbeba18fc93c12400a1856b2a0bc7"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest-python-pytest
 
 PACKAGES =+ "${PN}-tests"
 FILES:${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
@@ -18,6 +18,13 @@ RDEPENDS:${PN}:class-target = " \
 "
 RDEPENDS:${PN}-tests = "${PN}"
 
+RDEPENDS:${PN}-ptest += " \
+    python3-datetime \
+    python3-io \
+    python3-netclient \
+    python3-pretend \
+"
+
 CVE_PRODUCT = "jean-paul_calderone:pyopenssl pyca:pyopenssl pyopenssl:pyopenssl pyopenssl_project:pyopenssl"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


