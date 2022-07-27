Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <5e177514-1fce-4a2a-b85f-1adfb5623c03@gmail.com>
Date: Wed, 27 Jul 2022 10:32:24 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 1/1] lame: Remove hardcoded rpaths
References: <20220726202337.2141895-1-ptsneves@gmail.com>
 <17b35aa4c6c3c8f0e1dcb309e7897048ec5f8510.camel@linuxfoundation.org>
From: "Paulo Neves" <ptsneves@gmail.com>
In-Reply-To: <17b35aa4c6c3c8f0e1dcb309e7897048ec5f8510.camel@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core@lists.openembedded.org

I thought of that myself, but did not yet investigate. We have 
hardcode_into_libs disabling in 4 "recipes":

git grep hardcode_into_libs -- meta
recipes-devtools/binutils/binutils/0009-Use-libtool-2.4.patch: 
hardcode_into_libs=yes
recipes-devtools/binutils/binutils/0009-Use-libtool-2.4.patch: if test 
"$hardcode_into_libs" != yes || test "$build_old_libs" = yes; then
recipes-devtools/gcc/gcc-sanitizers.inc:    sed -i -e 
's/hardcode_into_libs=yes/hardcode_into_libs=no/' 
${B}/${TARGET_SYS}/libsanitizer/libtool
recipes-devtools/gcc/gcc-source.inc:    cmd = d.expand("sed -i -e 
's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure")
recipes-devtools/gcc/libgfortran.inc:              sed -i -e 
's/hardcode_into_libs=yes/hardcode_into_libs=no/' 
${B}/${TARGET_SYS}/$target/libtool
recipes-support/db/db_5.3.28.bb:    sed -i -e 
's|hardcode_into_libs=yes|hardcode_into_libs=no|' ${B}/libtool

The hardcode_into_libs=no did not fix things for the lame case. We have 
a patch for libtools that looks like could be the culprit and need 
tightening [1]


[1] 
recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch

Paulo Neves

On 7/26/22 23:34, Richard Purdie wrote:
> On Tue, 2022-07-26 at 22:23 +0200, Paulo Neves wrote:
>> Due to hardcoded rpaths tmpdir contamination happened on lame
>> executable. This commit hot patches libtool to not hardcode
>> the .libs directory in the rpath. This solves [YOCTO #14863]
>>
>> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>> ---
>>   meta/recipes-multimedia/lame/lame_3.100.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-multimedia/lame/lame_3.100.bb
>> index 5b42795f4e..2d9bd9d29f 100644
>> --- a/meta/recipes-multimedia/lame/lame_3.100.bb
>> +++ b/meta/recipes-multimedia/lame/lame_3.100.bb
>> @@ -24,3 +24,7 @@ FILES:${PN} = "${bindir}/lame"
>>   FILES:libmp3lame = "${libdir}/libmp3lame.so.*"
>>   FILES:libmp3lame-dev = "${includedir} ${libdir}/*"
>>   FILES:${PN}-dev = ""
>> +do_compile:prepend() {
>> +    # Stop libtool adding RPATHs
>> +    sed -i -e 's|hardcode_libdir_flag_spec=".*"|hardcode_libdir_flag_spec=""|' ${B}/libtool
>> +}
> Any idea why lame has this issue but we don't see it with anything else
> using libtool? I'm wondering if there is an underlying cause we should
> look at?
>
> Cheers,
>
> Richard

