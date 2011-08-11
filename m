Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrcym-0003ez-OQ
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 23:39:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Aug 2011 14:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,358,1309762800"; 
   d="scan'208";a="6301647"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Aug 2011 14:35:19 -0700
Message-ID: <4E444B17.7030000@linux.intel.com>
Date: Thu, 11 Aug 2011 14:35:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: jani.uusi-rantala@nokia.com
References: <B497E783C723AE4386DDEA96AF1D2B989EB6DB@008-AM1MPN1-011.mgdnok.nokia.com>
In-Reply-To: <B497E783C723AE4386DDEA96AF1D2B989EB6DB@008-AM1MPN1-011.mgdnok.nokia.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Magic file path should be given for rpmbuild
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
X-List-Received-Date: Thu, 11 Aug 2011 21:39:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/11/2011 08:50 AM, jani.uusi-rantala@nokia.com wrote:
> From d54b975506c392cfb59dbb3caf313ac061b6fa01 Mon Sep 17 00:00:00 2001
> From: Jani Uusi-Rantala <jani.uusi-rantala@nokia.com>
> Date: Thu, 11 Aug 2011 18:37:56 +0300
> Subject: [PATCH] Magic file path should be given for rpmbuild in
>  _rpmfc_magic_path define so that build system default file
>  is not used by accident. Not doing this caused many
>  packages to fail building in several systems.
>
> Fixes [YOCTO #1358]
>
> Signed-off-by: Jani Uusi-Rantala <jani.uusi-rantala@nokia.com>
> ---
>  meta/classes/package_rpm.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index f123229..59e8d48 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -822,6 +822,7 @@ python do_package_rpm () {
>  	targetvendor = bb.data.getVar('TARGET_VENDOR', d, True)
>  	pkgwritedir = bb.data.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH}', d)
>  	pkgarch = bb.data.expand('${PACKAGE_ARCH}', d)
> +	magicfile = bb.data.expand('${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc', d)
>  	bb.mkdirhier(pkgwritedir)
>  	os.chmod(pkgwritedir, 0755)
>
> @@ -834,6 +835,7 @@ python do_package_rpm () {
>  	cmd = cmd + " --define '__find_provides " + outprovides + "'"
>  	cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
>  	cmd = cmd + " --define 'debug_package %{nil}'"
> +	cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
>  	cmd = cmd + " -bb " + outspecfile
>
>  	# Build the rpm package!
> --

Merged into OE-Core

Thanks
	Sau!


