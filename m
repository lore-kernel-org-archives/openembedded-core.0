Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id 57C447DD44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 19:34:17 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id z3so955990iog.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 12:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=n3b/ilaR9b7g2kKFfvuk0c0J5FbOg5ueEuJmZEZV7AU=;
	b=iFfsOXaHoP5x6CQX6vLQClxiDY2AOXo/dWO6+/kTUuPp4woXknE8L+fsXrHApfm5Y/
	sZk7TtqpE71ul8uYzA/CmOAc+XDyVYhSODSsy221iI72GtDIn4nJ56PfF2SuYje4Nwcc
	gMZznGVvBOSGaf/cWwsYsFaZaq++/aVZ6YFj3jJQK8AQA3whMM6oPBm/DsNVUYoUz+5G
	2VmDaHiJsLPVXmlveWBT51az9vMIxeAMPF4OcOa55bfP7DdheIpQnJKFyGu6BqcOX/HP
	iShnAVPUIIH7hQF39F04IoK2/YQ4JP/iqiF4HJVt2ddJrVk+EYBooFqUJqNTc5xYrqbF
	esTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=n3b/ilaR9b7g2kKFfvuk0c0J5FbOg5ueEuJmZEZV7AU=;
	b=KCBd9huh39aCD7A9z60LUk/44RhkGLZadVMTKMrcAuMYr72xXSm16tGSEqp3LotDQG
	A72M0wgI0WCr5lxw72dr/cO/9qq6FOJ+T43+DKwZBTSCck/54Ije5xlLvboXQXX/PLlR
	SelDAB7pioHXK3WgDAhy4l3RnYugaayOYEdNABaCqO+3EtwNQ1iPo/bQzC+TpwCFXOGV
	DsTka5b7tcuyjCovEeTOKSBWE0OhKtWQtCrcSC2Lna6gv4JO2FN/Rf1nv2QQkJb+ipFb
	B8cOGXBEVe8d3Ny5wGLfb7rmwlYfJRgV+wAORvi8CdmVfYRpnoXundHsOT8hQ3kip1+U
	XGGg==
X-Gm-Message-State: APjAAAVrW10Yce85PteHLb1tVB2DgeIMIWkKpvhp7bQ+v9yJsSfl8T89
	clQ/RNGi+IQ0M9XsbAdIow9suow8
X-Google-Smtp-Source: APXvYqye3ODZKwNEQQr6hwduWdrP4uW7EBJyNds8ZA4UgT4ul/4qOXs6uG0jJo8PlyTqIShr2guM5A==
X-Received: by 2002:a02:a595:: with SMTP id b21mr527145jam.28.1566934457912;
	Tue, 27 Aug 2019 12:34:17 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id 8sm47288ion.26.2019.08.27.12.34.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 12:34:17 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 14:33:45 -0500
Message-Id: <20190827193349.23254-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827193349.23254-1-JPEWhacker@gmail.com>
References: <20190827193349.23254-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] oeqa: reproducible: Cleanup reproducible build
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
X-List-Received-Date: Tue, 27 Aug 2019 19:34:17 -0000
Content-Transfer-Encoding: 8bit

Cleans up the output from the reproducible build before building to
ensure consistent results. Note that the output put is purposely left
after around after the build so that non-reproducible packages can be
diffed.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 6dc83d28474..74d94fb20dd 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -132,16 +132,23 @@ class ReproducibleTests(OESelftestTestCase):
         bitbake("diffutils-native -c addto_recipe_sysroot")
         diffutils_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffutils-native")
 
+        reproducible_tmp = os.path.join(self.topdir, 'reproducible', 'tmp')
+        if os.path.exists(reproducible_tmp):
+            bb.utils.remove(reproducible_tmp)
+
         # Perform another build. This build should *not* share sstate or pull
         # from any mirrors, but sharing a DL_DIR is fine
-        self.write_config(textwrap.dedent('''\
-            TMPDIR = "${TOPDIR}/reproducible/tmp"
+        self.write_config((textwrap.dedent('''\
+            TMPDIR = "%s"
             SSTATE_DIR = "${TMPDIR}/sstate"
             SSTATE_MIRROR = ""
-            ''') + common_config)
+            ''') % reproducible_tmp) + common_config)
         vars_test = get_bb_vars(capture_vars)
         bitbake(' '.join(self.images))
 
+        # NOTE: The temp directory from the reproducible build is purposely
+        # kept after the build so it can be diffed for debugging.
+
         for c in self.package_classes:
             package_class = 'package_' + c
 
-- 
2.21.0


