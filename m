Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id CDEC377193
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 14:19:17 +0000 (UTC)
Received: by lffz202 with SMTP id z202so30038962lff.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=8xOqGLNY7KKTsoISbmjolYgr81K5v9pS6ZunuChKQUw=;
	b=jtUpiepNqGbUVVXJ0hIyYxmkDu470BPWcNVgOiyGBC5oeLUTM7u6bmRY298SHfwxqG
	NTBz9wZHXtyhrCPhI/mMaTHhiR2WgeoSZzHsuy757/sww7GmMxm/Sg6ETeFMfB6tRPiv
	aH//SfXlSLGWFRJbi8OyxkTVI6/juiARqxqBcp7p2I6vkl6oDe3q9GpGZMw/xbTUlZax
	PfZSi6QnAYvWaM/4/fIAxs3EzAP3jDeiFIJ30hdILnquvjITQmyxGZUdrEnP3ZS9rG2m
	uKn6Oo1n0ZW6YGySQcOByFegUn3HsH8McclgYSQ0G2zrGEYFty/I+zpUMdwGVry429Ea
	F3+w==
X-Received: by 10.25.143.146 with SMTP id r140mr9894182lfd.14.1445264357676;
	Mon, 19 Oct 2015 07:19:17 -0700 (PDT)
Received: from umbar.auriga.ru ([81.95.26.90])
	by smtp.gmail.com with ESMTPSA id
	f194sm1322909lfg.37.2015.10.19.07.19.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 07:19:17 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 17:19:15 +0300
Message-Id: <1445264355-1288-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [PATCH] apr: remove conflict with ccache
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
X-List-Received-Date: Mon, 19 Oct 2015 14:19:19 -0000

If ccache is enabled, compiling apr-utils fails with the following error
messages because libtool is confused by the "ccache gcc" appearing on
the command line. Disable ccache for apr, so that ccache don't get
enabled in all software using apr's rules.mk.

The error message from apr-utils-native:

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-support/apr/apr_1.5.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.5.2.bb b/meta/recipes-support/apr/apr_1.5.2.bb
index e12a176..1c61e84 100644
--- a/meta/recipes-support/apr/apr_1.5.2.bb
+++ b/meta/recipes-support/apr/apr_1.5.2.bb
@@ -32,6 +32,11 @@ CACHED_CONFIGUREVARS += "apr_cv_mutex_recursive=yes"
 #
 CACHED_CONFIGUREVARS += "ac_cv_header_netinet_sctp_h=no ac_cv_header_netinet_sctp_uio_h=no"
 
+# Otherwise libtool fails to compile apr-utils
+# x86_64-linux-libtool: compile: unable to infer tagged configuration
+# x86_64-linux-libtool:   error: specify a tag with '--tag'
+CCACHE = ""
+
 do_configure_prepend() {
 	# Avoid absolute paths for grep since it causes failures
 	# when using sstate between different hosts with different
-- 
2.6.1


