Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRrtx-00081D-82
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:20:25 +0200
Received: by gyf1 with SMTP id 1so85641gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=ciMnE70Xn7MNJ/RivJBVEDAqcvk+RPwkbxHg+96oMso=;
	b=ZTYgvJK1Qf3oufSdbvxMrpjhzHm5TmxZnDA87fc1f0fWw95qIET1EMaBCcSQoMnP1D
	sK8GbHZSsihTOSMDf+7ht4U3vTUqhLj1m0FLKIPrDWzMwJFB/7Is2bB6NX0Vl4TjTO61
	n4JpFiM2UwLkH7fCjpglJKkanAv4SzBYELqKk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Ke3sRj/fr0CJi9793shccmew70GMP1Co7J053iLmhSULmg6NhLlRl2wyVnKBanr9gP
	bv8ZiKAt4EqRB6O8JeKM9n+nvt4XkbfJYp5vNf2fdzssQdZKkzC5TMWMC5XchtWaF6ts
	cOLXqsKbl+XqsHsedMeHv77HROuA5ZHH+M3/o=
Received: by 10.101.183.2 with SMTP id k2mr5316805anp.7.1306959013998;
	Wed, 01 Jun 2011 13:10:13 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id b25sm906310anb.46.2011.06.01.13.10.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 13:10:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 20:09:55 +0000
Message-Id: <ddcfd950f58f85e00b0ea094534f27ccf1315152.1306958862.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306958862.git.otavio@ossystems.com.br>
References: <cover.1306958862.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306958862.git.otavio@ossystems.com.br>
References: <cover.1306958862.git.otavio@ossystems.com.br>
Subject: [PATCH 3/3] gnutls: link against 'dl' library
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
X-List-Received-Date: Wed, 01 Jun 2011 20:20:25 -0000

Fixes a build failure due missing references to 'dlopen' and
like. This started to happen after update to 2.12.5 at
ad52eacebdc413aa351de078ee878182a9c71e16. This also fixes the recipe
to use the INC_PR value otherwise we end not bumping PR if changing
only the '.inc' file.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-support/gnutls/gnutls.inc       |    4 +++-
 meta/recipes-support/gnutls/gnutls_2.12.5.bb |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 9f8d81b..9452190 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -30,6 +30,8 @@ do_configure_prepend() {
 	done
 }
 
+export LDFLAGS += "-ldl"
+
 PACKAGES =+ "${PN}-openssl ${PN}-extra ${PN}-bin ${PN}-xx"
 
 FILES_${PN} = "${libdir}/libgnutls.so.*"
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.5.bb b/meta/recipes-support/gnutls/gnutls_2.12.5.bb
index b27a065..9d3f5ab 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.5.bb
@@ -1,6 +1,6 @@
 require gnutls.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://gnutls-openssl.patch \
             file://configure-fix.patch"
-- 
1.7.2.5



