Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SY9e7-0006ST-3U
	for openembedded-core@lists.openembedded.org;
	Sat, 26 May 2012 07:34:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4Q5OKKp019166
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 22:24:20 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 25 May 2012 22:24:19 -0700
Message-ID: <4FC06902.4020605@windriver.com>
Date: Sat, 26 May 2012 13:24:18 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1337933617.git.liezhi.yang@windriver.com>
	<fad645aa59e8cc5634500b35bc607e0b61dc997f.1337933617.git.liezhi.yang@windriver.com>
In-Reply-To: <fad645aa59e8cc5634500b35bc607e0b61dc997f.1337933617.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
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
X-List-Received-Date: Sat, 26 May 2012 05:34:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


I'm sorry that I forgot to update the PR bump, I've updated it
for both opkg_0.1.8.bb and opkg_svn.bb:

-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"

and pushed the updated patch to:
   git://git.pokylinux.org/poky-contrib robert/ipk_arch
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ipk_arch

// Robert

On 05/25/2012 06:02 PM, Robert Yang wrote:
> There is a bug if we:
> 1) bitbake core-image-sato-sdk MACHINE=qemux86
> 2) bitbake core-image-sato with MACHINE=crownbay
>
> Then several pkgs in deploy/ipk/i586 would be installed to crownbay's
> image even if there is one in deploy/ipk/core2 and we have set the
> core2's priority higher than i586, when the version in deploy/ipk/i586 is
> higher. This doesn't work for us, for example, what the crownbay need is
> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
>
> This is caused by opkg's selecting mechanism, if there are more than one
> candidates which have the same pkg name in the candidate list, for
> example, the same pkg with different versions, then it will use the last
> one which is the highest version in the list, this doesn't work for us,
> it should respect to the arch priorities in such a case.
>
> This is for both denzil and master branch.
>
> [YOCTO #2360]
>
> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
> ---
>   .../opkg/opkg/respect-to-arch.patch                |   47 ++++++++++++++++++++
>   meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    1 +
>   meta/recipes-devtools/opkg/opkg_svn.bb             |    1 +
>   3 files changed, 49 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/opkg/opkg/respect-to-arch.patch
>
> diff --git a/meta/recipes-devtools/opkg/opkg/respect-to-arch.patch b/meta/recipes-devtools/opkg/opkg/respect-to-arch.patch
> new file mode 100644
> index 0000000..6f4537f
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/respect-to-arch.patch
> @@ -0,0 +1,47 @@
> +pkg_hash.c: respect to the arch priorities when good_pkg_by_name
> +
> +If there are more than one candidates which have the same pkg name in
> +the candidate list, for example, the same pkg with different versions,
> +then it will use the last one which is the highest version in the list,
> +it should respect to the arch priorities in such a case.
> +
> +Upstream Status: Pending
> +
> +Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
> +---
> + libopkg/pkg_hash.c |   18 +++++++++++++++---
> + 1 files changed, 15 insertions(+), 3 deletions(-)
> +
> +diff --git a/libopkg/pkg_hash.c b/libopkg/pkg_hash.c
> +index a99cf6b..cc048c8 100644
> +--- a/libopkg/pkg_hash.c
> ++++ b/libopkg/pkg_hash.c
> +@@ -376,10 +376,22 @@ pkg_hash_fetch_best_installation_candidate(abstract_pkg_t *apkg,
> +           if (constraint_fcn(matching, cdata)) {
> +              opkg_msg(DEBUG, "Candidate: %s %s.\n",
> + 			     matching->name, matching->version) ;
> +-             good_pkg_by_name = matching;
> ++             /* Respect to the arch priorities when given alternatives */
> ++             if (good_pkg_by_name) {
> ++                 if (matching->arch_priority>= good_pkg_by_name->arch_priority) {
> ++                     good_pkg_by_name = matching;
> ++                     opkg_msg(DEBUG, "%s %s wins by priority.\n",
> ++                         matching->name, matching->version) ;
> ++                 } else
> ++                     opkg_msg(DEBUG, "%s %s wins by priority.\n",
> ++                         good_pkg_by_name->name, good_pkg_by_name->version) ;
> ++             } else
> ++                 good_pkg_by_name = matching;
> + 	     /* It has been provided by hand, so it is what user want */
> +-             if (matching->provided_by_hand == 1)
> +-                break;
> ++             if (matching->provided_by_hand == 1) {
> ++                 good_pkg_by_name = matching;
> ++                 break;
> ++             }
> +           }
> +      }
> +
> +--
> +1.7.1
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
> index c206b37..5161824 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.1.8.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
> @@ -3,6 +3,7 @@ require opkg.inc
>   SRC_URI = "http://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
>              file://add_vercmp.patch \
>              file://headerfix.patch \
> +           file://respect-to-arch.patch \
>             "
>
>   PR = "${INC_PR}.0"
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
> index c07d393..c3ed973 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -6,6 +6,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
>              file://fix_installorder.patch \
>              file://offline_postinstall.patch\
>              file://track_parents.patch \
> +           file://respect-to-arch.patch \
>   "
>
>   S = "${WORKDIR}/trunk"


