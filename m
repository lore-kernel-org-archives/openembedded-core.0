Return-Path: <andrei@gherzan.ro>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id DF5316065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:21:13 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so320194eek.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bFtXDSIKzu75Z+UVVzfUvIE53VUrzzbGJO8GVUdspQQ=;
	b=dmlVLTFYw2OHg9SAjrFKq24BUZaO7jrD3KWd1UC2NYLNdwJPmrU5cMvDZe23WDRAGr
	gFcwa5UWqn8jTGGULqWeNdgmpEJEtpwsMapSviteCmCP7+GsEAk0rF8+8a0s16fa05pq
	eZX9jZkHJO38WDFTOHLmMvr654sOOqJBUpiv116C6iYZOxr7YkCHvqMFZC3HdTsYOUbo
	bNauFgNO9aE8xJR6wC4hnnhhbdL/AjlJvmj7zfETVByRXRyGUeULn3R4KZFm2dU+zNG7
	K7v04zIQqBVrNZT6DQo5JrwIE+iid7L3/xAs0YmAavLB8Ne5f9cCYsmv7uZcqUjbaoat
	wUoQ==
X-Gm-Message-State: ALoCoQn6YVGdQprMydBbO+hTMNnQtl9RuuPkeUXmyJemeso3r1rI0vHKLd5DkJJLXKEmyUpE4O1V
X-Received: by 10.14.208.194 with SMTP id q42mr32335eeo.31.1377267674161;
	Fri, 23 Aug 2013 07:21:14 -0700 (PDT)
Received: from otp-mmes-build2.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPSA id z12sm77206eev.6.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 07:21:13 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 17:20:58 +0300
Message-Id: <1377267658-14590-2-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1377267658-14590-1-git-send-email-andrei.gherzan@windriver.com>
References: <1377267658-14590-1-git-send-email-andrei.gherzan@windriver.com>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH 2/2] eglibc.inc: Remove quotation marks from OPTION_EGLIBC_NSSWITCH_FIXED_*
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
X-List-Received-Date: Fri, 23 Aug 2013 14:21:14 -0000

Kconfig outputs strings with quotation marks. When eglibc tries to see if
the paths exists, uses wildcard make function which doesn't strip out the
quotation marks - checking for path fails. So strip out the quotation
marks from OPTION_EGLIBC_NSSWITCH_FIXED_* option-groups.config.
(see nss/Makefile)

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 meta/recipes-core/eglibc/eglibc.inc |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 40dd6b5..375b9bc 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -75,6 +75,10 @@ do_configure_prepend() {
 
 do_configure_append() {
 	oe_runmake config
+
+	# Remove quotation marks from OPTION_EGLIBC_NSSWITCH_FIXED_*. This will
+	# avoid install error.
+	sed -i 's/^OPTION_EGLIBC_NSSWITCH_FIXED_\(.*\)="\(.*\)"$/OPTION_EGLIBC_NSSWITCH_FIXED_\1=\2/' option-groups.config
 }
 
 GLIBC_ADDONS ?= "ports,nptl,libidn"
-- 
1.7.9.5


