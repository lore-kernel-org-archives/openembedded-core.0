Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id EDB2A780A3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 16:25:27 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id b9so1473837wra.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 09:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nA90BMkkLZS/43ximlCwiqwsiEKtaa+kkBnnZaG/4RU=;
	b=XqFmkfCm4EAJQkv6c8mQmimf5F0zBJ+Fq4VvkublUSxNegaevqrPmAHkXeEV3VFS8K
	Y9L/IEPBnt4QmAIchmcVFBv6/NqLIT35FTk/PjwPxFo8WhuWNUm8o3AhQfr+CXaag9gE
	nMlEixEUu7SBmprmnswdFUnFmw2nHLQJxt+rzfIFrfSocN2o0KVahD1veiY7D6OswfW2
	CIXTllJhJSXJwbD5OQwqYDFqgKYe9NhEhWhuMdv2L5fLtkaxjmuP3GNfwV38uyb4XdRH
	uVggQYZuWRhuTFN14mf0D027kD3c8fYt4gQRMdci7R1f3wSwUxy7DmV8+uBNquqeqaWi
	CfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nA90BMkkLZS/43ximlCwiqwsiEKtaa+kkBnnZaG/4RU=;
	b=Jvc19BH3KSG3/tGqrcPB9bmyoaeNRBXSxJV8TRKR9lFyVteGB4ra/BxEM+BzX7mP53
	heP/XQdIr50RlypqQv7Wck8v/H8G93gSzpe9o5WcXXccuYh4N7V3UsRIPLUc5x7XPHk5
	CdwL7IZirLkTtIY/PlqZ2FRb1x1jOHVVdCDdTnfkMaI8SkHnO4KZJ2s1Wk3erQJ/4sDK
	4C9C84dfFmY2pMZzLSEAZXN1x9/m177pOs7EnI8WAHiiOYe8/8sGGp6NVyujPDCzWMDJ
	V03r7sKYTapqBo37XiQ9xKg00AkUVnSWUmBV8FniqR9kMDZ9LoxfmI0yp1dPfafOZZpy
	a6fQ==
X-Gm-Message-State: AHPjjUgWjxB8UUSgVYL/GfIKCNuh+twwdUVjVvUKAPggoydTWr/aM/3h
	l5h7IyXFb2WE1I8Q
X-Google-Smtp-Source: ADKCNb54bxhIYEuCnVfpEh4DM/TEzryE3AGc/R8VmcusIyCTcMTIyOIESWkYdy/pLf9zl2m6WidsgA==
X-Received: by 10.223.160.46 with SMTP id k43mr2910114wrk.113.1504887928442;
	Fri, 08 Sep 2017 09:25:28 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m86sm2653474wmi.27.2017.09.08.09.25.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 09:25:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 18:27:38 +0200
Message-Id: <20170908162738.21603-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH] bitbake.conf: add bzr to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Fri, 08 Sep 2017 16:25:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it's used by bzr fetcher:
  meta/conf/bitbake.conf:FETCHCMD_bzr = "/usr/bin/env bzr"
  and when it isn't available in PATH do_fetch tasks fail with:
  /usr/bin/env: ‘bzr’: No such file or directory
* it was also added in:
  https://patchwork.openembedded.org/patch/140107/
  but this change wasn't merged (nor rejected AFAIS)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8ce08340d7..444c53f677 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -483,6 +483,9 @@ HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
 
+# Used by bzr fetcher
+HOSTTOOLS_NONFATAL += "bzr"
+
 CCACHE ??= ""
 # ccache < 3.1.10 will create CCACHE_DIR on startup even if disabled, and
 # autogen sets HOME=/dev/null so in certain situations builds can fail.
-- 
2.14.1


