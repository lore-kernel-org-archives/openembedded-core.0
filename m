Return-Path: <avery.brian@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 557AF77983
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 17:31:01 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 79so7737774pgf.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 10:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XOXYJC1fhKo+kzvQst1czofvJEOkbfwudLBy/vsE2hA=;
	b=S2ZZRUySYD0WhDU7wdMHzDXu06muPOMibKegIaRAIjEGAXyp++sHAk4tp1OUN5HnWK
	7bwR61M8kyhYLDv7qi3NKtVA9WT3JX4XP2NZrE6MEmVlacrcQJ6T4/msWsL4cw+AuBUh
	NiV4ujeqljkfoH3tfzf40rY5Ze0TBTYxa5/aVRht7RuvDZQPU+pe8LkuKa/DUE4NpqE4
	s5zmA2rmwoZCr1X01GHDTLvO7Lv7UaxL6KGaQuUhTcsWKPzXIMm0d+mv4JgwmTS2ySv6
	4vJlDYY6+5ShFfS3d70lautS7MK3kCn4t/M1r64rQSAx+ZAueqBGG7bQY9Xto3Z93tGQ
	1IpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XOXYJC1fhKo+kzvQst1czofvJEOkbfwudLBy/vsE2hA=;
	b=UoudfeCKXvLQySPLJnDIC8xMLmWlSl2fzv5OhOu5v7TY1Fi/ik0tZh+sA9Ao2pyLAC
	eiXTcKwpD8U9b7Bok4qs6O5Ypf14bMbIq15+rUnZc9WnhL6PmuDIoZqtGROXDUj8nTGa
	jv9t8KxoFCA3qZgLqmAB2V0Vc054zlPC6UGRtRONNozFX3iC+OqBYBkcjb6StMADz08t
	XE8wfM6paEKRtBSgT+T6gFoevZQ1SmjSl0HpEmrwt9vSBvVtMASxmb/JstGr0Tz1kyso
	sK+8oaOhKNfHeGm1hTsy1ykXV5QFjGuEgFVQGM45I7wkeGjuAeIoFyddAH+6KAKjbw0z
	ztYw==
X-Gm-Message-State: AFeK/H3UUbHKsmIA9WmeOPB9bT0XuzZaO1/WrIV4e5+6pmR5B8LHC40TgHW1cg03ebM6yQ==
X-Received: by 10.84.214.22 with SMTP id h22mr803058pli.65.1489944663523;
	Sun, 19 Mar 2017 10:31:03 -0700 (PDT)
Received: from whisper.hsd1.or.comcast.net
	(c-98-232-142-195.hsd1.or.comcast.net. [98.232.142.195])
	by smtp.gmail.com with ESMTPSA id
	g85sm28230647pfd.89.2017.03.19.10.31.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Mar 2017 10:31:02 -0700 (PDT)
From: brian avery <avery.brian@gmail.com>
X-Google-Original-From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Mar 2017 10:32:40 -0700
Message-Id: <87cadaf74138965f72d0943a39cd266ba942b69c.1489944653.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1489944653.git.brian.avery@intel.com>
References: <cover.1489944653.git.brian.avery@intel.com>
Subject: [PATCH V3 1/1] gen-lockedsig-cache: catch os.link error
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
X-List-Received-Date: Sun, 19 Mar 2017 17:31:02 -0000

We do a hard link to speed up sdk creation but if your sstate-cache is
across a file system boundary, this tries and fails. This patch catches
that error and does a copy instead.

Signed-off-by: brian avery <brian.avery@intel.com>
---
 scripts/gen-lockedsig-cache | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index 49de74ed..6765891 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -62,7 +62,11 @@ for f in files:
         os.remove(dst)
     if (os.stat(src).st_dev == os.stat(destdir).st_dev):
         print('linking')
-        os.link(src, dst)
+        try:
+            os.link(src, dst)
+        except OSError as e:
+            print('hard linking failed, copying')
+            shutil.copyfile(src, dst)
     else:
         print('copying')
         shutil.copyfile(src, dst)
-- 
1.9.1


