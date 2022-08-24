Return-Path: <tomi.belan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9728C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 16:51:53 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.13395.1661359905371134978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BTYjAx+5;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: tomi.belan@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id j21so29267955ejs.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=DhwRSY0YZiX5DwWrWQ3D49M/SmYbBs+MINWdnwl2/uo=;
        b=BTYjAx+56JBIP3evUSp1iT5BfnwvoPtBV1yUF3uR6LPoGJAvHWbB5AZnT0g8ze0fX1
         n0Ss1gGxH2qLQV5aGQMHmotDV8dTW39KAuclF+1mjeZ/nrSCQvfhMRmS/BUcUXEOfOz+
         vFea03C2iMF8jPLQCzb0LBwU1Xvv8Y5HiRtqw7qEdq0DNOPOPYW91wtKpczBBWifG13X
         fgPfQq0+lz6/oT/+f8Q35rAPSRqaax6FdNwqrXPzUrUETZyW15mlisWnEKF4EZotzBgL
         bvM3DkxgJkqlggWBjEEounzYpS8nM7YkmMCBbjzbPzoGs1dPe2L3HbiguXI81CxDu+ww
         vK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=DhwRSY0YZiX5DwWrWQ3D49M/SmYbBs+MINWdnwl2/uo=;
        b=EFLJkunVIYPRZUYKR3PJDejiQNfTcE0V7RKIczjnBN3PhbfrdYOBwPbFdlJLPuSNI9
         rmRQ2DgxvsCeNfKMfKeU3PVNHddVj0HgjD5RXwlxwcBjr+hFFA7CnCZwcrr7nH1YyCC0
         1BrZyYWhkk2c7d3DZafS+C3urL0VE1eyxskXsavtGQgUMsKeujlaCef35KEm4GGPUskp
         5L1oMJLMl9XUiljRyGVdQICoMaX4PofjHKTyUR046Wbth2NMb5cZf/b+eu/cRY/lzvZ3
         V/fXnH87I33rgqew2NfM/qbL6o7xN3l1QMvqht7IRXP6LYA8g43sH7qYF2p41bEtFpEd
         UofQ==
X-Gm-Message-State: ACgBeo2YpmF+xdC9FUTzSREYWAcgF7s73VpPHy0YEhT2nlnlbyAoGpFA
	6HwbHeljnHZcSElqo7/PKniLZFJbIXE=
X-Google-Smtp-Source: 
 AA6agR5zWhojVehMk+ieub8h24gqmJyXEsPbcICOtPCmLeXvIaiRgAuWyIsTnEl8r7s7i4eHKnfplw==
X-Received: by 2002:a17:907:6e8d:b0:73c:46d1:a740 with SMTP id
 sh13-20020a1709076e8d00b0073c46d1a740mr3406916ejc.398.1661359903472;
        Wed, 24 Aug 2022 09:51:43 -0700 (PDT)
Received: from smnd.sk (deuterium.smnd.sk. [193.87.13.210])
        by smtp.gmail.com with ESMTPSA id
 i8-20020a056402054800b0043bbb3535d6sm3299448edx.66.2022.08.24.09.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 09:51:43 -0700 (PDT)
From: Tomi Belan <tomi.belan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Tomi Belan <tomi.belan@gmail.com>
Subject: [pseudo][PATCH] pseudo_util: Fix resolving relative paths from "/"
Date: Wed, 24 Aug 2022 16:51:36 +0000
Message-Id: <20220824165136.11510-1-tomi.belan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 16:51:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169823

pseudo_fix_path() incorrectly assumed that 'base' never ends with a slash
because it's a canonical path. However, base can be "/" - a path which is
canonical and yet starts with a slash. This happens when pseudo_cwd is "/" or
when we're starting from a dirfd pointing to "/". The wrong result from
pseudo_fix_path() caused the database lookup to fail and made pseudo abort.

Signed-off-by: Tomi Belan <tomi.belan@gmail.com>
---
Hi. Here is my third patch for 'pseudo'. I included a test that demonstrates
the fix. Try "make test" with old and new pseudo_util.c to see the difference.
Run it with PSEUDO_DEBUG to see what happens and how it leads to an abort.

JFYI: The real fix is to check "baselen == 1". The "rootlen == 1" condition is
just for symmetry. Unlike pseudo_cwd and fd_path(), which can be "/", I think
pseudo_chroot will never be "/" because pseudo_client_chroot sets it to NULL
instead. So rootlen should never be 1. It's just to be safe.

 pseudo_util.c                   | 12 +++++++++---
 test/test-relative-from-root.sh | 14 ++++++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100755 test/test-relative-from-root.sh

diff --git a/pseudo_util.c b/pseudo_util.c
index e8e9803..64636b7 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -792,9 +792,9 @@ static char *pathbufs[PATHBUFS] = { 0 };
 static int pathbuf = 0;
 
 /* Canonicalize path.  "base", if present, is an already-canonicalized
- * path of baselen characters, presumed not to end in a /.  path is
- * the new path to be canonicalized.  The tricky part is that path may
- * contain symlinks, which must be resolved.
+ * path of baselen characters, presumed not to end in a / unless it is
+ * just "/".  path is the new path to be canonicalized.  The tricky part
+ * is that path may contain symlinks, which must be resolved.
  */
 char *
 pseudo_fix_path(const char *base, const char *path, size_t rootlen, size_t baselen, size_t *lenp, int leave_last) {
@@ -808,6 +808,12 @@ pseudo_fix_path(const char *base, const char *path, size_t rootlen, size_t basel
 		pseudo_diag("can't fix empty path.\n");
 		return 0;
 	}
+	if (baselen == 1) {
+		baselen = 0;
+	}
+	if (rootlen == 1) {
+		rootlen = 0;
+	}
 	newpathlen = pseudo_path_max();
 	pathlen = strlen(path);
 	/* Crazy shell code (e.g. libtool) can pass in a command pipeline as a path which exceeds the max path
diff --git a/test/test-relative-from-root.sh b/test/test-relative-from-root.sh
new file mode 100755
index 0000000..e2c230e
--- /dev/null
+++ b/test/test-relative-from-root.sh
@@ -0,0 +1,14 @@
+#!/bin/bash
+# pseudo had a bug that made it abort() when looking up a relative path from
+# base "/", such as by openat(dirfd_of_root, "foo/bar") or when cwd is /. It
+# tried to look up base+"/"+path = "//foo/bar", which is wrong.
+
+set -e
+
+touch f1
+relative_pwd=${PWD#/}
+
+cd /
+cat "$relative_pwd/f1"
+
+rm "$relative_pwd/f1"
-- 
2.25.1


