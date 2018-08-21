Return-Path: <rv@rasmusvillemoes.dk>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id BFD607900C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 10:01:47 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id q127-v6so13841169ljq.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rasmusvillemoes.dk; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=+mEoPPVLQ6RLDr/1lIhntBY0cXO1xXgMuotzVp1Hn94=;
	b=Bj7CltqMH8keaCv7Dd+hUNdqiCj+60EjQ4nuGNC4LYb27TWCDo2LnCaxjJY/O+9AFl
	tPhgcTzV+NIgkKruu9k9OgSODeGYBOYzUm3ExQujChCk13plZpL5C9vydB8JV2sOge84
	UTPlzXEzFico8oW4tCmD4HWHNoDKP5xqTLNXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+mEoPPVLQ6RLDr/1lIhntBY0cXO1xXgMuotzVp1Hn94=;
	b=B5jWG6xS/8SCXjpKjhFhgFR5RcjU1Nj6lx8RCHVkrFRw5a3CY+37LkI4XH/vH/5NFU
	lxHkkZeDM9ys5nHP2PEwTRRXj+3Upg+6QAjHwuWzSIYMvPztEWkNxchFUTHTdqrIa6Xf
	JBSz/Mjz6ir2upaf325v3GyVh4qHdFRpJXsr2idVpmp2U0doBuvCTRwsFUzoh2+KVgTh
	3dSKkGYltT7vvJplUXEnef3qgZke1CVXD3eEKsSk24D2ZQ3Fuct3QNE65pSCHfU24DUl
	kFAvpRBQndvHOPsLiKcpP7CyP4ujjH59xR2hceSiXOgwInW/5fQ8cwMN9FBkciKpx1zy
	XZig==
X-Gm-Message-State: APzg51C3F5mg4hILwbOBjLYw/i8GuK8gRUNK0Hn6jC578kUz3lQpjHYf
	gfcNASDkty6egbaoQv3ODeUhYO5UC5a5Dw==
X-Google-Smtp-Source: ANB0VdYkD3QCVdpULIH9ULWRmC80he73WjjH5+EoulpRtmRt7CE84HNsYsxhM+CpJZ9EwzXzhFvJrw==
X-Received: by 2002:a2e:1d46:: with SMTP id
	d67-v6mr2329582ljd.41.1534845708066; 
	Tue, 21 Aug 2018 03:01:48 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm2037104ljh.26.2018.08.21.03.01.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Aug 2018 03:01:47 -0700 (PDT)
From: Rasmus Villemoes <rv@rasmusvillemoes.dk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 12:01:44 +0200
Message-Id: <20180821100145.12696-1-rv@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.16.4
Subject: [PATCH 1/2] package.bbclass: use bb.utils.break_hardlinks helper
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
X-List-Received-Date: Tue, 21 Aug 2018 10:01:48 -0000

This does the same thing, but is more efficient in case st_nlinks
is (already) 1.

Depends on bitbake commit 7ae93cf40ab91965147055100432961436bce46c .

Signed-off-by: Rasmus Villemoes <rv@rasmusvillemoes.dk>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4ce9de2f57..8dca3b0191 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1029,7 +1029,7 @@ python split_and_strip_files () {
                 else:
                     inodes[file_reference] = [file]
                     # break hardlink
-                    bb.utils.copyfile(file, file)
+                    bb.utils.break_hardlinks(file)
                     elffiles[file] = elf_file
                 # Modified the file so clear the cache
                 cpath.updatecache(file)
-- 
2.16.4


