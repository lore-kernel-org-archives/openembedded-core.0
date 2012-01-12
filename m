Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlRqS-0003Ie-AG
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 22:06:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2012 12:58:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106553841"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2012 12:58:14 -0800
Message-ID: <4F0F4966.9030109@linux.intel.com>
Date: Thu, 12 Jan 2012 12:58:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326385824-32201-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1326385824-32201-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] openssl: build always with -Wa,--noexecstack
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
X-List-Received-Date: Thu, 12 Jan 2012 21:06:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 08:30 AM, Enrico Scholz wrote:
> There is no reason to disable exec-stack only for -native builds;
> binaries on the target will suffer from the same SELinux ACLs.
>
> OpenSSL does not use executable stack so this option can be disabled
> unconditionally.
>
> Signed-off-by: Enrico Scholz<enrico.scholz@sigma-chemnitz.de>
> ---
>   meta/recipes-connectivity/openssl/openssl.inc |    6 +-----
>   1 files changed, 1 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 771f146..65bb671 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -19,11 +19,7 @@ S = "${WORKDIR}/openssl-${PV}"
>
>   AR_append = " r"
>   CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
> -	-DTERMIO ${FULL_OPTIMIZATION} -Wall"
> -
> -# Avoid binaries being marked as requiring an executable stack (which causes
> -# issues with SELinux on the host)
> -CFLAG_append_virtclass-native = " -Wa,--noexecstack"
> +	-DTERMIO ${FULL_OPTIMIZATION} -Wall -Wa,--noexecstack"
>
>   # -02 does not work on mipsel: ssh hangs when it tries to read /dev/urandom
>   CFLAG_mtx-1 := "${@'${CFLAG}'.replace('-O2', '')}"

Enrico,

Thanks so much for these patches, the recipe changes such as this one, 
binutils, perl, and x11 need to have PR bumps, can you please resubmit 
them with PR increments.

Also, since you have so many could you use an oe-contrib branch to 
submit them?

There may be other comments later.

Thanks
	Sau!

Thanks
	Sau!


