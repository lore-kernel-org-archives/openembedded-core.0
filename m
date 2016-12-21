Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6806F773ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:11:52 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id p42so204911275ioo.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 05:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fdPDxhJZhlmCToecIQNlTSUD+Tr50uEVk5iLx/1cd7g=;
	b=m9mgj2DIuRmOWxtUT7GXuXGnMs2hxc19CFx13DxhAONkbwests7PF/3zdZ/1Lx9J5r
	4iS5v2TdXiNYXTEMS9mo/+wKYbJZkkognbsc5YBzEvieQav7mrgfeYz9fiiEgqJpawjU
	EdPdCv1qFZjgxdDloycSKZwWOvMjB0iuarLsFMQ9VBsCQ37Nb6nhgeapb7kHgCDz4t35
	VX91N38QxcGX/Vm7QA0wZ0RghkvoVUoGd8xBdr+YY7zXG+T4pb2YQvINGJ9Np1lloGC2
	b6r2TjSpnZ8R5JjH+LGVoryEPSlM5rpBWDj1pqn335ObTpI0XGEpEOCMKToVLvFW1ImZ
	5rqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fdPDxhJZhlmCToecIQNlTSUD+Tr50uEVk5iLx/1cd7g=;
	b=DayrEeKUzrmnWEtXgZDxaMv+OtcQuEltZlk6EMzCumY5JrLxaY3QZVoX9FqmnRIq6N
	5iz3F6T/+ESwkRbZSzh7p6HKFYOvNTIUNFxXT2XzoCh07WegDmgKs1cwNvC1t2yqcSi/
	1wNOP/Rmotj3/n05JQ1uzJbkw5Yh5NUNKBPVGE1CYBaNvnsW5b+1FxFtef211bQlvEZa
	+am2oOjetS86m/mxz8AIX0NRMnaDSr0Yopzedf8Th6Hj6ipedsGL/q0KeqszXSn2hlL9
	dgGEQ+v17VFN5bjTZctyEZjZs9SPN0w41U1RkG8NaVGNNKyn+DoLdkv7BxY7QEG2PbQ+
	hsuQ==
X-Gm-Message-State: AIkVDXLlaXFDNC2Dwl6kwnF5ZrlCbfYkQGFlzKCR+l2bH+VCbaBodJhrgaGzfoLkrjsCC42T
X-Received: by 10.107.158.4 with SMTP id h4mr4895959ioe.43.1482325914014;
	Wed, 21 Dec 2016 05:11:54 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F3CB.dip0.t-ipconnect.de.
	[93.232.243.203]) by smtp.gmail.com with ESMTPSA id
	o65sm12103726ioe.15.2016.12.21.05.11.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 05:11:53 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	ricardo.neri@intel.com
Date: Wed, 21 Dec 2016 14:11:28 +0100
Message-Id: <4214d45efdfeda4be125efe8de73c1502114dfaf.1482324587.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
Subject: [PATCH 7/9] runqemu: let command line parameters override defaults
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
X-List-Received-Date: Wed, 21 Dec 2016 13:11:56 -0000

It may be necessary to override the parameters gathered for the qemu
invocation. For example, the qemux86 machine configuration sets "-vga
vmware", but when using OVMF as BIOS, only "-vga std" is supported.

By putting the parameters derived from custom runqemu parameters like
"qemuparams" after the parameters derived from the machine
configuration the user gets the possibility to override those.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 0a9cb94..203992a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -926,7 +926,7 @@ class BaseConfig(object):
 
         check_libgl(qemu_bin)
 
-        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.qemu_opt_script, self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
+        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'), self.qemu_opt_script)
 
         if self.snapshot:
             self.qemu_opt += " -snapshot"
-- 
2.1.4


