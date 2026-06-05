Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC4ACD6E5D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 08:38:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3665.1780647428261312965
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 01:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DURrDS+N;
 spf=pass (domain: redhat.com, ip: 170.10.129.124, mailfrom: berrange@redhat.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780647427;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YYhL4k6H0XA5raAWVSntoT/50RB3YG1rpxzsT/RplBU=;
	b=DURrDS+NK8pL4jknJxHPe9wScg/LDJkABcOLxC44vtrm4ETfuwbGVhUhQ5AW3/AuLubu0E
	8YhWcabmupTLERPI4ZjkWJJjFCjif5c8x9/qvQwPDA2DOHApU12wOMigxJmgBe7MaJKPvm
	6yc6ndUuY6wJGq5i4ENFoEzGwNfGlVk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-ZBVqBm7SP1KBlRgOkG8KWA-1; Fri,
 05 Jun 2026 04:10:41 -0400
X-MC-Unique: ZBVqBm7SP1KBlRgOkG8KWA-1
X-Mimecast-MFC-AGG-ID: ZBVqBm7SP1KBlRgOkG8KWA_1780647040
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C6C4A1944D1B;
	Fri,  5 Jun 2026 08:10:39 +0000 (UTC)
Received: from redhat.com (unknown [10.44.50.34])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C41231624;
	Fri,  5 Jun 2026 08:10:35 +0000 (UTC)
Date: Fri, 5 Jun 2026 09:10:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org, Quan.Sun@windriver.com,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: ui: Regression calling eglInitialize() since v11.0.0
Message-ID: <aiKEeH2UZgdePzjX@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com>
 <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
 <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com>
 <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
 <237df978-b1f2-4c66-ab4c-5894f7a44a02@mailo.com>
MIME-Version: 1.0
In-Reply-To: <237df978-b1f2-4c66-ab4c-5894f7a44a02@mailo.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: 3Ggfa_qjjxJ9CHIJtm3aJY_Pw3E_-7uAjI-1SFFYyXI_1780647040
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 08:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238152

On Fri, Jun 05, 2026 at 08:35:13AM +0200, Philippe Mathieu-Daudé wrote:
> On 29/5/26 18:29, Alexander Kanavin wrote:
> > On Fri, 29 May 2026 at 18:10, Quan Sun via lists.openembedded.org
> > <Quan.Sun=windriver.com@lists.openembedded.org> wrote:
> > > This is likely a real QEMU 11.0 regression, but may not be in QEMU's
> > > code itself.  The QEMU 11.0 likely changed its display initialization to
> > > be multi-threaded or reordered it, triggering a race condition in the
> > > host's Wayland/EGL/Mesa stack. Maybe setting SDL_VIDEODRIVER=x11 could
> > > solve the issue.
> > > 
> > > This issue is different from the "glx: failed to create dri3 screen /
> > > failed to load driver: vgem error" seen earlier, which was a missing GPU
> > > driver issue on the host.
> > > 
> > > If you have any detailed logs, please share with me and so I have more
> > > contexts.
> > 
> > It's the same issue, I assure you. Qemu 10.x prints nothing and simply
> > starts, while qemu 11.x first tries glx/dri3 , then wayland/egl/vgem
> > (even though there's no wayland running on the build hosts), and then
> > finally crashes, with the traceback that RP provided.
> > 
> > I don't think it's a race condition, as the failure is deterministic,
> > but I agree that something has changed in qemu's GL initialization
> > sequence.
> 
> Cc'ing Marc-André & Akihiko
> 
> Context:
> 
> https://lore.kernel.org/openembedded-core/7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org/

If it is an suspected regression between 10.2 and 11.0, then
I'd suggest someone who is able to reproduce the issue reliably
should do a 'git bisect' to narrow it down precisely.

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


