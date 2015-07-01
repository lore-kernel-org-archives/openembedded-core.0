Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id DC03265C9D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 15:08:52 +0000 (UTC)
Received: by pdbep18 with SMTP id ep18so27329292pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=F0r2Z5ulHgg/y5RJXGNBTN/Jbup8rccbkprhNw1ir9o=;
	b=v1qosw62M3tjB3/0T7h/4TBBKVKLUUsD3/LaVMuFUiqXSur3NCM3YEYvB4Cbo7QQ5w
	QxpxsMe2Ecmv64tbpC5jMUISDHvkBmWNPrjI7lBZ3tELsACJw1khQ4iz3qO9WvIJLdia
	SDW8ZyqQGwx2CzpZBhtpLUb5VrmkCcf2aBKlgcKfGX6O07HCjfiiw/HLmObnp60WAvzY
	g09lbJ5Q/XAJLj4Hys7uvaDtdUp404TTsEkoGru9oCTT2Fz9IrhGfipX03P/x5155BiN
	E3HU9ISx2OAqFHO3kiBTKq/yaf9QQxB2WpP8vqIuJwqAoJyGy4yb0QgjMIBFTyH6nbDe
	3AOQ==
X-Received: by 10.70.23.196 with SMTP id o4mr28881987pdf.164.1435763332352;
	Wed, 01 Jul 2015 08:08:52 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:4802:479d:bed2:1af1?
	([2601:202:4000:1239:4802:479d:bed2:1af1])
	by mx.google.com with ESMTPSA id qs8sm2607224pbc.38.2015.07.01.08.08.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 08:08:51 -0700 (PDT)
Message-ID: <55940280.2020806@gmail.com>
Date: Wed, 01 Jul 2015 08:08:48 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
References: <1435733845-5742-1-git-send-email-koen.kooi@linaro.org>
In-Reply-To: <1435733845-5742-1-git-send-email-koen.kooi@linaro.org>
Subject: Re: [PATCH v2] cmake bbclass: fix support for native builds
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
X-List-Received-Date: Wed, 01 Jul 2015 15:08:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 06/30/2015 11:57 PM, Koen Kooi wrote:
> For native builds  of recipes (e.g. mariadb-native) cmake *must* look outside of its sysroot to find the compiler, so instruct it to do so.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>

Works for me. Thanks Koen.

Signed-off-by: Armin Kuster <akuster808@gmail.com>

if you need it.


> ---
>   meta/classes/cmake.bbclass | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index b0a3972..c174246 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -27,6 +27,9 @@ OECMAKE_RPATH ?= ""
>   OECMAKE_PERLNATIVE_DIR ??= ""
>   OECMAKE_EXTRA_ROOT_PATH ?= ""
>
> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
> +
>   cmake_do_generate_toolchain_file() {
>   	cat > ${WORKDIR}/toolchain.cmake <<EOF
>   # CMake system name must be something like "Linux".
> @@ -50,7 +53,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>   # up libraries and tools from the native build machine
>   set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
>   set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
> -set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
> +set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
>   set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
>   set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
>
>

