Return-Path: <layliu@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id C32166D7BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 04:43:54 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so1596137pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2013 20:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=tIoHKbGBKeSMTbW/UeXSsDpxxtLSbb3XFr+wLj2gm9U=;
	b=AaNok5EGk5EnM8/xIinZQrtKrChdTlDjU4cGEGEiH/GD73vOSw0nxZmd28+fLQEfwz
	ew1xohIQRP1V10+JABZq2/wH4aOuVRDw7USDgvju1NZ0JDSt4kWnj9y0y8S/iMTY2RMQ
	4c+7/P4TfoBHj2t+yEo0Z3MLp/g5VZlKHBMZaB9WOwaC5aQxctLR5vhQHD9ttfiLRjS9
	9jHNBPhRNF/2AJY6DCEBCyByhUzWVFJiQalTiEzXHbBAnukV062F9beau6UjbI3ZfNpD
	5XdlXQ/AUNPIzFlJrJevRN9X+d75KI8E1rs6EPd0hQqspHLoeJR+BrXvBDdh4KSCOMKv
	94eg==
X-Received: by 10.68.133.230 with SMTP id pf6mr21845741pbb.64.1384145036409;
	Sun, 10 Nov 2013 20:43:56 -0800 (PST)
Received: from [128.224.163.160] ([1.202.252.122])
	by mx.google.com with ESMTPSA id
	yh1sm27802490pbc.21.2013.11.10.20.43.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 10 Nov 2013 20:43:55 -0800 (PST)
Message-ID: <52806087.7070503@gmail.com>
Date: Mon, 11 Nov 2013 12:43:51 +0800
From: Lei Liu <layliu@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Enable building multiarch mips gcc
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
X-List-Received-Date: Mon, 11 Nov 2013 04:43:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

MIPS gcc is not configured with multiarch enabled.  This causes
compiler generates local label with $ prefix, which is specified
in default o32 abi.  It is not recognized as local symbol by n64
assembler, so we get a lot of unexpected external symbols.  We
should configure MIPS gcc with --enable-targets=all, as for other
archs.

Signed-off-by: Lei Liu <lei.liu2@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index adaef03..6f3bd24 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -28,6 +28,7 @@ def get_gcc_multiarch_setting(bb, d):
     multiarch_options = {
         "i586":    "--enable-targets=all",
         "powerpc": "--enable-targets=powerpc64",
+        "mips":    "--enable-targets=all",
         "sparc":   "--enable-targets=all",
     }
 
-- 
1.7.0.5


