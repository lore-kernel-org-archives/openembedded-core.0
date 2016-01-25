Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id D8412766EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:32:40 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id e32so116242765qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pAROEs5ZG8gVWaiVXWKRoZfpsOl4uIyI+p6HUYwW8SU=;
	b=vCysqjOUGnF5ersVvF7OgdaXZn07bcMLhwm/QJ6hkXXa0Wmxqgygi4hJMlRdfeVgKw
	JvJdB2YBFPHomfaQFfFhHaWYCbHfeDHEVrbxFccYqhzK9FrjmAJ0LRJdHh3OBYq7GGIE
	MS5L1S+DKZDtw4Qke3oivQgWlPskV59EEmBSl5jojSb/Bxiv3u1lEqGlU5eru+d0Sk38
	pXGZNQgixu7KjXQVAUCn/miBUiFWejjMGCRaAFtin5SuMKXq2XzZ/SVV197Y0BDznZOe
	vjyn8HI7uy4wOuY61l+PXvnvRA4X9dUGBxY31Jf91tHuu3j3LwpM/WYL8QOeQYsfEAX7
	BJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pAROEs5ZG8gVWaiVXWKRoZfpsOl4uIyI+p6HUYwW8SU=;
	b=HZDQ0nFMBeJu9zQHXKFJXpIZj+9zvbVvxUKvSu+xrvn4C5Qf6O+Tc8KmY5lIAQA1HM
	i6KqUctGmC2utcogNzkYxbuJcITYMI0pnGRXuHGohGF6sM36lJw/16WLvGzh7gB8nPru
	8zdvgf3NS6ENG+9FWpQP3ekacIi0LB0Pbr1GHBrh9J74MKx9366mioayRcvjeFuKKwBh
	ZOqDy6F8mCmsjEbCCsyF+5bggYyzIUwoa33lV3Xps3uv586YE9PzoMz6ttvK/9sDKHnh
	HHJzkT8DysFmkj8h+pgr5/h6efr5tDHq0mRHpl1NltExHdUkELtnrtPBYSOevFP2zVDF
	Et/w==
X-Gm-Message-State: AG10YOSvM4Hp31JnVMHHRzuP+3BxuSqyLlVQiSXFQshHCAPrCg7k9Be9rVyOzb+PE5ZhTg==
X-Received: by 10.140.19.43 with SMTP id 40mr23280564qgg.72.1453746761612;
	Mon, 25 Jan 2016 10:32:41 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id h99sm9201586qge.7.2016.01.25.10.32.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 10:32:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:32:17 +0000
Message-Id: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1453746280.git.raj.khem@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
Subject: [PATCH 01/11] btrfs-tools: Disable backtrace on musl
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
X-List-Received-Date: Mon, 25 Jan 2016 18:32:43 -0000

musl does not support backtrace APIs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.4.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.4.bb
index c17b7c7..5ca9bb0 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.4.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.4.bb
@@ -20,6 +20,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
 inherit autotools-brokensep pkgconfig
 
 EXTRA_OECONF += "--disable-documentation"
+EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
+
 
 do_configure_prepend() {
       sh autogen.sh
-- 
2.7.0


