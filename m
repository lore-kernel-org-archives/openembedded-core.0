Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A0DC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:34:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7841.1787733261312334685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Nchf0xq1;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A5D711A182B
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B56C604EC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5285011C7AC5A;
	Wed, 26 Aug 2026 10:34:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Nk+9aa1tYXhznfC4WTTgT/GD5XNn7V8F6j+d4XZmaAk=;
	b=Nchf0xq1aBKbHZIVjzJD0/F4wwHIhJE47QfDMgHtFOtnC0WsPnBiXWWy1LFp1PQIUtzMvw
	xKJHMr0GUkW7pORZaM48WNiXUU0jJHnm3qLFHTiuQ69oXIjWobSDBVseiTxvBzeVOrGQ5B
	cZjdDpncKhLhFsfMlUexeWkxGYglwr5Oqd5TyaFdJMmFiPb5HPoeIUyO5tnS43RKOsaCKh
	3tFNlCxgmc7OSLQ6qGWEzgk5AkluSuL9idt4NO12KO0oGtU5aUiarL2OrDQRYEeZ2JBb3O
	icXJrPvW2yz4dsNyK7XZ2W7ySyHH7SFHCo/0itcn9D6pOnmfl6TpxzIr/1ycXg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 26 Aug 2026 10:33:46 +0200
Subject: [PATCH 7/8] python3-uv-build: upgrade 0.12.5 -> 0.12.6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mathieu-updates-20260826-v1-7-4082bbc152f2@bootlin.com>
References: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
In-Reply-To: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787733232; l=3841;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=8ISsmiac8YQeGFw7gKeaVkjuRHdEmbaqH41HjgL3mgQ=;
 b=iCNtj1m66g2QkjbJMHIanMsP12FiXovXbNbidiVIb+vxnA1UeQKSRYvYES+kCMB55J8ACPMIP
 bju6SX6NnIFB0IKcs3EHKTk2icSvoLPEV6US67+BlwPnESbS8QOFrOG
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244375

Changelog:

Python
- Update CPython to use OpenSSL 3.5.8 and libffi 3.4.8 #21295)

Enhancements
- Report cache-cleaning space savings from filesystem block allocation and avoid double-counting hard links (#21261)
- Limit warnings about unbounded uv_build requirements to source-distribution builds (#21078)
- Display byte counts below 1 KiB without a fractional part (#21237)

Preview features

- Add uv workspace metadata --sync --exact to remove packages outside the selected resolution (#21117)
- Add the artifact-hash-filtering preview feature to make uv pip compile --generate-hashes honor --only-binary and --no-binary (#21235)
- Respect package-specific exclude-newer cutoffs when uv check selects its ty executable (#21227)
- Preserve virtual-environment hints from tar-codec source-distribution errors when the base interpreter is outside a bin directory (#21146)

Performance

- Enable profile-guided optimization for Linux x86-64 release binaries (#21001)
- Enable profile-guided optimization for Windows x86-64 release binaries (#21003)
- Enable profile-guided optimization for macOS ARM64 release binaries (#21002)
- Enable profile-guided optimization for Linux ARM64 release binaries (#21004)
- Speed up syncing projects with many activated conflict items by reusing their encoded representation (#21148)

Bug fixes

- Allow explicit uv build and non-editable first-party workspace packages when no-build is enabled (#21294)
- Reuse configured index credentials during uv tool upgrade when the tool receipt references the same index (#21275)
- Ensure full 40-character Git commit pins resolve to the requested object instead of a SHA-named branch (#21224)
- Prevent TLS segfaults in riscv64 musl release binaries (#21158)
- Preserve dependencies selected by recursive extras when markers mix production and extra conditions (#21181)
- Preserve version constraints from transitively referenced recursive extras (#21209)
- Resolve repository-relative Git archive dependencies inside the checkout during the initial uv sync (#21264)
- Return an error instead of panicking when a bearer token cannot be encoded as an HTTP header (#21282)
- Do not misclassify package URLs ending in .py as local script paths (#21144)
- Use directory creation times consistently across libc implementations for directory cache-keys entries (#21137)
- Promote human-readable sizes to the next unit at rounding boundaries (#21136)

Other changes

- Add Python 3.15 release-candidate Docker images (#21293)
- Raise the minimum supported Rust version to 1.96 and update the repository toolchain to Rust 1.98 (#21258)

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-uv-build_0.12.5.bb => python3-uv-build_0.12.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.5.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.6.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.5.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.6.bb
index f208c1318bff..de84e8d5ad0a 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.5.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "0fd12723392fcb697c6512e1cbdbd4e5d30af4702578700c472a6d1a0044c71c"
+SRC_URI[sha256sum] = "4756f1771d342ff8ff50b529ae23c58d58f14f097c243ca50d3778d0a23d24f0"
 
 require ${BPN}-crates.inc
 

-- 
2.47.3


