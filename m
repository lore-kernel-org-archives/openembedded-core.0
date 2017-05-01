Return-Path: <dev@codyps.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2161B71DA1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 19:51:18 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id z67so13209514itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 May 2017 12:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=D6YSImr7YRYqSslUt8ZJQhWL2hoqAjZQH+FPHwg5wYk=;
	b=agwIQ7KPd8O3UBXmhlfIky49Rvvpvdn3NT2j/WYKD/r/hShEepf4ghQ/0t2NLSlcwf
	4l1XS5oNle6eWczpj1aWBKRKZ2+L0tb4y2rE2wPThijU7isMPEbieDeB3VmoqgsvZyDB
	2VvMsQEhCWsZudZjWm8vn5/W1ODbAHe9RERAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D6YSImr7YRYqSslUt8ZJQhWL2hoqAjZQH+FPHwg5wYk=;
	b=LTydbPtkuy7/djPuB3Pgt6l+FuxiDw8DuGwCezvJK4zqxsjKTujwAITjQN3BTE9xOW
	4Yz+/xOmYTc7gaul6Ycnn64l4ewgCluP2UT6XpKJYkgNPWL5u9RSwKSNESXGeTns31Bj
	ub3NTVIiCquL1JEzbvSkGQbyCd+ueVaIlaWmA2vtCO2R5i7Ysm8yGG5WbMv1dRg9IUwN
	QF4Ktw+fgi4SGTJApFbRG4pJIFudw+ByEUeSstcLYvJBoz35pbkzZUS9umRt8ZfkvrT7
	JOgptuWRnvghywKU0WHc3Ff6UNLQScyn2DJdCyQ8JL5bVWaeHPujysRSCIe9xGnqwFS1
	KmiA==
X-Gm-Message-State: AN3rC/4TIPERVVynbSVp+vMZcvQ01kxzMZYS+I3WqtcPzaynMx9zzkij
	72G5tWkImErYbQ==
X-Received: by 10.36.69.225 with SMTP id c94mr210729itd.79.1493668280111;
	Mon, 01 May 2017 12:51:20 -0700 (PDT)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52]) by smtp.gmail.com with ESMTPSA id
	y98sm7069413ioe.29.2017.05.01.12.51.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 May 2017 12:51:19 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 15:42:23 -0400
Message-Id: <20170501194223.16344-1-dev@codyps.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH] cmake.bbclass: use `cmake --build` to build & install
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
X-List-Received-Date: Mon, 01 May 2017 19:51:19 -0000

Rather than presuming `make` is the generator, use cmake's generic
`cmake --build` feature (which knows to call the appropriate generator).

Both DESTDIR and VERBOSE still behave as intended when used as
environment variables instead of make variable-arguments.

This makes it more straight forward for others to select other cmake
generators (many folks have been reaching for `ninja` lately).

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 meta/classes/cmake.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 12df617ad8..05ec50d385 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -135,13 +135,11 @@ cmake_do_configure() {
 
 do_compile[progress] = "percent"
 cmake_do_compile()  {
-	cd ${B}
-	base_do_compile VERBOSE=1
+	VERBOSE=1 cmake --build '${B}'
 }
 
 cmake_do_install() {
-	cd ${B}
-	oe_runmake 'DESTDIR=${D}' install
+	DESTDIR='${D}' cmake --build '${B}' --target install
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install do_generate_toolchain_file
-- 
2.12.2


