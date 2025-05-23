Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D9BC3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 12:25:10 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by mx.groups.io with SMTP id smtpd.web11.46873.1748002206352299976
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 05:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=xpSobNdp;
 dkim=pass header.i=@suse.de header.s=susede2_ed25519 header.b=B5I7E2fH;
 dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=xpSobNdp;
 dkim=pass header.i=@suse.de header.s=susede2_ed25519 header.b=B5I7E2fH;
 spf=pass (domain: suse.de, ip: 195.135.223.130, mailfrom: neilb@suse.de)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1929621BFA;
	Fri, 23 May 2025 12:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748002204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oa0an+Q6U2k/kOogtft4u+KOHqSzjK04aZoqM1uKk3A=;
	b=xpSobNdpeKV2RBw4NmR8g8Zlb0Ay9R6p9XBMqEtD8A7lMN/Gc4tUp6FkaO/QyJUrLqCU+R
	h8G89/Eo/b7o0T06uekONQbhoH6W7mNgRam3LcHHQEg47js6/qMQH3PzNIeRPjm3laRCzW
	9lmth6oq4KPVqh3cV6OknQoptVCPsF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748002204;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oa0an+Q6U2k/kOogtft4u+KOHqSzjK04aZoqM1uKk3A=;
	b=B5I7E2fH9XpbCTaejq9BBLwgySksQsBR7TZzjoxZYNOx9yznoBbzo1+Gbs74Sfc4iKAFNW
	yHSB94VvU5TEocDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xpSobNdp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=B5I7E2fH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748002204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oa0an+Q6U2k/kOogtft4u+KOHqSzjK04aZoqM1uKk3A=;
	b=xpSobNdpeKV2RBw4NmR8g8Zlb0Ay9R6p9XBMqEtD8A7lMN/Gc4tUp6FkaO/QyJUrLqCU+R
	h8G89/Eo/b7o0T06uekONQbhoH6W7mNgRam3LcHHQEg47js6/qMQH3PzNIeRPjm3laRCzW
	9lmth6oq4KPVqh3cV6OknQoptVCPsF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748002204;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oa0an+Q6U2k/kOogtft4u+KOHqSzjK04aZoqM1uKk3A=;
	b=B5I7E2fH9XpbCTaejq9BBLwgySksQsBR7TZzjoxZYNOx9yznoBbzo1+Gbs74Sfc4iKAFNW
	yHSB94VvU5TEocDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA4B71336F;
	Fri, 23 May 2025 12:10:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2dGgHpplMGgZbgAAD6G6ig
	(envelope-from <neilb@suse.de>); Fri, 23 May 2025 12:10:02 +0000
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: openembedded-core@lists.openembedded.org
Cc: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>
Subject: [PATCH OE-core] nfs-utils: don't use signals to shut down nfs server.
Date: Fri, 23 May 2025 17:41:19 +1000
Message-id: <174800219540.608730.11726448273017682287@noble.neil.brown.name>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1929621BFA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 12:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217208


Since Linux v2.4 it has been possible to stop all NFS server by running

   rpc.nfsd 0

i.e.  by requesting that zero threads be running.  This is preferred as
it doesn't risk killing some other process which happens to be called
"nfsd".

Since Linux v6.6 - and other stable kernels to which

  Commit: 390390240145 ("nfsd: don't allow nfsd threads to be
  signalled.")

has been backported - sending a signal no longer works to stop nfs server
threads.

This patch changes the nfsserver script to use "rpc.nfsd 0" to stop
server threads.

Signed-off-by: NeilBrown <neil@brown.name>
---
 .../nfs-utils/nfs-utils/nfsserver             | 28 +++----------------
 1 file changed, 4 insertions(+), 24 deletions(-)

Resending with different From: address because first attempt was bounced
as spam

  openembedded-core@lists.openembedded.org
    host lb01.groups.io [45.79.81.153]
    SMTP error from remote mail server after end of data:
    500 This message has been flagged as spam.


diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/r=
ecipes-connectivity/nfs-utils/nfs-utils/nfsserver
index cb6c1b4d08d8..99ec280b3594 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -89,34 +89,14 @@ start_nfsd(){
 	start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
 	echo done
 }
-delay_nfsd(){
-	for delay in 0 1 2 3 4 5 6 7 8 9=20
-	do
-		if pidof nfsd >/dev/null
-		then
-			echo -n .
-			sleep 1
-		else
-			return 0
-		fi
-	done
-	return 1
-}
 stop_nfsd(){
-	# WARNING: this kills any process with the executable
-	# name 'nfsd'.
 	echo -n 'stopping nfsd: '
-	start-stop-daemon --stop --quiet --signal 1 --name nfsd
-	if delay_nfsd || {
-		echo failed
-		echo ' using signal 9: '
-		start-stop-daemon --stop --quiet --signal 9 --name nfsd
-		delay_nfsd
-	}
+	$NFS_NFSD 0
+	if pidof nfsd
 	then
-		echo done
-	else
 		echo failed
+	else
+		echo done
 	fi
 }
=20
--=20
2.49.0


