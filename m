Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF4779CB1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 15:58:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u1-v6so10125399wrn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2018 07:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=tl9fi8KvqMkhYQi2fcfUyLO2OCJF97h2xPRGLqFfb6c=;
	b=hzmG1NDBUrwa38LPxvt6XR/0adxw57VL9byU1TWp/PeUCsJTTfJ7yyOWD2fiTwD20p
	fngWjIDgdCZvJrOtdapLRQvJMHxHQxvppqqt5KzpVpNAmPBFd31gQMy73tRxgngWKZ4K
	pErA8D9hZryy1z4+l76Cea03xORyNkYQzXOPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tl9fi8KvqMkhYQi2fcfUyLO2OCJF97h2xPRGLqFfb6c=;
	b=ambAZdN0HjE1wSvKxivWafeNxEflOEtx0Boz0w0lppD2eMIGqJN+OtuQ1QjE3Ne+VO
	si+mBdEk+ccXbfFXxpYz8QLKdq3QagvZ5X7bk6/tyAhO2+wes69kVPw/6hJX9XOTezVE
	Bs57QsXfavMhkVWr2RDD+pSxh4DzqciUVIV5jOD1bdAQb3jpA+AJbry9urTg2Lccry5X
	/L8M+aupXq9gKPWHP6hNz3CHu9wUsaK+s8ZTVHnuex4FXXF/WdTkcDJVyxMBwKR+jOQc
	z7dXGZ8r2yNvKGh7Eehq141cI3qbVel7lraQn7MkXdB31yBO34zJ74w2rINcTobpOi+6
	2Raw==
X-Gm-Message-State: AGRZ1gIi89rNTy09sAuNjxBYAZT5grwl3q7TmfnJbprLVw3+sYx6sP5f
	dh63qhWTL8NoFtdLMCUsp+GR7bPKXVY=
X-Google-Smtp-Source: AJdET5ei5aVhTrBuvt5BdN/fZu9EoJdGce+lQToOSg5f6fEEgL7wws4Zi8SZdL9+jSp/b2tTUoaOkg==
X-Received: by 2002:adf:9225:: with SMTP id
	34-v6mr20393342wrj.275.1541433539193; 
	Mon, 05 Nov 2018 07:58:59 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e7-v6sm14321327wra.10.2018.11.05.07.58.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 07:58:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Nov 2018 15:58:57 +0000
Message-Id: <20181105155857.8315-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oeqa/selftest: Add test for Yocto source mirror functionality/completeness
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
X-List-Received-Date: Mon, 05 Nov 2018 15:58:59 -0000

We've had a number of occasions where the Yocto Project source mirrors have not
been complete or functioning correctly. This adds a test so that if this happens
we find out out it sooner.

It also only works over http meaning we should be able to test that anyone behind
an http only proxy (no git protocol) also has functional fetches for OE-Core and
layers built by the core of the project.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index e60e32dadf4..c28664cbfc0 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -178,3 +178,26 @@ class ToolchainOptions(OESelftestTestCase):
 
         bitbake('gcc-runtime libgfortran')
 
+class SourceMirroring(OESelftestTestCase):
+    # Can we download everything from the Yocto Sources Mirror over http only
+    def test_Yocto_source_mirror(self):
+        self.write_config("""
+BB_ALLOWED_NETWORKS = "downloads.yoctoproject.org"
+MIRRORS = ""
+DL_DIR = "${TMPDIR}/test_downloads"
+PREMIRRORS = "\\
+    bzr://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
+    cvs://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
+    git://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
+    gitsm://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \\n \\
+    hg://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \\n \\
+    osc://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
+    p4://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \\n \\
+    svn://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
+    ftp://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \\n \\
+    http://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \\n \\
+    https://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \\n"
+""")
+
+        bitbake("world --runall fetch")
+
-- 
2.17.1


