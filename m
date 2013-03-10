Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1UEi4F-000491-D3
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Mar 2013 16:21:43 +0100
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id A5879203FA;
	Sun, 10 Mar 2013 11:05:08 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute5.internal (MEProxy); Sun, 10 Mar 2013 11:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version; s=smtpout; bh=8M+sTZ
	LKClws2VC7hfTwPd1p9s8=; b=eFsRRJQ2CLDCp8n/L9Lum8qdzHVpHkxPiP0iTo
	2jtaDCD1qIduj62AlJnwrpleBZF+hpKbb3OblT3ET516enVJ8LdGGFdd7ktakpGs
	FPa3Rh2Vh63moXOEBOXxZF3D0GbWzpnhPZ8qAWBWoP1MfMIirS3giO95QakA6wbv
	lJVKA=
X-Sasl-enc: hLUVHg/O8pPmBCrNqUve39gOj70Y96ilh8jKuvhOZMT1 1362927908
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 415932011A9;
	Sun, 10 Mar 2013 11:05:08 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1362810871.9443.120.camel@ted>
References: <1362748245.6076.748.camel@localhost>
	<1362810871.9443.120.camel@ted>
Date: Sun, 10 Mar 2013 11:05:07 -0400
Message-ID: <1362927907.22094.0.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cracklib: Generate compiled dict using default dictionary
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
X-List-Received-Date: Sun, 10 Mar 2013 15:21:43 -0000
X-Groupsio-MsgNum: 36359
Content-Type: multipart/mixed; boundary="=-ohysNn2oiNeC95oGlYYh"

--=-ohysNn2oiNeC95oGlYYh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-03-09 at 06:34 +0000, Richard Purdie wrote:

> The patch doesn't quite do what you think it does. The _appends() stack,
> not override and hence the native append is empty. You probably want to
> do a:
> 
> do_install_append_class-target () {
> ....
> }

Ah, thanks.  Something like this then?



--=-ohysNn2oiNeC95oGlYYh
Content-Disposition: attachment; filename*0=0001-cracklib-Generate-compiled-dict-using-default-dictio.pat; filename*1=ch
Content-Type: text/x-patch; name="0001-cracklib-Generate-compiled-dict-using-default-dictio.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From eff8b0f119ca94dea362d7df04824789ae8b61cb Mon Sep 17 00:00:00 2001
From: Colin Walters <walters@verbum.org>
Date: Thu, 7 Mar 2013 18:45:22 -0500
Subject: [PATCH] cracklib: Generate compiled dict using default dictionary

While cracklib compiles, the generated library's FascistCheck() API
will look for the default compiled dictionary, fail to find it, and
invoke exit(1), which then in turn breaks gnome-initial-setup that
uses cracklib via libpwquality.  (Quality here obviously referring to
the password, and not the libraries...)

What we do here is basically the same as what happens in the current
Fedora spec file, except the latter uses a far larger dictionary.

To make this work, we need to build cracklib-native because the
dictionary compiler is written in native code.

Signed-off-by: Colin Walters <walters@verbum.org>
---
 meta/recipes-extended/cracklib/cracklib_2.8.22.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
index 1ae1aca..7e398f4 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "http://sourceforge.net/projects/cracklib"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-DEPENDS = "zlib"
+DEPENDS = "cracklib-native zlib"
+DEPENDS_class-native = "zlib"
 PR ="r0"
 
 EXTRA_OECONF = "--without-python"
@@ -15,3 +16,9 @@ SRC_URI[md5sum] = "463177b5c29c7a598c991e12a4898e06"
 SRC_URI[sha256sum] = "feaff49bfb513ec10b2618c00d2f7f60776ba93fcc5fa22dd3479dd9cad9f770"
 
 inherit autotools gettext
+
+BBCLASSEXTEND = "native"
+
+do_install_append_class-target() {
+	create-cracklib-dict -o ${D}${datadir}/cracklib/pw_dict ${D}${datadir}/cracklib/cracklib-small
+}
-- 
1.8.1.2


--=-ohysNn2oiNeC95oGlYYh--
