Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 05A4A601A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 21:34:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s42LYFDQ023628; Fri, 2 May 2014 22:34:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HqowGzre2GJ2; Fri,  2 May 2014 22:34:15 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s42LYBPD023616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 2 May 2014 22:34:13 +0100
Message-ID: <1399066445.12731.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 02 May 2014 22:34:05 +0100
In-Reply-To: <CANyK_8f74ZEqzX1ve=93GnZ7fg1NEiZUVeOKmmHuY+kHX-UseA@mail.gmail.com>
References: <CANyK_8f74ZEqzX1ve=93GnZ7fg1NEiZUVeOKmmHuY+kHX-UseA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Ensuring a task is re-ran when local.conf is updated
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
X-List-Received-Date: Fri, 02 May 2014 21:34:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-05-02 at 17:43 +0100, Paul Barker wrote:
> Hi all, I'm wondering if someone can help me debug this problem a
> little as it's getting into the parts of bitbake I don't know very
> well, in particular the determination of whether a task needs to
> re-run or not.
> 
> I've attached a patch which adds code to do_package_write_ipk in
> package_ipk.bbclass to split up the package feed if
> IPK_HIERARCHICAL_FEED is set to "1". The commit message in the patch
> explains why I'm doing this and if it all works I'll submit this to
> master. The attached patch isn't ready for submission yet, it needs
> more testing first.
> 
> As expected, if IPK_HIERARCHICAL_FEED is not set in local.conf, the
> package feed is created in the old way. If IPK_HIERARCHICAL_FEED is
> set to "1" in local.conf, the package feed is created in my modified
> way. This was tested by building from scratch in each case, with no
> sstate or tmp directory present.
> 
> However if IPK_HIERARCHICAL_FEED is changed in local.conf, the package
> feed is not recreated. I can force do_write_package_ipk and the new
> value is taken into account, but if I just do my usual 'bitbake
> kitchen-sink' where kitchen-sink is a packagegroup which depends on
> everything I want in the package feed, do_write_package_ipk is not
> re-ran for any recipe.
> 
> Am I missing something here? Is it expected that this variable change
> is detected and the relevant tasks re-executed? I know changing
> variables like PREFERRED_PROVIDER_* in local.conf causes things to be
> rebuilt, so why does that work and this not?

This should work, I'm not sure why it wouldn't. The code should be able
to detect the dependency on the IPK_HIERARCHICAL_FEED variable and
notice when the value changes.

I'd have to experiment with some builds to figure out anything further
but its probably worth opening a bug report as it sounds broken.

bitbake-dffsigs on a siginfo file of a do_package_write_ipk is where to
start with debugging, it should show the dependency on the variable.

Cheers,

Richard


