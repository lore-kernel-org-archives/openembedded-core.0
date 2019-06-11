Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 792D77C860
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 02:49:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5B2luP6020165
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Jun 2019 19:49:04 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 10 Jun 2019 19:48:45 -0700
To: Douglas Royds <douglas.royds@taitradio.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190611015756.19184-1-douglas.royds@taitradio.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <73faa614-2438-4e1c-1cf9-d40fa5a60d52@windriver.com>
Date: Tue, 11 Jun 2019 10:46:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611015756.19184-1-douglas.royds@taitradio.com>
Subject: Re: [PATCH] json-c: update to current upstream head, with --disable-werror
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
X-List-Received-Date: Tue, 11 Jun 2019 02:49:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/6/11 上午9:57, Douglas Royds via Openembedded-core wrote:
> Upstream json-c haven't made a release since March 2018.
> Adopt the current HEAD revision, pulling it directly from git.
>
> icecc preprocesses source files locally before shipping them off to be compiled
> on remote hosts. This preprocessing removes comments, including /* fallthough */
> comments in switch statements that normally prevent an implicit-fallthrough
> warning, see https://github.com/icecc/icecream/issues/419
>
> Rather than turning off -Werror by patching configure.ac, the upstream project
> has implemented a configure option, --disable-werror, in response to Ross's
> https://github.com/json-c/json-c/issues/489
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>   meta/recipes-devtools/json-c/json-c_0.13.1.bb | 30 -------------------
>   meta/recipes-devtools/json-c/json-c_git.bb    | 19 ++++++++++++

Use option '-M' of git format-patch may make the patch more clear. And 
why not just backport the 'disable-werror' commit?

Regards,
Kai


>   2 files changed, 19 insertions(+), 30 deletions(-)
>   delete mode 100644 meta/recipes-devtools/json-c/json-c_0.13.1.bb
>   create mode 100644 meta/recipes-devtools/json-c/json-c_git.bb
>
> diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> deleted file mode 100644
> index 5b10e68297..0000000000
> --- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SUMMARY = "C bindings for apps which will manipulate JSON data"
> -DESCRIPTION = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C."
> -HOMEPAGE = "https://github.com/json-c/json-c/wiki"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
> -
> -SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
> -SRC_URI[md5sum] = "04969ad59cc37bddd83741a08b98f350"
> -SRC_URI[sha256sum] = "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
> -
> -UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+).tar"
> -# json-c releases page is fetching the list of releases in some weird XML format
> -# from https://s3.amazonaws.com/json-c_releases and processes it with javascript :-/
> -#UPSTREAM_CHECK_URI = "https://s3.amazonaws.com/json-c_releases/releases/index.html"
> -RECIPE_UPSTREAM_VERSION = "0.13.1"
> -RECIPE_UPSTREAM_DATE = "Mar 04, 2018"
> -CHECK_DATE = "May 02, 2018"
> -
> -RPROVIDES_${PN} = "libjson"
> -
> -inherit autotools
> -
> -EXTRA_OECONF = "--enable-rdrand"
> -
> -do_configure_prepend() {
> -    # Clean up autoconf cruft that should not be in the tarball
> -    rm -f ${S}/config.status
> -}
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/json-c/json-c_git.bb b/meta/recipes-devtools/json-c/json-c_git.bb
> new file mode 100644
> index 0000000000..07daa5ba11
> --- /dev/null
> +++ b/meta/recipes-devtools/json-c/json-c_git.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "C bindings for apps which will manipulate JSON data"
> +DESCRIPTION = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C."
> +HOMEPAGE = "https://github.com/json-c/json-c/wiki"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
> +
> +SRC_URI = "git://github.com/json-c/json-c.git"
> +SRCREV = "07ea04e65193c3e5c902c5b79421d5fa48ff67c7"
> +S = "${WORKDIR}/git"
> +
> +RPROVIDES_${PN} = "libjson"
> +
> +inherit autotools
> +
> +EXTRA_OECONF = "--disable-werror \
> +                --enable-rdrand \
> +                "
> +
> +BBCLASSEXTEND = "native nativesdk"


-- 
Kai Kang


