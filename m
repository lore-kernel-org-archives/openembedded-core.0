Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC64CA9ECF
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 19:50:18 +0000 (UTC)
Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30587.1791740591538188132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 10:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=oBL0UnYP;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=ADtrOmIb;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1791740589; x=1792345389;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=yO71KrYV4rQQiL1qUP4lzhe6u9Yci6fW27ysVTjzqHc=;
	b=oBL0UnYPRywubn7Cw/5oNyuzhG7hfmGThrzzu5QrB+0M0J6qJbGRSOb94yvXLG2fHtSYS/dwBRWfn
	 csKwB1QlEo9/j4L68nxz7y+WvaPPyqorHlfS2wcGmLHI2ujG+Fd8Y91oMlDlj2PXLyOMbfXt/c1XUR
	 zG8GLdLYPbsWzD05K/b4U2hgJ9Vosv8wv838c6GYIZnenGZhWfO30WF/0kPAjQCOCY7SGhgosIOGnN
	 ARZK7HKsgwgrUFZmhSsPJqeeSVYfceZkDsOwr+c8M78nPObT1fFj7pnfTOMTNVH9yEnPhjosuMIEme
	 gFinRo57fMRxJIxlykJR6CVZM+RXm6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1791740589; x=1792345389;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=yO71KrYV4rQQiL1qUP4lzhe6u9Yci6fW27ysVTjzqHc=;
	b=ADtrOmIbGnJ/3Um3Pfeo84xxwsDAymBb0ghKxwFLvOLqoZ4V2/wTRPc6TiJCg7NFk1SgNpu9R3GoH
	 C2adRV1CA==
X-HalOne-ID: 38acc80c-c59b-11f1-aa68-df8125a0c701
Received: from xps-13.fritz.box (dynamic-2a02-3102-8c10-1ae0-4918-3389-416e-e9a4.310.pool.telefonica.de [2a02:3102:8c10:1ae0:4918:3389:416e:e9a4])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 38acc80c-c59b-11f1-aa68-df8125a0c701;
	Sun, 11 Oct 2026 17:43:09 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
To: openembedded-core@lists.openembedded.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Subject: [PATCH 1/2] ssh-pregen-hostkeys: add ML-DSA-44/Ed25519 host key
Date: Sun, 11 Oct 2026 19:43:04 +0200
Message-ID: <20261011174305.2610435-2-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011174305.2610435-1-ayoub.zaki@embetrix.com>
References: <20261011174305.2610435-1-ayoub.zaki@embetrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 19:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247578

OpenSSH 10.6 enables the hybrid ML-DSA-44/Ed25519 signature algorithm.
Provide a matching host key for QEMU tests to avoid runtime generation.
Generated with OpenSSH 10.6p1 using:

  ssh-keygen -q -t mldsa44-ed25519 -N '' -C 'QEMU test host key' \
    -f ssh_host_mldsa44_ed25519_key

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 .../openssh/ssh_host_mldsa44_ed25519_key      | 58 +++++++++++++++++++
 .../openssh/ssh_host_mldsa44_ed25519_key.pub  |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-prege=
n-hostkeys/openssh/ssh_host_mldsa44_ed25519_key
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-prege=
n-hostkeys/openssh/ssh_host_mldsa44_ed25519_key.pub

diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostk=
eys/openssh/ssh_host_mldsa44_ed25519_key b/meta/recipes-connectivity/ssh-pr=
egen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_mldsa44_ed25519_key
new file mode 100644
index 0000000000..6b89f01bc1
--- /dev/null
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/ope=
nssh/ssh_host_mldsa44_ed25519_key
@@ -0,0 +1,58 @@
+-----BEGIN OPENSSH PRIVATE KEY-----
+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
+ECAw=3D=3D
+-----END OPENSSH PRIVATE KEY-----
diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostk=
eys/openssh/ssh_host_mldsa44_ed25519_key.pub b/meta/recipes-connectivity/ss=
h-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_mldsa44_ed25519_key.=
pub
new file mode 100644
index 0000000000..13678b5d0b
--- /dev/null
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/ope=
nssh/ssh_host_mldsa44_ed25519_key.pub
@@ -0,0 +1 @@
+ssh-mldsa44-ed25519 AAAAE3NzaC1tbGRzYTQ0LWVkMjU1MTkAAAVA19XuXzPaz+/ZkBoTa7=
mN8LXyJWmQ0Hr3vf17fIwLnlnex/bdnMjBt0mHBS+ImhUzL7Y1AOhiDtCXWPGg6Lpn1a1dDhrCo=
ld58fiZWBViJOrt7V0W7o4pFUBCoF1BcbZiu+0kaolxv2AXXolTAukAeskScnojUu2lwSKsvu1A=
U06iDvBPz+HCJufGbck1YtHHx+lPLagywiEc5KFdHIrtNGv/4+o6w4MAKI4phvi53TLkvgHiSFf=
kGReuufxQOO+t/fy+N8PXROO/vatNAdmCbbs3buk3EFEQ8mPLVFfwhjqZkn2q6rgKlyIflmxdGu=
87FtzyJT5ccJOS1YDc728MIbs/R5r2MV/CPZryR8WHeFFlw2OKoEtc3jV7WXWo5W+Yfz77y19zr=
yshTlUi+SCj7uflXyYbTvo7TVyptao13zAnYw/EFabCc7nr4cEjjNnUcuZGlDJ33F+fyKM1bLNX=
pzy4BUBTS/WtlHaZaLPP0n7kbtQoDwcxJU+ZsnNSC257XgG4qekTX5mVLOpLGSfZT6iIkNTbKa3=
GNfNS6Ym/vBtOH6qOmYi0XpVA9su23LWlEx41qcqkaG+pZ9wCYh1yWpMh/nj/ORX3TGLLcIEi/S=
EPv/GDHHuVapLyuos35JjKIuLayfVHGGnLuN1FXM2coneT/LcimX/ADjSplYMKd2alAUE2ragVY=
iWCmjwX/9dyEHlDoCwzlLyRJgg75XomDdIKVUK7/nbA5iKwtvaZPjeJUCanC6Aniz3pjCtnT7Wz=
eZS26tMnjRrdnaXcRWqqIcXOdoy8lccVRBSkmQmfXrtTRv1Z0eTWjhI+OXVM3PR2leZNvtWok2I=
LlrXisF2kc+iOtOtXxk+dOXabTLaAxZJ/umitDMarzys5ciIewzwj9KomhMa0YDvEA0tAfK+hbT=
dNt4c/xIN383WdjvBf2htHPNBsGfrt9XRgI7TaOCuOteUd83fp4SgXrEB6LZztbz9FxcxVaSl22=
vcNRLGM9ee6y5IGyCyrYRSqcOL3roK9erubFp01onEBKA8d8F9slvIur/sym6g1XKwM8bYoU7sd=
XSI06MRif6pJ1LK+RL3t6VjZxfLbq/1mWXTo2hbrnsL9VeBWOCq94XUxPzrT5poo11dDSMtTvBm=
6Uy0vgZd+nM/vn13lBu7lJA6HdXnZW4upVVMiUbQ56SLtClWahWOI2MPUyxPi208zUKFrFH11iP=
kh4DxzhfcLNoQ81DmnxlPAY8tXlj3fuiPF+3NMKjBqfQRtGtxV8g682XlYBuUhNoYaBYQs2HNAN=
BLjbmThOpVUpxlSYVxUkjFqvXaVskEGTAF9MxA5+Ook+fyV6wPc/Tj9td6Y89VvAwsFNSa1l4AR=
ZykZAENSIGO+A7G1A+7syFYN2pTgqJJk7mqgAl3wrGQr72JM/RatAc5L+3qWDjrwZcyKm8F+7av=
tlh57nsMpNK/4jtT4QNIAxB97M0crPPIJTfrPFlxy1vFIQr4XXYN0f/Y4cXf2mWjnoNbNZVwA0G=
tjnbuxwP7XW1JpdVq4TZSY1YXjBIiAaZ6WjMrP0VERI3vZe/usdLI4grGeBz1wcc2vtYaTn7Jyr=
sWvX5P121tR63TOteyCKdiFRr45NNuK53Htmcwa/5cr2BkcHzbmbhsqKm+ckNP1yb1uG91k7V29=
TShU5sUxCAvIP3NQp48KZF8xZ9coYfoAGAxF615mO5ugvrE+tz+Fia5Qh3P3RshW2K+tW/swNdN=
AaIFp2vN4tNRUKjgpaDSRung5VI8BwJ/+KIfK1CTRj9ZgZaW3 QEMU test host key
--=20
2.43.0


