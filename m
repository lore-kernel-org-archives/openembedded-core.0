Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 107A761227
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 10:33:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBAAX073021786; Tue, 10 Dec 2013 10:33:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DHC27iIGT_ls; Tue, 10 Dec 2013 10:33:00 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBAAWu8O021766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 10 Dec 2013 10:32:58 GMT
Message-ID: <1386671571.4332.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2013 10:32:51 +0000
In-Reply-To: <CAMKF1sqhu=WJb-OvKsoPO+0R-aB7=yMQFk4JD+iD0VnHMbnQFg@mail.gmail.com>
References: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
	<1386589722.25847.79.camel@ted>
	<CAMKF1sokZrHWRn_2RGT3pKN_RZMy1MnvXCUXn-gDdm4p-1iHvQ@mail.gmail.com>
	<1386625884.25847.100.camel@ted>
	<CAMKF1sqhu=WJb-OvKsoPO+0R-aB7=yMQFk4JD+iD0VnHMbnQFg@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: Convert ??= weaker assingment to weak ?= assignment
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
X-List-Received-Date: Tue, 10 Dec 2013 10:33:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-12-09 at 15:11 -0800, Khem Raj wrote:
> On Mon, Dec 9, 2013 at 1:51 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2013-12-09 at 09:34 -0800, Khem Raj wrote:
> >> On Mon, Dec 9, 2013 at 3:48 AM, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >> >
> >> > To illustrate why I'm struggling to follow this, "bitbake boost -e |
> >> > grep BOOST_LIBS" on OE-Core does not show python in the list...
> >> >
> >>
> >>
> >> I can see it. Its on debian python is 2.7.3
> >>
> >> kraj@builder:~$ cat /etc/os-release
> >> PRETTY_NAME="Debian GNU/Linux 7 (wheezy)"
> >> NAME="Debian GNU/Linux"
> >> VERSION_ID="7"
> >> VERSION="7 (wheezy)"
> >> ID=debian
> >> ANSI_COLOR="1;31"
> >> HOME_URL="http://www.debian.org/"
> >> SUPPORT_URL="http://www.debian.org/support/"
> >> BUG_REPORT_URL="http://bugs.debian.org/"
> >
> > I doubt its host OS that is causing this, more likely something to do
> > with the configuration you have (I'm using python 2.7.5+ on Ubuntu
> > 13.10). Which DISTRO is this? Which layers are enabled? Which version of
> > bitbake?
> >
> 
> all is latest from yesterday config wise I am building angstrom. now I did both
> with angstrom and with OE-Core only and you are right it appears to
> work with OE-Core alone
> 
> see
> 
> http://paste.ubuntu.com/6548349/
> 
> for angstrom version see
> 
> http://paste.ubuntu.com/6548360/
> 
> 
> I will dig more into it a bit and see how PACKAGECONFIG can be bad in
> angstrom's case

Looking at those pastebins, it shows up as a python function since the
"python" flag is set. That shouldn't do anything too bad to the variable
though:

python PACKAGECONFIG () {
}

In one case it has the value python, in the other it does not. Its all
very odd. I wonder if "bitbake -e" shows it taking any value? There has
to be something in the Angstrom setup which is triggering this...

Cheers,

Richard


