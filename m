Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id F3E326D8FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 15:19:41 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q58so535120wes.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 07:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Q7q+xJlpmoiuR5pbjKbHz7WxXaGZX4n1xEO7hquuJHM=;
	b=i/BANi+1SR6RV05gdxlFOrWYfw2AdH6ZMIr4dlWmzg70ZM+3DL2/VvhZzW/0Z0j09n
	paLmLBGdxoRBBKtzcspaAf8B0SnJBpVmeldk5WaWf8BkUlhqWdrrlFuO2VAxixeUlw0h
	JBGu1XXTZ2BHfbVS5TFQitZeZhiZaMfxHZD+pZtZpS6YTf0TQoZFheOHRNO49eVb4oak
	OH/f0NpOaFSjurl2eJib1r3PEE0rQsGQdHJdEUDQDH+f8wKUOCNzsDc/lsNg1suDNvjS
	kPkmN1XWuKhraSPlGzNxaH8YdR1cVBq+y2AECqx3KaRKQaiHJAI7YmSS9Asx3Cr1tR/3
	KzUg==
X-Gm-Message-State: ALoCoQnkOKKnAHRsDKkJauZXQyLgUGMhgX1BP+pFDFEoGTpfzdwMy2SSOnPBES8c9ujkb7JMVtUf
X-Received: by 10.194.62.70 with SMTP id w6mr9741885wjr.55.1389712782546;
	Tue, 14 Jan 2014 07:19:42 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm1923314wij.7.2014.01.14.07.19.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 07:19:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 15:19:26 +0000
Message-Id: <270fd52fb3d4aefc2de09ab868912b6163aa3c72.1389712683.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
Subject: [PATCH][V3 1/7] cmake: specify all install paths
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
X-List-Received-Date: Tue, 14 Jan 2014 15:19:42 -0000

Specify the full set of install paths (bindir, libdir, etc) for packages that
use the GNUInstallDirs module, instead of just the prefix and leaving the rest
as default (which breaks with multilib).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 3ac3fcc..7ff9984 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -86,6 +86,15 @@ cmake_do_configure() {
 	  ${OECMAKE_SITEFILE} \
 	  ${S} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
+	  -DCMAKE_INSTALL_BINDIR:PATH=${bindir} \
+	  -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir} \
+	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${libexecdir} \
+	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir} \
+	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${sharedstatedir} \
+	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir} \
+	  -DCMAKE_INSTALL_LIBDIR:PATH=${libdir} \
+	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${includedir} \
+	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${datadir} \
 	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
 	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
 	  -DCMAKE_VERBOSE_MAKEFILE=1 \
-- 
1.7.10.4


