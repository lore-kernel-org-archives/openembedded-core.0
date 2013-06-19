Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 39AFB601DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 07:57:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5J82dna005642; Wed, 19 Jun 2013 09:03:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id i5lu3gwz5ch7; Wed, 19 Jun 2013 09:03:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5J8377j005664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 19 Jun 2013 09:03:09 +0100
Message-ID: <1371628610.20823.155.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 19 Jun 2013 08:56:50 +0100
In-Reply-To: <51C11201.2010306@windriver.com>
References: <51C11201.2010306@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with buildtools-tarball / nativesdk-ncurses / nativesdk-python
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
X-List-Received-Date: Wed, 19 Jun 2013 07:57:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-06-18 at 21:05 -0500, Mark Hatle wrote:
> My host system's python version is too old due to the recent changes.  So I 
> built a temporary python 2.7.3 version.  Built the 'buildtools-tarball' and then 
> installed it.  When I switch to the included python it no longer works.
> 
> I did some digging, the problem in the end is related to ncurses within the 
> nativesdk.
> 
> Running the following:
>   py_v26_check=`python -c 'import sys; print sys.version_info >= (2,6,3)'`
> which python
> echo "$py_v26_check" | od -c
>   if [ "$py_v26_check" != "True" ]; then
>           echo "BitBake requires Python 2.7.3 or later"
>           exit 1
>   fi
> 
> You can see the difference in behavior:
> 
> TERM=xterm
> 
> /home/lmhatle/build-qemux86_64-2/buildtools/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/python
> 0000000 033   [   ?   1   0   3   4   h   T   r   u   e  \n
> 0000015
> BitBake requires Python 2.7.3 or later
> 
> -----
> 
> TERM=vt100
> 
> /home/lmhatle/build-qemux86_64-2/buildtools/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/python
> 0000000   T   r   u   e  \n
> 0000005
> 
> -----
> 
> So as you can see specifying a different terminal type is happily changing the 
> output of python.  When I use my locally built version, I don't get the same 
> behavior.  I always get the second version.
> 
> So is there a problem with the nativesdk python, nativesdk ncurses or???
> 
> (I've not yet filed a bug on this, but I will if I can't figure it out soon.)

We've seen this issue but I thought we'd fixed it.

Which version of master did you do this with? This was supposed to be
fixed by
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=c281cd149bdbce29fc69cb34c65c4295cfed2060 and http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=534c4d0f1e287d0ac82504b273a5497d3457582a

If you're still having problems, please strace the above python command
and see where its looking for terminfo...

Cheers,

Richard



