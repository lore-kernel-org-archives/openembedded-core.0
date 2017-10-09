Return-Path: <Fupan.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 89C5F60807
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 03:07:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v99376jc029919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Oct 2017 20:07:10 -0700 (PDT)
Received: from [128.224.176.119] (128.224.176.119) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 8 Oct 2017 20:07:05 -0700
To: Andrew Goodbody <andrew.goodbody@cambrionix.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170930022455.137406-1-fupan.li@windriver.com>
	<LOXP123MB0117058358878B6D1DD5307E85720@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
From: fupan <fupan.li@windriver.com>
Message-ID: <ad8065f8-9c44-724c-a502-a9f85d01caea@windriver.com>
Date: Mon, 9 Oct 2017 11:06:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <LOXP123MB0117058358878B6D1DD5307E85720@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
Subject: Re: [oe] [meta-java][PATCH] openjdk-8-common: Fix the issue of building failed adlc on host with gcc < 6
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
X-List-Received-Date: Mon, 09 Oct 2017 03:07:13 -0000
X-Groupsio-MsgNum: 103727
Content-Type: multipart/mixed; boundary="------------440F0EE8F28FB6285C97C4D2"
Content-Language: en-US

--------------440F0EE8F28FB6285C97C4D2
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017/10/3 18:14, Andrew Goodbody wrote:
>> -----Original Message-----
>> From: Fupan Li <fupan.li@windriver.com>
>>
>> The patch recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-adlc-
>> flags.patch
>> had tried to fix this issue, and it tried to filter out the
>> TARGET_FLAGS/TARGET_
>> CXXFLGAS, but for the flags such as "-fno-lifetime-dse" was added to
>> CFLAGS/CXXFLAGS,
>> directly, thus that patch failed to filter it out.
>>
>> To fix this issue, it's better to add those GCC version specific flags to
>> BUILD_CFLAGS/
>> BUILD_CXXFLAGS and TARGET_CFLAGS/TARGET_CXXFLAGS separatedly,
>> thus that patch can work
>> as expected.
>>
>> Signed-off-by: Fupan Li <fupan.li@windriver.com>
>> ---
>>   recipes-core/openjdk/openjdk-8-common.inc | 36
>> ++++++++++++++++++++-----------
>>   1 file changed, 24 insertions(+), 12 deletions(-)
>>
>> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-
>> core/openjdk/openjdk-8-common.inc
>> index 83828e1..c609232 100644
>> --- a/recipes-core/openjdk/openjdk-8-common.inc
>> +++ b/recipes-core/openjdk/openjdk-8-common.inc
>> @@ -231,27 +231,39 @@ FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-
>> pointer-checks"
>>   # version is and only add the flags that are appropriate for that GCC
>>   # version.
>>
>> -def version_specific_cflags(d):
>> +def version_specific_cflags(d, toolchain):
>>       extraflags = None
>>       version = None
>>
>> -    if bb.data.inherits_class('native', d):
>> -        from subprocess import Popen, PIPE
>> +    from subprocess import Popen, PIPE
>> +    cmd = d.expand('%s -dumpversion' % toolchain ).split()
>> +    cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
>> +    version = cc.communicate()[0].decode('utf-8')[0]
>>
>> -        cmd = d.expand('${CC} -dumpversion').split()
>> -        cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
>> -        version = cc.communicate()[0].decode('utf-8')[0]
>> +    if version.isdigit():
>> +        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
>> +        return extraflags
>> +    return ''
>> +
>> +python __anonymous() {
>> +    if bb.data.inherits_class('native', d):
>> +        toolchain = d.getVar('CC', True)
>> +        extraflags = version_specific_cflags(d, toolchain)
>> +        d.appendVar("CFLAGS", ' ' + extraflags)
>> +        d.appendVar("CXXFLAGS", ' ' + extraflags)
>>       else:
>>           # in the cross case, trust that GCCVERSION is correct. This won't
>>           # work if the native toolchain is Clang, but as of this writing that
>>           # doesn't work anyway.
>>           version = d.getVar('GCCVERSION', expand=True)[0]
>> -
>> -    if version.isdigit():
>>           extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
>> -        return extraflags
>> -    return ''
>> +        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
>> +        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
>> +
>> +        toolchain = d.getVar('BUILD_CC', True)
>> +        extraflags = version_specific_cflags(d, toolchain)
>> +        d.appendVar("BUILD_CFLAGS", ' ' + extraflags)
>> +        d.appendVar("BUILD_CXXFLAGS", ' ' + extraflags)
>> +}
>>
>> -CFLAGS_append = " ${@version_specific_cflags(d)}"
>> -CXXFLAGS_append = " ${@version_specific_cflags(d)}"
>>   CXX_append = " -std=gnu++98"
>> --
>> 2.11.0

Hi, Andrew

Can you  try this latest patch I attached?

Thanks!

Fupan

> I get the following build failure with the above patch now, backing it out makes the build work OK.
>
> ERROR: /home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/openjre-8_102b14.bb: Error executing a python function in <code>:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 13, function: <module>
>       0009:__anon_35__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_devshell_bbclass(d)
>       0010:__anon_101__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_sstate_bbclass(d)
>       0011:__anon_313__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_package_ipk_bbclass(d)
>       0012:__anon_154__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_siteinfo_bbclass(d)
>   *** 0013:__anon_267__home_andrew_src_camol3_camol_layers_meta_java_recipes_core_openjdk_openjdk_8_common_inc(d)
>       0014:__anon_108__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_update_alternatives_bbclass(d)
> File: '/home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/openjdk-8-common.inc', lineno: 260, function: __anon_267__home_andrew_src_camol3_camol_layers_meta_java_recipes_core_openjdk_openjdk_8_common_inc
>       0256:        # work if the native toolchain is Clang, but as of this writing that
>       0257:        # doesn't work anyway.
>       0258:        version = d.getVar('GCCVERSION', expand=True)[0]
>       0259:        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
>   *** 0260:        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
>       0261:        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
>       0262:
>       0263:        toolchain = d.getVar('BUILD_CC', True)
>       0264:        extraflags = version_specific_cflags(d, toolchain)
> Exception: ValueError: invalid literal for int() with base 10: 'l'
>
> ERROR: Failed to parse recipe: /home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/openjre-8_102b14.bb
> ERROR: /home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/openjdk-8_102b14.bb: Error executing a python function in <code>:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 13, function: <module>
>       0009:__anon_35__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_devshell_bbclass(d)
>       0010:__anon_101__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_sstate_bbclass(d)
>       0011:__anon_313__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_package_ipk_bbclass(d)
>       0012:__anon_154__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_siteinfo_bbclass(d)
>   *** 0013:__anon_267__home_andrew_src_camol3_camol_layers_meta_java_recipes_core_openjdk_openjdk_8_common_inc(d)
>       0014:__anon_108__home_andrew_src_camol3_camol_layers_openembedded_core_meta_classes_update_alternatives_bbclass(d)
> File: '/home/andrew/src/camol3/camol/layers/meta-java/recipes-core/openjdk/openjdk-8-common.inc', lineno: 260, function: __anon_267__home_andrew_src_camol3_camol_layers_meta_java_recipes_core_openjdk_openjdk_8_common_inc
>       0256:        # work if the native toolchain is Clang, but as of this writing that
>       0257:        # doesn't work anyway.
>       0258:        version = d.getVar('GCCVERSION', expand=True)[0]
>       0259:        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
>   *** 0260:        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
>       0261:        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
>       0262:
>       0263:        toolchain = d.getVar('BUILD_CC', True)
>       0264:        extraflags = version_specific_cflags(d, toolchain)
> Exception: ValueError: invalid literal for int() with base 10: 'l'
>
> Andrew
>


--------------440F0EE8F28FB6285C97C4D2
Content-Type: text/plain; charset="UTF-8";
	name="0001-openjdk-8-common-Fix-the-issue-of-building-failed-ad.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename*0="0001-openjdk-8-common-Fix-the-issue-of-building-failed-ad.pa";
	filename*1="tch"

RnJvbSA3ODkyOWVhMDlmMzcwNjllNzgyNmIwNmJmMjE0ZmViOWEyYjFhMzEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGdXBhbiBMaSA8ZnVwYW4ubGlAd2luZHJpdmVyLmNvbT4KRGF0
ZTogRnJpLCAyOSBTZXAgMjAxNyAxOTowMDozMSAtMDcwMApTdWJqZWN0OiBbUEFUQ0hdIG9wZW5q
ZGstOC1jb21tb246IEZpeCB0aGUgaXNzdWUgb2YgYnVpbGRpbmcgZmFpbGVkIGFkbGMgb24KIGhv
c3Qgd2l0aCBnY2MgPCA2CgpUaGUgcGF0Y2ggcmVjaXBlcy1jb3JlL29wZW5qZGsvcGF0Y2hlcy1v
cGVuamRrLTgvb3BlbmpkazgtZml4LWFkbGMtZmxhZ3MucGF0Y2gKaGFkIHRyaWVkIHRvIGZpeCB0
aGlzIGlzc3VlLCBhbmQgaXQgdHJpZWQgdG8gZmlsdGVyIG91dCB0aGUgVEFSR0VUX0ZMQUdTL1RB
UkdFVF8KQ1hYRkxHQVMsIGJ1dCBmb3IgdGhlIGZsYWdzIHN1Y2ggYXMgIi1mbm8tbGlmZXRpbWUt
ZHNlIiB3YXMgYWRkZWQgdG8gQ0ZMQUdTL0NYWEZMQUdTLApkaXJlY3RseSwgdGh1cyB0aGF0IHBh
dGNoIGZhaWxlZCB0byBmaWx0ZXIgaXQgb3V0LgoKVG8gZml4IHRoaXMgaXNzdWUsIGl0J3MgYmV0
dGVyIHRvIGFkZCB0aG9zZSBHQ0MgdmVyc2lvbiBzcGVjaWZpYyBmbGFncyB0byBCVUlMRF9DRkxB
R1MvCkJVSUxEX0NYWEZMQUdTIGFuZCBUQVJHRVRfQ0ZMQUdTL1RBUkdFVF9DWFhGTEFHUyBzZXBh
cmF0ZWRseSwgdGh1cyB0aGF0IHBhdGNoIGNhbiB3b3JrCmFzIGV4cGVjdGVkLgoKU2lnbmVkLW9m
Zi1ieTogRnVwYW4gTGkgPGZ1cGFuLmxpQHdpbmRyaXZlci5jb20+Ci0tLQogcmVjaXBlcy1jb3Jl
L29wZW5qZGsvb3Blbmpkay04LWNvbW1vbi5pbmMgfCAzOSArKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb3JlL29wZW5qZGsvb3Blbmpkay04LWNvbW1vbi5p
bmMgYi9yZWNpcGVzLWNvcmUvb3Blbmpkay9vcGVuamRrLTgtY29tbW9uLmluYwppbmRleCA4Mzgy
OGUxLi5iZTM1YmZlIDEwMDY0NAotLS0gYS9yZWNpcGVzLWNvcmUvb3Blbmpkay9vcGVuamRrLTgt
Y29tbW9uLmluYworKysgYi9yZWNpcGVzLWNvcmUvb3Blbmpkay9vcGVuamRrLTgtY29tbW9uLmlu
YwpAQCAtMjMxLDI3ICsyMzEsNDAgQEAgRkxBR1NfR0NDNyA9ICItZm5vLWxpZmV0aW1lLWRzZSAt
Zm5vLWRlbGV0ZS1udWxsLXBvaW50ZXItY2hlY2tzIgogIyB2ZXJzaW9uIGlzIGFuZCBvbmx5IGFk
ZCB0aGUgZmxhZ3MgdGhhdCBhcmUgYXBwcm9wcmlhdGUgZm9yIHRoYXQgR0NDCiAjIHZlcnNpb24u
CiAKLWRlZiB2ZXJzaW9uX3NwZWNpZmljX2NmbGFncyhkKToKK2RlZiB2ZXJzaW9uX3NwZWNpZmlj
X2NmbGFncyhkLCB0b29sY2hhaW4pOgogICAgIGV4dHJhZmxhZ3MgPSBOb25lCiAgICAgdmVyc2lv
biA9IE5vbmUKIAotICAgIGlmIGJiLmRhdGEuaW5oZXJpdHNfY2xhc3MoJ25hdGl2ZScsIGQpOgot
ICAgICAgICBmcm9tIHN1YnByb2Nlc3MgaW1wb3J0IFBvcGVuLCBQSVBFCisgICAgZnJvbSBzdWJw
cm9jZXNzIGltcG9ydCBQb3BlbiwgUElQRQorICAgIGNtZCA9IGQuZXhwYW5kKCclcyAtZHVtcHZl
cnNpb24nICUgdG9vbGNoYWluICkuc3BsaXQoKQorICAgIGNjID0gUG9wZW4oY21kLCBzdGRvdXQ9
UElQRSwgc3RkZXJyPVBJUEUpCisgICAgdmVyc2lvbiA9IGNjLmNvbW11bmljYXRlKClbMF0uZGVj
b2RlKCd1dGYtOCcpWzBdCiAKLSAgICAgICAgY21kID0gZC5leHBhbmQoJyR7Q0N9IC1kdW1wdmVy
c2lvbicpLnNwbGl0KCkKLSAgICAgICAgY2MgPSBQb3BlbihjbWQsIHN0ZG91dD1QSVBFLCBzdGRl
cnI9UElQRSkKLSAgICAgICAgdmVyc2lvbiA9IGNjLmNvbW11bmljYXRlKClbMF0uZGVjb2RlKCd1
dGYtOCcpWzBdCisgICAgaWYgdmVyc2lvbi5pc2RpZ2l0KCk6CisgICAgICAgIGV4dHJhZmxhZ3Mg
PSBkLmdldFZhcignRkxBR1NfR0NDJWQnICUgaW50KHZlcnNpb24pLCBUcnVlKSBvciAnJworICAg
ICAgICByZXR1cm4gZXh0cmFmbGFncworICAgIHJldHVybiAnJworCitweXRob24gX19hbm9ueW1v
dXMoKSB7CisgICAgaWYgYmIuZGF0YS5pbmhlcml0c19jbGFzcygnbmF0aXZlJywgZCk6CisgICAg
ICAgIHRvb2xjaGFpbiA9IGQuZ2V0VmFyKCdDQycsIFRydWUpCisgICAgICAgIGV4dHJhZmxhZ3Mg
PSB2ZXJzaW9uX3NwZWNpZmljX2NmbGFncyhkLCB0b29sY2hhaW4pCisgICAgICAgIGQuYXBwZW5k
VmFyKCJDRkxBR1MiLCAnICcgKyBleHRyYWZsYWdzKSAKKyAgICAgICAgZC5hcHBlbmRWYXIoIkNY
WEZMQUdTIiwgJyAnICsgZXh0cmFmbGFncykKICAgICBlbHNlOgogICAgICAgICAjIGluIHRoZSBj
cm9zcyBjYXNlLCB0cnVzdCB0aGF0IEdDQ1ZFUlNJT04gaXMgY29ycmVjdC4gVGhpcyB3b24ndAog
ICAgICAgICAjIHdvcmsgaWYgdGhlIG5hdGl2ZSB0b29sY2hhaW4gaXMgQ2xhbmcsIGJ1dCBhcyBv
ZiB0aGlzIHdyaXRpbmcgdGhhdAogICAgICAgICAjIGRvZXNuJ3Qgd29yayBhbnl3YXkuCiAgICAg
ICAgIHZlcnNpb24gPSBkLmdldFZhcignR0NDVkVSU0lPTicsIGV4cGFuZD1UcnVlKVswXQorICAg
ICAgICBpZiB2ZXJzaW9uLmlzZGlnaXQoKToKKyAgICAgICAgICAgIGV4dHJhZmxhZ3MgPSBkLmdl
dFZhcignRkxBR1NfR0NDJWQnICUgaW50KHZlcnNpb24pLCBUcnVlKSBvciAnJworICAgICAgICAg
ICAgZC5hcHBlbmRWYXIoIlRBUkdFVF9DRkxBR1MiLCAnICcgKyBleHRyYWZsYWdzKQorICAgICAg
ICAgICAgZC5hcHBlbmRWYXIoIlRBUkdFVF9DWFhGTEFHUyIsICcgJyArIGV4dHJhZmxhZ3MpCisK
KyAgICAgICAgdG9vbGNoYWluID0gZC5nZXRWYXIoJ0JVSUxEX0NDJywgVHJ1ZSkKKyAgICAgICAg
ZXh0cmFmbGFncyA9IHZlcnNpb25fc3BlY2lmaWNfY2ZsYWdzKGQsIHRvb2xjaGFpbikKKyAgICAg
ICAgZC5hcHBlbmRWYXIoIkJVSUxEX0NGTEFHUyIsICcgJyArIGV4dHJhZmxhZ3MpCisgICAgICAg
IGQuYXBwZW5kVmFyKCJCVUlMRF9DWFhGTEFHUyIsICcgJyArIGV4dHJhZmxhZ3MpCit9CiAKLSAg
ICBpZiB2ZXJzaW9uLmlzZGlnaXQoKToKLSAgICAgICAgZXh0cmFmbGFncyA9IGQuZ2V0VmFyKCdG
TEFHU19HQ0MlZCcgJSBpbnQodmVyc2lvbiksIFRydWUpIG9yICcnCi0gICAgICAgIHJldHVybiBl
eHRyYWZsYWdzCi0gICAgcmV0dXJuICcnCi0KLUNGTEFHU19hcHBlbmQgPSAiICR7QHZlcnNpb25f
c3BlY2lmaWNfY2ZsYWdzKGQpfSIKLUNYWEZMQUdTX2FwcGVuZCA9ICIgJHtAdmVyc2lvbl9zcGVj
aWZpY19jZmxhZ3MoZCl9IgogQ1hYX2FwcGVuZCA9ICIgLXN0ZD1nbnUrKzk4IgotLSAKMi4xMS4w
Cgo=

--------------440F0EE8F28FB6285C97C4D2--
