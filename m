Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd19416.kasserver.com (dd19416.kasserver.com [85.13.139.185])
	by mail.openembedded.org (Postfix) with ESMTP id 037536B1C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 07:46:10 +0000 (UTC)
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 813AB1840E9E;
	Wed, 17 Jul 2013 09:46:09 +0200 (CEST)
Message-ID: <51E64BBF.5030900@herbrechtsmeier.net>
Date: Wed, 17 Jul 2013 09:46:07 +0200
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1374042411-1193-1-git-send-email-net147@gmail.com>
In-Reply-To: <1374042411-1193-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] cmake.bbclass: allow searching host paths for non-target builds
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
X-List-Received-Date: Wed, 17 Jul 2013 07:46:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 17.07.2013 08:26, schrieb Jonathan Liu:
> This allows /usr/bin/{ld,ar,objcopy,objdump,ranlib,strip} to be found
> and the CMAKE_{LINKER,AR,OBJCOPY,OBJDUMP,RANLIB,STRIP} cmake variables
> to be properly set for native cmake recipes.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/classes/cmake.bbclass | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 310242e..2040147 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -46,12 +46,7 @@ set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLA
>   set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>   set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>   
> -# only search in the paths provided so cmake doesnt pick
> -# up libraries and tools from the native build machine
>   set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
> -set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
> -set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
> -set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
This changes the whole find behaviour and allows cmake to find *all* 
software from the native build machine.  You should add 
NO_CMAKE_FIND_ROOT_PATH to the find_xxx calls or you could manual set 
the variables and bypass the find calls.


