Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71N-0004kh-LQ
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:53 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1441018wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=ViF751NWi6LW0UAw2aohK6snPna4VAztNfNAs1QreOc=;
	b=FLAK9UdYeFhSvWzZPtEdazciuMkDSZbQAxF33O/bWZGlU8K6dlP+YwviQ//wEQ3ggc
	f8e0gQPF/HIHlKromF8VkLjxr6mzqbTEv0CA4P8yKOjLKb1huAtL9ROOFgEZDbZEDYR/
	GPzR8EM1CGabDr1UEYSaD3cz7KwkVJh3MiE5x+NryR3UwXfUDzSizc82nmGt6uINe76n
	5cW8kRlWVso1LtZ12ghzzrB0jjYTufwe/gFollHtt12M+gAdBmwjyG7HqDYbL8jxFHNC
	vsmIm61U5hXfuhwfdTZgIwlXQK/l2wVxJoSlIBmCt4ohcyX91/w7Ac3EeDPWwmbAD2nx
	erpA==
Received: by 10.180.109.166 with SMTP id ht6mr12374065wib.11.1344196212288;
	Sun, 05 Aug 2012 12:50:12 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:11 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:46 +0200
Message-Id: <1344196136-7643-19-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlFJISolz3RTuedakoKtF6jCZ/icoc5MpucNB3qCv3zLAbrrG3tQLbDAW3kGN4R6+jAER95
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 18/28] openssh: use ${localstatedir} instead of /var for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:55 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
index 376023c..8757f82 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -78,7 +78,7 @@ do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
-	rmdir ${D}/var/run/sshd ${D}/var/run ${D}/var
+	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${localstatedir}
 }
 
 ALLOW_EMPTY_${PN} = "1"
-- 
1.7.7.6



