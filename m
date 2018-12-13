Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id DB3326D494
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:10 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id q1so1737548pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=C+q3YsGftQCpRgxIir+XNIr1LXKOcbBAf830tRt1Gt0=;
	b=pykpCWdGea1jPvq5/cmsHAAhgkr/zvbTPIobJtJNkKyFnWie3xIi9MdPl91fXTY/2N
	oxGl0z7sL/TexntAWVd9Pc3RBEvZ+dRWi9SnBZYSE0zwAPs51z6jPc/g9iAXH0bCblAb
	1FuqokAx5x+/nrBnuod8wqUibIAUS83c7oYck4FVcKV/rjL6lQ7QO5gRsbyStTzXabWJ
	gEmMAr8JZAM3z3Mtz5ENvNcTG/D9DWIB91YSdpFyg/gI/Wcg0D/H8ltjzKkvuGPkYDjB
	rFy7/A35qmYrV2p9D3kZVA0guz8rDBSa9pmo369WDi7id8pBuEfyiNQXkABIocrTpQqL
	AEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=C+q3YsGftQCpRgxIir+XNIr1LXKOcbBAf830tRt1Gt0=;
	b=XJ6bJAqMNPdb6GcZ3LMuDlEShEO4X1hCoZK9UuvoKYspn/lszgc55iEVKFHvkX2wbi
	sM6M1TKH71zGklL+hZ9zhTUcLZX7mm+XEYal66ZtgmImF4SRCQWzvjM+6iZXLnAafHfe
	GwELfhjOP/rPcF2U5TI9C+GRxUPbvzOBXddF25/gu8m4WC/60arzxsZY5jlzFgMrwJ9t
	NUxQu0+Z+3B0ZVtKej8wey+Aod9wTZ8Rp2MUz/RdOz49Mx48JbFdOKuU+fXjGyr7Nmqy
	H0xHBModst+A5duGoP0MyCLPStzeoD/sWJEE3/Qr0HvUU6qBUmsFrn+oyQLPChVz7cE5
	MExA==
X-Gm-Message-State: AA+aEWa105Nu60UjAY1VohqApb+Kflqc+gJkGg8djrlTI2sq5JgFdC57
	VIY8QdxPJbEN100Aa93gvAcvvSrI
X-Google-Smtp-Source: AFSGD/X1od+LN20BSu0gYGyn1cozpH+eFjMgBi2CEtWpd3940VUqzda0e1v0Wc98I6tygKZGmZxaeQ==
X-Received: by 2002:a63:e247:: with SMTP id y7mr416599pgj.84.1544737151858;
	Thu, 13 Dec 2018 13:39:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:17 -0800
Message-Id: <8191d3380f85cbdbe6e32b7d621286ec1d3da853.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 09/45] oeqa/utils/commands: Add extra qemu failure logging
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:11 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Rather than just referring the user to the logs containing the failure, print
them on the console. This aids debugging with oe-selftest with parallelisation
as the logs may otherwise be lost.

(From OE-Core rev: 36a018e245a232f520ff946f152cc875927a6fb4)

(From OE-Core rev: 0ea441ab6a6fe752cc8820fb371e67eee92353e4)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/commands.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 0d9cf23..933af92 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -333,7 +333,11 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
         try:
             qemu.start(params=qemuparams, ssh=ssh, runqemuparams=runqemuparams, launch_cmd=launch_cmd, discard_writes=discard_writes)
         except bb.build.FuncFailed:
-            raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
+            msg = 'Failed to start QEMU - see the logs in %s' % logdir
+            if os.path.exists(qemu.qemurunnerlog):
+                with open(qemu.qemurunnerlog, 'r') as f:
+                    msg = msg + "Qemurunner log output from %s:\n%s" % (qemu.qemurunnerlog, f.read())
+            raise Exception(msg)
 
         yield qemu
 
-- 
2.7.4


