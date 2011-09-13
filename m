Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R3PBd-0008SU-Mw
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 11:21:49 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R3P6g-0002wI-Al
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 11:16:42 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2011 10:16:41 +0100
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF18E950@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF18E621@MBX20.4emm.local>
	<4E6A3770.4060307@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18E85D@MBX20.4emm.local>
	<4E6E1C1D.7010500@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18E950@MBX20.4emm.local>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1315905402.2519.116.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Problem with new image-prelink
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
X-List-Received-Date: Tue, 13 Sep 2011 09:21:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 02:58 +0000, James Limbouris wrote:
> root@192:~# gdb prelink
> <...>
> Reading symbols from /usr/sbin/prelink...Reading symbols from /usr/sbin/.debug/prelink...done.
> done.
> (gdb) set follow-fork-mode child
> (gdb) run -a
> Starting program: /usr/sbin/prelink -a
> [New process 1712]
> process 1712 is executing new program: /usr/sbin/prelink-rtld
> [ 2777.370000] Alignment trap: prelink-rtld (1712) PC=0x410f9990 Instr=0xe5922024 Address=0x00000025 FSR 0x001
> 
> Program received signal SIGBUS, Bus error.
> [Switching to process 1712]
> 0x410f9990 in __ctype_b_loc () at ../include/ctype.h:30
> 30          *tablep = (const uint16_t *) _NL_CURRENT (LC_CTYPE, _NL_CTYPE_CLASS) + 128;

Just in case it's not obvious, the fact that this address is unaligned
is the least of your worries.  Even if alignment didn't matter, you
would just get a segfault instead since 0x25 is never going to be a
valid pointer.

I guess you need to investigate where the value in r2 is coming from and
figure out why it has this bogus value.

p.




