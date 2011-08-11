Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QrXlH-0002MV-VH for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 18:05:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7BG15xe032164
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 17:01:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31578-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 17:01:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7BG10DM032158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 17:01:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <0C67B7D5-11F2-45F4-AD8F-F43F508CD784@kernel.crashing.org>
References: <0C67B7D5-11F2-45F4-AD8F-F43F508CD784@kernel.crashing.org>
Date: Thu, 11 Aug 2011 17:00:22 +0100
Message-ID: <1313078422.14274.442.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: sscache signature?
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
X-List-Received-Date: Thu, 11 Aug 2011 16:05:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-10 at 12:51 -0500, Kumar Gala wrote:
> the yocto wiki references mentions a bitbake-diffsigs
> 
> https://wiki.yoctoproject.org/wiki/Enable_sstate_cache
> 
> but not seeing that.  How can one compare signature or try and figure
> out why a cache item isn't being reused between cfgs.

What I've been referring to is a process something along the lines of:

$ bitbake bash -e | grep BASEHASH | sort > hashbefore
$ vi ../scripts/oe-buildenv-internal 
[Add SOCKS5_USER and SOCKS5_DOMAIN to BB_ENV_EXTRAWHITE]
$ export SOCKS5_USER=bar
$ cd ..; source oe-init-build-env b2
$ bitbake bash -e | grep BASEHASH | sort > hashafter
$ diff -u hashbefore hashafter
[no differences]
$ vi conf/local.conf
[ Add "export SOCKS5_USER" to file ]
$ bitbake bash -e | grep BASEHASH | sort > hashafter2
$ diff -u hashbefore hashafter2
[ Find hashes now changed (which is bad and what we need to avoid ]
$ vi ./meta/conf/bitbake.conf
[ Add SOCKS5_USER to BB_HASHBASE_WHIETLIST ]
$ bitbake bash -e | grep BASEHASH | sort > hashafter3
$ diff -u hashbefore hashafter2
[no differences again - good]

which proves the addition of the variable didn't result in changes
sstate checksums. The bitbake-diffsigs command can be used to find out
what caused changes but in this case we have a pretty good idea so I
didn't use it.

As mentioned on irc, adding it to BB_ENV_EXTRAWHITE isn't an issue but
since its not exported into any of bitbake's execution environment, I'm
at a loss to understand how this helps you. If you do also export the
value to include it in bitbake's execution environment it does change
the hash which is what I worried about and it needs excluding as
documented above.

Some further investigation is needed to figure out how BB_ENV_EXTRAWHITE
is enough as it shouldn't be.

Cheers,

Richard




