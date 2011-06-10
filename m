Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QUq6M-0000ai-9f
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 03:01:30 +0200
Received: by pzk36 with SMTP id 36so1064498pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 17:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=TovE/pHD6R45qxXM3aLAAY6hfzqdVLegUEd/lk3u+OY=;
	b=GwghCGiCBoHIvQKs7mD7FPjJB3VnVf03ehnPb7qy9oqne7speuVUutwlm0oStn9dCo
	8i898WKS17yxpZD9agNNeCQbQLpMyqpGeywfYbhdVHTzBAQcr9Cggw8TTiOUDLb7heQ3
	JbokmLTxIAYU62aswxk5o0wQpylZiDGWLXOB8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GLJGwopzyuY2lyHx+wOB6YjWVG/sh+al0wrT4R6tMQP1rtJ3XN5qx7hyL+w2leJaS1
	zLAfUIAZrNxY02HSMMYTU+ssOj4OTIfvjwiL57mo8PIhdKTrjynGTVJMrMf6WcrT4Fce
	qpREs+G3DvtXi6pOstjIlQOdn4krNtjl4fa0Q=
Received: by 10.68.1.68 with SMTP id 4mr658186pbk.306.1307667489362;
	Thu, 09 Jun 2011 17:58:09 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i7sm1841710pbj.90.2011.06.09.17.58.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 17:58:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 17:57:47 -0700
Message-Id: <1307667467-467-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1307667467-467-1-git-send-email-raj.khem@gmail.com>
References: <1307667467-467-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] sysklogd.inc: Check for package-management in IMAGE_FEATURES
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
X-List-Received-Date: Fri, 10 Jun 2011 01:01:30 -0000

ONLINE_PACKAGE_MANAGEMENT does not exist on oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index f2b1c15..f6a56ec 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
 # syslog initscript is handled explicitly because order of
 # update-rc.d and update-alternatives is important (see below)
 DEPENDS_append = " update-rc.d update-rc.d-native"
-RDEPENDS_${PN}_append = " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
+RDEPENDS_${PN}_append = " ${@oe.utils.contains("IMAGE_FEATURES", "package-management", "update-rc.d", "", d)}"
 
 SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
            file://no-strip-install.patch \
-- 
1.7.4.1



