Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FB4C54ED1
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 03:56:35 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.web10.8115.1748404590380762818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 20:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=j1NXi8Iy;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=AWRaC9GN;
 spf=pass (domain: stwcx.xyz, ip: 103.168.172.153, mailfrom: patrick@stwcx.xyz)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A49011140119;
	Tue, 27 May 2025 23:56:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 27 May 2025 23:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1748404589; x=1748490989; bh=a4uESj+fBFHoj4MolWR7C
	boZQt15kC39n/cR1VOlyy4=; b=j1NXi8IyAFKniS8IUiHcAhEI8dheyGINSD913
	lNgvzwfnN+an/l8RczH9evQxTFqrhX3kvDenH2fHnTSZ9gvLhBmvUvEXzEkYqmIb
	/6AtoAxhqOJj+JLk2H27NcQDtN7mUhxvAKofXYrWsCad4sJNa4dby5FrrDkIiaNF
	dpXThjwHCkvj24vkHg0TNV3YpjHV+II503Jnkh46vjGWTnoLhTAomD1ZYII0BnGE
	qfiy3+fL4YjMP0m3ogPHp/THqERgUBJzPjl9XBW5hZpvPopDrjrrvI2HghrtdvDj
	wMYNUD+IrjdBgd5raEM5A1DdthdWUcEjtO3dkUQosYvM77n3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748404589; x=1748490989; bh=a4uESj+fBFHoj4MolWR7CboZQt15kC39n/c
	R1VOlyy4=; b=AWRaC9GNYIOhV/kWs/nlXoChaSVBFvqFvsRUpwEXttdp4PNevzH
	slxQVNvYqfX8SzNuF8GMeWsw3PLrL4MSQsZDVMa76Ds+rZG519xTXdMVrUY/XUu5
	BLdjjtDfkC5m9g83I3P92N40w7+NFNzZ0yeMw6s8MTizfaUdtFKe6QUckmgWax4P
	oSAe+vupk84Rx6EmMgfAL2uA+zgRixrqdqv7Nl6wMEKvtjmLWG19H2MkXO7cu3T8
	zE33ekQ4BZLmvdePURoXYHjKXZxASg0PQNCv2mQEOVMFPUM8niphSoCMqa6kCDTO
	e+LX2mUpPp3o+jgOlp/hAvhWOFNxpSb5a/Q==
X-ME-Sender: <xms:bYk2aPJ_dIfNEsVezebjYr6AR-G9e9mD4JQuuMifhWkQMjHGKtgw_A>
    <xme:bYk2aDICnG5CmZv97vqzkftsT1uHtWsiEAj119igIHzxZS2ydxP_BefZQKYPdFDbP
    b2s5ZSNPtA7LGbNrbk>
X-ME-Received: <xmr:bYk2aHsz3psrXfREvq7GnglG4sUv6wQfR59lV4M0d1b4ZQT3MzNYr69BXNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvddvfeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecufghrlhcuvffnffculdejtddmnecujfgurhephffvvefufffkofgggfestdekredt
    redttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvedtvefgtdfhfeevjeduleeh
    geehhffhtdetteehheduieeufefhteekjeelfeetnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidp
    nhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvg
    hnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdho
    rhhgpdhrtghpthhtohepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:bYk2aIbZI2RKWHAjYmcefPW5CVpv3pAgr7PG2W0i32In7h1_9dwtNw>
    <xmx:bYk2aGbGfdDAiusef6h-gp_i0jq8SEe0RfqDZaNM00x6t8n_DbFpYQ>
    <xmx:bYk2aMC5u6Bz0_QQmL0eDw0VPyAIQf1Sa8UvYcuoTDIZKtHPD_KYpw>
    <xmx:bYk2aEYobkjqusC6ar6vt-MXfQNc9KaDKssH2Lvfwu_KubVvh1hGgg>
    <xmx:bYk2aBtVvpxPyAXxqIpP3hexNQSxlnt9XoT-bxrTaBeXKdvPwi1jxaEk>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 May 2025 23:56:29 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] systemd.bbclass: fix postinst for real systemd-systemctl-native
Date: Tue, 27 May 2025 23:56:25 -0400
Message-ID: <20250528035625.1262266-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 03:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217332

The commit 7a580800db39 switched from a small Python implementation
of `systemctl` to using the real systemctl executable from the
systemd package.  In the systemd.bbclass, systemd-systemctl-native
is used to default-enable services, based on the SYSTEMD_SERVICES
variable, but this was only done if `systemctl` can be executed
without error.  The problem is that the real systemctl executable
treats a zero argument call as if `systemctl list-units` were ran.
This cannot be done when cross-compiling and yields:

```
    Failed to connect to system scope bus via local transport: Operation
    not permitted (consider using --machine=<user>@.host --user to
    connect to bus of other user)
```

The end result is that the `systemd_postinst` effectively turns into
a silent no-op and services are not correctly enabled.

Switch the systemd.bbclass to use `systemctl --help` instead, which
does not require any dbus access to be functional.

Fixes: 7a580800db39 ("systemd: Build the systemctl executable")
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/classes-recipe/systemd.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 4c9f51d33d..e1fe4ed072 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -29,7 +29,7 @@ python __anonymous() {
 }
 
 systemd_postinst() {
-if systemctl >/dev/null 2>/dev/null; then
+if systemctl --help >/dev/null 2>/dev/null; then
 	OPTS=""
 
 	if [ -n "$D" ]; then
@@ -66,7 +66,7 @@ fi
 }
 
 systemd_prerm() {
-if systemctl >/dev/null 2>/dev/null; then
+if systemctl --help >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
 		if [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ]; then
 			systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
-- 
2.49.0


