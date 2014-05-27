Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (unknown [83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id 215876FA81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 07:16:10 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Tue, 27 May 2014 09:15:59 +0200
Date: Tue, 27 May 2014 09:15:52 +0200
From: Anders Darander <anders@chargestorm.se>
To: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
Message-ID: <20140527071552.GB7185@ad.chargestorm.se>
Mail-Followup-To: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1401117992-30582-1-git-send-email-corneliux.stoicescu@intel.com>
	<20140527064629.GA7185@ad.chargestorm.se>
	<33115ABC4887814E8A92A08FBC93416B0A271EBD@IRSMSX103.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <33115ABC4887814E8A92A08FBC93416B0A271EBD@IRSMSX103.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 27 May 2014 07:16:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Stoicescu, CorneliuX <corneliux.stoicescu@intel.com> [140527 09:02]:
> > -----Original Message-----
> > From: Anders Darander [mailto:anders@chargestorm.se]
> > * Corneliu Stoicescu <corneliux.stoicescu@intel.com> [140526 15:23]:

> > > Sometimes the rootfs archive contains the kernel file
> > > (core-image-full-cmdline) or the dtbs files (core-image-sato). Adding
> > > verification to add them if they don't allready exist.

> > > Without this, the first condition would fail and the image deploy task would
> > stop.

> > What failure and errors are you seeing?


> '[ ! -e /mnt/testrootfs/boot/uImage ] && cp
> ~/test-kernel/mnt/testrootfs/boot/uImage' returns exit code 1 if the
> first condition is not met, and thus the deploy task fails. My version
> would return exit code 0 weather or not the first condition is met. 

Oh, that's right. If /mnt/testrootfs/boot/uImage do exist, we'll have an
exit code of 1... -ENOCOFFE like I said!

However, then I think that the commit message ought to be changed.
Reading the message, it sounds as you're adding a check to add uImage if
it doesn't exist. Rather, you're modifying the existing check to
gracefully handle the case where uImage already exists.

Could you update the commit message to better reflect the intention with
the change?

> We could also modify the way the commands are run to ignore that exit
> code but that would involve more changes, many of them not needed or
> expected by other commands and/or target controllers.

No, the above change is fine. We should error out if something goes
wrong, so I'd be against changing the way to run commands.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

