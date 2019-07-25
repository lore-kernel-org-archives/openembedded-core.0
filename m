Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9BCD86C0E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 22:02:57 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id x1so2371458wrr.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 15:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AmpS4Hk+t9nIWaETKsRbQ2ULcW933T6MrJuGaph0wAs=;
	b=JuacCuNhYe5enELKaPnzssA6CRCBPpSWPdJcRL7vF6AXWmZQpvz9A5ReypnWu7qHlL
	TXVU1nWgbJYbdP8f+d/Vzutnzqb5BfkweMS2Vix26/vYLy1mppzkoIDyMdPQVKWGEpHb
	xwh2xE7t+XmtLRbMmjnptVgwq7cnM8jqSeRL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AmpS4Hk+t9nIWaETKsRbQ2ULcW933T6MrJuGaph0wAs=;
	b=VmdZwnuQbqDk54vuqPl4tUyZtipeE8dhvRG6vqIO/v7onrwjqajtMDMsi976zrN6qI
	H16B/EY0yb64krQ1RDf1lxHCXUsDd3u8fiRC/RC9nTwp46D9UMhFKKGmSNkPoardnmnx
	fLRsaWtcu233GSWq6UlOGJCk3veiNeQF+EMAuNezTFXLTHoRMNcC0KpwLL14LL6jxnXg
	f0E8FPVqTowovEas1zB+QCKurlgkXmah+8ySIrYKpbeB0tOAC69jfFzAd+cj2PWyvC5t
	DVGPrwoVcsK8jYUElbFAjWvt4ySPKPSDAUMGb/TCRILDKT3o41GfxDbdqwM4hyIn0v0y
	i0cg==
X-Gm-Message-State: APjAAAU+gjoJU2m3hfchqfQ4FOPy6E7pS71T9KlpY/hI+e0dt4GzRKmG
	JNAHSH+y7buDVQpWkIGU2zXzIaxCnY8=
X-Google-Smtp-Source: APXvYqyE0jwWn1WtyY6O90VrrTVBhb6phT/m7tx41kQdTPs98b82gbZLZA0G4Gy4CwQETI7Q+5KQkA==
X-Received: by 2002:a5d:4085:: with SMTP id o5mr95435001wrp.101.1564092178020; 
	Thu, 25 Jul 2019 15:02:58 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s25sm37212282wmc.21.2019.07.25.15.02.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 25 Jul 2019 15:02:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 23:02:56 +0100
Message-Id: <20190725220256.2167-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] package: Improve determinism
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
X-List-Received-Date: Thu, 25 Jul 2019 22:02:57 -0000
Content-Transfer-Encoding: 8bit

Its possible in cases with multiple shlib providers we were not being
deterministic. Add in a couple of sorted() calls to fix the shlibs and
pkgconfig cases with this potential issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 2 +-
 meta/lib/oe/package.py       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8b89fb11290..e67bb5bd97d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1924,7 +1924,7 @@ python package_do_pkgconfig () {
     for dir in reversed(shlibs_dirs):
         if not os.path.exists(dir):
             continue
-        for file in os.listdir(dir):
+        for file in sorted(os.listdir(dir)):
             m = re.match(r'^(.*)\.pclist$', file)
             if m:
                 pkg = m.group(1)
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index b59513227ba..b8585d4253f 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -265,7 +265,7 @@ def read_shlib_providers(d):
         bb.debug(2, "Reading shlib providers in %s" % (dir))
         if not os.path.exists(dir):
             continue
-        for file in os.listdir(dir):
+        for file in sorted(os.listdir(dir)):
             m = list_re.match(file)
             if m:
                 dep_pkg = m.group(1)
-- 
2.20.1


