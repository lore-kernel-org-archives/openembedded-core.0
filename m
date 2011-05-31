Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRLHW-00019n-JR for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 11:30:34 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QRLEV-0000hQ-1Z; Tue, 31 May 2011 11:27:27 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306581686-17625-1-git-send-email-koen@dominion.thruhere.net>
References: <1306581686-17625-1-git-send-email-koen@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 31 May 2011 10:27:22 +0100
Message-ID: <1306834042.2525.477.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC][PATCH] sysvinit: make pidof usuable in a standalone setting
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
X-List-Received-Date: Tue, 31 May 2011 09:30:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-28 at 13:21 +0200, Koen Kooi wrote:
> The alternative is to just move 'killall5' into the pidof subpackage and to RDPEPENDS_${PN} += "${PN}-pidof"

I think I like that better.  Duplicating the binary doesn't sound very
desirable.

For what it's worth, also note that:

- busybox provides an implementation of pidof too, which might be worth
considering if you aren't otherwise using sysvinit; and

- it would be fairly trivial to implement pidof as a standalone shell
script.  As a starting point, something like:

#!/bin/sh
p="($1)"
cd /proc
out=
for i in [0123456789]*/stat; do
  read a b c < $i
  if [ $p = $b ]; then
    out="`dirname $i` $out"
  fi
done
echo $out

gives you the basic behaviour of "pidof <name>".

p.




