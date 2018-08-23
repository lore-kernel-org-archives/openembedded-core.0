Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 92ABC7953B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:27:57 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7N8RncA012245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 23 Aug 2018 09:27:50 +0100
Message-ID: <5a6bf05b6a04f09ed3f148c996a2b6d0d562924d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>
Date: Thu, 23 Aug 2018 09:27:49 +0100
In-Reply-To: <CAJ86T=W5cVZ+VEdRVi96-QRx5BhmTPpWZ1HU29UuXhmrZbS6Xg@mail.gmail.com>
References: <20180816062633.29868-1-anuj.mittal@intel.com>
	<CAJ86T=Wzi5hzFUfChDLKTDyKf+X9_EUjFvPE9wfSp5UXaQycaA@mail.gmail.com>
	<188b139f-5d52-b2e3-fdd7-e231deb56052@intel.com>
	<CAJ86T=W5cVZ+VEdRVi96-QRx5BhmTPpWZ1HU29UuXhmrZbS6Xg@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: enable profile optimized builds
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
X-List-Received-Date: Thu, 23 Aug 2018 08:27:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-22 at 18:44 -0700, Andre McCurdy wrote:
> On Thu, Aug 16, 2018 at 9:48 PM, Anuj Mittal <anuj.mittal@intel.com>
> wrote:
> > On 08/17/2018 03:31 AM, Andre McCurdy wrote:
> > > On Wed, Aug 15, 2018 at 11:26 PM, Anuj Mittal <anuj.mittal@intel.
> > > com> wrote:
> > > Is it important to re-create the profile data during every build
> > > or
> > > would we get most of the same benefits from using reference data
> > > which
> > > is generated offline?
> > 
> > We should get the same benefit using the data generated offline as
> > long
> > as the source code/configure options/flags are same I believe. I
> > have
> > only tried with data generate offline using the same build
> > configuration
> > though.
> 
> As an additional data point, python do_compile now takes approx 18
> minutes on my laptop. A single qemu-i386 thread loading one CPU core
> at 100%, with nothing else being scheduled in parallel for most of
> that time.
> 
> If we can get most of the benefits of pgo with a pre-generated data
> file then that might still be something to explore.

I've also noticed the increased build times. I'd love to see if we
could create an sstate object which would contain the pgo data and
which didn't depend on the usual compiler/toolchain pieces, only the
do_patch stage checksum. In theory, the same sstate object should be
reusable between target/native/nativesdk too as long as we had the same
python patchset (which I know we don't for native).

Anyone fancy such a challenge? We should probably have a bug open for
this at least...

Cheers,

Richard


