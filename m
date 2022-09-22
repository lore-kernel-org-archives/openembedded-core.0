Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15899C6FA91
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 21:48:09 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.993.1663883284220402346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pxrGa9hK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d11so2635863pll.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=CPYjJiHFpfo+UE7s4ezd9b3P52NQaElgBquKbogOz9g=;
        b=pxrGa9hKdzThmB/K/tGhaEMwF1RsnNDsKSJ2CeFdGs7AoqlUOMaETfEmQQrKRdjeR1
         6iSP+1B2Im4aTg7P7bDjcnPYrlV8esUox+wgeyj85Bbsn2EkpaN/T6eJWepyg80eCh10
         2zIOufMOlUJtOhttJAfMPXx/m79gO4LM15CmuTNgCQVddxmhqHASPh0silZMax+neLjM
         dEW9LEIyjIbQ4/u10mgCXvZv/5iiQCgUH47iThHfJeAhxHQW3lH32ZzG4GoDaZCfA67h
         1OwfEUCfWwk13iKymOCs91MO+x/rZjmGRJC4Fzv81Gx8Adu3xPAwUBB6C7FlLym8agIo
         j/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CPYjJiHFpfo+UE7s4ezd9b3P52NQaElgBquKbogOz9g=;
        b=jKxm/BfojYgr31lW0McjhCtHK4kzV2QDFfN7lbOMlPcZ4p1n0sRYsEPDm27f8ZWSWg
         rOJ6t5ykTigr9KHzsGESJKCDrXeVKXwy2wElxwCkxUIy4q2wODA4riyagVa9ZZAAUC98
         m31YTrB7QF2roEKZnwGA4pADA1xOJV/d9uh6zSkq94XYIoov58uPzahuwu8VIJ7MSuRn
         07Z/86qq8+GcqUBucAN2LqxxnvyMkJqjocRyJFVjmfnG27NhE+KReaJpJAKGFCK1LqQr
         LBY/L+zCDqRde/swozckSn9Hwb/Ij/hfUUothlKGsnCSqOXBTkl0QgZP0v2n8+wJPvDr
         a4Tg==
X-Gm-Message-State: ACrzQf20ZBzPHAyGEjM450JoFfUUocScclAMlgIXPuFpUvb/hrlA2SbY
	XQuXAC//DNW/PykpCu787OqK1sUpLhWU5NIa
X-Google-Smtp-Source: 
 AMsMyM7IwGTtZCJQh/p6vqdzgcvYHQnCvuboOKfcQnaFpF3LD6t/QvAEHjIB156SJ01Xy0O83X5hWg==
X-Received: by 2002:a17:902:ce8b:b0:177:f1f0:8914 with SMTP id
 f11-20020a170902ce8b00b00177f1f08914mr5434841plg.137.1663883283052;
        Thu, 22 Sep 2022 14:48:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a170902714400b0016ee4b0bd60sm4574813plm.166.2022.09.22.14.48.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 14:48:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/5] subversion: fix CVE-2021-28544
Date: Thu, 22 Sep 2022 11:47:46 -1000
Message-Id: 
 <7fdd4d2dc019071525349fbb153e2e80f6583217.1663883154.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663883154.git.steve@sakoman.com>
References: <cover.1663883154.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 21:48:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170990

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../subversion/CVE-2021-28544.patch           | 146 ++++++++++++++++++
 .../subversion/subversion_1.13.0.bb           |   1 +
 2 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/CVE-2021-28544.patch

diff --git a/meta/recipes-devtools/subversion/subversion/CVE-2021-28544.patch b/meta/recipes-devtools/subversion/subversion/CVE-2021-28544.patch
new file mode 100644
index 0000000000..030ead6c66
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/CVE-2021-28544.patch
@@ -0,0 +1,146 @@
+From 61382fd8ea66000bd9ee8e203a6eab443220ee40 Mon Sep 17 00:00:00 2001
+From: Nathan Hartman <hartmannathan@apache.org>
+Date: Sun, 27 Mar 2022 05:59:18 +0000
+Subject: [PATCH] On the 1.14.x-r1899227 branch: Merge r1899227 from trunk
+ w/testlist variation
+
+git-svn-id: https://svn.apache.org/repos/asf/subversion/branches/1.14.x-r1899227@1899229 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2021-28544 [https://github.com/apache/subversion/commit/61382fd8ea66000bd9ee8e203a6eab443220ee40]
+Upstream-Status: Backport
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ subversion/libsvn_repos/log.c           | 26 +++++-------
+ subversion/tests/cmdline/authz_tests.py | 55 +++++++++++++++++++++++++
+ 2 files changed, 65 insertions(+), 16 deletions(-)
+
+diff --git a/subversion/libsvn_repos/log.c b/subversion/libsvn_repos/log.c
+index d9a1fb1085e16..41ca8aed27174 100644
+--- a/subversion/libsvn_repos/log.c
++++ b/subversion/libsvn_repos/log.c
+@@ -337,42 +337,36 @@ detect_changed(svn_repos_revision_access_level_t *access_level,
+       if (   (change->change_kind == svn_fs_path_change_add)
+           || (change->change_kind == svn_fs_path_change_replace))
+         {
+-          const char *copyfrom_path = change->copyfrom_path;
+-          svn_revnum_t copyfrom_rev = change->copyfrom_rev;
+-
+           /* the following is a potentially expensive operation since on FSFS
+              we will follow the DAG from ROOT to PATH and that requires
+              actually reading the directories along the way. */
+           if (!change->copyfrom_known)
+             {
+-              SVN_ERR(svn_fs_copied_from(&copyfrom_rev, &copyfrom_path,
++              SVN_ERR(svn_fs_copied_from(&change->copyfrom_rev, &change->copyfrom_path,
+                                         root, path, iterpool));
+               change->copyfrom_known = TRUE;
+             }
+ 
+-          if (copyfrom_path && SVN_IS_VALID_REVNUM(copyfrom_rev))
++          if (change->copyfrom_path && SVN_IS_VALID_REVNUM(change->copyfrom_rev))
+             {
+-              svn_boolean_t readable = TRUE;
+-
+               if (callbacks->authz_read_func)
+                 {
+                   svn_fs_root_t *copyfrom_root;
++                  svn_boolean_t readable;
+ 
+                   SVN_ERR(svn_fs_revision_root(&copyfrom_root, fs,
+-                                               copyfrom_rev, iterpool));
++                                               change->copyfrom_rev, iterpool));
+                   SVN_ERR(callbacks->authz_read_func(&readable,
+                                                      copyfrom_root,
+-                                                     copyfrom_path,
++                                                     change->copyfrom_path,
+                                                      callbacks->authz_read_baton,
+                                                      iterpool));
+                   if (! readable)
+-                    found_unreadable = TRUE;
+-                }
+-
+-              if (readable)
+-                {
+-                  change->copyfrom_path = copyfrom_path;
+-                  change->copyfrom_rev = copyfrom_rev;
++                    {
++                      found_unreadable = TRUE;
++                      change->copyfrom_path = NULL;
++                      change->copyfrom_rev = SVN_INVALID_REVNUM;
++                    }
+                 }
+             }
+         }
+diff --git a/subversion/tests/cmdline/authz_tests.py b/subversion/tests/cmdline/authz_tests.py
+index 760cb3663d02f..92e8a5e1935c9 100755
+--- a/subversion/tests/cmdline/authz_tests.py
++++ b/subversion/tests/cmdline/authz_tests.py
+@@ -1731,6 +1731,60 @@ def empty_group(sbox):
+                                      '--username', svntest.main.wc_author,
+                                      sbox.repo_url)
+ 
++@Skip(svntest.main.is_ra_type_file)
++def log_inaccessible_copyfrom(sbox):
++  "log doesn't leak inaccessible copyfrom paths"
++
++  sbox.build(empty=True)
++  sbox.simple_add_text('secret', 'private')
++  sbox.simple_commit(message='log message for r1')
++  sbox.simple_copy('private', 'public')
++  sbox.simple_commit(message='log message for r2')
++
++  svntest.actions.enable_revprop_changes(sbox.repo_dir)
++  # Remove svn:date and svn:author for predictable output.
++  svntest.actions.run_and_verify_svn(None, [], 'propdel', '--revprop',
++                                     '-r2', 'svn:date', sbox.repo_url)
++  svntest.actions.run_and_verify_svn(None, [], 'propdel', '--revprop',
++                                     '-r2', 'svn:author', sbox.repo_url)
++
++  write_restrictive_svnserve_conf(sbox.repo_dir)
++
++  # First test with blanket access.
++  write_authz_file(sbox,
++                   {"/" : "* = rw"})
++  expected_output = svntest.verify.ExpectedOutput([
++    "------------------------------------------------------------------------\n",
++    "r2 | (no author) | (no date) | 1 line\n",
++    "Changed paths:\n",
++    "   A /public (from /private:1)\n",
++    "\n",
++    "log message for r2\n",
++    "------------------------------------------------------------------------\n",
++  ])
++  svntest.actions.run_and_verify_svn(expected_output, [],
++                                     'log', '-r2', '-v',
++                                     sbox.repo_url)
++
++  # Now test with an inaccessible copy source (/private).
++  write_authz_file(sbox,
++                   {"/" : "* = rw"},
++                   {"/private" : "* ="})
++  expected_output = svntest.verify.ExpectedOutput([
++    "------------------------------------------------------------------------\n",
++    "r2 | (no author) | (no date) | 1 line\n",
++    "Changed paths:\n",
++    # The copy is shown as a plain add with no copyfrom info.
++    "   A /public\n",
++    "\n",
++    # No log message, as the revision is only partially visible.
++    "\n",
++    "------------------------------------------------------------------------\n",
++  ])
++  svntest.actions.run_and_verify_svn(expected_output, [],
++                                     'log', '-r2', '-v',
++                                     sbox.repo_url)
++
+ 
+ ########################################################################
+ # Run the tests
+@@ -1771,6 +1825,7 @@ def empty_group(sbox):
+               inverted_group_membership,
+               group_member_empty_string,
+               empty_group,
++              log_inaccessible_copyfrom,
+              ]
+ serial_only = True
+ 
diff --git a/meta/recipes-devtools/subversion/subversion_1.13.0.bb b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
index 34c0dbe5b8..5643191569 100644
--- a/meta/recipes-devtools/subversion/subversion_1.13.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-Fix-libtool-name-in-configure.ac.patch \
            file://serfmacro.patch \
            file://CVE-2020-17525.patch \
+           file://CVE-2021-28544.patch \
            "
 
 SRC_URI[md5sum] = "3004b4dae18bf45a0b6ea4ef8820064d"
-- 
2.25.1


