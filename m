Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52BBC433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 00:03:52 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.37494.1635725030866346734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 17:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=f9XB8/z3;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635725031;
  x=1667261031;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HUEuED5xWZyF4lhgd1di58h78q+gJbJetrSO314ugK8=;
  b=f9XB8/z3JuvbgU1jPqjhBp6o7GwJHEarJWRDQiWb56OqZ6HRg2W0RJAU
   1j7EzsCdPH+fs3jWx8rzG2FMcTw7Kq6uQbhaXWO2PR1CuOyo1mCYwzmip
   1S/iiYgH0xWYu5cRGAt7UF+se8j69b3RZu4yVyrWp6tiI55/YszDxbd9e
   ZiNGD9RskJdT3oEQLHFbLk9uUljyklI3keY9QAWL+S6qj0Nzo2NfXvFZZ
   kRb55i1nO0CEPCkQBx8m2ZF03rYL6JJq2O0i3sg0ZNtqLkgv4qCzsbPjP
   zUoIuRHdgl/R3g9UuAGtHk6tK/7NCSEPCUguT6lpSTfXX/atlOleEis/r
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv4 2/4] base-files: Ignore the empty-dirs QA error due to files
 in /var/volatile
Date: Mon, 1 Nov 2021 01:03:41 +0100
Message-ID: <20211101000343.18979-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211101000343.18979-1-pkj@axis.com>
References: <20211101000343.18979-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 00:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157694

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv3: An alternative to skipping the empty-dirs QA test for
base-files would be to remove /var/volatile/tmp and /var/volatile/log,
but I do not know if there are any consequences of doing that, e.g., due
to them not existing before the tmpfs has been mounted on top of
/var/volatile. Thus I have left them in place.
PATCHv4: No changes.

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

