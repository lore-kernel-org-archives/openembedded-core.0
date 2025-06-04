Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81626C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 00:54:07 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by mx.groups.io with SMTP id smtpd.web10.31486.1749079794301173905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 16:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=geNVVtA+;
 dkim=pass header.i=@suse.de header.s=susede2_ed25519 header.b=JVOx6SRh;
 dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=D1ZUFUiu;
 dkim=pass header.i=@suse.de header.s=susede2_ed25519 header.b=LCxbBJhj;
 spf=pass (domain: suse.de, ip: 195.135.223.130, mailfrom: neilb@suse.de)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1628822D51;
	Wed,  4 Jun 2025 23:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749079792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/s0hDyqK8FpIxr6xDsl71jOPAzw8jBxE09Dx/FkPP60=;
	b=geNVVtA+7i4hQ0J5Wx8eaCzM+TywUL1wGgH27D+azNIYA8A82QXDC8nMFjSW5nwinFYT4i
	YsnL/H8Y4OW8e/SJu2eLqsJnzG1iHE/F+9XTB0FT7UJ9qGfPSFxNrWGP30y6kR0e2R0odu
	y1wIKsZunGWNxqwTNnfOoXj2DEYVhIg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749079792;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/s0hDyqK8FpIxr6xDsl71jOPAzw8jBxE09Dx/FkPP60=;
	b=JVOx6SRhSSKG34r+i95HVpKuxSK2mrmuY7j0GXX0TDWuo91DJielAE4/N1+TD+HjoY5B0Y
	ja3IhK7YwmB1CQCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749079791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/s0hDyqK8FpIxr6xDsl71jOPAzw8jBxE09Dx/FkPP60=;
	b=D1ZUFUiui0s/DrW2bW8hqx4t1VnxhcRbNcZjSFI7vEd4+xrF+wZra+VQPC/mjQ3yzd1OWN
	K4vdfSiS8uLo4ULuDUrao7UNfx3pOq1vDWxJO2uMmNj/9WylE0+STeOWBC0LyDnZs7gP+y
	QoMeser7OHzjDC1AfnrueKDnjJS++Xs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749079791;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/s0hDyqK8FpIxr6xDsl71jOPAzw8jBxE09Dx/FkPP60=;
	b=LCxbBJhjVe2Il7Zb/6cooIDWVDGfOLDom3Su4n+CCZbnF6Rf8ETWTJvZn0TtkmiyPFUGgi
	O93i2qkULBjKV2CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75E9A1369A;
	Wed,  4 Jun 2025 23:29:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MEDoCe3WQGjJJAAAD6G6ig
	(envelope-from <neilb@suse.de>); Wed, 04 Jun 2025 23:29:49 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Steve Dickson" <steved@redhat.com>
Cc: openembedded-core@lists.openembedded.org,
 "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>,
 "Linux NFS Mailing List" <linux-nfs@vger.kernel.org>
Subject: Re: [PATCH OE-core] nfs-utils: don't use signals to shut down nfs server.
In-reply-to: <15a51751-2370-4473-a1d3-e4f7cb5e8e6b@redhat.com>
References: <174800219540.608730.11726448273017682287@noble.neil.brown.name>,
 <15a51751-2370-4473-a1d3-e4f7cb5e8e6b@redhat.com>
Date: Thu, 05 Jun 2025 09:29:41 +1000
Message-id: <174907978184.608730.13107648349010629967@noble.neil.brown.name>
X-Spamd-Result: default: False [-4.28 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.18)[-0.903];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:email,groups.io:url,imap1.dmz-prg2.suse.org:helo,noble.neil.brown.name:mid,openembedded.org:url,openembedded.org:email]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 00:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217972

On Thu, 05 Jun 2025, Steve Dickson wrote:
> Hey Neil,
>=20
> On 5/23/25 3:41 AM, NeilBrown wrote:
> >=20
> > Since Linux v2.4 it has been possible to stop all NFS server by running
> >=20
> >     rpc.nfsd 0
> >=20
> > i.e.  by requesting that zero threads be running.  This is preferred as
> > it doesn't risk killing some other process which happens to be called
> > "nfsd".
> >=20
> > Since Linux v6.6 - and other stable kernels to which
> >=20
> >    Commit: 390390240145 ("nfsd: don't allow nfsd threads to be
> >    signalled.")
> >=20
> > has been backported - sending a signal no longer works to stop nfs server
> > threads.
> >=20
> > This patch changes the nfsserver script to use "rpc.nfsd 0" to stop
> > server threads.
> >=20
> > Signed-off-by: NeilBrown <neil@brown.name>
> > ---
> >   .../nfs-utils/nfs-utils/nfsserver             | 28 +++----------------
> >   1 file changed, 4 insertions(+), 24 deletions(-)
> >=20
> > Resending with different From: address because first attempt was bounced
> > as spam
> >=20
> >    openembedded-core@lists.openembedded.org
> >      host lb01.groups.io [45.79.81.153]
> >      SMTP error from remote mail server after end of data:
> >      500 This message has been flagged as spam.
> >=20
> >=20
> > diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/me=
ta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> > index cb6c1b4d08d8..99ec280b3594 100644
> > --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> > +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> > @@ -89,34 +89,14 @@ start_nfsd(){
> >   	start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
> >   	echo done
> >   }
> > -delay_nfsd(){
> > -	for delay in 0 1 2 3 4 5 6 7 8 9
> > -	do
> > -		if pidof nfsd >/dev/null
> > -		then
> > -			echo -n .
> > -			sleep 1
> > -		else
> > -			return 0
> > -		fi
> > -	done
> > -	return 1
> > -}
> >   stop_nfsd(){
> > -	# WARNING: this kills any process with the executable
> > -	# name 'nfsd'.
> >   	echo -n 'stopping nfsd: '
> > -	start-stop-daemon --stop --quiet --signal 1 --name nfsd
> > -	if delay_nfsd || {
> > -		echo failed
> > -		echo ' using signal 9: '
> > -		start-stop-daemon --stop --quiet --signal 9 --name nfsd
> > -		delay_nfsd
> > -	}
> > +	$NFS_NFSD 0
> > +	if pidof nfsd
> >   	then
> > -		echo done
> > -	else
> >   		echo failed
> > +	else
> > +		echo done
> >   	fi
> >   }
> >  =20
> Is this suppose to apply to the Linux nfs-utils upstream repo?
>=20
> A bit confused...

Sorry, I should have been more explicit.
As it says in the subject, this was for "OE-core" - openembedded-core

It has since been committed there:

https://git.openembedded.org/openembedded-core/commit/?id=3D7b09ad289a36

Thanks,
NeilBrown

