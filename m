Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80796C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 14:52:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.11234.1645714347713977391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 06:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OZf7Qidt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 l1-20020a7bcf01000000b0037f881182a8so3643436wmg.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 06:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rYO4w8DIZLPA1cpSdr/USX1+OGONV5UqcTWWkD87fao=;
        b=OZf7QidtaOSk4ousSsaPKvTXZ37iuVgLmYlh2iWa9Hl3J+Y5+wEj6yNkzUqpaa/NGc
         Rh5XsVNYJQKk/jWCMoO7sVUDDq/uknsko0kG98Md/lFUJ4kG7E9cO6R9bGtjkEbu9v7i
         W9qHAiPq7OLhoxg2qIVubAbzQ1s6jiDIS0Kb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rYO4w8DIZLPA1cpSdr/USX1+OGONV5UqcTWWkD87fao=;
        b=VDHv/3Q+vPLcdrloTDvNJ7o8ZTrM3IXpcBB7Rdqq4Qyc6UEiqBciIv55SVO7qd78w/
         KcP9HwKue0svu9RqF0CnSB6VkbXamFHnJT9x3rSk86tfpSETuqeqaam2VxO+vAunyYVX
         tMDln1TXhwKLjOcONsFS7TxAEWn5EtT/g+H57cJmAn9cGvqnUgHiBTMJ+0aNVQs8cw8V
         IWVXSxvN70euMuaAAy54SPnoBIsB2vDKjnTe4k34pnWo/sPQ+QeSvoKMOsypedI2V3rX
         ObKQ7aqxZP1HNb37Z/IsGXTlrfMNQ+22/Qmwvb5qsAXu1coJr8DKzO89zQs/kgw61n24
         TepA==
X-Gm-Message-State: AOAM530NIgEbddmfiFvjA8mul/f6dZKGElWYjUtW5mAHvrxZqNaQqljq
	DQo6ItzUqqDxCsfdmCugCzpAjbS+9hqMJYQM
X-Google-Smtp-Source: 
 ABdhPJzJaLQf9eOySzzq/lyOnMRvIsXxA75YK9SsS+mP7DBWU1qiU+dDDzZTjqRs2bH1l4L4F+YJbA==
X-Received: by 2002:a05:600c:6019:b0:380:f8bc:ddf3 with SMTP id
 az25-20020a05600c601900b00380f8bcddf3mr6600413wmb.117.1645714345462;
        Thu, 24 Feb 2022 06:52:25 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3d62:f765:e1dc:ad89])
        by smtp.gmail.com with ESMTPSA id
 az13sm3062541wrb.39.2022.02.24.06.52.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 06:52:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python-pip: Improve reproducibility
Date: Thu, 24 Feb 2022 14:52:23 +0000
Message-Id: <20220224145223.27900-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 14:52:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162314

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


