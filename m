Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB198C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 16:33:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.573.1634229208790297854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AE271480
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:33:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 069CD3F66F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:33:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sstate: don't silently handle all exceptions in
 sstate_checkhashes
Date: Thu, 14 Oct 2021 17:33:19 +0100
Message-Id: <20211014163319.1022835-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014163319.1022835-1-ross.burton@arm.com>
References: <20211014163319.1022835-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 16:33:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156963

If checkstatus returns an exception we should silently handle
FetchError, as this means the fetch failed for 'normal' reasons such as
file not found.  However, other exceptions may be raised, and these
should be made visible.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/sstate.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 701a19bc61..143819b898 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -983,10 +983,11 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,=
 currentcount=3D0, summary=3DTrue,
                 foundNet.add(tid)
                 if tid in missed:
                     missed.remove(tid)
-            except:
+            except bb.fetch2.FetchError as e:
                 missed.add(tid)
-                bb.debug(2, "SState: Unsuccessful fetch test for %s" % s=
rcuri)
-                pass
+                bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)=
" % (srcuri, e))
+            except Exception as e:
+                bb.error("SState: cannot test %s: %s" % (srcuri, e))
             if len(tasklist) >=3D min_tasks:
                 bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist=
) - thread_worker.tasks.qsize()), d)
=20
--=20
2.25.1


