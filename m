Received: from mailrelay-egress7.pub.mailoutpod3-cph3.one.com (mailrelay-egress7.pub.mailoutpod3-cph3.one.com [46.30.211.246])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6727.1793974440966369879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:14:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=I3qewFs9;
 dkim=pass header.i=@berginkonsult.se header.s=ed1 header.b=VXwLFOH1;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.246, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793974439; x=1794579239;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=gJlfniiDtXk89vZ0zm1fQXjrPOGugAaEUb0yf2BxH/8=;
	b=I3qewFs9o1+P3sPj9T0pBHCcwYaAFdZcpFuOQqND9lFeZxbl2aNtGoPqjDs5Ff1tmSTfwj7qoDajV
	 B8kvq/FQUVlU3wgGhu+JLbqQuea2FdNCbMC2c9Zw5KIuK1lubv3VvkdbPSI+lwECKsQeWld1jqsOnP
	 r+EqN7CN1rxzLfQHetxLc4WrtRy1zMkHrsXp+qq24v8bGo6tMtgVYhnrr0Cq167vI2XHmEZnmA1zDa
	 x40nOi0bdhnbHGDlncAuXDv+dgSTr0TnKtNchg3BPD/f1RcRIbiUATC260it0q0yA4jLS/zuS2+y52
	 HrzNPxp/dPZoeTinnAjSln01HOh/ppA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793974439; x=1794579239;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=gJlfniiDtXk89vZ0zm1fQXjrPOGugAaEUb0yf2BxH/8=;
	b=VXwLFOH1UMLa5CeHtQO0jP8nlSSt+T+KbxbtllFIm5aKqgpHR4PHnlAgr5f6n2EwX6dyT9pQ9eWKo
	 axT9satBg==
X-HalOne-ID: 4ef3c086-d9ec-11f1-8922-1b46ed53ce32
Received: from pbkserver2.metrum.local (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 4ef3c086-d9ec-11f1-8922-1b46ed53ce32;
	Fri, 06 Nov 2026 14:13:58 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH 2/2] oe-selftest: usergrouptests: compare shadow files across package backends
Date: Fri,  6 Nov 2026 15:13:48 +0100
Message-ID: <20261106141348.2757557-3-peter@berginkonsult.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106141348.2757557-1-peter@berginkonsult.se>
References: <20261106141348.2757557-1-peter@berginkonsult.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249653
Content-Type: text/plain; charset="utf-8"

Build core-image-minimal with rpm, ipk and deb rootfs and check that
/etc/shadow and /etc/gshadow match per account. passwd/group are not
compared as dynamically allocated IDs depend on install order.

[YOCTO #14139]

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 .../lib/oeqa/selftest/cases/usergrouptests.py | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oeqa/selftest/cases/usergrouptests.py
index 69025a59aa..40e6e24606 100644
--- a/meta/lib/oeqa/selftest/cases/usergrouptests.py
+++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
@@ -56,6 +56,30 @@ class UserGroupTests(OESelftestTestCase):
         self.logger.info("Rebuild with other staticids")
         self.assertTrue(bitbake(' core-image-minimal'))
 
+    def test_shadow_files_match_across_package_backends(self):
+        # Test for YOCTO #14139
+        image = 'core-image-minimal'
+        backends = ('rpm', 'ipk', 'deb')
+        # Dynamic IDs and line order vary by backend: skip passwd/group, key by name
+        files = ('shadow', 'gshadow')
+        results = {}
+        for backend in backends:
+            classes = ' '.join(['package_' + backend] + ['package_' + b for b in backends if b != backend])
+            self.write_config('PACKAGE_CLASSES = "%s"\nIMAGE_INSTALL:append = " creategroup1"\n' % classes)
+            self.logger.info("Building %s with %s rootfs" % (image, backend))
+            bitbake(image)
+            etcdir = os.path.join(get_bb_var('IMAGE_ROOTFS', image), 'etc')
+            results[backend] = {}
+            for f in files:
+                with open(os.path.join(etcdir, f)) as fd:
+                    results[backend][f] = dict(line.split(':', 1) for line in fd.read().splitlines())
+
+        self.maxDiff = None
+        for backend in backends[1:]:
+            for f in files:
+                self.assertEqual(results[backends[0]][f], results[backend][f],
+                                 "/etc/%s differs between %s and %s rootfs" % (f, backends[0], backend))
+
     def test_useradd_depends_only(self):
         # Test that a recipe inheriting useradd with only USERADD_DEPENDS
         # (and no USERADD_PACKAGES) parses and builds successfully. [YOCTO #15863]
