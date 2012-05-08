Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SRenU-0006sZ-3G
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 09:25:24 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SRedz-000111-22
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 09:15:35 +0200
Message-ID: <1336461271.3181.93.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 May 2012 08:14:31 +0100
In-Reply-To: <228b3adfffa660477cc65e00fc32c95f2bf976fd.1336445265.git.liezhi.yang@windriver.com>
References: <cover.1336445265.git.liezhi.yang@windriver.com>
	<228b3adfffa660477cc65e00fc32c95f2bf976fd.1336445265.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] sanity.bbclass: check TMPDIR is not too long
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
X-List-Received-Date: Tue, 08 May 2012 07:25:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-08 at 10:50 +0800, Robert Yang wrote:
> When the length of TMPDIR is longer than a threshold, there would be an
> "Argument list too long" error when building gcc-cross, this is the
> error from the exec(), the maximum length of argument is defined in
> /usr/include/linux/limits.h:
> 
>   #define ARG_MAX       131072    /* # bytes of args + environ for exec() */
> 
> It's hard to determine the threshold of the TMPDIR, here is the
> experimental value:
> len(TMPDIR) = 182	Success
> len(TMPDIR) = 192	Failed
> 
> So set the maximum length of TMPDIR to 180 seems proper.

It seems a bit lame for paths to be restricted to such a short length.
How does a 192-byte TMPDIR end up causing more than 131072 bytes of
arguments and environment?  Can anything be done to reduce that?  For
example, can you use "gcc @..." to remove common options from the
command line?  Can you eliminate garbage from the environment that
doesn't need to be there?

p.




