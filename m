Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 219A7772A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:41:49 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so79740930pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=lQnoPumX5CNeHSH0u4YHczH03oFgtoGExDtNwgeLNtQ=;
	b=CJs4Y9G37FqPc1peFR6O2/v+KKTCX1pIq+yCPRAHKqb259hJ14/bX0FS4oKat3bZ9Y
	qJj3aA39rnHftolz16BlPBKPm04k9hkZV5IOBcxd+Jcfp84kpmv0D582gCgy+I1rcyhv
	NrYb6gsw/v0LiTb6PN9Pk3SBhvpCrdpjwuwHfg6nk6qzx8wNyFzeg+W06vzucgt5t3Ui
	ShHZ9oJhcejF8P39rAvlFVogRh4Pn93LUOcshPcAe4Qk4smSRqMLfRUzi04KhuWKF8in
	p3zc/D2gCqQ9iE7aii6zly2xe/2aboE+9RIZw+qZ4M85zaQgd9mzMm7YW9/rgcMrGT1T
	/05g==
X-Received: by 10.68.215.67 with SMTP id og3mr27248324pbc.30.1447371709684;
	Thu, 12 Nov 2015 15:41:49 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	it10sm16733638pbc.14.2015.11.12.15.41.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:41:48 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:41:30 -0700
Message-Id: <05b7cc8c957a9756e7af964a09bc2a89e0aedd9f.1447371049.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
References: <130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371049.git.chris_larson@mentor.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/4] systemd: add myhostname to nsswitch.conf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 23:41:49 -0000

From: Christopher Larson <chris_larson@mentor.com>

We don't need nss-myhostname on systemd systems, because systemd already
provides myhostname, but we weren't configuring nsswitch to use it. Being able
to resolve the hostname is useful for a number of different applications, so
enable it using the same postinst/prerm bits which are in nss-myhostname.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 18c2448..20515f5 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -397,6 +397,18 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
+pkg_postinst_${PN} () {
+	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
+		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
+		-i $D${sysconfdir}/nsswitch.conf
+}
+
+pkg_prerm_${PN} () {
+	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
+		-e '/^hosts:/s/\s*myhostname//' \
+		-i $D${sysconfdir}/nsswitch.conf
+}
+
 pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
 		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
-- 
2.2.1


