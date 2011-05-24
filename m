Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QOqqB-0004Ip-1R for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 14:36:03 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QOqnH-0002KS-UP
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 14:33:04 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 24 May 2011 13:32:29 +0100
Message-ID: <1306240349.2525.167.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: perl build failure
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
X-List-Received-Date: Tue, 24 May 2011 12:36:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

My eglibc builds are failing in perl with:

| ccache i586-oe-linux-gcc -march=i586 --sysroot=/home/pb/oe/build-meta/tmp-eglibc/sysroots/qemux86 -Wl,-O1  -Wl,--as-needed -o miniperl \
| 	      gv.o toke.o perly.o pad.o regcomp.o dump.o util.o mg.o reentr.o mro.o hv.o av.o run.o pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o regexec.o utf8.o taint.o deb.o universal.o globals.o perlio.o perlapi.o numeric.o mathoms.o locale.o pp_pack.o pp_sort.o   \
| 	    miniperlmain.o opmini.o perlmini.o -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc
| toke.o: In function `S_scan_str':
| /home/pb/oe/build-meta/tmp-eglibc/work/i586-oe-linux/perl-5.12.3-r0/perl-5.12.3/toke.c:12609: undefined reference to `__stack_chk_guard'

What seems to be happening is that perl is adding -fstack-protector to
CFLAGS but then somehow forgetting to include it during final link of
miniperl.

I see that -fstack-protector is being forced off altogether for uclibc
builds which presumably is why the problem doesn't occur there.  But I
am somewhat baffled as to why this is apparently not happening for
anybody else with eglibc.

Anyway, does anybody have an idea what is going wrong here?  I had a
quick look at it but the perl cross-compilation process seems to be
slightly baroque and I couldn't immediately figure out how the various
makefiles and config fragments were meant to be interacting.

p.




