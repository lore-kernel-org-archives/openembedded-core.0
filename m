Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55648C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 15:13:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.8354.1665760380239661215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Oct 2022 08:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zsmh3/ml;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so3752772wmq.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LoB4XLncQqUS6qBd0Sv1AOxr7FiJsNVlNmW2YJFPfk=;
        b=Zsmh3/mlxjeZvhMG5rE05wganGXwC2R6CUQujUABemcfOu+Fe6bjf6lntxWWYS49lZ
         fJVUDbliGdDcd9cnceW/5J3MQHzwLir+kxy2KVBUF5yhTQNotkuo2Lw/ro+O2Yg7BOVJ
         35VdvyLGU+cFlw5rJepwm0t9RmEkMF3MHhGWfGd9h6qbWyCs0EzDCIvvoZROP6I5oEfO
         lFMNeXazEiLGQxAbZfkbb4HZiHktq6a2spk0c6/hrmJDTmsOuB3p2uINlEYy1hs2pnAa
         /U2v2lNUqbpLnH2qCjN5/M3qUssjbDblfL2qcttXQKL5qT3Np7q6A8r+6SfUAiFHDRyd
         ejTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LoB4XLncQqUS6qBd0Sv1AOxr7FiJsNVlNmW2YJFPfk=;
        b=x6SqKKzVoPy97+iGJeGwMP4BV+FLUT4NKBDJW1++lUg+JkKs/85g9KiyEc9Yq3VO1K
         SDyTI70U4D9ZCpvx3Yr0XzYJxgNEE317YdwrhIZjXIYGhTGkepdqx8Re59zijXF2VBhQ
         pziRQki3dKAgnKJ3v878D8dsO6KuNr1bXhjaX5ztkFFoBrvFHXekutORzRSLqCDTJrXw
         aw82UPpR6zhfa6hdCu58CaMFnJwhSUpeTGhvd9TTx9A6jHsvP2W4UZ2IcVwtVHuHgABC
         epQ3WcK24FFxpKTJrPisB7Qu/l4z2mSqXSXUGojm3V+ije+XWsZnUuyulmBS0fbwRzWD
         KOTA==
X-Gm-Message-State: ACrzQf3FpnLYhjiywR/12n47F9HQsi6fnqQ0fbVbvPAg6NgVy8pSgbvt
	Nm4tkkFk/UaB9w72yhkgMLBUnpmvAI+saUBS
X-Google-Smtp-Source: AMsMyM4jpPiD4hSqqS9s+N0dXSSRglthpgqhyFtlO199kGlr4EDQgyhKuObTt+TIMEc5dxsJKFmZLw==
X-Received: by 2002:a05:600c:1d1a:b0:3c6:d715:2d69 with SMTP id l26-20020a05600c1d1a00b003c6d7152d69mr4022871wms.145.1665760378534;
        Fri, 14 Oct 2022 08:12:58 -0700 (PDT)
Received: from fio.lan (11.77.115.89.rev.vodafone.pt. [89.115.77.11])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c1c1300b003c6c1686b10sm8074146wms.7.2022.10.14.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:12:56 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2 2/2] archiver: avoid using machine variable as it breaks multiconfig
Date: Fri, 14 Oct 2022 16:08:33 +0100
Message-Id: <20221014150832.241817-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221014150832.241817-1-jose.quaresma@foundries.io>
References: <20221014150832.241817-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 15:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171733

From: Jose Quaresma <quaresma.jose@gmail.com>

STAGING_KERNEL_DIR uses the MACHINE name so it breaks the multiconfig
and in this cases it will run the shared recipes twice, one for each
machine.

STAGING_KERNEL_DIR it's been introduced in commit 5487dee2e1

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/archiver.bbclass            | 2 +-
 meta/lib/oeqa/selftest/cases/archiver.py | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 0710c1ec5e..4049694d85 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -465,7 +465,7 @@ def is_work_shared(d):
     pn = d.getVar('PN')
     return pn.startswith('gcc-source') or \
         bb.data.inherits_class('kernel', d) or \
-        (bb.data.inherits_class('kernelsrc', d) and d.getVar('S') == d.getVar('STAGING_KERNEL_DIR'))
+        (bb.data.inherits_class('kernelsrc', d) and d.expand("${TMPDIR}/work-shared") in d.getVar('S'))
 
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 1d4985dacf..3fa59fff51 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -141,14 +141,17 @@ class Archiver(OESelftestTestCase):
         pn = 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
 
         # Generate the tasks signatures
-        bitbake('mc:mc1:%s mc:mc2:%s --runonly=%s --dump-signatures=none' % (pn, pn, task))
+        bitbake('mc:mc1:%s mc:mc2:%s -c %s -S none' % (pn, pn, task))
 
         # Check the tasks signatures
         # To be machine agnostic the tasks needs to generate the same signature for each machine
-        locked_sigs = open("%s/locked-sigs.inc" % self.builddir).read()
+        locked_sigs_inc = "%s/locked-sigs.inc" % self.builddir
+        locked_sigs = open(locked_sigs_inc).read()
         task_sigs = re.findall(r"%s:%s:.*" % (pn, task), locked_sigs)
         uniq_sigs = set(task_sigs)
-        self.assertFalse(len(uniq_sigs) - 1, 'The task "%s" of the recipe "%s" has diferent signatures for each machine in multiconfig' % (task, pn))
+        self.assertFalse(len(uniq_sigs) - 1, \
+            'The task "%s" of the recipe "%s" has different signatures in "%s" for each machine in multiconfig' \
+            % (task, pn, locked_sigs_inc))
 
     def test_archiver_srpm_mode(self):
         """
-- 
2.38.0


