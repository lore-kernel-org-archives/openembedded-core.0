Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2144BC7EE23
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 00:10:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.2215.1677715820517168390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 16:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F1J01oH/;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id z2so15791337plf.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 16:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3CF0J18y5P1ajo4oXhhd/KccNaEoSHLoIf0zqwm08Is=;
        b=F1J01oH/12t40n3XEcdrH6jusH7ItSL6GdlZeIz9YA6COy5JAiamQF42gNp9cw2WPy
         4IiBdw6olVnJrgmYLoZwzlFm4m1j/cNWlEEZi7ZijFH7LJgsPulhEke6sGPe/5ZT2CHT
         lu6dI7Kp7sdehi9vL5HEvl/ijWcSWq8GSjCp2uu4vwjVuSE2bnhJL+kA5ZVIYKeLnOpD
         i93C7BK41K0QD3GoMHip86ajN61CQoyi5Eln9Y+zAw493HgcsvrF6fsg3buwRKm3h0QO
         E+oSqN8JsV/UNIJN4P0cPj6GgG3W24wyQ7kENt/fIjRJxjdhr94CJYTHXXt8P+orj8G6
         QT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CF0J18y5P1ajo4oXhhd/KccNaEoSHLoIf0zqwm08Is=;
        b=vM6RL74dGLZhg/RxtjHCDo5jl5AYVCLqsYYfLddYwCgqvTGQEg+WnMMCfkZZlzqG0z
         Jfdxe8eU9P/6F2BCX6Z9fY7KK6wxwZnWlg8CH7pw5K9+HlsmZhjUBlbDE4Su02vheC7t
         Rn9j3hjoqaIz11oaBI2kPXIBnxRHxrc6GeF1awhHMY0r4SwkhLjakZ1S6Ko/tKH3S7ED
         lmLalVp5D9l7ReYrJvr0JiZTjkXNvqZCRSrWVwMCqOgfiJTUBNSFyk4Lt1DIsWdRABSQ
         utG2tbbb52rAM9IHZjx4v/0YU/7ETTD+cLaSOVBVPgmRjEivwSgBNWcMCot/F+XCRXOe
         bqhA==
X-Gm-Message-State: AO0yUKUSWmDxzrf6X5ZjQOawLyH+DkVd1ymXJUXyLoOFTvhLjSRSo1RR
	NE3Ohm9Adf/cyDft2x4cfWiExqvAEbY=
X-Google-Smtp-Source: AK7set9XPQVcaun8JEkvUxoFKDiwP0ZRXcc+SpmNPZ0SZF/XJ6B4s20Zt5iO77xbBl5lpA0Xl4oUjQ==
X-Received: by 2002:a17:903:40c4:b0:19c:a9b8:4349 with SMTP id t4-20020a17090340c400b0019ca9b84349mr7140527pld.32.1677715819426;
        Wed, 01 Mar 2023 16:10:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090282c900b001991f07f41dsm8970048plz.297.2023.03.01.16.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 16:10:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] vte: Fix -Wenum-constexpr-conversion warning
Date: Wed,  1 Mar 2023 16:10:15 -0800
Message-Id: <20230302001015.2770757-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 00:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177951

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ty.cc-Do-not-typecast-to-GSpawnFlags.patch | 58 +++++++++++++++++++
 meta/recipes-support/vte/vte_0.70.2.bb        |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/vte/vte/0001-vtepty.cc-Do-not-typecast-to-GSpawnFlags.patch

diff --git a/meta/recipes-support/vte/vte/0001-vtepty.cc-Do-not-typecast-to-GSpawnFlags.patch b/meta/recipes-support/vte/vte/0001-vtepty.cc-Do-not-typecast-to-GSpawnFlags.patch
new file mode 100644
index 0000000000..16553b506f
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-vtepty.cc-Do-not-typecast-to-GSpawnFlags.patch
@@ -0,0 +1,58 @@
+From 9c7654e063d65fb2645459a32fd14eebab484857 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 1 Mar 2023 15:50:26 -0800
+Subject: [PATCH] vtepty.cc: Do not typecast to GSpawnFlags
+
+GSpawnFlags is enum with max value 1 << 15 which means it fits into a
+short int, however here we are OR'ing VTE_SPAWN_* as well which have
+higher values
+
+Fixes error like
+src/vtepty.cc:577:16: error: integer value 234881535 is outside the valid range of values [0, 4095] for this enumeration type [-Wenum-constexpr-conversion]
+
+Fixes issue https://gitlab.gnome.org/GNOME/vte/-/issues/2618
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/vte/-/issues/2618]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/vtepty.cc | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/src/vtepty.cc b/src/vtepty.cc
+index 3aaa0d6b..2da2675f 100644
+--- a/src/vtepty.cc
++++ b/src/vtepty.cc
+@@ -574,18 +574,18 @@ catch (...)
+ static constexpr inline auto
+ all_spawn_flags() noexcept
+ {
+-        return GSpawnFlags(G_SPAWN_LEAVE_DESCRIPTORS_OPEN |
+-                           G_SPAWN_DO_NOT_REAP_CHILD |
+-                           G_SPAWN_SEARCH_PATH |
+-                           G_SPAWN_STDOUT_TO_DEV_NULL |
+-                           G_SPAWN_STDERR_TO_DEV_NULL |
+-                           G_SPAWN_CHILD_INHERITS_STDIN |
+-                           G_SPAWN_FILE_AND_ARGV_ZERO |
+-                           G_SPAWN_SEARCH_PATH_FROM_ENVP |
+-                           G_SPAWN_CLOEXEC_PIPES |
+-                           VTE_SPAWN_NO_PARENT_ENVV |
+-                           VTE_SPAWN_NO_SYSTEMD_SCOPE |
+-                           VTE_SPAWN_REQUIRE_SYSTEMD_SCOPE);
++        return (G_SPAWN_LEAVE_DESCRIPTORS_OPEN |
++                G_SPAWN_DO_NOT_REAP_CHILD |
++                G_SPAWN_SEARCH_PATH |
++                G_SPAWN_STDOUT_TO_DEV_NULL |
++                G_SPAWN_STDERR_TO_DEV_NULL |
++                G_SPAWN_CHILD_INHERITS_STDIN |
++                G_SPAWN_FILE_AND_ARGV_ZERO |
++                G_SPAWN_SEARCH_PATH_FROM_ENVP |
++                G_SPAWN_CLOEXEC_PIPES |
++                VTE_SPAWN_NO_PARENT_ENVV |
++                VTE_SPAWN_NO_SYSTEMD_SCOPE |
++                VTE_SPAWN_REQUIRE_SYSTEMD_SCOPE);
+ }
+ 
+ static constexpr inline auto
+-- 
+2.39.2
+
diff --git a/meta/recipes-support/vte/vte_0.70.2.bb b/meta/recipes-support/vte/vte_0.70.2.bb
index ec2fb1f522..001f413c19 100644
--- a/meta/recipes-support/vte/vte_0.70.2.bb
+++ b/meta/recipes-support/vte/vte_0.70.2.bb
@@ -20,7 +20,8 @@ GIDOCGEN_MESON_OPTION = "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
-SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
+SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
+            file://0001-vtepty.cc-Do-not-typecast-to-GSpawnFlags.patch"
 SRC_URI[archive.sha256sum] = "4d15b4380de3f564d57eabd006389c407c705df5b0c70030fdcc24971a334d80"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-- 
2.39.2


