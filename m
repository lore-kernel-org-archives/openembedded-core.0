Return-Path: <alexandru.damian@intel.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1A83F721B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 14:33:33 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id fp1so3189749pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 06:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AJ/sjT54KUaQOq2j483/0OBOvWWR+McxEUD6e1NC8ag=;
	b=SmA3k2SiXSMiZ0J3LaZ9BgjVUhj5n1CWsjD5QothVoPNk0oRmHumOsJco19ghj09zh
	lnt+14LfpB3jZHbwDhIqT8OeOtqTOpu5V6E6YtnDdaOf1uKn4+NqrsSi3b1yOBNg83m7
	0S7np0q5Z6fmMWUStPDXN42gT9rcG8c87hznpJBdwmRxdOWBJ/0LIm+713KbdGFQ9puq
	2cV4zjFazuq/t7rkTy1zFlqm+FWsWnDf6rwY4GxOBD9C/oLlpmXu8erL7U3yFdGWbHGL
	qHrz86cAeCdrs5xBnZyQNXqQ+CwXpxUN+ng1KE85KradvVcXOGdxvWvwANR+xjpLwTqz
	nM8w==
X-Gm-Message-State: ALoCoQlusSEUV9kImOF8q4F/1hV/EePcLfEAzKzIL8N2aAJBa4yT18d3DJ93IM0eyTA0q6fH/vMY
X-Received: by 10.66.140.102 with SMTP id rf6mr56469346pab.1.1416494014237;
	Thu, 20 Nov 2014 06:33:34 -0800 (PST)
Received: from adamian-desk.local ([83.217.123.106])
	by mx.google.com with ESMTPSA id x10sm2286834pdr.11.2014.11.20.06.33.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Nov 2014 06:33:33 -0800 (PST)
Received: by adamian-desk.local (Postfix, from userid 1000)
	id D18F3563E83; Thu, 20 Nov 2014 14:33:30 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Nov 2014 14:33:28 +0000
Message-Id: <1416494008-13794-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] toaster: add toaster layer configuration files
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
X-List-Received-Date: Thu, 20 Nov 2014 14:33:42 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

In managed mode, Toaster tries to create project configuration
based on the layers that are being checked-out on disk.

This is done by using a JSON configuration file that is layer-specific.

This patch adds toasterconf.json files to the oe core layer, for usage
with a standalone OpenEmbedded-Core checkout, and to the meta-yocto
layer for usage with Poky checkouts.

The toasterconf.json files describe basic configuration
for Toaster projects, including default layers,
default configuration variable values,
toaster-compatible branches, and the layerindex URL
where the base layer and compatible layers.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta-yocto/conf/toasterconf.json | 97 ++++++++++++++++++++++++++++++++++++++++
 meta/conf/toasterconf.json       | 84 ++++++++++++++++++++++++++++++++++
 2 files changed, 181 insertions(+)
 create mode 100644 meta-yocto/conf/toasterconf.json
 create mode 100644 meta/conf/toasterconf.json

diff --git a/meta-yocto/conf/toasterconf.json b/meta-yocto/conf/toasterconf.json
new file mode 100644
index 0000000..fa333de
--- /dev/null
+++ b/meta-yocto/conf/toasterconf.json
@@ -0,0 +1,97 @@
+{
+    "config": {"MACHINE": "qemux86", "DISTRO": "poky"},
+    "layersources": [
+        {
+            "name": "Local Poky",
+            "sourcetype": "local",
+            "apiurl": "../../",
+            "branches": ["HEAD", "master", "dizzy"],
+            "layers": [
+                {
+                    "name": "openembedded-core",
+                    "local_path": "meta",
+                    "vcs_url": "remote:origin",
+                    "dirpath": "meta"
+                },
+                {
+                    "name": "meta-yocto",
+                    "local_path": "meta",
+                    "vcs_url": "remote:origin",
+                    "dirpath": "meta-yocto"
+                },
+                {
+                    "name": "meta-yocto-bsp",
+                    "local_path": "meta",
+                    "vcs_url": "remote:origin",
+                    "dirpath": "meta-yocto-bsp"
+                }
+
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
+            "giturl": "remote:origin",
+            "branch": "master",
+            "dirpath": "bitbake"
+        },
+        {
+            "name": "dizzy",
+            "giturl": "remote:origin",
+            "branch": "dizzy",
+            "dirpath": "bitbake"
+        },
+        {
+            "name": "HEAD",
+            "giturl": "remote:origin",
+            "branch": "HEAD",
+            "dirpath": "bitbake"
+        }
+    ],
+
+    "defaultrelease": "master",
+
+    "releases": [
+        {
+            "name": "master",
+            "description": "Yocto Project master",
+            "bitbake": "master",
+            "branch": "master",
+            "defaultlayers": [ "openembedded-core", "meta-yocto", "meta-yocto-bsp"],
+	    "layersourcepriority": { "User Imported Layers": 99, "Local Poky" : 10, "OpenEmbedded" :  0 },
+            "helptext": "Toaster will run your builds using the <a href=\"http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/\">Yocto Project master branch</a>, where active development takes place. This is not a stable branch, so your builds might not work as expected."
+        },
+        {
+            "name": "dizzy",
+            "description": "Yocto Project 1.7 Dizzy",
+            "bitbake": "dizzy",
+            "branch": "dizzy",
+            "defaultlayers": [ "openembedded-core", "meta-yocto", "meta-yocto-bsp"],
+	    "layersourcepriority": { "User Imported Layers": 99, "Local Poky" : 10, "OpenEmbedded" :  0 },
+            "helptext": "Toaster will run your builds with the latest Yocto Project release, <a href=\"https://www.yoctoproject.org/downloads/core/dizzy17\">1.7 \"Dizzy\"</a>"
+        },
+        {
+            "name": "local",
+            "description": "Local Yocto Project",
+            "bitbake": "HEAD",
+            "branch": "HEAD",
+            "defaultlayers": [ "openembedded-core", "meta-yocto", "meta-yocto-bsp"],
+	    "layersourcepriority": { "User Imported Layers": 99, "Local Poky" : 10, "OpenEmbedded" :  0 },
+            "helptext": "Toaster will run your builds with the version of the Yocto Project you have cloned or downloaded to your computer."
+        }
+    ]
+}
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
+	    "layersourcepriority": { "User Imported Layers": 99, "Local OE-Core" : 10, "OpenEmbedded" :  0 },
+            "helptext": "Toaster will run your builds using the OpenEmbedded master branch, where active development takes place. This is not a stable branch, so your builds might not work as expected."
+        },
+        {
+            "name": "dizzy",
+            "description": "OE-Core dizzy",
+            "bitbake": "dizzy",
+            "branch": "dizzy",
+            "defaultlayers": [ "openembedded-core" ],
+	    "layersourcepriority": { "User Imported Layers": 99, "Local OE-Core" : 10, "OpenEmbedded" :  0 },
+            "helptext": "Toaster will run your builds with the latest OpenEmbedded release, the dizzy branch."
+        },
+        {
+            "name": "local",
+            "description": "Local Yocto Project",
+            "bitbake": "HEAD",
+            "branch": "HEAD",
+            "defaultlayers": [ "openembedded-core" ],
+	    "layersourcepriority": { "User Imported Layers": 99, "Local OE-Core" : 10, "OpenEmbedded" :  0 },
+            "helptext": "Toaster will run your builds with the version of the OpenEmbedded that you have cloned or downloaded to your computer."
+        }
+    ]
+}
-- 
1.9.1


