Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD41FCFC5E9
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 16:50:51 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.web11.49035.1728579050671917871
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 09:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=ZAg4bpIU;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=dB7IY1Vt;
 spf=pass (domain: zhukoff.net, ip: 103.168.172.146, mailfrom: pavel@zhukoff.net)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id BB2D713804FD;
	Thu, 10 Oct 2024 12:50:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 10 Oct 2024 12:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1728579049; x=1728665449; bh=ErpyjpVz89M8S/GtUOUNP
	62Ac+gHGaYfEt3BGHrQat8=; b=ZAg4bpIU+8pFUMcJ0axHA6JZpL0USX23QfuFt
	sMDcdJEH2Wz89mtTc9vc2oMs9x0jnyMIWHHNz+pWgXGdhuRsncGfvKN01/RWo7NT
	e7T7NNaiG1DIuRgldMDpIw5KXx0qx3SjgMHALK65O9vQXNVIgFGthn4Akt5CDrmy
	g5yu4xaqSHlZry4NEd/PiXLWPabbHcY7T50cf27+of29V1+vXXfIF93L1uAW6cHE
	MZ10mdum7FmNLS/xA1majTkK0IllkrTFnRuWQZKXNUmMDt2taLtFdG9UdoDIHkwZ
	IdsmA9aBv1OTbwHlMc1EQuUrUpgHV16UP2NQfzPIByARMxdxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728579049; x=1728665449; bh=ErpyjpVz89M8S/GtUOUNP62Ac+gH
	GaYfEt3BGHrQat8=; b=dB7IY1VtboFSRPIliQ03tLICtHbEVzVuBIlq1ACTeZBA
	vqyQBcyRM3v8IZeG1xRx1m68rDXuTiHCggcmq2HN5mCx0jZ8zHM1LKmTUeZooWqw
	IbzM94xFh+ab+Q70bZlIupBdtn1OX7NYmVZ549hwnMvcTC0sibWCzM54nsTypo9H
	LIUfsj8PXwW6j2HI9Io7XhDllKP46M0WRrzqWaDkGylQT9RnT6glXQgeVl1kvuQH
	63wPB/9rlL9vk2e6IlBCvJb1T6Pn+D3UniMeZQbHdmNLZRiueEKGfa8d7f6pfk85
	8jh+lTrNf2qUoFKu7Qq4zeVo9DQueCcATnAeFkYOJQ==
X-ME-Sender: <xms:6QUIZwESx8jXGGPEvqrKR8naA5CEQGdFHkOrWhKtI1y5E0mnzzIPZw>
    <xme:6QUIZ5Ws0RXIcKYWkeilPv1z3WMiWpGyaeWZg3DMWEj9jjS0ruVqc_Y9WNiyDSVVz
    BKf2gvv4QXWxS2azGQ>
X-ME-Received: <xmr:6QUIZ6KxEPJxtMpwHcnoo7ibbZT_koGCUqE1UOPn1vY5Km2qlFFUNzJFQKxC2ys3K45DOZ3dPL2EfY0rnsljNiaz5q0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefhedguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceo
    phgrvhgvlhesiihhuhhkohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepkeeiheevvd
    ejhfevieelteefkeetvdekteeludetheduvefhuefflefgfeeigeevnecuffhomhgrihhn
    pehsthgpuhhiugdrphifpdhsthgpghhiugdrghhrnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvthdp
    nhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvg
    hnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdho
    rhhgpdhrtghpthhtohepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:6QUIZyGa7pKy5L9VUG9CGqizQ5oCE41GTYSvpohvzTW9YtmsjiYIfg>
    <xmx:6QUIZ2UKwd4fNoRQpl6VygcURZWOPmMZ7lmYynUvBETN8nOlgBcBCA>
    <xmx:6QUIZ1PHivNN5u_E5Hw9OBf2ZEjbotJcvqUiwfHhO4A3aIR9h-zRuw>
    <xmx:6QUIZ90BTY4UIlVHLg8urOMi0SKxETQorEjMhaHQLy3zOR4vMZ2Drg>
    <xmx:6QUIZzgfu5TXWAXzlCRpCRZdYSGtwaR6gHsilgnk34UaSacrU0OYSLhO>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Oct 2024 12:50:48 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v2] package_rpm: Check if file exists before open()
Date: Thu, 10 Oct 2024 18:50:41 +0200
Message-ID: <20241010165041.22801-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 16:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205421

Exception handler tries to read() /etc/passwd file in sysroot
and if file doesn't exist for any reason then it raises FileNotFoundError
exception which mask the original source of the problem and makes
debugging of the issue more difficult.

Fixes:
Exception: FileNotFoundError: [Errno 2] No such file or directory:
'/codebuild/output/src1899304708/src/build/tmp-container/work/core2-64-oe-linux/emqx-bin/4.3.12/recipe-sysroot/etc/passwd'

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/classes-global/package_rpm.bbclass | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 2e3e4e8c79..cd54d9063f 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -205,14 +205,22 @@ python write_specfile () {
                 try:
                     owner = pwd.getpwuid(stat_f.st_uid).pw_name
                 except Exception as e:
-                    bb.error("Content of /etc/passwd in sysroot:\n{}".format(
-                        open(d.getVar("RECIPE_SYSROOT") +"/etc/passwd").read()))
+                    filename = d.getVar('RECIPE_SYSROOT') + '/etc/passwd'
+                    if os.path.exists(filename):
+                        bb.error("Content of /etc/passwd in sysroot:\n{}".format(
+                            open(filename).read()))
+                    else:
+                        bb.error("File {} doesn't exist in sysroot!").format(filename)
                     raise e
                 try:
                     group = grp.getgrgid(stat_f.st_gid).gr_name
                 except Exception as e:
-                    bb.error("Content of /etc/group in sysroot:\n{}".format(
-                        open(d.getVar("RECIPE_SYSROOT") +"/etc/group").read()))
+                    filename = d.getVar("RECIPE_SYSROOT") +"/etc/group"
+                    if os.path.exists(filename):
+                        bb.error("Content of /etc/group in sysroot:\n{}".format(
+                            open(filename).read()))
+                    else:
+                        bb.error("File {} doesn't exists in sysroot!".format(filename))
                     raise e
                 return "%attr({:o},{},{}) ".format(mode, owner, group)
 
-- 
2.44.2


