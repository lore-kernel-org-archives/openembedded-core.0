Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC04F65DD6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 11:55:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7JBtfRs010205
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Aug 2014 04:55:42 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 19 Aug 2014 04:55:41 -0700
Message-ID: <53F33B3C.5050206@windriver.com>
Date: Tue, 19 Aug 2014 19:55:40 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>, OE Core
	<openembedded-core@lists.openembedded.org>
References: <20140819114229.GE7174@gmail.com>
In-Reply-To: <20140819114229.GE7174@gmail.com>
Subject: Re: core-image-full-cmdline build failure
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
X-List-Received-Date: Tue, 19 Aug 2014 11:55:42 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/19/2014 07:42 PM, Paul Barker wrote:
> Hi all,
>
> I'm getting consistent failures trying to build core-image-full-cmdline with an
> up-to-date oe-core (d0be4b3) and bitbake (38d4f65). The useradd commands for
> rpcbind and openssh-sshd are running before the base-passwd package has been
> installed and so are not finding /etc/passwd.
>
> I've hacked together a local fix for this by modifying the do_rootfs command to
> install base-passwd before installing other packages. If this is a common
> failure and it's not just me seeing it, would it be worth expanding the package
> types listed in the install manifest? Currently we have 'mip' for must install
> package, 'aop' for attempt only, etc. If we need to ensure certain packages are
> installed first, perhaps we could add something like 'ep' for early package.
>
> Looking into the rpcbind package, the useradd commands are performed in a
> preinst script so I don't think the problem is opkg running the script too
> early. Do other package managers guarantee that a package's dependencies are
> installed before the preinst script is ran? If so, I may need to re-order things

For rpm, I think yes ? The "pre" depends on base-passwd:
$ rpm -qpR -v tmp/deploy/rpm/core2_64/rpcbind-0.2.1-r0.core2_64.rpm | grep base-pass
manual: base-passwd
pre: base-passwd
post: base-passwd
preun: base-passwd
postun: base-passwd

But I can't find such info in ipk.

// Robert

> within opkg. If not, I think the above solution of listing certain packages for
> early installation would be best.
>
> Thanks,
>
>
>

