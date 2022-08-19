Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E682C25B0E
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 09:20:59 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.1037.1660900855197382414
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 02:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=kyDVQw3i;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.21,
 mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 8A094320015C;
	Fri, 19 Aug 2022 05:20:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 19 Aug 2022 05:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1660900853; x=1660987253; bh=kHf/5+bSUayyDrRyxeZj9W4tR
	PYJZhtgv2xhNiMi+P8=; b=kyDVQw3iFbOkIO1+oPCtMiGKqMLaU9uEm4jIPL2uF
	PwipoUi3VzKxpR2TtnUhaYIaglIArIJRW62qODJ2BB97t4qmPTe4jWF/PCacEp9c
	uaj3vPjVg/Ec7ir3Jeto7b7fwulvyuHGu3rQXwpgHrD0pwaSZgaSKef7K0I8qruB
	Cv6TTQe6qb3geaW+fE1YeIzn0f0dHYYNQhU68w2s290qv6e85ajSk7MSYqXiuxlB
	wLNrcVJI15HbSSxb7PXpBKraUN4lL6owcDM7ZVsar8gI+0rGdYXwC7H323wvK5fj
	qT3rjE993n+2N0DQorIKJoisTxAKMD9RSZsaZZz+Nc4mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660900853; x=1660987253; bh=kHf/5+bSUayyDrRyxeZj9W4tRPYJZhtgv2x
	hNiMi+P8=; b=wMMmfioUZcQhB7ZONIpCxIAN4eriTusaYKanSVI0uNMb8ggw9OF
	nwCnuFM++G0UQOaHhTcxDs+MrajHQftUIAxhxdSm5KihbN8ODmaSRkFQ8NQ/fW7w
	u1Pccmzvepf+OpjOuHbC1h71AEcumBrkIfZ7UBqmN6PDGs0xX7EP3W2YxbkrWAAN
	fC7G3LEutfVWdoD/Y0rghEdPbIQdyuCbV/EducFz+VdiBrUCbdiaA9/fEmH9jnZt
	o5IlqIFpu2tP4Pc7qUBldlknhBLKiyJb4bNx1wN8f6h39ZWXslxz4qyUa6RQd+tM
	a6EBBZNJyExj0vTyHFQIlCc/rVod5yODTJA==
X-ME-Sender: <xms:9FX_YkoC8L3kr_1zbHU5nro8B-xycZMLkUMwModKraLLooTPDGk0QA>
    <xme:9FX_YqqRbRGMuBAjkP0jgYUYW6QIkKD4SANQaMnQ_U28HcqJji4H9WhJegfXlDTOO
    yRLApOXi-Pna7nhCis>
X-ME-Received: 
 <xmr:9FX_YpMZnohqEudQDzQzROoMG1LhF7LJNAQsldAFGzu2kCcThTTxHzs3hcWtfLkXsN3d1VgC6lCQDO6DJ8KbES0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiuddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpedtveetkeejudduhefhtdfhtefhvdffhe
    elffdtffeileefudelieeuffdvffdtieenucffohhmrghinhepghhithhhuhgsrdgtohhm
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrvh
    gvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:9FX_Yr5hsojDHXo36N-vSt7F32dsfUBWS4838_3tfQQ8HxpfBgvxtw>
    <xmx:9FX_Yj4WMJNFRg2Ym8gNdtgoOcNss0b044ZbmeNQSgxzbi6SWBVWqQ>
    <xmx:9FX_YrjIg6Um8kvtYzVhPHpevagzWhbKTYADc7_AmwCMO7OveVdQiQ>
    <xmx:9VX_Ygi2z_W3vpPJ5n4bHl4MawH2z_JgZdvXOQfoCkvmY9kQqOEmKA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Aug 2022 05:20:52 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net
Subject: [PATCH 1/2] package_rpm: Do not replace square brackets in %files
Date: Fri, 19 Aug 2022 11:20:02 +0200
Message-Id: <20220819092002.31294-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 09:20:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169616

This reverts commit f95adb749619e70920c6cc6cd01c6d02cd348fd8.
At some point RPM stopped treating "[]?" characters in quoted text as a glob
This causes rpmbuild error [1] in oe-core if package contains filenames
with such characters [Yocto #13746]. Reverting commit which replaces "[]" with "?"
fixes the issue.
It should be safe now becuase rpm tries to use filename directly if not
found by glob [2].

[1]
| error: File not found: /mnt/builds/yocto/build/build/tmp/work/core2-64-poky-linux/testrpm/0.0.1-r0/package/42 All-Time Classics (E) ?v1.1?.cht
|     File not found: /mnt/builds/yocto/build/build/tmp/work/core2-64-poky-linux/testrpm/0.0.1-r0/package/42 All-Time Classics (E) ?v1.1?.cht
|

[2] https://github.com/rpm-software-management/rpm/commit/c16c70cbd6b31cd93541d5c22d23ba98d212ad3d
---
 meta/classes-global/package_rpm.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 63c1b077a30..81a2060b68d 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -199,8 +199,6 @@ python write_specfile () {
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
                 continue
             path = path.replace("%", "%%%%%%%%")
-            path = path.replace("[", "?")
-            path = path.replace("]", "?")
 
             # Treat all symlinks to directories as normal files.
             # os.walk() lists them as directories.
@@ -220,8 +218,6 @@ python write_specfile () {
                     if dir == "CONTROL" or dir == "DEBIAN":
                         continue
                     dir = dir.replace("%", "%%%%%%%%")
-                    dir = dir.replace("[", "?")
-                    dir = dir.replace("]", "?")
                     # All packages own the directories their files are in...
                     target.append('%dir "' + path + '/' + dir + '"')
             else:
@@ -236,8 +232,6 @@ python write_specfile () {
                 if file == "CONTROL" or file == "DEBIAN":
                     continue
                 file = file.replace("%", "%%%%%%%%")
-                file = file.replace("[", "?")
-                file = file.replace("]", "?")
                 if conffiles.count(path + '/' + file):
                     target.append('%config "' + path + '/' + file + '"')
                 else:
-- 
2.35.1


