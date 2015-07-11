Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3596017E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jul 2015 07:30:34 +0000 (UTC)
Received: by iggp10 with SMTP id p10so48597190igg.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jul 2015 00:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=W41a5lja1G5vPDvD27OOnLwXzCEPnNlmKas9BxcldK8=;
	b=F3mezNf5oAs8cLQ+KK3P8hdSJgRpWleJfquMkbavbiW1zBBsR4axXjYlj1FIdNGkH3
	zVe+oUzsYD8CG0U5hVQZBlNlLysfRV0sFsLJ9VsMhCasodP1fk6fa7sspaCkoSbFs3qR
	tvUgIETo7/tf/N0MVcs0Xwo5qTuEzCvNL48QYFqIkAlfRYE4cKtIJHPixrTUkWLrFCg1
	DiR3tOx8ORBWRs8AAY/L5uDNFpXMZYZcyR3wfuSIEg+o/1C4VPyB7B5xd1bTE/WmWolP
	0j4qYPxa0EEV8+rAe3RWYMLr17Iuxn3qQMCDwHMkzyQwWSg3PktIO7I60KzQMYI4vJP/
	ANDQ==
X-Received: by 10.107.27.148 with SMTP id b142mr8791821iob.114.1436599834632; 
	Sat, 11 Jul 2015 00:30:34 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	l62sm8138095iol.36.2015.07.11.00.30.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 11 Jul 2015 00:30:33 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Jul 2015 00:30:24 -0700
Message-Id: <1436599824-9955-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gnupg: fix build of GPLv2 version of gnupg with gcc 5
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
X-List-Received-Date: Sat, 11 Jul 2015 07:30:37 -0000

Force gcc's traditional handling of inline to avoid issues with gcc 5.

Upstream gnupg has a more specific fix, however it was made after
gnupg was relicensed to GPLv3 so may be unsafe to backport directly.

  http://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=5093bed27580e608de073bcc5953bd76b6b8b2de

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gnupg/gnupg_1.4.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index aef515d..6999f81 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -81,6 +81,9 @@ EXTRA_OECONF = "--disable-ldap \
                 ac_cv_sys_symbol_underscore=no \
 		"
 
+# Force gcc's traditional handling of inline to avoid issues with gcc 5
+CFLAGS += "-fgnu89-inline"
+
 do_install () {
 	autotools_do_install
 	install -d ${D}${docdir}/${BPN}
-- 
1.9.1


