Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1DAC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:58:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.7164.1645801112228385868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:58:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H3y7qq0o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id j17so5010191wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rYO4w8DIZLPA1cpSdr/USX1+OGONV5UqcTWWkD87fao=;
        b=H3y7qq0osXdeogYymC0nu5QkYYufxNAB4v6BNchOaErjeBS0zmbSdA3IrrecyLRrw8
         1m5Bh+cDhiN+w/mflYi4BclY9eEsAM6h0Q8uuOq0M4KkKc6BCfdJ3eyYWKct25ItK7qA
         tE291mJoRcuX739w47hNql9hDW6/x27T0BgTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rYO4w8DIZLPA1cpSdr/USX1+OGONV5UqcTWWkD87fao=;
        b=KPN15WLLbe9AEJB01tup1/l2VYhRFAaXhDcjjsJkl3iK7KAgtdvh8KLkvp/MYdi4PJ
         3YdryyXdpvzrOghfAk5dQgdTSpz71lkwmBstP65h+uVXnbBOoRKHERexL6RU6PuWgDeI
         LEatkYFE2CwQ/Y8Qf2Xg884e+EtXFosixgnshHMxS7LiL90zJ2WGpuZFPfLPtigoc/P5
         L9pGkHm/nSMTGwifZgkhxfQRoHuq9z7QPERCNYhi7CMuBPwqBHoILg4m9HlQwDzhos8o
         1sE0ONJoXYHT9ccqB1BpmpW9M1Ckuf+mHxgg5hNtJ7E9UYqe+/poTpfap9wDYBmdJK8C
         2YSA==
X-Gm-Message-State: AOAM530b3MzuSbLfV5RgXJTBa/WflChZlPUvArQSGm7ja5dtW5cB4HXC
	6mVyPqrGKPVK/hKbsqHraabkyn9l0a3nEg5w
X-Google-Smtp-Source: 
 ABdhPJzKufZ1zLxU5DAEcLYuAIEXfD9wEE3GZ4igzW5ORRLdEmFIVf4EMNb8fmeqc//LzjSq9/t5rA==
X-Received: by 2002:adf:8063:0:b0:1ef:78e3:330 with SMTP id
 90-20020adf8063000000b001ef78e30330mr1087521wrk.424.1645801110017;
        Fri, 25 Feb 2022 06:58:30 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8c05:a731:3c1:5d08])
        by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b00352cdcdd7b2sm17121733wmq.0.2022.02.25.06.58.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:58:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] python-pip: Improve reproducibility
Date: Fri, 25 Feb 2022 14:58:26 +0000
Message-Id: <20220225145828.88238-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:58:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162399

Pip installed wheels are not reproducible currently. The direct_url
files encode an installation path and the installed wheels compile
the python files at their location, not their final install location
which is incorrect.

To fix this, simply disable the direct_urls and pass the "root" to
the python compile function to strip that path out of the compiled
files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-pip/reproducible.patch     | 74 +++++++++++++++++++
 .../python/python3-pip_22.0.3.bb              |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pip/reproducible.patch

diff --git a/meta/recipes-devtools/python/python3-pip/reproducible.patch b/meta/recipes-devtools/python/python3-pip/reproducible.patch
new file mode 100644
index 00000000000..538bb94f7ad
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/reproducible.patch
@@ -0,0 +1,74 @@
+Pip installed wheels are not reproducible currently. The direct_url
+files encode an installation path and the installed wheels compile
+the python files at their location, not their final install location
+which is incorrect.
+
+To fix this, simply disable the direct_urls and pass the "root" to
+the python compile function to strip that path out of the compiled
+files.
+
+A version of this patch, perhaps stripping root from the direct_urls
+may be something that could be considered by upstream.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Pending
+
+Index: pip-22.0.3/src/pip/_internal/req/req_install.py
+===================================================================
+--- pip-22.0.3.orig/src/pip/_internal/req/req_install.py
++++ pip-22.0.3/src/pip/_internal/req/req_install.py
+@@ -758,7 +758,9 @@ class InstallRequirement:
+         if self.is_wheel:
+             assert self.local_file_path
+             direct_url = None
+-            if self.editable:
++            if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
++                direct_url = None
++            elif self.editable:
+                 direct_url = direct_url_for_editable(self.unpacked_source_directory)
+             elif self.original_link:
+                 direct_url = direct_url_from_link(
+@@ -775,6 +777,7 @@ class InstallRequirement:
+                 warn_script_location=warn_script_location,
+                 direct_url=direct_url,
+                 requested=self.user_supplied,
++                root=root,
+             )
+             self.install_succeeded = True
+             return
+Index: pip-22.0.3/src/pip/_internal/operations/install/wheel.py
+===================================================================
+--- pip-22.0.3.orig/src/pip/_internal/operations/install/wheel.py
++++ pip-22.0.3/src/pip/_internal/operations/install/wheel.py
+@@ -436,6 +436,7 @@ def _install_wheel(
+     warn_script_location: bool = True,
+     direct_url: Optional[DirectUrl] = None,
+     requested: bool = False,
++    root: str = None,
+ ) -> None:
+     """Install a wheel.
+ 
+@@ -612,7 +613,7 @@ def _install_wheel(
+             with warnings.catch_warnings():
+                 warnings.filterwarnings("ignore")
+                 for path in pyc_source_file_paths():
+-                    success = compileall.compile_file(path, force=True, quiet=True)
++                    success = compileall.compile_file(path, force=True, quiet=True, stripdir=root)
+                     if success:
+                         pyc_path = pyc_output_path(path)
+                         assert os.path.exists(pyc_path)
+@@ -723,6 +724,7 @@ def install_wheel(
+     warn_script_location: bool = True,
+     direct_url: Optional[DirectUrl] = None,
+     requested: bool = False,
++    root: str = None,
+ ) -> None:
+     with ZipFile(wheel_path, allowZip64=True) as z:
+         with req_error_context(req_description):
+@@ -735,4 +737,5 @@ def install_wheel(
+                 warn_script_location=warn_script_location,
+                 direct_url=direct_url,
+                 requested=requested,
++                root=root,
+             )
diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
index e02ea5bd3d2..7eb9fb69ba4 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -14,6 +14,7 @@ DEPENDS:append:class-native = " unzip-native"
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 SRC_URI += "file://no_shebang_mangling.patch"
+SRC_URI += "file://reproducible.patch"
 
 SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
 
-- 
2.32.0


