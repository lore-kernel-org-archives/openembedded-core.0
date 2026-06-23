Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFF6CDE00C
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:16 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33404.1782253626770019137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tyrmPUBW;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4924944fe6bso2632425e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253625; x=1782858425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2O9T1NtPpGo9tEjHqNOh/jIePn3GjMVmOxL8ryjK/jI=;
        b=tyrmPUBWcj49Di76QBYb1ECTs4/GnSCwA0/N1Fr3wUlXnGhIRJ7RWjoAD+o485FZA/
         Jzf4RUpjODYwqfBOnGeMA+nSzMgLp0hdhyi41ci+wnG1h5AuU0FTNiL1LjHgAyv3E033
         JgMxc8xxCi9uu4GbssYASCthiz0X1MHK0sV3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253625; x=1782858425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2O9T1NtPpGo9tEjHqNOh/jIePn3GjMVmOxL8ryjK/jI=;
        b=IggBFnwUsh1M2OuAhfFsHU41qP9R0YiI6HpwLHwAtliGdq+k4RzLbcz+7M2BgW70vM
         fokTlqPDnTIeJthVofDhqOaiKibpJWRHieL7KStIL63TqzgZ9noxpj5nmfKz02gSAlB1
         xMK9HdUlAZpoR1YLF2eYuLT+SNIQGSnsAiGiN0wN7KDCXp1XcXFfGXpAknAjfB8ABCBd
         /ltf+WHkz211ptHDNm2Uss6sF+oY31TvWWa9gi036RAsDpO80pF6X29zJhnDANLy2xhL
         yhFd6AqmWO8XMpG62PV+PK5H2uTwBgk0cJhZ4IbknjPWP9Gk/YVY15Wky1LpM/7fDyx9
         5LQA==
X-Gm-Message-State: AOJu0YwNhhUHVoNJ/go2mOZB6D3gRpiVT7n1AleNnYXr1VVPZeqad2hL
	ZnzUXCoDWru4SBHILAaFSmiRBxzUGR3/AKII/y5dTOWL/7Ig3jrmt5VIQZkrMGJtvt/I3omPdod
	K91UH
X-Gm-Gg: AfdE7cldFMeNKVenuQ/0ioaYBx+ItHDG9LsbfrFe3mhDxNUh1R4DNWC+NX4uOf/4z3b
	i98MBWoW+NRLY2Ld5bhtI8LAmXpUmHaesDgKboCdPUDB8nYLdTCMKqkINZtmpikupQsVwd1rRAE
	f5Ke1VybElZ7DVlh1+6NNjShDBDNlUmFkc9GgiTXZx71UD96dz7/jw1g7nCRBSFM3eWozhw8F9p
	tj4uRlPGdTc/Y0SZJRsGQjQWGigXliPN7jXXTK/uoa+eTutu2e07rwOHqERqH2l43JxXlduli3I
	ZUXX7anZALDibQ+qpIBfzE0l2VeB5CKxqDZY2KZ2gRmYbJSmcKx24WwpOfSHxXZnN7bRAYHEXtU
	v87JTj7y822D4+lEDvBo3vaF7F18EVt3QXwG2SngpCTM44RfLt39+x2HCjpY0XAF2MzF0DjDOTm
	d6petuGXVIgWSmNm7n2BYmMWqVHzLM9B+m31JL19apDLMOR7PObE8LpgR2/z5H2uXzcYxp4YC20
	C9hGJx9nkdLDVxvQQ3ePH8U+zY=
X-Received: by 2002:a05:600c:4f86:b0:490:ae52:499c with SMTP id 5b1f17b1804b1-4926086d056mr7939105e9.21.1782253624856;
        Tue, 23 Jun 2026 15:27:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 13/41] dpkg: Fix CVE-2026-2219
Date: Wed, 24 Jun 2026 00:26:12 +0200
Message-ID: <66055d7f179d0d838c2139d9d2399a968c6f6529.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239435

From: Shubham Pushpkar <spushpka@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=6610297a62c0780dd0e80b0e302ef64fdcc9d313
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-2219

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dpkg/dpkg/CVE-2026-2219.patch             | 47 +++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.22.0.bb     |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch b/meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch
new file mode 100644
index 00000000000..779ab924de6
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch
@@ -0,0 +1,47 @@
+From 6610297a62c0780dd0e80b0e302ef64fdcc9d313 Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Sat, 7 Feb 2026 00:57:55 +0100
+Subject: [PATCH] libdpkg: Terminate zstd decompression when we have no more
+ data
+
+We should be checking whether the input buffer is zero-sized, and then
+mark the stream as finished. Otherwise the zstd implementation does not
+detect that as an end of stream situation and we get stuck in an
+infinite loop spinning the CPU. This means the decompression process
+in dpkg-deb does not terminate, so no EPIPE gets generated and the
+other processes that are part of the unpacking do not stop either.
+
+Reported-by: Yashashree Gund <yash_gund@live.com>
+Fixes: commit 2c2f7066bd8c3209762762fa6905fa567b08ca5a
+Fixes: CVE-2026-2219
+Closes: #1129722
+Stable-Candidate: 1.21.x 1.22.x
+
+CVE: CVE-2026-2219
+Upstream-Status: Backport [https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=6610297a62c0780dd0e80b0e302ef64fdcc9d313]
+
+(cherry picked from commit 6610297a62c0780dd0e80b0e302ef64fdcc9d313)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ lib/dpkg/compress.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/dpkg/compress.c b/lib/dpkg/compress.c
+index adf26ea7..bf73affe 100644
+--- a/lib/dpkg/compress.c
++++ b/lib/dpkg/compress.c
+@@ -1070,6 +1070,11 @@ filter_unzstd_code(struct io_zstd *io, struct io_zstd_stream *s)
+ 	ZSTD_outBuffer buf_out = { s->next_out, s->avail_out, 0 };
+ 	size_t ret;
+ 
++	if (buf_in.size == 0) {
++		s->status = DPKG_STREAM_END;
++		return;
++	}
++
+ 	ret = ZSTD_decompressStream(s->ctx.d, &buf_out, &buf_in);
+ 	if (ZSTD_isError(ret))
+ 		filter_zstd_error(io, ret);
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
index 41f51235085..16162ca926f 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
            file://CVE-2025-6297.patch \
+           file://CVE-2026-2219.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"

