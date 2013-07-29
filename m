Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31D696B403
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 02:05:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6U25sOR004270
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 19:05:54 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 29 Jul 2013 19:05:54 -0700
Message-ID: <51F6FE24.7090502@windriver.com>
Date: Mon, 29 Jul 2013 18:43:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1374835703-9222-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1374835703-9222-1-git-send-email-paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] classes/sanity: check for suid root command evility
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
X-List-Received-Date: Tue, 30 Jul 2013 02:05:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/13 5:48 AM, Paul Eggleton wrote:
> Some users have been found to have an unnamed third-party piece of
> software installed which sets chmod, chown and mknod as suid root as
> part of its installation process. This interferes with the operation of
> pseudo and can result in files really being owned by root within the
> build output, and therefore breaks the build, apart from being a
> security issue. Check for this and bail out early if it is found.
>
> Reported-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Should these items be added to the buildtools-tarball target?  It might help 
avoid the problem in the same way we already do to detect the bad make, tar, etc..

--Mark

> ---
>   meta/classes/sanity.bbclass | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index a505a5d..0546293 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -569,6 +569,16 @@ def check_sanity_everybuild(status, d):
>       if 0 == os.getuid():
>           raise_sanity_error("Do not use Bitbake as root.", d)
>
> +    # Some third-party software apparently relies on chmod etc. being suid root (!!)
> +    import stat
> +    suid_check_bins = "chown chmod mknod".split()
> +    for bin_cmd in suid_check_bins:
> +        bin_path = bb.utils.which(os.environ["PATH"], bin_cmd)
> +        if bin_path:
> +            bin_stat = os.stat(bin_path)
> +            if bin_stat.st_uid == 0 and bin_stat.st_mode & stat.S_ISUID:
> +                status.addresult('%s has the setuid bit set. This interferes with pseudo and may cause other issues that break the build process.\n' % bin_path)
> +
>       # Check the Python version, we now have a minimum of Python 2.7.3
>       import sys
>       if sys.hexversion < 0x020703F0:
>


