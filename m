Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A594165C78
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 21:10:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jul 2015 14:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,417,1432623600"; d="scan'208";a="741709987"
Received: from aehernan-mobl1.zpn.intel.com (HELO [10.219.4.172])
	([10.219.4.172])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2015 14:09:59 -0700
Message-ID: <559AEEAC.8080005@linux.intel.com>
Date: Mon, 06 Jul 2015 16:10:04 -0500
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1436177709.git.alejandro.hernandez@linux.intel.com>
	<41e68bf09d809269524babaae2911a7c41e38351.1436177709.git.alejandro.hernandez@linux.intel.com>
	<20150706201018.GD2436@jama>
In-Reply-To: <20150706201018.GD2436@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] opkg-build: Ignore tar error due to hardlinks issue when creating ipk files
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
X-List-Received-Date: Mon, 06 Jul 2015 21:10:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/15 15:10, Martin Jansa wrote:
> On Mon, Jul 06, 2015 at 10:17:19AM +0000, Alejandro Hernandez wrote:
>
> +
> +This a similar behavior to the one on dpkg:
> +http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=40731942515ec8d80c727ad561174986d4f05818
> +
> +Upsteam-Status: Inappropriate
> Typo and why is it inappropriate? Looks like bugfix to me, even for
> issue which usually happens in OE way of using opkg-build.

It seemed inappropriate to me, since this behavior is not expected 
(number of hardlinks changing), we can't say for sure that this error 
will be caused by this reason on when using opkg on another environment
>   
> -SRC_URI = "git://git.yoctoproject.org/opkg-utils"
> +SRC_URI = "git://git.yoctoproject.org/opkg-utils "
> +
> +SRC_URI_append_class-native = "file://tar_ignore_error.patch"
> Add leading space in append not in original SRC_URI variable.
>
> Why is it applied only for native anyway?

Same argument as before, modifying the number of hardlinks while the tar 
is created happens when building using bitbake, which should not happen 
on target, if files changed when creating an ipk for any other reason it 
shouldn't be ignored; space was a typo



