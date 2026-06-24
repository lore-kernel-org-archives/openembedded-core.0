Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B519CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 11:26:25 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4749.1782300377501108600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 04:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Tkc24HUt;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c89fa656ea1so308031a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782300377; x=1782905177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lm0T80w/UT1wqYQuUlbQaV4H/WWWENf4zG2FHPMjbW0=;
        b=Tkc24HUtCpy8KreNaz4VAXFWdvD79OYpHa0RA7Befwsgpe6Nn5B2pOiPgpB9tL4zLI
         TkXsP9stycWLDnxlYL6uCxkIbfBGeknN24Dzlp53WxxHAapoOEgEduuNd/xVvFJEX/H4
         0yBN2ZvseEnkjs9fXgA5KewR5j/sAeHY4ks86SbD5x5TL+anpbgaVfLKCULU5S6SvhVY
         lGRHEOIk1k9Ky3MJeLmmFSt/1MMLbhJdt2P329TtsM41lkcJ6p2U6Wt4ppNQtA1meVYn
         I323CUd1iViRnb0dldHo5lYppuieu3Elc9Q9bSLh4B6/kaOYgOKT/b8lc9n+6sFaXIc6
         IYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782300377; x=1782905177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lm0T80w/UT1wqYQuUlbQaV4H/WWWENf4zG2FHPMjbW0=;
        b=gR0skTn0B5/2DiOrgEHLzN7SnTj66fJSYf2BJu1rMmkHmzT/T/hGZ/P9wssYT/Kbuw
         gNftFZIkwxPLFj5Kj+B8cN6sHGnd53p7mpIgdoYUO9Hylg+XtCpKmPDe4tzVWzE+ArsH
         asGk+QPLzfEkx8mmMPP0x+VF2RwnBRd4hGfw9pQVU1/qZBHZ9kmxeicvMXV5X1p3Zbwk
         epA/1DrXjEPrTdSM10x5pcsW5iWMOPOXe3BC5dZRjdl+Sf8mLyFHeLKQuV6zvBwvA2re
         jNClaWYLBHOLyw3PpleTKM/oCe33jqPu/W/2uZbwZPmLfdYoZOzOgFUWMzjnMq5n2r1K
         gdag==
X-Gm-Message-State: AOJu0Yz9H8ULzwZuyx0YuAkLBbkOFY9O0n4libsWaagWs7VU82ljYgXg
	5nLWsmC8KM50nz109+34+nWaoIJunZbj1obnwUhR6id6AcQaQzDJM0Lk3Jm9sIc29Jk=
X-Gm-Gg: AfdE7ckOm2GvRerUU+aXft51Ik9OmpIx+Do7e+GrYAETbZowUkW1tkACa/HraCsqKWR
	PhpXDrjuUTYlKik+37KJ9bbU49Bbsqs31YEWDemIZh5MMf6lH0dx+U6m7gcz9BEAst7rIsnqiQz
	y6YvcI/1Mx3xoFojBDg7PZfBI7rAq5RkP/GFlg5QeJxGKT6UrjUB2VYwBqBBrytqEeJQl3XIVXv
	VtDjoc6b+SW51Xsp66CrJuHKvdvaMaWeyjrCh/wMP7rxKkxNjsjk4Ts4OXvudSUo9rTCXPUFN0L
	BzkT0vtf96H2ClCGTCySIYXntPtIqS+E1KqtDgGbgqNt6fHeLTG7h3Q/qBRdCcOKBhMUCsptOR+
	TeEF1Mk+FrX9AECKkis9TON6tMj+WpaPeQ8N+H/80ZFZix39QGneCCu+10TXitGQii9v9GuwLTU
	FDolFZhzgS0XxLxQWAjS5CyamfAD6O7tqxNuYrObKz2Q6+zCl4qZJmjgQQPg==
X-Received: by 2002:a05:6a21:164a:b0:3b4:701f:a0dc with SMTP id adf61e73a8af0-3bc530b49b7mr22165935637.26.1782300376584;
        Wed, 24 Jun 2026 04:26:16 -0700 (PDT)
Received: from naduvan.timesys.com ([122.178.167.70])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc5a1d07csm12105086a12.24.2026.06.24.04.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 04:26:16 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [PATCH v2] oeqa/selftest/devtool: add regression test for kernel cfg in subdirs
Date: Wed, 24 Jun 2026 16:56:08 +0530
Message-Id: <20260624112608.1140151-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618091736.2319572-1-sivakumar.bs@gmail.com>
References: <20260618091736.2319572-1-sivakumar.bs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 11:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239489

Add test_devtool_modify_kernel_cfg_subdirs which exercises a
kernel-yocto recipe whose .scc file and the .cfg fragments it
references (via "kconf"/"patch" lines) live in separate
FILESEXTRAPATHS subdirectories (bsp/ and cfg/). This reproduces the
layout from [YOCTO #15169], where devtool modify previously failed
with FileNotFoundError while trying to copy the .cfg files: the path
was computed as dirname(<.scc file>) + <cfg filename>, which broke
whenever the .cfg file was not in the same directory as the .scc file
that references it.

The offending copy logic was removed in ce8190c519 ("devtool: Drop
oe-local-files and simplify"); this test guards against a regression.
Verified the test fails on d9328e3b0b (pre-fix, FileNotFoundError)
and passes on current master.

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
v2:
 - Use 'with tempfile.TemporaryDirectory()' for the devtool extract dir
   (Ross Burton review).
 - Keep tempfile.mkdtemp() + track_for_cleanup() for the created layer's
   parent dir rather than a 'with' block: OESelftestTestCase.tearDown()
   runs the queued teardown commands (including 'bitbake-layers
   remove-layer') before deleting track_for_cleanup() paths, so a
   body-scoped 'with' would remove the layer directory before
   remove-layer runs and leave bblayers.conf pointing at a missing
   layer. Verified by an oe-selftest run: teardown failed with a 'with'
   block, clean with mkdtemp()+track_for_cleanup(). Added '|| true' to
   the layer's remove-layer teardown, matching existing devtool tests.
 - Drop the 'bitbake -c cleansstate' call (Ross Burton review); the test
   only does 'devtool modify' so it was unnecessary.
---
 meta/lib/oeqa/selftest/cases/devtool.py | 67 +++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5a6f38f8d5..b2cd13e9a5 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1085,6 +1085,73 @@ class DevtoolModifyTests(DevtoolBase):
         # Try building
         bitbake(testrecipe)
 
+    def test_devtool_modify_kernel_cfg_subdirs(self):
+        """
+        Regression test for YOCTO #15169: devtool modify of a kernel-yocto
+        recipe must not fail when an .scc file and the .cfg fragments it
+        references (via "kconf"/"patch" lines) live in different
+        FILESEXTRAPATHS subdirectories. Pre-fix, devtool computed each .cfg
+        file's path as dirname(<.scc file>) + <cfg filename>, which broke
+        whenever the .cfg file was not in the same directory as the .scc
+        file that references it.
+        """
+        testrecipe = 'virtual/kernel'
+        bb_vars = get_bb_vars(['PN', 'FILE'], testrecipe)
+        realrecipe = bb_vars['PN']
+
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake -c clean %s' % realrecipe)
+
+        # The created layer must outlive the 'bitbake-layers remove-layer'
+        # teardown command below: tearDown() runs the queued commands first
+        # and only then deletes track_for_cleanup() paths, so mkdtemp() +
+        # track_for_cleanup() removes the directory after remove-layer has
+        # run. A 'with tempfile.TemporaryDirectory()' here would instead
+        # delete it when the test body returns, i.e. before tearDown, leaving
+        # bblayers.conf pointing at a missing layer.
+        tempparentdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempparentdir)
+        # bitbake-layers create-layer refuses to run if the target directory
+        # already exists, so use a not-yet-created subdirectory of tempparentdir
+        layerdir = os.path.join(tempparentdir, 'meta-selftest-kernelcfgsubdirs')
+        runCmd('bitbake-layers create-layer %s' % layerdir)
+        runCmd('bitbake-layers add-layer %s' % layerdir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s || true' % layerdir)
+
+        recipedir = os.path.join(layerdir, 'recipes-kernel', 'linux', realrecipe)
+        bspdir = os.path.join(recipedir, 'bsp')
+        cfgdir = os.path.join(recipedir, 'cfg')
+        os.makedirs(bspdir)
+        os.makedirs(cfgdir)
+
+        # .scc lives in bsp/, references .cfg files that live in cfg/ -
+        # this is the exact split reported in the bug
+        with open(os.path.join(bspdir, 'selftest-cfgsubdirs.scc'), 'w') as f:
+            f.write('kconf hardware selftest-spi.cfg\n')
+            f.write('kconf hardware selftest-clock.cfg\n')
+        with open(os.path.join(cfgdir, 'selftest-spi.cfg'), 'w') as f:
+            f.write('# CONFIG_SPI_SELFTEST is not set\n')
+        with open(os.path.join(cfgdir, 'selftest-clock.cfg'), 'w') as f:
+            f.write('# CONFIG_COMMON_CLK_SELFTEST is not set\n')
+
+        appendfile = os.path.join(layerdir, 'recipes-kernel', 'linux', realrecipe + '_%.bbappend')
+        with open(appendfile, 'w') as f:
+            f.write('FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/cfg:${THISDIR}/${PN}/bsp:"\n')
+            f.write('SRC_URI:append = " file://selftest-cfgsubdirs.scc"\n')
+            f.write('SRC_URI:append = " file://selftest-spi.cfg"\n')
+            f.write('SRC_URI:append = " file://selftest-clock.cfg"\n')
+
+        with tempfile.TemporaryDirectory(prefix='devtoolqa') as tempdir:
+            # Pre-fix (kirkstone-era), this raised FileNotFoundError while
+            # trying to shutil.copy2() selftest-spi.cfg/selftest-clock.cfg
+            # from inside bsp/ (the .scc's directory) instead of cfg/ (where
+            # they actually live).
+            result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+            self.assertNotIn('FileNotFoundError', result.output)
+            self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'),
+                               'Workspace directory not created')
+
     def test_devtool_modify_virtual(self):
         # Try modifying a virtual recipe
         virtrecipe = 'virtual/make'
-- 
2.34.1


