Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd5638.kasserver.com (dd5638.kasserver.com [85.13.130.155])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6DB75C81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 13:32:28 +0000 (UTC)
Received: from [129.70.144.65] (astra.TechFak.Uni-Bielefeld.DE [129.70.144.65])
	by dd5638.kasserver.com (Postfix) with ESMTPSA id 32A975602CD1;
	Tue, 30 Jun 2015 15:32:28 +0200 (CEST)
To: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
References: <1435670336-17154-1-git-send-email-koen.kooi@linaro.org>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <55929998.8020209@herbrechtsmeier.net>
Date: Tue, 30 Jun 2015 15:28:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <1435670336-17154-1-git-send-email-koen.kooi@linaro.org>
Subject: Re: [PATCH] cmake bbclass: fix support for native builds
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
X-List-Received-Date: Tue, 30 Jun 2015 13:32:30 -0000
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Am 30.06.2015 um 15:18 schrieb Koen Kooi:
> For native builds  of recipes (e.g. mariadb-native) cmake *must* look outside of its sysroot to find the compiler, so instruct it to do so.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>   meta/classes/cmake.bbclass | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index b0a3972..29a78e5 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -27,6 +27,9 @@ OECMAKE_RPATH ?= ""
>   OECMAKE_PERLNATIVE_DIR ??= ""
>   OECMAKE_EXTRA_ROOT_PATH ?= ""
>   
> +OECMAKE_PATHS ?= ""
> +OECMAKE_PATHS_class-native = "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH )"
> +
>   cmake_do_generate_toolchain_file() {
>   	cat > ${WORKDIR}/toolchain.cmake <<EOF
>   # CMake system name must be something like "Linux".
> @@ -67,6 +70,8 @@ list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
>   # add for non /usr/lib libdir, e.g. /usr/lib64
>   set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
>   
> +${OECMAKE_PATHS}
> +
>   EOF
>   }
>   
This would generate a second set of the 
CMAKE_FIND_ROOT_PATH_MODE_PROGRAM with a different value.

Why not add a new variable and use it in the existing set:

+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"

-set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM 
${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM})


