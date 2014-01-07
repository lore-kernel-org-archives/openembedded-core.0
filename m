Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0E2C6B7AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 07:52:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s077qMTS028491
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Jan 2014 23:52:22 -0800 (PST)
Received: from [128.224.162.153] (128.224.162.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 6 Jan 2014 23:52:22 -0800
Message-ID: <52CBB231.8050208@windriver.com>
Date: Tue, 7 Jan 2014 15:52:17 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1384426288-3534-1-git-send-email-ming.liu@windriver.com>
	<1389011136.22784.7.camel@ted>
In-Reply-To: <1389011136.22784.7.camel@ted>
X-Originating-IP: [128.224.162.153]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate: Add optimizing logic for crosssdk setscene dependencies
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
X-List-Received-Date: Tue, 07 Jan 2014 07:52:25 -0000
Content-Type: multipart/alternative;
	boundary="------------080403070608030308090507"

--------------080403070608030308090507
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2014 08:25 PM, Richard Purdie wrote:
> On Thu, 2013-11-14 at 18:51 +0800, Ming Liu wrote:
>> This patch mainly aims to add optimisation for crosssdk setscene dependency
>> validating which we haven't handled in current logic, and which I think we
>> could have as we've already implemented to native/cross, although there
>> are albeit not many crossdk tasks, we could still get some performance
>> enhancement.
>>
>> And it also fix a vulnerability of some certain workflow, think about the
>> following scenario with current logic:
>>      bitbake nativesdk-eglibc-initial -c cleansstate
>>      bitbake gcc-crosssdk-initial -c clean
>>      bitbake gmp-native -c clean
>>      bitbake libmpc-native -c clean
>>      bitbake mpfr-native -c clean
>>      bitbake gcc-crosssdk-initial
>>      bitbake nativesdk-eglibc-initial
>>
>> Aboving will fail for absence of a few native libraries required by
>> gcc-crosssdk-initial.
>>
>> Also modified some places in current code except the optimisation, as
>> following:
>> 1 Remove isNative function since no code is referring it.
>> 2 Add do_package to the list that don't exist and are noexec.
> I've split this patch up as its doing too many things at once. In
> particular, I think we should keep the "isNativeCross()" function name
> instead of adding Crosssdk to the name since it just makes things more
> confusing to read.
I am on board with your comments.

>
> I've take a part for the crosssdk part in master-next which is being
> tested at the moment, can you resent the do_package part by itself
> please?
No problem, I will resend a patch soon with modifying the do_package 
part only.

>
> I don't quite understand how the sequence of commands above breaks
> things or how this patch fixes it. Are you sure this wasn't fixed by:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ciorga/PUs&id=1dcbf3096d7d42032faade96dae89c25a4feca7a
>
> which would be the real bug?
I am pretty sure they are**NOT the same issue. The 1dcbf309 is about to 
fix gcc-crosssdk lacking its dependencies in bb, while in this case, 
it's due to some other setscene tasks(populate_sysroot) depended by 
gcc-crosssdk-initial's setscene task(populate_sysroot) were not 
validated correctly, without the modification to isNativeCross, the 
setscene_depvalid will return TRUE through:
......
             # Native/Cross populate_sysroot need their dependencies
             if isNativeCross(taskdependees[task][0]) and 
isNativeCross(taskdependees[dep][0]):
                 return False
             # Target populate_sysroot depended on by cross tools need 
to be installed
             if isNativeCross(taskdependees[dep][0]):
                 return False
             # Native/cross tools depended upon by target sysroot are 
not needed
             if isNativeCross(taskdependees[task][0]):
                 continue
......
     return True
......

for example, when the task is 'gmp-native', and the dep is 
'gcc-crosssdk-initial', it is absolutely wrong for gcc-crosssdk-initial 
needs its dependencies like gmp-native, libmpc-native, mpfr-native to be 
present in sysroot or its binaries will fail to be executed.

However, by double-checked the patch, I found that it had introduced a 
regression that binutils-crosssdk should not be added into safe dep list 
for it's in the DEPENDS of gcc-crosssdk-initial, I will send a fix for 
it too.

//Ming Liu
>
> Cheers,
>
> Richard
>
>
>


--------------080403070608030308090507
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 01/06/2014 08:25 PM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote cite="mid:1389011136.22784.7.camel@ted" type="cite">
      <pre wrap="">On Thu, 2013-11-14 at 18:51 +0800, Ming Liu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">This patch mainly aims to add optimisation for crosssdk setscene dependency
validating which we haven't handled in current logic, and which I think we
could have as we've already implemented to native/cross, although there
are albeit not many crossdk tasks, we could still get some performance
enhancement.

And it also fix a vulnerability of some certain workflow, think about the
following scenario with current logic:
    bitbake nativesdk-eglibc-initial -c cleansstate
    bitbake gcc-crosssdk-initial -c clean
    bitbake gmp-native -c clean
    bitbake libmpc-native -c clean
    bitbake mpfr-native -c clean
    bitbake gcc-crosssdk-initial
    bitbake nativesdk-eglibc-initial

Aboving will fail for absence of a few native libraries required by
gcc-crosssdk-initial.

Also modified some places in current code except the optimisation, as
following:
1 Remove isNative function since no code is referring it.
2 Add do_package to the list that don't exist and are noexec.
</pre>
      </blockquote>
      <pre wrap="">
I've split this patch up as its doing too many things at once. In
particular, I think we should keep the "isNativeCross()" function name
instead of adding Crosssdk to the name since it just makes things more
confusing to read.</pre>
    </blockquote>
    I am on board with your comments.<br>
     <br>
    <blockquote cite="mid:1389011136.22784.7.camel@ted" type="cite">
      <pre wrap="">

I've take a part for the crosssdk part in master-next which is being
tested at the moment, can you resent the do_package part by itself
please?</pre>
    </blockquote>
    No problem, I will resend a patch soon with modifying the do_package
    part only.<br>
    <br>
    <blockquote cite="mid:1389011136.22784.7.camel@ted" type="cite">
      <pre wrap="">

I don't quite understand how the sequence of commands above breaks
things or how this patch fixes it. Are you sure this wasn't fixed by:

<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ciorga/PUs&amp;id=1dcbf3096d7d42032faade96dae89c25a4feca7a">http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ciorga/PUs&amp;id=1dcbf3096d7d42032faade96dae89c25a4feca7a</a>

which would be the real bug?</pre>
    </blockquote>
    I am pretty sure they are<b> </b>NOT the same issue. The 1dcbf309
    is about to fix gcc-crosssdk lacking its dependencies in bb, while
    in this case, it's due to some other setscene
    tasks(populate_sysroot) depended by gcc-crosssdk-initial's setscene
    task(populate_sysroot) were not validated correctly, without the
    modification to isNativeCross, the setscene_depvalid will return
    TRUE through:<br>
    ......<br>
                # Native/Cross populate_sysroot need their dependencies<br>
                if isNativeCross(taskdependees[task][0]) and
    isNativeCross(taskdependees[dep][0]):<br>
                    return False<br>
                # Target populate_sysroot depended on by cross tools
    need to be installed<br>
                if isNativeCross(taskdependees[dep][0]):<br>
                    return False<br>
                # Native/cross tools depended upon by target sysroot are
    not needed<br>
                if isNativeCross(taskdependees[task][0]):<br>
                    continue<br>
    ......<br>
        return True<br>
    ......<br>
    <br>
    for example, when the task is 'gmp-native', and the dep is
    'gcc-crosssdk-initial', it is absolutely wrong for
    gcc-crosssdk-initial needs its dependencies like gmp-native,
    libmpc-native, mpfr-native to be present in sysroot or its binaries
    will fail to be executed.<br>
    <br>
    However, by double-checked the patch, I found that it had introduced
    a regression that binutils-crosssdk should not be added into safe
    dep list for it's in the DEPENDS of gcc-crosssdk-initial, I will
    send a fix for it too.<br>
    <br>
    //Ming Liu<br>
    <blockquote cite="mid:1389011136.22784.7.camel@ted" type="cite">
      <pre wrap="">

Cheers,

Richard



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------080403070608030308090507--
