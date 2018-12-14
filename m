Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id BFB217BDB7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:49 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id s5-v6so5602981ljd.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hHTDo42W4HwadmBRc3dkE+VVaQXV7UgKfcpYoySUkoQ=;
	b=nXastuDGfCz8xexiOxu5OU6oFyv0b6Ty5Fx0mflAU46eEDfsqrKfDX2vTCxb6xyfb5
	2DH3DAJnIRV4COsz0v64ZOnfGzvzQstV3SonqksJ5Ui6gDPGy1sUnBLBgE0qud35haVQ
	Lp3us3lmSYDip/AzxWYS/vpt0xJ2uttoK23yI2a629ii9OK1Y3rZjE5UYrikrWe+6h4m
	BZvtOGdRqLvt5Z6hl1LYBang7a6ybf26Yg6X26aY61GfuLijr9L7K8xb/saUE0SsEydF
	Cg4KEJ733QB96z3ZHh8qEQSfwz+Zp9InLi+9k7dE1BTJb8hBBVXbnm3OhDKlfnAYW/hx
	UC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hHTDo42W4HwadmBRc3dkE+VVaQXV7UgKfcpYoySUkoQ=;
	b=GfXnKRcBYb+O9rqAuBonQlTyNmyW0H8296rIL7Xq+0zwpaxnfKp8GgzwhtM9nKR9b7
	DLfBZHumY9MvYvY+B8lXO1ARwnlej+k8woBxpKRd+zGT4bVhnzmzQdBZdR/oKnelg/uX
	COH3++yg5o4i9c7Zh1pOh5GjmGy4982biNBUyWWRRg4+1RmdiVQyzYx2Sqqfaf9cORRC
	8XG3AN9qJSFPX9fxpJp5z6U/BBF4ZkOSacE47as3EjZID0DfMKJjHr6cOyZHy+e55msN
	P7PwGS4ANpAqMzeYUPYE7LAe20xTyx7hY1Wx3jOehU35Tvpk04USyLTYU9PMPBATuevX
	hjpg==
X-Gm-Message-State: AA+aEWbWEfIt+Z1XYUqfitC/UTW78vk8ZFqBiusoG77ctCrATIDs9nd7
	nKMgzaKIgIQ0GCIZYvmWB+J1BK2j
X-Google-Smtp-Source: AFSGD/V+sv8/DE32aSP7Gp/krtSfbOCAT+MIqXQL1Y5miGsAU3Q25F4dB/3f0SabuYYgZnYrOlQzIA==
X-Received: by 2002:a2e:2909:: with SMTP id u9-v6mr2453965lje.28.1544810150015;
	Fri, 14 Dec 2018 09:55:50 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:49 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:36 +0200
Message-Id: <1544810082-22164-8-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 07/13] musl: Ensure GLIBC_LDSO symlink target does not exist on reinstall
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
X-List-Received-Date: Fri, 14 Dec 2018 17:55:50 -0000

Otherwise do_install task will fail on rebuild.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 9cc875c..4593cde 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -61,7 +61,7 @@ do_install() {
 	oe_runmake install DESTDIR='${D}'
 
 	install -d ${D}${bindir}
-	rm -f ${D}${bindir}/ldd
+	rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
 	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
 	lnr ${D}${libdir}/libc.so ${D}${GLIBC_LDSO}
 	for l in crypt dl m pthread resolv rt util xnet
-- 
2.7.4


