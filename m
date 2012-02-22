Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <brandon@rascalmicro.com>) id 1S0HKh-0002y6-6p
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 19:54:31 +0100
Received: by iaby12 with SMTP id y12so432364iab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 10:46:09 -0800 (PST)
Received-SPF: pass (google.com: domain of brandon@rascalmicro.com designates
	10.50.34.202 as permitted sender) client-ip=10.50.34.202; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	brandon@rascalmicro.com designates 10.50.34.202 as permitted
	sender) smtp.mail=brandon@rascalmicro.com
Received: from mr.google.com ([10.50.34.202])
	by 10.50.34.202 with SMTP id b10mr28633975igj.2.1329936369870 (num_hops
	= 1); Wed, 22 Feb 2012 10:46:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.34.202 with SMTP id b10mr23191112igj.2.1329936369782; Wed,
	22 Feb 2012 10:46:09 -0800 (PST)
Received: by 10.231.199.138 with HTTP; Wed, 22 Feb 2012 10:46:09 -0800 (PST)
X-Originating-IP: [146.115.15.122]
In-Reply-To: <1329932828.32110.6.camel@ted>
References: <CA+b4E8x4_cCvhUw-UgLK=9ymuoXsiih8BMZc=ts0B7Qf=oaNuQ@mail.gmail.com>
	<1329912732.20261.110.camel@ted>
	<CA+b4E8znKGcGq=3q+SXn6+N=A9o9Z=rkrVjT3Pf4v7CMBtipzg@mail.gmail.com>
	<1329932828.32110.6.camel@ted>
Date: Wed, 22 Feb 2012 13:46:09 -0500
Message-ID: <CA+b4E8znHQ3oXSH9y-iWi_Sy7WkJEjNunVkKKWAWTTJTWCzN7A@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkgIJ5cRTh8YoveEgkPhpcSk7oy5bXfu3x/y7D9DsbNu01yHjTj5c0hhA33tV4GtPfm5zrq
Subject: Re: Cannot satisfy the following dependencies for task-core-basic: libusb-compat (>= 0.1.3)
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
X-List-Received-Date: Wed, 22 Feb 2012 18:54:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 22, 2012 at 12:47 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> If you look at the tmp/deploy/ipk/*/Packages index file, you should see
> the dependencies of each package listed. It would be interesting to see
> if something is depending on "libusb-compat". If there is something I'd
> be tempted to try running "bitbake xxx -c cleansstate" and rebuilding
> that specific recipe.

Victory!

Looking at the Packages file, it appears that gnupg depends on libusb-compat.

I then ran this series of commands:

bitbake gnupg -c cleansstate
bitbake -c clean core-image-basic
bitbake core-image-basic

These tasks all completed successfully. Thank you, Richard, for taking
the time to point me in the right direction.

One last question-- somehow, the first build of gnupg was expecting to
find libusb-compat by the wrong name. This was cached in sstate, and a
subsequent build fixed it. Why would it work the second time if the
recipe was unchanged?

Cheers,
Brandon


