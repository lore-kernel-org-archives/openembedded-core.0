Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4606CB44
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 09:21:04 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VWNHs-0000tJ-OX; Wed, 16 Oct 2013 11:21:04 +0200
Message-ID: <1381915225.3917.45.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 16 Oct 2013 10:20:25 +0100
In-Reply-To: <1381908355-18124-1-git-send-email-koen@dominion.thruhere.net>
References: <1381908355-18124-1-git-send-email-koen@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] openssl: switch ARM builds from linux-elf-arm to linux-armv4 config
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
X-List-Received-Date: Wed, 16 Oct 2013 09:21:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-10-16 at 09:25 +0200, Koen Kooi wrote:
> From: Koen Kooi <koen.kooi@linaro.org>
> 
> This enables aes and sha1 assembly at buildtime. Openssl does a
> runtime check to see which portion gets enabled.

[...]

> Algo    blocksize       ops/s after
>                 ops/s before    difference
> -------------------------------------------
> MD5	16	308,766	264,664	-14.28%
> 	64	277,090	263,340	-4.96%
> 	256	212,652	197,043	-7.34%
> 	1024	103,604	100,157	-3.33%
> 	8192	17,936	17,796	-0.78%

Do you know why it's causing MD5 to get slower?  I guess md5 with
blocksize=16 is not a very common case, but still.

Also, it seems generally a bit unwholesome for openssl to be picking its
own CFLAGS at all.  Would it be better to just make it use the same
CFLAGS as everything else?

p.



