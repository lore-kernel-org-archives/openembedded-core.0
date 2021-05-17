Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
 by mx.groups.io with SMTP id smtpd.web11.652.1621291871933993981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=d9Z6SmKU;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.160.202, mailfrom: 3xvoiyamkanst7hdlldib.9lj@flex--wak.bounces.google.com)
Received: by mail-qt1-f202.google.com with SMTP id e28-20020ac84b5c0000b02901cd9b2b2170so6177946qts.13
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=wYINFoNSKcbpSHybrmlaaMZavZ7F90gAA7sE1nIp070=;
        b=d9Z6SmKU66gqM80/y4YbdMcvEK4b2BjUzprrOWWjnkAS9P6tn11cJ0vjxGxRHQFAyn
         A0PnKmuvYr1euhsbvMNMfRLALO8lfHWtPJLp5hRyvM7A68Mxz2bSv6GA0axFmzoCaSy9
         NfPqJMBY84A8OKcodZlzbrfo9spWKJouO6r2g41a/KhA31FLfu//YJ1WCb7GwM/5LKXo
         naei4N207E3rDV95zagosd1/TUpekh/v7NRovtDrSFMTT60WBtb6tE5m8HnxudNUGFgx
         xAwaRwr2mKNjPQdLyzMoeTbzpxu/8q5F/mCJyD3ive5h8yznl4wuH8hlOU592Q0OomGX
         HPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=wYINFoNSKcbpSHybrmlaaMZavZ7F90gAA7sE1nIp070=;
        b=AoxKE6PgMl7cCWHZxAUcmLHeVbNXVZlhQtKGaIpriR/kd6SnXs23xwKfXu9LlxgYzE
         2RN1OHDno33ee3nJQsqQv/mIoTFxUqnHJG4xOiACISDWDxl/Y8aiR5BukdWDgYOKKkKl
         YGqnjNafm3VivcZWKBXCw3cOD5uxH9/OgLHs7V79+JXMnij4iw1gw55zoqtrKjvih62i
         5MFhHrvqEPgya7sRRmH+ZczU2g6AeEEg5irc4YEG/tOkI10FudWoq3vyxu20SowmjRJI
         cvqFcc5njA+ajNb5JcMPbXZnK/npjmu03NZxBvnJLN/b65RzDCFimLkC0F6DnnhjfyMj
         oyMg==
X-Gm-Message-State: AOAM533L3V7kV/scWOBKeWYVWWIoqwZBXw/nJRfebTZFEQhXFt3pG6rI
	ACoI2V3PrRJSvEApokZtWR+orBxG6IXL1+7hpuflGd0nnCvH1LJkghjB8uG1qpeF0x3IDXjElbg
	1Jz4newJ2bT845HZVx9dl0QoM/Um6zOeK0QWkga81QDOy4Kx6n8iE61130NUtEuYlLFoWdfR+vR
	FRpQ==
X-Google-Smtp-Source: ABdhPJx9J2z5DTB3xHCZZFtYG8eWJ70PJ5c163Dh4NweptPLFFr+wdjhJ9zexgj5k5OAgtXFzP0rOzA=
X-Received: from wak-linux.svl.corp.google.com ([2620:15c:2c5:3:dc0b:7266:720:d64b])
 (user=wak job=sendgmr) by 2002:a05:6214:18c4:: with SMTP id
 cy4mr2165356qvb.31.1621291870667; Mon, 17 May 2021 15:51:10 -0700 (PDT)
Date: Mon, 17 May 2021 15:51:00 -0700
Message-Id: <20210517225101.1100864-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [OE-core][PATCH 1/2] systemd: Fix static neighbor creation in networkd
From: "William A. Kennington III" <wak@google.com>
To: openembedded-core@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"

Backport a patch to fix the creation of static neighbors.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 ...or-Always-add-neighbors-with-replace.patch | 50 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_247.6.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch b/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
new file mode 100644
index 0000000000..5593c3f479
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
@@ -0,0 +1,50 @@
+From faa0f758bc2f194d63bbed6e7f91df176f594a06 Mon Sep 17 00:00:00 2001
+From: "William A. Kennington III" <william@wkennington.com>
+Date: Tue, 27 Apr 2021 01:25:58 -0700
+Subject: [PATCH] network: neighbor: Always add neighbors with replace
+
+We were duplicating setting flags for the message and a combination of
+NLM_F_APPEND and NLM_F_CREATE which does not make sense. We should have
+been using NLM_F_REPLACE and NLM_F_CREATE since the kernel can
+dynamically create neighbors prior to us adding an entry. Otherwise, we
+can end up with cases where the message will time out after ~25s even
+though the neighbor still gets added. This delays the rest of the setup
+of the interface even though the error is ultimately ignored.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/192a9d95ea3e058afd824d38a9cea16ad0a84a57]
+---
+ src/libsystemd/sd-netlink/rtnl-message.c | 2 +-
+ src/network/networkd-neighbor.c          | 4 ----
+ 2 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/src/libsystemd/sd-netlink/rtnl-message.c b/src/libsystemd/sd-netlink/rtnl-message.c
+index 4cabbabba6..c9d0c9b1e7 100644
+--- a/src/libsystemd/sd-netlink/rtnl-message.c
++++ b/src/libsystemd/sd-netlink/rtnl-message.c
+@@ -445,7 +445,7 @@ int sd_rtnl_message_new_neigh(sd_netlink *rtnl, sd_netlink_message **ret, uint16
+                 return r;
+ 
+         if (nlmsg_type == RTM_NEWNEIGH)
+-                (*ret)->hdr->nlmsg_flags |= NLM_F_CREATE | NLM_F_APPEND;
++                (*ret)->hdr->nlmsg_flags |= NLM_F_CREATE | NLM_F_REPLACE;
+ 
+         ndm = NLMSG_DATA((*ret)->hdr);
+ 
+diff --git a/src/network/networkd-neighbor.c b/src/network/networkd-neighbor.c
+index c805d52cf3..adce055009 100644
+--- a/src/network/networkd-neighbor.c
++++ b/src/network/networkd-neighbor.c
+@@ -259,10 +259,6 @@ static int neighbor_configure(Neighbor *neighbor, Link *link) {
+         if (r < 0)
+                 return log_link_error_errno(link, r, "Could not set state: %m");
+ 
+-        r = sd_netlink_message_set_flags(req, NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE | NLM_F_REPLACE);
+-        if (r < 0)
+-                return log_link_error_errno(link, r, "Could not set flags: %m");
+-
+         r = sd_netlink_message_append_data(req, NDA_LLADDR, &neighbor->lladdr, neighbor->lladdr_size);
+         if (r < 0)
+                 return log_link_error_errno(link, r, "Could not append NDA_LLADDR attribute: %m");
+-- 
+2.31.1.498.g6c1eba8ee3d-goog
+
diff --git a/meta/recipes-core/systemd/systemd_247.6.bb b/meta/recipes-core/systemd/systemd_247.6.bb
index ce6ac7ebaa..fb4acf2d37 100644
--- a/meta/recipes-core/systemd/systemd_247.6.bb
+++ b/meta/recipes-core/systemd/systemd_247.6.bb
@@ -27,6 +27,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
            file://0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch \
            file://0001-analyze-resolve-executable-path-if-it-is-relative.patch \
+           file://0001-network-neighbor-Always-add-neighbors-with-replace.patch \
            "
 
 # patches needed by musl
-- 
2.31.1.751.gd2f1c929bd-goog

