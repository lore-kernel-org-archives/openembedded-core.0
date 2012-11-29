Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Te8PU-0007kU-J7
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 19:00:29 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2012 09:45:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,186,1355126400"; d="scan'208";a="255151584"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2012 09:45:46 -0800
Message-ID: <50B79F49.7020906@linux.intel.com>
Date: Thu, 29 Nov 2012 09:45:45 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "yanjun.zhu" <yanjun.zhu@windriver.com>
References: <3487> <1354097622-27424-1-git-send-email-yanjun.zhu@windriver.com>
In-Reply-To: <1354097622-27424-1-git-send-email-yanjun.zhu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][PATCH] libproxy: Fix for CVE-2012-4504
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
X-List-Received-Date: Thu, 29 Nov 2012 18:00:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/2012 02:13 AM, yanjun.zhu wrote:
> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>
> Reference:https://code.google.com/p/libproxy/source/detail?r=853
>
> Stack-based buffer overflow in the url::get_pac function in url.cpp
> in libproxy 0.4.x before 0.4.9 allows remote servers to have an
> unspecified impact via a large proxy.pac file.
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4504
>
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> ---
>   .../libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch  | 15 +++++++++++++++
>   meta/recipes-support/libproxy/libproxy_0.4.7.bb           |  1 +
>   2 files changed, 16 insertions(+)
>   create mode 100644 meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch
>
> diff --git a/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch b/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch
> new file mode 100644
> index 0000000..323a571
> --- /dev/null
> +++ b/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch

This is missing a patch header with Signed-off-by and Upstream-Status, 
please add them.

Thanks
	Sau!

> @@ -0,0 +1,15 @@
> +diff -urpN a/libproxy/url.cpp b/libproxy/url.cpp
> +--- a/libproxy/url.cpp	2012-11-26 10:08:47.000000000 +0800
> ++++ b/libproxy/url.cpp	2012-11-26 10:05:54.000000000 +0800
> +@@ -472,9 +472,10 @@ char* url::get_pac() {
> + 				// Add this chunk to our content length,
> + 				// ensuring that we aren't over our max size
> + 				content_length += chunk_length;
> +-				if (content_length >= PAC_MAX_SIZE) break;
> + 			}
> +
> ++			if (content_length >= PAC_MAX_SIZE) break;
> ++
> + 			while (recvd != content_length) {
> + 				int r = recv(sock, buffer + recvd, content_length - recvd, 0);
> + 				if (r < 0) break;
> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> index e3721a8..fc32f57 100644
> --- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> +++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> @@ -13,6 +13,7 @@ PR = "r4"
>   SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz \
>              file://g++-namepace.patch \
>              file://libproxy_fix_for_gcc4.7.patch \
> +           file://libproxy-0.4.7-CVE-2012-4504.patch \
>             "
>
>   SRC_URI[md5sum] = "509e03a488a61cd62bfbaf3ab6a2a7a5"
>


