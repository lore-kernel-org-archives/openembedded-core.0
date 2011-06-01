Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QRpdh-0004o1-Jf for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:55:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p51HqJ26015921
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 18:52:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15814-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2011 18:52:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p51HqBx7015915
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 18:52:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306948467.2529.162.camel@phil-desktop>
References: <1306948467.2529.162.camel@phil-desktop>
Date: Wed, 01 Jun 2011 18:51:53 +0100
Message-ID: <1306950713.27470.457.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gnu-config-native and perl-native
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
X-List-Received-Date: Wed, 01 Jun 2011 17:55:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 18:14 +0100, Phil Blundell wrote:
> Further to my mini-crusade against perl-native, I discovered that it was
> also being included during the initial pseudo build because
> gnu-config-native depends on it.
> 
> This also seems a bit mysterious: gnu-config has:
> 
> DEPENDS_virtclass-native = "perl-native"
> 
> ... which suggests that the dependency on perl-native was indeed
> intentional rather than accidental.  But later, it has:
> 
> 	# In the native case we want the system perl as perl-native can't have built yet
> 	if [ "${BUILD_ARCH}" != "${TARGET_ARCH}" ]; then
> 		sed -i -e 's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/gnu-configize
> 	fi
> 
> ... which suggests that it isn't actually expecting to use the
> newly-built perl anyway.  Does anybody know what's going on with that?

This was merged as a work around to the ton of bugs we were seeing where
if perl-native was half staged (say the perl binary without libperl)
when gnu-configize was run you would see build failures or other timing
related issues.

It works since it makes perl-native happen early and consistently.

I allowed the workaround on the condition we did go back and fix the
problem properly, Dexuan has published a series doing just this and many
perl-native dependencies will disappear when that series merges.

Cheers,

Richard




