Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2AEEE6C7E4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 17:14:16 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id hi5so7235590wib.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 09:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YE0ynjrwe1CbIYOLge1ILllTdG0YDQKfNNkMzvoZxOI=;
	b=nDUaJC3uDfbKbo4gWgVSOiOAAdAT4ezjPhjKsO0tmIFPXS8Klhmc+XGBddXrVDTmeu
	kTHPTHq+4neioFvEwgfSrY19kUIceGcCLRNTm1BrGQFsF5ugLNwwHBUoXhS5JWIRVibG
	TgqUqobIPAKoe9H7JHOSMPjRtbm0bjPPYb1xkW0zBPMs73zYVfoukIYLsHy50fD9GIdV
	xzpAkYM2cX07v3nA3dP2kfiBOGwZO3osZY/RPCVXUZ2xA8MqIZ8Kw0Mm6SiAphcy90/h
	AwipMwQhgD+RiM9bOJhCt+Pt2Bd1CXKgu86u8DxEYYOvwhX60IbBAG/QzJNb73R0HcGf
	yW1w==
X-Gm-Message-State: ALoCoQl68kaXTmXkqxsHlTiyQpIOpoj7ghKrbQQqfDF7uF7qydzbIbj2fAkT8xZATuYq22Nk8R5u
X-Received: by 10.194.173.163 with SMTP id bl3mr4122137wjc.10.1389287655580;
	Thu, 09 Jan 2014 09:14:15 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm8589634wij.7.2014.01.09.09.14.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 09:14:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2014 17:14:04 +0000
Message-Id: <1389287644-901-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389287644-901-1-git-send-email-ross.burton@intel.com>
References: <1389287644-901-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/5] packagegroup-core-tools-testapps: add Piglit
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
X-List-Received-Date: Thu, 09 Jan 2014 17:14:16 -0000

Respect the OpenGL distro feature and if it's enabled, pull in piglit and
mesa-tools.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb           |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 1861ebe..4b8f99b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -24,10 +24,14 @@ KEXECTOOLS_powerpc ?= ""
 KEXECTOOLS_e5500-64b ?= ""
 KEXECTOOLS_aarch64 ?= ""
 
+GLTOOLS = "\
+    mesa-demos \
+    piglit \
+    "
+
 X11TOOLS = "\
     fstests \
     owl-video \
-    mesa-demos \
     x11perf \
     xrestop \
     xwininfo \
@@ -48,4 +52,5 @@ RDEPENDS_${PN} = "\
     ltp \
     connman-client \
     ${@base_contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', "${GLTOOLS}", "", d)} \
     "
-- 
1.7.10.4


