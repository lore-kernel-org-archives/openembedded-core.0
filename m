Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB0y8-00066z-L6 for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 10:39:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2N9UJRr024999;
	Fri, 23 Mar 2012 09:30:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23109-06; Fri, 23 Mar 2012 09:30:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2N9U8ox024993
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 23 Mar 2012 09:30:10 GMT
Message-ID: <1332495011.9740.384.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: niqingliang@insigma.com.cn, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 09:30:11 +0000
In-Reply-To: <1332491527.11882.40.camel@localhost.localdomain>
References: <1331799506.1041.55.camel@localhost.localdomain>
	<4F621801.4000308@windriver.com>
	<1331875115.1041.67.camel@localhost.localdomain>
	<4F635E14.7000707@windriver.com>
	<1332235259.1041.92.camel@localhost.localdomain>
	<1332319539.11882.11.camel@localhost.localdomain>
	<1332491527.11882.40.camel@localhost.localdomain>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gconf build error
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
X-List-Received-Date: Fri, 23 Mar 2012 09:39:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 16:32 +0800, Ni Qingliang wrote:
> Hello,
> 
> I have made some progress after struggled a few days on it. found that
> the reason is located in the 'ld'.
> following is my investigation (focused on the IMPLICIT depended
> library):
> 
> 1. call ld with sysroot and rpath
> $ld --sysroot=/media/pangu/lsbt/tmp/sysroots/qemux86-64 ...
> -rpath /usr/lib/../lib
> 
> then it will find the lib needed in the host's rootfs, that will result
> error.
> 
> 2. call ld with sysroot and without rpath
> $ld --sysroot=/media/pangu/lsbt/tmp/sysroots/qemux86-64 ... 
> 
> then it will find the lib needed in the directory sysroot arg specified.
> that is expected.
> 
> I found that using the --verbose argument. Is the behaviour expected? or
> a bug? 

That behaviour is expected. You should not be passing rpath /usr/lib
options to ld.

Cheers,

Richard



