Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 048166BD85
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 13:03:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r84DGPLV032576; Wed, 4 Sep 2013 14:16:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v3-sT_nPtkkk; Wed,  4 Sep 2013 14:16:25 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r84DGItB032568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 4 Sep 2013 14:16:20 +0100
Message-ID: <1378299789.1059.238.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 04 Sep 2013 14:03:09 +0100
In-Reply-To: <522690CF.6030707@windriver.com>
References: <CAFpw0gLn_s_SYaj9mMtYJvBfc1dqYEzYcXFn04J9+Xm1UroLeA@mail.gmail.com>
	<522690CF.6030707@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: GCC search paths in MinGW SDK
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
X-List-Received-Date: Wed, 04 Sep 2013 13:03:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-03 at 20:45 -0500, Mark Hatle wrote:
> On 9/3/13 4:13 PM, Francois Retief wrote:
> > Hi all,
> >
> > Thanks to Richard's recent improvements in the oe-core tree, I finally got my
> > first MinGW build to compile through and generate a SDK tarball.
> >
> > Next issue is that on windows GCC is unable to find the crt1.o, crti.o and
> > crtbegin.o files. when compiling a small hello world app (see gist
> > <https://gist.github.com/fgretief/6429416#file-mingw-gcc-verbose-output-2013-09-03>
> > [1] for gcc verbose output). I verified that the files are indeed in the SDK
> > folders and was correctly unpacked.
> >
> > Next, I checked the search path (-L) options and they point to the respective
> > directories where the files reside.
> >
> > Is it hard coded somewhere GCC should look for these files?  Can anyone give me
> > some pointers where to start looking?
> 
> Usually GCC can learn the location where it was executed from, and then use a 
> relative path from that to the location where the libc and other components are 
> located.

Right now, the SDK works using the --sysroot option explicitly. There is
a default coded into gcc but it may or may not be correct depending on
where it was extracted to. Ultimately we should relocate that using the
tricks we use on other binaries but even then we may want to use one
compiler against multiple different sysroots.

> > ps. I have noticed that there is a relocate_sdk.py file in the root of the SDK
> > folder. What is it's purpose and can it have anything to do with the GCC search
> > paths?
> 
> On linux we play with the RPATH and other components to ensure that the 
> executables can file the libraries for execution.  I don't believe that is a 
> problem on windows as the DLLs are searched automatically.

FWIW we avoided the issue by statically linking the windows binaries. 

Cheers,

Richard


