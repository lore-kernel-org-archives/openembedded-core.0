Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAB9C10DC1
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 12:56:03 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web11.34477.1702040156549907078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 04:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm1 header.b=o8NHnnRf;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=pVGflIim;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.21, mailfrom: pavel@zhukoff.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id AC73C3200A3C;
	Fri,  8 Dec 2023 07:55:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 08 Dec 2023 07:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1702040153; x=1702126553; bh=zIHing1lwx
	Li2MY+DHlNI90O4SV7If7GFv3XKznqNVY=; b=o8NHnnRfOb2ft1zmsWnn0tyCJq
	XJDCvtEYCjsGxe03TBBK33izNkbc1wrii88FOwntrstzpah+d0UAk3c16OG6AS38
	D4RrZiKe52K+ul4uQg2lsV5AiI2CETG/aS7D13etrJgJj3NA9HLegsOHaP4rtMHT
	tzLraPGwWqrufk3/r+ot+T+i+aT77XsDjLXNOVX32tCMhyWD91Z3dAepbaPd7Kt3
	DxzFqI62DmiYVuBGLj0CXZ0njYCUN81a4q0mbhxPv6H/do5fK2Sq4YNH5iXo0nOs
	b60BgciMgWerpq/8k5oPJiHuKZWVOduXMt22R7nT27iEk+TRVXN5EqVfjvVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1702040153; x=1702126553; bh=zIHing1lwxLi2
	MY+DHlNI90O4SV7If7GFv3XKznqNVY=; b=pVGflIimuee39uJ2LFIZO3siKqak8
	/PlIDCPhh62lDvi/OmSMBMf8wO26E7ZJuV6Ee2w2jQcZ8Pbt0166eipW2RNcOkVv
	Xt73t1X4CgYKv/0i6zZ1MRSz5tPcuPNcVdQ4T1VV+onZg0ICCyZLCmu0d67gmoLc
	VooF9HEWJwMVmtLx+8HIgHBq1xDZ5RyGp4vnvFA9oaky24JqZKB0RMlLnHA5+XOt
	w52JYoq/qw5Dyq1eX5RlkjTS+XVX46Nyi1FCRJJg4wjW5WSJJCoJvJ8+s89dRU6M
	y3/VpwUdGagZ3wcYrlGcyYaZHFfGG1ABhTS/pEsTFRLNnexNQyJF0tewg==
X-ME-Sender: <xms:WBJzZdxFq2t6d7S-i33rBT4QAV6K20Rlc5Y-YnK6JS93ROj_vjNFrQ>
    <xme:WBJzZdSCdi_LudFyEnrgznhLy37JqpOZhDOcnAWVeemjj_YGi4meDekecqbspA9Cb
    7fSSi6sKNC8AGqvQj0>
X-ME-Received: <xmr:WBJzZXWE0Bn8FhaGSwQ_l5Jmg47xadhx0Mcry3YBLkLs_TUfb0m3A5nZ9iANfJIwVK5HV2RNDwGo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekiedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:WRJzZfjviCt5CNuJjf4yTVojaWZXfD-VVa4fFBRfimKRbOXunulqcA>
    <xmx:WRJzZfDAyhW-DjqHQXrMTNGFsRtCG71HHHviTVDtnsbkJ0bZDwZJ6Q>
    <xmx:WRJzZYJi0u7ac4F5liDyZG2ZahE5ZX6v6IUeYQ3uLrVKxcKRs1a3tg>
    <xmx:WRJzZSrbW84qnNUcf1ylqu87I_L_CziD0xxJMyWXlPiKN3p3ym9iBw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Dec 2023 07:55:52 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v2] bbtests.py: Add test for unexpanded variables in the dirname
Date: Fri,  8 Dec 2023 13:55:31 +0100
Message-ID: <20231208125531.772229-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 12:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192055

Regression test for [Yocto #15255]

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index d242352ea2..03faf1a881 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -362,3 +362,12 @@ INHERIT:remove = \"report-error\"
 
         result = bitbake('gitunpackoffline-fail -c fetch', ignore_status=True)
         self.assertTrue(re.search("Recipe uses a floating tag/branch .* for repo .* without a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev()", result.output), msg = "Recipe without PV set to SRCPV should have failed: %s" % result.output)
+
+    def test_unexpanded_variable_in_path(self):
+        """
+            Test if typo SRC_URI => SRC_URL causes bitbake to explode
+        """
+        recipe_name = "gitunpackoffline"
+        self.write_config('PV:pn-gitunpackoffline:append = "+${UNDEFVAL}"')
+        result = bitbake('{}'.format(recipe_name), ignore_status=True)
+        self.assertTrue(re.search("ERROR: Directory name /.* contains unexpanded bitbake variable. This may cause build failures and WORKDIR polution", result.output), msg = "mkdirhier with unexpanded variable should have failed: %s" % result.output)
-- 
2.41.0


