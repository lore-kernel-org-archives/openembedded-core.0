Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159EDC433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 10:47:21 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.10504.1637837240099604560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OuBHCKFL;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: flowergom@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id r130so5593563pfc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kpkiVRhlhdzXLnhJOIVbd07HgdQqK8Jx/fQzlU0hu1I=;
        b=OuBHCKFL+qoFoNJLvtdY3uRWy+AqCtuZq4haNIXANomxUisUR4/oIk43uMdFs8+lDP
         t/12cvvSEGou73PkCE//egHbsuXneKxRppt4bvI6x79BsmaZzzMfF1k6OODcKpqVxeDK
         Jj02pyQm6YFTs/frkbDij3ldWgcI35yDj1GyNPHemQs67wlC+B94wygDb4AweJb+K9V6
         V9p88JE0K8UDfrA7W2G9o+Iu9exIk0PIblbb5//yBrQLxARJHLvjKMUHKT0J8O5F/hdZ
         9ou3gyW39N5q/RFXB5N4w0TtYjcWUJmGeL2Breva3arwSK23mWaieDKoJ90sY318eECh
         DPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kpkiVRhlhdzXLnhJOIVbd07HgdQqK8Jx/fQzlU0hu1I=;
        b=e3fjTGDNEiTDIgda9JsaCYOwBmJuTDMkmN1zP2EKe4Ar+WCrg1UPvmgtionUiGI+Et
         xe3lbLr/7LNjC4DAMIbEGkjLA9zG18bW51MVcJHg4C8/kouOKykt7+VLLZoztHyydFOf
         sHIDuo8VY30t8rqcqqxM5FdVLt9oTrcJLzjzivZwgkkyy0tbOfrDwh4WBFc/h2vCsVgm
         dSL4+XutbVdTXc508qLnd7zkzlouUvKxFPeYMpYeqmZRvbIMCAIcmtS3y5teyicDTE1J
         iJCdChJdJNFiIawQ3cNb1B8tXIRAiWVZCZVuzI9tpEg6PTjXveZ09bDpFlSF9K8GJb/P
         adiA==
X-Gm-Message-State: AOAM533QmXm3N52j1Q54j0CuMNRC031Ih/tzUljSyVLyTUOCACmimZXu
	4Oz388tVASEfJTVkXCIMoLTSDJTmKBqE7MJ7AIA=
X-Google-Smtp-Source: 
 ABdhPJywtGnTnNlYbgMzMkCXQGQoj4UVl7YzxDq5Evl5Tq9HKYfu0Fw+zOyR9gPX+nmI47OdicurNg==
X-Received: by 2002:a63:6985:: with SMTP id
 e127mr15478696pgc.404.1637837238812;
        Thu, 25 Nov 2021 02:47:18 -0800 (PST)
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id
 m17sm2856100pff.19.2021.11.25.02.47.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Nov 2021 02:47:18 -0800 (PST)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] git: fix CVE-2021-40330
Date: Thu, 25 Nov 2021 19:47:07 +0900
Message-Id: <20211125104707.1592-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 10:47:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158776

git_connect_git in connect.c in Git before 2.30.1 allows a repository path to contain a newline character,
which may result in unexpected cross-protocol requests,
as demonstrated by the git://localhost:1234/%0d%0a%0d%0aGET%20/%20HTTP/1.1 substring.

Upstream-Status: Backporting [https://github.com/git/git/commit/a02ea577174ab8ed18f847cf1693f213e0b9c473]
CVE: CVE-2020-8625
Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 .../git/files/CVE-2021-40330.patch            | 108 ++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |   4 +-
 2 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2021-40330.patch

diff --git a/meta/recipes-devtools/git/files/CVE-2021-40330.patch b/meta/recipes-devtools/git/files/CVE-2021-40330.patch
new file mode 100644
index 0000000000..282cd3fbe5
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
+                target_host = xstrdup(hostandport);
+
+        transport_check_allowed("git");
++       if (strchr(target_host, '\n') || strchr(path, '\n'))
++               die(_("newline is forbidden in git:// hosts and repo paths"));
+
+        /*
+         * These underlying connection commands die() if they
+diff --git a/t/t5570-git-daemon.sh b/t/t5570-git-daemon.sh
+index 34487bb..79cd218 100755
+--- a/t/t5570-git-daemon.sh
++++ b/t/t5570-git-daemon.sh
+@@ -103,6 +103,11 @@ test_expect_success 'fetch notices corrupt idx' '
+        )
+ '
+
++test_expect_success 'client refuses to ask for repo with newline' '
++       test_must_fail git clone "$GIT_DAEMON_URL/repo$LF.git" dst 2>stderr &&
++       test_i18ngrep newline.is.forbidden stderr
++'
++
+ test_remote_error()
+ {
+        do_export=YesPlease
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
2.30.1 (Apple Git-130)


