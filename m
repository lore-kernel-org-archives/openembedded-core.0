Return-Path: <kergoth@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1C57C7BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 21:36:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g12so7184690wrm.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 13:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uE3MVCOkKqfwL+2Fc51GXuCP8daclX7UDXdreFdl2j0=;
	b=kGiWGkqj82aEYr+R2jdWDco6ugH3mV1RpQZvQGS06aReWntTRDG6LjNnZsiJU7VCE4
	5jgqATzoApgNg3I+iSPRwHArTTi+xe+2ScybNUIR2WXus0PU1uB0PQanNm9Haixqdf0C
	7IMVBHgqXu7Oya0TiGv/OHfzJvKWpNOGwFxqwN20rtyn6kr4Nv3cuPx276F+JEyqptk6
	ejDTo47reJ60XqwloNriUaZADZnxjv5a/y5ezZ/CEWP9nNIFaM0pYpL61u0MvBelwDA4
	kZGE8/arvuEKJX3z7Nd+D56/7MOD+yjolwhxgJbGH+STxw6osf5KupVzJwhiclfp0QE9
	M0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uE3MVCOkKqfwL+2Fc51GXuCP8daclX7UDXdreFdl2j0=;
	b=RpzZ5yiwqPVAcYZzt1qrq1gMzig+yVValMmIlzWxUf4tAgf5KKu9104ydt9sOr0GvR
	6UtUrob2Qmp0RA8xQ7CFUwbUZRoxKvsEcLaLltjAG8cSgx9grSwl/cgEUYRJqPulkaBL
	1L19IPQfY0+BdtKfMzYriaJ5qcCIeMcTa/KlYz/P/65F2o7yniQxo89JLLWk5wT2DHQG
	qhytjSnDx60ouh96uoWGtAF2ONjYvl8TriaxVw2Kd6DqSE9kVh+YFUqAHS9TQBF3tIl/
	bI/LTAxprTA0woHaAWc5v4XWy+DFYpmwDUkuq+9hpRQwAXfg1bBswS1V2FxTmNDjNlPX
	5FCA==
X-Gm-Message-State: APjAAAVMtkZEfdv0Qtqd5tX85sjdUrsCsH0/6+lOiSTE8q0zefMQ6Bc4
	adbLkhiA4sUlmx9ut1Qe351USlA3GA0=
X-Google-Smtp-Source: APXvYqxN3lAYzeQzG/R97EPm3UtpfeUb9lCi2v6cXXvQDh3UqQ/blRyy+a51Oq8YLwVHzV9heyuuog==
X-Received: by 2002:adf:81a1:: with SMTP id 30mr15329457wra.285.1551735395811; 
	Mon, 04 Mar 2019 13:36:35 -0800 (PST)
Received: from ubu18-mel-builder.alm.mentorg.com (nat-lmt.mentorg.com.
	[139.181.28.34])
	by smtp.gmail.com with ESMTPSA id x6sm11819411wmg.0.2019.03.04.13.36.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 13:36:34 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 21:36:25 +0000
Message-Id: <4899afe75a0ed717f1531c41a952e0fb83d18991.1551735224.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1551735224.git.chris_larson@mentor.com>
References: <cover.1551735224.git.chris_larson@mentor.com>
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/4] recipetool, devtool: set up the logging filters
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
X-List-Received-Date: Mon, 04 Mar 2019 21:36:35 -0000
Content-Transfer-Encoding: 8bit

From: Christopher Larson <chris_larson@mentor.com>

We want errors going to stderr, the way they do in bitbake itself.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/devtool    | 2 ++
 scripts/recipetool | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/scripts/devtool b/scripts/devtool
index 0e578c0de3..de1847eef3 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -282,11 +282,13 @@ def main():
         logger.debug('Using standard bitbake path %s' % bitbakepath)
         scriptpath.add_oe_lib_path()
 
+    scriptutils.logger_setup_filters(logger)
     scriptutils.logger_setup_color(logger, global_args.color)
 
     if global_args.bbpath is None:
         try:
             tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
+            tinfoil.logger.handlers = logger.handlers
             try:
                 global_args.bbpath = tinfoil.config_data.getVar('BBPATH')
             finally:
diff --git a/scripts/recipetool b/scripts/recipetool
index 3a3c9b7445..bac9c72107 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -75,9 +75,11 @@ def main():
     logger.debug('Found bitbake path: %s' % bitbakepath)
     scriptpath.add_oe_lib_path()
 
+    scriptutils.logger_setup_filters(logger)
     scriptutils.logger_setup_color(logger, global_args.color)
 
     tinfoil = tinfoil_init(False)
+    tinfoil.logger.handlers = logger.handlers
     try:
         for path in (tinfoil.config_data.getVar('BBPATH').split(':')
                      + [scripts_path]):
-- 
2.20.1


