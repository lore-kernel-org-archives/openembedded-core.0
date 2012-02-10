Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rvkui-0008B8-GO
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 08:29:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Feb 2012 23:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116195691"
Received: from unknown (HELO [10.255.14.206]) ([10.255.14.206])
	by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2012 23:20:53 -0800
Message-ID: <4F34C555.3010903@linux.intel.com>
Date: Thu, 09 Feb 2012 23:20:53 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1328735214-1899-1-git-send-email-msm@freescale.com>
In-Reply-To: <1328735214-1899-1-git-send-email-msm@freescale.com>
Subject: Re: [PATCH] distutils.bbclass: override LDSHARED so we use the linker for this build and not the one used in sstate-cache
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
X-List-Received-Date: Fri, 10 Feb 2012 07:29:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/12 13:06, Matthew McClintock wrote:
> Without this fix, when packages are being built using distutils and
> the python packages were deployed from sstate-cache is it possible
> that the LD command will contain an invalid sysroot override.
>
> We can fix this by always exported LDSHARED, which is the env var
> that distutil looks for to override creating shared libraries.

This patch appears to fix [YOCTO #1948] when applied to my Edison branch.

http://bugzilla.pokylinux.org/show_bug.cgi?id=1948

> Signed-off-by: Matthew McClintock<msm@freescale.com>
Signed-off-by: Joshua Lock <josh@linux.intel.com>

> ---
>   meta/classes/distutils.bbclass |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
> index 79b962a..18ae805 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -72,3 +72,5 @@ distutils_do_install() {
>   }
>
>   EXPORT_FUNCTIONS do_compile do_install
> +
> +export LDSHARED="${CCLD} -shared"

-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


