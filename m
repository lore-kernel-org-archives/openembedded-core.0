Received: from avasout01.plus.net (avasout01.plus.net [84.93.230.227])
 by mx.groups.io with SMTP id smtpd.web11.19983.1625658818981288467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 04:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=ce7LGqgl;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.227, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id 167Sm7yQO7w2v167Tmj8jE; Wed, 07 Jul 2021 12:53:37 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=YueUu7QX c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=e_q4qTt1xDgA:10 a=4jvHjCYAWueBu1Xs12MA:9 a=CjuIK1q_8ugA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=+/wsa/TXgZEKiJZhshtr/6EskhrpQrcwVXnIcwYUafI=; b=ce
	7LGqglbDZomLuwgfBgCXBFr8eMOzh94ZWKiDwhv48MvKnAFVCUjBzrL3DnGhwF4PGrF8aEdOk+H+f
	1nj5xmqObjgbG8lHlrUTjv+aa1FpUEAkr1ndqUIxVCkQNSoq073EMZPzdWOS2DrnIDVva1PBMEJjG
	4JI0fzk8qeXACUcrWBNcko+H2irzncwgmkMoCQuOxFX0uPrbn5aDcNfOigifCTXqdTq/REo8/pCvj
	pCI3ojuztmayDmwUfXxGF0T6NCovkBylt0qqmUSPY5eoW43KcrG2yauk2uxM41//WnqhBmr6RxM8p
	VUPBy1lw3F/QyHxVWnzdz8WhN4o5Gpmg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1m167S-0000ax-M0
	for openembedded-core@lists.openembedded.org; Wed, 07 Jul 2021 12:53:34 +0100
Date: Wed, 7 Jul 2021 12:53:34 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: license.bbclass does not add recommends to dynamic packages
Message-ID: <20210707115334.GA498@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfGWgrSK59U3NMhmlIZFz8Bi1BL3Q0XRfCww8qyvFYKJwWw6rXpMr+Kv5s0RPmq+P45PGXWSgu2epgO+gcUgEaxzCD9Ysw3w/27sMYGlqKed/uoM7m1nH
 U3q+c6jL/uWsE4yA8jtq8mUBDTaZfmYJQeHxHd2fQJCGb7AaAHJmT9hKDxJShrhHWgkv2kAkHeLODg==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We're using LICENSE_CREATE_PACKAGE to create ${PN}-lic package files and
relying on the automatically generated recommends to cause them to be
installed in the image. This works well for most packages, but fails for
packages where we only install package created using PACKAGES_DYNAMIC.

For example, liborc is being installed in our image but that package lacks
a recommends for orc-lic, so the licences that apply to it are not being
installed. This is because license.bbclass:add_package_and_files iterates
only over the packages listed in PACKAGES.

Steps to reproduce on current master:

$ echo 'LICENSE_CREATE_PACKAGE = "1"' >> conf/local.conf
$ bitbake orc
$ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/orc_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
 Recommends: orc-lic
$ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/liborc-0.4-0_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
$

(I would have expected the last command to produce the same output as the
penultimate one.)

Even if I could fathom out how to fix orc and any other recipes so that they
did add the ${PN}-lic dependency, I'd be worried about not noticing that
the problem affected other recipes in the future.

Is there a way to teach license.bbclass:add_package_and_files to add the
${PN}-lic recommends for dynamic packages, or would it be necessary to
teach package.bbclass to do so?

Thanks.

Mike.
