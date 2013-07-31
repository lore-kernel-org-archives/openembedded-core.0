Return-Path: <rich.tollerton@ni.com>
Received: from us-aus-skprod2.natinst.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id C09BB6A5AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 18:33:21 +0000 (UTC)
Received: from mailserv58-us.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	r6VIXMVI024786 for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:33:22 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by mailserv58-us.natinst.com (Lotus Domino Release 8.5.3FP2 HF169)
	with ESMTP id 2013073113332233-874197 ;
	Wed, 31 Jul 2013 13:33:22 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 13:33:10 -0500
Message-Id: <1375295590-1887-1-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 1.8.3.4
X-MIMETrack: Itemize by SMTP Server on MailServ58-US/AUS/H/NIC(Release
	8.5.3FP2 HF169|September 14, 2012) at 07/31/2013 01:33:22 PM,
	Serialize by Router on MailServ58-US/AUS/H/NIC(Release 8.5.3FP2
	HF169|September 14, 2012) at 07/31/2013 01:33:22 PM,
	Serialize complete at 07/31/2013 01:33:22 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.10.8794, 1.0.431,
	0.0.0000
	definitions=2013-07-31_07:2013-07-31, 2013-07-31,
	1970-01-01 signatures=0
Subject: [master, dylan][PATCH v2] shadow: Fix build when DISTRO_FEATURES contains pam, libc-crypt
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
X-List-Received-Date: Wed, 31 Jul 2013 18:33:22 -0000

shadow falsely assumes that if --enable-libpam is set, it doesn't need to link
against libcrypt; this breaks chsh. (This same fix exists in Arch.)

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index caf24c0..108e11e 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -37,6 +37,10 @@ EXTRA_OECONF += "--without-audit \
                  --without-selinux"
 EXTRA_OECONF_libc-uclibc += "--with-nscd=no"
 
+# Build falsely assumes that if --enable-libpam is set, we don't need to link against
+# libcrypt. This breaks chsh.
+BUILD_LDFLAGS += "${@base_contains('DISTRO_FEATURES', 'pam', base_contains('DISTRO_FEATURES', 'libc-crypt',  '-lcrypt', '', d), '', d)}"
+
 PAM_PLUGINS = "libpam-runtime \
                pam-plugin-faildelay \
                pam-plugin-securetty \
-- 
1.8.3.4


