Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 655BD6B095
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 05:39:58 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1V03Q4-0008EQ-Sj for openembedded-core@lists.openembedded.org;
	Fri, 19 Jul 2013 07:39:56 +0200
Received: from 91-65-247-193-dynip.superkabel.de ([91.65.247.193])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 07:39:56 +0200
Received: from holger by 91-65-247-193-dynip.superkabel.de with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 07:39:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Holger Freyther <holger@freyther.de>
Date: Fri, 19 Jul 2013 05:39:33 +0000 (UTC)
Message-ID: <loom.20130719T072922-639@post.gmane.org>
References: <ly8v1etzn5.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<ly4nc2twyk.fsf@ensc-virt.intern.sigma-chemnitz.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 91.65.247.193 (Mozilla/5.0 (X11;
	Linux i686) AppleWebKit/537.36 (KHTML, like Gecko)
	Chrome/27.0.1453.110 Safari/537.36)
Subject: Re: kernel miscompilation with gcc 4.8 for ARMv5
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
X-List-Received-Date: Fri, 19 Jul 2013 05:39:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Enrico Scholz <enrico.scholz@...> writes:

Good Morning,

> Applying two upstream kernel commits
> 455bd4c430b0c0a361f38e8658a0d6cb469942b5 (ARM: 7668/1: fix
> memset-related crashes caused by recent GCC (4.7.2) optimizations) and
> 418df63adac56841ef6b0f1fcf435bc64d4ed177 (ARM: 7670/1: fix the memset
> fix) seem to fix the problem for me.

I am in a similar situation with ARMv5. My 3.2.48 kernel randomly
crashed inside namei.c:do_lookup when de-referencing a bogus address
and after upgrading to 3.4.53 I do see crashes in the tcpv4 receive
path. Compiling my kernel with GCC 4.6.3 appears to produce a working
one. The output of the oops can be seen here[1], from what I see
I am entering this path[2] and besides the

 if (sk2) {
   sk = sk2;
   goto process;
 }

...
process:
	if (sk->sk_state == TCP_TIME_WAIT)
		goto do_time_wait;
...

will crash on the above line. Compiling tcp_ipv4.c with GCC4.6.3
and re-linking doesn't appear to fix the problem but maybe I made
another mistake.

Do you guys have an idea on how to proceed?



[1] http://paste.lisp.org/display/138095
[2] 
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/net/ipv
4/tcp_ipv4.c?id=v3.4#n1833



