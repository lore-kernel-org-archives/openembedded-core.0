Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 13A96788EF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 09:49:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 01:49:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,407,1515484800"; d="scan'208";a="204684444"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 01 Mar 2018 01:49:50 -0800
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20180221031249.43075-1-raj.khem@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <40f962d3-b902-3ed0-33e6-a9c00e88e93a@linux.intel.com>
Date: Thu, 1 Mar 2018 11:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180221031249.43075-1-raj.khem@gmail.com>
Subject: Re: [PATCH V3 1/2] binutils: Upgrade to 2.30 release
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
X-List-Received-Date: Thu, 01 Mar 2018 09:49:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/21/2018 05:12 AM, Khem Raj wrote:
> Additionally cherry-pick
> 
> 5ffeba4a09 Revert "PowerPC PLT speculative execution barriers"
> b01452b1d4 [PR22764][LD][AARCH64]Allow R_AARCH64_ABS16 and R_AARCH64_ABS32 against absolution symbol or undefine symbol in shared object.
> a985e9b9de Import patch from mainline to remove PROVODE qualifiers around definitions of __CTOR_LIST__ and __DTOR_LIST__ in PE linker scripts.
> eec4607fc5 Add support for DWARF-4 line number tables.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> Changes in v2:
> 
> - Backport fixes for aarch64 relocs
> - ppc plt fix, dwarf-4 line number support and linker script fix for removing PROVODE
> 
> Changes in v3:
> - None

I did some bisection and unfortunately this cases breakage when musl, 
systemd and gobject introspection are all enabled:

| i586-poky-linux-musl-libtool: link: i586-poky-linux-musl-gcc -m32 
-march=i586 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat 
-Wformat-security -Werror=format-security 
--sysroot=/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot 
-o 
/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-gobject/tmp-introspectcefd3msq/.libs/Avahi-0.6 
-O2 -pipe -g -feliminate-unused-debug-types 
-fdebug-prefix-map=/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0=/usr/src/debug/avahi/0.7-r0 
-fdebug-prefix-map=/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot-native= 
-fdebug-prefix-map=/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot= 
-std=c99 -Wall -W -Wextra -pedantic -pipe -Wformat 
-Wold-style-definition -Wdeclaration-after-statement -Wfloat-equal 
-Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes 
-Wredundant-decls -Wmissing-noreturn -Wshadow -Wendif-labels 
-Wpointer-arith -Wbad-function-cast -Wcast-qual -Wcast-align 
-Wwrite-strings -fdiagnostics-show-option -Wno-cast-qual 
-fno-strict-aliasing 
/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-gobject/tmp-introspectcefd3msq/Avahi-0.6.o 
-Wl,--export-dynamic -pthread -Wl,-O1 -Wl,--hash-style=gnu 
-Wl,--as-needed -fstack-protector-strong -Wl,-z -Wl,relro -Wl,-z -Wl,now 
-Wl,--export-dynamic  -L. ./.libs/libavahi-gobject.so 
/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-client/.libs/libavahi-client.so 
-ldbus-1 -ldl 
/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-glib/.libs/libavahi-glib.so 
/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/build/avahi-common/.libs/libavahi-common.so 
-lgio-2.0 -lgobject-2.0 -lgmodule-2.0 -lglib-2.0 -pthread
| Error relocating 
/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot//lib/libsystemd.so.0: 
__start_BUS_ERROR_MAP: symbol not found
| Error relocating 
/home/ak/development/poky/build/tmp/work/i586-poky-linux-musl/avahi/0.7-r0/recipe-sysroot//lib/libsystemd.so.0: 
__stop_BUS_ERROR_MAP: symbol not found



Alex

