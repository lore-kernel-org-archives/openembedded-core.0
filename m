Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3B83E60F7F
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:26 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id ep11so3087194pjb.2
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gY/KiucLnqkw87sARp6UR2SkwdTbu9NVXpUVzEcLZn8=;
	b=bj3h9nMhoM0shmqC+4zFHsj6ppuieEgo7gWTznCqs08Z83d756gwPHoCgSZjW6WsbA
	iM6mP0Q1H961LbdpHLHS4crYgjF9WlfRPYJmMLuMqRf0g3yrdLbsBxZjHDu3jC/Ha+fL
	AWqNOWL76wiRjSvtQITuFGy0dCsUOl1vKPHhK+51TTBdXJ7LwxZPO5p3azG+4qGv75z8
	3jAuTC2q7BKs9dSqbzjYBz91yYEQL3jYC1pZ93qwtvhdXYYm5BciykHl4BfXuJItkMSA
	rCFflZmlD61iiFaflu+SW6FXeTdC0lVjZvB2+aiM9LvFjo0+qJgtailwwQbIGQGcRjxy
	3Wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gY/KiucLnqkw87sARp6UR2SkwdTbu9NVXpUVzEcLZn8=;
	b=savwc36mUcISKdwPPiM83v4bCX9SUjgPwuaAisg7ZKrqa6rSInKG4lTJsJzV6ZUGGr
	tUYgfsPk78x2cay7k8JB+d8XqXv7XxIzipnLgweFxLLPYO3PIcR8qkrHkVep5TBi+8R3
	gCFkrDu7pNYQ0nikTMC6EcVtSAsJwpAytNhlErf9lX33X9gED4t73xdiPGqzdVGArTFr
	nnkEuRfufk78uGiW5HZAAkPQVWC+MJBX4V+szaD5R7jwL5mLYs7dIAQ1mo1z7nrJXIN2
	QKsfC4SXZ0E1aFtEmmzC3kEHIbhBsFKEr+3ur2R5NO2jXcTMGeZisgyPmnI+IS88S62i
	3ctQ==
X-Gm-Message-State: APjAAAVg8mFNQe+iiAS53VJ7G9eQG97ETwwSYQrI8lQuXPktLyorBQE3
	J2KDHziqrgeypy1OEYsk+2oAw9dS
X-Google-Smtp-Source: APXvYqz5jJNBfo6Neq5bQ+J3JWRKOhCUAuGdmsfvfk9t1zpz68qpvKhDDBKHUjLo1TjDTmvcVnxQjg==
X-Received: by 2002:a17:902:b110:: with SMTP id
	q16mr8541595plr.289.1581264627242; 
	Sun, 09 Feb 2020 08:10:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.26
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:57 -0800
Message-Id: <a2084ad4d244715acced026cdaf6855bd8f6f385.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 29/29] ncurses: Fix reproducibility issue
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:26 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The build was deciding whether to rename manpages based upon the presence of
/etc/debian_version. Be explicit about the configuration instead and
ensure determinism.

[YOCTO #13781]

(From OE-Core rev: 09c8a28893e7ca94a44232d802e1cb02a8f34b87)

(From OE-Core rev: 3d114c08c32578426646f5d97769d2c66fea06cb)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 5f2cc35823..b7bf4c0d81 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -87,6 +87,7 @@ ncurses_configure() {
 	        --disable-rpath-hack \
 		${EXCONFIG_ARGS} \
 	        --with-manpage-format=normal \
+	        --without-manpage-renames \
 	        --disable-stripping \
 	        "$@" || return 1
 	cd ..
-- 
2.17.1


