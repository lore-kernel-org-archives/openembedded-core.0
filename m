Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07D037DC61
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2019 08:35:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3S8Z1kW010602
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 28 Apr 2019 01:35:11 -0700
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 28 Apr 2019 01:34:50 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <608ce7362098bbc8c96431fd8c56441a46e1a56b.camel@linuxfoundation.org>
	<1549948241-309157-1-git-send-email-changqing.li@windriver.com>
	<efe358c26f3e3e9e83853e72256f54d1b9bd4a7f.camel@linuxfoundation.org>
	<5b10c70c-f8e5-6a32-4003-17398ddb0e01@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <9c660988-0998-7bf6-a233-d8f7a423fad5@windriver.com>
Date: Sun, 28 Apr 2019 16:34:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <5b10c70c-f8e5-6a32-4003-17398ddb0e01@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH V2] gcc-runtime: fix C++ header mapping for n32/x32 tune
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
X-List-Received-Date: Sun, 28 Apr 2019 08:35:38 -0000
Content-Type: multipart/alternative;
	boundary="------------10FA6172F6C33BB0A86C7E3D"
Content-Language: en-US

--------------10FA6172F6C33BB0A86C7E3D
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2/19/19 3:05 PM, Changqing Li wrote:
>
>
> On 2/14/19 7:19 PM, Richard Purdie wrote:
>> On Tue, 2019-02-12 at 13:10 +0800,changqing.li@windriver.com  wrote:
>>> From: Changqing Li<changqing.li@windriver.com>
>>>
>>>      The SDK was unable to find the C++ header pieces correctly since
>>> it's
>>>      using a generic compiler, not one specifically targeting the
>>> multilib
>>>      vendor prefix and default tune.  This adds the right mapping to
>>> ensure
>>>      SDKs work as expected. And fix problem in below configurations:
>>>
>>>      multilib configuration 1:
>>>      MACHINE="qemumips64"
>>>      MULTILIBS ?= "multilib:lib32 multilib:libn32"
>>>      DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
>>>      DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
>>>      MULTILIB_GLOBAL_VARIANTS_append = " libn32"
>>>      require conf/multilib.conf
>>>
>>>      ignoring nonexistent directory "<path>/sysroots/mips64-poky-
>>> linux/usr/include/c++/8.2.0/mips64-poky-linux/32
>>>
>>>      multilib configuration 2:
>>>      MACHINE="qemumips64"
>>>      MULTILIBS = 'multilib:lib64 multilib:lib32'
>>>      DEFAULTTUNE = 'mips64-n32'
>>>      DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'
>>>      DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'
>>>      require conf/multilib.conf
>>>
>>>      For this configuration:
>>>      for target gcc-runtime, need to create symlink like mips64-poly-
>>> linux --> mips64-poky-linux-gnu32
>>>      for target lib64-gcc-runtime, need to create symlink like mips64-
>>> poly-linux/32 --> mips64-pokymllib64-linux
>>>      in order to avoid conflict during populate_sdk, create symlink
>>> for subfoler bits/ext for target gcc-runtime,
>>>      this is ugly, but seems no better way to cover all kinds of
>>> configuration.
>>>
>>>      single lib configuration:
>>>      MACHINE="qemumips64"
>>>      DEFAULTTUNE = "mips64-n32"
>>>
>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> ---
>>>   meta/recipes-devtools/gcc/gcc-runtime.inc | 29 +++++++++++++++++--
>>> ----------
>>>   1 file changed, 17 insertions(+), 12 deletions(-)
>> I haven't looked into why and it took a bit of narrowing down to find
>> the commit responsible but this is still causing a failure on the
>> autobuilder:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/285
>
> Hi, Richard
>
> I checked this problem,  this autobuilder fail seems not related to 
> this patch.
>
> it is failed as:
>
> Error:
> Problem: conflicting requests
> - nothing provides lib64-lttng-modules needed by 
> lib64-packagegroup-core-tools-profile-1.0-r3.0.qemux86'
>
> but one place weird is I cannot reproduce this error locally with same 
> configuration.
>
> This is my lib64-packagegroup-core-tools-profile.spec:
>
> Requires: lib64-powertop
> Requires: lib64-systemtap
> Requires: lib64-valgrind
> Requires: lttng-modules
> Recommends: lib64-blktrace
>
>
> Requires should be lttng-modules  and not lib64-lttng-modules. 
> lib64-lttng-modules should have been replace to lttng-modules.
>
> during do_package_rpm->mapping_rename_hook->get_package_mapping.
>
>
> I checked history of this part of code,  it should not have change 
> recently,  so my local code should same as autobuildler, so I don't
>
> quite understand why autobuilder failed.
>
>
> If possible, could you help to check on the build server of the 
> autobuilder ? Thanks.
>
Hi, Richard

I  tested the scenario of the failed build with this patch and the 
latest poky distro.  It can build success.  Also,  the fauilure seems not

related to this patch.


Could you try again build this patch on autobuilder?  Thanks

>> Cheers,
>>
>> Richard
>>
>>
> -- 
> BRs
>
> Sandy(Li Changqing)
>
-- 
BRs

Sandy(Li Changqing)


--------------10FA6172F6C33BB0A86C7E3D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2/19/19 3:05 PM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5b10c70c-f8e5-6a32-4003-17398ddb0e01@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2/14/19 7:19 PM, Richard Purdie
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:efe358c26f3e3e9e83853e72256f54d1b9bd4a7f.camel@linuxfoundation.org">
        <pre class="moz-quote-pre" wrap="">On Tue, 2019-02-12 at 13:10 +0800, <a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">changqing.li@windriver.com</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>

    The SDK was unable to find the C++ header pieces correctly since
it's
    using a generic compiler, not one specifically targeting the
multilib
    vendor prefix and default tune.  This adds the right mapping to
ensure
    SDKs work as expected. And fix problem in below configurations:

    multilib configuration 1:
    MACHINE="qemumips64"
    MULTILIBS ?= "multilib:lib32 multilib:libn32"
    DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
    DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
    MULTILIB_GLOBAL_VARIANTS_append = " libn32"
    require conf/multilib.conf

    ignoring nonexistent directory "&lt;path&gt;/sysroots/mips64-poky-
linux/usr/include/c++/8.2.0/mips64-poky-linux/32

    multilib configuration 2:
    MACHINE="qemumips64"
    MULTILIBS = 'multilib:lib64 multilib:lib32'
    DEFAULTTUNE = 'mips64-n32'
    DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'
    DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'
    require conf/multilib.conf

    For this configuration:
    for target gcc-runtime, need to create symlink like mips64-poly-
linux --&gt; mips64-poky-linux-gnu32
    for target lib64-gcc-runtime, need to create symlink like mips64-
poly-linux/32 --&gt; mips64-pokymllib64-linux
    in order to avoid conflict during populate_sdk, create symlink
for subfoler bits/ext for target gcc-runtime,
    this is ugly, but seems no better way to cover all kinds of
configuration.

    single lib configuration:
    MACHINE="qemumips64"
    DEFAULTTUNE = "mips64-n32"

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 29 +++++++++++++++++--
----------
 1 file changed, 17 insertions(+), 12 deletions(-)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I haven't looked into why and it took a bit of narrowing down to find
the commit responsible but this is still causing a failure on the
autobuilder:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/285" moz-do-not-send="true">https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/285</a></pre>
      </blockquote>
      <p>Hi, Richard</p>
      <p>I checked this problem,  this autobuilder fail seems not
        related to this patch.</p>
      <p>it is failed as:</p>
      <div style="box-sizing: border-box; height: 18px; color: rgb(199, 199, 199); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(0, 0, 0); text-decoration-style: initial; text-decoration-color: initial;"><span class="no-wrap log_o ng-binding" data-linenumber-content="10206" style="box-sizing: border-box; color: rgb(199, 199, 199); white-space: pre; overflow-wrap: normal;"><span class="" style="box-sizing: border-box;">Error: </span></span></div>
      <div style="box-sizing: border-box; height: 18px; color: rgb(199, 199, 199); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(0, 0, 0); text-decoration-style: initial; text-decoration-color: initial;"><span class="no-wrap log_o ng-binding" data-linenumber-content="10207" style="box-sizing: border-box; color: rgb(199, 199, 199); white-space: pre; overflow-wrap: normal;"><span class="" style="box-sizing: border-box;"> Problem: conflicting requests</span></span></div>
      <div style="box-sizing: border-box; height: 18px; color: rgb(199, 199, 199); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(0, 0, 0); text-decoration-style: initial; text-decoration-color: initial;"><span class="no-wrap log_o ng-binding" data-linenumber-content="10208" style="box-sizing: border-box; color: rgb(199, 199, 199); white-space: pre; overflow-wrap: normal;"><span class="" style="box-sizing: border-box;">  - nothing provides lib64-lttng-modules needed by lib64-packagegroup-core-tools-profile-1.0-r3.0.qemux86'</span></span></div>
      <p>but one place weird is I cannot reproduce this error locally
        with same configuration.</p>
      <p>This is my lib64-packagegroup-core-tools-profile.spec:<br>
      </p>
      <p>Requires: lib64-powertop<br>
        Requires: lib64-systemtap<br>
        Requires: lib64-valgrind<br>
        Requires: lttng-modules<br>
        Recommends: lib64-blktrace</p>
      <p><br>
      </p>
      <p>Requires should be lttng-modules  and not lib64-lttng-modules. 
        lib64-lttng-modules should have been replace to lttng-modules.</p>
      <p>during
        do_package_rpm-&gt;mapping_rename_hook-&gt;get_package_mapping. </p>
      <p><br>
      </p>
      <p>I checked history of this part of code,  it should not have
        change recently,  so my local code should same as autobuildler,
        so I don't</p>
      <p>quite understand why autobuilder failed.   </p>
      <p><br>
      </p>
      <p>If possible, could you help to check on the build server of the
        autobuilder ? Thanks.<br>
      </p>
    </blockquote>
    <p>Hi, Richard</p>
    <p>I  tested the scenario of the failed build with this patch and
      the latest poky distro.  It can build success.  Also,  the
      fauilure seems not</p>
    <p>related to this patch.</p>
    <p><br>
    </p>
    <p>Could you try again build this patch on autobuilder?  Thanks</p>
    <blockquote type="cite"
      cite="mid:5b10c70c-f8e5-6a32-4003-17398ddb0e01@windriver.com">
      <p> </p>
      <blockquote type="cite"
cite="mid:efe358c26f3e3e9e83853e72256f54d1b9bd4a7f.camel@linuxfoundation.org">
        <pre class="moz-quote-pre" wrap="">Cheers,

Richard


</pre>
      </blockquote>
      <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)</pre>
  </body>
</html>

--------------10FA6172F6C33BB0A86C7E3D--
