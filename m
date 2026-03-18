Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7861088E59
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 23:31:14 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28203.1773876674119473579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 16:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=VthXKHad;
 dkim=pass header.i=@valla.it header.s=default header.b=IeHbV1el;
 spf=pass (domain: valla.it, ip: 185.56.87.13, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com; s=arckey; t=1773876674;
	 b=QglUueik1lqinZemiB953xs10T3xnb7Tk0mEEFXitM3znHH3s/FjXfEedcNrrGHaCMs+GUwuhB
	  joScigyQ+kPOw3aCNl/3U/MZS7jDBVKgBpAi+vBY2lPwCoA1HwuxP+2XbqaOrvZAeFDGD7mUUZ
	  t0h3ntTIfr/riVt8HNbXnkpH44CRRNzlwLVcEwmb/HnYsrpNCIeZS/HDQDBgBm/2NnfVUe4zmo
	  f4omYDlhdq3j8P/3Hd8DjVEc/ocj7XSeJYkpJ9lulJI8obF2BYTLPHZyRq8BKAgH/R0lbBjhVi
	  A25B99yMFYHrJ/Axow1ZRLg8MOVGuNgXLaDqeKPL7BCK9Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com; s=arckey; t=1773876674;
	bh=XnwhN8nBQEQvPGAop2qSXD069+U9GM/OieiHxzF0Zsg=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=TKUEFlyhSCP3Sbtdj80KqsoalFA6drYArmkgCtnzvCzztHVhygdoJLTX8T+UbW2E8dXMFZ5WFr
	  +37u+Vt47Wbcth/RVM4mSyM2SOS1E4NM4iEGflhtCDe0pgTpP4giGF9rdeI8f+29xHEoLk5Sgg
	  zSqg7LzWOLIQFcQqmN1x+TGmO8/2i0J2wGI6O9Ptb0y/VRiXidJF5RugX0h5otjL9sZQMJdfg8
	  h7aHQZeCY2De+66Sx9X4R7zBj+F9zXPBy1ViuSROt/FLit5sl/qowMNw7LCqurqwkgvYjoRCbL
	  ss88w/MoxuT4coXC8j0IXdRb3UCPk5TT3c9XPsfO3el6aw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=phKlSbE6Ix2kPngK6PvnqbX74RU/qo6blhBEpSsaX+E=; b=VthXKHadPPA3evMNHeduISSfiY
	GvnkfUnUS8LLAPFWaSs/8U7S0+j+2sOC+BoILmlkJq1lacIAwjxqPO3fdwzE6k6Tkqx3Wd4L/7Q6I
	Rj4Yz3D1aaAfBJeZilO42gD9m6EdA0uOHL69Gvo9f7XcXrSeXr0KEwqHNwHPBEyYO3Ps=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w30Lx-00000002v0p-42Lu
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Mar 2026 23:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=phKlSbE6Ix2kPngK6PvnqbX74RU/qo6blhBEpSsaX+E=; b=IeHbV1elM45Ms/djQKAnkIbZ8t
	W/YHr7iVW4/68Gp6ubWatyO7HCFBXkRLQIbg1YEEC3tyO9dni9n0rRtBDfSRxTOKkILnh1USOQoBS
	YZjB2tgXzkXXDCf+S9GfLKlF+cpcDEgaHuShfyvvFOIlSI5jQKy5UbHWTs5wXe9khh+Q=;
Received: from [82.57.88.19] (port=60381 helo=[192.168.178.43])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w30Ls-00000000OEU-0ddt;
	Wed, 18 Mar 2026 23:31:00 +0000
From: Francesco Valla <francesco@valla.it>
Date: Thu, 19 Mar 2026 00:30:51 +0100
Subject: [PATCH RFC 3/4] recipes-test: add bootconfig-test recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-bootconfig-v1-3-a4d467c3f0ba@valla.it>
References: <20260319-bootconfig-v1-0-a4d467c3f0ba@valla.it>
In-Reply-To: <20260319-bootconfig-v1-0-a4d467c3f0ba@valla.it>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Francesco Castagnotto <fcastagnotto@linux.com>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=francesco@valla.it;
 h=from:subject:message-id; bh=XnwhN8nBQEQvPGAop2qSXD069+U9GM/OieiHxzF0Zsg=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJm7TTctrRFPmuvoX7DJti7z5IZ2+3Pvd0l6hEZIznpwb
 U6AxpSLHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBEQkMZGfa83raIdfJ9Xq1j
 6x998E6d90nmit+teTczlUPuHFhoM92c4X+t+Z//ibP3zA4PvjU97l+Kl1oXn2TK4YaEqFN3Alt
 nfWYCAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 9248a1904e893a0b8d21d0f90a482c2f
X-AntiAbuse: ID - 9248a1904e893a0b8d21d0f90a482c2f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w30Lx-00000002v0p-42Lu-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 23:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233449

Add a test recipe deploying a fixed bootconfig source file to
DEPLOY_DIR_IMAGE, to be used in tests that expect a bootconfig to be
available.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 .../recipes-test/bootconfig/bootconfig-test.bb       | 20 ++++++++++++++++++++
 .../bootconfig/bootconfig-test/bootconfig-test.txt   |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/meta-selftest/recipes-test/bootconfig/bootconfig-test.bb b/meta-selftest/recipes-test/bootconfig/bootconfig-test.bb
new file mode 100644
index 0000000000000000000000000000000000000000..0cf74fa93652009466220f21001923a81d628a2e
--- /dev/null
+++ b/meta-selftest/recipes-test/bootconfig/bootconfig-test.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Test bootconfig"
+DESCRIPTION = "This generates a dummy bootconfig to be used to for testing."
+LICENSE = "MIT"
+
+SRC_URI = "file://bootconfig-test.txt"
+
+EXCLUDE_FROM_WORLD = "1"
+ 
+inherit deploy nopackages
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+deltask do_stash_locale
+deltask do_install
+deltask do_populate_sysroot
+
+do_deploy() {
+    install -m0664 ${UNPACKDIR}/bootconfig-test.txt ${DEPLOYDIR}/bootconfig-test.txt
+}
+addtask deploy after do_unpack before do_build
diff --git a/meta-selftest/recipes-test/bootconfig/bootconfig-test/bootconfig-test.txt b/meta-selftest/recipes-test/bootconfig/bootconfig-test/bootconfig-test.txt
new file mode 100644
index 0000000000000000000000000000000000000000..c194018b0bd0e225aaf01a49dff78fcaebe8a7d4
--- /dev/null
+++ b/meta-selftest/recipes-test/bootconfig/bootconfig-test/bootconfig-test.txt
@@ -0,0 +1,6 @@
+kernel {
+  root = 01234567-89ab-cdef-0123-456789abcd
+}
+init {
+  splash
+}

-- 
2.53.0


