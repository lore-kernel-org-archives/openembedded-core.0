Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3La-0007d8-Gi
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:30 +0200
Received: by wibhm11 with SMTP id hm11so885140wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=uOuli9CGPS2ms4I5tNpVa/sq3nsXXJQbtXJ8OqpV3to=;
	b=C21xYlxAstXpgttRNO/pb+1hEzmlwvcwEEKH1OMfdj/CXo9ZNeN8qARNW1xlRpaf+C
	AHUiZQ7mhqY0enh9VkXDOuEjHjQLo1lGtwL8rnmyLnAzjN9XHF0QWf8Snfz+/JUtC/pK
	W+OGD24XyNRuE2w6qqj+TeUVpzIvRQ6Da53xcKZG41WLB6bEZsaChOlasBFYDIvXibn2
	ciiHvuuf+pFM6NYXo7UxYtw/GBjV4fknu4augA8kzTWje7f9bYYAVf287q7zQ63SzYcx
	h/sE2lCSqNLkESWzQNr6SLHlVJJISVoMj6g8DQtACxbbJPS5yu2M7TcmS1iyfGXW3LjL
	sArw==
Received: by 10.180.78.4 with SMTP id x4mr11435476wiw.19.1344182087120;
	Sun, 05 Aug 2012 08:54:47 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.54.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:54:46 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:49 +0200
Message-Id: <1344182057-15981-3-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQmEjBnmN0LRUz24GGsf+eCgDr4+/oIKLszLDC6C4NRdSoJlXObPWnivuW/VHP7ju0Z0Ohjy
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/30] alsa-state: use ${sbindir} instead of /usr/sbin for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:30 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 83c9faa..e2eb4fe 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -46,9 +46,9 @@ FILES_alsa-states = "${localstatedir}/lib/alsa/*.state"
 pkg_postinst_${PN}() {
 	if test -z "$D"
 	then
-		if test -x /usr/sbin/alsactl
+		if test -x ${sbindir}/alsactl
 		then
-			/usr/sbin/alsactl -f ${localstatedir}/lib/alsa/asound.state restore
+			${sbindir}/alsactl -f ${localstatedir}/lib/alsa/asound.state restore
 		fi
 		# INITSCRIPT_PARAMS changed, so remove the old and
 		# install the new setting.
-- 
1.7.7.6



