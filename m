Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 99CCC6FDA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 10:53:04 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hi2so3809856wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 03:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AqrLwqnRGalEUp7NJ7KDhL3AaMASB+VdPiLCnQUYa0c=;
	b=BsNtbPNxLVC63UMp7+aKuV3DTHOiVVVJdAFklbToEXO/QYzTfh8N3ZNiLeXHC8UYoM
	mNgOi0xj4Anc4OPdL1406ZZVmfa4hLwSW6DC18GdDLHS1zM77rViXhqFMCwarBb14Abk
	xzvWv88T4uYNDOju3dBHWQ8cy2dqZrmma0TXlgobg9/6hHwpBXHUm31XSIRl+aKIC39Y
	yeOwGD0zFZTfg7KZc24U5WvzF51RvuR5F8mABQg0gqTO8Jm4Sbj3/XjTmRPTwB+R3Gmz
	Hkv/c2iSdFJbOoGNxPg5/rSbKD9j6NcvNskN4C4viVqImnQa69WdipPdtyvDa3bVAP74
	IH+g==
X-Gm-Message-State: ALoCoQmla6cYY2l/9ZT0WxgfRCvN8o3f4qoq8pcgDzGtF/T6asg/jKHjNDoq9SgdhsXfmdOM41ss
X-Received: by 10.194.84.101 with SMTP id x5mr26909634wjy.52.1402915985645;
	Mon, 16 Jun 2014 03:53:05 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id r5sm18183470wjq.26.2014.06.16.03.53.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jun 2014 03:53:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jun 2014 11:52:56 +0100
Message-Id: <1402915976-12506-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] wget: use GnuTLS instead of OpenSSL
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
X-List-Received-Date: Mon, 16 Jun 2014 10:53:12 -0000

OpenSSL has license complications and GnuTLS is preferred, so although the
license complications don't impact wget use GnuTLS for consistency.

Also add a recommendation on ca-certificates so that https: URLs work.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/wget/wget.inc |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index a778bca..642d502 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -3,15 +3,16 @@ HOMEPAGE = "https://www.gnu.org/software/wget/"
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "openssl zlib libpcre"
+DEPENDS = "gnutls zlib libpcre"
 
 INC_PR = "r16"
 
 inherit autotools gettext texinfo update-alternatives
 
-EXTRA_OECONF = "--enable-ipv6 --with-libssl-prefix=${STAGING_DIR_HOST} \
-                --with-ssl=openssl --disable-rpath --disable-iri \
+EXTRA_OECONF = "--enable-ipv6 --with-ssl=gnutls --disable-rpath --disable-iri \
                 ac_cv_header_uuid_uuid_h=no"
 
 ALTERNATIVE_${PN} = "wget"
 ALTERNATIVE_PRIORITY = "100"
+
+RRECOMMENDS_${PN} += "ca-certificates"
-- 
1.7.10.4


