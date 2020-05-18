Received: from relay.dream-property.net (relay.dream-property.net [178.19.67.222])
 by mx.groups.io with SMTP id smtpd.web11.43531.1589812602453959962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 07:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=bad algorithm. Only rsa-sha1 or rsa-sha256 are permitted;
 spf=pass (domain: opendreambox.org, ip: 178.19.67.222, mailfrom: obi@opendreambox.org)
Received: from mail.dream-property.net (mail.dream-property.net [82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 64721100A09C4;
	Mon, 18 May 2020 14:36:39 +0000 (UTC)
Received: from localhost (ip-176-199-141-47.hsi06.unitymediagroup.de [176.199.141.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 8FCCD314212B;
	Mon, 18 May 2020 16:36:35 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org;
	s=dkim; t=1589812596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OqFyM+1m0xlG4E/zIZsZIyk39THu2RanBQF7V67ZJcw=;
	b=IpVj03JVlLH9uu/uTJ1j2UKe7d0wnO/+4rT4QQp8zsyt2+pEGG9TAGkd6jHC7SM49HnYch
	cstWxuWEpA60xiCg==
Date: Mon, 18 May 2020 16:36:28 +0200
From: "Andreas Oberritter" <obi@opendreambox.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Martin Jansa <martin.jansa@gmail.com>, Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] glibc: move ld.so.conf back to main package
Message-ID: <20200518163628.7984eb9d@opendreambox.org>
In-Reply-To: <3c2fa255-4f8b-1f4f-df79-32fd1ac72d62@prevas.dk>
References: <20200518113617.31831-1-rasmus.villemoes@prevas.dk>
	<CA+chaQdZQRYMwbaAdE-TE9SNuJpwO=0Z6Qy7SR6kZxN7kpJ3qA@mail.gmail.com>
	<0397befe-9f5d-a704-be07-00926fd3fffa@prevas.dk>
	<20200518142959.57fda0cc@opendreambox.org>
	<3c2fa255-4f8b-1f4f-df79-32fd1ac72d62@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 May 2020 15:25:19 +0200
Rasmus Villemoes <rasmus.villemoes@prevas.dk> wrote:

> On 18/05/2020 14.29, Andreas Oberritter wrote:
> > Hello Rasmus,
> > 
> > On Mon, 18 May 2020 14:12:43 +0200
> > Rasmus Villemoes <rasmus.villemoes@prevas.dk> wrote:
> > 
> >> I'm certainly open to other ways of solving this. But can we agree that
> >> it is a bug that the ldconfig done at build-time does not take
> >> /etc/ld.so.conf.d/* into account, and that that should not depend on
> >> whether one has ldconfig-the-binary on target?
> > 
> > have you tried installing ldconfig and adding it to ROOTFS_RO_UNNEEDED? It might be an improvement to include it in ROOTFS_RO_UNNEEDED by default.
> 
> Thanks, but I don't think that will work:
> 
>         self._uninstall_unneeded()
> 
>         if self.progress_reporter:
>             self.progress_reporter.next_stage()
> 
>         self._insert_feed_uris()
> 
>         self._run_ldconfig()
> 
> so if the ldconfig package (including the ld.so.conf file) is just added
> to ROOTFS_RO_UNNEEDED, it will be gone by the time we get to doing the
> build-time ld.so.cache generation. And I think it has to be done in this
> order - if some of the packages removed by _uninstall_unneeded remove
> shared libraries, one doesn't want stale entries in ld.so.cache
> referring to those.

That's not ideal, but we could special-case ldconfig and uninstall it after this step.

> > Please consider use-cases where writable filesystems ship without ldconfig, but a user installs it from a package feed when needed.
> 
> Do you mean I should leave /etc/ld.so.conf.d/ alone? I can do that. But
> I'd say that also in that case the current behaviour is buggy - if any
> package in the rootfs ships with an /etc/ld.so.conf.d/ entry, that entry
> should be taken into account at image build time, regardless of whether
> ldconfig is there at image build time or can usefully be added later via
> a package installer.

What I meant to say is that, in general, we can't remove files from rootfs manually if they are managed by a package manager (without causing difficulties like having to reinstall glibc in this case to restore these files when needed by someone installing ldconfig from a feed). So you'd have to leave both ld.so.conf and ld.so.conf.d alone.

Best regards,
Andreas
