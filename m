Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 789CB7E3F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 13:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=jnX2l5QbpxqE8jis9mNLWi39Ec/ECUY4PQFS+JC8bDU=; 
	b=rll2ac9N56vvIrTcYdSkEvV76l6/CXrWyO8fEAWTMqlC6zf6yIKegoInSFR5n/rK7YdZdjnobovyqCvLiKbFjkmt7zOTFNEjf9R24a4fReRaPxdF6fASjc+KFpiXvaESUyLBJ9dyam6S4Mw2t4IYHaqbRDYrOlsaHqFnDa53PeYlL4mM8JfT12gSD2rrJdqvKO0uufOXuq7gPTaXtSowl8jBpfTd0UosIY5KeGaus3gdA8l0wsjGRWmSDh/zMFx3lvkEbZZY883s/FCwFZ8hYaH6kA4q+5ZJ/3+dJTLqb9gMrK+fpfg0qQf+Jn1YTWxZ44frgmtiH3mSCjfsFZri2w==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=localhost.localdomain) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hWLPD-0003Q1-7j; Thu, 30 May 2019 15:47:43 +0200
From: Philippe Normand <philn@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 14:47:03 +0100
Message-Id: <20190530134703.16094-3-philn@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190530134703.16094-1-philn@igalia.com>
References: <20190530134703.16094-1-philn@igalia.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gnutls: Add a config option to enable the pkcs11 trust store
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
X-List-Received-Date: Thu, 30 May 2019 13:47:42 -0000
Content-Transfer-Encoding: 8bit

Since version 2.60 the glib-networking TLS database relies on GnuTLS's system
trust store, so not enabling it leads to TLS errors in applications depending on
glib-networking. The raised runtime warning is:

process:500): GLib-Net-WARNING **: 09:14:09.321: Failed to load TLS database: Failed to load system trust store: GnuTLS was not configured with a system trust
(app:490): ... TLS Error: TLS certificate  has unknown CA.

This new option is enabled by default because it is what glib-networking now
expects. Disabling this option would break certificates validation for all
applications directly or indirectly (via libsoup for instance) depending on glib-networking.
---
 meta/recipes-support/gnutls/gnutls_3.6.7.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.7.bb b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
index e05dc2b57d..48684678bb 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.7.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "5b3409ad5aaf239808730d1ee12fdcd148c0be00262c7edf157af655a8
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-PACKAGECONFIG ??= "libidn"
+PACKAGECONFIG ??= "libidn p11-kit pkcs11-trust-store"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
@@ -35,6 +35,8 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
+PACKAGECONFIG[pkcs11-trust-store] = "--with-default-trust-store-pkcs11=pkcs11:,,"
+
 
 EXTRA_OECONF = " \
     --enable-doc \
-- 
2.20.1


