Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TnH10-0003Ar-Tl
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Dec 2012 00:01:01 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Dec 2012 14:46:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,349,1355126400"; d="scan'208";a="269529099"
Received: from unknown (HELO [10.255.12.150]) ([10.255.12.150])
	by fmsmga002.fm.intel.com with ESMTP; 24 Dec 2012 14:46:06 -0800
Message-ID: <50D8DB2E.4040800@linux.intel.com>
Date: Mon, 24 Dec 2012 14:46:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
References: <1356097300-25337-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1356097300-25337-1-git-send-email-bogdan.a.marinescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] git: updated to 1.8.0.2
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
X-List-Received-Date: Mon, 24 Dec 2012 23:01:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2012 05:41 AM, Bogdan Marinescu wrote:
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   meta/recipes-devtools/git/{git_1.7.7.bb => git_1.8.0.2.bb} |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-devtools/git/{git_1.7.7.bb => git_1.8.0.2.bb} (63%)
>
This update seems to introduce a dependency on gettext's msgfmt and on 
libtinfo, I saw a couple of failures on the autobuild due to these not 
being build for git-native.

You might verify if your host has gettext installed, that might mask 
this issue, as seen on the autobuilder, ab02 does not have gettext 
installed.

A clean re-build, or cleaning gettext-native and rebuilding should show 
this issue if you do not have a host gettext installed (verify by 
looking for /usr/bin/msgfmt).

See (msgfmt failure):
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/846/steps/shell_29/logs/stdio
and (tinfo failure)
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/847/steps/shell_29/logs/stdio

Note that it builds OK in the atom-pc case, because those natives are 
now build and available for git to use.

It may require some DEPENDS changes, use caution here, we want to keep 
this part of the startup path as short as possible, so watch the 
dependency chains.

Thanks

Sau!

> diff --git a/meta/recipes-devtools/git/git_1.7.7.bb b/meta/recipes-devtools/git/git_1.8.0.2.bb
> similarity index 63%
> rename from meta/recipes-devtools/git/git_1.7.7.bb
> rename to meta/recipes-devtools/git/git_1.8.0.2.bb
> index 6b6e04b..1726317 100644
> --- a/meta/recipes-devtools/git/git_1.7.7.bb
> +++ b/meta/recipes-devtools/git/git_1.8.0.2.bb
> @@ -1,10 +1,10 @@
>   require git.inc
>
> -PR = "r3"
> +PR = "r0"
>
>   SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
> -SRC_URI[md5sum] = "5d645884e688921e773186783b65ce33"
> -SRC_URI[sha256sum] = "5a977bc01e4989b9928345e99aab15ce896cf5897c6e32eb449538574df377f6"
> +SRC_URI[md5sum] = "1aca109d4a719fe5bc43d25927fbc7d9"
> +SRC_URI[sha256sum] = "c06d5d29389e90583d16ec41d5be931593196f6842f9b14e910a0b5781c10e07"
>
>   EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
>                    ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
>


