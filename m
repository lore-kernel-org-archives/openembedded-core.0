Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC7760D49
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 00:00:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k11so524777wrd.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 16:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B98fEWRa2dfYnwkghJaQaF1c40Ee7zJMPAQHICvaTZI=;
	b=ZELxeuYNYGUxL7BVQuvZCrlENG87iKDoNvL0bcxMOkoDamOnvUPFblYVEnejHKDclD
	hOL+Db9sgI0zfm0VaXny00fNbg/jFwbbaUpQ2so/IYPMhS0draCSo/Mqcjf8uLc+CksU
	PdDKVRpSetEL8bE/TIO5o2/AagPz6nUwC3+KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B98fEWRa2dfYnwkghJaQaF1c40Ee7zJMPAQHICvaTZI=;
	b=SUjoTsfKn7R4wiyGIi7cfsmyLR75mKhcMo96qSoJ6kMkEy8bcb2LiMUyGZQYW7plkR
	Oegp6tyPYJPbvYe8VsXosU+ha0uMkxJIFnRIuVbEE+fmu68pd6QcHE6EBgoxk8yQiW53
	FGtOPJdwqOJl5GS9IoXFpefJ3CYDtxDe3cm5/nGoL3bEF1dEdmMOSM3RUmqdzU50rtCQ
	jOnbyibPqAUFeelbT9FO3n4wnb8au0SVwfH2Amuc5ROBpWhhwHUTZskhXz6NK4jDultb
	mXWpwXWwe09umDkXrMXzBWTYoq7FZ2H+iGUMg6mPQddHttPNIvU01PZd7kRrP9Yfew+U
	K/tA==
X-Gm-Message-State: APjAAAVt98dk+Byho/cZ+oI0ErAcNHuCO3Q5GF5Q51qH8gxW4PGEjbAC
	6WPUbXYv4aAFMFK/dlodc6nuDns5tKk=
X-Google-Smtp-Source: APXvYqw8sUh9F0RkcrjvAPIhtDkxjobjYr4xZaEHi8KuXggNMgyB3QcDfguGDdFikiQr+mJpnzDn+g==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr555713wrt.241.1581033645361;
	Thu, 06 Feb 2020 16:00:45 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d13sm1115398wrc.3.2020.02.06.16.00.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 16:00:43 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 00:00:39 +0000
Message-Id: <20200207000041.19304-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] iputils: Fix build determinism
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Feb 2020 00:00:45 -0000
Content-Transfer-Encoding: 8bit

The suid/setcap code depends on whether setcap is on the host system or not
with suid as a fallback. Disable this functionality to be deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/iputils/iputils_s20190709.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index a672ccdb7c0..e0d2ae160ee 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -34,7 +34,8 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson update-alternatives
 
-EXTRA_OEMESON += "--prefix=${root_prefix}/"
+# Have to disable setcap/suid as its not deterministic
+EXTRA_OEMESON += "--prefix=${root_prefix}/ -DNO_SETCAP_OR_SUID=true"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.20.1


