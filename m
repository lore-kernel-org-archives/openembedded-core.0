Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlbn-0007Ks-Jw
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 14:00:13 +0200
Received: by fxm19 with SMTP id 19so4768599fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Eerf9+5fsw2gPaeMKcMUSRG2zMd7j67XdygcmuXgpqg=;
	b=iyyqWmIwBOVQtXJZu7MypEHhbBFJa68oZ0ePuxcO9vx3go4auBiVdF3vpn1FskdjTW
	et5WNkvkXArtYhNT/XpMsQ4tysefMp7TalE3d8w7zHcM1gWJO38bfdxgYXSoidkl3cun
	6gVz0bdsezesc6hb+Ah5LlNBgwPzRqxCDQnQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=xZQnWTy2KTpaRp20eiWg0SwiCg1W5z+llyO1qZ/uxC4uMwXW//puKfobthpG/bB3DG
	dj7HxQi24lHihM9strtHWR41iuVns1PqF7GJCoEcZxbssgL5rEUSkKI9gyl16VP9vjnA
	3g+gz5j3uDT6j88iwx7dlsBtkxPakgqhHSeSY=
Received: by 10.223.83.141 with SMTP id f13mr743738fal.22.1305028645822;
	Tue, 10 May 2011 04:57:25 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c22sm2351104fat.38.2011.05.10.04.57.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:57:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2011 13:57:14 +0200
Message-Id: <1305028634-27912-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [RFC] nativesdk.bbclass: define empty PACKAGES/PACKAGES_DYNAMIC
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
X-List-Received-Date: Tue, 10 May 2011 12:00:13 -0000

* we had similar patch for native.bbclass
  41d77ac37f606e54293826ba1e94a4254bddbfa6
  I have no idea if the same could be used for nativesdk, because I'm
  not using generated SDKs at all, that's why it's RFC and if there are
  better ways to hide such errors, please let me know

* maybe PACKAGES just don't get extra prefix -nativesdk like
  glib-2.0-utils-nativesdk

* those errors are shown like this:
  ERROR: Trying to resolve runtime dependency glibc-charmap-utf-8 resulted
  in conflicting PREFERRED_PROVIDER entries being found.
  The providers found were: ['/OE/shr-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.12.bb', 'virtual:nativesdk:/OE/shr-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.12.bb']
  The PREFERRED_PROVIDER entries resulting in this conflict were: ['PREFERRED_PROVIDER_virtual/libc = eglibc', 'PREFERRED_PROVIDER_virtual/libc-nativesdk = eglibc-nativesdk']

  NOTE: multiple providers are available for runtime glibc-charmap-utf-8 (eglibc-nativesdk, eglibc, glibc, glibc-nativesdk)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match glibc-charmap-utf-8
  NOTE: multiple providers are available for runtime glib-2.0-utils (glib-2.0-nativesdk, glib-2.0)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match glib-2.0-utils

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/nativesdk.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index cd34a79..1edb7ab 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -4,6 +4,11 @@ EXCLUDE_FROM_WORLD = "1"
 
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}"
 
+PACKAGES = ""
+PACKAGES_virtclass-nativesdk = ""
+PACKAGES_DYNAMIC = ""
+PACKAGES_DYNAMIC_virtclass-nativesdk = ""
+
 #
 # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
 #
-- 
1.7.5.rc3



