Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935CCC982E7
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:17 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1683.1789682887636218133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pKjwHN3B;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so1479735e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682886; x=1790287686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6H+DbirnZH19EmX/bueBv+FeZKJhwCKJfWGXnoK85gg=;
        b=pKjwHN3BxRc7InOru3De159DFivjul8Lx5yiOETHRz3sSXqmCLRaARe7I0PuwDtM+Z
         e5fRevDLhee/4Cme3h2OZy25nwKo26kBc2ZaXMPf9kc5NIRfCXuP28p9Yw6ktpXfeOrO
         TxG7qfjg0z2PK3goUwZejso3Vg3oEw0t2zjLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682886; x=1790287686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6H+DbirnZH19EmX/bueBv+FeZKJhwCKJfWGXnoK85gg=;
        b=1/klkdDpfT8gcoK/qgcTqnrtKvU8WAkKHJxAsYcoYFRTZLGUBLQwKbTb++p/bSM5/k
         ccLmFaurZGou8qN5EE595H/NbGJrIIlBDNufnN+BRFBfGfyJvU6G4Uh3/gtjuxyt1qbv
         MvUGskcu3epIrQTUHN0rpTRAsZHT6t0AgP/9tkDY8cSd02sA1IUz/6rzD+thURfdjW6s
         XVrf6V6dfzPxdTIfCW07NHhJnu9pZfLOHEOz4F5RGV1kVbphN/MgeFpm2bVimup6XqzH
         L//jovYUHFrwr9cUyXXqFczWiND44+9Ooz7Cwdhv32rdm3VwEgHQOB3U4529Abw1+/uB
         KyWg==
X-Gm-Message-State: AFuF++nsDDhNRRGsOITVWT/6fZ4GX0dYH3Kf/lOejbbnlAmUvtAxd9Ye
	S/j4EHb46o572IijVHtlzfNQiPC7Aaok5y78KPnZsXjQGhBug0aZQjePdkkCBb12knmEZYwgQp6
	MXwovsuQ=
X-Gm-Gg: AYBFou1FUR6YaxRAM17UPLNHsi1WWwaxZkZm/yWZAQf3RoOGfJKA2fuRdr+YV8cJEUM
	0Rw5JQrwR+PkTuC1zLbQFfxGCV1fNQSTh9ra/EDhRCkglrSiWeFzWVnkFDaTb1c6ydQlJkiWCmC
	tO+S42drIwyfd9/erKJpfizYUwG4YeDoZrZDmoZNc5cVJlruc8KoqtpRPDtNgCbUIwfKW5LFOqD
	SwdpONOXCKRS22NMN3pcqTHVjZO9+6VN7GwkTIQVkMWRp5g2Inun/lI0fAgAu0LugT+JHrNEK+4
	LLkxAs69U9a0Ec9Df7xY7vzDeuBnOW0mqLh3s3nF8oBtTcRvci5ub5izqc8Ljs9sfSQf1XdTRbK
	bzb7wG3E/j8Y5BM8WaVKDyslwy83BtH/HDKKKg9gT9q1zM46RYQKUoXjooJh2ZjRSpbmLFaIUh1
	zlkcr8L1k5GSzq46Nm6nYp5zOucUX938G6dwfZiYHnyWnTY9S/6t02WhVZRgWHbL9biIRXNOSJJ
	E66sa12zQcqlb31GCKi5z1WXI4xgFX0UBVXahxLVfG6JfedTl/gE6QhkKXu7rMPgqHGXANmwuUo
	zIgaiCgWLg==
X-Received: by 2002:a05:600c:19d1:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-49fc5743bc4mr3224415e9.23.1789682885917;
        Thu, 17 Sep 2026 15:08:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 31/79] glib-2.0: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:16 +0200
Message-ID: <c2a9ec8b6cd6e8294ce0dbbe2c804c81d0f29a11.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246126

From: Daniel Turull <daniel.turull@ericsson.com>

GLib's docs/backports.md states that only bug and documentation fixes are
backported to the current stable branch, that new features and API/ABI
changes must not be, and that micro stable releases are intended as
drop-in replacements. So upgrades within a major.minor are stable point
upgrades per the OE-Core stable release policy (ref-manual, "Stable Point
Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.2/docs/backports.md#L18

Checked the last two point releases for feature creep:

  2.88.2 (Jun 25 2026): entirely "Bugs fixed" backports plus translation
  updates.
  2.88.1 (May 02 2026): seven fixes -- a GCC 16 miscompilation, a GRegex
  out-of-bounds read with security impact, and five further out-of-bounds
  reads. No API or behaviour changes.

The series opened with 2.88.0 (Mar 16 2026), which must stay outside the
regex as the feature-level release.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 2.72.0 -> 2.72.3,
scarthgap 2.78.4 -> 2.78.6, and wrynose 2.88.0 -> 2.88.2.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8de7017a3161ffb04f36e9c6ba2f7ead402dc4a5)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glib-2.0/glib.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index d49ae131685..cad74f53f71 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -30,7 +30,9 @@ LEAD_SONAME = "libglib-2.0.*"
 
 GNOMEBN = "glib"
 
-inherit gettext gi-docgen gnomebase ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages gobject-introspection-data
+# GLib publishes bugfix/security-only micro releases on its stable
+# (even-minor) series.
+inherit gettext gi-docgen gnomebase ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages gobject-introspection-data upstream-stable-release-point
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 

