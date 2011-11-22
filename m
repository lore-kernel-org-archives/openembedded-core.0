Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RSut3-0002FP-E2
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 19:16:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAMI9Xhw015984
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 10:09:33 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 22 Nov 2011 10:09:32 -0800
Message-ID: <4ECBE55C.5090703@windriver.com>
Date: Tue, 22 Nov 2011 12:09:32 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1321516924.git.lei.mei@intel.com>
	<ea4995cfbec9d75978131ba7566e30d3a20f99fa.1321516924.git.lei.mei@intel.com>
In-Reply-To: <ea4995cfbec9d75978131ba7566e30d3a20f99fa.1321516924.git.lei.mei@intel.com>
Subject: Re: [PATCH 1/1] rpm: Flush old logs by change the DB_CONFIG
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
X-List-Received-Date: Tue, 22 Nov 2011 18:16:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by:  Mark Hatle <mark.hatle@windriver.com>

(Note: this is the fix suggested by the rpm5 community.)

On 11/17/11 2:32 AM, Mei Lei wrote:
> Fixes [YOCTO #1174]
>
> Rpm logs will grow indefinitely, so change the config to flush those old logs.
>
> Signed-off-by: Mei Lei<lei.mei@intel.com>
> ---
>   .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch |   12 ++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    5 +++--
>   2 files changed, 15 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
>
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch b/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
> new file mode 100644
> index 0000000..aafa416
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
> @@ -0,0 +1,12 @@
> +diff --git a/rpmdb/DB_CONFIG.in b/rpmdb/DB_CONFIG.in
> +index 8b94c94..e0b4689 100644
> +--- a/rpmdb/DB_CONFIG.in
> ++++ b/rpmdb/DB_CONFIG.in
> +@@ -4,6 +4,7 @@ set_data_dir		.
> + set_create_dir		.
> + set_lg_dir		./log
> + set_tmp_dir		./tmp
> ++set_flags 		db_log_autoremove on
> +
> + # -- thread_count must be>= 8
> + set_thread_count	64
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> index f8fe836..d14bce4 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> @@ -45,11 +45,12 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>   DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
>   extrarpmdeps = "python perl"
>   extrarpmdeps_virtclass-native = "file-native"
> -PR = "r23"
> +PR = "r24"
>
>   # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>   # in order to extract the distribution SRPM into a format we can extract...
>   SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;extract=rpm-5.4.0.tar.gz \
> +	   file://rpm-log-auto-rm.patch \
>   	   file://perfile_rpmdeps.sh \
>   	   file://rpm-autogen.patch \
>   	   file://rpm-libsql-fix.patch \
> @@ -192,6 +193,7 @@ FILES_${PN} = "${bindir}/rpm \
>   		${libdir}/rpm/bin/rpmrepo \
>   		${libdir}/rpm/bin/rpmspecdump \
>   		${libdir}/rpm/bin/wget \
> +		/var/lib/rpm \
>   		"
>
>   #		${libdir}/rpm/magic
> @@ -208,7 +210,6 @@ FILES_${PN}-dbg += "${libdir}/rpm/.debug \
>   FILES_${PN}-common = "${bindir}/rpm2cpio \
>   		${bindir}/gendiff \
>   		/etc/rpm \
> -		/var/lib/rpm \
>   		/var/spool/repackage \
>   		"
>



