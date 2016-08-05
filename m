Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B7E517319F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 09:34:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so2975940wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 02:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vrFAyQYkaKUideMnb2/6oZpGuE/cPXBAO9V9AEHFI60=;
	b=cCRvVyhE3rp3/UyOFquutr+IJRNgOc7LOsnGL3c84dlwP7fbhR6/6FoO1ADMXqiIP9
	MPvgDXxHKzCrNIqx1zPmxlRJgbkxkUoJAijmE8VricOeWRQsUYM9N2yuTHBgX7AVeJSc
	d1xf4o1YPzcvCJ6xLTkCvBaMbbdBImHX86oP2cOzYhc8n7P7kZB7nkZYFcYiDXeXBDtT
	mju1D6SovjQsVOSSM1TEzyaHMIHqkop688w0WKjIde9QKvXyGyXt8DUPCIPxK22MAqZU
	U10niLjzcu96i6flQk5qPHBotej2XqBpv/HBfDm42YAfi2BdJfsAAZ4xjjHro3UcuEr1
	Kd9Q==
X-Gm-Message-State: AEkoout96nGKERZOewpS6DCn7xtK0RqusxLjpCmktWY3/tmICBBS7ASTptaS7zTHsB+qFA==
X-Received: by 10.194.18.35 with SMTP id t3mr70274943wjd.174.1470389687244;
	Fri, 05 Aug 2016 02:34:47 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id f3sm16977611wjh.2.2016.08.05.02.34.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Aug 2016 02:34:46 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 10:34:52 +0100
Message-Id: <1470389692-9787-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] cml1.bbclass: explicitly set workdir
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
X-List-Received-Date: Fri, 05 Aug 2016 09:34:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bitbake rev 67a7b8b02 "build: don't use $B as the default cwd for
functions" (included in current bitbake master) breaks the assumption
that do_menuconfig / do_diffconfig run inside the build directory.

This causes these tasks to fail as they're being executed in the
wrong directory.

Set workdir explicitly.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/cml1.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 5834806..4b3b916 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -41,6 +41,7 @@ python do_menuconfig() {
             bb.build.write_taint('do_compile', d)
 }
 do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
+do_menuconfig[dirs] = "${B}"
 do_menuconfig[nostamp] = "1"
 do_menuconfig[dirs] = "${B}"
 addtask menuconfig after do_configure
@@ -72,7 +73,7 @@ python do_diffconfig() {
         if os.path.exists(fragment):
             os.unlink(fragment)
 }
-
+do_diffconfig[dirs] = "${B}"
 do_diffconfig[nostamp] = "1"
 do_diffconfig[dirs] = "${B}"
 addtask diffconfig
-- 
2.8.1


