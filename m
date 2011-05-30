Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3mC-0007ZD-0h
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 16:49:04 +0200
Received: by yxn22 with SMTP id 22so1565858yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2011 07:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=51nyXVeViqkVjA1cTW9a/CY2afSRxN4o7JIlytfQ6Zw=;
	b=XLNPRbr8pVjAHmVsV8W1+1WOImyN5zwommFVf10CAWndeoPvp4wZJsn+dNsJ2yr/Nj
	nZjL8DoXC37+raPfmZ80t1MDcvRpvU4ot0pDehuPt3E4DWzXd4jDSyIUEq1lg9gsZdxb
	b0P2NTgrfaJrJmMeiI2/hqpfp9JkfpqNp0b8c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=DsxbmB5Fq1LIM6vPPlAomPB6nAJ7/Qp/xbb1NdX3JaZotA+fLCcKuesliLgMUd03D1
	oEbfCyYf6k51ss6tHzzKg8Mb+ATH/n+vUL7TqO5y6DbzR2MDNIsw+Eul8+E8xrr+kAZi
	Z7fQc9qPD+m0LGbZLPeMjh41jGnbYl4HjBXiA=
Received: by 10.101.200.18 with SMTP id c18mr3081361anq.58.1306766755059;
	Mon, 30 May 2011 07:45:55 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id x37sm3343391ana.26.2011.05.30.07.45.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:45:54 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2011 14:45:39 +0000
Message-Id: <13f584376eafaac44f9c8671f429124faefddd42.1306766682.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306766682.git.otavio@ossystems.com.br>
References: <cover.1306766682.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306766682.git.otavio@ossystems.com.br>
References: <cover.1306766682.git.otavio@ossystems.com.br>
Subject: [PATCH 2/2] qmake_base.bbclass: fix lrelease/lupdate binary names
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
X-List-Received-Date: Mon, 30 May 2011 14:49:04 -0000

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



