Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web08.12873.1604496965850838270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 05:36:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.valek@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0A4Da2bU025827
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Nov 2020 14:36:03 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.49.155])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 0A4Da2Ed003207;
	Wed, 4 Nov 2020 14:36:02 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id AB74F950AAA;
	Wed,  4 Nov 2020 14:36:01 +0100 (CET)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>,
        Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [OE-core][PATCH] autotools: CONFIG_SHELL defaults
Date: Wed,  4 Nov 2020 14:35:33 +0100
Message-Id: <20201104133533.18730-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

Do not hard-code default shell to /bin/bash even if CONFIG_SHELL is already
set to other shell, but keep /bin/bash as a default. This will fix a shadow
issue, where CONFIG_SHELL is exported to /bin/sh, but /bin/bash is used
even if it's not installed.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 70804b82b4..2ceb790b5c 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -90,7 +90,7 @@ oe_runconf () {
 	cfgscript=`python3 -c "import os; print(os.path.relpath(os.path.dirname('${CONFIGURE_SCRIPT}'), '.'))"`/$cfgscript_name
 	if [ -x "$cfgscript" ] ; then
 		bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
-		if ! CONFIG_SHELL=/bin/bash ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
+		if ! CONFIG_SHELL=${CONFIG_SHELL-/bin/bash} ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
 			bbnote "The following config.log files may provide further information."
 			bbnote `find ${B} -ignore_readdir_race -type f -name config.log`
 			bbfatal_log "configure failed"
-- 
2.11.0

