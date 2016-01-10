Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id EF9CD60588
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 22:18:26 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aIOJR-0001MD-Rw; Sun, 10 Jan 2016 23:18:21 +0100
Message-ID: <1452464286.1950.15.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: roman@khimov.ru
Date: Sun, 10 Jan 2016 22:18:06 +0000
In-Reply-To: <2644403.ISKvOHQyRX@masala.hex>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
	<568B0B5D.8000209@windriver.com>
	<5692911F.1050601@universe-factory.net>
	<2644403.ISKvOHQyRX@masala.hex>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
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
X-List-Received-Date: Sun, 10 Jan 2016 22:18:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-01-10 at 20:52 +0300, Roman Khimov wrote:
> IMO, FILES just shouldn't use hard-coded /lib or any other hard-coded path 
> like that.

Well, right, but that doesn't really address the issue.  Even if FILES
is defined in terms of ${base_libdir} or whatever, it's still not going
to match if fixup_perms() has shuffled things around in some random way.
I don't think there is any reliable way for fixup_perms() to find and
patch all the variables that might refer to paths that it has decided to
adjust.

Conversely, if FILES is defined in terms of ${base_libdir} and
do_install() puts the files there, you can change the value of
${base_libdir} to whatever you like and everything will "just work"
without the need for fixup_perms() to move anything.

As I mentioned somewhere else in this thread, micro has been using a
merged /usr for several years (but done the other way around, so
everything is installed into /bin and suchlike) and this has worked just
fine without the need for any fsperms magic.  I can't see any obvious
reason why the new-style /usr merge is fundamentally more difficult.

p.



