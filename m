Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrCwB-0005J9-6g
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 20:55:59 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 17 Jul 2012 11:44:38 -0700
Received: by wibhm11 with SMTP id hm11so3328303wib.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 11:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=70sQCke/pKYXLv5c2FzSErXUjrECeInFx76yPc9xmh0=;
	b=BbGiaVLQkqKd6DNzKi8cGnThDGA7V4mWpi9eUSkpn1EFhrzfo89BPNXF4lRoa4JtqL
	sNPvDfzmwo+dtpBw2E/qK16S2RgLI2pPrBVFbTlrDG6zfGXMB37fl9x76GcIRHpmTeJ1
	LcT2/DsImrhV/IcOtMA56oOIm1udUA+4tlRh9Su8Z3qrdm3I+oyRWQcE8oBgK1MT6BeU
	paEtPdUNYnexzKbCSpe8X+4Pw0KXzFGYeFMi6gZcqUA0XecLFQqmUfZOObniD9soeN6h
	8oKTceNatVyZ17Z6C+4ikWCNqTFW4oEj1XFof4j6yqKc9FNNbdCraH4c7N0Vk7xYIocB
	KN/Q==
Received: by 10.180.96.3 with SMTP id do3mr47045wib.5.1342550676420;
	Tue, 17 Jul 2012 11:44:36 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k20sm28346138wiv.11.2012.07.17.11.44.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 11:44:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 19:44:19 +0100
Message-Id: <e64968581ead699c19087675b57e6027c8252e6c.1342550573.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342550573.git.ross.burton@intel.com>
References: <cover.1342550573.git.ross.burton@intel.com>
In-Reply-To: <cover.1342550573.git.ross.burton@intel.com>
References: <cover.1342550573.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn3IzUMelobibe/h76N0aMKoIcoSUgA8gIZaR+FoyKEwPGAnM3Lu+TXJfA4MaXkhbQN8rmK
Subject: [PATCH 1/2] webkit-gtk: remove no-parallel bodge
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 18:55:59 -0000

This workaround was originally for GNU Make 3.82 which upstream was blaming
for a parallel build failure.  Since then I've changed numerous variables
and now parallel builds are working with 3.82 (and succeed in 20 minutes
instead of 2 hours).

Revert the change until we've more data about what causes the breakage, then
we can bring it back with more finesse.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
index b2bfd24..3cef0e4 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
@@ -29,11 +29,6 @@ inherit autotools lib_package pkgconfig
 
 S = "${WORKDIR}/webkit-${PV}/"
 
-# GNU Make 3.82 has a bug where it incorrectly prunes intermediate targets in
-# parallel builds.  See https://bugs.webkit.org/show_bug.cgi?id=79498 for the
-# WebKitGTK bug, and savannah.gnu.org/bugs/?30653 for the upstream bug.
-PARALLEL_MAKE = ""
-
 EXTRA_OECONF = "\
                 --enable-debug=no \
                 --enable-svg \
-- 
1.7.10



