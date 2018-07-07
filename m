Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 73B3160069
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jul 2018 12:14:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w67CEVtn010430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 7 Jul 2018 13:14:33 +0100
Message-ID: <995cd601a894144e95c2a2f940b7ba240a2e55f1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 07 Jul 2018 13:14:31 +0100
In-Reply-To: <1530870706-206950-1-git-send-email-hongzhi.song@windriver.com>
References: <1530870706-206950-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v3] kernel-selftest: Add a recipe on kernel selftest
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
X-List-Received-Date: Sat, 07 Jul 2018 12:14:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-07-06 at 05:51 -0400, Hongzhi.Song wrote:
> The recipe builds the framework for kernel-selftest. Now, it just
> contains two sets of testcase, bpf and vm. We are appending others
> to the recipe.
> 
> It needs some features which will be written into relevant recipe.
> But now, you should add them to conf/local.conf manually.
> KERNEL_FEATURES_append += "features/bpf/bpf.scc"
> 
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  .../kernel-selftest/kernel-selftest.bb             | 94
> ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 meta/recipes-kernel/kernel-selftest/kernel-
> selftest.bb
> 
> diff --git a/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
> b/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
> new file mode 100644
> index 0000000..28fd178
> --- /dev/null
> +++ b/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
> @@ -0,0 +1,94 @@
> +SUMMARY = "Kernel selftest for Linux"
> +DESCRIPTION = "Kernel selftest for Linux"
> +LICENSE = "GPLv2"
> +
> +# for bpf and vm
> +DEPENDS = " \
> +    elfutils \
> +    libcap \
> +    libcap-ng \
> +    fuse \
> +    util-linux \
> +    rsync-native \
> +"

This adds a DEPENDS on fuse but fuse is not in OE-Core therefore this
recipe can never build there.

+do_configure[prefuncs] += "copy_perf_source_from_kernel remove_clang_related"
+python copy_perf_source_from_kernel() {

We're copying to perf source here? The function name needs tweaking.

Cheers,

Richard


