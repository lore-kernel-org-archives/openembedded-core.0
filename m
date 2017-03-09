Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9D4A471A88
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 17:01:05 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id t189so60980685wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 09:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=A02tT0Iy/K/qU/fScmXt6rkVwaHj2/P2s6i41u/miqg=;
	b=Tof0pZ6dtYH8mfXRYoo/T/ATuFbPFTIt6gBEzK+cNBk4zab0WeRrsuxpFhmc/pMRe7
	/PHXqTpVvtKFoIthhg1uttzaZNHD+XleckMNDjO8/uNZPg1B4LfEpNwbLD4cgGu3TfuP
	TrH9sneASsegn8QaThXrEumISJ9bS0JEOr7zE91xnl+fZcxZGiKCZYLCBbOsM8JBQQx/
	YVtQTQa3BzFGYFJairAYPwY3Jal78nsv/kpj0V6ZMxVf9wWTVa+QM/cKBw0AyktroO2k
	fhCKmY8nVotEUytE0FcoEE5DtLNT4hu8DqsZFYtFIHF9ORh76wzeMaalcXRI/kGJGBrF
	OoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=A02tT0Iy/K/qU/fScmXt6rkVwaHj2/P2s6i41u/miqg=;
	b=S3SzxKqTLdz5R5NgiZ6JDNmW+CWUrNfYJGnK/UD+r7iJKRTxTUORiktrfYiCY1SJhx
	yKegDsv6VEfjH2vG/Wcux3xkYhOyt6BLuwkXtwtx7SfFnJrVKFy1piR5NtYAKp+GDY1b
	D7zxAC0vMCroF/gxTNQNDNuXPFKQ0FA3Q21VUHwLgQa0xD40MMdyPkinUk4bxkONuo4p
	m+roLE4LlsMk1p8gH6LaJBAA7P2ByVE8yKwxS8plAijHQ4Ro/WZNp6Fj6jEBmkJJLiBb
	v01hUKkgadRZ33jzj4C0qv+XA/cf7Bg8TbZDMHu2kaTlpmCcnI0JrnfDrMnO02u4rBPV
	bzkQ==
X-Gm-Message-State: AMke39n3AbdabFS965M730bB02OtdAs1xZZDD1kWdaQwUa9H76YpKalNpHSoWJbPnYwILPZw
X-Received: by 10.28.57.84 with SMTP id g81mr27859258wma.41.1489078865884;
	Thu, 09 Mar 2017 09:01:05 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	n59sm8950412wrb.54.2017.03.09.09.01.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Mar 2017 09:01:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 17:00:55 +0000
Message-Id: <1489078855-1752-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] classes: add devupstream class
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
X-List-Received-Date: Thu, 09 Mar 2017 17:01:06 -0000

This class lets you use BBCLASSEXTEND to add a variant of the recipe that
fetches from an alternative URI (such as git:) instead of a tarball.

For example:

 BBCLASSEXTEND = "devupstream:target"
 SRC_URI_class-devupstream = "git://git.example.com/example"
 SRCREV_class-devupstream = "abcd1234"

This variant will have DEFAULT_PREFERENCE set to -1 so it needs to be selected
to be used, and any development-specific tweaks can be done with the
class-devupstream override, for example:

 DEPENDS_append_class-devupstream = " gperf-native"

 do_configure_prepend_class-devupstream() {
    touch ${S}/README
 }

It currently only supports creating a development variant of the target recipe,
not native or nativesdk.  The BBCLASSEXTEND syntax (devupstream:target) was
chosen so that support for native and nativesdk can be added at a later date.

Support for other version control systems such as subversion is limited, as
bitbake's automatic fetch dependencies on for example subversion-native are not
generated.

[ YOCTO #10215 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/devupstream.bbclass | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta/classes/devupstream.bbclass

diff --git a/meta/classes/devupstream.bbclass b/meta/classes/devupstream.bbclass
new file mode 100644
index 0000000..7d4113f
--- /dev/null
+++ b/meta/classes/devupstream.bbclass
@@ -0,0 +1,48 @@
+# Class for use in BBCLASSEXTEND to make it easier to have a single recipe that
+# can build both stable tarballs and snapshots from upstream source
+# repoistories.
+#
+# Usage:
+# BBCLASSEXTEND = "devupstream:target"
+# SRC_URI_class-devupstream = "git://git.example.com/example"
+# SRCREV_class-devupstream = "abcdef"
+#
+# If the first entry in SRC_URI is a git: URL then S is rewritten to
+# WORKDIR/git.
+#
+# There are a few caveats that remain to be solved:
+# - You can't build native or nativesdk recipes using for example
+#   devupstream:native, you can only build target recipes.
+# - If the fetcher requires native tools (such as subversion-native) then
+#   bitbake won't be able to add them automatically.
+
+CLASSOVERRIDE .= ":class-devupstream"
+
+python devupstream_virtclass_handler () {
+    # Do nothing if this is inherited, as it's for BBCLASSEXTEND
+    if "devupstream" not in (d.getVar('BBCLASSEXTEND') or ""):
+        bb.error("Don't inherit devupstream, use BBCLASSEXTEND")
+        return
+
+    variant = d.getVar("BBEXTENDVARIANT")
+    if variant not in ("target"):
+        bb.error("Pass the variant when using devupstream, for example devupstream:target")
+        return
+
+    # Develpment releases are never preferred by default
+    d.setVar("DEFAULT_PREFERENCE", "-1")
+
+    uri = bb.fetch2.URI(d.getVar("SRC_URI").split()[0])
+
+    if uri.scheme == "git":
+        d.setVar("S", "${WORKDIR}/git")
+
+    # Modify the PV if the recipe hasn't already overridden it
+    pv = d.getVar("PV")
+    proto_marker = "+" + uri.scheme
+    if proto_marker not in pv:
+        d.setVar("PV", pv + proto_marker + "${SRCPV}")
+}
+
+addhandler devupstream_virtclass_handler
+devupstream_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
-- 
2.8.1


