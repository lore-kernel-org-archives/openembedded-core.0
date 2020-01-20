Return-Path: <martin@geanix.com>
X-Greylist: delayed 477 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Jan 2020 13:01:20 UTC
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1D91F7FBEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 13:01:20 +0000 (UTC)
Received: from [192.168.8.20] (unknown [85.184.140.241])
	by first.geanix.com (Postfix) with ESMTPSA id 7C2AAABF6E;
	Mon, 20 Jan 2020 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1579524742; bh=4AJtAE1RiD33TufOgr+ueXKv/+JdmPs7D4wPA5c/Tmk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=eVzbO3mOaaP5KLo9rhsZ8s7NCX8e8e4ufNfjfXmkSO1dedttK/Rit60WQo1LvYcPX
	htuPZS7aanEDHUPavXIKAlc87+cQl5zaD+tyivI8YHjOjasQ7TIMJv3cHv3gp30sQw
	b63nQaXrIGuHOZt5tr/0JVnZCS/DXL5QjCRrSUmnNQVSoV9HagfZSrphSWpYd40imZ
	UiogPBqmyhsHLu9WtlA7FFp87HySrPwnjVyuB83LyRxu+jwkUOdy+tk9cWrsoV02dp
	yAgwKPzzzqP4Vk0/Q9BHEB2OyalLo79m0BG5x+FQkuVFZUVsQAIsXvlZDstFipJOuO
	W/Ugxnhz4cesA==
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@intel.com>
References: <20191018112819.16210-1-ross.burton@intel.com>
	<CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
	<1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <9bac0b45-777c-faba-f448-d2d03c7e6fac@geanix.com>
Date: Mon, 20 Jan 2020 13:53:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
X-Spam-Status: No, score=-2.7 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_INVALID, DKIM_SIGNED,
	URIBL_BLOCKED autolearn=disabled version=3.4.3
X-Spam-Checker-Version: SpamAssassin 3.4.3 (2019-12-06) on ea2d15de10a4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] file: explicitly disable seccomp
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
X-List-Received-Date: Mon, 20 Jan 2020 13:01:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

On 18/10/2019 23.28, Richard Purdie wrote:
> On Fri, 2019-10-18 at 18:03 +0530, Khem Raj wrote:
>>
>>
>> On Fri, Oct 18, 2019 at 4:58 PM Ross Burton <ross.burton@intel.com>
>> wrote:
>>> file will automatically enable seccomp if the seccomp headers are
>>> available, but
>>> the build will fail on Opensuse Tumbleweed because the include
>>> paths are wrong.
>>>
>>> Enabling seccomp is a bad idea because it interacts badly with
>>> pseudo (causing
>>> build failures), so explicitly and globally disable seccomp.
>>>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>> ---
>>>   meta/recipes-devtools/file/file_5.37.bb | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/file/file_5.37.bb
>>> b/meta/recipes-devtools/file/file_5.37.bb
>>> index a840dbc012b..c53a120b840 100644
>>> --- a/meta/recipes-devtools/file/file_5.37.bb
>>> +++ b/meta/recipes-devtools/file/file_5.37.bb
>>> @@ -21,6 +21,8 @@ S = "${WORKDIR}/git"
>>>
>>>   inherit autotools update-alternatives
>>>
>>> +EXTRA_OECONF += "--disable-libseccomp"
>>> +
>>
>> On host it makes sense but how about for target recipe ? We do have
>> libseccomp support
>> Perhaps it’s best to disable it for native and native sdk alone ?
> 
> Given the problem reports in the media and the decisions made by most
> other distros I think disabling this is probably safest until its been
> make more usable (no other distro is shipping this enabled now).

Arch Linux enabled libseccomp as of today:

https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/file&id=a52fa0a37bad1f4ab67a934a4e0025e70aa1fd0e

This breaks the use of `file` in do_package():

ERROR: base-files-3.0.14-r89 do_package: Fatal errors occurred in 
subprocesses:

Command '['file', '-b', 
'/home/martin/clients/connectedcars/yocto/build/tmp-glibc/work/iwg26-oe-linux-gnueabi/base-files/3.0.14-r89/package/etc/skel/.profile']' 
died with <Signals.SIGSYS: 31>.: Traceback (most recent call last):

   File 
"/home/martin/clients/connectedcars/yocto/poky/meta/lib/oe/utils.py", 
line 272, in run

     ret = self._target(*self._args, **self._kwargs)

   File 
"/home/martin/clients/connectedcars/yocto/poky/meta/lib/oe/package.py", 
line 70, in is_elf

     result = subprocess.check_output(["file", "-b", path], 
stderr=subprocess.STDOUT).decode("utf-8")

   File "/usr/lib/python3.8/subprocess.py", line 411, in check_output

     return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,

   File "/usr/lib/python3.8/subprocess.py", line 512, in run 


     raise CalledProcessError(retcode, process.args,

subprocess.CalledProcessError: Command '['file', '-b', 
'/home/martin/clients/connectedcars/yocto/build/tmp-glibc/work/iwg26-oe-linux-gnueabi/base-files/3.0.14-r89/package/etc/skel/.profile']' 
died with <Signals.SIGSYS: 31>.

Disabling libseccomp sandboxing at runtime fixes it for me:

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py

index efd36b3758..bc46d7c27c 100644

--- a/meta/lib/oe/package.py

+++ b/meta/lib/oe/package.py

@@ -67,7 +67,7 @@ def is_kernel_module_signed(path):

  # 16 - kernel module

  def is_elf(path):

      exec_type = 0

-    result = subprocess.check_output(["file", "-b", path], 
stderr=subprocess.STDOUT).decode("utf-8")

+    result = subprocess.check_output(["file", "-S", "-b", path], 
stderr=subprocess.STDOUT).decode("utf-8")



      if "ELF" in result:

          exec_type |= 1



