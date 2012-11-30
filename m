Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TeLp7-0000VK-8O
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 09:19:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2012 00:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,191,1355126400"; d="scan'208";a="224649809"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 30 Nov 2012 00:05:30 -0800
Message-ID: <50B868CA.4020906@linux.intel.com>
Date: Fri, 30 Nov 2012 00:05:30 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "yanjun.zhu" <yanjun.zhu@windriver.com>
References: <3450> <1354249830-25918-1-git-send-email-yanjun.zhu@windriver.com>
In-Reply-To: <1354249830-25918-1-git-send-email-yanjun.zhu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Python: Fix for CVE-2012-2135
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
X-List-Received-Date: Fri, 30 Nov 2012 08:19:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2012 08:30 PM, yanjun.zhu wrote:
> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>
> Reference:http://http://bugs.python.org/issue14579
>
> The utf-16 decoder in Python 3.1 through 3.3 does not update the
> aligned_end variable after calling the unicode_decode_call_errorhandler
> function, which allows remote attackers to obtain sensitive information
> (process memory) or cause a denial of service (memory corruption and crash)
> via unspecified vectors.
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> ---
>   .../python/python/python-2.7.2-CVE-2012-2135.patch | 22 ++++++++++++++++++++++
>   meta/recipes-devtools/python/python_2.7.2.bb       |  1 +
>   2 files changed, 23 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch
>
> diff --git a/meta/recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch b/meta/recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch
> new file mode 100644
> index 0000000..bb9719e
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch
> @@ -0,0 +1,22 @@
> +Reference:http://http://bugs.python.org/issue14579
> +
> +The utf-16 decoder in Python 3.1 through 3.3 does not update the
> +aligned_end variable after calling the unicode_decode_call_errorhandler
> +function, which allows remote attackers to obtain sensitive information
> +(process memory) or cause a denial of service (memory corruption and crash)
> +via unspecified vectors.
> +
> +http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135

Need Upstream-Status:  Like all the other CVE patches you have 
submitted, please fix this.  I appreciate the work you are doing, but 
please include Upstream-Status, are these backport, or pending?

Sau!

> +Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> +diff -urpN a/Objects/unicodeobject.c b/Objects/unicodeobject.c
> +--- a/Objects/unicodeobject.c	2012-11-12 16:25:33.000000000 +0800
> ++++ b/Objects/unicodeobject.c	2012-11-12 16:26:22.000000000 +0800
> +@@ -2568,7 +2568,7 @@ PyUnicode_DecodeUTF16Stateful(const char
> +         }
> +
> +         /* UTF-16 code pair: */
> +-        if (q >= e) {
> ++        if (e - q < 2) {
> +             errmsg = "unexpected end of data";
> +             startinpos = (((const char *)q)-2)-starts;
> +             endinpos = ((const char *)e)-starts;
> diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
> index 2adb4e4..9dabfb7 100644
> --- a/meta/recipes-devtools/python/python_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> @@ -24,6 +24,7 @@ SRC_URI += "\
>     file://setuptweaks.patch \
>     file://check-if-target-is-64b-not-host.patch \
>     file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
> +  file://python-2.7.2-CVE-2012-2135.patch \
>   "
>
>   S = "${WORKDIR}/Python-${PV}"
>


