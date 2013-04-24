Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UV0qj-0002Do-GA
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 16:39:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3OELPtW007859
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 07:21:26 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 24 Apr 2013 07:21:25 -0700
Message-ID: <5177EA62.6080601@windriver.com>
Date: Wed, 24 Apr 2013 09:21:22 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1366793330-8893-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1366793330-8893-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: Re: [PATCH v2] rpm: change arch scoring items
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
X-List-Received-Date: Wed, 24 Apr 2013 14:39:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/13 3:48 AM, Bogdan Marinescu wrote:
> Don't add the first line of /etc/rpm/platform to the list of patterns
> to match when computing an arch score, use it just for getting
> information about the platform (cpu/vendor/os).
>
> [YOCTO #3864]
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Acked-by: Mark Hatle <mark.hatle@windriver.com>

> ---
>   .../rpm/rpm/rpm-platform-file-fix.patch            |   28 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 ++-
>   2 files changed, 30 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
>
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
> new file mode 100644
> index 0000000..0f391d2
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
> @@ -0,0 +1,28 @@
> +Don't add the first line of /etc/rpm/platform to the list of patterns
> +to match when computing an arch score, use it just for getting
> +information about the platform (cpu/vendor/os). Fixes #3864.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +diff --git a/lib/rpmrc.c b/lib/rpmrc.c
> +index e676601..9140bbe 100644
> +--- a/lib/rpmrc.c
> ++++ b/lib/rpmrc.c
> +@@ -510,6 +510,7 @@ static rpmRC rpmPlatform(const char * platform)
> + #endif
> + 	}
> +
> ++#if !defined(RPM_VENDOR_POKY) /* Skip the explicit-platform */
> + #if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
> + 	/* do not use vendor and GNU attribution */
> + 	p = rpmExpand("%{_host_cpu}-%{_host_os}", NULL);
> +@@ -520,7 +521,8 @@ static rpmRC rpmPlatform(const char * platform)
> + #endif
> + 	xx = mireAppend(RPMMIRE_STRCMP, 0, p, NULL, &mi_re, &mi_nre);
> + 	p = _free(p);
> +-	
> ++#endif
> ++
> + 	init_platform++;
> +     }
> +     rc = (init_platform ? RPMRC_OK : RPMRC_FAIL);
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index 7d2cba4..112d11d 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>
>   DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
> -PR = "r62"
> +PR = "r63"
>
>   # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>   # in order to extract the distribution SRPM into a format we can extract...
> @@ -86,6 +86,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
>   	   file://rpm-platform2.patch \
>   	   file://rpm-remove-sykcparse-decl.patch \
>   	   file://debugedit-segv.patch \
> +     file://rpm-platform-file-fix.patch \
>   	  "
>
>   # Uncomment the following line to enable platform score debugging
>



