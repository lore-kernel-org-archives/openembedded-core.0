Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE93749F7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 11:42:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jun 2018 04:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,476,1520924400"; d="scan'208";a="60192670"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2018 04:42:41 -0700
To: Kai Kang <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
References: <20180604105828.24004-1-kai.kang@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3518da0e-6a89-1288-d6ab-89a8537467f1@linux.intel.com>
Date: Mon, 4 Jun 2018 14:42:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180604105828.24004-1-kai.kang@windriver.com>
Subject: Re: [PATCH] man-db: create man db index file
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
X-List-Received-Date: Mon, 04 Jun 2018 11:42:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/04/2018 01:58 PM, Kai Kang wrote:

> +pkg_postinst_ontarget_${PN} () {
> +        ${bindir}/mandb -q
> +}
> +

man-db is only the tools for manpages, but not the actual pages. So this 
will not work as expected when installing or removing packages that 
contain manpages. It should be added to classes/manpages.bbclass 
instead, with a RDEPENDS += "man-db". You can also fix man-pages_4.14.bb 
to inherit the class at the same time.

Oh, and you can also take qemu into use, so that this works also for 
read only rootfs, and doesn't add to first boot time, like this:
https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=b42a7a733c7a6b51118ccb3fe6e33c35ac12b4ae

Alex

