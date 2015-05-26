Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 500F0606E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 09:24:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4Q9OnxR004032
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 02:24:49 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 May 2015 02:24:48 -0700
Message-ID: <55643BDF.4040008@windriver.com>
Date: Tue, 26 May 2015 17:24:47 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1432624893-1497-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1432624893-1497-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] ppp: Security Advisory - CVE-2015-3310
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
X-List-Received-Date: Tue, 26 May 2015 09:24:50 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

please drop it, there is a typos

-R

On 2015年05月26日 15:21, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-3310
>
> Buffer overflow in the rc_mksid function in plugins/radius/util.c in
> Paul's PPP Package (ppp) 2.4.6 and earlier, when the PID for pppd is
> greater than 65535, allows remote attackers to cause a denial of
> service (crash) via a start accounting message to the RADIUS server.
>
> oe-core is using ppp 2.4.7, and this CVE say ppp 2.4.7 was not
> effected, but I found this buggy codes are same between 2.4.6 and
> 2.4.7, and 2.4.7 should have this issue.
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   .../ppp/ppp/fix-CVE-2015-3310.patch                | 29 ++++++++++++++++++++++
>   meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  1 +
>   2 files changed, 30 insertions(+)
>   create mode 100644 meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch
>
> diff --git a/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch b/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch
> new file mode 100644
> index 0000000..b8ca204
> --- /dev/null
> +++ b/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch
> @@ -0,0 +1,29 @@
> +ppp: Buffer overflow in radius plugin
> +
> +From: https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=5;bug=782450
> +
> +Upstream-Statue: Backport
> +
> +On systems with more than 65535 processes running, pppd aborts when
> +sending a "start" accounting message to the RADIUS server because of a
> +buffer overflow in rc_mksid.
> +
> +The process id is used in rc_mksid to generate a pseudo-unique string,
> +assuming that the hex representation of the pid will be at most 4
> +characters (FFFF). __sprintf_chk(), used when compiling with
> +optimization levels greater than 0 and FORTIFY_SOURCE, detects the
> +buffer overflow and makes pppd crash.
> +
> +The following patch fixes the problem.
> +
> +--- ppp-2.4.6.orig/pppd/plugins/radius/util.c
> ++++ ppp-2.4.6/pppd/plugins/radius/util.c
> +@@ -77,7 +77,7 @@ rc_mksid (void)
> +   static unsigned short int cnt = 0;
> +   sprintf (buf, "%08lX%04X%02hX",
> + 	   (unsigned long int) time (NULL),
> +-	   (unsigned int) getpid (),
> ++	   (unsigned int) getpid () % 65535,
> + 	   cnt & 0xFF);
> +   cnt++;
> +   return buf;
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> index 4219d45..adc38e1 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> @@ -29,6 +29,7 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
>              file://provider \
>              file://0001-ppp-Fix-compilation-errors-in-Makefile.patch \
>              file://ppp@.service \
> +           file://fix-CVE-2015-3310.patch \
>   "
>
>   SRC_URI[md5sum] = "78818f40e6d33a1d1de68a1551f6595a"
>

-- 
Best Reagrds,
Roy | RongQing Li

