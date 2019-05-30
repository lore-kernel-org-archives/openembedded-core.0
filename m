Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 484307E3B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 10:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:To:From:Subject:Message-ID;
	bh=8GPMY4h9Ks/xmXfoseW20If4izmcuyWMYhwPUYllTUU=; 
	b=qQQ9bBaC1UZFXvPWSFISYeL6WR3FMSxFjrhWARoYiJ1JOYQgRIzAW3wUmzy2jSrsf/82j5yEImsbBXpDkAo639Dkxua1/kfYNa/X7hBg0Er2iWFl4IGvN7k6BsLCK3KilTPPdKmf1o4GJdcA/A1OXUi5KJVttz1ihUlo0I0sqccquw+cSlnAkmLYjdE/mMCOEe7AP10fg6hFWxYR4pM2Wyba8z0I9FOoVI/jzVI1rBypxL2gCsRkkYm1wzOOOcKJ3NY3u9AGcOx6dKg4fjDXpFLjFZMbuJNCg520Ko+uJ70gPdcOjCv13h8OJwvkBWgvmN7/UHwOa0mb77Rmilkpmw==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=[192.168.1.41]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hWI2x-0007GZ-9Z for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:12:31 +0200
Message-ID: <4952ef2f1e236b563f400ead537f8e7bba373bc1.camel@igalia.com>
From: Philippe Normand <philn@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 11:12:21 +0100
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: [PATCH] gnutls: Add a config option to enable the pkcs11 trust store
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
X-List-Received-Date: Thu, 30 May 2019 10:12:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since version 2.60 the glib-networking TLS database relies on GnuTLS's system
trust store, so not enabling it leads to TLS errors in applications depending on
glib-networking. The raised runtime warning is:

process:500): GLib-Net-WARNING **: 09:14:09.321: Failed to load TLS database: Failed to load system trust store: GnuTLS was not configured with a system trust
(app:490): ... TLS Error: TLS certificate  has unknown CA.
---
 meta/recipes-support/gnutls/gnutls_3.6.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.7.bb b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
index e05dc2b57d..3ad6e56579 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.7.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
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



