Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id BF46F6FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 14:51:59 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l6so191582908wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 07:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nbkkzCQjS42NDyerPayWQR1q6v7AAi07NHYbr8wr/mk=;
	b=ZQzeIWEuq+1vKdvXX3hSwuTmuFIoN3hMI5eTazNKaqsCeiWDZ3VwExAlfhu8i014Ss
	R5gd0n4JXPpUS7tAu5egvYTU1iTdTPFr1daNjpqyY8iJv1OE2kjlXiifTkFYaTcjsZYd
	yNTOLSjNZIyqO2QIAbm/l/T+Gh4qPF9fyZJ0tNcjUAC9TLbjVnCPXpiizkQoKw6sjWwj
	Dfw5PCkwEQOMLBvx8SCfPKejNgk6+5qoGNPrt//E65GCVQJ0rngcySIesz9NNp6gzbZ/
	+SSiVKqPCKjMIYaDlK9R0/ZVA/cIk9VIerJGkvj92azPPazYTLRNGSTVpPCs/QpHwWXx
	BOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nbkkzCQjS42NDyerPayWQR1q6v7AAi07NHYbr8wr/mk=;
	b=dx/VigMyVX+IdNNRbL/6iRd0hW6nq/kEMOGSQ3LwXgpX9b6083UyDvKPUr5tx9PmS3
	Ukd8tiCPtYvK6kTFrF+ol+gyPYrw2E3WRtdmPRsTaOOGtAzJCrmT0orGg0CTjCvEnfch
	QOk+vP3/3W4DuXue3uNPD1kM2gkikgkwblWN4dKQZMhzdJiYV/4FoPsM9pObHPxQs+Ar
	hEb4bm4Eo4OHADwJ6YKcReYKWRlEp7gKcYlNYmkNG94zBzil0erF7xq7DN4uM31HPCgJ
	3WUi/xUdn0KCTNDUT8B9BVO79ZcuzEh01IQqN9/oPrm+kDswMIHXIfgPSdTzaZ/kYYL8
	wAWQ==
X-Gm-Message-State: AD7BkJKIApMO75M8+Q2itLaP/HsH0gHQkX/F5+Jow4STZD8fABROstE0VrGs7LT3uhzMA1ua
X-Received: by 10.28.126.21 with SMTP id z21mr26216111wmc.73.1460472720195;
	Tue, 12 Apr 2016 07:52:00 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z6sm23192722wme.9.2016.04.12.07.51.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Apr 2016 07:51:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:51:53 +0100
Message-Id: <1460472714-12605-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1460472714-12605-1-git-send-email-ross.burton@intel.com>
References: <1460472714-12605-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/5] rsync: pass cached configure values through the right variable
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
X-List-Received-Date: Tue, 12 Apr 2016 14:52:00 -0000

Passing these through CACHED_CONFIGUREVARS doesn't change the build, but makes
the recipe clearer.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/rsync/rsync_3.1.2.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rsync/rsync_3.1.2.bb b/meta/recipes-devtools/rsync/rsync_3.1.2.bb
index 5f4733f..4b91ac7 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.2.bb
@@ -7,15 +7,14 @@ PACKAGECONFIG ??= "acl attr"
 PACKAGECONFIG[acl] = "--enable-acl-support,--disable-acl-support,acl,"
 PACKAGECONFIG[attr] = "--enable-xattr-support,--disable-xattr-support,attr,"
 
+# By default, if crosscompiling, rsync disables a number of
+# capabilities, hardlinking symlinks and special files (i.e. devices)
+CACHED_CONFIGUREVARS += "rsync_cv_can_hardlink_special=yes rsync_cv_can_hardlink_symlink=yes"
+
 # rsync 3.0 uses configure.sh instead of configure, and
 # makefile checks the existence of configure.sh
 do_configure_prepend () {
 	rm -f ${S}/configure ${S}/configure.sh
-
-	# By default, if crosscompiling, rsync disables a number of
-	# capabilities, hardlinking symlinks and special files (i.e. devices)
-	export rsync_cv_can_hardlink_special=yes
-	export rsync_cv_can_hardlink_symlink=yes
 }
 
 do_configure_append () {
-- 
2.8.0.rc3


