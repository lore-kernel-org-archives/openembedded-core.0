Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 25A1276AE2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:40:39 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so61030532wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 12:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zfSc9+ekQR80jBBHkbMlBZl8B7i8dI1/cFrkxF8rH/Q=;
	b=X78dAVKDaSbrWpgjuNXnAtFN0O4KRYZymU2OFD3RobgIdIAlINWpgjMRP0EKNDvINo
	grC7IiIM/s5y6hC5eg8vKJ2jSWRY+EfsnQpX6anp/tUc0Jp8uJLHq86m6caOIG9VH4MM
	+aobeg215SmHccWOfJgxtVT3KKxVGT6HD+RWE7FMlGXudirS55GbAz6kts17qRc3+RWP
	5zF8l35CmME3kERzUM+JJOfSv+4XwU5icG9PJPnEWhmkl0kXtWZAFZw6XceZb0GQovsA
	evGY5J+PhMiYW2seEWGE0dfLdgoB3e9KsSpETdd8LBUD+Tb8qyj89EeCiIobKeHUdjIV
	9YGA==
X-Gm-Message-State: ALoCoQmKVCBI/5EPX0wek5WdusFYxpLR0mUP1xn1JO/jvu8YgixJC0q1MRlqPstqqJyUpDD475X2
X-Received: by 10.194.220.74 with SMTP id pu10mr6133280wjc.133.1445370039808; 
	Tue, 20 Oct 2015 12:40:39 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	gd11sm257966wic.20.2015.10.20.12.40.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 12:40:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 20:32:59 +0100
Message-Id: <1445369579-14839-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445369579-14839-1-git-send-email-ross.burton@intel.com>
References: <1445369579-14839-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] classes/gtk-icon-cache: don't pass STAGING_LIBDIR_NATIVE to intercepts
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
X-List-Received-Date: Tue, 20 Oct 2015 19:40:40 -0000

The intercept doesn't need STAGING_LIBDIR_NATIVE anymore, so don't pass it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 6195fa4..425397a 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -6,8 +6,7 @@ gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} \
 		mlprefix=${MLPREFIX} \
-		libdir=${libdir} \
-		STAGING_LIBDIR_NATIVE=${STAGING_LIBDIR_NATIVE}
+		libdir=${libdir}
 else
 
 	# Update the pixbuf loaders in case they haven't been registered yet
@@ -25,8 +24,7 @@ gtk_icon_cache_postrm() {
 if [ "x$D" != "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} \
 		mlprefix=${MLPREFIX} \
-		libdir=${libdir} \
-		STAGING_LIBDIR_NATIVE=${STAGING_LIBDIR_NATIVE}
+		libdir=${libdir}
 else
 	for icondir in /usr/share/icons/* ; do
 		if [ -d $icondir ] ; then
-- 
2.1.4


