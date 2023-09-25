Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5325CE7AB4
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 18:04:24 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.67975.1695665058606168015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 11:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q9diVKvk;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-578d78ffdbcso4040660a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 11:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695665058; x=1696269858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4loi+diExjy/9u0kw1H1lWlKoe0GLUmoTF9U8t7jv2o=;
        b=Q9diVKvkfByHNFkEUk8+qwAgUUyWlLh7cPgt5pcemUrjlsjfCdQdPgzGtS1HlQsap3
         u0ql5CDQQLm0SU0xXCz4ii6D/2yf/AWoSPDu7PX3lby/0H1K3KH7VL0CZTcTFGtTt3DV
         ACVqCLbWy3atEmDySENv1t+lhc9t+YPzO2oKCEstVWrICqzVGll5eJ/rZggCfTllxQoV
         LytSW7cg2K7yAReQY8lqT/6Npt9IcAGm7RF6XLOBdJpOmM46RRRvWqH8rJfAiFRI3h17
         TTNmdnuf/ZkBFzqOTDd2G2/5vUwwjnee9XcLPdDxBML/iagT6k0gZrMEEPBBhvl1RrKX
         BGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665058; x=1696269858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4loi+diExjy/9u0kw1H1lWlKoe0GLUmoTF9U8t7jv2o=;
        b=BfUkF6ZLF0rqHCnn1SzaQ1pcWO6PM8AIgDBsuU4ls3FV41LoZH1nYwfl9HFk1O8ea0
         R8RUFqv5KX5CNbMYCl0qHMtkwlrtsfjMxD/RYfiNja9wnbvdsD9EBeIbqXqImAdCNKeE
         keT3laf03fm910osF6FTeC5Fm32HBQyu1HaWVbUszkarGEFhy/S/2PLffQ5spI6YMmr2
         cYVPeCC9eZNE1NLgdCysWa8+IixjOalIwyBLDI+169FnvQXJ5jR1whDYE9AXjF5p+Uyv
         6t3+pe1hB52YGXTDEnJg+7FaQf1mUDXxmxDDef8aC6zSlebG1eZfx8DysQNBN0AYdlKH
         BgyA==
X-Gm-Message-State: AOJu0YzvnB5Ca06jVW5ZZDFGYNofiZOToefz3havCcl0zj1g6FpeHpKz
	g9m/0u9xBEQIlAvnWTjYKu8fcWdCaHlV9g==
X-Google-Smtp-Source: AGHT+IE16ICgWhZ+gVvbcwcGBoaX2G8L5xu7ZErGUZn5RMMi7R1emEoU2BvqXYx36dMfBv395UPpHA==
X-Received: by 2002:a17:90a:f315:b0:273:4bbc:c3d0 with SMTP id ca21-20020a17090af31500b002734bbcc3d0mr5268320pjb.27.1695665057611;
        Mon, 25 Sep 2023 11:04:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id u23-20020a17090abb1700b00267d9f4d340sm9993226pjr.44.2023.09.25.11.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:04:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] systemd: Refresh patches to avoid patch-fuzz
Date: Mon, 25 Sep 2023 11:04:12 -0700
Message-ID: <20230925180412.1765616-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925180412.1765616-1-raj.khem@gmail.com>
References: <20230925180412.1765616-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 18:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188205

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...14-Use-uintmax_t-for-handling-rlim_t.patch | 23 ++---
 ...-not-disable-buffer-in-writing-files.patch | 89 +++++--------------
 .../0022-Handle-__cpu_mask-usage.patch        |  9 +-
 3 files changed, 31 insertions(+), 90 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-rlim_t.patch
index 1d50faa363f..2071f4fb206 100644
--- a/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-rlim_t.patch
@@ -26,11 +26,9 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/core/execute.c      |  4 ++--
  3 files changed, 9 insertions(+), 15 deletions(-)
 
-diff --git a/src/basic/format-util.h b/src/basic/format-util.h
-index 8719df3e29..9becc96066 100644
 --- a/src/basic/format-util.h
 +++ b/src/basic/format-util.h
-@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32_t));
+@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32
  #  error Unknown timex member size
  #endif
  
@@ -45,11 +43,9 @@ index 8719df3e29..9becc96066 100644
  
  #if SIZEOF_DEV_T == 8
  #  define DEV_FMT "%" PRIu64
-diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
-index 33dfde9d6c..e018fd81fd 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
-@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, const struct rlimit *rlim) {
+@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, cons
              fixed.rlim_max == highest.rlim_max)
                  return 0;
  
@@ -58,7 +54,7 @@ index 33dfde9d6c..e018fd81fd 100644
  
          return RET_NERRNO(setrlimit(resource, &fixed));
  }
-@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
+@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *r
          if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
                  r = free_and_strdup(&s, "infinity");
          else if (rl->rlim_cur >= RLIM_INFINITY)
@@ -76,20 +72,18 @@ index 33dfde9d6c..e018fd81fd 100644
          if (r < 0)
                  return -ENOMEM;
  
-@@ -403,7 +403,7 @@ int rlimit_nofile_safe(void) {
- 
-         rl.rlim_cur = FD_SETSIZE;
+@@ -407,7 +407,7 @@ int rlimit_nofile_safe(void) {
+         rl.rlim_max = MIN(rl.rlim_max, (rlim_t) read_nr_open());
+         rl.rlim_cur = MIN((rlim_t) FD_SETSIZE, rl.rlim_max);
          if (setrlimit(RLIMIT_NOFILE, &rl) < 0)
 -                return log_debug_errno(errno, "Failed to lower RLIMIT_NOFILE's soft limit to " RLIM_FMT ": %m", rl.rlim_cur);
 +                return log_debug_errno(errno, "Failed to lower RLIMIT_NOFILE's soft limit to " RLIM_FMT ": %m", (uintmax_t)rl.rlim_cur);
  
          return 1;
  }
-diff --git a/src/core/execute.c b/src/core/execute.c
-index 8ef76de9ab..ea1c203e43 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -6667,9 +6667,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+@@ -6707,9 +6707,9 @@ void exec_context_dump(const ExecContext
          for (unsigned i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
@@ -101,6 +95,3 @@ index 8ef76de9ab..ea1c203e43 100644
                  }
  
          if (c->ioprio_set) {
--- 
-2.39.2
-
diff --git a/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch
index ef6b5342ca1..c85087219c4 100644
--- a/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch
@@ -42,11 +42,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/vconsole/vconsole-setup.c        |  2 +-
  20 files changed, 36 insertions(+), 37 deletions(-)
 
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 11b4375ed5..7d81a6007f 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -400,7 +400,7 @@ int cg_kill_kernel_sigkill(const char *controller, const char *path) {
+@@ -400,7 +400,7 @@ int cg_kill_kernel_sigkill(const char *c
          if (r < 0)
                  return r;
  
@@ -55,7 +53,7 @@ index 11b4375ed5..7d81a6007f 100644
          if (r < 0)
                  return r;
  
-@@ -806,7 +806,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -806,7 +806,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -64,7 +62,7 @@ index 11b4375ed5..7d81a6007f 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -824,7 +824,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -824,7 +824,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -73,7 +71,7 @@ index 11b4375ed5..7d81a6007f 100644
                  if (r < 0)
                          return r;
  
-@@ -851,7 +851,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -851,7 +851,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -82,7 +80,7 @@ index 11b4375ed5..7d81a6007f 100644
          if (r < 0)
                  return r;
  
-@@ -861,7 +861,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -861,7 +861,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -91,7 +89,7 @@ index 11b4375ed5..7d81a6007f 100644
          if (r < 0)
                  return r;
  
-@@ -1764,7 +1764,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -1764,7 +1764,7 @@ int cg_set_attribute(const char *control
          if (r < 0)
                  return r;
  
@@ -100,11 +98,9 @@ index 11b4375ed5..7d81a6007f 100644
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
-diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
-index f5c0e04cec..272b920022 100644
 --- a/src/basic/namespace-util.c
 +++ b/src/basic/namespace-util.c
-@@ -227,12 +227,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
+@@ -227,12 +227,12 @@ int userns_acquire(const char *uid_map,
                  freeze();
  
          xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
@@ -119,11 +115,9 @@ index f5c0e04cec..272b920022 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 64a95dd866..12cd16db1c 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limi
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -139,11 +133,9 @@ index 64a95dd866..12cd16db1c 100644
          if (r < 0) {
                  uint64_t threads_max;
  
-diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
-index b66a6622ae..8d1c93008a 100644
 --- a/src/basic/sysctl-util.c
 +++ b/src/basic/sysctl-util.c
-@@ -58,7 +58,7 @@ int sysctl_write(const char *property, const char *value) {
+@@ -58,7 +58,7 @@ int sysctl_write(const char *property, c
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -152,8 +144,6 @@ index b66a6622ae..8d1c93008a 100644
  }
  
  int sysctl_writef(const char *property, const char *format, ...) {
-diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index e1ddf97914..df6e156f19 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
 @@ -30,7 +30,7 @@ static bool arg_unregister = false;
@@ -165,7 +155,7 @@ index e1ddf97914..df6e156f19 100644
  }
  
  static int apply_rule(const char *filename, unsigned line, const char *rule) {
-@@ -58,7 +58,7 @@ static int apply_rule(const char *filename, unsigned line, const char *rule) {
+@@ -58,7 +58,7 @@ static int apply_rule(const char *filena
          if (r >= 0)
                  log_debug("%s:%u: Rule '%s' deleted.", filename, line, rulename);
  
@@ -183,11 +173,9 @@ index e1ddf97914..df6e156f19 100644
                  if (r < 0)
                          log_warning_errno(r, "Failed to flush binfmt_misc rules, ignoring: %m");
                  else
-diff --git a/src/core/cgroup.c b/src/core/cgroup.c
-index 4cac3f6a89..bebe2cd120 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
-@@ -4349,7 +4349,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
+@@ -4349,7 +4349,7 @@ int unit_cgroup_freezer_action(Unit *u,
                          u->freezer_state = FREEZER_THAWING;
          }
  
@@ -196,11 +184,9 @@ index 4cac3f6a89..bebe2cd120 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/core/main.c b/src/core/main.c
-index c0b8126d96..fe676320ba 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1737,7 +1737,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1737,7 +1737,7 @@ static void initialize_core_pattern(bool
          if (getpid_cached() != 1)
                  return;
  
@@ -209,11 +195,9 @@ index c0b8126d96..fe676320ba 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m",
                                    arg_early_core_pattern);
-diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index bcaa237c8d..4032bde19e 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -319,17 +319,17 @@ int mac_smack_setup(bool *loaded_policy) {
+@@ -319,17 +319,17 @@ int mac_smack_setup(bool *loaded_policy)
          }
  
  #if HAVE_SMACK_RUN_LABEL
@@ -235,8 +219,6 @@ index bcaa237c8d..4032bde19e 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
-diff --git a/src/home/homework.c b/src/home/homework.c
-index 28907386a4..f9e45349a7 100644
 --- a/src/home/homework.c
 +++ b/src/home/homework.c
 @@ -278,7 +278,7 @@ static void drop_caches_now(void) {
@@ -248,11 +230,9 @@ index 28907386a4..f9e45349a7 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to drop caches, ignoring: %m");
          else
-diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index 8c65ee3469..153edab081 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2515,7 +2515,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -2515,7 +2515,7 @@ _public_ int sd_device_set_sysattr_value
          if (!value)
                  return -ENOMEM;
  
@@ -261,11 +241,9 @@ index 8c65ee3469..153edab081 100644
          if (r < 0) {
                  /* On failure, clear cache entry, as we do not know how it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
-diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index 0deb4ebb30..bae8eead9e 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -122,7 +122,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+@@ -122,7 +122,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -274,8 +252,6 @@ index 0deb4ebb30..bae8eead9e 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 36d336dfc8..8c5c69596b 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
 @@ -2774,7 +2774,7 @@ static int reset_audit_loginuid(void) {
@@ -305,8 +281,6 @@ index 36d336dfc8..8c5c69596b 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/shared/binfmt-util.c b/src/shared/binfmt-util.c
-index a26175474b..1413a9c72c 100644
 --- a/src/shared/binfmt-util.c
 +++ b/src/shared/binfmt-util.c
 @@ -46,7 +46,7 @@ int disable_binfmt(void) {
@@ -318,11 +292,9 @@ index a26175474b..1413a9c72c 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to unregister binfmt_misc entries: %m");
  
-diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
-index 2ea83f05d3..8626bb184c 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -351,7 +351,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+@@ -351,7 +351,7 @@ int cg_attach(const char *controller, co
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -340,11 +312,9 @@ index 2ea83f05d3..8626bb184c 100644
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
-diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
-index 3d2f179049..c1b6c170ac 100644
 --- a/src/shared/coredump-util.c
 +++ b/src/shared/coredump-util.c
-@@ -163,7 +163,7 @@ int set_coredump_filter(uint64_t value) {
+@@ -163,7 +163,7 @@ int set_coredump_filter(uint64_t value)
          xsprintf(t, "0x%"PRIx64, value);
  
          return write_string_file("/proc/self/coredump_filter", t,
@@ -353,11 +323,9 @@ index 3d2f179049..c1b6c170ac 100644
  }
  
  /* Turn off core dumps but only if we're running outside of a container. */
-diff --git a/src/shared/sleep-util.c b/src/shared/sleep-util.c
-index d7277399fb..d06d636fcc 100644
 --- a/src/shared/sleep-util.c
 +++ b/src/shared/sleep-util.c
-@@ -1044,7 +1044,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
+@@ -1044,7 +1044,7 @@ int write_resume_config(dev_t devno, uin
  
          /* We write the offset first since it's safer. Note that this file is only available in 4.17+, so
           * fail gracefully if it doesn't exist and we're only overwriting it with 0. */
@@ -366,7 +334,7 @@ index d7277399fb..d06d636fcc 100644
          if (r == -ENOENT) {
                  if (offset != 0)
                          return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
-@@ -1060,7 +1060,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
+@@ -1060,7 +1060,7 @@ int write_resume_config(dev_t devno, uin
                  log_debug("Wrote resume_offset=%s for device '%s' to /sys/power/resume_offset.",
                            offset_str, device);
  
@@ -375,11 +343,9 @@ index d7277399fb..d06d636fcc 100644
          if (r < 0)
                  return log_error_errno(r,
                                         "Failed to write device '%s' (%s) to /sys/power/resume: %m",
-diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
-index b3b5c905ad..bbfa1973fd 100644
 --- a/src/shared/smack-util.c
 +++ b/src/shared/smack-util.c
-@@ -113,7 +113,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
+@@ -113,7 +113,7 @@ int mac_smack_apply_pid(pid_t pid, const
                  return 0;
  
          p = procfs_file_alloca(pid, "attr/current");
@@ -388,8 +354,6 @@ index b3b5c905ad..bbfa1973fd 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 765dd4974f..cd6afb001b 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
 @@ -139,7 +139,7 @@ static int write_mode(char **modes) {
@@ -401,7 +365,7 @@ index 765dd4974f..cd6afb001b 100644
                  if (k >= 0)
                          return 0;
  
-@@ -160,7 +160,7 @@ static int write_state(FILE **f, char **states) {
+@@ -160,7 +160,7 @@ static int write_state(FILE **f, char **
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -410,11 +374,9 @@ index 765dd4974f..cd6afb001b 100644
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 0ce79f815c..28aab475d0 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -2634,7 +2634,6 @@ static int udev_rule_apply_token_to_event(
+@@ -2634,7 +2634,6 @@ static int udev_rule_apply_token_to_even
                  log_event_debug(dev, token, "ATTR '%s' writing '%s'", buf, value);
                  r = write_string_file(buf, value,
                                        WRITE_STRING_FILE_VERIFY_ON_FAILURE |
@@ -422,11 +384,9 @@ index 0ce79f815c..28aab475d0 100644
                                        WRITE_STRING_FILE_AVOID_NEWLINE |
                                        WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
                  if (r < 0)
-diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index 7d3e9db73f..2d4a0c4c9d 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -259,7 +259,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
+@@ -260,7 +260,7 @@ static int toggle_utf8_vc(const char *na
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
@@ -435,6 +395,3 @@ index 7d3e9db73f..2d4a0c4c9d 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
  
--- 
-2.39.2
-
diff --git a/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch
index 341543afdcf..580aff327db 100644
--- a/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch
@@ -23,8 +23,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/test/test-sizeof.c    | 2 +-
  2 files changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/src/shared/cpu-set-util.h b/src/shared/cpu-set-util.h
-index 3c63a58826..4c2d4347fc 100644
 --- a/src/shared/cpu-set-util.h
 +++ b/src/shared/cpu-set-util.h
 @@ -6,6 +6,8 @@
@@ -36,8 +34,6 @@ index 3c63a58826..4c2d4347fc 100644
  /* This wraps the libc interface with a variable to keep the allocated size. */
  typedef struct CPUSet {
          cpu_set_t *set;
-diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index 6cf92bffde..937d26ca55 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
 @@ -1,6 +1,5 @@
@@ -47,7 +43,7 @@ index 6cf92bffde..937d26ca55 100644
  #include <stdio.h>
  #include <string.h>
  #include <sys/resource.h>
-@@ -11,6 +10,7 @@
+@@ -12,6 +11,7 @@
  #include <float.h>
  
  #include "time-util.h"
@@ -55,6 +51,3 @@ index 6cf92bffde..937d26ca55 100644
  
  /* Print information about various types. Useful when diagnosing
   * gcc diagnostics on an unfamiliar architecture. */
--- 
-2.39.2
-
-- 
2.42.0


