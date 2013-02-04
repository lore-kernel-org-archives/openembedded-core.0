Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U2Kps-0002aM-Hj for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 13:07:45 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14BuuQu030441; Mon, 4 Feb 2013 11:56:56 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id U0bTrmJL4FTj; Mon,  4 Feb 2013 11:56:56 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14BulAc030432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Feb 2013 11:56:50 GMT
Message-ID: <1359978692.14071.152.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Mon, 04 Feb 2013 11:51:32 +0000
In-Reply-To: <510F875B.9070903@intel.com>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
	<510F8388.2030809@topic.nl> <510F875B.9070903@intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Remove /var/cache from volatiles directory
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
X-List-Received-Date: Mon, 04 Feb 2013 12:07:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-02-04 at 12:03 +0200, Laurentiu Palcu wrote:
> 
> On 02/04/2013 11:46 AM, Mike Looijmans wrote:
> > On 02/04/2013 10:26 AM, Laurentiu Palcu wrote:
> >> > Hi,
> >> >
> >> > Re-generating applications' cache every time the system is rebooted is not a
> >> > very efficient process for an embedded device. Usually, the cache directory is
> >> > used by applications to store data resulting from time consmuming I/O or
> >> > calculation. So, this patchset will take out /var/cache from tmpfs.
> > What if you have a READONLY rootfs? This patch will "break" those 
> > devices I think.
> > 
> > 
> 
> Not necessarily. We are trying to have all postinstalls run on host, so
> we don't have to do any postinstall activity on target. Any cache
> generated during postinstall, will be generated at do_rootfs time. Then,
> we can deploy the image with the cache already in place.
> 
> Also, on a RO rootfs, there is really no need to update the cache since
> the cached files do not really change. Hence, the cache created on host
> should, in theory, be valid.
> 
> If the above logic is missing anything, feel free to correct me.

If this is an issue and something does need to touch the cache
directory, we can mount a unionfs over /var/cache like we're doing
for /var/lib in the readonly rootfs patch series.

Ultimately, I think we're better served with that approach all round.

Cheers,

Richard



