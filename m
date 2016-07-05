Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ABFCB60116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 22:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u65MR8A9009214; Tue, 5 Jul 2016 23:27:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mIP4PIlqxhO2; Tue,  5 Jul 2016 23:27:08 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u65MR4OM009211
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 5 Jul 2016 23:27:05 +0100
Message-ID: <1467757624.8590.207.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 05 Jul 2016 23:27:04 +0100
In-Reply-To: <CAMKF1squ8mH9Aq9k1j9PZ=KDPp02DagQtuf9tWrrSqZ6XEMr4A@mail.gmail.com>
References: <CAJ86T=XCwABdHj0rXHFsfK9pLndsKGQYv8R2=jOh4tz_9HmeAQ@mail.gmail.com>
	<CAJTo0LZjsiwdv6QB1SdDmyxtTvByjyiend_uSnXFQ_tRi8HwcA@mail.gmail.com>
	<CAJ86T=UTXq=aPkTRV1U+aN71KO3hCyz+fsT45=Mbm8ALZvPmiA@mail.gmail.com>
	<CAMKF1squ8mH9Aq9k1j9PZ=KDPp02DagQtuf9tWrrSqZ6XEMr4A@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Automatically creating tar files for bin_package.bbclass
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
X-List-Received-Date: Tue, 05 Jul 2016 22:27:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-07-05 at 08:12 -0700, Khem Raj wrote:
> On Tue, Jul 5, 2016 at 1:21 AM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > On Mon, Jul 4, 2016 at 8:58 AM, Burton, Ross <ross.burton@intel.com
> > > wrote:
> > > 
> > > On 4 July 2016 at 16:00, Andre McCurdy <armccurdy@gmail.com>
> > > wrote:
> > > > 
> > > > Say I have a proprietary library which only I can build from
> > > > source
> > > > and I have a conventional recipe which builds it within OE. I
> > > > would
> > > > now like to create a tar file of the library and headers etc,
> > > > plus a
> > > > companion recipe based on bin_package.bbclass to allow others
> > > > to make
> > > > use of the library in their OE builds. ie the situation
> > > > described
> > > > here:
> > > > 
> > > > http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.ht
> > > > ml#packaging-externally-produced-binaries
> > > > 
> > > > Is there a recommended way to create the tar file to support
> > > > that?
> > > > e.g. a class which automatically creates a deployable tar file
> > > > of a
> > > > recipe's ${D} directory?
> > > 
> > > You *may* be able to use package_tar in the recipe in some way to
> > > achieve
> > > this.
> > 
> > It only seems to support creating tar files after packages have
> > been
> > split ( ie individual tar files for each subdirectory under
> > ${WORKDIR}/packages-split ). I don't think it's going to be
> > directly
> > useful for creating a tar file of ${D}.
> 
> package_tar is just another packaging format here so you will get
> individual package separately
> you might want to add another class to package everything into 1
> thats
> a separate issue, you have
> to either add this via a bbclass or additional function

Personally, I think that involving package_tar is likely going to
overcomplicate this, as is packaging up the already separated out
packages.

Better to provide the output as do_install would leave it in ${D}, and
then let packaging happen as the user has configured. Only tricky part
would be the lack of source for the debugging symbols but if you can't
release the source you'd want to "fix" that anyway.

This way you don't need to worry if your tarball matches the users
package configuration options (which backend, which packaging options
etc.).

Cheers,

Richard



