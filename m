Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.10775.1613259510476546791
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Feb 2021 15:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J4eUCVvQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id m1so3896900wml.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Feb 2021 15:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vpBIMLKzJ1RvxMNBleZGlPxMDwCZRb/nXoGN2ZAOL0g=;
        b=J4eUCVvQi8HYSC4l+fpBQoqAX6ExC0Aa5B5ju7W/zgG5h+Cv0OE6Nxt4lV/6luJUD/
         hFQzeV8JgA+HKd9Ja/baINACHMj/sHi9Q29aU4DBmD7WL0hwqhLl9vVKrBnQkfEBP94s
         qZ7XhsIZFsZatF5iL9AtGpBfaIsKXbn61QR7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vpBIMLKzJ1RvxMNBleZGlPxMDwCZRb/nXoGN2ZAOL0g=;
        b=XsBp7HfLXj3vsrChXij/OmF7q0iIQnNyFGdA6Q0ymuO3w8fav2fzmuYnPSkIJ2Gkii
         ECIMPFUOIvGLLJZqFdWoquSHk/2kaYM+5h5gGdiasEyyAMUXM11A4xhCvHFno2qCUk87
         VUYIpcuuAl0KmeGUy7hu3L4OoZ7JqTKkTC2znvS9810TyYukoMHQM/c7p+KkTZnUP99u
         ZjuFEvIK/MuVdmL1fcj2LaoooRS0MAlYFxQ0kLX3rfhKjwvhXl7N2DKI8AOiygHU0618
         xs0iNog3OU1s2KxJzu0UVric1rIvSf7ap8S1KNEITheSzBekWxWh5ap2bPMLhU8JdGLQ
         Qnxw==
X-Gm-Message-State: AOAM532fbxDPKJnavPnPwNlGADamxscoeTcQFmwXCVWLIfS9hRs40AWp
	rwhebgGxr5M5qO/ZUMvQ7eWxnESXvQywIQ==
X-Google-Smtp-Source: ABdhPJxwHoAZOj3qfeCmHQ+YtEvle6f+NlX9DSFNojGHDp2nLcy1eCp+ZGez+V56mAfXqyGpCWQO2Q==
X-Received: by 2002:a1c:545d:: with SMTP id p29mr8068629wmi.77.1613259508649;
        Sat, 13 Feb 2021 15:38:28 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6c46:cb67:3902:3f00])
        by smtp.gmail.com with ESMTPSA id f7sm17006646wre.78.2021.02.13.15.38.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 15:38:28 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: Simplify mount error patch
Date: Sat, 13 Feb 2021 23:38:27 +0000
Message-Id: <20210213233827.1947355-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As mentioned during review, this patch can be less invasive and hence easier
to maintain. Improve as such.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...r-mount-error-with-invalid-options-o.patch | 43 +++----------------
 1 file changed, 7 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch b/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
index b1d3d6963c4..94a4c307b54 100644
--- a/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
+++ b/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
@@ -36,10 +36,10 @@ systemd 247 and above plus kernel v5.7 or older will need this.
 Upstream-Status: Denied [https://github.com/systemd/systemd/issues/16896]
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
 
-diff --git a/src/core/namespace.c b/src/core/namespace.c
-index cdf427a6ea93..f8fc33a89fc2 100644
---- a/src/core/namespace.c
-+++ b/src/core/namespace.c
+Index: git/src/core/namespace.c
+===================================================================
+--- git.orig/src/core/namespace.c
++++ git/src/core/namespace.c
 @@ -4,7 +4,9 @@
  #include <linux/loop.h>
  #include <sched.h>
@@ -50,11 +50,9 @@ index cdf427a6ea93..f8fc33a89fc2 100644
  #include <unistd.h>
  #include <linux/fs.h>
  
-@@ -859,14 +861,34 @@ static int mount_sysfs(const MountEntry *m) {
- }
+@@ -860,13 +862,32 @@ static int mount_sysfs(const MountEntry
  
  static int mount_procfs(const MountEntry *m, const NamespaceInfo *ns_info) {
-+        _cleanup_free_ char *opts = NULL;
          const char *entry_path;
 -        int r;
 +        int r, major, minor;
@@ -86,41 +84,14 @@ index cdf427a6ea93..f8fc33a89fc2 100644
          /* Mount a new instance, so that we get the one that matches our user namespace, if we are running in
           * one. i.e we don't reuse existing mounts here under any condition, we want a new instance owned by
           * our user namespace and with our hidepid= settings applied. Hence, let's get rid of everything
-@@ -875,9 +897,8 @@ static int mount_procfs(const MountEntry *m, const NamespaceInfo *ns_info) {
+@@ -875,8 +896,8 @@ static int mount_procfs(const MountEntry
          (void) mkdir_p_label(entry_path, 0755);
          (void) umount_recursive(entry_path, 0);
  
 -        if (ns_info->protect_proc != PROTECT_PROC_DEFAULT ||
 -            ns_info->proc_subset != PROC_SUBSET_ALL) {
--                _cleanup_free_ char *opts = NULL;
 +        if (!old && (ns_info->protect_proc != PROTECT_PROC_DEFAULT ||
 +            ns_info->proc_subset != PROC_SUBSET_ALL)) {
+                 _cleanup_free_ char *opts = NULL;
  
                  /* Starting with kernel 5.8 procfs' hidepid= logic is truly per-instance (previously it
-                  * pretended to be per-instance but actually was per-namespace), hence let's make use of it
-@@ -891,21 +912,9 @@ static int mount_procfs(const MountEntry *m, const NamespaceInfo *ns_info) {
-                                ns_info->proc_subset == PROC_SUBSET_PID ? ",subset=pid" : "");
-                 if (!opts)
-                         return -ENOMEM;
--
--                r = mount_nofollow_verbose(LOG_DEBUG, "proc", entry_path, "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV, opts);
--                if (r < 0) {
--                        if (r != -EINVAL)
--                                return r;
--
--                        /* If this failed with EINVAL then this likely means the textual hidepid= stuff is
--                         * not supported by the kernel, and thus the per-instance hidepid= neither, which
--                         * means we really don't want to use it, since it would affect our host's /proc
--                         * mount. Hence let's gracefully fallback to a classic, unrestricted version. */
--                } else
--                        return 1;
-         }
- 
--        r = mount_nofollow_verbose(LOG_DEBUG, "proc", entry_path, "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV, NULL);
-+        r = mount_nofollow_verbose(LOG_DEBUG, "proc", entry_path, "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV, opts);
-         if (r < 0)
-                 return r;
- 
--- 
-2.29.2
-
-- 
2.27.0

