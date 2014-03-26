Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1D3860DFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 08:25:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q8PULR000883
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Mar 2014 01:25:30 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 26 Mar 2014 01:25:29 -0700
Message-ID: <53328EEF.5000500@windriver.com>
Date: Wed, 26 Mar 2014 16:25:19 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
References: <1385781487-18314-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1385781487-18314-1-git-send-email-ming.liu@windriver.com>
Subject: Re: [PATCH V2] gzip: fix MakeMaker issues with using wrong SHELL/GREP
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
X-List-Received-Date: Wed, 26 Mar 2014 08:25:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Ping

//Hongxu

On 11/30/2013 11:18 AM, Ming Liu wrote:
> A set of substitution is being processed to all target scripts with sed by
> replacing some key words with the detected values at configure time, this
> is exactly not compliant with cross compling, and will cause missing path
> errors at run time like:
> "/usr/bin/zgrep: line 230: /usr/bin/grep: No such file or directory"
>
> Fixed by removing unneeded substitution and using real runtime paths
> instead.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   .../gzip/gzip-1.6/wrong-path-fix.patch             | 31 ++++++++++++++++++++++
>   meta/recipes-extended/gzip/gzip.inc                |  2 ++
>   2 files changed, 33 insertions(+)
>   create mode 100644 meta/recipes-extended/gzip/gzip-1.6/wrong-path-fix.patch
>
> diff --git a/meta/recipes-extended/gzip/gzip-1.6/wrong-path-fix.patch b/meta/recipes-extended/gzip/gzip-1.6/wrong-path-fix.patch
> new file mode 100644
> index 0000000..92863d6
> --- /dev/null
> +++ b/meta/recipes-extended/gzip/gzip-1.6/wrong-path-fix.patch
> @@ -0,0 +1,31 @@
> +fix MakeMaker issues with using wrong SHELL/GREP
> +
> +A set of substitution is being processed to all target scripts with sed by
> +replacing some key words with the detected values at configure time, this
> +is exactly not compliant with cross compling, and will cause missing path
> +errors at run time like:
> +"/usr/bin/zgrep: line 230: /usr/bin/grep: No such file or directory"
> +
> +Fixed by removing unneeded substitution and using real runtime paths
> +instead.
> +
> +Signed-off-by: Ming Liu <ming.liu@windriver.com>
> +
> +Upstream-Status: Pending
> +
> +Index: gzip-1.3.12/Makefile.am
> +===================================================================
> +diff -urpN a/Makefile.am b/Makefile.am
> +--- a/Makefile.am	2013-11-30 10:06:09.402234871 +0800
> ++++ b/Makefile.am	2013-11-30 10:13:42.952236025 +0800
> +@@ -81,9 +81,8 @@ gzip.doc.gz: gzip.doc $(bin_PROGRAMS)
> + SUFFIXES = .in
> + .in:
> + 	$(AM_V_GEN)sed \
> +-		-e 's|/bin/sh|$(SHELL)|g' \
> + 		-e 's|[@]bindir@|'\''$(bindir)'\''|g' \
> +-		-e 's|[@]GREP@|$(GREP)|g' \
> ++		-e 's|[@]GREP@|$(base_bindir)/grep|g' \
> + 		-e 's|[@]VERSION@|$(VERSION)|g' \
> + 		$(srcdir)/$@.in >$@-t \
> + 	  && chmod a+x $@-t \
> diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
> index 6ec1dae..bf3469d 100644
> --- a/meta/recipes-extended/gzip/gzip.inc
> +++ b/meta/recipes-extended/gzip/gzip.inc
> @@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>   
>   SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
>   
> +SRC_URI_append_class-target = " file://wrong-path-fix.patch"
> +
>   inherit autotools
>   
>   do_install_append () {


