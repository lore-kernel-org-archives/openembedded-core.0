Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4539.1794512420012405407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 11:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=cqbiqZ9x;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261112194018bfcfeef47d00020732-1gpaui@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261112194018bfcfeef47d00020732
        for <openembedded-core@lists.openembedded.org>;
        Thu, 12 Nov 2026 20:40:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+gKrsEhBC0/yaOOlnD0eMj9qUEeCVEJhQGHWlh9BNqo=;
 b=cqbiqZ9xza+Rp7wI8rjaLeU7d80D1aCM8pg61J0lrxsRXr/hLXHVE0spVq7+K25oPETX53
 UX7RefdFl2gNQ81ChAaZtnLSp+O9GT7W0GFlHtk6lTgO1iyC9yR2b0tJCT9qmv54bOAFlRRo
 kQM1/H7gJZXDREDgkGRLIP/KCCpammJuc8Bi9Qc8Mw99Oav0GEpC+vCKpNa2V0JGZsshg0jS
 KqN/b07fC+D5D2kqsPSTfa0pR1mEXbs3EXO8BjdMK6Sg1XISMcwxLB+qVYgx0av5/ZMZq7kl
 jYfaXZKdTvL94u9dzJ90C5XxfXEchDuAud7jLZd9djiipbvJb3hOTuWg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/3] libsndfile1: patch CVE-2025-52194
Date: Thu, 12 Nov 2026 20:38:12 +0100
Message-ID: <20261112193813.982057-2-peter.marko@siemens.com>
In-Reply-To: <20261112193813.982057-1-peter.marko@siemens.com>
References: <20261112193813.982057-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 19:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250122
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch references by [1] references in CVE report.

[1] https://github.com/libsndfile/libsndfile/issues/1082#issuecomment-6442050313

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libsndfile1/CVE-2025-52194.patch          | 27 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch
new file mode 100644
index 0000000000..ec5da0b731
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch
@@ -0,0 +1,27 @@
+From 7ff854d1e0bd9a751a9ff52ed980c62afced91fe Mon Sep 17 00:00:00 2001
+From: Saddam <saddamr3e@gmail.com>
+Date: Tue, 21 Jul 2026 20:49:11 +0530
+Subject: [PATCH] ircam: use psf_lrintf when reading samplerate
+
+The IRCAM header sample rate is a float read straight from the file. (int) samplerate is undefined when the value is out of int range or non-finite; psf_lrintf matches mat4/mat5 which convert a file sample rate the same way.
+
+CVE: CVE-2025-52194
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/7ff854d1e0bd9a751a9ff52ed980c62afced91fe]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ircam.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ircam.c b/src/ircam.c
+index 3d73ba44..d0780d8a 100644
+--- a/src/ircam.c
++++ b/src/ircam.c
+@@ -161,7 +161,7 @@ ircam_read_header	(SF_PRIVATE *psf)
+ 
+ 	psf_log_printf (psf, "marker: 0x%X\n", marker) ;
+ 
+-	psf->sf.samplerate = (int) samplerate ;
++	psf->sf.samplerate = psf_lrintf (samplerate) ;
+ 
+ 	psf_log_printf (psf,	"  Sample Rate : %d\n"
+ 							"  Channels    : %d\n"
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index fb466190ab..2c3e28dc1c 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://CVE-2025-56226-02.patch \
            file://CVE-2026-37555.patch \
            file://CVE-2024-50613.patch \
+           file://CVE-2025-52194.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
