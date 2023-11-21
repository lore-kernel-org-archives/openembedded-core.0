Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E75C61D90
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 19:05:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1649.1700593540570266311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 11:05:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F7DF168F;
	Tue, 21 Nov 2023 11:06:27 -0800 (PST)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B64523F6C4;
	Tue, 21 Nov 2023 11:05:39 -0800 (PST)
From: adam.johnston@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [OE-Core] [PATCH 1/1] classes: Fix sed command line for passwd-expire
Date: Tue, 21 Nov 2023 19:05:28 +0000
Message-Id: <20231121190528.2655502-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121190528.2655502-1-adam.johnston@arm.com>
References: <20231121190528.2655502-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 19:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190989

From: Adam Johnston <adam.johnston@arm.com>

A previous commit tried to add the --follow-symlinks option to
the perform_passwd_expire function in useradd_base.bbclass, however it us=
ed
a single -.

This is interpreted as --file=3Dollow-symlinks which results in...

sed: couldn't open file ollow-symlinks: No such file or directory

and...

ERROR: <image name>: passwd --expire operation did not succeed.

Fix by adding the missing -

(From OE-Core rev: 4d6c63a56c50536806b21cbe72416d8f1b84f589)

Signed-off-by:  Adam Johnston <adam.johnston@arm.com>
---
 meta/classes/useradd_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_bas=
e.bbclass
index f1a7a9695d..5e1c699118 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -160,7 +160,7 @@ perform_passwd_expire () {
 	local username=3D`echo "$opts" | awk '{ print $NF }'`
 	local user_exists=3D"`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" !=3D "x"; then
-		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -follow-symlinks =
-i \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" ||=
 true
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed --follow-symlinks=
 -i \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" |=
| true
 		local passwd_lastchanged=3D"`grep "^$username:" $rootdir/etc/shadow | =
cut -d: -f3`"
 		if test "x$passwd_lastchanged" !=3D "x0"; then
 			bbfatal "${PN}: passwd --expire operation did not succeed."

