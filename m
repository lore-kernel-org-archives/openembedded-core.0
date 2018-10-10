Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id C6EEF60234
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 08:16:20 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w9A8GI8R004628
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 10 Oct 2018 10:16:18 +0200
Received: from [167.87.5.162] ([167.87.5.162])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w9A8GIvi024497;
	Wed, 10 Oct 2018 10:16:18 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181009140315.4933-1-pascal.bach@siemens.com>
	<CAJTo0LZtZnKVSu7cB6TnEad_KmER5xDcMaWyi6pfN52vveF3-w@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <f4f7df66-94ef-2fd7-4969-c361cd594939@siemens.com>
Date: Wed, 10 Oct 2018 10:16:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZtZnKVSu7cB6TnEad_KmER5xDcMaWyi6pfN52vveF3-w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: search both sysroot-native and host for native packages
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
X-List-Received-Date: Wed, 10 Oct 2018 08:16:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I re submitted all 4 patches a series.

Sorry for the inconvenience, I miss-judged the conflicts between the patches.

Passcal


On 09.10.2018 17:07, Burton, Ross wrote:
> All but this one apply now... weird.
>
> If you can rebase on top of poky-contrib:ross/thud then that would be great.
>
> Ross
>
> On Tue, 9 Oct 2018 at 15:07, Pascal Bach <pascal.bach@siemens.com <mailto:pascal.bach@siemens.com>> wrote:
>
>     Certain headers and libraries like `math.h` an `-m` are only available on the
>     host as they are provided by the host toolchain.
>
>     This leads to issues that a find_library in CMake doesn't find the `m` library
>     of a find_path doesn't find `math.h`. This issue occurred in the wireshark recipe
>     for example.
>
>     This change enables CMake to also look on the host for libraries and includes when
>     building a native package.
>
>     Signed-off-by: Pascal Bach <pascal.bach@siemens.com <mailto:pascal.bach@siemens.com>>
>     ---
>      meta/classes/cmake.bbclass | 12 ++++++------
>      1 file changed, 6 insertions(+), 6 deletions(-)
>
>     diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>     index 6e2c34e4c6..89a2a77a50 100644
>     --- a/meta/classes/cmake.bbclass
>     +++ b/meta/classes/cmake.bbclass
>     @@ -43,8 +43,8 @@ OECMAKE_RPATH ?= ""
>      OECMAKE_PERLNATIVE_DIR ??= ""
>      OECMAKE_EXTRA_ROOT_PATH ?= ""
>
>     -OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
>     -OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
>     +OECMAKE_FIND_ROOT_PATH_MODE = "ONLY"
>     +OECMAKE_FIND_ROOT_PATH_MODE_class-native = "BOTH"
>
>      EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
>
>     @@ -93,10 +93,10 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>      # only search in the paths provided so cmake doesnt pick
>      # up libraries and tools from the native build machine
>      set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
>     -set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
>     -set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
>     -set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
>     -set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
>     +set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ${OECMAKE_FIND_ROOT_PATH_MODE} )
>     +set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE} )
>     +set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${OECMAKE_FIND_ROOT_PATH_MODE} )
>     +set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${OECMAKE_FIND_ROOT_PATH_MODE} )
>
>      $cmake_sysroot
>
>     -- 
>     2.11.0
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


