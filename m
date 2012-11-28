Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1TdmMG-0000EG-AE
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 19:27:43 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 7462FF811DA; Wed, 28 Nov 2012 11:13:26 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 960E3F81188;
	Wed, 28 Nov 2012 11:13:24 -0700 (MST)
Message-ID: <50B6546E.5070308@mlbassoc.com>
Date: Wed, 28 Nov 2012 11:14:06 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: New ARM error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 18:27:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I build for an OMAP4 platform using
   DEFAULTTUNE = "cortexa9hf-neon"

This has been working fine, but after updating to the latest master, I'm getting this error

     Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (cortexa9hf-neonhf-vfp-neon).
     PACKAGE_ARCHS = (all any noarch armv5hf-vfp armv5ehf-vfp armv6hf-vfp armv7ahf-vfp armv7ahf-vfp-neon cobra4430p82)

(I added the print of the expanded PACKAGE_ARCHS for clarity)

I bisected change this to this commit (Poky/Yocto tree):

commit c5b670e4c9f020ed951d5499a888c50b1d703b62
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Tue Oct 2 17:22:00 2012 +0000

     arm/arch-arm*: define ARMPKGARCH_tune-* for default tunes

     * tune-foo is not valid override, for it to work I had to add
       ARMPKGARCH = "${ARMPKGARCH_tune-${DEFAULTTUNE}}"
       but that doesn't work without value defined for every supported
       DEFAULTTUNE value, otherwise it's expanded like this
       TUNE_PKGARCH (${ARMPKGARCH_tune-armv5te}te).

     (From OE-Core rev: 31e4f2dee990ee7f5d7491b65565e71d7d580209)

     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Any ideas how I can fix this?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


