Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAIPd-0007vu-GN for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 11:05:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2L9u8pM000391
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 09:56:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29720-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 09:56:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2L9tvr0000385
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 09:55:58 GMT
Message-ID: <1332323759.9740.126.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 09:55:59 +0000
In-Reply-To: <857BE142E5399E46B20FD45B9DB8A7BC0FD0349C@SHSMSX102.ccr.corp.intel.com>
References: <857BE142E5399E46B20FD45B9DB8A7BC0FD0349C@SHSMSX102.ccr.corp.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: packaging errors in some -nativesdk recipes
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
X-List-Received-Date: Wed, 21 Mar 2012 10:05:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 04:45 +0000, Lu, Lianhao wrote:
> When I'm looking at some package warnings of eglibc-nativesdk(and some
> other -nativesdk packages' warnings), e.g.
> 
> WARNING: For recipe eglibc-nativesdk, the following files/directories
> were installed but not shipped in any package:
> WARNING:   /opt/poky/1.1
> +snapshot/sysroots/x86_64-pokysdk-linux/lib/libthread_db.so.1
> WARNING:   /opt/poky/1.1
> +snapshot/sysroots/x86_64-pokysdk-linux/lib/libnss_hesiod-2.13.so
> WARNING:   /opt/poky/1.1
> +snapshot/sysroots/x86_64-pokysdk-linux/lib/libSegFault.so
> ...... ......
> 
> I found this has something to do with the usage of PKGSUFFIX in
> eglibc-package.inc:
> 
> PKGSUFFIX = ""
> PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
> FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db.so.*
> ${base_libdir}/libthread_db-*.so"
> 
> Instead of the variable FILES_eglibc-thread-db-nativesdk being
> defined, the variable FILES_eglibc-thread-db gets defined after
> parsing the eglib-nativesdk recipe, so many files are not packaged in
> relevant -nativesdk packages. This is because in the functioin
> finalize() of ast.py in bitbake, it first calls expandKeys() then
> update_data(), while the OVERRIDES only takes place in the function of
> update_data(). 
> 
> I saw in the git history there was a commit to fix this issue at
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/eglibc/eglibc-package.inc?id=f800862555b81dec65f3de09a2f7b1a0c97a09c1, but later was reverted by the commit http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/eglibc/eglibc-package.inc?id=2a7870778f141b2f29271405ee62b06cc4856920. 
> 
> Any suggestions of how to resolve this issue? We're not 100% sure if
> we can change the sequence of calling expandKeys() and update_data()
> in the finalize() in ast.py in bitbake without causing any other
> problems.

We can't change that order, it would create many problems.

How about setting PKGSUFFIX = "-nativesdk" directly in
nativesdk.bbclass?

Cheers,

Richard



