Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SDEQa-0007qC-3t
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 14:26:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1FDF1315AA05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 14:17:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id qY6fhqqvavep
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 14:16:56 +0200 (CEST)
Received: from [172.22.22.61] (drms-590cf1a1.pool.mediaWays.net
	[89.12.241.161])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id A6B5B315AA08
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 14:16:56 +0200 (CEST)
Message-ID: <4F7452B7.8060409@opendreambox.org>
Date: Thu, 29 Mar 2012 14:16:55 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Python egg-info/pth
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
X-List-Received-Date: Thu, 29 Mar 2012 12:26:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

many python packages install egg-info files or directories and/or pth
files inside the site-packages directory.

AFAICT, egg-info is used to provide multiple versions of python
site packages, if required, if no package manager like opkg is
involved. Since this is not the case in OE, it only serves as a way
for python programs to depend on specific versions of a python site
package. This doesn't make much sense, because package version
dependencies should already be handled by opkg (or rpm or deb).

So I'd like to understand whether it's useful to ship them at all or
to package them separately. For example, python-twisted installs the
following files:

WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/top_level.txt
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/requires.txt
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/SOURCES.txt
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/PKG-INFO
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/dependency_links.txt
WARNING:   /usr/lib/python2.7/site-packages/Twisted-12.0.0-py2.7.egg-info/not-zip-safe

Twisted gets split into many sub-packages and an empty meta package.
If the egg-info gets packaged into the meta package, it wouldn't be
available if someone just installed twisted-web, for example.

Long story short: I don't see how egg-info can be useful in OE. How
about removing egg-info in setuptools.bbclass or moving it to ${PN}-metadata
for all python packages?

How about pth files? Are they meaningful in an OE environment?

Regards,
Andreas


