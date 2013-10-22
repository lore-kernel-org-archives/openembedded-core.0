Return-Path: <tom.rini@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id B33846D2F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 16:37:07 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id c9so5568618qcz.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 09:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=02/EE1mDMEJH1bEcdFirvYoBDNDdIAnUrIb5ZFzfzhA=;
	b=xHbPyzizDIRzZcWuaFTIo11/yiF+aglOAfytRU6KJxhZCex2wBkjw2em97J/LFSdzy
	SG6I8gsZNaKPs1sLoapRQ4H+p7aLBd6s2gRbg0TisOXzR/pVq4r/mx0+922EF8SwzNRY
	Nxoyw+3pKbJxoRpHMgI//PKwZ2KCTK5lOuhDEggzcasLlZsuUZkYBZGeXdxq9l4cFsi4
	can9jyvWSn/aqaCTcke++NCYoHEz4Tpqx3iTSBwKH1rLqj5zQbRpDfLMG5v56XN9/why
	Z/a7vIiRShZjRALiOX7fNntxLSTyQ1W1GbjppfXaGOZgIj9fuB34mx1x4ZBTSwbZUt+o
	Jklg==
X-Received: by 10.224.64.200 with SMTP id f8mr31399977qai.55.1382459829211;
	Tue, 22 Oct 2013 09:37:09 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-216-211.ec.res.rr.com.
	[174.106.216.211])
	by mx.google.com with ESMTPSA id b10sm43813325qeg.7.2013.10.22.09.37.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Oct 2013 09:37:08 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 12:37:10 -0400
Message-Id: <1382459830-15683-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] udev: Update touchscreen rule for ID_INPUT_TOUCHSCREEN
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
X-List-Received-Date: Tue, 22 Oct 2013 16:37:09 -0000

Since udev 174 udev has been running input_id as a built-in command and
setting this value in the environment for touchscreens.  Use this logic
to detect when to make a touchscreen0 symlink.

Signed-off-by: Tom Rini <trini@ti.com>
---
 meta/recipes-core/udev/udev/local.rules |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recipes-core/udev/udev/local.rules
index 72d92ef..d0b0216 100644
--- a/meta/recipes-core/udev/udev/local.rules
+++ b/meta/recipes-core/udev/udev/local.rules
@@ -17,5 +17,5 @@
 ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
 
 # Create a symlink to any touchscreen input device
-SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK+="input/touchscreen0"
 
-- 
1.7.9.5


