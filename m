Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3305DC79F8B
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 13:05:41 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63358.1767618335785092455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 05:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=xJBvqdnP;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ye/+rXBl;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id BF534EC0178;
	Mon,  5 Jan 2026 08:05:34 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 05 Jan 2026 08:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1767618334; x=1767704734; bh=al
	1MXp74WiROTJqPXjx/G91gYESm2Q2VABkEYeFlzyY=; b=xJBvqdnPimwIEKGLZ4
	ZFnNd0C2lAfQOeKx3zVfHqeUDEofeRTxo/gmFqZJEh17PnEjbOcSae3VypMKjhWy
	4dcJJyB43G1Q26smd4F+PlZ6P4KQfDglcRGd6SRr3ugTyp32vJzis2hLhR2Z5mAL
	NetuuW88UmUOjFrHZitNjM7ntk3KkaMmU7vh19OTJs2NvcLnMQLCnw+WZsaYn/DW
	eq/FQFUxHq/xLWjjqaabhzY7YkFI5I59Cvs4tdD1nkPS7G9RzWhRq9Bk94ZL4c52
	IpneO5PztyPx5jjCSgVlqARS77ag32HDL4r7qlFo7OUGMNXCvjflGG9BrFpF4k3U
	2OoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767618334; x=1767704734; bh=al1MXp74WiROTJqPXjx/G91gYESm
	2Q2VABkEYeFlzyY=; b=ye/+rXBl5Qzr3vPhkj/jm2anxO9hT0GLqJA5m43DHfoh
	KiiP/0oz1klWE9J2T6VTwsmETt6d0uw9zam0Z0H+FuDJyFT4s5mPuoAagiKack1u
	198ow2eOusUDD4SaWeWR8uYAJqkDgQ/EeUNI2yvBx1aQXtsvUoXNZ7AmidWDkubF
	oJwY3T1Jf/xqplt0214pm6jbx8PZugiBut7VJ5+hKPgw9voM+nTPCS5T6KUn125F
	H1Rb21wLTb4onf6eYX0HVXlS6Jbk2GkrP1mViw6Nl7YuziK7TRVHD+Jp6uGbWzf4
	zmryYHKQwCtVMI4Bv2MET2aYvT+UaXqzPus9Nu733g==
X-ME-Sender: <xms:HrdbaW1B4Xr7WyIg7OpZnvoU0k2VYwDDs4xlF8xbw0jUI6aZt8flCA>
    <xme:HrdbafFowGHMc11HhwqQ6m3wGm6jUHV24XsYxL-I9mZd7qh8croc5aGlpWk6zxzZW
    1DckWwTcx06y9Irmol4PxRipXjP6wWxBbt5Qf4gCvVIC-jMiTlEyg>
X-ME-Received: <xmr:Hrdbacgqqm0bdDTTQqkJUXHmYCBJ5t8x9YgAR35eUTfvedERfmoU1COWN3W_20zQe11rg8dB9SuzZLnf80Ivm6rH_491Dbs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeljeefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephfffufggtgfgkffvvefosehtjeertdertd
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpeefveevhfdutedvtdfhudeiteffhfehlefhvddtte
    egudekkefftdehueevkefgieenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsg
    grrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnh
    gvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggv
    vh
X-ME-Proxy: <xmx:HrdbaS8wHpw0xXdaBYR0J3Zyb-xLiAwigrB_ztqLc91-370bi6IuNA>
    <xmx:Hrdbabo7P6-gTUx_FX9JDwxt_PL9kcz7DDR7hC775hAaGc0su0ruKw>
    <xmx:HrdbaZ91pWb4QLVowSGtoDzm6zZS7gAYxNC8870wJX4KI3_shAVhVw>
    <xmx:HrdbaXWhSIjPvdZri175TZViIU-C_QF9uW9hn1JKqb8r6amZftzGvQ>
    <xmx:HrdbaQbpz2-hSrBS8fKXetWBMfR1Z45e11_yt1dqMFZ38NoGmI9S-iaH>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jan 2026 08:05:33 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Mon, 05 Jan 2026 13:05:31 +0000
Subject: [PATCH] util-linux: Disable flaky script/options-size test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-util-linux-ptest-v1-1-d9d99a147a2b@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIABq3W2kC/x3MQQqAIBBA0avErBuwqNCuEi2yxhoQC7UQwrsnL
 d/i/xcCeaYAY/WCp4cDn66gqStYj8XthLwVQyvaQTSixzuyRcvuTnhFChGlUZs0nSKtCUp2eTK
 c/uU05/wBT+QV42IAAAA=
X-Change-ID: 20260105-util-linux-ptest-8f9d8f49ebbe
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3946; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=gFK21bCcbaf6aKCsKtGVxrs0K+CHKXFunnD762GiPwE=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWRGb5dd1/DZ50akpO3PNas/pK9YnPTiwa/KnSxrG7d1L
 dNs3Hb5eEcpC4MYF4OsmCLL5p6v95/2OvJmhNxSgJnDygQyhIGLUwAmMmE5w//sICl/9df2M/x9
 bRW37NA8uTFx24vgXRcSWQyfB8yI73Bi+F8SFW/9+eE9DfPmr72is5yqpkVdK1mQVLXkjeX5B3E
 ZkjwA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 13:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228867

The test case for the --output-limit / -o option to `script` is flaky
due to the way the output limit is handled. Depending on how buffer
boundaries line up, the command may output different numbers of
characters, but the test case expects the output to always be identical.

This has been raised upstream [1], as there are multiple options for
fixing this - we can change the behaviour of script, or we can relax the
test case. Changing the behaviour of script may impact users so we don't
want to rush ahead and do that.

For now, we're going to disable the test case.

[1]: https://msgid.link/978c83bdf7596879458f39f1789da016150a72d4.camel@pbarker.dev

Fixes [YOCTO #15188]

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-core/util-linux/util-linux.inc        |  1 +
 ...001-tests-script-Disable-size-option-test.patch | 43 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 7280d4878787..deb9bfd0644f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -19,6 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch \
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
+           file://0001-tests-script-Disable-size-option-test.patch \
            "
 
 SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disable-size-option-test.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disable-size-option-test.patch
new file mode 100644
index 000000000000..4181f5b5ae63
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disable-size-option-test.patch
@@ -0,0 +1,43 @@
+From 1d38887185c0424a82bcf05efbd8585df1bba8cf Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@pbarker.dev>
+Date: Mon, 5 Jan 2026 09:56:41 +0000
+Subject: [PATCH] tests: script: Disable size option test
+
+The test case for the --output-limit / -o option to `script` is flaky
+due to the way the output limit is handled. Depending on how buffer
+boundaries line up, the command may output different numbers of
+characters, but the test case expects the output to always be identical.
+
+This has been raised upstream [1], as there are multiple options for
+fixing this - we can change the behaviour of script, or we can relax the
+test case. Changing the behaviour of script may impact users so we don't
+want to rush ahead and do that.
+
+For now, we're going to disable the test case.
+
+[1]: https://msgid.link/978c83bdf7596879458f39f1789da016150a72d4.camel@pbarker.dev
+
+Upstream-Status: Inappropriate [see above]
+Signed-off-by: Paul Barker <paul@pbarker.dev>
+---
+ tests/ts/script/options | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/tests/ts/script/options b/tests/ts/script/options
+index 3cbd5c8ab463..4da51cd83c66 100755
+--- a/tests/ts/script/options
++++ b/tests/ts/script/options
+@@ -57,10 +57,4 @@ $TS_HELPER_SCRIPT --return --append -c "exit 127" $TS_OUTPUT </dev/null >/dev/nu
+ echo $? >> $TS_OUTPUT
+ ts_finalize_subtest
+ 
+-ts_init_subtest "size"
+-$TS_HELPER_SCRIPT --output-limit 9 --command "echo 1:1234567890" $TS_OUTPUT </dev/null >/dev/null 2>&1
+-$TS_HELPER_SCRIPT -a -o 9 --command "echo 2:1234567890" $TS_OUTPUT </dev/null >/dev/null 2>&1
+-echo $? >> $TS_OUTPUT
+-ts_finalize_subtest
+-
+ ts_finalize
+-- 
+2.43.0
+

---
base-commit: f55407185c63c895fa3c4fdf74e6e63ea9517a20
change-id: 20260105-util-linux-ptest-8f9d8f49ebbe

Best regards,
-- 
Paul Barker


