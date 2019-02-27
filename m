Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 84F9F7CB20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 17:47:49 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id x7so6689854wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 09:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d/F6gi5jNFxNLnEjj+N25CQ1/unmQXR5Luphxi46OWQ=;
	b=KzYQxdAgoLtv3MLNMKVsauJ77Zoaif9AhPcYUwgy22u9taDOkkcut9hK8l1fFC81+G
	NZaxqY++kWCm5dpoCEbpPDHZWHs5AgukrdFfHgDiPl6kQ7lIqGhoI/jpL52G7XyFRtII
	r2FN7q2O/Lqjav5PoHWso6ZZzJxOza/ZAo+YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d/F6gi5jNFxNLnEjj+N25CQ1/unmQXR5Luphxi46OWQ=;
	b=jaDFX80eTn36ikyIfbIdmS9BexiHRxS99nj/9lQpmd2WdkI/28auiK2WcZp+4wyyyn
	SDZW0oXZERyNfklGUS+OYPlQ4iN8iBfY8d/GEdMeOv5no4TPqEaFkTV3YmonodqOQgDM
	mdMzeS5fypBRr6WmxDC6Cdz9peo4bF7ywkygJLBzC2Ouncw8kg/74+seb7HhCgcViBta
	CGeol46mXTDZMfthyv+qEE4/qAeM/5dg2z29qDGgj+NPMwDpyeHd6ahhO6VeBPaHLJqd
	5tMkQeIc8dk82By55/4uUBtsBIQtITeE13MeKa1HVHE+zo8GNF3uIkEvxifkBEol3oBV
	iZiA==
X-Gm-Message-State: AHQUAubVolxHKWu9+Vz38DoDFA4ltY2HziMuc+dEYlti9n9ndB9uRRzt
	LXJnqAvtHthIzTtfo8YxaFYhie6kcLI=
X-Google-Smtp-Source: APXvYqxjtrQEGM+WKLWe+MTrfOYJKQoNLVbZzB0RViLdVNcTpb5mf7wkUEpzs65MxrSmCSOrMvnqOw==
X-Received: by 2002:a1c:7ec4:: with SMTP id z187mr274975wmc.43.1551289669788; 
	Wed, 27 Feb 2019 09:47:49 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l10sm28754659wrx.45.2019.02.27.09.47.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 09:47:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 17:47:42 +0000
Message-Id: <20190227174746.21127-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] openssl: Fix ptest test output translation
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
X-List-Received-Date: Wed, 27 Feb 2019 17:47:49 -0000
Content-Transfer-Encoding: 8bit

openssl-ptest was recording now results, despite most tests passing. Fix
so that the successes/skips/failures are reported correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
index 0a620dea74a..3fb22471f8c 100644
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -9,4 +9,4 @@ export TOP=.
 # OPENSSL_ENGINES is relative from the test binaries
 export OPENSSL_ENGINES=../engines
 
-perl ./test/run_tests.pl $*
+perl ./test/run_tests.pl $* | perl -0pe 's#(.*) \.*.ok#PASS: \1#g; s#(.*) \.*.skipped: (.*)#SKIP: \1 (\2)#g; s#(.*) \.*.\nDubious#FAIL: \1#;'
-- 
2.20.1


