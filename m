Return-Path: <alexandru.damian@intel.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3D872062
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 16:00:19 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lj1so2808771pab.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 08:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=unDKjllI4w64HSKSyX2TI9HKcSWqzXf7eFfUX6fJQ70=;
	b=m03DD8ISThvEB/dzDXco3N1LhLlCwdjMqLI8eJHtZiyZWtv5rd9u1yWpGdhqx/N/ie
	prRiduLJDNjWc6SsxJ5uJ0VFrt8CRpsRbk4lOCKXMKS9st4llLDjtcr8RkIxqXrlyrr9
	dxpPHVlgtsfNe/BoM/wEBYTBwsROY4JDIj1GzYPQ0fMdWOyoZaIxTz6yMzfDZJtCdyYW
	gy3zRoUrVyDwS8FZ9/iso8MWkqWG5sdSxyZBtlIqBgzfa3xsMjBXGy4lVyFwEaMfgWZi
	aqAiHvrsJVJnfMCF5D+7PEq4IbuWWP6JwErFQ/O5mmGzBnsVvu1akcmbdbNgvolY8EWZ
	oK3g==
X-Gm-Message-State: ALoCoQnU3T8tGXvk4+bBmB9GGmEjCmFdaW6jtCfm/4q5HSCZyWL6/j3Dm+jJ1xNVb1Mvz4vrTYTP
X-Received: by 10.68.68.197 with SMTP id y5mr40373297pbt.82.1416499218657;
	Thu, 20 Nov 2014 08:00:18 -0800 (PST)
Received: from adamian-desk.local ([83.217.123.106])
	by mx.google.com with ESMTPSA id c1sm2411987pdl.75.2014.11.20.08.00.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Nov 2014 08:00:17 -0800 (PST)
Received: by adamian-desk.local (Postfix, from userid 1000)
	id 515D8563F4C; Thu, 20 Nov 2014 16:00:14 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Nov 2014 16:00:10 +0000
Message-Id: <1416499210-28856-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAP9ODKpgZdmNxKP9t=hG_LpN5suJYFwrNCye_EsQU-CxuOYKeg@mail.gmail.com>
References: <CAP9ODKpgZdmNxKP9t=hG_LpN5suJYFwrNCye_EsQU-CxuOYKeg@mail.gmail.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 1/1 v2] toaster: add toaster layer configuration files
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
X-List-Received-Date: Thu, 20 Nov 2014 16:00:22 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

In managed mode, Toaster creates project configurations
based on the layers that are being checked-out on disk.

The defaults are set through a JSON configuration
file that contains layer-specific specific information.

This patch adds toasterconf.json files for the oe core layer,
that make Toaster work with a standalone OpenEmbedded-Core checkout.

The toasterconf.json files describe basic configuration for Toaster
projects, including default layers, default configuration variable values,
toaster-compatible branches, and the layerindex URL
where the base layer and compatible layers.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/conf/toasterconf.json | 84 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 meta/conf/toasterconf.json

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
new file mode 100644
index 0000000..9cadb70
--- /dev/null
+++ b/meta/conf/toasterconf.json
@@ -0,0 +1,84 @@
+{
+    "config": {"MACHINE": "qemux86", "DISTRO": "poky"},
+    "layersources": [
+        {
+            "name": "Local OE-Core",
+            "sourcetype": "local",
+            "apiurl": "../../",
+            "branches": ["HEAD", "master", "dizzy"],
+            "layers": [
+                {
+                    "name": "openembedded-core",
+                    "local_path": "meta",
+                    "vcs_url": "remote:origin",
+                    "dirpath": "meta"
+                }
+            ]
+        },
+        {
+            "name": "OpenEmbedded",
+            "sourcetype": "layerindex",
+            "apiurl": "http://layers.openembedded.org/layerindex/api/",
+            "branches": ["master", "dizzy"]
+        },
+        {
+            "name": "User Imported Layers",
+            "sourcetype": "imported",
+            "apiurl": "",
+            "branches": ["master", "dizzy", "HEAD"]
+
+        }
+    ],
+    "bitbake" : [
+        {
+            "name": "master",
+            "giturl": "git://git.openembedded.org/bitbake",
+            "branch": "master",
+            "dirpath": ""
+        },
+        {
+            "name": "dizzy",
+            "giturl": "git://git.openembedded.org/bitbake",
+            "branch": "1.24",
+            "dirpath": ""
+        },
+        {
+            "name": "HEAD",
+            "giturl": "git://git.openembedded.org/bitbake",
+            "branch": "HEAD",
+            "dirpath": ""
+        }
+    ],
+
+    "defaultrelease": "master",
+
+    "releases": [
+        {
+            "name": "master",
+            "description": "OE-Core master",
+            "bitbake": "master",
+            "branch": "master",
+            "defaultlayers": [ "openembedded-core" ],
+            "layersourcepriority": { "User Imported Layers": 99, "Local OE-Core" : 10, "OpenEmbedded" :  0 },
+            "helptext": "Toaster will run your builds using the OpenEmbedded master branch, where active development takes place. This is not a stable branch, so your builds might not work as expected."
+        },
+        {
+            "name": "dizzy",
+            "description": "OE-Core dizzy",
+            "bitbake": "dizzy",
+            "branch": "dizzy",
+            "defaultlayers": [ "openembedded-core" ],
+            "layersourcepriority": { "User Imported Layers": 99, "Local OE-Core" : 10, "OpenEmbedded" :  0 },
+            "helptext": "Toaster will run your builds with the latest OpenEmbedded release, the dizzy branch."
+        },
+        {
+            "name": "local",
+            "description": "Local Yocto Project",
+            "bitbake": "HEAD",
+            "branch": "HEAD",
+            "defaultlayers": [ "openembedded-core" ],
+            "layersourcepriority": { "User Imported Layers": 99, "Local OE-Core" : 10, "OpenEmbedded" :  0 },
+            "helptext": "Toaster will run your builds with the version of the OpenEmbedded that you have cloned or downloaded to your computer."
+        }
+    ]
+}
-- 
1.9.1


