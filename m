Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2349.1792709303605860554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ZPs46wrk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202610222248212c979b346100020743-by_7zv@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202610222248212c979b346100020743
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:48:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=aB0XogAD+erY0sdkc82its+1MPVyrResMwY1eCsTurg=;
 b=ZPs46wrkDk/hB7YGDSlT36wa+FZndY04HFu9EZsKHgTtaj7l0dt2ZeVZ947yUSVe+52M+G
 CkgxorW5ZDsPELNcYJT3tN9gsjL2zk7IBwWb+kxTcYDwBvUaPnDIqF8w+5BiLcbFx0men7k1
 MwHg/wzxcGlHbgCB+agrtpEVnj+4pBSh/WeH3voAKOc2DrgJ/xLvjgB3BAIkzgBOgkk9uB9w
 jvl+IY863HAqZWMbaVRueFFwvCdfnr2oQnE1yOQlQnVICua29qHNA91ScQSi6oqdkEVHUd+a
 NMnGs+Dc8H2JGeqaV0PNgj3pghhb3vJxhSJz/lBPhwu09QJuGpcU5ZaA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 08/15] glibc: patch CVE-2026-80489
Date: Fri, 23 Oct 2026 00:47:01 +0200
Message-ID: <20261022224711.3783258-8-peter.marko@siemens.com>
In-Reply-To: <20261022224711.3783258-1-peter.marko@siemens.com>
References: <20261022224711.3783258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248464
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 3.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glibc/glibc/0038-CVE-2026-80489.patch     | 32 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0038-CVE-2026-80489.patch

diff --git a/meta/recipes-core/glibc/glibc/0038-CVE-2026-80489.patch b/meta/recipes-core/glibc/glibc/0038-CVE-2026-80489.patch
new file mode 100644
index 00000000000..3ca1c959bb2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0038-CVE-2026-80489.patch
@@ -0,0 +1,32 @@
+From ec116a0fbedcc860631e525e70b409cf295f27da Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 28 Aug 2026 10:26:07 +0200
+Subject: [PATCH] iconvdata: EUC_JISX0213 decoding lacks pending character
+ reset (CVE-2026-80489)
+
+This fixes bug 34568.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+(cherry picked from commit 4dafa087ff5fe7df45bd37dc727e988da6b8c935)
+
+CVE: CVE-2026-80489
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=ec116a0fbedcc860631e525e70b409cf295f27da]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ iconvdata/euc-jisx0213.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/iconvdata/euc-jisx0213.c b/iconvdata/euc-jisx0213.c
+index 9c3f28da2d..f0305c113a 100644
+--- a/iconvdata/euc-jisx0213.c
++++ b/iconvdata/euc-jisx0213.c
+@@ -224,6 +224,9 @@
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
index 3090b9cd277..bd0b4f06190 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -70,6 +70,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0035-CVE-2026-19542.patch \
            file://0036-CVE-2026-19499.patch \
            file://0037-CVE-2026-77117.patch \
+           file://0038-CVE-2026-80489.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
