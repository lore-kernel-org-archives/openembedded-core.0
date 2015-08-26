Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id E932876ACD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 16:11:04 +0000 (UTC)
Received: by iodb91 with SMTP id b91so24516988iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 09:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to;
	bh=2PsRtZZwgqG+H8ZiZDtFdWomPnxbASi6BfZ0lJTbzqI=;
	b=dJFkvD76GnJWpuLkUTMnyB675MCRBpric4Q7w3mi+VdK5eUXkvoSZbEOHiFBklQnMu
	vibgSKV10RvkNOSyk1BHSbPmbxwCeJVDAZ5yiSD7OCByREMjLqcwDv/Pq4F/pnGlt5c/
	MFLdXDLND7R1IM0UVgmslU/SwNpMCIRHAu7b0mAd3hfYuQWcqCez4jaEg3hpO95b22hn
	8oi+ztZILL+jvonfxqWdeYdRom2j6StXGsSrUDdFi08+6HjF51W6TqQdBQkqOu7vMk7q
	UaLhMwIc0WiB3JZ9spDWnDa/+94FMNxQXAjvAEwASzKBNwRMUejiq6amVM22FNYeWqVb
	OnGQ==
X-Gm-Message-State: ALoCoQmg9b03TI6Ng/RF+dHNWITxJVMCgL0lPTMiwa0kWurpFXuJwFLX677yXGvALoZCHagnmNog
X-Received: by 10.107.31.75 with SMTP id f72mr1066727iof.8.1440605464168;
	Wed, 26 Aug 2015 09:11:04 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8F619.dip0.t-ipconnect.de.
	[93.232.246.25])
	by smtp.gmail.com with ESMTPSA id pl8sm3967216igb.8.2015.08.26.09.11.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Aug 2015 09:11:03 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 18:10:45 +0200
Message-Id: <f1fe5d98cb0737847778531368eab04778076750.1440603928.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440605035.20082.20.camel@intel.com>
Subject: [PATCH 1/1] mtd-utils: add xattr PACKAGECONFIG and fix acl dependency
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
X-List-Received-Date: Wed, 26 Aug 2015 16:11:12 -0000

The unconditional removal of -DWITHOUT_XATTR accidentally introduced a
compile-time dependency on "acl", because "sys/acl.h" gets
included. This caused random compile failures.

To fix this, we introduce a proper PACKAGECONFIG for the "xattr"
support, with the distro's "xattr" feature determining the
default. Setting the define must be done with custom code because
PACKAGECONFIG can only influence configure parameters.

The "acl" distro feature is not checked because although enabling
"xattr" support now triggers a build of acl, nothing from it will not
get included in the resulting target image. This seems more suitable
than not enabling xattr support in mtd-utils when acl support in the
distro is disabled.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 8d4892a..17dca77 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -19,7 +19,13 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
 
 S = "${WORKDIR}/git/"
 
-EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include' 'BUILDDIR=${S}'"
+# xattr support creates an additional compile-time dependency on acl because
+# the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
+# regardless whether acl is enabled or disabled in the distro should be okay.
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)}"
+PACKAGECONFIG[xattr] = ",,acl,"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
 
 do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
-- 
2.1.4


