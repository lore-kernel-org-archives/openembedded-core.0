Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E86C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 11:02:40 +0000 (UTC)
Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com
 (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web11.29908.1661252557309119531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 04:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=aCWB1j3b;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=25v8S8bFUS1rDIFrSbdwINWKZR8AdtG5Pr9ssZgdCFg=;
	b=aCWB1j3bCe+3CMzXFMRjq+vyHmeSShuQthFcuyPq+3L/wPgEF6igg50/bmXOuC6BLblfnLxRNch4y
	 6x45t96mK30QhQTQ88JyKXF6aRL3P76XBkYhXYviEws2t4Isu4JscRnLk46IZBEDK+JknYitax9AfV
	 xtmKEU4KVdgbsWFeRlDzLZsNPaUwYN+jpfP04dCllOUrkN4VwE0QzHj11h+mCeMCEVMyUj+Hy7ufck
	 1ur4hmjb2uDrPRHW1+mY6SykfJl3at3zPCw0ot3qnE21wCcpSxO/Cd1B4zUYhB0bsWY4iFysGVIKU+
	 4RGNuCg9F3gH76Cl2pcTQdBo0AoqPGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=25v8S8bFUS1rDIFrSbdwINWKZR8AdtG5Pr9ssZgdCFg=;
	b=xQ7rExONyDYCWk4OoJU/sQlq4pELW7SdvlvhUZ2fl9JgeRwayy+PE1zSdKKXAFGxW1MTA4Ag0gsxQ
	 uewE7puBw==
X-HalOne-Cookie: 22219424ef5754c8e2d75e84c35bd1fab4da19db
X-HalOne-ID: 15f5ec8f-22d3-11ed-a6d0-d0431ea8a283
Received: from pbergin-7420.localdomain (unknown [83.218.73.98])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 15f5ec8f-22d3-11ed-a6d0-d0431ea8a283;
	Tue, 23 Aug 2022 11:02:34 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] rust-cross-canadian: rename shell variables for easier
 appends
Date: Tue, 23 Aug 2022 13:02:27 +0200
Message-Id: <20220823110227.68348-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 11:02:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169701

Make unique shell variable names for cargo and rust
setup scripts. This change will make it easier to append to the
scripts in a bbappend file by using the variable for the script.
Before this change it was only possible for the last script as
they shared the same variable name.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 77d45a37a31..7bf75a4712e 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -37,17 +37,17 @@ do_install () {
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
-    ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
-    cat <<- EOF > "${ENV_SETUP_SH}"
+    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
     chown -R root.root ${D}
 
-    ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
-    cat <<- EOF > "${ENV_SETUP_SH}"
+    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
         # Init the default target once, it might be otherwise user modified.
-- 
2.34.1


