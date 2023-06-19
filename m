Return-Path: <aplanas@suse.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB917EB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:43:01 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by mx.groups.io with SMTP id smtpd.web10.2232.1687156974718151924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@suse.com header.s=susede1 header.b=VBlsmjCd;
 spf=pass (domain: suse.com, ip: 195.135.220.29, mailfrom: aplanas@suse.com)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1AC5E1F38D;
	Mon, 19 Jun 2023 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687156973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ig7D1HpCuUpLX4dr6DJ9vNULEE3YnZHhy3767qen0/I=;
	b=VBlsmjCdB357SR+EP7VG2obS7dMVe2v7BHoQMSHLGTbHwcdnJlOLjWCf7LHqykA8lzCvid
	/KbCtAKd5qL3Y1fjxqXOMtoq/m9Ys4es3zAOholj/aHyETsrIyzVG7jnzFpd9zqYTMC4Bu
	Iw3mO8KPfAO87dU+FwNKt0Z5EWyfn9k=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF755138E8;
	Mon, 19 Jun 2023 06:42:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iKsaL+z4j2S0ZgAAMHmgww
	(envelope-from <aplanas@suse.com>); Mon, 19 Jun 2023 06:42:52 +0000
From: aplanas@suse.com
To: openembedded-core@lists.openembedded.org
Cc: Alberto Planas <aplanas@suse.com>
Subject: [PATCH v3 2/2] bitbake.conf: add unzstd in HOSTTOOLS
Date: Mon, 19 Jun 2023 08:42:49 +0200
Message-ID: <20230619064249.20642-2-aplanas@suse.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230619064249.20642-1-aplanas@suse.com>
References: <20230619064249.20642-1-aplanas@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 06:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183090

From: Alberto Planas <aplanas@suse.com>

rpm2cpio.sh can make calls to unzstd to uncompress the RPM payload that
conform the cpio file.

zstd is already part of HOSTTOOLS, as a link to the system installed
zstd.

This patch add unzstd in HOSTOOLS list as a non-optional binary, so is
available to rpm2cpio.sh when it is required.

Signed-off-by: Alberto Planas <aplanas@suse.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e28df7478f..702881144e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -524,7 +524,7 @@ HOSTTOOLS +=3D " \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed s=
eq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
     sleep sort split stat strings strip tail tar tee test touch tr true =
uname \
-    uniq wc wget which xargs zstd \
+    uniq unzstd wc wget which xargs zstd \
 "
=20
 # Tools needed to run testimage runtime image testing
--=20
2.41.0


