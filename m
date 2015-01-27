Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 20C72718E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 15:45:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0RFjnRH023031
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Jan 2015 07:45:49 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 27 Jan 2015 07:45:49 -0800
Message-ID: <54C7B296.5020506@windriver.com>
Date: Tue, 27 Jan 2015 10:45:26 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1422372551.19798.53.camel@linuxfoundation.org>
In-Reply-To: <1422372551.19798.53.camel@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: Re: [PATCH] image: Add missing depends on virtual/kernel for depmod data
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
X-List-Received-Date: Tue, 27 Jan 2015 15:45:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-01-27 10:29 AM, Richard Purdie wrote:
> We need the depmod data so that the kernel depmod command works successfully
> at rootfs time. The fact this was working inconsistently is now highlighted
> after the command was made to error out. A simple test case is:
>
> bitbake virtual/kernel image
> bitbake vrituak/kernel -c clean
> bitbake image -c rootfs -f
>
> We fix it by adding the missing dependency.

Looks good here.

Out of curiosity, was this hiding before, or did it only come about due
to our recent moves to the work-shared kernel builds ?

Bruce


>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 22b6970..5b88f53 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -72,8 +72,10 @@ LDCONFIGDEPEND ?= "ldconfig-native:do_populate_sysroot"
>   LDCONFIGDEPEND_libc-uclibc = ""
>   LDCONFIGDEPEND_libc-musl = ""
>
> -do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
> -do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
> +do_rootfs[depends] += " \
> +    makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND} \
> +    virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot \
> +    virtual/kernel:do_populate_sysroot"
>   do_rootfs[recrdeptask] += "do_packagedata"
>
>   def command_variables(d):
>
>


