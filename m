Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16E726C40D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 08:25:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAE8P6vt013405
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Nov 2018 00:25:16 -0800
Received: from [128.224.162.215] (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 14 Nov 2018 00:24:55 -0800
To: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
	<1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
	<CAJTo0La+u72y4JiB9dGKGw==FR_8Uwu31pO19eJ78bVfnHj08Q@mail.gmail.com>
	<5BE4E504.4010809@windriver.com>
	<CAJTo0LZcL0H=sEdc7n7BRw+u-R3fHNb=2ooJO1hkPsp404PLqg@mail.gmail.com>
	<5BE8E53B.2010405@windriver.com>
	<07f660b1-59dd-5dbf-af25-39475b6cb477@xilinx.com>
	<5BEA3F06.3060705@windriver.com>
	<8a3f9482-3402-886f-3fa3-dee69114d878@xilinx.com>
	<5BEA9506.5000600@windriver.com>
	<b0b7d4db-3e54-10f7-2c9b-d2feed1565a6@xilinx.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5BEBDB84.5080501@windriver.com>
Date: Wed, 14 Nov 2018 16:23:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <b0b7d4db-3e54-10f7-2c9b-d2feed1565a6@xilinx.com>
X-Originating-IP: [128.224.162.215]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] python3: add tk support
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
X-List-Received-Date: Wed, 14 Nov 2018 08:25:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年11月14日 05:26, Alejandro Hernandez wrote:
> On 11/13/2018 1:10 AM, Yu, Mingli wrote:
>>
>>
>> On 2018年11月13日 16:25, Alejandro Hernandez wrote:
>>> On 11/12/2018 7:03 PM, Yu, Mingli wrote:
>>>> Hi Alejandro,
>>>>
>>>> Many thanks for your comments, please check my comments inline.
>>>>
>>>> On 2018年11月12日 23:28, Alejandro Hernandez wrote:
>>>>> Hey Yu,
>>>>>
>>>>>
>>>>> On 11/11/2018 6:28 PM, Yu, Mingli wrote:
>>>>>>
>>>>>>
>>>>>> On 2018年11月09日 21:02, Burton, Ross wrote:
>>>>>>> On Fri, 9 Nov 2018 at 01:39, Yu, Mingli <mingli.yu@windriver.com>
>>>>>>> wrote:
>>>>>>>>> Why is this here and not in the manifest?
>>>>>>>>
>>>>>>>> It's because we can optionally enable or disable tk via
>>>>>>>> PACKAGECONFIG,
>>>>>>>> if add it to manifest then we need to always enable tk which is
>>>>>>>> also
>>>>>>>> the
>>>>>>>> implement in v1.
>>>>>>>
>>>>>>> Are you sure?  As I understand it there won't be any errors if the
>>>>>>> contents don't exist.  And to be honest if there are, then the
>>>>>>> manifest tooling should handle that neatly without special-casing.
>>>>>>
>>>>>> Hi Ross,
>>>>>>
>>>>>> Thanks for your feedback!
>>>>>>
>>>>>> I didn't quite understand what you mean. As I know, if we add the the
>>>>>> setting in manifest as below:
>>>>>> diff --git
>>>>>> a/meta/recipes-devtools/python/python3/python3-manifest.json
>>>>>> b/meta/recipes-devtools/python/python3/python3-manifest.json
>>>>>> index f922561..09c9199 100644
>>>>>> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>>>>>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>>>>>> @@ -1056,10 +1056,12 @@
>>>>>>      "tkinter": {
>>>>>>          "summary": "Python Tcl/Tk bindings",
>>>>>>          "rdepends": [
>>>>>> -            "core"
>>>>>> +            "core",
>>>>>> +            "tk"
>>>>>
>>>>>
>>>>> This error is happening because you are trying to add python3-tk on
>>>>> RDEPENDS, and that package doesn't exist, when you specify "foo" on
>>>>> the
>>>>> "rdepends" section of the manifest it is translated to ${PN}-foo.
>>>>
>>>> Yes, that's why I point out that we need to add extra logic in python3
>>>> recipe to make it rdepends on tk after add the logic as below:
>>>>
>>>> diff --git
>>>> a/meta/recipes-devtools/python/python3/python3-manifest.json
>>>> b/meta/recipes-devtools/python/python3/python3-manifest.json
>>>> index f922561..09c9199 100644
>>>> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>>>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>>>> @@ -1056,10 +1056,12 @@
>>>>      "tkinter": {
>>>>          "summary": "Python Tcl/Tk bindings",
>>>>          "rdepends": [
>>>> -            "core"
>>>> +            "core",
>>>> +            "tk"
>>>>          ],
>>>>          "files": [
>>>> -            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
>>>> +            "${libdir}/python${PYTHON_MAJMIN}/tkinter",
>>>> + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
>>>>          ],
>>>>          "cached": []
>>>>      },
>>>>
>>>>>
>>>>> So two things:
>>>>>
>>>>> 1. The manifest can have the _tkinter.*.so on the "files section of
>>>>> tkinter (please note that this is _tkinter.*.so and not _tkinter*.so,
>>>>> the wildcard should be after a "." this is to keep a standard which
>>>>> the
>>>>> tooling can handle more easily.
>>>>
>>>> Got it, thanks!
>>>>
>>>>>
>>>>> When the PACKAGECONFIG is enabled, the files for tkinter will be
>>>>> picked
>>>>> up correctly.
>>>>>
>>>>> 2. You should not manually add "rdepends" to the manifest, the tool
>>>>> itself should populate those automatically, this is better because we
>>>>> would avoid this kind of errors.
>>>>>
>>>>> Please add the package to the manifest, populate the "files" and
>>>>> "summary" section and then run $ bitbake python3 -c create_manifest to
>>>>> populate the rdepends section automatically, also keep in mind that
>>>>> you
>>>>> should run this when the PACKAGECONFIG is enabled for the native
>>>>> package
>>>>> as well (thats how it will pick up the dependencies).
>>>>
>>>> No new package needed to add to manifest, we only need to update the
>>>> items for the existed package tkinter and per your suggestion not
>>>> manually add "rdepends" to the manifest, so I only add files to
>>>> manifest as below in manifest file,
>>>
>>>
>>> My mistake  I thought you were adding a new package.
>>>
>>> Anyway, as a matter of fact, all you need to do is to add the same
>>> PACKAGECONFIG on the python3 native recipe and enable it, once its
>>
>> Many thanks for Alejandro's hints!
>>
>> I still failed to let the files(_tkinter.*.so) automatically added to
>> manifest though I run $ bitbake python3 -c create_manifest altogether
>> with below logic. Could you help to take a look is there anything I miss?
>>
>> $ git diff
>> diff --git a/meta/recipes-devtools/python/python3-native_3.5.6.bb
>> b/meta/recipes-devtools/python/python3-native_3.5.6.bb
>> index d5953cf..80f9678 100644
>> --- a/meta/recipes-devtools/python/python3-native_3.5.6.bb
>> +++ b/meta/recipes-devtools/python/python3-native_3.5.6.bb
>> @@ -28,6 +28,8 @@
>> file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \
>>  file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
>>  file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
>>  "
>> +PACKAGECONFIG ??= "tkinter"
>> +PACKAGECONFIG[tkinter] = ",,tk,tk"
>
> Wouldn't you have to DEPEND on tk-native here?

Yes, it should be tk-native.

Thanks very much for your guide!

I finally succeeded to let _tkinter.*.so automatically added to manifest.

I run $ bitbake python3 -c create_manifest altogether with below logic:
$ git diff
diff --git a/meta/recipes-devtools/python/python3-native_3.5.6.bb 
b/meta/recipes-devtools/python/python3-native_3.5.6.bb
index d5953cf..71bee6f 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.6.bb
@@ -12,7 +12,7 @@ file://130-readline-setup.patch \
  file://150-fix-setupterm.patch \
  file://python-3.3-multilib.patch \
  file://03-fix-tkinter-detection.patch \
-file://avoid_warning_about_tkinter.patch \
+${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 
'file://avoid_warning_about_tkinter.patch', d)} \
  file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
  file://sysroot-include-headers.patch \
  file://unixccompiler.patch \
@@ -28,6 +28,8 @@ 
file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \
  file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
  file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
  "
+PACKAGECONFIG ??= "tk"
+PACKAGECONFIG[tk] = ",,tk-native"

  EXTRANATIVEPATH += "bzip2-native"
  DEPENDS = "openssl-native bzip2-replacement-native zlib-native 
readline-native sqlite3-native gdbm-native"

I will resend V3 for python tkinter support.

Thanks,

>
>
> I believe that might be the issue, you can check if the _tkinter.*.so
> file is generated from the native build (basically if its not generated,
> its impossible for the create_manifest task to pick it up).
>
> $ find python3-native/3.5.6-r1.0/image/ | grep _tkinter.*.so
>
> If you can confirm that it is generated but the create_manifest task
> isn't picking it up we can keep debugging, but first lets check if its
> there.
>
>
> Cheers,
>
> Alejandro
>
>
>>
>>  EXTRANATIVEPATH += "bzip2-native"
>>  DEPENDS = "openssl-native bzip2-replacement-native zlib-native
>> readline-native sqlite3-native gdbm-native"
>> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb
>> b/meta/recipes-devtools/python/python3_3.5.6.bb
>> index 2a45476..edc9d18 100644
>> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
>> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
>> @@ -78,10 +78,11 @@ export CCSHARED = "-fPIC"
>>  # Fix cross compilation of different modules
>>  export CROSSPYTHONPATH =
>> "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
>>
>>
>> -PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES',
>> 'qemu-usermode', 'pgo', '', d)}"
>> +PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES',
>> 'qemu-usermode', 'pgo', '', d)} tkinter"
>>  PACKAGECONFIG[readline] = ",,readline"
>>  # Use profile guided optimisation by running PyBench inside qemu-user
>>  PACKAGECONFIG[pgo] = "--enable-optimizations"
>> +PACKAGECONFIG[tkinter] = ",,tk,tk"
>>
>>  do_configure_append() {
>>         rm -f ${S}/Makefile.orig
>>
>>
>> Thanks,
>
>
>>
>>> enabled you can run the create_manifest task and it should automatically
>>> generate you a new manifest with the required files (clarifying that it
>>> doesnt have to be enabled by default but it has to be enabled on the
>>> native package when the create_manifest task is run), meaning that you
>>> don't actually need to add the _tkinter.*.so file manually to the
>>> manifest, it should be picked up automatically, this is because the
>>> create_manifest tool assumes that the python3 and python3-native
>>> packages are exact copies of each other.
>>>
>>> Regarding the extra logic, I also agree with Ross, and I don't
>>> personally like having the extra logic there, either for that package or
>>> for handling each package that would need a PACKAGECONFIG, I think using
>>>
>>> RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk',
>>> 'tk', '', d)}"
>>>
>>> should be enough.
>>>
>>>
>>> Alejandro
>>>
>>>
>>>>
>>>> diff --git
>>>> a/meta/recipes-devtools/python/python3/python3-manifest.json
>>>> b/meta/recipes-devtools/python/python3/python3-manifest.json
>>>> index f922561..09c9199 100644
>>>> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>>>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>>>> @@ -1056,10 +1056,12 @@
>>>> "tkinter": {
>>>> "summary": "Python Tcl/Tk bindings",
>>>> "rdepends": [
>>>>     "core"
>>>> ],
>>>> "files": [
>>>> - "${libdir}/python${PYTHON_MAJMIN}/tkinter"
>>>> + "${libdir}/python${PYTHON_MAJMIN}/tkinter",
>>>> + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
>>>> ],
>>>> "cached": []
>>>> },
>>>>
>>>> And also the update the python3 recipe,
>>>>
>>>> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb
>>>> b/meta/recipes-devtools/python/python3_3.5.6.bb
>>>> index 2a45476..e50e7dc 100644
>>>> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
>>>> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
>>>> @@ -78,10 +78,11 @@ export CCSHARED = "-fPIC"
>>>>  # Fix cross compilation of different modules
>>>>  export CROSSPYTHONPATH =
>>>> "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
>>>>
>>>>
>>>>
>>>> -PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES',
>>>> 'qemu-usermode', 'pgo', '', d)}"
>>>> +PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES',
>>>> 'qemu-usermode', 'pgo', '', d)} tk"
>>>>  PACKAGECONFIG[readline] = ",,readline"
>>>>  # Use profile guided optimisation by running PyBench inside qemu-user
>>>>  PACKAGECONFIG[pgo] = "--enable-optimizations"
>>>> +PACKAGECONFIG[tk] = ",,tk,tk"
>>>>
>>>> And then I run $ bitbake python3 -c create_manifest, but there is no
>>>> change in manifest file.
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Alejandro
>>>>>
>>>>>
>>>>>> ],
>>>>>>          "files": [
>>>>>> -            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
>>>>>> +            "${libdir}/python${PYTHON_MAJMIN}/tkinter",
>>>>>> + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
>>>>>>          ],
>>>>>>          "cached": []
>>>>>>      },
>>>>>>
>>>>>> There comes below error:
>>>>>> ERROR: Nothing RPROVIDES 'python3-tk' (but
>>>>>> /mybuild/layers/oe-core/meta/recipes-devtools/python/python3_3.5.6.bb
>>>>>> RDEPENDS on or otherwise requires it)
>>>>>> NOTE: Runtime target 'python3-tk' is unbuildable, removing...
>>>>>> Missing or unbuildable dependency chain was: ['python3-tk']
>>>>>> ERROR: Required build target 'python3' has no buildable providers.
>>>>>> Missing or unbuildable dependency chain was: ['python3',
>>>>>> 'python3-tk']
>>>>>>
>>>>>> That's to say, we still need to add some fix in
>>>>>> meta/recipes-devtools/python/python3_3.5.6.bb. If so, it may be
>>>>>> flexible and clear to directly to make the implement just as what I
>>>>>> send in the RR.
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>>
>>>>>>> Ross
>>>>>>>
>>>>>
>>>
>

