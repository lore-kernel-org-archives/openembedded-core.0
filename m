Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eFYl36o+TIYAvnM3oKIX/O9L5yfVLZUDMQUgW4uvjmJMSs07QoOk7oNB/osMQvGdbELT76Bpyk
 Af6nl+L6t5kw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968606"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968606"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:46 -0800
IronPort-SDR: E1BYgyE3qZU/+bYdFMGOP3pdrdAeojjePpEMAqLeJdPmHyxi30O1R1DcUE/dD3hC9SeToYwRjV
 N080FNJdZWjg==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215443"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:45 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 08/35] staging: Clean up files installed into the sysroot
Date: Tue,  9 Feb 2021 23:51:53 +0800
Message-Id: <064b38c29543761186862cdbfe0155082137a212.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are a variety of files being installed into $datadir which we
don't need. Pick the top "offenders" which amount of thousands of files
and simply don't install them. These include things like test data,
terminfo data, locale data for native tools and so on. This saves
copying these files into native and target sysroots and should improve
performance (smaller sstate, fewer files to copy around).

With this and the python recipe change, alsa-tools went from:

recipe-sysroot: 18357
recipe-sysroot-native: 14129

to

recipe-sysroot: 10809
recipe-sysroot-native: 8079

which is a decent improvement.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 366c72941fe1c24d0b1d96df46e13cb9eb4e79d6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/staging.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index f0a619b35b..8165ab268e 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -27,11 +27,15 @@ SYSROOT_DIRS_BLACKLIST = " \
     ${mandir} \
     ${docdir} \
     ${infodir} \
+    ${datadir}/X11/locale \
     ${datadir}/applications \
+    ${datadir}/bash-completion \
     ${datadir}/fonts \
     ${datadir}/gtk-doc/html \
+    ${datadir}/installed-tests \
     ${datadir}/locale \
     ${datadir}/pixmaps \
+    ${datadir}/terminfo \
     ${libdir}/${BPN}/ptest \
 "
 
-- 
2.29.2

