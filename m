Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SC6A4-0007AM-7Z for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 11:24:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2Q9FO75023725
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 10:15:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20450-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 10:15:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2Q9FDcq023718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 10:15:14 +0100
Message-ID: <1332753313.28414.91.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 10:15:13 +0100
In-Reply-To: <1332524132-24689-1-git-send-email-trini@ti.com>
References: <1332524132-24689-1-git-send-email-trini@ti.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] qemu.inc: Use '=' for IMAGE_FSTYPES
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
X-List-Received-Date: Mon, 26 Mar 2012 09:24:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 10:35 -0700, Tom Rini wrote:
> As per
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019772.html
> a machine conf file should use '=' to set IMAGE_FSTYPES.
> 
> Signed-off-by: Tom Rini <trini@ti.com>
> ---
>  meta/conf/machine/include/qemu.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

As someone pointed out, what I mentioned in that email sadly doesn't
work although it would be nice if they did. I suspect this is why we're
using += since:

> - The machine needs to say 'I need or support the following formats'

so the machine ensures those formats exist at a minimum:

IMAGE_FSTYPES += "xxxx"

> - The distro needs to say 'I always want format X'

so the distro can do:

IMAGE_FSTYPES += " yyy"

> - The user needs to say 'I know best, give me only format X'

This one is the problem case so the user has to use overrides:

IMAGE_FSTYPES_override = "X"

(where override can be MACHINE or forcevariable)

> - The user needs to say 'I know best, give me what you support + X'

IMAGE_FSTYPES += " X"


Whilst I think that is less than ideal since it forces use of overrides
in local.conf to override, changing the += in machine conf files doesn't
gain us much, it just breaks += in local.conf.

I'm open to other feedback though...

Cheers,

Richard






