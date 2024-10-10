Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1B7CFC5E9
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 17:45:52 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.web11.50653.1728582350325708932
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 10:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=HGLptRxE;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=X1mVv3JN;
 spf=pass (domain: zhukoff.net, ip: 103.168.172.146, mailfrom: pavel@zhukoff.net)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 81C7A13802DD;
	Thu, 10 Oct 2024 13:45:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 10 Oct 2024 13:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1728582349; x=1728668749; bh=/T2XcAm52hopw0KqZCWBI
	Fr3qsAXBLmIxzQvOTbmnls=; b=HGLptRxEUh2mCSgvYowi99hc85DTahNjRKIhJ
	KOZ0Deao+DHnCA2fmX+UGUHutYJpRQOxGpE6WWjXd3y9fQsxC0BlCL3T9927Gq/r
	QOPIWDbjNdTONHE/Khkl0vIsRAoAI61MgzwRwPj9t/d6nRbH/sBbVu3ffMCe59j3
	n14FI+CGI2O+m2I6OprUjLlboliboXevFktkszRHZag8DgF8GeXSaHqGKsluovuL
	grMK0/w/VwShjuiYrPdVjbGOan99ma5sX6prdq3w+27ZoNcsrSMcp0j70TDeO4Vu
	CtQyoXLqQBTf7oV+4FQY0fevdheKLe3jzAzuPy3z7fLYN6ONA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728582349; x=1728668749; bh=/T2XcAm52hopw0KqZCWBIFr3qsAX
	BLmIxzQvOTbmnls=; b=X1mVv3JNMq4Epedpq1iIgFjWKx1Fkd3JV6QtoK6uFLfp
	xnlAPnmzWYSji6ucT1+SzA4GTSuQPFTvkOvdPEuDmHWw7j+9BoUjeHNoGeTxk+PD
	3AQ1jtqQRUZCnVBNMl3JMxdTZLbnOXMsirLCs1WMhgxXQSj2P55Qnd6TUmNzLTcn
	2geO6XeYWFZvUux3OPC2hJdCphV6kOXz+TU22pevikrkiJ4q2ftMPi0iBXmy3d/B
	Xo9CHS5HA0dWOmjwkpegNE3nBhNXWji0D5LCoL6UZDYVkdKlngXpszSiQH4u9M7J
	f9jhqoDBfOA8x4F3/x+XBN9MOHC1wYF2METMt3eTfw==
X-ME-Sender: <xms:zRIIZ5flnPNyyLzRi-rpzT04IWGhlTifUNnMe8ecqfTPoBwJ8XNAtA>
    <xme:zRIIZ3OHPZHqICXRO_Z1S9QS_XOJ5Q7AipHwf9TJM3gBg9xURCYmgRp8Zo6WEbReb
    Q8bBMgFAD4EJrNHE74>
X-ME-Received: <xmr:zRIIZyhWSK6-VOkesxPg8g30HKPqy9oBYhcmQNi6NaXrKgj7R2DGEBUVimNw_zELNYgGTRI4ZH5ZHIJDWmDoFyWAcbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefhedguddvtdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:zRIIZy8L-JMpE6-kV9pqRsQ0EXnzg7jyKdbsgiHu_ay6prScXWnnZA>
    <xmx:zRIIZ1vBQCjag1IuJHWGl-cmdkbXPPYy3i7eu7yPmvtvXOnac9AA0g>
    <xmx:zRIIZxGyFPxoVuUPpeJxIwdNCkHSdSNG5isxFp6Pzmlrchrk05gMqQ>
    <xmx:zRIIZ8OoFEUz55m0kOhJpY_cq_dDN09hpjWMY1EPEpmsMyOOTinyKQ>
    <xmx:zRIIZ-5-YpxTAfdfMsO9VcEth9qxeDujbTB_DCcWYUaw5rWYVxCEtea3>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Oct 2024 13:45:48 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v3] package_rpm: Check if file exists before open()
Date: Thu, 10 Oct 2024 19:45:45 +0200
Message-ID: <20241010174545.25390-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 17:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205422

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
index 2e3e4e8c79..bd972a0621 100644
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
+                        bb.error("File {} doesn't exist in sysroot!".format(filename))
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


