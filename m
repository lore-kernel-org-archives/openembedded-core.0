Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id E0B4B7687B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:11:26 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 1B5D9F811E9; Tue, 15 Sep 2015 07:11:25 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 72E2DF811E9;
	Tue, 15 Sep 2015 07:11:25 -0600 (MDT)
To: openembedded-core@lists.openembedded.org
References: <1442322326-10462-1-git-send-email-markus.lehtonen@linux.intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <55F818FF.2060605@mlbassoc.com>
Date: Tue, 15 Sep 2015 07:11:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1442322326-10462-1-git-send-email-markus.lehtonen@linux.intel.com>
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
X-List-Received-Date: Tue, 15 Sep 2015 13:11:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-15 07:05, Markus Lehtonen wrote:
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
>
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>   .../configure.ac-check-for-both-gpg2-and-gpg.patch | 29 ++++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
>   2 files changed, 30 insertions(+)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch
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
                                                                            ^^^
Typo?

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
>   	   file://rpm-check-rootpath-reasonableness.patch \
>   	   file://rpm-macros.in-disable-external-key-server.patch \
>   	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
> +	   file://configure.ac-check-for-both-gpg2-and-gpg.patch \
>   	  "
>
>   # Uncomment the following line to enable platform score debugging
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

