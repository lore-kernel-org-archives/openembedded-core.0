Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id A02E8719C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:21:29 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id b14so51656615lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=jhHgUWh7y0C2iFXn/F3yZpUz1K6g4SldU9/xeBSXCtQ=;
	b=Mnr/d4G3ev8xnczNLxlAAKOrDr6b6HfJQbTS2TNj+vQ38a/SWyGEL95sN0r4ktohsy
	tylEFlVLJfLLc45aLfPgFwKwLwgRPV5kl6+VtwXVAo2BouqQXHildEWjG6UdQzdOAJHE
	cOptzJGLoqOkVZcN28xhW+/mMyOO8wKEKaOEljXpVzn6YYfi27if1roMXA5MMuAAP+4u
	ui3oiORIWBOZsu4re2sKinxcUTnSw71XaUn4/NKgjRIyClIEV6GTKvFAT2TK8fy+m150
	n1Vi7LuT6tDjLcV8E56psViWONqJvsHBgyo2xfgo6C+0HcKiVU9T7zZZYYx5NVBD9ZRe
	MR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=jhHgUWh7y0C2iFXn/F3yZpUz1K6g4SldU9/xeBSXCtQ=;
	b=rT1yJ++1Z6aI5QF8Mfk3g81wv55uFbzBAF4nzDserNVyevL0hADY5HzLREl+RAGAxe
	wLvUo4DZgZh8Q1OEnDvPkt9XdX2Ppc76OaMVPi3BuRP7SY5SS96j4WTXstCw1YD+8JNa
	bS6rV8Yivamf5xPnrpBgkC68AamEKclwlWIJbaibn197IFPDoT0r8/++a3aSBtmBNmMF
	CAiCOyPbKs7G2nmzJwl1boymq+ScGfJIEkwfhqTqCe7mfPwLKZR0ElKYewf413S8wLik
	sH6YdHjhPBOO1NG6O7ZkPSCiT8MeQioBjgHwU+Frdh/neQegMsYnpOEgFmdh2ygIVcjO
	huQA==
X-Gm-Message-State: AKaTC02xcC2Moyhe0eOu7s96Wp4ry23nm1dkS+RBrhHT3LUlGAcCcHLN0kdel63HkPcnFg==
X-Received: by 10.25.20.23 with SMTP id k23mr5225990lfi.136.1482146490209;
	Mon, 19 Dec 2016 03:21:30 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id c2sm3681892ljb.8.2016.12.19.03.21.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 03:21:29 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 12:20:57 +0100
Message-Id: <06471cdc58e6d6ec1878601103bd6f602b4a5780.1482145354.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482145354.git.maciej.borzecki@rndity.com>
References: <20161213185317.GA6550@linux.intel.com>
	<cover.1482145354.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1482145354.git.maciej.borzecki@rndity.com>
References: <cover.1482145354.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v6 1/5] oeqa/utils/commands.py: allow use of binaries from native sysroot
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
X-List-Received-Date: Mon, 19 Dec 2016 11:21:30 -0000

Tests may need to run a native tool that is not available on the host
filesystem, but can be built using one of the *-native recipes. In such case,
the tool will be available in native sysroot, and running in from that location
will require adjustments to PATH.

runCmd() can now take a path to native sysroot as one of its arguments and
setup PATH accordingly.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/utils/commands.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 3a68b001b76ca89df17545912e2f75ca2cca6a38..0425c9fd98c7e8074ced6222156f5a1c2a393f50 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -97,9 +97,16 @@ class Result(object):
     pass
 
 
-def runCmd(command, ignore_status=False, timeout=None, assert_error=True, **options):
+def runCmd(command, ignore_status=False, timeout=None, assert_error=True, native_sysroot=None, **options):
     result = Result()
 
+    if native_sysroot:
+        extra_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
+                      (native_sysroot, native_sysroot, native_sysroot)
+        nenv = dict(options.get('env', os.environ))
+        nenv['PATH'] = extra_paths + ':' + nenv.get('PATH', '')
+        options['env'] = nenv
+
     cmd = Command(command, timeout=timeout, **options)
     cmd.run()
 
-- 
2.5.5


