Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UIJy3-0003gD-Ns
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 15:26:20 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 1D6D2D22E8; Wed, 20 Mar 2013 15:09:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 19744D20D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 15:09:07 +0100 (CET)
Message-ID: <5149C2FF.4070309@linaro.org>
Date: Wed, 20 Mar 2013 15:09:03 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1586733.G7AaCq5rbs@helios> <51499277.8000400@linaro.org>
	<5149B097.40106@windriver.com>
In-Reply-To: <5149B097.40106@windriver.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [RFC] Switching from glibc RPC to TI RPC
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
X-List-Received-Date: Wed, 20 Mar 2013 14:26:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 20.03.2013 13:50, Mark Hatle pisze:
> On 3/20/13 5:41 AM, Marcin Juszkiewicz wrote:

>> Good point. YP-tools are not buildable with my changeset due to lack of
>> YP support in libtirpc.

> There is definitely a class of user (networking devices) where nis/yp
> are still being used.  I would love to see NIS support be a distro
> feature or similar configure time element.

Good idea.

> -after- the upcoming release, I think we should pursue these patches,
> assuming we can get the NIS support enabled in some way.

Looks like we have to wait for TI RPC to mature more.

> BTW my only other question was the busybox side.  I'm a bit confused by
> the comment.  I thought the mount_nfs was still required because it
> enabled the proper binding argument for the mount syscall.  While I
> don't believe we need to still support the older kernel(s), we
> definitely need NFS mounts to work in busybox.

Since
http://git.busybox.net/busybox/commit/?id=a86e02492d7700ce8cb4108f53646dfb025c2dff
change (2011-11-10) this option is not needed to mount NFS with 2.6.23+
kernel:

config FEATURE_MOUNT_NFS
	bool "Support mounting NFS file systems on Linux < 2.6.23"
	default n
	depends on MOUNT
	select FEATURE_HAVE_RPC
	select FEATURE_SYSLOG
	help
	  Enable mounting of NFS file systems on Linux kernels prior
	  to version 2.6.23. Note that in this case mounting of NFS
	  over IPv6 will not be possible.

	  Note that this option links in RPC support from libc,
	  which is rather large (~10 kbytes on uclibc).


