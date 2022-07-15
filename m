Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B4AC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 17:46:55 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.388.1657907211770472051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 10:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=qaIDZAd/;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id B55CA20FD0DA;
	Fri, 15 Jul 2022 10:46:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B55CA20FD0DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657907211;
	bh=RhPb/YpZy/R5G/IDiy/RRwpWYoLaEmkTmRw7hAEx0pA=;
	h=From:To:Cc:Subject:Date:From;
	b=qaIDZAd/WGe3xsGrZ8Ul/JQyybKWdwtLZd/QOLj2w70WDcjjnUsDRbFDwfTrzcLwh
	 1XJGDiwLT5WRmCBExham03j5nxXiujNkLifvrlu/fGp1Ogj1RysOWeTQJBUSsxqQwo
	 UwpIul2MjlGi66KgaZheQThNVGrgDKcFbTvI7A/c=
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH] package.bbclass: Fix kernel source handling when not using
 externalsrc
Date: Fri, 15 Jul 2022 11:46:11 -0600
Message-Id: <20220715174611.902311-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 17:46:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168135

Previous commit c725bdb29b266 broke kernel source handling, this was due
to the code expecting the sources to be in a different directory, this di=
d
not happen when using externalsrc since sources were found in the expecte=
d
directories.

Pass work-shared to the check to allow sources to be found in the proper
directory, allowing these to be packaged in the next step.

To test this we grabbed a commit where we knew the buildpaths
QA test should flag a file inside the kernel sources, with the previous
commit the QA warning wasnt flagged since no sources where there, with
this fix the buildpaths QA warning gets flagged properly.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsof=
t.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4850134022..541bb9df93 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -561,7 +561,7 @@ def copydebugsources(debugsrcdir, sources, d):
=20
         # If S isnt based on WORKDIR we can infer our sources are locate=
d elsewhere,
         # e.g. using externalsrc; use S as base for our dirs
-        if workdir in sdir:
+        if workdir in sdir or 'work-shared' in sdir:
             basedir =3D workbasedir
             parentdir =3D workparentdir
         else:
--=20
2.25.1


