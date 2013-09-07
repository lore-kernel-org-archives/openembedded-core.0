Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 68F416BEC8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2013 20:46:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2013 13:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,861,1371106800"; d="scan'208";a="392480483"
Received: from unknown (HELO [10.255.15.38]) ([10.255.15.38])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2013 13:46:23 -0700
Message-ID: <522B909E.3070609@linux.intel.com>
Date: Sat, 07 Sep 2013 13:46:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Anders Roxell <anders.roxell@linaro.org>
References: <1378401050-30782-1-git-send-email-anders.roxell@linaro.org>
	<1378586028-6613-1-git-send-email-anders.roxell@linaro.org>
In-Reply-To: <1378586028-6613-1-git-send-email-anders.roxell@linaro.org>
Cc: linaro-networking@linaro.org, patches@linaro.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ltp: update to new release 20130904
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
X-List-Received-Date: Sat, 07 Sep 2013 20:46:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2013 01:33 PM, Anders Roxell wrote:
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>   .../ltp/{ltp_20130503.bb => ltp_20130904.bb}                | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>   rename meta/recipes-extended/ltp/{ltp_20130503.bb => ltp_20130904.bb} (93%)
>
> diff --git a/meta/recipes-extended/ltp/ltp_20130503.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
> similarity index 93%
> rename from meta/recipes-extended/ltp/ltp_20130503.bb
> rename to meta/recipes-extended/ltp/ltp_20130904.bb
> index 387826d..4f2b9e7 100644
> --- a/meta/recipes-extended/ltp/ltp_20130503.bb
> +++ b/meta/recipes-extended/ltp/ltp_20130904.bb
> @@ -21,17 +21,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>
>   DEPENDS = "attr libaio libcap acl openssl"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
> +SRC_URI = "git://github.com/linux-test-project/ltp.git"
>
> -SRC_URI[md5sum] = "d448d9e9731d7ef45352fc74633cc97f"
> -SRC_URI[sha256sum] = "afdb1479e73d4da7f0d4d5d3fe1570bc5fc96e3317d4a5c10c59c046d3dfa4a0"
> +SRC_URI[md5sum] = "c8a5f6f397d2c021a0d21ad28992aa7d"
> +SRC_URI[sha256sum] = "4c13e00c1bed8f1b85daf934cd7b54a08b7b7e31874085ab9277ee563af87139"
> +
> +SRCREV = "${PV}"

Is the PV really a git hash?  That's a branch or tag which will also 
require and extra lookup.  It needs to be a git hash.

Also as noted in the last email the SRC_URI checksums are not needed as 
you are using git now.

Sau!

> +S = "${WORKDIR}/git"
>
>   export prefix = "/opt/ltp"
>   export exec_prefix = "/opt/ltp"
>
>   inherit autotools
>
> -RDEPENDS_${PN} = "perl"
> +RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
>
>   FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
>   FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
> @@ -62,7 +65,7 @@ do_extract_tarball() {
>   do_install(){
>   	install -d ${D}/opt/ltp/
>   	oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
> -	
> +
>   	# Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
>   	cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
>
>

