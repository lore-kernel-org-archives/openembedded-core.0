Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLqxe-00050B-70
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 08:07:22 +0200
Received: by pxi6 with SMTP id 6so3225565pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2011 23:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=nvDiZSIC9AxNOMZ4+gpPYu69WwHhOlB+NdwYPqjPsyI=;
	b=GI3Qfyd+aXOH//2CsB/0QZD149ZaIhBwq4o2hSPi5SBTj5QGUvu1astynGoeSSlIsi
	SKvq+wkSxHk8QdIA4uv7NLkQh0I/7mNQkO+Px0052H3IOVe6a0uGdjZjHHpwy1nn5D7q
	SjnNbPG39slkZAUC1DeYkbYqlfpbAU9U5IxKw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=IgkzuC3DkoZHwemrNe0bbl6trsW1diRAqBGH9OLr8jdinU8hIXLCbgetPad9SyMp1N
	Z1WBB7RSZ0q/K8s5eWg4Psv3D3iZaPbz6SVx9UqEa3gZcyxAxqk/oVw8tbcwschnsNRY
	Fnr4xGK46OUP0l2UCHFZEVRC7or4j0QOluHdw=
Received: by 10.68.20.138 with SMTP id n10mr4738250pbe.280.1305525869003;
	Sun, 15 May 2011 23:04:29 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k8sm1880364pbk.66.2011.05.15.23.04.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 23:04:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sun, 15 May 2011 23:04:21 -0700
Message-Id: <ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305525725.git.raj.khem@gmail.com>
References: <cover.1305525725.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
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
X-List-Received-Date: Mon, 16 May 2011 06:07:22 -0000

Do not define DEPLOY_DIR_IMAGE
Append -uclibc to STAGING_DIR_TARGET only for target recipe and cross
recipes
Append -uclibc to STAGING_DIR_HOST only for target recipes.

These changes make sure that we still share the native sysroot

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-uclibc.inc |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index 27f6ec6..4bd313f 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -20,10 +20,9 @@ CXXFLAGS += "-fvisibility-inlines-hidden"
 
 IMAGE_LINGUAS = ""
 
-DEPLOY_DIR_IMAGE = "${TMPDIR}/deploy/images"
 DEPLOY_DIR_append = "-uclibc"
-STAGING_DIR_TARGET_append = "-uclibc"
-STAGING_DIR_HOST_append = "-uclibc"
+STAGING_DIR_TARGET_append = "${@['-uclibc', ''][oe.utils.inherits(d, 'native', 'nativesdk')]}"
+STAGING_DIR_HOST_append = "${@['-uclibc', ''][oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'crosssdk')]}"
 SSTATE_MANIFESTS_append = "-uclibc"
 
 LIBC_DEPENDENCIES = "\
-- 
1.7.4.1



