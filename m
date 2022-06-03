Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1B8C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 00:22:13 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.2065.1654215730096246169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 17:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=N3mRgKst;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1654215730;
  x=1685751730;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JPa3vGp220iLPw54CyDBOgAHZHZqVQh3e3ftP7q/ozs=;
  b=N3mRgKstdYsF6A8Dr3Bokuxy1aspq0WQS/+SqbVhVOOGbi4jgWk9d3eY
   3S1nyhE78tr6cusyHM345hLWIo9Gx48Pvn5g32idvkM2w3fq+AuF94FPG
   pffkdcXFJUUHntMrLhz/bYxCAVXjUWoADv8YBAN5CTURiM70lZNx8idOv
   nPpX9Vv5kNeoQg6p9NzIk8tvbd9SBSxIgrGENhQniShNYSW3CQuv21oHd
   SMFTzwo8BrsQ5sjqENK7zTBzSsNNDVKnQ6JdZBlvqFDhZZ+oohueyBHqS
   ZMwbAaasohAlBa72IvkiiUxKodPr6POOCiL8oK7TTjG6Be0PpnKMcSA0d
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 2/2] license.bbclass: Bound beginline and endline
 in copy_license_files()
Date: Fri, 3 Jun 2022 02:22:05 +0200
Message-ID: <20220603002205.6835-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220603002205.6835-1-pkj@axis.com>
References: <20220603002205.6835-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 00:22:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166506

Ensure that begin_idx (i.e., beginline - 1) and end_idx (i.e.,
endline) are positive numbers in copy_license_files(). This makes sure
the same lines are copied as populate_lic_qa_checksum() uses when it
calculates the checksum. Before, beginline=0 would typically lead to
that no lines were copied at all.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/license.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 0c637e966e..4ebfc4fb92 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -84,17 +84,17 @@ def copy_license_files(lic_files_paths, destdir):
                     os.link(src, dst)
                 except OSError as err:
                     if err.errno == errno.EXDEV:
-                        # Copy license files if hard-link is not possible even if st_dev is the
+                        # Copy license files if hardlink is not possible even if st_dev is the
                         # same on source and destination (docker container with device-mapper?)
                         canlink = False
                     else:
                         raise
-                # Only chown if we did hardling, and, we're running under pseudo
+                # Only chown if we did hardlink and we're running under pseudo
                 if canlink and os.environ.get('PSEUDO_DISABLED') == '0':
                     os.chown(dst,0,0)
             if not canlink:
-                begin_idx = int(beginline)-1 if beginline is not None else None
-                end_idx = int(endline) if endline is not None else None
+                begin_idx = max(0, int(beginline) - 1) if beginline is not None else None
+                end_idx = max(0, int(endline)) if endline is not None else None
                 if begin_idx is None and end_idx is None:
                     shutil.copyfile(src, dst)
                 else:

