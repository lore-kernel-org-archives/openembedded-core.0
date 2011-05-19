Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QN0YW-0006BC-Ok for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 12:34:12 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QN0Ve-0007Ho-4h; Thu, 19 May 2011 12:31:14 +0200
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1305800103.3424.464.camel@rex>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
	<1305643833.2429.264.camel@phil-desktop>
	<1305649331.3424.259.camel@rex>
	<1305733061.18415.98.camel@lenovo.internal.reciva.com>
	<1305800103.3424.464.camel@rex>
Date: Thu, 19 May 2011 11:31:08 +0100
Message-ID: <1305801068.18415.179.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk: respect ONLINE_PACKAGE_MANAGEMENT
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2011 10:34:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 11:15 +0100, Richard Purdie wrote:
> We have postinstalls that require to run on the target device. If
> they're present, we need opkg there to run them, or at least some kind
> of script to handle that and I think both cases have a requirement on
> that directory (the rpm backend has a suitable script).
> 
> So the current patches which just don't create it don't really address
> the problem. At the very least the image generation should error if
> these types of postinstall are present which I guess is my real concern.

Ah, I see what you mean now.  Yes, it is true that packages which expect
to get their postinst run on the target will lose in this case.  But,
practically speaking, this is not likely to be too much of a limitation:
devices which have O_P_M=none tend to be the same ones that have their
root filesystem on readonly media, so running postinsts on the target is
likely to be futile anyway.  (Also, O_P_M=none targets will generally
not install opkg in their rootfs in any case.)

I agree it would be a good thing for the build to emit an error in this
case rather than just causing the postinsts to silently not run.  I
guess the ideal way of dealing with this would be:

a) introduce a new variable, TARGET_FILESYSTEM_READONLY or some such,
and make it an error for there to be any packages left in "install ok
unpacked" at the end of rootfs construction if this flag is set;

b) for the case where O_P_M="none" but T_F_R is not set, provide an
additional postprocessor to distill the opkg status file down to just
the bits that are needed for postinst running, and also provide some
lightweight script to run the postinsts and then clean up afterwards.

p.




