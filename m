Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SeWGt-0000GZ-Ie
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 20:56:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5CIkJwP008474
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 11:46:19 -0700 (PDT)
Received: from msp-dhcp49.wrs.com (172.25.34.49) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 12 Jun 2012 11:46:18 -0700
Message-ID: <4FD78E7A.2040006@windriver.com>
Date: Tue, 12 Jun 2012 13:46:18 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1339438568.git.mark.hatle@windriver.com>
	<d756c12e2cdbfabf01dc0c80c0d17d221a332822.1339438568.git.mark.hatle@windriver.com>
	<CAOHjBZueyfYKnrq19a5J697ohfxriHRSarZBvbqfTFQYzoF48g@mail.gmail.com>
In-Reply-To: <CAOHjBZueyfYKnrq19a5J697ohfxriHRSarZBvbqfTFQYzoF48g@mail.gmail.com>
Subject: Re: [PATCH 4/9] package_rpm: Add capability to directly query packageorigin
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
X-List-Received-Date: Tue, 12 Jun 2012 18:56:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/12 2:21 AM, Giuseppe Condorelli wrote:
> Hi Mark,
> this can be interesting for me. Please can you explain with an example what
> really this patch does?

The resolver database is seeded with all of the items from the packagefeed. 
When you seed (install) a database, each entry gets a record of where the 
package file exists on the disk.  This is stored in the packageorigin field.  It 
is designed to be used by resolver systems.

Before you could only query the packageorigin field if you were using raw RPM 
calls or using the --yaml export features.  We wanted to be able to query the 
file path from the resolver via the shell.  This patch added that ability.

The packageorigin is likely not useful to anyone, unless you are using it in 
conjunction w/ an associated package feed/resolver database.

--Mark

> Many thanks,
> Giuseppe
>
> 2012/6/11 Mark Hatle <mark.hatle@windriver.com <mailto:mark.hatle@windriver.com>>
>
>     Add functionality to RPM to directly query the packageorigin (path) from
>     the resolver database, instead of having to do this via an indirect method.
>
>     This results in a minor performance improvement.
>
>     Signed-off-by: Mark Hatle <mark.hatle@windriver.com
>     <mailto:mark.hatle@windriver.com>>
>     ---
>     meta/classes/package_rpm.bbclass | 18 +++++++-------
>     .../rpm/rpm/rpm-packageorigin.patch | 23 ++++++++++++++++++++
>     meta/recipes-devtools/rpm/rpm_5.4.9.bb <http://rpm_5.4.9.bb> | 3 +-
>     3 files changed, 34 insertions(+), 10 deletions(-)
>     create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
>
>     diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
>     index 35928ab..097fa12 100644
>     --- a/meta/classes/package_rpm.bbclass
>     +++ b/meta/classes/package_rpm.bbclass
>     @@ -130,12 +130,12 @@ resolve_package_rpm () {
>     shift
>     local pkg_name=""
>     for solve in `cat ${conffile}`; do
>     - pkg_name=$(${RPM} -D "_dbpath $solve" -D "__dbi_txn create nofsync" -q
>     --yaml $@ | grep -i 'Packageorigin' | cut -d : -f 2)
>     - if [ -n "$pkg_name" ]; then
>     + pkg_name=$(${RPM} -D "_dbpath $solve" -D "__dbi_txn create nofsync" -q
>     --qf "%{packageorigin}\n" "$@" | grep -v "is not installed" || true)
>     + if [ -n "$pkg_name" -a "$pkg_name" != "(none)" ]; then
>     + echo $pkg_name
>     break;
>     fi
>     done
>     - echo $pkg_name
>     }
>
>     # rpm common command and options
>     @@ -401,9 +401,9 @@ package_install_internal_rpm () {
>
>     # Now that we have a solution, pull out a list of what to install...
>     echo "Manifest: ${target_rootfs}/install/install.manifest"
>     - ${RPM} -D "_dbpath ${target_rootfs}/install" -qa --yaml \
>     + ${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf "%{packageorigin}\n" \
>     -D "__dbi_txn create nofsync private" \
>     - | grep -i 'Packageorigin' | cut -d : -f 2 >
>     ${target_rootfs}/install/install_solution.manifest
>     + > ${target_rootfs}/install/install_solution.manifest
>
>     touch ${target_rootfs}/install/install_multilib_solution.manifest
>
>     @@ -421,9 +421,9 @@ package_install_internal_rpm () {
>
>     # Now that we have a solution, pull out a list of what to install...
>     echo "Manifest: ${target_rootfs}/install/install_multilib.manifest"
>     - ${RPM} -D "_dbpath ${target_rootfs}/install" -qa --yaml \
>     + ${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf "%{packageorigin}\n" \
>     -D "__dbi_txn create nofsync private" \
>     - | grep -i 'Packageorigin' | cut -d : -f 2 >
>     ${target_rootfs}/install/install_multilib_solution.manifest
>     + > ${target_rootfs}/install/install_multilib_solution.manifest
>
>     fi
>
>     @@ -478,9 +478,9 @@ EOF
>     -U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
>     ${target_rootfs}/install/initial_install.manifest
>
>     - ${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --yaml \
>     + ${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --qf "%{packageorigin}\n" \
>     -D "__dbi_txn create nofsync private" \
>     - | grep -i 'Packageorigin' | cut -d : -f 2 >
>     ${target_rootfs}/install/initial_solution.manifest
>     + > ${target_rootfs}/install/initial_solution.manifest
>
>     rpm_update_pkg ${target_rootfs}/install/initial_solution.manifest
>
>     diff --git a/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
>     b/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
>     new file mode 100644
>     index 0000000..3c6dad4
>     --- /dev/null
>     +++ b/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
>     @@ -0,0 +1,23 @@
>     +Add the ability to query the packageorigin
>     +
>     +Written by jbj at rpm5.org <http://rpm5.org>
>     +
>     +Signed-off-by: Mark Hatle <mark.hatle@windriver.com
>     <mailto:mark.hatle@windriver.com>>
>     +
>     +Index: rpm-5.4.8/rpmdb/hdrfmt.c
>     +===================================================================
>     +--- rpm-5.4.8.orig/rpmdb/hdrfmt.c
>     ++++ rpm-5.4.8/rpmdb/hdrfmt.c
>     +@@ -2403,8 +2403,10 @@ static int pkgoriginTag(Header h, HE_t
>     + int rc = 1;
>     +
>     + he->tag = RPMTAG_PACKAGEORIGIN;
>     +- if (!headerGet(h, he, HEADERGET_NOEXTENSION)
>     +- && (origin = headerGetOrigin(h)) != NULL)
>     ++ /* XXX two sources for tag data: what search precedence? */
>     ++ if (headerGet(h, he, HEADERGET_NOEXTENSION))
>     ++ rc = 0;
>     ++ else if ((origin = headerGetOrigin(h)) != NULL)
>     + {
>     + he->t = RPM_STRING_TYPE;
>     + he->p.str = xstrdup(origin);
>     diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb <http://rpm_5.4.9.bb>
>     b/meta/recipes-devtools/rpm/rpm_5.4.9.bb <http://rpm_5.4.9.bb>
>     index 2ca0f58..a38a684 100644
>     --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb <http://rpm_5.4.9.bb>
>     +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb <http://rpm_5.4.9.bb>
>     @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>     LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>
>     DEPENDS = "libpcre attr acl popt ossp-uuid file"
>     -PR = "r41"
>     +PR = "r42"
>
>     # rpm2cpio is a shell script, which is part of the rpm src.rpm. It is needed
>     # in order to extract the distribution SRPM into a format we can extract...
>     @@ -70,6 +70,7 @@ SRC_URI =
>     "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
>     file://rpm-macros.patch \
>     file://rpm-lua.patch \
>     file://rpm-ossp-uuid.patch \
>     + file://rpm-packageorigin.patch \
>     "
>
>     SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
>     --
>     1.7.3.4
>
>
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



