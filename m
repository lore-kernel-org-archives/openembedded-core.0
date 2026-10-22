Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2238.1792709296598462393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WVcCOqKA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261022224814dadb34943f000207c3-cmpsvt@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261022224814dadb34943f000207c3
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:48:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=RHa2CUfFnUCvJ0HjlIOhcfalS1r5ZHGd7zHn4w8T0bA=;
 b=WVcCOqKAgeHH6HMdu2sTUh8vCD6mTbW975O6EyVgbS8lH/QPG1iV1J+hxQ7aCaw/0eDasE
 wIBbBw81hH/01rLc8dIJoDwSTDDub7/LZ3G6FJGH41ms620qOjgUCdgVP/20W1j2oVtoW0IR
 wAwKE4g/h0TwK/CJ7/tNIkgcEBS7UTyuWJxqb/v7TJ3ni4tR55p8dM/Mu0CvVKuU7z023c7o
 uFzqfAFRIp/r3+sy9DRWOPqPGvyzgnyG/IWRJk4v+OSX65ANQpN8uvab55CB6zKSZGp6bXKl
 6zAX2ma6EezWloeCuLPvoVZ142hG8OiohYebbb3Fyh7vzmtJYlDXSOSA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 07/15] glibc: patch CVE-2026-77117
Date: Fri, 23 Oct 2026 00:47:00 +0200
Message-ID: <20261022224711.3783258-7-peter.marko@siemens.com>
In-Reply-To: <20261022224711.3783258-1-peter.marko@siemens.com>
References: <20261022224711.3783258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248463
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 3.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glibc/glibc/0037-CVE-2026-77117.patch     | 32 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0037-CVE-2026-77117.patch

diff --git a/meta/recipes-core/glibc/glibc/0037-CVE-2026-77117.patch b/meta/recipes-core/glibc/glibc/0037-CVE-2026-77117.patch
new file mode 100644
index 00000000000..fa42a548c34
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0037-CVE-2026-77117.patch
@@ -0,0 +1,32 @@
+From e43e46f94398b3de446fec11da1e7633ea5202ec Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 28 Aug 2026 10:26:07 +0200
+Subject: [PATCH] iconvdata: SHIFT_JISX0213 decoding lacks pending character
+ reset (CVE-2026-77117)
+
+This fixes bug 34556.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+(cherry picked from commit 68d94bbe50b7577d48998107d632ef3a0df050e3)
+
+CVE: CVE-2026-77117
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=e43e46f94398b3de446fec11da1e7633ea5202ec]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ iconvdata/shift_jisx0213.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/iconvdata/shift_jisx0213.c b/iconvdata/shift_jisx0213.c
+index 364298dcff..834fa81322 100644
+--- a/iconvdata/shift_jisx0213.c
++++ b/iconvdata/shift_jisx0213.c
+@@ -226,6 +226,9 @@
+ 	    STANDARD_FROM_LOOP_ERR_HANDLER (1);				      \
+ 	  }								      \
+       }									      \
++    else 								      \
++      /* There was a pending character.  Clear it.  */			      \
++      *statep = 0;							      \
+ 									      \
+     put32 (outptr, ch);							      \
+     outptr += 4;							      \
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 567d53dd6f6..3090b9cd277 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -69,6 +69,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0034-CVE-2026-6368.patch \
            file://0035-CVE-2026-19542.patch \
            file://0036-CVE-2026-19499.patch \
+           file://0037-CVE-2026-77117.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
