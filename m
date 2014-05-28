Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (unknown [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id C1D856FB7D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 11:56:50 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id m15so11144790wgh.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 04:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=IVX2ZUGwoqxcNHPHWK4t67J297yQeQ6NQ5ghWtNMrn0=;
	b=du0pPmIb8Wb5nrRRi1mfcqhjvNlOpVfrnsJSb3tE9Q7MtFJq0ZPaVlWubTXhIk9I+5
	yDY/ArY4Q3DipDoyKT9cwWgY4yg/HqdDTyAB/9taf4dHkG7mEor6CortyUlEQL3u93Io
	te3FIzmUnZoKaaF63fHxqXRDS7Lh5w6KgHXTzEZo115BRxNEzlo8NNZfx523+vky1HIq
	XWy8lA9VVMYwsBUzaQFF0M6FR4fatLYJi8JZX4X29FhXoz4T+jPttfOj8jXykgzcgaQQ
	90nVQhT0eM1m2XAcVuYskB8wrJRXBJYA4JnfMMWU2cyyAyd4me0m83rkCZmULC0m8jNu
	4bAw==
X-Gm-Message-State: ALoCoQkFsVKlsdaTsrzKy9qofE8LCcRmN0GKpznglZhozN8Nq/15P+NbsVFjqoIN4f44GxrBF3VM
X-Received: by 10.180.89.241 with SMTP id br17mr48597471wib.0.1401278211080;
	Wed, 28 May 2014 04:56:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id bj2sm16345631wib.3.2014.05.28.04.56.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 04:56:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 May 2014 12:56:26 +0100
Message-Id: <a12ceb971fefe2b2f412f46b82c0d5ea6043ad62.1401277810.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1401277810.git.ross.burton@intel.com>
References: <cover.1401277810.git.ross.burton@intel.com>
In-Reply-To: <cover.1401277810.git.ross.burton@intel.com>
References: <cover.1401277810.git.ross.burton@intel.com>
Subject: [PATCH 4/4] autoconf: don't disable the autoheader warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 May 2014 11:56:51 -0000

The usual autoheader warning is due to AC_DEFINE variables not having a
description.  This results in no variable being defined in config.h, which leads
to code behaving as if the test failed when it actually succeeded.

This patch was introduced to OpenEmbedded back in 2004:

http://git.openembedded.org/openembedded/commit/?id=5eab06d132cb2895fd579f5cedffbb54c27794f8

There is no rationale for the patch so I suspect this is due to the warnings
being fatal and the submitter not understanding that the problem is more than
cosmetic.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../autoconf/autoheader-nonfatal-warnings.patch         |   15 ---------------
 meta/recipes-devtools/autoconf/autoconf_2.69.bb         |    1 -
 2 files changed, 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch b/meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch
deleted file mode 100644
index 8ae6d5c..0000000
--- a/meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
---- autoconf-2.59/bin/autoheader.in~	2003-10-10 14:52:56.000000000 +0100
-+++ autoconf-2.59/bin/autoheader.in	2004-05-03 01:36:45.000000000 +0100
-@@ -272,8 +272,8 @@
- 	}
- 
-     }
--  exit 1
--    if keys %symbol;
-+#  exit 1
-+#    if keys %symbol;
- }
- 
- update_file ("$tmp/config.hin", "$config_h_in");
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index a2ecd94..5c652d4 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -12,7 +12,6 @@ SRC_URI += "file://autoreconf-include.patch \
 	    file://autoreconf-exclude.patch \
 	    file://autoreconf-foreign.patch \
 	    file://autoreconf-gnuconfigize.patch \
-	    file://autoheader-nonfatal-warnings.patch \
             file://config_site.patch \
             file://remove-usr-local-lib-from-m4.patch \
             file://preferbash.patch \
-- 
1.7.10.4


