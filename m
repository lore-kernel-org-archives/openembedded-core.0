Return-Path: <anders@chargestorm.se>
X-Greylist: delayed 328 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 May 2014 06:52:03 UTC
Received: from stoexhubfe02.domain01.net (unknown [83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id D596C6FA6A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 06:52:03 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Tue, 27 May 2014 08:46:36 +0200
Date: Tue, 27 May 2014 08:46:29 +0200
From: Anders Darander <anders@chargestorm.se>
To: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Message-ID: <20140527064629.GA7185@ad.chargestorm.se>
Mail-Followup-To: Corneliu Stoicescu <corneliux.stoicescu@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1401117992-30582-1-git-send-email-corneliux.stoicescu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1401117992-30582-1-git-send-email-corneliux.stoicescu@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/controllers/beaglebonetarget.py: add conditions for files copied to /boot
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
X-List-Received-Date: Tue, 27 May 2014 06:52:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Corneliu Stoicescu <corneliux.stoicescu@intel.com> [140526 15:23]:

> Sometimes the rootfs archive contains the kernel file
> (core-image-full-cmdline) or the dtbs files (core-image-sato). Adding
> verification to add them if they don't allready exist.

> Without this, the first condition would fail and the image deploy task would stop.

What failure and errors are you seeing?

> -                '[ ! -e /mnt/testrootfs/boot/uImage ] && cp ~/test-kernel /mnt/testrootfs/boot/uImage',
> +                'if [ ! -e /mnt/testrootfs/boot/uImage ]; then cp ~/test-kernel /mnt/testrootfs/boot/uImage; fi',

It might be that I've had no coffee yet, but I can't see what difference
your change is making (apart from being more verbose)?

The original code checks for the existance of
/mnt/testrootfs/boot/uImage, negates the result and copies the
test-kernel if the negated result is true, i.e. if
/mnt/testrootfs/boot/uImage doesn't exist, copy the test-kernel.

> -            self.deploy_cmds.append('[ ! -e /mnt/testrootfs/boot/{0} ] && cp ~/{0} /mnt/testrootfs/boot/'.format(dtbfn))
> +            self.deploy_cmds.append('if [ ! -e /mnt/testrootfs/boot/{0} ]; then cp ~/{0} /mnt/testrootfs/boot/'.format(dtbfn) + '; fi')

See above...

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

