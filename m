Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3745871B2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 07:09:37 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id t196so21372098lff.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 23:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ppTmI/zi49O5hi/HYvififvHF3CBzpC1QaRKarorsIU=;
	b=emn9mFTePXmWr9NTjBv9/5IGbOdeYlTbz8poa1yT/FUtjAMsvujVIHJQGzlz77XyBj
	xM7c9Kkd1V28hlMiu7aMvwDHN6dTlNGwDNeTeEqVwjoBietIh/FdaQ2Qo44pcZpXTrpL
	PgkvSTvWEBpiIaTk/kMRfko9PGWFfkDP+9RGbfm9qkXmwDYCbKL7Hn224p8CtCIwgk4e
	ZQ5zmJnZesI/yEjEkNaVmWvgTH+aekaVGzJvm/ykpmsf3YoqTvk1horeGnLN7gifYTb5
	7PaU6uu8agC0XuvWileV9HklB3pWi65K7Lynb7EKrcP/1Xz4Gtw3MMHy9RRqAH3XEQQA
	Uivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ppTmI/zi49O5hi/HYvififvHF3CBzpC1QaRKarorsIU=;
	b=Eor6y9dKb6BTCDxHCkTHjktv6669JJcvbgrqL3J+nSdW0Nv/6/TWssOmp8aV8oLxA9
	2ImRj86FYzmMSPmOoIRxGc4aTeKt3wp2PVvwayNm73xWKjVqBl8S7Q5MHKMQ+GTghExq
	Lmozll83Kvonxp9vtH+CEtiCL85FZK0ZIiV2suCC+MKCe0pu0XHWY8ZG+++/o8xoIDDR
	h//4/y27Pcta+JQukuPK6y16tfdvc78sMVk6uUjO1Qq7JgBWPt8G2xMReFYTvsIkcncR
	pDEJtMfdUS6nvlG7RMhNtDl2PK5sqxAaxA87OabmWZa+Tk6U37bBPNLQ/Ba5k3YmgsBD
	QZnw==
X-Gm-Message-State: AKaTC038lxKjvsT0FYapzwyMqUwThc+ajJoFLheRWhFjN0M/cM9IJ759RAh1nb/+ywHGag==
X-Received: by 10.25.159.78 with SMTP id i75mr366352lfe.123.1479971378840;
	Wed, 23 Nov 2016 23:09:38 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id v9sm7780542lja.0.2016.11.23.23.09.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 23:09:38 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 08:08:29 +0100
Message-Id: <b2eab9f7415c66ae0e2b297a3875cdf75f281d43.1479971185.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479970230.git.maciej.borzecki@rndity.com>
References: <cover.1479970230.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479971185.git.maciej.borzecki@rndity.com>
References: <cover.1479971185.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v5 2/6] oeqa/utils/commands.py: allow use of binaries from native sysroot
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
X-List-Received-Date: Thu, 24 Nov 2016 07:09:38 -0000

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
index 5cd0f7477baa5bb45f2b2b5b93fb1ff0efd02923..657c9dba34ea9d42aa416f3b889f4b04129e8da9 100644
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
2.5.0


