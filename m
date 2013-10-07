Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8F860F77
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 16:19:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r97GIuA0000694; Mon, 7 Oct 2013 17:18:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4naqisJljA2n; Mon,  7 Oct 2013 17:18:56 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r97GIq9h000683
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 7 Oct 2013 17:18:54 +0100
Message-ID: <1381162713.29912.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 07 Oct 2013 17:18:33 +0100
In-Reply-To: <5252D124.9090603@windriver.com>
References: <cover.1380844647.git.bruce.ashfield@windriver.com>
	<d8f31589fe2bf6f63ef55fca4c6f5182971e1441.1380844647.git.bruce.ashfield@windriver.com>
	<1380872773.18603.570.camel@ted> <52524055.2090303@windriver.com>
	<1381139937.29912.11.camel@ted> <5252D124.9090603@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Mon, 07 Oct 2013 16:19:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-10-07 at 11:20 -0400, Bruce Ashfield wrote:
>  I had it slightly wrong. Try:
> >
> > kernelheaders_sstate_postinst () {
> >   	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
> >   	then
> >   		( cd ${KERNEL_SRC_PATH};
> >   		  oe_runmake scripts
> >   		)
> >   	fi
> >   }
> >
> > since the files are actually installed at this point, therefore we
> > operate on the final location.
> 
> That's the kicker, I can't get the right variable to find the final
> location, KERNEL_SRC_PATH is set to /usr/src/kernel, so we can't operate
> on it directly. When things were runing in the sysroot_append, the
> kernel src was staged, and then operated on, then it makes it into the
> sysroot. Here, we could operate on the STAGING_KERNEL, which is in the
> sysroot, but stripped of the scripts. Perhaps that is the answer, but
> I need to confirm that scripts installed in that location would be
> available to the out of tree module builds that are looking for modpost
> and friends.

Guessing again (third time lucky?),

cd ${STAGING_DIR_KERNEL};

?

Cheers,

Richard



