Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UDD6j-00066d-3n for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 13:06:19 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r26BvTf8019729; Wed, 6 Mar 2013 11:57:30 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gkDqcD3WZACx; Wed,  6 Mar 2013 11:57:29 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r26BvKek019718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 6 Mar 2013 11:57:24 GMT
Message-ID: <1362570557.11727.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 06 Mar 2013 11:49:17 +0000
In-Reply-To: <69be0b1aae50eb097172bcfa2e9aa02157f62436.1360499939.git.enrico.scholz@sigma-chemnitz.de>
References: <7acaf76adbd1f0c29b17da721267392533d3a703.1360499939.git.enrico.scholz@sigma-chemnitz.de>
	<69be0b1aae50eb097172bcfa2e9aa02157f62436.1360499939.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] package.bbclass: use oe.path.realpath()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2013 12:06:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-02-10 at 13:41 +0100, Enrico Scholz wrote:
> oe.path.realpath() provides are common and more correct implementation
> for resolving symlinks within sysroot. Use it.
> 
> Old implementation suffered from lot of problems; e.g.
> 
> * redundant code
> 
> * calls 'os.stat()' which references files on host; this can give wrong
>   results about existing/non-existing and can cause EPERM (instead of
>   the catched ENONENT) exceptions
> 
> * does not deal with special cases like '..' leaving the sysroot.

Whilst these changes are good, they do come at a cost:

post symlink package changes
./perfscript -c 8c22531e491e6b0cfffaaa80d6bc75db757fc1d1
49:38.46,17:12.15

pre symlink package changes
./perfscript -c 1a80329b3fcf23ecc23e409a260b9b2182652f65
48:16.33,13:39.97

So it added 1m20 to the overall build time, but more worryingly, added
added nearly 3m30 to the time for:

bitbake virtual/kernel -c cleansstate; bitbake virtual/kernel

These tests are based on the script linked from
https://wiki.yoctoproject.org/wiki/Performance_Test where the kernel
test is this is the second number above list, overall build time is the
first.

Have you any time to look into this performance regression?

FWIW, "bitbake virtual/kernel -c package -P -f" shows that
package_fixsymlinks() takes a rather long time in the profile output.

Cheers,

Richard



