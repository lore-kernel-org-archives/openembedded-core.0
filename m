Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id AB3C46C73D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 13:43:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKDhqhD019525; Wed, 20 Nov 2013 13:43:52 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id z69DgXEBP0YK; Wed, 20 Nov 2013 13:43:52 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKDhm6k019517
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 20 Nov 2013 13:43:50 GMT
Message-ID: <1384955025.16887.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Wed, 20 Nov 2013 13:43:45 +0000
In-Reply-To: <528CAEDA.7000107@topic.nl>
References: <528CA4B0.3060907@topic.nl> <528CA4D3.6020109@topic.nl>
	<20131120122945.GN3708@jama> <528CAEDA.7000107@topic.nl>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: tslib keeps failing on checksum
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
X-List-Received-Date: Wed, 20 Nov 2013 13:43:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2013-11-20 at 13:45 +0100, Mike Looijmans wrote:
> ﻿On 11/20/2013 01:29 PM, Martin Jansa wrote:
> > On Wed, Nov 20, 2013 at 01:02:27PM +0100, Mike Looijmans wrote:
> >> ﻿On 11/20/2013 12:09 PM, Mike Looijmans wrote:
> >>> On 11/20/2013 11:38 AM, Martin Jansa wrote:
> >>>> On Wed, Nov 20, 2013 at 11:01:36AM +0100, Mike Looijmans wrote:
> >>>>> ﻿I get this error every time I try t build the current oe-core master:
> >>>>>
> >>>>> ERROR: Checksum failure fetching
> >>>>> https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.xz;downloadfilename=tslib-1.1.tar.xz
> >>>>>
> >>>>> ERROR: Function failed: Fetcher failure for URL:
> >>>>> 'https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.xz;downloadfilename=tslib-1.1.tar.xz'.
> >>>>>
> >>>>> Checksum mismatch!
> >>>>> File: '/home/mike/zynq-next/build/downloads/tslib-1.1.tar.xz' has md5 checksum
> >>>>> d41d8cd98f00b204e9800998ecf8427e when 14771f8607b341bb4b297819d37e837d was
> >>>>> expected
> >>>>>
> >>>>> Now the weird thing is, that when I fetch the thing using wget, I get ablob
> >>>>> with the right checksum:
> >>>>>
> >>>>> # wget https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.xz
> >>>>> # md5sum tslib-1.1.tar.xz
> >>>>> 14771f8607b341bb4b297819d37e837d  tslib-1.1.tar.xz
> >>>>>
> >>>>> Is oe-core using some other flavour of wget or what else could cause this kind
> >>>>> of fetch error?
> >>>>
> >>>> Have you tried to unpack both tarballs and compare content in them?
> >>>
> >>> Nope, I just assumed they're two somewhat different copies of the same
> >>> software (e.g. one of them has a "downloaded from here" remark or so).
> >>> Anything in particular I should look for?
> >
> > Any difference is important, sometimes you can find there HTML code from some
> > proxy or server which generates HTML page instead of 404 or someone
> > trying to sell you domain of long dead project etc
> >
> >> After upgrading I tried again. The file as downloaded by bitbake is completely
> >> empty. Nothing in it. The md5 sum of this empty file is
> >> d41d8cd98f00b204e9800998ecf8427e indeed.
> >>
> >> I'm now using bitbake 1.21.0 (current master) and OE rev
> >> 0eb947454e1c92467283e6f1adeca67c7c57698b to build with, with the above results
> >> still.
> >
> > OK, I was asking mostly because newer bitbake (1.19+ is new enough)
> > renames file with bad checksum, moving corrupted download aside so it
> > doesn't stand in way for new one.
> >
> >> (I know I can just move my own file into the download directory and get on
> >> with it, but i'd rather actually solve this problem).
> >>
> >> There's a direct connection to the internet, no proxy (just a router) that
> >> might have been caching things.
> >>
> >> Any suggestions?
> >
> > Check log.do_fetch in WORKDIR/temp, I'm not sure if the error shows only
> > the original URL or also possible (PRE)MIRROR url from which it could
> > download that empty file.
> >
> > You should see the exact URL in log.do_fetch.
> 
> The problem seems to be that I am "my own mirror". There's a http server that 
> serves sstate-cache and downloads to the rest of the company. And via an NFS 
> mount, that dir is also linked to my local downloads directory. So bitbake 
> ended up executing:
> 
> /usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate -O 
> /home/mike/zynq-next/build/downloads/tslib-1.1.tar.xz -P 
> /home/mike/zynq-next/build/downloads 
> 'http://192.168.80.24/sources/tslib-1.1.tar.xz'
> 
> This would create an empty file "tslib-1.1.tar.xz" and the http server happily 
> returns that empty file, and then bitbake thinks it all went well.
> 
> I removed the link to the NFS mount, and now it works.
> 
> Weird that only tslib suffers from this. Then again, it's probably just the 
> only package that wasn't readily available.
> 
> Is this my mistake and don't do this again, or should there be some protection 
> against fetching your own files? (for example, by NOT using the filename 
> itself as a target, but download with a ".part" extension and then rename when 
> done. This also helps when multible builds share the download dir).

We certainly don't support circular references like this. As you
mention, we can work around some parts with the .part approach but for
things like git repositories for example things are much harder to
ensure they work.

I'm not even sure how we'd detect this kind of situation to be honest,
I'm open to ideas though.

Sharing a "live" DL_DIR is probably a bad idea as files may be
incomplete, etc. The checksums do at least help catch most of the
problems.

Cheers,

Richard


