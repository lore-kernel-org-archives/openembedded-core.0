Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TdlJg-0007Gs-8p
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 18:20:56 +0100
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 28 Nov 2012 09:06:39 -0800
Received: by mail-fa0-f69.google.com with SMTP id v1so9165157fav.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 09:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=IWnim1jltTpOalkJG3BNr/6oEbuIvsb4d28CV4wRqmk=;
	b=oupIwdvMr2SkDZjN7a0L7S+4xy8eWACS3UatvfguOnlsIzW7PPIxKn/q+tK7ODBcj+
	0w/boQpzUyc/G8FAUCM2qIkix4lTOOkG2oT9kSpq9Lzru3E/XCTU3vIxSmD8/x9tAD5/
	SYycgj3xjdakxe2ipfv1wU/Say2W3I/5IkyxHiT2HnZmqM2y68E+l2Nzh7comKIddgVL
	nuoXHlK1eJZKwWUfcJ0YB5bjHAUCitrYmnbqcgm9CeZr4iB/1uArRodxOIxdUXWXV26Y
	vMEs1UKNsZ4RMOGh5uZ6ZKCCcEs/gB2hWDdan4Fu0gJYmuF8nQ+WFREYjKmPYiarqxNv
	Nk9w==
Received: by 10.216.93.138 with SMTP id l10mr7986989wef.194.1354122396058;
	Wed, 28 Nov 2012 09:06:36 -0800 (PST)
Received: by 10.216.93.138 with SMTP id l10mr7986980wef.194.1354122395755;
	Wed, 28 Nov 2012 09:06:35 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cf6sm7408437wib.3.2012.11.28.09.06.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 09:06:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 17:05:04 +0000
Message-Id: <1354122304-23877-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQngXniylstwJYXpdqIlHa2/n/dLAPJPNfPacyuV7XHmR8afDw3FrcSGCBq/jX/+99mks3jSF1EPsJjOXSaeq6I1XZ+/Pay0R9fGC6G5pUq/lfhifD4IlQGlgx+Ly9dL7eCyYEak0DS1guTNjYAOu+PpUcA++I2GTAeq/JSNYltEiT0cAM0msNPp/+j+2FklqC/Wf2Mb
Subject: [PATCH] guile: fix bashism in script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 17:20:56 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/guile/guile_2.0.6.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.6.bb b/meta/recipes-devtools/guile/guile_2.0.6.bb
index b5f55af..1f39e25 100644
--- a/meta/recipes-devtools/guile/guile_2.0.6.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.6.bb
@@ -28,6 +28,8 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
 SRC_URI[md5sum] = "3438cd4415c0c43ca93a20e845eba7e2"
 SRC_URI[sha256sum] = "3ece055145a5020dd36b84f5fbccd4b3846a671960dd5ee55931555f03200950"
 
+PR = "r1"
+
 inherit autotools gettext
 BBCLASSEXTEND = "native"
 
@@ -71,7 +73,7 @@ SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
 
 guile_cross_config() {
 	# this is only for target recipe
-	if [ "${PN}" == "guile" ]
+	if [ "${PN}" = "guile" ]
 	then
 	        # Create guile-config returning target values instead of native values
 	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
-- 
1.7.10



