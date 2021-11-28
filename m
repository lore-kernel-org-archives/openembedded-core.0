Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B50C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:58:50 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.53354.1638136730447556960
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rJH9Pfkg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 71so13870330pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bBuqo/40pwVGy9y7mBFDbCHZ6icZyLiKDb87F208rbs=;
        b=rJH9Pfkgr1l/Ko+FDlcF1WbCA5lIFpvXl1Q0OEoZjNyH58d43kHL2wCEoaIw9sO9ZG
         6O1bA6W3YVCnTHuKgMzCCq92WI5YIIwYa6StjqRcXMuaGx97e+/dzBAzD/N6rdb+Uf6I
         zumOVvd9oRwoxlimxkJ6U0Cq5M1GKLr+Vx9Rl77LFIAnTuq/X/qvvtmZzQprxw5WSfF8
         3NlflRCRL5isAIWFJUnZShiXSddY4qLQu6CElsK7cnroY8PmlX/3cc2pcvbteI4tS6JK
         qwVo2iqxhoM/lPIS0bCJ2yxS46czeOvVpjg5/QY9siTun6zUtLgiBj9FZKqeIEUlTrIl
         +1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bBuqo/40pwVGy9y7mBFDbCHZ6icZyLiKDb87F208rbs=;
        b=h5Skg1zBtiahAjOBEMAeYypO3d+jI7beH54BCOIh1rN8eOha+v/G3c8zKBcknOq5Mw
         1jBfQITjWlSmkHsOdA2+cptxlrnoMgE1AMusiUHwTpLS95VDJ8e6HweTPUi4KmNEe0Mc
         yNE47BcNPI/uN97mwW+oYZBvsZQxbOd2caW+dxtY0H9g9vkTZt7KmSmjSdckmoRohZOH
         SbzWSu1Xy8puph6Lc5qWj6MmSVG4uV5gRJtkJZTSsfHfnM1qnQl5/hK/DrVfuYpFIV3f
         YmHUzu6sUxK5FvqYjLffDM/LEd9jSlWQoLbFAflq7rKmSD/07LrX9telHQobjkZfx4D+
         iOiw==
X-Gm-Message-State: AOAM533MFjfMtNfkGmVwdQhvCczYBgWeBeRkfsIpO2fovv8IYkFEwNh1
	SZWiDtWGUl2IqQ+8NYpCzIT5sF3BG2fdhCeG54I=
X-Google-Smtp-Source: 
 ABdhPJyUE4xuimUE/KRDHD3stxH94xQBH8ULiilCQ0dJ6iQ+DUypB9orSyNxnk0ZqTwqrkZsunOQsQ==
X-Received: by 2002:a63:6687:: with SMTP id
 a129mr23970911pgc.477.1638136729221;
        Sun, 28 Nov 2021 13:58:49 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/42] git: fix CVE-2021-40330
Date: Sun, 28 Nov 2021 11:57:24 -1000
Message-Id: 
 <ea0d7ef4a8c9bba94bd603ebd19e502faa86293b.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:58:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158894

From: Minjae Kim <flowergom@gmail.com>

git_connect_git in connect.c in Git before 2.30.1 allows a repository path to contain a newline character,
which may result in unexpected cross-protocol requests,
as demonstrated by the git://localhost:1234/%0d%0a%0d%0aGET%20/%20HTTP/1.1 substring.

Upstream-Status: Backport [https://github.com/git/git/commit/a02ea577174ab8ed18f847cf1693f213e0b9c473]
CVE: CVE-2021-40330
Signed-off-by: Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../git/files/CVE-2021-40330.patch            | 108 ++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |   4 +-
 2 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2021-40330.patch

diff --git a/meta/recipes-devtools/git/files/CVE-2021-40330.patch b/meta/recipes-devtools/git/files/CVE-2021-40330.patch
new file mode 100644
index 0000000000..725f98f0b7
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2021-40330.patch
@@ -0,0 +1,108 @@
+From e77ca0c7d577408878d2b3e8c7336e6119cb3931 Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Thu, 25 Nov 2021 06:36:26 +0000
+Subject: [PATCH] git_connect_git(): forbid newlines in host and path
+
+When we connect to a git:// server, we send an initial request that
+looks something like:
+
+  002dgit-upload-pack repo.git\0host=example.com
+
+If the repo path contains a newline, then it's included literally, and
+we get:
+
+  002egit-upload-pack repo
+  .git\0host=example.com
+
+This works fine if you really do have a newline in your repository name;
+the server side uses the pktline framing to parse the string, not
+newlines. However, there are many _other_ protocols in the wild that do
+parse on newlines, such as HTTP. So a carefully constructed git:// URL
+can actually turn into a valid HTTP request. For example:
+
+  git://localhost:1234/%0d%0a%0d%0aGET%20/%20HTTP/1.1 %0d%0aHost:localhost%0d%0a%0d%0a
+
+becomes:
+
+  0050git-upload-pack /
+  GET / HTTP/1.1
+  Host:localhost
+
+  host=localhost:1234
+
+on the wire. Again, this isn't a problem for a real Git server, but it
+does mean that feeding a malicious URL to Git (e.g., through a
+submodule) can cause it to make unexpected cross-protocol requests.
+Since repository names with newlines are presumably quite rare (and
+indeed, we already disallow them in git-over-http), let's just disallow
+them over this protocol.
+
+Hostnames could likewise inject a newline, but this is unlikely a
+problem in practice; we'd try resolving the hostname with a newline in
+it, which wouldn't work. Still, it doesn't hurt to err on the side of
+caution there, since we would not expect them to work in the first
+place.
+
+The ssh and local code paths are unaffected by this patch. In both cases
+we're trying to run upload-pack via a shell, and will quote the newline
+so that it makes it intact. An attacker can point an ssh url at an
+arbitrary port, of course, but unless there's an actual ssh server
+there, we'd never get as far as sending our shell command anyway.  We
+_could_ similarly restrict newlines in those protocols out of caution,
+but there seems little benefit to doing so.
+
+The new test here is run alongside the git-daemon tests, which cover the
+same protocol, but it shouldn't actually contact the daemon at all.  In
+theory we could make the test more robust by setting up an actual
+repository with a newline in it (so that our clone would succeed if our
+new check didn't kick in). But a repo directory with newline in it is
+likely not portable across all filesystems. Likewise, we could check
+git-daemon's log that it was not contacted at all, but we do not
+currently record the log (and anyway, it would make the test racy with
+the daemon's log write). We'll just check the client-side stderr to make
+sure we hit the expected code path.
+
+Reported-by: Harold Kim <h.kim@flatt.tech>
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backported [https://github.com/git/git/commit/a02ea577174ab8ed18f847cf1693f213e0b9c473]
+CVE: CVE-2021-40330
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ connect.c             | 2 ++
+ t/t5570-git-daemon.sh | 5 +++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/connect.c b/connect.c
+index b6451ab..929de9a 100644
+--- a/connect.c
++++ b/connect.c
+@@ -1064,6 +1064,8 @@ static struct child_process *git_connect_git(int fd[2], char *hostandport,
+ 		target_host = xstrdup(hostandport);
+ 
+ 	transport_check_allowed("git");
++	if (strchr(target_host, '\n') || strchr(path, '\n'))
++		die(_("newline is forbidden in git:// hosts and repo paths"));
+ 
+ 	/*
+ 	 * These underlying connection commands die() if they
+diff --git a/t/t5570-git-daemon.sh b/t/t5570-git-daemon.sh
+index 34487bb..79cd218 100755
+--- a/t/t5570-git-daemon.sh
++++ b/t/t5570-git-daemon.sh
+@@ -103,6 +103,11 @@ test_expect_success 'fetch notices corrupt idx' '
+ 	)
+ '
+ 
++test_expect_success 'client refuses to ask for repo with newline' '
++	test_must_fail git clone "$GIT_DAEMON_URL/repo$LF.git" dst 2>stderr &&
++	test_i18ngrep newline.is.forbidden stderr
++'
++
+ test_remote_error()
+ {
+ 	do_export=YesPlease
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 2b75bed055..a89dd42e8b 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -10,7 +10,9 @@ PROVIDES_append_class-native = " git-replacement-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
 	   file://CVE-2021-21300.patch \
-           file://fixsort.patch"
+           file://fixsort.patch \
+           file://CVE-2021-40330.patch \
+           "
 
 S = "${WORKDIR}/git-${PV}"
 
-- 
2.25.1


