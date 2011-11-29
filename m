Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVQ3p-0008QV-DG
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 16:57:33 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 07:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="80920838"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 07:50:53 -0800
Message-ID: <4ED4FF5D.8030401@linux.intel.com>
Date: Tue, 29 Nov 2011 07:50:53 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1322300849-28059-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1322300849-28059-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] opkg-utils: handle 6 digit UID fields properly
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
X-List-Received-Date: Tue, 29 Nov 2011 15:57:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2011 01:47 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   .../opkg-utils/arfile_header_split.patch           |   27 ++++++++++++++++++++
>   meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    3 +-
>   2 files changed, 29 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
> new file mode 100644
> index 0000000..435e74e
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
> @@ -0,0 +1,27 @@
> +From: Scott Anderson<o2e@saaworld.com>
> +Subject: ipkg-utils: Make arfile.py handle six digit UIDs
> +
> +    Essentially, the problem is that arfile.py is splitting the ar header with
> +    white-space instead of fixed-width fields, so two fields would get treated
> +    as a single field.  This makes things better than before as it now honors
> +    the fixed field widths.
> +
> +Upsteam-status: Pending (there is no upstream after openmoko imploded)
> +
> +--- ipkg-utils/arfile.py.orig	2010-09-29 13:38:15.000000000 -0700
> ++++ ipkg-utils/arfile.py	2010-10-01 16:06:00.000000000 -0700
> +@@ -74,7 +74,12 @@
> +             if l == "\n":
> +                 l = self.f.readline()
> +                 if not l: break
> +             l = l.replace('`', '')
> +-            descriptor = l.split()
> ++            # Field lengths from /usr/include/ar.h:
> ++            ar_field_lens = [ 16, 12, 6, 6, 8, 10, 2 ]
> ++            descriptor = []
> ++            for field_len in ar_field_lens:
> ++                descriptor.append(l[:field_len].strip())
> ++                l = l[field_len:]
> + #            print descriptor
> +             size = int(descriptor[5])
> +             memberName = descriptor[0][:-1]
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> index e04b74a..9b94aff 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> @@ -8,12 +8,13 @@ RDEPENDS_${PN} = "python"
>   RDEPENDS_${PN}_virtclass-native = ""
>   SRCREV = "4747"
>   PV = "0.1.8+svnr${SRCPV}"
> -PR = "r5"
> +PR = "r6"
>
>   SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
>              file://index-ignore-filenotfound.patch \
>              file://mtime-int.patch \
>              file://add-license-field.patch \
> +           file://arfile_header_split.patch \
>              "
>
>   S = "${WORKDIR}/opkg-utils"

Merged into OE-Core

Thanks
	Sau!


