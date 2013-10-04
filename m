Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C461E60FA6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 00:59:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r940xmZ1006555
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Oct 2013 17:59:48 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.23.75) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 3 Oct 2013 17:59:48 -0700
Message-ID: <524E1303.3010302@windriver.com>
Date: Thu, 3 Oct 2013 20:59:47 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1380844647.git.bruce.ashfield@windriver.com>
	<d8f31589fe2bf6f63ef55fca4c6f5182971e1441.1380844647.git.bruce.ashfield@windriver.com>
	<24D616E6-3C79-4C7A-AFED-BE63DAE239BF@gmail.com>
In-Reply-To: <24D616E6-3C79-4C7A-AFED-BE63DAE239BF@gmail.com>
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
X-List-Received-Date: Fri, 04 Oct 2013 00:59:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-10-03 8:58 PM, Khem Raj wrote:
>
> On Oct 3, 2013, at 5:02 PM, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>
>> When building against the sysroot, out of tree modules can require modpost
>> and other utilities normally found in the kernel's scripts directory. For
>> the kernel source in the staging dir, these scripts have been removed to
>> avoid mixing archiectures when packaging kernel-dev (among other things).
>>
>> Rather than further complicate the kernel's install rule, or its packaging,
>> we can jump into the sysroot and restore the scripts by building them, hence
>> making them available to packages that need them.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>> meta/classes/kernel.bbclass | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 4acfb7e..d856e31 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -294,6 +294,14 @@ do_install[prefuncs] += "package_get_auto_pr"
>>
>> sysroot_stage_all_append() {
>> 	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>> +
>> +	# Restore kernel scripts in the sysroot, since they had to be removed during
>> +	# packaging to avoid mismatched arch QA errors, but are required/useful when
>> +	# packages like out of tree kernel modules are built. Rather than playing QA
>> +	# games, it is easier to just do this work in the sysroot.
>> +	( cd ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH};
>
> This was cd ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}/scripts in my patch but I will test out this one too.
> but this is ok since

Thanks. I went with habit and did it right from the top level. I see
modpost in my sysroot, but I definitely want to get your confirmation
that it works for you as well.

Bruce

>
> ifeq ($(KBUILD_EXTMOD),)
> # Additional helpers built in scripts/
> # Carefully list dependencies so we do not try to build scripts twice
> # in parallel
> PHONY += scripts
> scripts: scripts_basic include/config/auto.conf include/config/tristate.conf \
>           asm-generic
>          $(Q)$(MAKE) $(build)=$(@)
>
>
>> +	  oe_runmake scripts
>> +	)
>> }
>>
>> kernel_do_configure() {
>> --
>> 1.8.1.2
>>
>


