Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id EE5126086F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 22:06:13 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id s9-v6so7229wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 15:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=1AjpWp0t6s4lgHaWU+NETqGdnPw0F7GzvR/cgOH3h9w=;
	b=FyFA4FQu/YvdwKlYzKxpjA22C/DgXUQixyR51onyedsGNzOeJpnZHJqCunkIQaPHZT
	WhJUOch7JXktjtpuyoOEEXn78yYjsIHiRtv3taw8MW+/vd+BLhTWdAYnRDwIXBEmiOp7
	qStv2NN9SgLk3WghUICnkDXroZJz2N3VJhlf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1AjpWp0t6s4lgHaWU+NETqGdnPw0F7GzvR/cgOH3h9w=;
	b=SfJpdT+W0MgH1+CuZCu7hCtAB7MTqiiSNkXCPSGwX2ki7uh7clhZRDndwvRviAIH3o
	2NUKRctMtZOAmttMAUSZY7oTh9BdZfcZ52b6Iea/FTtu4ZUOJY3Gt7fDBINv+pAT54Xc
	vYUeu4XDiBGPZoje1IQnymb1HihALU1AVLnVPkzvNn8x7y6BNh+ouyze/OtNgwQX3zVA
	Sq6UPfp0aYbg4gj/yIIIffCyWNl6wdsruFgFCBuXHIdoabPrOz0oIj0NxzLW9r1edjqN
	q4RAtUR1Rv0dTD6yyUWaFlaqE4AEg7q3BI0bOL/QmSW0OCL5jt1xhyJCMmUtHJcW382/
	UESQ==
X-Gm-Message-State: AOUpUlGDrJw9d2dPq20BNqfDIsmTVJr8Bp7e+xJLWAxGQ23EDojt1NAh
	LSirC9NiVBk5V0xrSBOPZdVVVs3tBvuKXg==
X-Google-Smtp-Source: AAOMgpeCCL/6qhDdko1iimzSwCUfeptEcJZ0DTIeHBGs33lBTxNZtbwuWMkigXMfZQpLyx8/zBeZvg==
X-Received: by 2002:a1c:9e4d:: with SMTP id
	h74-v6mr6013976wme.70.1532556374214; 
	Wed, 25 Jul 2018 15:06:14 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s9-v6sm3610680wmc.34.2018.07.25.15.06.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jul 2018 15:06:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2018 23:06:12 +0100
Message-Id: <20180725220612.17061-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] uninative-tarball: Add nativesdk-libnss-nis to resolve glibc symbol issues
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
X-List-Received-Date: Wed, 25 Jul 2018 22:06:14 -0000

We need this to avoid symbol mismatch issues for binaries that use this
on newer systems which then won't run on older ones where it isn't present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index dcd59f87ccc..38080c63b58 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,6 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.27"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.1/"
-UNINATIVE_CHECKSUM[i686] ?= "a90db17d8845ece764aaac19348cd78504c0e554cb998da39ebad03aeef76185"
-UNINATIVE_CHECKSUM[x86_64] ?= "d43555df8d5a056ef5b20c7d8e0287207974e09df1e969a3e19302c8b4ea6b4b"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.2/"
+UNINATIVE_CHECKSUM[i686] ?= "036b60092fe4acfa1a321d110673030db20344a2d56f33a4d047f0279498bdad"
+UNINATIVE_CHECKSUM[x86_64] ?= "e3b77208169bf1ac4e89496f3cdbf27695f5b18a2694a908a793390f28b67f83"
+
-- 
2.17.1


