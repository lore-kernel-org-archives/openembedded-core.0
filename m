Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SyjxF-0003cc-A4
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 15:36:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q77DOPDH014276
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Aug 2012 06:24:25 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 7 Aug 2012 06:24:24 -0700
Message-ID: <50211706.1050707@windriver.com>
Date: Tue, 7 Aug 2012 09:24:22 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1344338236.9756.218.camel@ted>
In-Reply-To: <1344338236.9756.218.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-3.4: Disable extra slang header search path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 13:36:13 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-07 07:17 AM, Richard Purdie wrote:
> Add in a workaround to avoid host infection detection build failures
> from the slang include directory in perf. I'll defer to Bruce to
> fix this properly but we need a workaround now as this is breaking
> builds.

I just followed up on a patch from 3 days ago, but I'll follow up here
as well .. just to make sure the message gets through.

We had a pending patch to fix this issue from Liang Li here @ windriver.

Did that patch not fix the problem, or did it fall through the cracks ?

Cheers,

Bruce

>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-kernel/linux/linux-yocto/noslang.patch b/meta/recipes-kernel/linux/linux-yocto/noslang.patch
> new file mode 100644
> index 0000000..9cada34
> --- a/dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/noslang.patch
> @@ -0,0 +1,20 @@
> +We (OE) install slang into /usr/include so we never need to look into
> +/usr/include/slang/. We never want to look into a hardcoded path like this
> +since it triggers host infection issues. For now, simply remove this
> +since it causes us problems.
> +
> +Upstream-Status: Pending (would need rework)
> +
> +Index: tools/perf/Makefile
> +===================================================================
> +--- linux.orig/tools/perf/Makefile	2012-08-07 10:29:43.020149620 +0000
> ++++ linux/tools/perf/Makefile	2012-08-07 10:30:08.128148098 +0000
> +@@ -504,7 +504,7 @@
> + 		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
> + 	else
> + 		# Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
> +-		BASIC_CFLAGS += -I/usr/include/slang
> ++		# BASIC_CFLAGS += -I/usr/include/slang
> + 		EXTLIBS += -lnewt -lslang
> + 		LIB_OBJS += $(OUTPUT)util/ui/setup.o
> + 		LIB_OBJS += $(OUTPUT)util/ui/browser.o
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 48333b3..5ab46b7 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -20,6 +20,8 @@ SRCREV_meta ?= "7ff48aa47c50b6455d60ca93bc81260ce8fe1a1b"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>
> +SRC_URI += "file://noslang.patch"
> +
>   LINUX_VERSION ?= "3.4.6"
>
>   PR = "${INC_PR}.0"
>
>



