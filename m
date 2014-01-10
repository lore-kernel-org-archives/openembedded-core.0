Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id B52C36B916
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 17:02:19 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id m15so1408544wgh.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:02:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YE0ynjrwe1CbIYOLge1ILllTdG0YDQKfNNkMzvoZxOI=;
	b=bkG4KYuGdoOOmhvCcJoJHq2WZWFypTnyuO4FtD/jcD6C2qFUCRLQeUA9z/w3laIhPi
	8jzF1qFoO6wa0c5ULMrNfq8EG758o9UQQakn311Z3+SOKiWUxNKle03ldFV3eM8LsbUK
	9TAHEdDFriNU7nY0fVZHv+xrq2R5tuf1HxoQhWo3XD+36tQLMdj/uBhcxS3Y8zSFGtF7
	UXUc5/b1M+gG5UwFx2OUOqeKPj1Cp0bSMEkCMNH77Z4BhBb7IyfHbkHMpeO4Z99FJEQU
	YVpQM/qvCa+oouJgnPWmKTjtndgkYXMBNtTXJMTg6v6pVY4QkRvzYOnOWS/uhlO+gn9j
	jYwA==
X-Gm-Message-State: ALoCoQkDHABn0Fk0/O7qOhmmHvYkbsdVgcSDg7ZsYj4wfGuFjQe9B0W9RdsUYkIrMJecdwKPpCrm
X-Received: by 10.180.188.175 with SMTP id gb15mr3713371wic.50.1389373339997; 
	Fri, 10 Jan 2014 09:02:19 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id eh7sm3494947wic.2.2014.01.10.09.02.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jan 2014 09:02:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2014 17:02:09 +0000
Message-Id: <1389373329-21241-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389373329-21241-1-git-send-email-ross.burton@intel.com>
References: <1389373329-21241-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 5/5] packagegroup-core-tools-testapps: add Piglit
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
X-List-Received-Date: Fri, 10 Jan 2014 17:02:20 -0000

Respect the OpenGL distro feature and if it's enabled, pull in piglit and
mesa-tools.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb           |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 1861ebe..4b8f99b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -24,10 +24,14 @@ KEXECTOOLS_powerpc ?= ""
 KEXECTOOLS_e5500-64b ?= ""
 KEXECTOOLS_aarch64 ?= ""
 
+GLTOOLS = "\
+    mesa-demos \
+    piglit \
+    "
+
 X11TOOLS = "\
     fstests \
     owl-video \
-    mesa-demos \
     x11perf \
     xrestop \
     xwininfo \
@@ -48,4 +52,5 @@ RDEPENDS_${PN} = "\
     ltp \
     connman-client \
     ${@base_contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', "${GLTOOLS}", "", d)} \
     "
-- 
1.7.10.4


