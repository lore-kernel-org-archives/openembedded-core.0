Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0F39C6A59B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:11:35 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id u57so1344608wes.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=Fr0FAAIi9kaE3jtLGKh6fwXz/ObKLPY4EiggGJLpcwA=;
	b=KVqGyXT/leVEG/NMu3Bupf72v0vmcbm4EfNZMl2i/+ZZ0XtnQj3MLA/Q3PqStifrLL
	Xs9woo3ss0peEIBURZS5oAegRNfbT3Yq8PLq0Y4U3Lm9w5dcPpE1vJpIsfjifz6UaivA
	smEvH0CNvRWYjfCEkZfWi6SwZxrsM5nKSXXoSas3pUM01G2zjD0yd3vfctrZo4GbdbEa
	3vs6Q9mUUSJpzBf+z3yK7+V0ce1GwR2ddVaajOn2aiN1rcgZiUKKSff5VI2Ucj8ud8sA
	CugLxRlRlgUtZGQKsZ2f7W5KyefgMqPdgsPdI9WvFkl0sZLYDl7rR/jWEEAGIh2rBgNe
	DfTw==
X-Received: by 10.180.90.164 with SMTP id bx4mr3865414wib.13.1370013096625;
	Fri, 31 May 2013 08:11:36 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ca19sm4609942wib.3.2013.05.31.08.11.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:11:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:08:08 +0100
Message-Id: <bd5de26b75e051cd098d2f6ebaa13dff872ab64f.1370012830.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012830.git.ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012830.git.ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmLYsFSkwKh4tBfy7JZquNbbMUmzQwaVcpjmws/umW1N+9upPwsiWfpjzJT2c65/AKve0nG
Subject: [PATCH 5/7] weston: add a weston-launch group
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
X-List-Received-Date: Fri, 31 May 2013 15:11:36 -0000

For weston-launch to be used by a non-root user, the user either needs to be a
member of the weston-launch group or own an active systemd user session.  Create
this group so users can be members of it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.0.6.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.0.6.bb b/meta/recipes-graphics/wayland/weston_1.0.6.bb
index dd17c03..07811f2 100644
--- a/meta/recipes-graphics/wayland/weston_1.0.6.bb
+++ b/meta/recipes-graphics/wayland/weston_1.0.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "63202129d66d5514e572814da5dfa1f7"
 SRC_URI[sha256sum] = "c833bc4dc8667561d2639b57220541531c039aa9332ce2a7022a3c466eb894f1"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig useradd
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 mtdev jpeg"
 DEPENDS += "wayland mesa virtual/egl"
@@ -57,3 +57,6 @@ FILES_${PN}-examples = "${bindir}/*"
 
 RDEPENDS_${PN} += "xkeyboard-config"
 RRECOMMENDS_${PN} = "liberation-fonts"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system weston-launch"
-- 
1.7.10.4


