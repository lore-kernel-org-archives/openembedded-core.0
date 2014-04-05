Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 958EF617AA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Apr 2014 09:33:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s359XeXb010744; Sat, 5 Apr 2014 10:33:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2ph6uQtwtv-p; Sat,  5 Apr 2014 10:33:40 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s359XYa0010740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 5 Apr 2014 10:33:35 +0100
Message-ID: <1396690408.13862.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Sat, 05 Apr 2014 10:33:28 +0100
In-Reply-To: <533FBEDD.3030902@windriver.com>
References: <CALbNGRR3cOLUR+HBKkfSqLMRL75sn7uzEace23KJLYy43F1Vtg@mail.gmail.com>
	<CALbNGRShXafNdCYR62h3tpQ4RLTXyZTgvrs0xBOhsn_Z57=sdg@mail.gmail.com>
	<533EE97D.90207@windriver.com> <533FBEDD.3030902@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: util-macros.do_package failed Re: Build failure
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
X-List-Received-Date: Sat, 05 Apr 2014 09:33:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-04-05 at 16:29 +0800, Robert Yang wrote:
> 
> On 04/05/2014 01:18 AM, Robert Yang wrote:
> >
> > Hi Andreas,
> >
> > I met the error on the master, we seldom met this error, but we did meet
> > it once in a while, I did several rough investigations, I think that the
> > problem is happened when etc/passwd is being created but is null before
> > write anything into it, and the util-macros.do_package runs right at the
> > same time, here is a hack way to reproduce it: (Use qemux86 as an example):
> >
> > $ bitbake base-passwd
> >
> > # Move the passwd file
> > $ mv tmp/sysroots/qemux86/etc/passwd tmp/sysroots/qemux86/etc/passwd.bak
> >
> > # Create a passwd file which is null
> > $ touch tmp/sysroots/qemux86/etc/passwd
> >
> > $ bitbake util-macros
> >
> > Then we will see the errors.
> >
> > The build is be OK if there is no tmp/sysroots/qemux86/etc/passwd, maybe
> > the pwd.getpwnam() reads the host's /etc/passwd when there is no
> > tmp/sysroots/qemux86/etc/passwd (not sure about this). but it would fail
> > if it exists and is null.
> >
> > Maybe we can let the do_package depend on base-passwd:do_populate_sysroot
> > to fix the problem.
> >
> 
> It seems that this is not a good idea since once we add the following line,
> it would cause all the target recipe's do_package depends on
> base-passwd:do_populate_sysroot, this would cause the arch "all" depends on
> eglibc since base-passwd depends on eglibc, we may need fix in another way.
> 
> do_package[depends] += "base-passwd:do_populate_sysroot"

This is very similar to the issue:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5612

I think I'm leaning in favour of putting in a basic passwd/group file
into the sysroot, even if we have to maintain such a copy ourselves.

Cheers,

Richard


