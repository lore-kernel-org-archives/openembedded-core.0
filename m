Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1S1naq-0006Tm-MJ
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 00:33:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1QNP41R019580
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 23:25:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18792-08 for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 23:25:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1QNOvvu019566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 23:24:58 GMT
Message-ID: <1330298698.31855.27.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 26 Feb 2012 23:24:58 +0000
In-Reply-To: <CAGDS+nk2zxHM05n1rKzW8q-sgOmiMCVdwRP_LvWJ-B+1_8hH5Q@mail.gmail.com>
References: <CAGDS+nk2zxHM05n1rKzW8q-sgOmiMCVdwRP_LvWJ-B+1_8hH5Q@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: elfutils - missing dependency on bzip2?
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
X-List-Received-Date: Sun, 26 Feb 2012 23:33:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-02-26 at 09:25 -0800, Steve Sakoman wrote:
> After a pull this morning the rebuild if elfutils fails with:
> 
> | /usr/bin/ld: cannot find -lbz2
> | collect2: ld returned 1 exit status
> | make[3]: *** [libdw.so] Error 1
> | make[3]: Leaving directory
> `/media/Work/yocto/tmp/work/i686-linux/elfutils-native-0.148-r5/elfutils-0.148/libdw'
> 
> If I build bzip2-native and then rebuild elfutils-native all is well
> and the build continues until the next failure (mesa-dri-glsl-native,
> fwiw, haven't investigated that one yet).

This sounds like there might be a floating dependency in elfutils on
bzip2, if its present. We probably need to lock that down one way or
another.

> Anyone else see this, or is it just another case of my build machines
> being in a strange state?

I've seen mesa-dri-glsl-native myself and if its the same issue, this is
something the signature changes have highlighted. It was there before,
that change just exposed it.

Basically, the problem is compile running twice. You could do it before
with something like:

bitbake mesa-dri-glsl-native
bitbake mesa-dri-glsl-native -c compile -f

We either need to fix these makefile issues or run "make clean" against
them before rerunning make.

Cheers,

Richard





