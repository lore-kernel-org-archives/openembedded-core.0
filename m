Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE0A7C03B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 07:41:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0A7eet1002974
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jan 2019 23:40:50 -0800
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 9 Jan 2019 23:40:29 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1545102457.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5ef868ec-9a44-6954-63c3-b45fcba9cc50@windriver.com>
Date: Thu, 10 Jan 2019 15:45:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1545102457.git.liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 00/11] ccache.bbclass: Refactor it to make it more reliable
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
X-List-Received-Date: Thu, 10 Jan 2019 07:41:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi RP,

Do you have any comments on this, please? It's really very useful during
development. It can save both configure and compile time in the second run,
It can save about 8 minutes (30m -> 22m) if I rebuild core-image-minimal
totally without any sstate caches.

// Robert

On 12/18/18 3:18 PM, Robert Yang wrote:
> * V3
>    - Make cache files can be shared between different build dirs
>    - Add task do_cleanccache
>    - Make cmake work with ccache
>    - Upgrade ccache to 3.5, this version has a debug mode, which is useful for
>      figuring out why a cache file is not used.
> 
> * V2
>    - Fix comments from Martin Jansa and Martin Hundebøll.
>    - Fix RP's comments:
>      1) Add comments for ccache related code in base.bbclass
>      2) Remove all ccache-native's dependencies so that all recipes can depend on
>         and use it.
>    - Update test_ccache_tool in oeqa
> 
> * V1
>    Initial version
> 
> The following changes since commit 20aea61385e1a53ac245353899277ba20104ed2f:
> 
>    gcc: Drop 7.3 since 8.2 is working fine for us (2018-12-15 17:10:44 +0000)
> 
> are available in the git repository at:
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/ccache
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ccache
> 
> Robert Yang (11):
>    ccache-native: Remove dependencies
>    ccache: 3.4.2 -> 3.5
>    ccache.bbclass: Refactor it to make it more reliable
>    ccache.bbclass: Make it can be shared between different builds
>    ccache.bbclass: Add task do_cleanccache
>    ccache.bbclass: Set CCACHE_CONFIGPATH to fix race issues
>    bitbake.conf: Enable -fdebug-prefix-map for nativesdk
>    goarch.bbclass: Set CCACHE_DISABLE
>    cmake.bbclass: Make it work with ccache
>    apr/openssl10: Enable ccache for them
>    oeqa/selftest/cases: Update test_ccache_tool
> 
>   meta/classes/ccache.bbclass                        | 63 ++++++++++++++++++++--
>   meta/classes/cmake.bbclass                         | 21 +++++---
>   meta/classes/goarch.bbclass                        |  4 ++
>   meta/conf/bitbake.conf                             |  8 +--
>   meta/conf/ccache.conf                              |  2 +
>   meta/conf/layer.conf                               |  1 -
>   meta/lib/oe/utils.py                               |  3 ++
>   meta/lib/oeqa/selftest/cases/buildoptions.py       | 10 ++--
>   .../openssl/openssl10_1.0.2q.bb                    |  3 --
>   meta/recipes-devtools/ccache/ccache.inc            | 13 ++++-
>   meta/recipes-devtools/ccache/ccache_3.4.2.bb       | 11 ----
>   meta/recipes-devtools/ccache/ccache_3.5.bb         | 11 ++++
>   meta/recipes-graphics/piglit/piglit_git.bb         |  3 ++
>   meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb    |  3 ++
>   meta/recipes-sato/webkit/webkitgtk_2.22.4.bb       |  3 ++
>   meta/recipes-support/apr/apr_1.6.5.bb              |  5 --
>   16 files changed, 122 insertions(+), 42 deletions(-)
>   create mode 100644 meta/conf/ccache.conf
>   delete mode 100644 meta/recipes-devtools/ccache/ccache_3.4.2.bb
>   create mode 100644 meta/recipes-devtools/ccache/ccache_3.5.bb
> 

