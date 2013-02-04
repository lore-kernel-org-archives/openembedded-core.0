Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2Jon-0008Q6-5D
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 12:02:37 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Feb 2013 02:46:33 -0800
Received: by mail-bk0-f69.google.com with SMTP id q16so6907593bkw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 02:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=leVYMKBAMe1E0ZLkg0RWSXKcIfDJETRQMndgREWeYZw=;
	b=TCj9YNsOcbsfIzME5WAm7xOWLsX1QkqfjEtC3CdSFsRKZovxu/cfQ7QBNEhX4MztCi
	b+9qL+P5+7wRsAEYb1mIpD8JDjdgvHHXlV7TflmjSsqnA/YIwCoBzjwKUuwILjQJIgtv
	snmutw/Y8u1qNHcnqGtwqGCTEyygLHaCfdKJbj83MbzUY9SfGr1dMq7pgM52Zo5HY3cg
	1TcVcye0oniWawJa20dON0MBO1iPcbeDN4P342YEpyn+j/pnZSf/MoTmNVwsE1OrNfB+
	GK8qwElubDEjBmUOwWIomVuBX9e5v7pZi+NwZMmi6f4wtxILB36dGDUWvwyJm23zthEe
	8JOA==
X-Received: by 10.180.93.40 with SMTP id cr8mr9546015wib.15.1359974791640;
	Mon, 04 Feb 2013 02:46:31 -0800 (PST)
X-Received: by 10.180.93.40 with SMTP id cr8mr9545994wib.15.1359974791451;
	Mon, 04 Feb 2013 02:46:31 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j9sm12586031wia.5.2013.02.04.02.46.30
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 02:46:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 10:44:15 +0000
Message-Id: <1359974656-21894-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1359974656-21894-1-git-send-email-ross.burton@intel.com>
References: <1359974656-21894-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlt4PWZVFI1SxUxVqHwZSnqXHFxOP4gD96iENN9gdH+A5mgowwSjpsoq4pwAQHcgsJgjT2UmK+2ezcQ9+DcjrMe4dBpgOQ9qrsRd0fo8b+uQdmszgwHOGxKq4ZjPoER1ipyFL71wQjnEUGZ2Ldrt9+ggMrakijPOqpsqQLoSQFb+hcesaxGOVWcpY8CrkKZDW4EpKsD
Subject: [PATCH 4/5] avahi: fix relative path in do_configure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 11:02:42 -0000

do_configure was assuming that $B is $S, so the relative path was wrong. Add a
missing $S.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index d529b37..185207b 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -60,7 +60,7 @@ LDFLAGS_append_libc-uclibc = " -lintl"
 LDFLAGS_append_uclinux-uclibc = " -lintl"
 
 do_configure_prepend() {
-    sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i configure.ac
+    sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/configure.ac
 }
 
 
-- 
1.7.10.4



