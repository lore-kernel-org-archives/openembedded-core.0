Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rmr3x-0001z1-Li for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 19:13:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0GI68bg023225;
	Mon, 16 Jan 2012 18:06:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22498-06; Mon, 16 Jan 2012 18:06:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0GI609u023219
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 16 Jan 2012 18:06:01 GMT
Message-ID: <1326737165.2933.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jan 2012 18:06:05 +0000
In-Reply-To: <1326395831-5121-1-git-send-email-koen@dominion.thruhere.net>
References: <1326395831-5121-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [Patch v3] gconf: enable gtk+ 2.0 support to build gconf-sanity-check-2
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
X-List-Received-Date: Mon, 16 Jan 2012 18:13:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-12 at 20:17 +0100, Koen Kooi wrote:
> This is needed for e.g. gnome-session:
> 
> gnome-session[424]: WARNING: Failed to run gconf-sanity-check-2:
> Failed to execute child process
> "/usr/libexec/gconf-sanity-check-2" (No such file or directory)
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-gnome/gnome/gconf_3.2.3.bb |   20 +++++++++++---------
>  1 files changed, 11 insertions(+), 9 deletions(-)

This broke OE-Core since gtk+ depends on pango, pango depends on gconf
and gconf depends on gtk+.

Why wasn't this tested? I can only assume there are things in meta-oe
masking pieces of OE-Core and this shows how harmful they can be. 

Since this was breaking things for pretty much everyone who does use
OE-Core, I pushed a patch changing pango to inherit gnomebase instead of
gnome.bbclass which resolves the circular dependency.

Cheers,

Richard





