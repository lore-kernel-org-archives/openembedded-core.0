Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <6f6b8ba3-5564-11f9-93cd-e511375141a7@gmail.com>
Date: Sun, 28 Aug 2022 19:40:06 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 1/2] ntirpc: Add ntirpc recipe
References: <20220827174633.2772165-1-ptsneves@gmail.com>
 <CANNYZj98LVhAGHDdKzbZCw-OytMc+7J+p4__Cuc9wFMnjx4G7g@mail.gmail.com>
From: "Paulo Neves" <ptsneves@gmail.com>
In-Reply-To: <CANNYZj98LVhAGHDdKzbZCw-OytMc+7J+p4__Cuc9wFMnjx4G7g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>

Hello Alexander,

Thank you for your review

I updated the commit message for v2 to contain the following text:

We cannot completely  remove libtirpc due to arising circular 
dependencies where ntirpc depends on libnsl2, which  in turn depends on 
an RPC implementation.

Paulo Neves

On 8/27/22 20:07, Alexander Kanavin wrote:
> Can you please explain where the circular dependencies are?
>
> Alex
>
> On Sat, 27 Aug 2022 at 19:46, Paulo Neves <ptsneves@gmail.com> wrote:
>> ntirpc is an actively maintained rpc implementation. We cannot completely
>> remove libtirpc due to arising circular dependencies. libtirpc and ntirpc
>> are not mutually exclusive.
>>
>> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>> ---
>>   meta/recipes-extended/ntirpc/ntirpc_4.0.bb    | 30 +++++++++++++++++++
>>   meta/recipes-extended/quota/quota_4.06.bb     |  2 +-
>>   .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  2 +-
>>   .../watchdog/watchdog_5.16.bb                 |  2 +-
>>   .../xorg-xserver/xserver-xorg.inc             |  2 +-
>>   .../recipes-support/liburcu/liburcu_0.13.1.bb |  1 +
>>   6 files changed, 35 insertions(+), 4 deletions(-)
>>   create mode 100644 meta/recipes-extended/ntirpc/ntirpc_4.0.bb
>>
>> diff --git a/meta/recipes-extended/ntirpc/ntirpc_4.0.bb b/meta/recipes-extended/ntirpc/ntirpc_4.0.bb
>> new file mode 100644
>> index 0000000000..edebcb8ca9
>> --- /dev/null
>> +++ b/meta/recipes-extended/ntirpc/ntirpc_4.0.bb
>> @@ -0,0 +1,30 @@
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3"
>> +
>> +SRC_URI = "https://download.nfs-ganesha.org/4/${PV}/ntirpc-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "17b0baada54936dcde80eba27bb6d88d"
>> +SRC_URI[sha256sum] = "6a7921cd48d02077b394a02be42bf4f9b4678d4ebfd86a7ae4385bbcdce55462"
>> +
>> +DEPENDS = "liburcu libnsl2"
>> +
>> +inherit cmake pkgconfig
>> +
>> +PACKAGECONFIG[gss] = "-DUSE_GSS=true,-DUSE_GSS=false,krb5"
>> +PACKAGECONFIG[rdma] = "-DUSE_RPC_RDMA=true,-DUSE_RPC_RDMA=false,rdma-core"
>> +PACKAGECONFIG[winbind] = "-D_MSPAC_SUPPORT=true,-D_MSPAC_SUPPORT=false,samba"
>> +PACKAGECONFIG[profile] = "-DUSE_PROFILE=true,-DUSE_PROFILE=false,gperftools"
>> +PACKAGECONFIG[lttng] = "-DUSE_LTTNG=true,-DUSE_LTTNG=false,lttng-ust lttng-tools"
>> +
>> +# Sort out the brain-dead cmake file
>> +# (https://github.com/nfs-ganesha/ntirpc/issues/150)
>> +do_install:append() {
>> +    if [ "${prefix}/lib64" != "${libdir}" -a -d ${D}${prefix}/lib64 ]; then
>> +        mv ${D}${prefix}/lib64 ${D}${libdir}
>> +    fi
>> +}
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> +EXTRA_OECMAKE:armv5 += '-DSYSTEM_LIBRARIES="-latomic"'
>> +EXTRA_OECMAKE:riscv32 += '-DSYSTEM_LIBRARIES="-latomic"'
>> +EXTRA_OECMAKE:riscv64 += '-DSYSTEM_LIBRARIES="-latomic"'
>> +EXTRA_OECMAKE:powerpc += '-DSYSTEM_LIBRARIES="-latomic"'
>> diff --git a/meta/recipes-extended/quota/quota_4.06.bb b/meta/recipes-extended/quota/quota_4.06.bb
>> index 0535d14c20..304477d72b 100644
>> --- a/meta/recipes-extended/quota/quota_4.06.bb
>> +++ b/meta/recipes-extended/quota/quota_4.06.bb
>> @@ -30,6 +30,6 @@ PACKAGECONFIG ??= "tcp-wrappers rpc bsd"
>>   PACKAGECONFIG:libc-musl = "tcp-wrappers rpc"
>>
>>   PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
>> -PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,libtirpc"
>> +PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,ntirpc"
>>   PACKAGECONFIG[bsd] = "--enable-bsd_behaviour=yes,--enable-bsd_behaviour=no,"
>>   PACKAGECONFIG[ldapmail] = "--enable-ldapmail,--disable-ldapmail,openldap"
>> diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
>> index dd89726afc..e30a23909c 100644
>> --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
>> +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
>> @@ -4,7 +4,7 @@ DESCRIPTION = "The rpcbind utility is a server that converts RPC \
>>   SECTION = "console/network"
>>   HOMEPAGE = "http://sourceforge.net/projects/rpcbind/"
>>   BUGTRACKER = "http://sourceforge.net/tracker/?group_id=201237&atid=976751"
>> -DEPENDS = "libtirpc quota"
>> +DEPENDS = "ntirpc quota"
>>
>>   LICENSE = "BSD-3-Clause"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
>> diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
>> index 26fcc10487..5f5fd4dc87 100644
>> --- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
>> +++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
>> @@ -28,7 +28,7 @@ UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
>>
>>   inherit autotools update-rc.d systemd pkgconfig
>>
>> -DEPENDS += "libtirpc"
>> +DEPENDS += "ntirpc"
>>   CFLAGS += "-I${STAGING_INCDIR}/tirpc"
>>   LDFLAGS += "-ltirpc"
>>
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
>> index 057a1ba6ad..2085f742d6 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
>> @@ -36,7 +36,7 @@ inherit meson pkgconfig
>>   inherit features_check
>>   REQUIRED_DISTRO_FEATURES = "x11"
>>
>> -LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess libxcvt libtirpc"
>> +LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess libxcvt ntirpc"
>>   DEPENDS = "xorgproto ${LIB_DEPS} font-util"
>>
>>   # Split out some modules and extensions from the main package
>> diff --git a/meta/recipes-support/liburcu/liburcu_0.13.1.bb b/meta/recipes-support/liburcu/liburcu_0.13.1.bb
>> index 66763349d2..d7e831e803 100644
>> --- a/meta/recipes-support/liburcu/liburcu_0.13.1.bb
>> +++ b/meta/recipes-support/liburcu/liburcu_0.13.1.bb
>> @@ -22,3 +22,4 @@ CPPFLAGS:append:riscv64  = " -pthread -D_REENTRANT"
>>   do_install:append() {
>>       oe_multilib_header urcu/config.h
>>   }
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.25.1
>>
>>
>> 
>>

