Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8127FC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 21:29:34 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.11821.1635542973117102002
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 14:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=Nm/Y+i6Z;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635542971;
  x=1667078971;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4ST6vF1wcks3gN4s8TB6zxqsGa+PfTE8FdPfRohUNXw=;
  b=Nm/Y+i6ZT9PKE6tVcEmbFohQhH1meXMF6MWdvWQGuhTWyU2oop2Gh/4E
   2Frmyy153X381INXdop4RzULLqyQflBJTlx+UvVJiL6Ci3CwaeIb7vwH5
   qrBH3v9WE7kC+e/uTF7Qbwe4cyH6oCrNPSDRXQZV8N3AHKhdkdU+jYBu7
   PArF7DAXtKPT86m1lEzWeXRjufhXTIdwhbuL4p7A7BgCGrRjDjDY4pKlW
   9T9VEogoX8JJiuJAZtVFfA98zSMKBN1fB7CAViYlhK5A7RAevzkWsNr3S
   cMN6C9gV6SaOXfCCm5m3LDW5nERgUPXQXwpk7houZLtisKXof74ceePOE
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 2/3] base-files: Ignore the empty-dirs QA error due to files
 in /var/volatile
Date: Fri, 29 Oct 2021 23:29:17 +0200
Message-ID: <20211029212918.16283-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211029212918.16283-1-pkj@axis.com>
References: <20211029212918.16283-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 21:29:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157637

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv3: An alternative to skipping the empty-dirs QA test for
base-files would be to remove /var/volatile/tmp and /var/volatile/log,
but I do not know if there are any consequences of doing that, e.g., due
to them not existing before the tmpfs has been mounted on top of
/var/volatile. Thus I have left them in place.

 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 032827a0d0..c3ecd81c4a 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -182,3 +182,5 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 CONFFILES:${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname ${sysconfdir}/hosts'][(d.getVar('hostname') != '')]} ${sysconfdir}/shells"
 CONFFILES:${PN} += "${sysconfdir}/motd ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile"
+
+INSANE_SKIP:${PN} += "empty-dirs"

