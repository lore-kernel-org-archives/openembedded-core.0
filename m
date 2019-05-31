Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 685057E550
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
	bh=+b1vPJqm5t+46nUzA8UOJxKUc9zk2+Wc9Rj1YirgLTQ=; 
	b=s3RIoZ7LUpjyJOnWDUZvY3V57CNYgCBG+FhYI7q9flqRnqrt06PUqHkyCf9FgjqUsRrS0NjgFg/9J2Wu4kqyAsOx1mr2bkkbAtSFh6YjW304usINNx98HvhGqhC9sjn69Mu1n/FUnRWWERxh5a7g0jCKRm6ovLyAG9OjFcrbvPcNMNeLX9FvxNfUPMRmkZUH4+4tBuY5/VjnJQIqmWNR5m0lmOqUpTHE6QJ16mrSVhVaOYRNGytD/lpaepEoh3qYVJ+XNQTCnRXCk8rpPZJyDS6M2T6q6w323rt8d9WKVjwYFNdDlokA0QnWta8k0gIVUVdmLsvtS4sZEm92zWqvTg==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=localhost.localdomain) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hWd9h-0006Qa-IH; Fri, 31 May 2019 10:44:53 +0200
From: Philippe Normand <philn@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 09:44:40 +0100
Message-Id: <20190531084440.12532-1-philn@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gnutls: Use ca-certificates as default trust store file
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
X-List-Received-Date: Fri, 31 May 2019 08:44:54 -0000
Content-Transfer-Encoding: 8bit

Since version 2.58 the glib-networking TLS database relies on GnuTLS's system
trust store, so not enabling it leads to TLS errors in applications depending on
glib-networking. The raised runtime warning is:

process:500): GLib-Net-WARNING **: 09:14:09.321: Failed to load TLS database: Failed to load system trust store: GnuTLS was not configured with a system trust
(app:490): ... TLS Error: TLS certificate  has unknown CA.
---
 meta/recipes-support/gnutls/gnutls_3.6.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.7.bb b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
index e05dc2b57d..01dd23c961 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.7.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
@@ -44,6 +44,7 @@ EXTRA_OECONF = " \
     --enable-local-libopts \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
+    --with-default-trust-store-file=/etc/ssl/certs/ca-certificates.crt \
 "
 
 LDFLAGS_append_libc-musl = " -largp"
-- 
2.20.1


