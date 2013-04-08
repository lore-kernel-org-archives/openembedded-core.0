Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPJMG-00009H-B5 for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 23:12:09 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r38L5puc017618; Mon, 8 Apr 2013 22:05:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VIZSSwS2CuZE; Mon,  8 Apr 2013 22:05:51 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r38L5fnd017611
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 8 Apr 2013 22:05:47 +0100
Message-ID: <1365454473.12407.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michel.thebeau@windriver.com
Date: Mon, 08 Apr 2013 21:54:33 +0100
In-Reply-To: <1365452153-21650-3-git-send-email-michel.thebeau@windriver.com>
References: <1365452153-21650-1-git-send-email-michel.thebeau@windriver.com>
	<1365452153-21650-3-git-send-email-michel.thebeau@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Bruce.Ashfield@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] kernel.bbclass: do_strip: allow recipes to strip the kernel
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
X-List-Received-Date: Mon, 08 Apr 2013 21:12:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-08 at 16:15 -0400, michel.thebeau@windriver.com wrote:
> From: Michel Thebeau <michel.thebeau@windriver.com>
> 
> Allow recipes to specify sections to be stripped from the kernel output
> using KERNEL_IMAGE_STRIP_EXTRA_SECTIONS.  For example:
> 
> KERNEL_IMAGE_STRIP_EXTRA_SECTIONS = ".comment .unwanted"
> 
> The file to be stripped is a copy of ${KERNEL_OUTPUT} and will be given
> the same name with an additional ".stripped" suffix.  The suffix can be
> overridden using KERNEL_STRIP_SUFFIX.
> 
> Since the toolchain does not give indication when the specified sections
> are absent, we read the sections first and make this report by issuing a
> warning to the developer.
> 
> The toolchain by default strips the image with the -s option (even
> when -s is not specified):
> -s --strip-all       Remove all symbol and relocation information
> 
> For example, these sections are always removed:
> .debug_aranges
> .debug_info
> .debug_abbrev
> .debug_line
> .debug_frame
> .debug_str
> .debug_loc
> .debug_ranges
> .symtab
> .strtab
> 
> In addition to these, the sections listed in
> KERNEL_IMAGE_STRIP_EXTRA_SECTIONS will also be removed.
> 
> Only stripping of vmlinux (elf) is supported at this time.  A warning
> will be given if the image type is not vmlinux.
> 
> Stripping the image could also be done in the kernel, but that would
> only work for linux-yocto based kernels, so it's not the route we
> decided to go.
> 
> [YOCTO 3515]
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>

Can we please just have one output kernel, not two. Is the unstripped
version useful anywhere?

Cheers,

Richard





