Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1F32E731CD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 13:27:34 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id d62so167326614iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 06:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=gxa4HO5EITvY3HXEA6TlThIOyId7D4NehDR0ihyD1Sw=;
	b=SA+MK49Bu2I2ngC37gF0CaiKJ1plFrQRCLWA6ayVKwIZlZ74ZRm16G3++32mL/xGuq
	pPU4QMEsTOF8QtdsUvImhFx8gu9nhaImhbgLP2lcgZONAPws2AGrpHmdsw9O6balsC3O
	K2ilPnqWGHfCNlhwuTwrmHuSbDI3TovM07DSswS+qbqAhFnVRxc1SIgpVp422x/Zprex
	UoLSgWh7CZ2m17p1+Od+5VTJkMm2x2VUGxFGAdgHem6CObWpi+UHZlpW9xoVd/W5/ofS
	aR/jdgvdpk9LAGcpU4r4ZvCxJ8q7cjgmO775tkg/g+AhwzXdJSG6xx8mrfQhAKCe+cF8
	C9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=gxa4HO5EITvY3HXEA6TlThIOyId7D4NehDR0ihyD1Sw=;
	b=HuoEEk8Lf8mgDfKeD9LfqAZOfOj/5OMEPcAd+WlULdHRmGA/QHWwpmNxSMbX9C8xhs
	q2dnAn/h7nHaFV5GVRfg1sbxoe9EEKVjhtfwzPjzFGKmPfIDSFytGA6zwD9FwfCD+C1t
	zy0TOiVst+HsM5ltpIVC6YbFEy0Z0IMMuTN1oaPPKa+vo1pddEb5APK+JKmct3QQmQTV
	TEEiW/iN+AlXGBEtChLWCYJSHG6ZICjS8on0ZaZPtr06x7+IMTSBI1AQ3NVRE+pdRPKb
	297zEHxdQd8iQWfHDfEn5DOi8HHiO6vllVj16psTds8FH6dDZTZCM4AnAeqK+I71zGMA
	XV+g==
X-Gm-Message-State: AOPr4FVE9+vYP28x1acI9HPIT5Oyxr6mlMCOq1uSRbZr3xJ7sRFSX2HeTbLwOAczAHcjAIND
X-Received: by 10.107.2.70 with SMTP id 67mr41569595ioc.70.1462195654912;
	Mon, 02 May 2016 06:27:34 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8DB4C.dip0.t-ipconnect.de.
	[93.232.219.76]) by smtp.gmail.com with ESMTPSA id
	69sm18286189ioo.20.2016.05.02.06.27.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 May 2016 06:27:34 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 15:27:27 +0200
Message-Id: <c02aff2c0148ae8c938be22026fc42eb9a5b9db7.1462195334.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <baeb6e18d0a535ad2ac62fe4ea12515a78fce88a.1462195334.git.patrick.ohly@intel.com>
References: <baeb6e18d0a535ad2ac62fe4ea12515a78fce88a.1462195334.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1462195334.git.patrick.ohly@intel.com>
References: <cover.1462195334.git.patrick.ohly@intel.com>
Subject: [PATCH 2/3] combo-layer: runcmd() enhancements
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
X-List-Received-Date: Mon, 02 May 2016 13:27:35 -0000

Allow setting the environment. Due to a subprocess quirk, it must
always be set explicitly (reuses the one from the previous call if not
set, instead of falling back to os.environ).

Embedding nul characters will be useful for parsing git output more
reliably; support dumping such output a bit better.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 41d69f8..9297d59 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -174,7 +174,7 @@ class Configuration(object):
             logger.error("ERROR: patchutils package is missing, please install it (e.g. # apt-get install patchutils)")
             sys.exit(1)
 
-def runcmd(cmd,destdir=None,printerr=True,out=None):
+def runcmd(cmd,destdir=None,printerr=True,out=None,env=None):
     """
         execute command, raise CalledProcessError if fail
         return output if succeed
@@ -186,7 +186,7 @@ def runcmd(cmd,destdir=None,printerr=True,out=None):
     else:
         err = os.tmpfile()
     try:
-        subprocess.check_call(cmd, stdout=out, stderr=err, cwd=destdir, shell=isinstance(cmd, str))
+        subprocess.check_call(cmd, stdout=out, stderr=err, cwd=destdir, shell=isinstance(cmd, str), env=env or os.environ)
     except subprocess.CalledProcessError,e:
         err.seek(0)
         if printerr:
@@ -195,7 +195,7 @@ def runcmd(cmd,destdir=None,printerr=True,out=None):
 
     err.seek(0)
     output = err.read()
-    logger.debug("output: %s" % output )
+    logger.debug("output: %s" % output.replace(chr(0), '\\0'))
     return output
 
 def action_init(conf, args):
-- 
2.1.4


