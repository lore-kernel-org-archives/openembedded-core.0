Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id E8E577523B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 14:28:34 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w99ESVcb021956
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 9 Oct 2018 16:28:32 +0200
Received: from [139.16.79.58] (MD1FZU9C.ad001.siemens.net [139.16.79.58])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w99ESVKw032295;
	Tue, 9 Oct 2018 16:28:31 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181009133416.3535-1-pascal.bach@siemens.com>
	<CAJTo0LZbUvgH8XQLouKAGHjVgSigSJKPpnB6PULf1a-See+zwQ@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <5195a0d4-519c-729b-e87e-557417ece304@siemens.com>
Date: Tue, 9 Oct 2018 16:28:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZbUvgH8XQLouKAGHjVgSigSJKPpnB6PULf1a-See+zwQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: allow cmake to find hosttools
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
X-List-Received-Date: Tue, 09 Oct 2018 14:28:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 09.10.2018 16:06, Burton, Ross wrote:
> The hashes don't match anything public and git isn't happy:
>
> Applying: cmake.bbclass: allow cmake to find hosttools
> error: sha1 information is lacking or useless (meta/classes/cmake.bbclass).
> error: could not build fake ancestor
> Patch failed at 0001 cmake.bbclass: allow cmake to find hosttools

I noticed too, the patch was based on another patch I sent. Should have sent these as a patch set even tough
they are not really related.

I will resubmit.

Pascal

>
> Ross
>
> On Tue, 9 Oct 2018 at 14:36, Pascal Bach <pascal.bach@siemens.com <mailto:pascal.bach@siemens.com>> wrote:
>
>     Currently the generated toolchain file is unable to find hosttools as they
>     do not appear in the search paths.
>
>     One example where this is useful is for projects that query git for their version
>     number as git is usually provided via HOSTTOOLS.
>
>     Just adding HOSTTOOLS_DIR is not enough as binaries are located directly under
>     ${HOSTTOOLS_DIR}. Like ${HOSTTOOLS_DIR}/git for example.
>     CMake however only searches in [s]bin sub directories of the paths specified in
>     CMAKE_FIND_ROOT_PATH. Explicitly adding / to CMAKE_SYSTEM_PROGRAM_PATH makes
>     CMake look in the right location.
>
>     Signed-off-by: Pascal Bach <pascal.bach@siemens.com <mailto:pascal.bach@siemens.com>>
>     ---
>      meta/classes/cmake.bbclass | 6 +++++-
>      1 file changed, 5 insertions(+), 1 deletion(-)
>
>     diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>     index 684f71299a..421d85fd9d 100644
>     --- a/meta/classes/cmake.bbclass
>     +++ b/meta/classes/cmake.bbclass
>     @@ -92,7 +92,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>
>      # only search in the paths provided so cmake doesnt pick
>      # up libraries and tools from the native build machine
>     -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
>     +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN} ${HOSTTOOLS_DIR})
>      set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ${OECMAKE_FIND_ROOT_PATH_MODE} )
>      set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE} )
>      set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${OECMAKE_FIND_ROOT_PATH_MODE} )
>     @@ -113,6 +113,10 @@ list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
>      # add for non /usr/lib libdir, e.g. /usr/lib64
>      set( CMAKE_SYSTEM_LIBRARY_PATH ${libdir} ${base_libdir})
>
>     +# by default CMake only looks in [s]bin subdirectories of CMAKE_FIND_ROOT_PATH
>     +# adding / makes CMake look for binaries in hosttools too.
>     +set( CMAKE_SYSTEM_PROGRAM_PATH /)
>     +
>      # avoid treating imports as system includes
>      set( CMAKE_NO_SYSTEM_FROM_IMPORTED ON)
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


