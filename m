Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C52AE77345
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 22:05:59 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.30527.1696025154831709806
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 15:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=HH5Pt7jb;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4053c6f1087so139332735e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 15:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696025153; x=1696629953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqzpjSwB9eUjF1K+wF1XNA0sh6bOuAU6sxRtPlihoyE=;
        b=HH5Pt7jb9KGGH+5duH98K377Cp7/he0lNfNHmDmeJ+MZF12Im+iaCjbv6m3q74Ga1V
         dh54E/rMGOq7O5sVUONoEuvtXw3hdXhLx40/KhLTPz9OBb6pj0DRLCbmCOh53edQu51K
         vrlZZS/zJ+wNSl2ZM+ZvfBhPwRmJ80XlJWkB1CF2x/fJT75FinM63f338L4/9trDteev
         26h0ddb9B2OKh5V68fGPKaqU/yTvMCODbRyIar6Eusw/jZbGWsEbHs8pBKKPX5Ry98aD
         hjLfcuezrpHCLFd/woH5qk8Fpz4JOtHqGYHRYxUDhPjt4PZUpYO5TQJXWYsZq4KxTNnp
         HdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696025153; x=1696629953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqzpjSwB9eUjF1K+wF1XNA0sh6bOuAU6sxRtPlihoyE=;
        b=GSHkPhhYLnb3hu80ZM3fHserIG3GSiVA5VV+ekIOUkOOEsx33vW+4aUbi9exvRsNUp
         GLHe/Mdj3gZtov+c9hKgRUs2KdAxbZTDaAKFzb5zEqMP4H/gJPqQgT1MQpWgZw403y3a
         /1u3Z113p4g+YgJHMuHO4gYVrDn9QYrjQ0QeGaBdrHYpn1n6Sy1gxeOKRv7MDcULI/Cv
         ETM+u45Yp136U9Ryz/IFtdTO5JnIB3w3S6zwtIoCX/7yn8gO+uo+40Z4id5BCmOJhoQq
         zeIeKoNvXIRzZiotSDBbeRq2aJfHnI0iGd9N59EWV1Jsz65SPlRMoBr9yVepRlpPTzwl
         yKiw==
X-Gm-Message-State: AOJu0YyXvyhNl7R7Vy7bXIY/CvGSxOqndZQkSp3IjllmRwiLjRWBpW2T
	W17nDQUB5GDR6hdS1yp7zhZUKhqUV2MN6aYvWoM=
X-Google-Smtp-Source: AGHT+IE9FdINVwZwQqMDDpLbJGNWMhuBQqJkgZF8RWjiHFH1TC3pjdHS7oyqR7+5VRyZxxYV7yR9Yw==
X-Received: by 2002:a05:600c:290a:b0:405:7400:1e3d with SMTP id i10-20020a05600c290a00b0040574001e3dmr5098070wmd.32.1696025152979;
        Fri, 29 Sep 2023 15:05:52 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id t15-20020a1c770f000000b00406408dc788sm2210046wmi.44.2023.09.29.15.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 15:05:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/4] QA, ptest: Detect python and perl based tests
Date: Sat, 30 Sep 2023 00:05:01 +0200
Message-Id: <20230929220503.3169745-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230929220503.3169745-1-yoann.congal@smile.fr>
References: <20230929220503.3169745-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 22:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188450

From: Jérémy Rosen <jeremy.rosen@smile.fr>

match_line_in_files will look for a regex in all files matching a glob.

we use iglob to avoid a complete, recursive scan of all source. iglob is
based on python iterators and will scan as we walk through the directories

pytest are detected by looking for "import pytest" or "from pytest" in any
python file.

perl Test:: is detetected by looking for any t/*.t in the toplevel source
directory.

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 857f0a3736..31db707a33 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1351,6 +1351,24 @@ python do_qa_patch() {
     ###########################################################################
     # Check for missing ptests
     ###########################################################################
+    def match_line_in_files(toplevel, filename_glob, line_regex):
+        import glob
+        # python 3.10 adds a root_dir parameter, but in 3.8 we must manually cwd
+        curdir = os.getcwd()
+        os.chdir(toplevel)
+        for entry in glob.iglob(filename_glob, recursive=True):
+            try:
+                with open(entry, 'r', encoding='utf-8', errors='ignore') as f:
+                    for line in f.readlines():
+                        if re.match(line_regex, line):
+                            os.chdir(curdir)
+                            return True
+            except FileNotFoundError:
+                # Broken symlink in source
+                pass
+        os.chdir(curdir)
+        return False
+
     srcdir = d.getVar('S')
     if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
         pass
@@ -1360,6 +1378,14 @@ python do_qa_patch() {
     elif bb.data.inherits_class('ptest', d):
         bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))
 
+    # Detect perl Test:: based tests
+    elif "t" in os.listdir(srcdir) and any(filename.endswith('.t') for filename in os.listdir(os.path.join(srcdir, 't'))):
+        oe.qa.handle_error("unimplemented-ptest", "%s: perl Test:: based tests detected" % d.getVar('PN'), d)
+
+    # Detect pytest-based tests
+    elif match_line_in_files(srcdir, "**/*.py", r'\s*(?:import\s*pytest|from\s*pytest)'):
+        oe.qa.handle_error("unimplemented-ptest", "%s: pytest-based tests detected" % d.getVar('PN'), d)
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


