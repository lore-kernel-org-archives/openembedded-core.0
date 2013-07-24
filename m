Return-Path: <walters@verbum.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF416028B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 21:47:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 182CB211D6;
	Wed, 24 Jul 2013 17:47:07 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Wed, 24 Jul 2013 17:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=c077/SGQ4mLpTF+IhRJNEh
	KicP4=; b=K5u4RAr19UEXuX1JzQNOkGa7yP3upwLHMv2A+xjlyFlziX4fV3nZvY
	XFyUhriGqYjjY9c3UPhXQW0KJSEa034OGmNxTUYTATpFZ5hBng78fpOy2Fq9NVQf
	VkCg/7t7uc/bDPbjFuhwlnuJXeCVm3t7I+MUGIQpNuT9BVb+xNjkc=
X-Sasl-enc: +QjImM3AtwxdlSNkVIanbjT15Iz/upsj1umDx5+RZqLI 1374702426
Received: from [192.168.1.2] (unknown [66.31.18.51])
	by mail.messagingengine.com (Postfix) with ESMTPA id A4D2768013A;
	Wed, 24 Jul 2013 17:47:06 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Chris Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
Date: Wed, 24 Jul 2013 17:47:05 -0400
Message-ID: <1374702425.15230.29.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-13.el6) 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2013 21:47:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-07-24 at 11:54 -0700, Chris Larson wrote:

>   - Patched in --sysroot= support for systemd-tmpfiles, to facilitate
> running it up front against the filesystem at do_rootfs time the way
> read_only_rootfs_hook does with populate-volatiles

How are you handling /run?  Is it still a tmpfs in your model?  If so
are you excluding tmpfiles.d snippets which reference /run at rootfs
time?

It strikes me that a less invasive way to achieve readonly rootfs is
to symlink /var -> /run/var.  Or are you doing that already?

Then you'd probably want to just run through any tmpfiles which
reference /etc and /usr.

> 
> - Implemented a prototype configuration for dbus which uses this to
> support read-only-rootfs. 

Err...for what?  /var/run/dbus/system_bus_socket?  You should just
have /var/run -> /run, and that's solved.

If it's for /var/lib/dbus/machine-id, likewise that should on modern
systems just be a symlink to /etc/machine-id.

Though you do need to figure out whether you want a statically
configured machine ID, or to have one generated dynamically at boot.
These both have tradeoffs; basically, whatever you're doing for the
random seed you should probably also do for the machine ID.




