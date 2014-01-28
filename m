Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 90CEA60CEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 11:33:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0SBXcpl022592; Tue, 28 Jan 2014 11:33:38 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vARdCzRpIi8a; Tue, 28 Jan 2014 11:33:38 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0SBXWbh022589
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 28 Jan 2014 11:33:34 GMT
Message-ID: <1390908807.21652.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 28 Jan 2014 11:33:27 +0000
In-Reply-To: <CAP9ODKoD9kif9pGiZyf-P2aKpbMFTUM8c2XUg7QUSZi5+BKnaA@mail.gmail.com>
References: <1390479065-24299-1-git-send-email-otavio@ossystems.com.br>
	<52E6D52D.4070908@windriver.com>
	<CAP9ODKoD9kif9pGiZyf-P2aKpbMFTUM8c2XUg7QUSZi5+BKnaA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory.bbclass: Improve robustness in image file listing
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
X-List-Received-Date: Tue, 28 Jan 2014 11:33:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-01-27 at 23:52 -0200, Otavio Salvador wrote:
> On Mon, Jan 27, 2014 at 7:52 PM, Randy MacLeod
> <randy.macleod@windriver.com> wrote:
> > On 14-01-23 07:11 AM, Otavio Salvador wrote:
> >>
> >> The filenames sometimes may have strange names. With the 'awk' script
> >> it handled a limited number of spaces in the filename and a package
> >> installing a file named "test file with spaces" would have its name
> >> truncated.
> >>
> >> This patch uses the find's printf formating to simplify the code and
> >> proper handle this case. From a testing image, the only diff produced
> >
> > s/proper/properly/
> >   Yes, I'm with the grammar police; we're here to be helpful.
> >
> >> is:
> >>
> >> ,----[ files-in-image.txt diff ]
> >> | --rwxr-xr-x root       root                0 ./usr/bin/test\ file\ with\
> >> | +-rwxr-xr-x root       root                0 ./usr/bin/test file with
> >> spaces
> >> `----
> >>
> >> The options used are available since findutils 4.2.5, released in 19
> >> Nov 2004, making it available in all supported host distributions.
> >
> >
> > Acked-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> >
> > Works for me, even on CentOS/RHEL-5.9/10 which does indeed have
> > findutils > 4.2.5:
> >
> > $ rpm -qf `which find`
> > findutils-4.2.27-6.el5
> >
> > and the find command seems to work as intended:
> >
> >  $ find jj -printf "%M %-10u %-10g %10s %p -> %l\n"  | cut -c 44-
> >  jj ->
> >  jj/usr ->
> >  jj/usr/bin ->
> >  jj/usr/bin/test file with spaces ->
> 
> Richard, do you want me to send a v2 or can you fix the typo when applying it?

I fixed this one up and merged it.

Cheers,

Richard


