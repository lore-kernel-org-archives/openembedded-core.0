Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDCTW-0004xH-Fo for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 12:21:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TABx4B029477
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 11:11:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28549-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 11:11:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TABoEE029470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 11:11:51 +0100
Message-ID: <1333015910.14983.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 11:11:50 +0100
In-Reply-To: <CAK18fxGcvp9gYr7efBPxnaH27zOgzy8VS=KWcHwo4UttP55Ghw@mail.gmail.com>
References: <CAK18fxGcvp9gYr7efBPxnaH27zOgzy8VS=KWcHwo4UttP55Ghw@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Problem with perl upstream link
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
X-List-Received-Date: Thu, 29 Mar 2012 10:21:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-28 at 21:02 +0300, Andrei Gherzan wrote:
> From time to time my build crashes after trying to unpack the
> downloaded perl package:
> Check the log here:
>
> ERROR: Logfile of failure stored in:
> BUILD/tmp-eglibc-eglibc/work/i686-linux/perl-native-5.14.2-r0/temp/log.do_unpack.14775
> Log data follows:
> | NOTE: Unpacking
> BUILD/tmp-eglibc-eglibc/work/i686-linux/perl-native-5.14.2-r0/
> |
> | gzip: stdin: invalid compressed data--crc error
> | tar: Child returned status 1
> | tar: Error is not recoverable: exiting now
> | ERROR: Function failed: Unpack failure for URL:
> 'http://www.cpan.org/src/5.0/perl-5.14.2.tar.gz'. Unpack command
> PATH="..." tar xz --no-same-owner -f DOWNLOADS/perl-5.14.2.tar.gz
> failed with return value 2
> NOTE: package perl-native-5.14.2-r0: task do_unpack: Failed
>
> To check the remote i did a simple test:
>
> wget http://www.cpan.org/src/5.0/perl-5.14.2.tar.gz
> --2012-03-28 21:09:11--
>  http://www.cpan.org/src/5.0/perl-5.14.2.tar.gz
> Resolving www.cpan.org... 207.171.7.177, 199.15.176.140,
> 2620:101:d000:8::140:1, ...
> Connecting to www.cpan.org|207.171.7.177|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 15223598 (15M) [application/octet-stream]
> Saving to: `perl-5.14.2.tar.gz'
>
> 100%[=======================================================================================================================================>] 15,223,598  1.07M/s   in 99s
>
> 2012-03-28 21:10:52 (151 KB/s) - `perl-5.14.2.tar.gz' saved
> [15223598/15223598]
>
> tar xz --no-same-owner
> -f /media/HDD-WRS/yocto/2012-03-28-18-49-yocto-ve/../downloads/perl-5.14.2.tar.gz
>
> gzip: stdin: invalid compressed data--crc error
> tar: Child returned status 1
> tar: Exiting with failure status due to previous errors
>
> Anybody knows about this issue?

I tried the above and it seems to be ok for me.

Several things come to mind:

a) Is the checksum of the file ok?
b) what versions of tar and gzip do you have?

If the checksum is ok, I suspect the problem is in b). We do have some
workarounds in the system to deal with broken versions of tar and gzip.
You'd have to see the logs to see which versions were problematic. We do
usually avoid problems but there was recently a regression in that code
which was subsequently fixed which might have exposed you to this.

If the checksum is not ok, I'd have to wonder why the fetch didn't fail
with a bad checksum.

Cheers,

Richard




