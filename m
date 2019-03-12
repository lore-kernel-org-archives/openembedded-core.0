Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id AF5957C66B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 20:07:31 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p27so3418962edc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 13:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kepcubICUHHjeJJwZCvTDZVXRde0mxHxGj48dbyCIz4=;
	b=Kw6dmtqXMSN3YnC3visA05zmxIFbKgMU0b4QvLyY3JkYNwDqNqRBGT3NL2fwgRyXJO
	yqZn8fFVZ2hCxZQhUsHWx7Q9M+DYipJuIrYI4bKf/zxCG9oiIlhwcZcTkRQVdSc5+2g+
	HniCF3W+vYNBz4IIG33rEfzXkDFMeQqx0/wZjgOPrh3uT2omLgEuvHGx0kU4WZ9e3yAJ
	OLizf/3/8Tco4HM+Y2wM+TbjkvowNKLnlc6dDQQSNSQJ3s4z5xVDNbq8/GuxQ2yz4qW3
	1MQd+vbtboNVeba+0844WVycPyaL3HwI36SKxta3WxKs5DlaExGyQ0ARc51TdA/JYq4c
	dLqA==
X-Gm-Message-State: APjAAAW4vIyIiT/bl0E+9d3zO88nil0xk2A0JpMplzi8Tq8EOkGzOn6U
	ITaf5r90PQfL7kFnHMUkrdosCNY=
X-Google-Smtp-Source: APXvYqzN3BvCVmgK5j5bXSKoPkDy1wTF99h7NsZAwCA9kyvdfwuGDPI1Y1PruD7Ai/XY7FBS8BZgDA==
X-Received: by 2002:a17:906:e9cc:: with SMTP id
	kb12mr27414893ejb.81.1552421252059; 
	Tue, 12 Mar 2019 13:07:32 -0700 (PDT)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-8115-DDFA-B95A-8656-E3E2.dyn6.twc.com.
	[2606:a000:1401:8115:ddfa:b95a:8656:e3e2])
	by smtp.gmail.com with ESMTPSA id
	e11sm3879621eja.54.2019.03.12.13.07.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Mar 2019 13:07:31 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2019 16:07:22 -0400
Message-Id: <1552421242-18570-3-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552421242-18570-1-git-send-email-trini@konsulko.com>
References: <1552421242-18570-1-git-send-email-trini@konsulko.com>
Subject: [PATCH 3/3] inetutils: Disable rsh, etc in the build
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
X-List-Received-Date: Tue, 12 Mar 2019 20:07:32 -0000

It is long since past time for rsh and company to be retired from the
world.  Disable building these now.

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index c71b6787e819..ee4adff3f8a3 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -49,7 +49,9 @@ EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         --enable-rpath=no \
 "
 
-EXTRA_OECONF_append_libc-musl = " --disable-rsh --disable-rcp --disable-rlogin --disable-rexec --disable-rexecd"
+# These are horrible for security, disable them
+EXTRA_OECONF_append = " --disable-rsh --disable-rshd --disable-rcp \
+        --disable-rlogin --disable-rlogind --disable-rexec --disable-rexecd"
 
 do_configure_prepend () {
     export HELP2MAN='true'
-- 
2.7.4


