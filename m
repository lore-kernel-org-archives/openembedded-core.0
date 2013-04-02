Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UMs16-0000AU-Gj
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 05:36:12 +0200
Received: by mail-da0-f52.google.com with SMTP id f10so1315701dak.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2013 20:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=0/UrgDxStzXSMzcS2WEENClLyDAi9PciviAQjPidJmU=;
	b=z3xRqCWmorJx1xo828PVZ5wAX+hpXV2x/PZGZUYhSTt59birW5IYUOl4u6v57OTY7l
	xAK8tA84JAh2aXe2MffTr5Abp7mo+apCjKvULybtuwF3Kivu8YaPQu6O9BCVIr59FDIz
	6BPYOdj+PU6qFcn2qrZ/H6pF2/WkiMLOCjB6SFd6y/wjcENtIawMnVNiqDYLwZEGyAZt
	+U6wV70NCg9JbKcfbR5q6mYZa+ktw3iTTPyyqpKUIM13GNVQyiltDgbcr2WZc5UHQm3I
	3r6KGjMC4++U5Fcqz21OjVwLTvuUm/WLXiAdj/2QG9zlXSFV4e2qej2IafsfdoPdn30b
	iGMA==
X-Received: by 10.66.168.6 with SMTP id zs6mr22268943pab.5.1364872742563;
	Mon, 01 Apr 2013 20:19:02 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id yp2sm340221pab.10.2013.04.01.20.19.01
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 20:19:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2013 20:18:24 -0700
Message-Id: <1364872704-14812-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] eglibc: Let eglibc-extra-nss-dev exist as empty package
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
X-List-Received-Date: Tue, 02 Apr 2013 03:36:12 -0000

eglibc-extra-nss-dev is a dependency for libc6-dev but
the package is empty and is not created as a result target
install of libc6-dev fails. This will create an empty package

[Yocto Bug #4168]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 88a00a4..ca0cc4c 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -17,7 +17,9 @@ python __anonymous () {
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
+PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc eglibc-extra-nss-dev"
+
+ALLOW_EMPTY_eglibc-extra-nss-dev  = "1"
 
 # The ld.so in this eglibc supports the GNU_HASH
 RPROVIDES_${PN} = "glibc rtld(GNU_HASH)"
-- 
1.7.9.5



