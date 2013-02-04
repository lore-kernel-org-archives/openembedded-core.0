Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1U2QNx-0003Tp-6Q for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 19:03:22 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1U2Q8f-0001HW-R2; Mon, 04 Feb 2013 18:47:29 +0100
Message-ID: <1360000031.6972.39.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Mon, 04 Feb 2013 17:47:11 +0000
In-Reply-To: <510F875B.9070903@intel.com>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
	<510F8388.2030809@topic.nl> <510F875B.9070903@intel.com>
X-Mailer: Evolution 3.4.4-1 
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
X-List-Received-Date: Mon, 04 Feb 2013 18:03:23 -0000
X-List-Received-Date: Mon, 04 Feb 2013 18:03:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-02-04 at 12:03 +0200, Laurentiu Palcu wrote:
> Not necessarily. We are trying to have all postinstalls run on host, so
> we don't have to do any postinstall activity on target. Any cache
> generated during postinstall, will be generated at do_rootfs time. Then,
> we can deploy the image with the cache already in place.
> 
> Also, on a RO rootfs, there is really no need to update the cache since
> the cached files do not really change. Hence, the cache created on host
> should, in theory, be valid.

What sort of files in /var/cache are you trying to address with this
change?  The impression I have is that most of the things in there are
created dynamically by applications running on the target system and not
by postinst scripts that could be run on the host.

For example, an (admittedly somewhat unscientific) survey on my desktop
machine suggests that fontconfig, samba and cups, at least, are creating
files in /var/cache at run time with contents that you wouldn't be able
to predict in advance.  (Apt also uses /var/cache as its download area,
but I guess if you have a read-only roofs then you aren't going to be
running apt very much so that one probably isn't an issue.)  I wasn't
able to immediately identify any files in there that would be obvious
candidates for creating in a postinst and then leaving untouched
afterwards.

p.




