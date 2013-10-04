Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 55F6860EA4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 07:46:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r947kK7l029670; Fri, 4 Oct 2013 08:46:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rYVg8hg9cv_w; Fri,  4 Oct 2013 08:46:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r947kHba029658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 4 Oct 2013 08:46:19 +0100
Message-ID: <1380872773.18603.570.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 04 Oct 2013 08:46:13 +0100
In-Reply-To: <d8f31589fe2bf6f63ef55fca4c6f5182971e1441.1380844647.git.bruce.ashfield@windriver.com>
References: <cover.1380844647.git.bruce.ashfield@windriver.com>
	<d8f31589fe2bf6f63ef55fca4c6f5182971e1441.1380844647.git.bruce.ashfield@windriver.com>
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
X-List-Received-Date: Fri, 04 Oct 2013 07:46:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-10-03 at 20:02 -0400, Bruce Ashfield wrote:
> When building against the sysroot, out of tree modules can require modpost
> and other utilities normally found in the kernel's scripts directory. For
> the kernel source in the staging dir, these scripts have been removed to
> avoid mixing archiectures when packaging kernel-dev (among other things).

Its also to avoid mixing architectures when packaging the sstate for
do_populate_sysroot. The sstate for that task is now native arch
specific after this patch but its task hash is not. Even if we made it
native specific, that means the kernel would rebuild entirely if you
switch 32 bit to 64 bit native machine. We therefore cannot merge this
patch as is.

Instead do something like:


SSTATEPOSTINSTFUNCS += "kernelheaders_sstate_postinst"

kernelheaders_sstate_postinst () {
	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
	then
		( cd ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH};
		  oe_runmake scripts 
		)
	fi
}

This will rerun the oe_runmake scripts each time the sstate package is
installed. It slows down the use of sstate but should be correct whether
the build machine is 32 or 64 bit.


Cheers,

Richard



