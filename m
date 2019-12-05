Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6D57F9A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 22:50:43 +0000 (UTC)
IronPort-SDR: ggRibmetSi/1OiVwgWj4GrVYIirsPu+Jl9+fEnkjOwQJDngpbQnb8cAjfA9W2txJ6TD5koOT1W
	Q7aGJFmXh1uZZluU/Xlm2vAlCVnRprZSqya5bxWfdZAgw350PzYvEZeUdH1zZo8k6Y0+krW0jL
	i7H6Vpe0vocXaCaQ42ZBX3tQUrBRsJYWIjREIhOh8nomtQz74qIHEkhuMZ5EP3Bkfm49kue6kO
	Izd8AoUryZbvtybMJ9ZKHURSV4tmGdp40vnb/59wNTdhkwpmGzloNOYIDF8za1t1BF+2WaobvA
	WaM=
X-IronPort-AV: E=Sophos;i="5.69,282,1571695200"; 
   d="scan'208";a="3293475"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 23:47:33 +0100
Message-Id: <20191205224733.8781-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [master][zeus][PATCH] meson.bbclass: Prevent meson from downloading wrapped projects
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
X-List-Received-Date: Thu, 05 Dec 2019 22:50:44 -0000
Content-Transfer-Encoding: 8bit

Meson has support for downloading subprojects using something called
wraps. This interferes with bitbake's expectations of all downloads
being done by the fetch task. To avoid this, tell meson to not
download any wraps.

Suggested-by: Mattias Jernberg <mattias.jernberg@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/meson.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index efa6234078..dc8c28963c 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -24,7 +24,8 @@ MESONOPTS = " --prefix ${prefix} \
               --infodir ${@noprefix('infodir', d)} \
               --sysconfdir ${sysconfdir} \
               --localstatedir ${localstatedir} \
-              --sharedstatedir ${sharedstatedir} "
+              --sharedstatedir ${sharedstatedir} \
+              --wrap-mode nodownload"
 
 EXTRA_OEMESON_append = " ${PACKAGECONFIG_CONFARGS}"
 
-- 
2.21.0


