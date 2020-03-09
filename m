Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id DE9B961B57
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 23:44:41 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id l41so615370pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 16:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o/sxVzYt4evlATZnz88pR0UHBI8DIfR3gWGMlaKaNpA=;
	b=WFI6WeAVJGXeG1vQM0Ia4j6L8MBsPiuI5UQr4WzgrAyictCwb7CkJGiMmnGIdtzhO9
	LOQd6ASFe/iP19qEcVpF9b+Fvdhfcx5T/8xXPBBWjS/9GVc1ZunWVhvME9JlJS7XNvM9
	Uzni2nWDtP31hk5NE/HooLwpWAMU0Q2y1YZfLdCTrLYJUxd/EPvVFlGFT6CvMgax7OFx
	k1OL2aHDo0TMj83u1VSrzmgY+HeE2w9Eztf3bO+8pGn5RFN6lW+3XhIiDCHRXhmrWJJv
	HbyBGL5AvVQSv9fLjaAaaS9Wybezv5ZUKgjPYtF3cTrf3nfkTvcPIBGub1CpDCfDXYZ6
	fgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o/sxVzYt4evlATZnz88pR0UHBI8DIfR3gWGMlaKaNpA=;
	b=ElYNthAMXcncGzzFP8erXyBnqAWrzx1n7PpeEBX1n5F/zlaKIUC7ZBGJigWTPj7yLG
	mesQIzTB+E6gxFgKwh/C0VLjbgpFIKc3g7WII9gCJSVSHXOM+HJIxEbAjEVdRLiZtafa
	UbgIcVq+KhzLm7oMcX2E+yWlNHPvJtEUpa9pNBf6uldHCt9g83s9AfVPnYwDZwsNYwI6
	B7Z+ZVQ+bX6jfsrscGt3gK5canrU3OBeKk4skm/nMLJ2sK47w9DRVMppcBuhqzxB8jls
	usUAqq65Zlhb/bJsXr8rPlbuR+DyH9xHFb/vyuiTOEE1cpiAgo+cNrfqhVmjtiOfrxRW
	Nxug==
X-Gm-Message-State: ANhLgQ0ZwFZ1abvCg+5z3ED5CPhQXh+hbFV4W0GCT0XDe5rkKU3HTRE0
	j0VhbN0DBr6zCyq/I/4YqS/b+5VRtKA=
X-Google-Smtp-Source: ADFU+vt7EFYHO5390zBRQI6HF6/CG5DweY9Z/hJ2v4xU2yqfgpPRKRxVJovlI5RA48NqWrfRJbmL7g==
X-Received: by 2002:a17:90a:e50d:: with SMTP id
	t13mr781075pjy.188.1583797482338; 
	Mon, 09 Mar 2020 16:44:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	s7sm44313584pgp.44.2020.03.09.16.44.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 16:44:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 16:44:53 -0700
Message-Id: <20200309234454.1387958-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH 1/2] ruby: Use arm32 for coroutines on 32bit-arm
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
X-List-Received-Date: Mon, 09 Mar 2020 23:44:42 -0000
Content-Transfer-Encoding: 8bit

in 2.7 [2] ruby enabled ucontext for coroutines on arm32 but it does not
work for musl since it uses glibc specific functions e.g.
getcontext/swapcontext/swapcontext also see [1]

This patch reverts back to using arm32 implementation for coroutines on
arm

[1] https://bugs.ruby-lang.org/issues/16455#change-83442
[2] https://github.com/ruby/ruby/commit/6c6bf9ffcbfeb8be9d9c342e7604b74ec819e88a#diff-7fccec8474e2184cd2518046bf39d54cL10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/ruby/ruby_2.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.0.bb b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
index 268b4bebd9..884bb0ef44 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
@@ -25,6 +25,8 @@ EXTRA_OECONF = "\
     --with-pkg-config=pkg-config \
 "
 
+EXTRA_OECONF_append_arm_libc-musl = " --with-coroutine=arm32"
+
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
-- 
2.25.1


