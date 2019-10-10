Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id F0F347F501
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:49:35 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id j11so2996350plk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 08:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pojecd08mj2wemeStIcomXq3yvWrHPt1J3193bbAAFQ=;
	b=OT7vvYviOx8Bp14RWXtTW5dtZxOyArd1+IiYY8dTZAhmS478fG9bizxsqwcii4Qjgy
	0RAv4Mcm8USej/0zJptqB8BaaQml4GQf4wddEe26bGifBxhwOn+45ZqjwtdReITZQ9VI
	XQ0kOo/9orw4DKg5MfcrGMqXEInWQnVO2WLBx/pUuUZlJ4Kcbby9Gb4Y98DArGhFfZpC
	I7PBapacBqF9W5WhmlSkiCXmy/6V7NkXSsjUIstavI/yuoi1hgBAx3H/STmpS3KBQq0Q
	lDpYtTGMMx+6Idu5JgwYHI1P7GugNC4HdgsXFmxNg4LhL75A2NXHTXqiqhVnrTsyb2h1
	ZYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pojecd08mj2wemeStIcomXq3yvWrHPt1J3193bbAAFQ=;
	b=E68iBzEpP+v9Ss6Gm1bF1N7eHwl4qqx3DIHcQicACqBnyR1GjHQ54ICMDvWhSMoaf+
	ohhD7t4THDPXMDjQxf33caEVSjyBm/Vw94eQLQX/bUnmDbKTp3taARJQLEWkqFbqz19L
	THDXW1HsxFKUTJ+rRd2kZtsXu2wsrEQipymHHEVPg/u7PhdRPg8TM66ER5V4jOFihUeQ
	lrLeRU2hKf+OL2tiSXTNAmhTBEzqHNjl4zZEq+GglGLCh0+Lq/lGB7B0LnblW6MdGMeb
	ywDSI2z/6QiKpT8HJCuPl7yaYVzzIhdbxQMcqar1wmDSMXEqKRf1zBMbYI+oMy1v7YJG
	f/og==
X-Gm-Message-State: APjAAAVBtTff3Y2TcyLPXy2Qdu4+StfMfEw9ZsLob1CfTBWd9MT0c07S
	DedhHH3N8dUeW/lGy2iW1mlomvFv
X-Google-Smtp-Source: APXvYqw275osi8MJHDDGzTpaOsu0h0LQs/Vw9d9RYWfnCoxRBsxdA8/yHL9q97NbpL9gj50WqrlO6g==
X-Received: by 2002:a17:902:326:: with SMTP id
	35mr9466167pld.188.1570722577004; 
	Thu, 10 Oct 2019 08:49:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ac6d:f6a6:e34b:c619])
	by smtp.gmail.com with ESMTPSA id
	m26sm9872552pgn.71.2019.10.10.08.49.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Oct 2019 08:49:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 08:49:17 -0700
Message-Id: <fad633eb5c464d4e2a984b9259625bcd150ee357.1570722439.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570722439.git.akuster808@gmail.com>
References: <cover.1570722439.git.akuster808@gmail.com>
Subject: [thud 05/12] json-c: Don't --enable-rdrand
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
X-List-Received-Date: Thu, 10 Oct 2019 15:49:36 -0000

From: Adrian Bunk <bunk@stusta.de>

In recent years AMD CPUs have had various problems with RDRAND
giving either non-random data or no result at all, which is
problematic if either build or target machine has a CPU with
this problem.

The fallback is /dev/urandom, and I'd trust the kernel here.

--enable-rdrand was added in an upgrade to a new upstream
version without mentioning any reason.

[YOCTO #13534]

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 5b10e68..e6a3899 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -20,8 +20,6 @@ RPROVIDES_${PN} = "libjson"
 
 inherit autotools
 
-EXTRA_OECONF = "--enable-rdrand"
-
 do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
     rm -f ${S}/config.status
-- 
2.7.4


