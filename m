Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A10B46101A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 05:02:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9752EBt027467
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 6 Oct 2013 22:02:14 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.23.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 6 Oct 2013 22:02:14 -0700
Message-ID: <52524055.2090303@windriver.com>
Date: Mon, 7 Oct 2013 01:02:13 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
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
X-List-Received-Date: Mon, 07 Oct 2013 05:02:19 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-10-04 3:46 AM, Richard Purdie wrote:
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

I poked with this a bit over the weekend, and never did get the right 
results.

I can make the scripts trigger, but since the sysroot population appears
to already be done, but build scripts don't actually make it into the
sysroot for use during module builds.

I tried a few variants of the below, all trying to get the actual
tmp/sysroots/<machine> to have the scripts, with no luck. Dumping the
available variables didn't get me anything really promising either.

I'll have another look in the morning, since I'm sure it is just me not
understanding the ordering of things .. but any pointers would of course
be appreciated.

Cheers,

Bruce

STATEPOSTINSTFUNCS += "kernelscripts_sstate_postinst"
kernelscripts_sstate_postinst () {
         if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o 
"${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
                 sysroot_stage_dir ${D}${KERNEL_SRC_PATH} 
${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
                 oe_runmake -C ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH} scripts
	fi
} 
 



>
>
> Cheers,
>
> Richard
>
>


