Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.3576.1615519151809951508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 19:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=mk5JIUZ3;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615519152;
  x=1647055152;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BqZEBDg8HuLUVComrQWsRokaEEfgFzSrPNx9gcWuHzw=;
  b=mk5JIUZ3nmht5WslwMCtC4pU7vIkC0lYBLaDr2PIaA/3Qq6fTdV7B4uA
   WP4b5urUBbG6s/a28BxMW3rxYGMPXhTxod92S6RH9XqZRP+Jlxs/v6YSK
   BuIfCxrEJJy6f+RaFKU50+YODfVJNl5r2URoF1c7UgQsdpr4VtEl2rEj0
   fbpST0zSs8XAfCwBE/zPOjuFjramECI2+AaL8sZGUeRCVSBSmfDpXkxFM
   JNECY2PEIEJVGZmr/CEmeEOrCqKpXACqQkpS0XAu8N/Kkyu4eSZpDZVp/
   HaMssnhjharUWWQK9+mFl5L6Omx7BOr4JH204EFwOx6nbbiIY51J2+5Oa
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] metadata_scm.bbclass: Use immediate expansion for the METADATA_* variables
Date: Fri, 12 Mar 2021 04:18:53 +0100
Message-ID: <20210312031853.7328-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20210312031853.7328-1-pkj@axis.com>
References: <20210312031853.7328-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Define METADATA_BRANCH and METADATA_REVISION using immediate expansion.
This avoids running `git rev-parse HEAD` multiple times during recipe
parsing.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/metadata_scm.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 2608a7ef7b..47cb969b8d 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -1,8 +1,3 @@
-METADATA_BRANCH ?= "${@base_detect_branch(d)}"
-METADATA_BRANCH[vardepvalue] = "${METADATA_BRANCH}"
-METADATA_REVISION ?= "${@base_detect_revision(d)}"
-METADATA_REVISION[vardepvalue] = "${METADATA_REVISION}"
-
 def base_detect_revision(d):
     path = base_get_scmbasepath(d)
     return base_get_metadata_git_revision(path, d)
@@ -42,3 +37,8 @@ def base_get_metadata_git_revision(path, d):
     except bb.process.ExecutionError:
         rev = '<unknown>'
     return rev.strip()
+
+METADATA_BRANCH := "${@base_detect_branch(d)}"
+METADATA_BRANCH[vardepvalue] = "${METADATA_BRANCH}"
+METADATA_REVISION := "${@base_detect_revision(d)}"
+METADATA_REVISION[vardepvalue] = "${METADATA_REVISION}"
