Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 417AC72CE7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:48:49 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id tr6so7448706ieb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 06:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YRMRKqlh2gv/sn8LjeEOTG5tQxJ7vF8eqM9ftFGwYzM=;
	b=A6jQvcTWnYjDtyWgrvzJtVl/Lkx9JG+kIQB5opuGb8QXbvAewWBFWObrOchSWkIEBZ
	i6JiycckjAIyVzAOZxFBjU980M8JZnrOICgKhVIrNfAuDpk1YURNbsyObpi5SyeJtUM8
	rsskaZzGsnGx5UuDjuLdpIrwJJvyFSqANUdp6HI0TF5UXs/nVZ/FzfL9egwWNDAS10Xa
	GiMDz+A7UtaEjisrn7rj0+EHuA2BvKbm+qVUZ2s+3dIDmD0eKuKlCodduPPHUnablCZ9
	652OqsGVkqeYOzA24EJBAKno+4viHo+LMOb+2XoHGe0bZu9MY4WVhy91r4VTVNXuZQ+n
	k6tg==
X-Gm-Message-State: ALoCoQkgQvWSruc/LIwpJ+MaTmmA8JBxT9fck8Hl2uUHujYUro62Yqxsv/TAaeHAQ+stYNGBtAYo
X-Received: by 10.107.8.22 with SMTP id 22mr4136743ioi.67.1422024529600;
	Fri, 23 Jan 2015 06:48:49 -0800 (PST)
Received: from syncev.vlan14.01.org ([198.145.21.8])
	by mx.google.com with ESMTPSA id qj3sm748363igc.17.2015.01.23.06.48.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jan 2015 06:48:48 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jan 2015 06:48:17 -0800
Message-Id: <1422024498-18778-2-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1422024498-18778-1-git-send-email-patrick.ohly@intel.com>
References: <1422024498-18778-1-git-send-email-patrick.ohly@intel.com>
Subject: [master][dizzy][PATCH 1/2] binconfig-disabled: try harder to prevent usage of config scripts
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
X-List-Received-Date: Fri, 23 Jan 2015 14:48:49 -0000

Returning a non-zero exit code is not enough to cause errors when configure
scripts call the patched config scripts: for example, swig's configure script
uses PCRE_LIBS=`$PCRE_CONFIG --libs` and does not abort on errors. Using empty
output may then succeed, for example when the required library is available
indirectly.

Returning some nonsense command line arguments covers such cases, because
using them will definitely lead to errors during compilation. The faked
arguments were chosen such that these errors can be linked back to the root
cause.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/binconfig-disabled.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/binconfig-disabled.bbclass b/meta/classes/binconfig-disabled.bbclass
index 27f904e..4c42ae2 100644
--- a/meta/classes/binconfig-disabled.bbclass
+++ b/meta/classes/binconfig-disabled.bbclass
@@ -10,6 +10,9 @@ FILES_${PN}-dev += "${bindir}/*-config"
 do_install_append () {
 	for x in ${BINCONFIG}; do
 		echo "#!/bin/sh" > ${D}$x
+		# Make the disabled script emit invalid parameters for those configure
+		# scripts which call it without checking the return code.
+		echo "echo '--should-not-have-used-$x'" > ${D}$x
 		echo "exit 1" >> ${D}$x
 	done
 }
-- 
1.8.4.5


