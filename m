Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRrn9-0007QO-8W
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:13:23 +0200
Received: by gyf1 with SMTP id 1so82582gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=51nyXVeViqkVjA1cTW9a/CY2afSRxN4o7JIlytfQ6Zw=;
	b=UAHp/d6UkhJcrgJZdc1oqIieY2rspeLdWfGT4sw4xplNQR9Tq5bm8GxBmJ7g+lb8Gz
	5RrTn0XJcPzQHpllysMFDmMS2IJLOuO3eeFWp7jvB5imgtrbzkB7bP5Y9GGcIUDh6y4Z
	7+UePJnbdKQSNH6ZIYTzN7PnKuxx9Y2+gG294=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=FkC5Nslblu8Bbxtu5l61ZEnl8Oo8XG4nidoIaDNTm7dj6hmx0Xt1Yta31Dm71VFjF5
	MP+7Fd0Wa2OhWDYy/BcUH4oOS3Rk4n21shpbCIRQNBnd9KHBU0vVa3HCFDYJ/Kl5BF6L
	oqFcwm9y3Q9kWu48Sro1UT9acHhnEmG9xVk3g=
Received: by 10.91.47.7 with SMTP id z7mr519905agj.137.1306959011852;
	Wed, 01 Jun 2011 13:10:11 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id b25sm906310anb.46.2011.06.01.13.10.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 13:10:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 20:09:54 +0000
Message-Id: <ac909be8f5af8515017da51e7217fc15ef69379e.1306958862.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306958862.git.otavio@ossystems.com.br>
References: <cover.1306958862.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306958862.git.otavio@ossystems.com.br>
References: <cover.1306958862.git.otavio@ossystems.com.br>
Subject: [PATCH 2/3] qmake_base.bbclass: fix lrelease/lupdate binary names
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
X-List-Received-Date: Wed, 01 Jun 2011 20:13:23 -0000

To support translation, qmake based projects usually call lrelease and
lupdate however OE changes the binary names so this needs some mangle
to work out of box.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/qmake_base.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
index a054efd..165d689 100644
--- a/meta/classes/qmake_base.bbclass
+++ b/meta/classes/qmake_base.bbclass
@@ -92,6 +92,11 @@ qmake_base_do_configure() {
 		bbnote "qmake prevar substitution: ${EXTRA_QMAKEVARS_PRE}"
 	fi
 
+	# Hack .pro files to use OE utilities
+	find -name '*.pro' \
+	     -exec sed -i -e 's,=\s*.*/lrelease,= ${OE_QMAKE_LRELEASE},g' \
+	                  -e 's,=\s*.*/lupdate,= ${OE_QMAKE_LUPDATE},g' '{}' ';'
+
 #bbnote "Calling '${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o Makefile $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST'"
 	unset QMAKESPEC || true
 	${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o Makefile $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error calling ${OE_QMAKE_QMAKE} on $PROFILES"
-- 
1.7.2.5



