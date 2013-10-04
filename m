Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8058160FA6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 12:42:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r94CgrYe002670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Oct 2013 05:42:53 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 4 Oct 2013 05:42:53 -0700
Message-ID: <524EB7C8.4010402@windriver.com>
Date: Fri, 4 Oct 2013 08:42:48 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1380844647.git.bruce.ashfield@windriver.com>	
	<d8f31589fe2bf6f63ef55fca4c6f5182971e1441.1380844647.git.bruce.ashfield@windriver.com>
	<1380872773.18603.570.camel@ted>
In-Reply-To: <1380872773.18603.570.camel@ted>
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
X-List-Received-Date: Fri, 04 Oct 2013 12:42:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-10-04 03:46 AM, Richard Purdie wrote:
> On Thu, 2013-10-03 at 20:02 -0400, Bruce Ashfield wrote:
>> When building against the sysroot, out of tree modules can require modpost
>> and other utilities normally found in the kernel's scripts directory. For
>> the kernel source in the staging dir, these scripts have been removed to
>> avoid mixing archiectures when packaging kernel-dev (among other things).
>
> Its also to avoid mixing architectures when packaging the sstate for
> do_populate_sysroot. The sstate for that task is now native arch
> specific after this patch but its task hash is not. Even if we made it
> native specific, that means the kernel would rebuild entirely if you
> switch 32 bit to 64 bit native machine. We therefore cannot merge this
> patch as is.

Aha! I knew there was a lurking element I wouldn't know about. I nearly
put "RFC" in the patch .. and clearly should have :)

>
> Instead do something like:
>
>
> SSTATEPOSTINSTFUNCS += "kernelheaders_sstate_postinst"
>
> kernelheaders_sstate_postinst () {
> 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
> 	then
> 		( cd ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH};
> 		  oe_runmake scripts
> 		)
> 	fi
> }
>
> This will rerun the oe_runmake scripts each time the sstate package is
> installed. It slows down the use of sstate but should be correct whether
> the build machine is 32 or 64 bit.

I'll try what you have above and re-spin the patch.

Cheers,

Bruce

>
>
> Cheers,
>
> Richard
>
>


