Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BD87F605BD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 16:07:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s73G7RWH022272; Sun, 3 Aug 2014 17:07:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lJ27Xrapi5bw; Sun,  3 Aug 2014 17:07:27 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s73G7L4x021976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 3 Aug 2014 17:07:23 +0100
Message-ID: <1407082041.6981.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Sun, 03 Aug 2014 17:07:21 +0100
In-Reply-To: <53DE3841.2000305@topic.nl>
References: <53DE3841.2000305@topic.nl>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: What does "QA Issue: ... rdepends on .. but its not a build dependency?" mean
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
X-List-Received-Date: Sun, 03 Aug 2014 16:07:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-08-03 at 15:25 +0200, Mike Looijmans wrote:
> I'm getting lots of warnings like this:
> 
> """
> WARNING: QA Issue: enigma2-plugin-systemplugins-wirelesslan rdepends on 
> wireless-tools but its not a build dependency? [build-deps]
> """
> 
> What does it actually mean? What does it want me to provide here?
> 
> The message in itself is correct. The package only has a runtime 
> dependency. It does not require the wireless-tools package to be built 
> or otherwise present on the build system. But what is the QA issue here 
> and how do I get rid of the message?

The issue is that if you built an image that just depends on whichever
recipe builds enigma2-plugin-systemplugins-wirelesslan and you try and
install that into an image without something else depending on
wireless-tools, the build will fail.

Sometimes (like this case) these are genuine runtime dependencies and
you therefore just need to make the dependency visible to bitbake.
Sometimes these can be floating autodetected dependencies which should
wither have been in DEPENDS or turned off with PACKAGECONFIG.

In this case I'm going to guess that the plugin is part of a
PACKAGES_DYNAMIC and hence bitbake can't see the dependency until its
too late (once the package is built).

Adding the package name to PACKAGES would probably allow bitbake to
"see" it and avoid the problem.

Yes, bitbake could in theory go though all the RDEPENDS/RRECOMMENDS_*
variables and try and guess which ones to look at however it would kill
parsing time :/.

Cheers,

Richard




