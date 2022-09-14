Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0423DECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 12:09:14 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web10.5464.1663157353082089010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=X6drN7vg;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19,
 mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 224F132009F4;
	Wed, 14 Sep 2022 08:09:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 14 Sep 2022 08:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1663157351; x=1663243751; bh=eQyTaxRN8/2lm84fR3EbUhmPb
	+HcjCM98pmQqodB7RE=; b=X6drN7vg5W4SEkHPZBRnsAwP+IRtK+ALO/HfT6DK6
	bqwniIqxUcBQq+bmWqWioRS1k5fjJxTTTjrob0fquH+TWWucgLnIXW7rZpE2WVFs
	Xx7wC2h6eXYJFRVCXXVz3QLZLw0CXOPUcVDCTzqlog4RlkzQYsbQFhbrigNNJj1U
	EFa4bU9RWWOjs8gJUU9C+JEgWTXpz+izamn41ACLFdvQgQ9CJ3TfMvtZRKVP7C+O
	997yKpkAztd59uWV/bRhIsxykDstS04ulTpMOghdwhJptsA1a8Mcm0YC/6qQ4KPq
	QccMINE1YfGdzK8af5AzOyaQ6j1eCxSARq3HXivp7RIYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1663157351; x=1663243751; bh=eQyTaxRN8/2lm84fR3EbUhmPb+HcjCM98pm
	QqodB7RE=; b=qcYumnxSVpDWvJQZ8WCMqqPH50l3kB2AHDEdV02jCchBVBJd3pA
	7W0tOvM8vsLv5l2mUGDcGAwrlFdLG6hGS7iGUQ4aB2f+gJDczcV3BUVRLRX6Ac0+
	dso+UkeNZ1tvy36w/Ttajqmd6WL6c7D8ot/w6NfaFXUlwN481f1VimeerN5r/8Wc
	Iiy0MzMDXwsHUTOKx3Zo5kN0UF9Rik0J8WISvYoiLwwIBZF1UBE7y3VMGVG5grGx
	5faUk26leX466ua4USacpfU12htcWZVuAR+Sb/gWZZoavEcSRFjN+5nSn0gxRRgr
	9CL70pZAfPb1sDPi14awlLpEH7JC7kfLVuw==
X-ME-Sender: <xms:Z8QhY0OsewP9pOBQZ5OW4vOAbDcqwIKl3irtDa6UsnpFph1tNrLmNA>
    <xme:Z8QhY6-mJsgYVSPlFpdaKMZrn3sbJteAuEnIpySI7UZ4r290bwyuYP0Jkr1ieC-MK
    MVByE5HxGDWytbfYh8>
X-ME-Received: 
 <xmr:Z8QhY7SK6lTq5j2_qz33M0GFVT0aWSFATQAAgdg9FAoMj-B3ZeipSgXX2C3qANs-eqI07fpiZW6B01IxXCvPgiDTJLR_EJup9OIA4qjGXrANYPEIitMoyLOs>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfeduiedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:Z8QhY8syThulvVkOB1YOZO1t77iIf-ppsEXkTumf0yyHC3zT3omJHA>
    <xmx:Z8QhY8fGVfs9NHKcFQVPSt2qi3C4doQcHz_qYVZKnUPx3HwCWQrf_w>
    <xmx:Z8QhYw0Jd2ZS8JYM-0UOqJtQeVEwA3ngM3itjd6UbMrpFXYuOX6m9A>
    <xmx:Z8QhY4GsTp4ZFVO0CqFFxaRoQbthfhCFTFAXZVtfW_TeqEhna0Z__A>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Sep 2022 08:09:10 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH] rootfs.py: Drop FAKEROOT support in exec function
Date: Wed, 14 Sep 2022 14:08:35 +0200
Message-Id: <20220914120834.3658776-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 12:09:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170657

From: Andrei Gherzan <andrei.gherzan@huawei.com>

The _exec_shell_cmd function is used by a couple of other functions that
are ultimatelly called from the create_rootfs function. The latter is
used in image bbclass' do_rootfs which is running using the fakeroot
support in bitbake. This makes the fakeroot support in _exec_shell_cmd
redundant and never actually used.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/lib/oe/rootfs.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 8587c5db82..890ba5f039 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -173,14 +173,8 @@ class Rootfs(object, metaclass=ABCMeta):
         bb.utils.rename(self.image_rootfs + '-orig', self.image_rootfs)
 
     def _exec_shell_cmd(self, cmd):
-        fakerootcmd = self.d.getVar('FAKEROOT')
-        if fakerootcmd is not None:
-            exec_cmd = [fakerootcmd, cmd]
-        else:
-            exec_cmd = cmd
-
         try:
-            subprocess.check_output(exec_cmd, stderr=subprocess.STDOUT)
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             return("Command '%s' returned %d:\n%s" % (e.cmd, e.returncode, e.output))
 
-- 
2.25.1


