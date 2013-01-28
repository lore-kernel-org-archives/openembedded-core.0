Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tzum1-0001i8-3l
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 20:53:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0SJc5wr000443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 11:38:05 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Mon, 28 Jan 2013 11:38:04 -0800
Message-ID: <5106D39A.9070407@windriver.com>
Date: Mon, 28 Jan 2013 13:38:02 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1359387209-6272-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1359387209-6272-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: Re: [PATCH] python-smartpm: multilib fixes
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
X-List-Received-Date: Mon, 28 Jan 2013 19:53:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/28/13 9:33 AM, Bogdan Marinescu wrote:
> To fix some multilib issues, change the way smart's RPM backend decides
> if two packages can coexist:
>
>   - don't test the "multi-version" flag on the packet. In Yocto,
> almost every package can be "multi-version" in a multilib configuration.
>    - let two packages coexist if they have different versions OR different
> architectures (which is fundamental for multilib).
>
> [YOCTO #3681]
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   .../python-smartpm/smart-multilib-fixes.patch      |   31 ++++++++++++++++++++
>   .../python/python-smartpm_1.4.1.bb                 |    3 +-
>   2 files changed, 33 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch
>
> diff --git a/meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch b/meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch
> new file mode 100644
> index 0000000..6051ef3
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch
> @@ -0,0 +1,31 @@
> +smart multilib fixes
> +
> +To fix some multilib issues, change the way the RPM backend decides
> +if two packages can coexist:
> +
> + - don't test the "multi-version" flag on the packet. In Yocto,
> +almost every package can be "multi-version" in a multilib configuration.
> + - let two packages coexist if they have different versions OR different
> +architectures (which is fundamental for multilib).
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> +
> +diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
> +index 6e83d40..72eb8a9 100644
> +--- a/smart/backends/rpm/base.py
> ++++ b/smart/backends/rpm/base.py
> +@@ -233,9 +233,9 @@ class RPMPackage(Package):
> +         if (selfcolor and othercolor and selfcolor != othercolor and
> +             not sysconf.get("rpm-strict-multilib")):
> +             return True
> +-        if not pkgconf.testFlag("multi-version", self):
> +-            return False
> +-        return selfver != otherver
> ++        #if not pkgconf.testFlag("multi-version", self):
> ++        #    return False
> ++        return selfver != otherver or selfarch != otherarch

I'm not sure this is right.  There is a need one some RPM systems to allow for 
"multiple versions" of a package to be installable.  It's fairly normal for 
kernel upgrades to allow this.

The multi-arch however should always ben enabled in our configuration.  The 
check really should be that if selfarch != otherarch then it's an 'ok' 
configuration.  The version check should only happen based on the multi-version.

--Mark

> +
> +     def matches(self, relation, version):
> +         if not relation:
> diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> index 4d0f96b..06641ad 100644
> --- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> +++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> @@ -11,7 +11,7 @@ LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
>
>   DEPENDS = "python rpm"
> -PR = "r7"
> +PR = "r8"
>   SRCNAME = "smart"
>
>   SRC_URI = "\
> @@ -25,6 +25,7 @@ SRC_URI = "\
>             file://smart-tmpdir.patch \
>             file://smart-metadata-match.patch \
>             file://smart-improve-error-reporting.patch \
> +          file://smart-multilib-fixes.patch \
>             "
>
>   SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
>



