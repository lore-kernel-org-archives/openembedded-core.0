Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08D636C193
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 08:56:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBH8uDLn017784
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 00:56:14 -0800
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 17 Dec 2019 00:56:13 -0800
To: <openembedded-core@lists.openembedded.org>
References: <20191217080225.897186-1-mac@mcrowe.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <0cfbd853-0ad2-e010-5ee6-6277be55db9b@windriver.com>
Date: Tue, 17 Dec 2019 16:56:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20191217080225.897186-1-mac@mcrowe.com>
X-Originating-IP: [128.224.162.184]
Subject: Re: [PATCH] multilib.conf: Ensure that RECIPE_SYSROOT is unchanged for native
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
X-List-Received-Date: Tue, 17 Dec 2019 08:56:13 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/2019 04:02 PM, Mike Crowe via Openembedded-core wrote:
> Ensure that RECIPE_SYSROOT is the same for -native recipes whether
> multilib.conf is included or not.
>
> Without this change task signatures for -native recipes change when
> switching between MACHINEs that require multilib.conf and those that
> don't.
>
> This fix was one of the ones suggested by Khem Raj in
> http://lists.openembedded.org/pipermail/openembedded-core/2019-December/290303.html
>
> Add test_sstate_multilib_or_not_native_samesigs test case to
> sstatetests.py to ensure that this stays fixed.
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>   meta/conf/multilib.conf                     |  1 +
>   meta/lib/oeqa/selftest/cases/sstatetests.py | 40 +++++++++++++++++++++
>   2 files changed, 41 insertions(+)
>
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index cfed3fbbd0..58f2ac5c86 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -9,6 +9,7 @@ MULTILIBS ??= "multilib:lib32"
>   STAGING_DIR_HOST = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
>   STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
>   RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
> +RECIPE_SYSROOT_class-native = "${WORKDIR}/recipe-sysroot"

How about just removing MLPREFIX?

Regards,
Chen Qi

>   
>   INHERIT += "multilib_global"
>   
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
> index 6757a0ec68..9adb511960 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -446,6 +446,46 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
>           self.assertCountEqual(files1, files2)
>   
>   
> +    def test_sstate_multilib_or_not_native_samesigs(self):
> +        """The sstate checksums of two native recipes (and their dependencies)
> +        where the target is using multilib in one but not the other
> +        should be the same. We use the qemux86copy machine to test
> +        this.
> +        """
> +
> +        self.write_config("""
> +TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
> +TCLIBCAPPEND = \"\"
> +MACHINE = \"qemux86\"
> +require conf/multilib.conf
> +MULTILIBS = "multilib:lib32"
> +DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> +BB_SIGNATURE_HANDLER = "OEBasicHash"
> +""")
> +        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
> +        bitbake("binutils-native  -S none")
> +        self.write_config("""
> +TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
> +TCLIBCAPPEND = \"\"
> +MACHINE = \"qemux86copy\"
> +BB_SIGNATURE_HANDLER = "OEBasicHash"
> +""")
> +        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
> +        bitbake("binutils-native -S none")
> +
> +        def get_files(d):
> +            f = []
> +            for root, dirs, files in os.walk(d):
> +                for name in files:
> +                    f.append(os.path.join(root, name))
> +            return f
> +        files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps")
> +        files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps")
> +        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
> +        self.maxDiff = None
> +        self.assertCountEqual(files1, files2)
> +
> +
>       def test_sstate_noop_samesigs(self):
>           """
>           The sstate checksums of two builds with these variables changed or



