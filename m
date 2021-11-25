Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A375C433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 10:49:22 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.10545.1637837360975018209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SOrG2uO6;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: flowergom@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id v19so4241942plo.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AcEtgnDKlt8kE9u2Q64zH1A0Shlb1S3Sd+qpOxrcowY=;
        b=SOrG2uO6u0H8i4t6C+f//DmEKgr4byHKyI+aA8OdmpTziDRE593CdzS01jUfURuOx+
         0L+0ymj82HO1t2l4eOiMn38Tc2y+NPGDE4IFm4Ua50fEiFQVwSZOVj6Js3B/Mi8UtmLE
         7+YgSEe2bqH8yqhbVYfWGp+XrlF3L4WReT3ROzWvRdEBw10kEmFzFONhQ/OAqZuGJGWe
         AY20baJlxN2hfg4hpMFraR3pMIgrBE+diMO9HFEDCff3rUSDY/YQRjgDJ6xPI//BvD1i
         sd125Mvxa/7UBSy0+QJj0le1OQyJnXwecaWlkPaEgDpKFajXHdw045ryEtOJksitpl05
         SdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AcEtgnDKlt8kE9u2Q64zH1A0Shlb1S3Sd+qpOxrcowY=;
        b=7C+Lhp2SILboAfb5Bta7xSc/8VoIlCOqtWHgQlCRmzTyD2DCdtnuhReZ+KfY1HmesW
         D24sMrVTgfcfk1MsjHxpn7Lf+xLOlWlo2xloen1F2ngbPpPVSfXpbs7NvzWX1fEt0t15
         Ins4gMnAR98KJL4qmT0DgMSVXpCkyESs8Q6xQ6XfnyAiEBwoz8jWjjUTWEBp1+wV6U9v
         uFViW8Sk69AqzI1jGMBkpiLlTvkW0E2P5+XUaytPDlfDuUVlU855eMGMRitFI0iFCPdd
         el2iMTuegbs2FopehIUbO93gZIsOj4YDNgH/zmceVYZKvzaNcqdatgVMNbRBV/XoYuo6
         1a8w==
X-Gm-Message-State: AOAM5308gqvcBDo9bcTep7BR59BDRmFBrYAxXt3wFzOIYRtvi6+QvXkN
	jm7gwJC+U6jnLj+F1Pm9/PU2fk43jKdcskoGIA8=
X-Google-Smtp-Source: 
 ABdhPJydSUsC1rlA4Bo4KK0zohBNveyARL3DKz3ayXoFX8odioygWxyIHyACNPDtPNs/N2EV5Mq7vQ==
X-Received: by 2002:a17:90a:72c4:: with SMTP id
 l4mr5751400pjk.149.1637837359867;
        Thu, 25 Nov 2021 02:49:19 -0800 (PST)
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id
 w1sm2822710pfg.11.2021.11.25.02.49.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Nov 2021 02:49:19 -0800 (PST)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH v2] git: fix CVE-2021-40330
Date: Thu, 25 Nov 2021 19:49:12 +0900
Message-Id: <20211125104912.1704-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 10:49:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158777

git_connect_git in connect.c in Git before 2.30.1 allows a repository path to contain a newline character,
which may result in unexpected cross-protocol requests,
as demonstrated by the git://localhost:1234/%0d%0a%0d%0aGET%20/%20HTTP/1.1 substring.

Upstream-Status: Backport [https://github.com/git/git/commit/a02ea577174ab8ed18f847cf1693f213e0b9c473]
CVE: CVE-2021-40330
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


