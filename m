Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 86E4275CF1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:58:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8FDw1Y8000643
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Sep 2015 06:58:02 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Tue, 15 Sep 2015 06:58:01 -0700
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1442322326-10462-1-git-send-email-markus.lehtonen@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55F823E8.2030800@windriver.com>
Date: Tue, 15 Sep 2015 08:58:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1442322326-10462-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Bogdan Voiculescu <bogdanx.a.voiculescu@intel.com>
Subject: Re: [PATCH] rpm: search for gpg if gpg2 is not found
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
X-List-Received-Date: Tue, 15 Sep 2015 13:58:15 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 9/15/15 8:05 AM, Markus Lehtonen wrote:
> Some (host) systems only have a binary named 'gpg' (e.g. Fedora) while
> some only have 'gpg2' (Ubuntu) and others have both of them (openSUSE).
> Currently the behavior of rpm-native with regards to GnuPG depends on
> the host platform: rpm(-native) is configured to use GnuPG binary of the
> host system if 'gpg2' is found in $PATH. Otherwise, rpm(-native) will
> default to using '%{_bindir}/gpg2' which will be pointing to a sysroot
> binary which usually does not exist.
> 
> This patch changes rpm to look for both 'gpg' and 'gpg2' when searching
> for the GnuPG binary in PATH. This makes possible to create signed RPM
> packages on different host platforms, using the GnuPG binary of the
> host, without the need to explicitly define the gpg binary in bitbake
> configuration (via GPG_BIN variable).
> 
> [YOCTO #8134]

The only concern I have with this change is that it may affect both native and
target RPM.  Please verify that the target RPM settings are still correct.

FYI, the value isn't used for anything but the initial setup of some RPM macro
scripts.  Typically I tell uses that they are responsible for providing the
proper ~/.oerpmmacros file in order to instruct RPM where some of these types of
tools are present.  My file for instance:

%__gpg gpg2
%_gpg_name Test RPM Signing Key

--Mark

> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  .../configure.ac-check-for-both-gpg2-and-gpg.patch | 29 ++++++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch
> 
> diff --git a/meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch b/meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch
> new file mode 100644
> index 0000000..f5db167
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch
> @@ -0,0 +1,29 @@
> +configure.ac: search for both gpg2 and gpg
> +
> +On some platforms the GnuPG binary is named 'gpg2' whereas others have 'gpp'.
> +This patch increases compatibility by searching for 'gpg' in addition to
> +'gpg2'.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 6746b4c..f6922ae 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -562,7 +562,7 @@ AC_PATH_PROG(__DIFF, diff, /bin/diff, $MYPATH)
> + AC_PATH_PROG(__DITTO, ditto, %{_bindir}/ditto, $MYPATH)
> + AC_PATH_PROG(__FILE, file, %{_bindir}/file, $MYPATH)
> + AC_PATH_PROG(__GIT, git, %{_bindir}/git, $MYPATH)
> +-AC_PATH_PROG(__GPG, gpg2, %{_bindir}/gpg2, $MYPATH)
> ++AC_PATH_PROGS(__GPG, [gpg2 gpg], %{_bindir}/gpg2, $MYPATH)
> + AC_PATH_PROG(__GSR, gsr, %{_bindir}/gsr, $MYPATH)
> + AC_PATH_PROG(__GST_INSPECT, gst-inspect-0.10, %{_bindir}/gst-inspect-0.10, $MYPATH)
> + AC_PATH_PROG(__GZIP, gzip, /bin/gzip, $MYPATH)
> +-- 
> +2.1.4
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> index 1f9a4bd..b450c6f 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> @@ -98,6 +98,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
>  	   file://rpm-check-rootpath-reasonableness.patch \
>  	   file://rpm-macros.in-disable-external-key-server.patch \
>  	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
> +	   file://configure.ac-check-for-both-gpg2-and-gpg.patch \
>  	  "
>  
>  # Uncomment the following line to enable platform score debugging
> 


