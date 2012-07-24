Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1StfWn-0001C7-1u
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 15:51:57 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 24 Jul 2012 06:40:27 -0700
Received: by qaeb19 with SMTP id b19so1583904qae.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 06:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=Z5uqhzHOmHZGsC/nH2FrtDB1xQJMb16/oF2yVx8ODUg=;
	b=OprCTnguyDC4gHy0r95/fDfdLwcN2lOvl69ZsDP5QCJbtPZCCw5W8WY/iyvsfFJbGQ
	MuyxZTxRr7nS7oNu8H44tZV0g9VK4YGZEHwCoYx8DUytrHqF3NO2MI+xvwvzwwVg0hWE
	zx17Wwis0Q8GFkH2Hg3nD83uUk68P2aEwMRYQg9e6vJ7BzpUCkkuD2W9VKdpQfuu07X1
	DqyWKCSNQTZPgAd1JOcEKMkkJpqq3h3ivPPkPPt5NJlhrAdRiCXDbf4f+bgdEDJSlMWQ
	qi2pqp7KosBbtzqx1II5EsYkbngBhg1Ioi7G0EpXMHN6KzIK4Zu+bbUA5sUJIDtFlPw8
	feAg==
Received: by 10.60.3.194 with SMTP id e2mr27282836oee.1.1343137225922; Tue, 24
	Jul 2012 06:40:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.33.4 with HTTP; Tue, 24 Jul 2012 06:40:05 -0700 (PDT)
In-Reply-To: <CABcZANkJhW+yER52vnbXSywxd-mhpNTPrFixL6R27thmMRmhMg@mail.gmail.com>
References: <1343052252-4154-1-git-send-email-radu.moisan@intel.com>
	<lywr1uzguj.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<500E50C5.8000403@intel.com>
	<CABcZANkJhW+yER52vnbXSywxd-mhpNTPrFixL6R27thmMRmhMg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Jul 2012 14:40:05 +0100
Message-ID: <CAJTo0LYT5Jup6SXnmA62+Wy8sua94BdB_VwuHJ8erK1gshaYFw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkaWUmRd51lYdMdZSW/rHlzDSH+gimMBksI5ovdGE1pxc/SR7z6iFKZ3gW+TJ+0zW5OqpYl
Subject: Re: [PATCH v2] kmod: Handle undefined O_CLOEXEC
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
X-List-Received-Date: Tue, 24 Jul 2012 13:51:57 -0000
Content-Type: text/plain; charset=UTF-8

On 24 July 2012 14:27, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, Jul 24, 2012 at 12:37 AM, Radu Moisan <radu.moisan@intel.com> wrote:
>> I have not tested on CentOS 5.8 if the applications are not broken in some
>> way, but that's not in the scope of this patch. If something does indeed
>> break, then a totally different patch is required, targeting a backport of
>> kmod for kernel older than 2.6.23.
>
> Personally, I'd rather see the build fail than have the tools behave
> incorrectly in some inexplicable way. If you haven't tested it, the
> patch shouldn't go in.

I was curious...

There are two commits in kmod where the cloexec changes were made:

http://git.profusion.mobi/cgit.cgi/kmod.git/log/?qt=grep&q=cloexec

The changes were a simple addition of the O_CLOEXEC flag, so this
patch is simply the union of those two commits.  A release of kmod
that doesn't require O_CLOEXEC has the same behaviour as this patch.
The problem O_CLOEXEC is solving isn't possible to solve cleanly
without it.  Using an older version of kmod instead of patching kmod
to work on older systems would result in more bugs and less features
for no win.

Ross


