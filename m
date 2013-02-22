Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U8tGC-0002ao-DY for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 15:06:02 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1MDuR5P012688; Fri, 22 Feb 2013 13:56:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7phIxBVGvcVX; Fri, 22 Feb 2013 13:56:27 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1MDuGeK012672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Feb 2013 13:56:23 GMT
Message-ID: <1361540959.9309.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Fri, 22 Feb 2013 05:49:19 -0800
In-Reply-To: <1361361450-30087-1-git-send-email-laurentiu.palcu@intel.com>
References: <1361361450-30087-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gconf.bbclass: make postinstall fail silently when running offline
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
X-List-Received-Date: Fri, 22 Feb 2013 14:06:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-02-20 at 13:57 +0200, Laurentiu Palcu wrote:
> Gconf backend does not accept special characters in configuration source
> addresses. When populating SDK target sysroot from core-image-sato, for
> example, the configuration source address contains "1.3+snapshot" in it
> and '+' is an invalid character. Thus, gconftool-2 will fail and the
> build will stop at do_rootfs because the log contains the "ERROR"
> string.
> 
> Since failing offline will postpone the postinstall execution for
> target's first boot, we can silently fail here, so the build can
> complete.
> 
> [YOCTO #3893]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/gconf.bbclass |   10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Just to be clear, I think we need to patch gconf to fix this, there is
no good reason it shouldn't be handling the + character (unless you've
found one I don't know about). Hiding stderr is a recipe for problems in
future and we want these postinstalls to run at build time.

Cheers,

Richard



