Return-Path: <aplanas@suse.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAACC7112B
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 09:31:11 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by mx.groups.io with SMTP id smtpd.web11.7757.1692351061162215519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 02:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@suse.com header.s=susede1 header.b=DAvOiONe;
 spf=pass (domain: suse.com, ip: 195.135.220.29, mailfrom: aplanas@suse.com)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 14D2E1F893;
	Fri, 18 Aug 2023 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692351059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5z/7Try/hdH8TOes5+2og1Z4+u+8Ddn5eUdlwoh5Wpg=;
	b=DAvOiONe7Nnp6J727QwLUpQD6w0I5tIjWKF+QayxI1Nc8LP42rPRo+PUJb7mJDevNfZ0EC
	JSOnQllEnAZj+5Kbh7/jgENEeVJOEBk5OpV0NbdgV28DzjYy024hrS5jXYEFraEilUYy+Y
	jwXakEhmVMKYgsfK5ENhCQhqmFq/K+c=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB25713441;
	Fri, 18 Aug 2023 09:30:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wwNJLlI632T4KQAAMHmgww
	(envelope-from <aplanas@suse.com>); Fri, 18 Aug 2023 09:30:58 +0000
From: aplanas@suse.com
To: openembedded-core@lists.openembedded.org
Cc: Alberto Planas <aplanas@suse.com>
Subject: [PATCH] bitbake.conf: add bunzip2 in HOSTTOOLS
Date: Fri, 18 Aug 2023 11:30:56 +0200
Message-ID: <20230818093056.10499-1-aplanas@suse.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 09:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186353

From: Alberto Planas <aplanas@suse.com>

rpm2cpio.sh can make calls to bunzip2 to uncompress the RPM payload that
conform the cpio file.

bzip2 is already part of HOSTTOOLS, as a link to the system installed
bzip2.

This patch add bunzip2 in HOSTOOLS list as a non-optional binary, so is
available to rpm2cpio.sh when it is required.

The currect rpm2cpio.sh has other calls to gunzip (present in HOSTOOLS),
xzcat (missing), unlzma (missing) and unzstd (present in HOSTTOOLS since
bff58d337890e804d33d7decbaa46065a4d3bba4)

Adding the missing ones will not add any new host dependency as xz-utils
is already listed as a requirement.

Signed-off-by: Alberto Planas <aplanas@suse.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 599bbc4ba8..b19f265b3d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -516,7 +516,7 @@ HOSTTOOLS_DIR =3D "${TMPDIR}/hosttools"
=20
 # Tools needed to run builds with OE-Core
 HOSTTOOLS +=3D " \
-    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp co=
mm cp cpio \
+    [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpat=
h cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr =
false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gz=
ip \
     head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir m=
kfifo mknod \
--=20
2.41.0


