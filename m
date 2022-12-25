Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3892BC4332F
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 12:47:13 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web10.116835.1671972431836467445
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 04:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm2 header.b=Bj97nT5T;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.27, mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 1635A5C00C7;
	Sun, 25 Dec 2022 07:47:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 25 Dec 2022 07:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1671972431; x=1672058831; bh=4drC86p/MAqp+poIcksG1kekY
	JY98wnvd1mNNS8Irug=; b=Bj97nT5TkoZaVyW3wBhiaHd7GAa4L7F68fticeRQk
	y5pcGys9rqv+BIHxRmgD8/HJH22VE82kwLhiisd9nngJ0Ytvq2O8mptrHhU6gscw
	sPCdL79xJ+cuPXdVoQRE/68jZ3D7MGKmaqBRmz44+6MnCMS5ysLIukZCgUpQHdwM
	v0jasOZARfjqmUV6CXsbyOlVh6b8Mz8N1zyrAYxUgk63cZZW35+a0wYLW75wZKFp
	cYxPVlHw/1BXLs8Mc0NSli0auyFRNvhMgwWp+03rojQ7ExOMwB0ZCstmhGQpi+BU
	gzrBl+ET+n54+WX2oGMf5AePR7L5d0W05fXnNP2Ld1vJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1671972431; x=1672058831; bh=4drC86p/MAqp+poIcksG1kekYJY98wnvd1m
	NNS8Irug=; b=JW8seKu6BkQ9h3m8SKmHebuxMmAX05lvu9LS56Jn8HfUlIDoKCe
	jzLeKw89l+26IBd7hBqatUBM1d5no1KSEzuXyWB6cteokWSGR6wDVmrt0VGXx7Uz
	fV4sDbYHSdtju56IP0uzDdPahXYDvVHYrq1Vxd6dUjYpae9bHtWnmWnQZF3cWPYJ
	vZCrFGGQdZoMA+MKp4hZbU68Vr6N0IM948dL6b9xNGYwd8emFYKhd/xrnlMe7OT4
	Yr5BiTsSJsy9GooRUBAGKU2gvrr+RN+tHwJrwijRMciQfkIX1JelZvCaP9TggbUx
	RRzUOSdz/IrYSViXbCf2ToDgq8cvolRZ3jQ==
X-ME-Sender: <xms:TkaoY8pmyC-2jUXU8zatKDdK9RhFaNgwHy9u9pVzELjnEcutEphMSA>
    <xme:TkaoYypc25p16If31I_DhMBfwJ2E2H9cKgci2XUlDUUh-aYqOwie5J6nLojTG5s4l
    MY8i9I5FQhuTifCOv8>
X-ME-Received: <xmr:TkaoYxNSTF4p5G4QppJDC8Ese1uW-VT5-EI6pcPKVo8pkJvWUJiWG33_kqmO-oS4QFpj-RhRyDUrTeNx8JaDADY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrheeigdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhkohhf
    fhdrnhgvtheqnecuggftrfgrthhtvghrnhepvdfhvdelueektdehtefhgeelffehleekge
    euledvvefgveekffejleduieevgeehnecuffhomhgrihhnpehgihhthhhusgdrtghomhdp
    rhgvughhrghtrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:TkaoYz5woyACdgJlLV5urc5ZLkPI7_0mz76vbC7Hi-0bbE7DwTuCqA>
    <xmx:TkaoY75C2jUWpE1O7r5iFsX4LiDfWfWgiCqe64JGEQ6q2ZGN2HdqPQ>
    <xmx:TkaoYzi789FIitbVK5VuKoJvr0SxIGTFi4537JqJ9WEjkEDcBMwx7Q>
    <xmx:T0aoY4h-3GCYenztI8Rlv1QvD_LTyJPqt-9MTXoF2AYP8vIKri8KNQ>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Dec 2022 07:47:10 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] oeqa/rpm.py: Increase timeout and add debug output
Date: Sun, 25 Dec 2022 13:46:58 +0100
Message-Id: <20221225124657.2824-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 12:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174992

[Yocto #14346]
Systemd may be slow in killing pam session sometimes [1][2]. It may cause rpm
test to fail because there's process (sd_pam) running and own by "test1" user
after timeout.
Increasing timeout to 2 mins and assert earlier with debug output if
there's such process(es). If increasing of timeout doesn't help we may
want to force deletion of the user as [2] suggests.

[1] https://github.com/systemd/systemd/issues/8598
[2] https://access.redhat.com/solutions/6969188

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index e3cd818b2b..fa86eb0537 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -51,21 +51,20 @@ class RpmBasicTest(OERuntimeTestCase):
             msg = 'status: %s. Cannot run rpm -qa: %s' % (status, output)
             self.assertEqual(status, 0, msg=msg)
 
-        def check_no_process_for_user(u):
-            _, output = self.target.run(self.tc.target_cmds['ps'])
-            if u + ' ' in output:
-                return False
-            else:
-                return True
+        def wait_for_no_process_for_user(u, timeout = 120):
+            timeout_at = time.time() + timeout
+            while time.time() < timeout_at:
+                _, output = self.target.run(self.tc.target_cmds['ps'])
+                if u + ' ' not in output:
+                    return
+                time.sleep(1)
+            user_pss = [ps for ps in output.split("\n") if u + ' ' in ps]
+            msg = "There're %s 's process(es) still running: %s".format(u, "\n".join(user_pss))
+            assertTrue(True, msg=msg)
 
         def unset_up_test_user(u):
             # ensure no test1 process in running
-            timeout = time.time() + 30
-            while time.time() < timeout:
-                if check_no_process_for_user(u):
-                    break
-                else:
-                    time.sleep(1)
+            wait_for_no_process_for_user(u)
             status, output = self.target.run('userdel -r %s' % u)
             msg = 'Failed to erase user: %s' % output
             self.assertTrue(status == 0, msg=msg)
-- 
2.38.1


