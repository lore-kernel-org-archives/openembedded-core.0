Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 802446C0CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 03:04:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAD34sOq025902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Nov 2018 19:04:54 -0800 (PST)
Received: from [128.224.162.215] (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 12 Nov 2018 19:04:53 -0800
To: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
	<1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
	<CAJTo0La+u72y4JiB9dGKGw==FR_8Uwu31pO19eJ78bVfnHj08Q@mail.gmail.com>
	<5BE4E504.4010809@windriver.com>
	<CAJTo0LZcL0H=sEdc7n7BRw+u-R3fHNb=2ooJO1hkPsp404PLqg@mail.gmail.com>
	<5BE8E53B.2010405@windriver.com>
	<07f660b1-59dd-5dbf-af25-39475b6cb477@xilinx.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5BEA3F06.3060705@windriver.com>
Date: Tue, 13 Nov 2018 11:03:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <07f660b1-59dd-5dbf-af25-39475b6cb477@xilinx.com>
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
X-List-Received-Date: Tue, 13 Nov 2018 03:04:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alejandro,

Many thanks for your comments, please check my comments inline.

On 2018年11月12日 23:28, Alejandro Hernandez wrote:
> Hey Yu,
>
>
> On 11/11/2018 6:28 PM, Yu, Mingli wrote:
>>
>>
>> On 2018年11月09日 21:02, Burton, Ross wrote:
>>> On Fri, 9 Nov 2018 at 01:39, Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>>> Why is this here and not in the manifest?
>>>>
>>>> It's because we can optionally enable or disable tk via PACKAGECONFIG,
>>>> if add it to manifest then we need to always enable tk which is also
>>>> the
>>>> implement in v1.
>>>
>>> Are you sure?  As I understand it there won't be any errors if the
>>> contents don't exist.  And to be honest if there are, then the
>>> manifest tooling should handle that neatly without special-casing.
>>
>> Hi Ross,
>>
>> Thanks for your feedback!
>>
>> I didn't quite understand what you mean. As I know, if we add the the
>> setting in manifest as below:
>> diff --git
>> a/meta/recipes-devtools/python/python3/python3-manifest.json
>> b/meta/recipes-devtools/python/python3/python3-manifest.json
>> index f922561..09c9199 100644
>> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>> @@ -1056,10 +1056,12 @@
>>      "tkinter": {
>>          "summary": "Python Tcl/Tk bindings",
>>          "rdepends": [
>> -            "core"
>> +            "core",
>> +            "tk"
>
>
> This error is happening because you are trying to add python3-tk on
> RDEPENDS, and that package doesn't exist, when you specify "foo" on the
> "rdepends" section of the manifest it is translated to ${PN}-foo.

Yes, that's why I point out that we need to add extra logic in python3 
recipe to make it rdepends on tk after add the logic as below:

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json 
b/meta/recipes-devtools/python/python3/python3-manifest.json
index f922561..09c9199 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1056,10 +1056,12 @@
      "tkinter": {
          "summary": "Python Tcl/Tk bindings",
          "rdepends": [
-            "core"
+            "core",
+            "tk"
          ],
          "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
+            "${libdir}/python${PYTHON_MAJMIN}/tkinter",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
          ],
          "cached": []
      },

>
> So two things:
>
> 1. The manifest can have the _tkinter.*.so on the "files section of
> tkinter (please note that this is _tkinter.*.so and not _tkinter*.so,
> the wildcard should be after a "." this is to keep a standard which the
> tooling can handle more easily.

Got it, thanks!

>
> When the PACKAGECONFIG is enabled, the files for tkinter will be picked
> up correctly.
>
> 2. You should not manually add "rdepends" to the manifest, the tool
> itself should populate those automatically, this is better because we
> would avoid this kind of errors.
>
> Please add the package to the manifest, populate the "files" and
> "summary" section and then run $ bitbake python3 -c create_manifest to
> populate the rdepends section automatically, also keep in mind that you
> should run this when the PACKAGECONFIG is enabled for the native package
> as well (thats how it will pick up the dependencies).

No new package needed to add to manifest, we only need to update the 
items for the existed package tkinter and per your suggestion not 
manually add "rdepends" to the manifest, so I only add files to manifest 
as below in manifest file,

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json 
b/meta/recipes-devtools/python/python3/python3-manifest.json
index f922561..09c9199 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1056,10 +1056,12 @@
"tkinter": {
"summary": "Python Tcl/Tk bindings",
"rdepends": [
     "core"
],
"files": [
- "${libdir}/python${PYTHON_MAJMIN}/tkinter"
+ "${libdir}/python${PYTHON_MAJMIN}/tkinter",
+ "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
],
"cached": []
},

And also the update the python3 recipe,

diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb 
b/meta/recipes-devtools/python/python3_3.5.6.bb
index 2a45476..e50e7dc 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -78,10 +78,11 @@ export CCSHARED = "-fPIC"
  # Fix cross compilation of different modules
  export CROSSPYTHONPATH = 
"${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"

-PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES', 
'qemu-usermode', 'pgo', '', d)}"
+PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES', 
'qemu-usermode', 'pgo', '', d)} tk"
  PACKAGECONFIG[readline] = ",,readline"
  # Use profile guided optimisation by running PyBench inside qemu-user
  PACKAGECONFIG[pgo] = "--enable-optimizations"
+PACKAGECONFIG[tk] = ",,tk,tk"

And then I run $ bitbake python3 -c create_manifest, but there is no 
change in manifest file.

Thanks,

>
>
> Cheers,
>
> Alejandro
>
>
>> ],
>>          "files": [
>> -            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
>> +            "${libdir}/python${PYTHON_MAJMIN}/tkinter",
>> + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
>>          ],
>>          "cached": []
>>      },
>>
>> There comes below error:
>> ERROR: Nothing RPROVIDES 'python3-tk' (but
>> /mybuild/layers/oe-core/meta/recipes-devtools/python/python3_3.5.6.bb
>> RDEPENDS on or otherwise requires it)
>> NOTE: Runtime target 'python3-tk' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['python3-tk']
>> ERROR: Required build target 'python3' has no buildable providers.
>> Missing or unbuildable dependency chain was: ['python3', 'python3-tk']
>>
>> That's to say, we still need to add some fix in
>> meta/recipes-devtools/python/python3_3.5.6.bb. If so, it may be
>> flexible and clear to directly to make the implement just as what I
>> send in the RR.
>>
>> Thanks,
>>
>>>
>>> Ross
>>>
>

