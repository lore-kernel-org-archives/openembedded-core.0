Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58D0C601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 16:00:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2TG0dZk009481
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Mar 2016 09:00:39 -0700 (PDT)
Received: from [128.224.124.174] (128.224.124.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 29 Mar 2016 09:00:39 -0700
To: Phil Blundell <pb@pbcl.net>, <raj.khem@gmail.com>,
	<richard.purdie@linuxfoundation.org>, <mark.hatle@windriver.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
From: Dragomir Daniel <daniel.dragomir@windriver.com>
Message-ID: <56FAA65F.9060300@windriver.com>
Date: Tue, 29 Mar 2016 18:59:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1459203003.2322.29.camel@pbcl.net>
X-Originating-IP: [128.224.124.174]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Tue, 29 Mar 2016 16:00:43 -0000
Content-Type: multipart/alternative;
	boundary="------------010603090809040903070802"

--------------010603090809040903070802
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks, Phil!
See my answers in-line.

Khem, Richard, Mark, can you please review and comment on this new
version of the patch?

On 03/29/2016 01:10 AM, Phil Blundell wrote:
> On Mon, 2016-03-28 at 18:29 +0300, Daniel Dragomir wrote:
>> For AArch64 state, the default tune is aarch32 and include which
>>      include just the aarch64 feature.
> I don't really understand what this sentence is trying to say.  Can you
> re-phrase it so as to be more accessible to non-experts?

Sorry.

For AArch64 state, the default tune is aarch32 and include just the aarch64 feature.


>>   meta/conf/machine/include/arm/arch-arm64.inc       |  36 -------
>>   meta/conf/machine/include/arm/arch-armv8.inc       |   1 -
> If you are deleting existing files, please mention that in the commit
> message.  And in particular, if you are removing a file that supports
> generic ARMv8 (if imperfectly) and replacing it with something that is
> specific to ARMv8-A, please explain why this is a good thing.

OK, I'll add a comment.
Before, arch-armv8.inc which apparently add support for generic armv8, only
include arch-arm64.inc, so it's for 64-bit.
But just armv8-A supports 32 and 64 states... armv8-R and armv8-M are just
for 32. So it wasn't generic. Details here:
http://www.arm.com/products/processors/instruction-set-architectures/armv8-r-architecture.php

arch-arm8a.inc add now support for armv8-A processors which support 2 
states:
32-bit and 64-bit states. It makes more sense to have support for both 
states
in the same inc file because both refer to the same arch.

>
>> +TUNEVALID[crc] = "Enable CRC instructions for ARMv8-a"
>> +ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '-crc', '', d)}"
>> +ARMPKGSFX_FPU_64 = "${@bb.utils.contains('TUNE_FEATURES', 'crc', '-crc', '', d)}"
> Why is this involved with ARMPKGSFX_FPU?  The crc instructions are not
> related to the fpu.  Also, the fact that you need to duplicate both this
> and the crypto one for both FPU and FPU_64 seems like an indication that
> something elsewhere is misdesigned.

You're right. I'll add a new suffix variable for crc and crypto witch will
be use for both 32 and 64 tunes.

ARMPKGSFX_EXT - This is the EXTENSIONS specific suffix. The suffix
indicates specific extentions enabled. 'crc' and 'crypto' are defined.
Curently it is used just for armv8a architecture.

>
>> +TUNEVALID[fp-armv8] = "Enable ARMv8 Vector Floating Point unit."
>> +ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'fp-armv8', '-fp-armv8', '', d)}"
> I don't entirely understand why this one doesn't have an FPU_64
> equivalent.  Are you always enabling vfp for A64?

Yes. Floating point is enabled by default. From documentation:
"fp- Enable floating-point instructions. This is on by default for all 
possible values for options -marchand -mcpu."
https://gcc.gnu.org/onlinedocs/gcc/AArch64-Options.html

>
>> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch32', 'aarch32:', '' ,d)}"
>> +MACHINEOVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ':aarch64', '' ,d)}"
> As previously discussed, I am not wild about "aarch32" as the name of an
> override which really means "ARMv8 in AArch32 state".  I know there is a
> school of thought that says that the execution state of older cpus is
> not AArch32 even if in practice it is indistinguishable, but this
> doesn't seem to match either the expectations that a rational user of OE
> is likely to have, or the information in the published literature.

I changed armv8a with aarch32 because Khem Raj asked for a previous version
of the patch and in uther discussions related...
http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118904.html

So, you say that we should not use aarch32 and aarch64 for armv8a, but
to use something like armv8a64 and armv8a32?
I have no problem with this, but we need to take a decision agreed by 
everyone.
It's the second time I change the tune names :)

>> +ARMPKGARCH_tune-aarch64            ?= "aarch64"
> This seems a tiny bit short-sighted since presumably there will be an
> ARMv9 (or ARMv8.2) at some point.  What will ARMPKGARCH for A64 be then?

Maybe with armv8a64 and armv8a32 this will be solved.

>
>> +BASE_LIB_tune-aarch64            = "lib64"
> This seems like more a matter of distro policy and I'm not sure it
> belongs in a tune file.  If it does then can't you rely on the aarch64
> MACHINEOVERRIDE and just write "BASE_LIB_aarch64" rather than having to
> duplicate this for all four of the tunes (and the -be equivalents)?

BASE_LIB is defined also in many other tune files without any overwrites.
It was in aarch64.inc and I simply copied here.

It need to be used with suffix... see in Readme:
BASE_LIB_tune-<tune> - The "/lib" location for a specific ABI.  This is
used in a multilib configuration to place the libraries in the correct,
non-conflicting locations.

And this is how it's used in multilib.conf
baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or d.getVar('BASELIB', True)}"

I can use ${BASE_LIB_tune-aarch64} for all the other tunes to be easier
to override.

>> +# Duplicated from arch-arm.inc
> Please add a comment explaining why you can't include arch-arm.inc.

I took the content from arch-arm64.inc and add it here. This duplication
was done in the first commit that add the arch-arm64.inc file.
So, I don't know exactly the reason. Maybe this was discussed on the first
implementation of aarch64 tune made by Mark.

Daniel

> p.
>
>


--------------010603090809040903070802
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <tt>Thanks, Phil! <br>
      See my answers in-line.</tt><tt><br>
      <br>
    </tt><tt>Khem, Richard, Mark, can you please review and comment on
      this new <br>
      version of the patch? </tt><br>
    <br>
    <div class="moz-cite-prefix">On 03/29/2016 01:10 AM, Phil Blundell
      wrote:<br>
    </div>
    <blockquote cite="mid:1459203003.2322.29.camel@pbcl.net" type="cite">
      <pre wrap="">On Mon, 2016-03-28 at 18:29 +0300, Daniel Dragomir wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">For AArch64 state, the default tune is aarch32 and include which
    include just the aarch64 feature.
</pre>
      </blockquote>
      <pre wrap="">
I don't really understand what this sentence is trying to say.  Can you
re-phrase it so as to be more accessible to non-experts?
</pre>
    </blockquote>
    <br>
    <tt>Sorry. </tt><tt><br>
    </tt>
    <pre wrap="">For AArch64 state, the default tune is aarch32 and include just the aarch64 feature.</pre>
    <br>
    <blockquote cite="mid:1459203003.2322.29.camel@pbcl.net" type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap=""> meta/conf/machine/include/arm/arch-arm64.inc       |  36 -------
 meta/conf/machine/include/arm/arch-armv8.inc       |   1 -
</pre>
      </blockquote>
      <pre wrap="">
If you are deleting existing files, please mention that in the commit
message.  And in particular, if you are removing a file that supports
generic ARMv8 (if imperfectly) and replacing it with something that is
specific to ARMv8-A, please explain why this is a good thing.</pre>
    </blockquote>
    <br>
    <tt>OK, I'll add a comment.<br>
      Before, arch-armv8.inc which apparently add support for generic
      armv8, only <br>
      include arch-arm64.inc, so it's for 64-bit.<br>
      But just armv8-A supports 32 and 64 states... armv8-R and armv8-M
      are just <br>
      for 32. So it wasn't generic. Details here:<br>
    </tt><tt><a class="moz-txt-link-freetext" href="http://www.arm.com/products/processors/instruction-set-architectures/armv8-r-architecture.php">http://www.arm.com/products/processors/instruction-set-architectures/armv8-r-architecture.php</a></tt><br>
    <br>
    <tt>arch-arm8a.inc add now support for armv8-A processors which
      support 2 states</tt><tt>:<br>
      32-bit and 64-bit states. It makes more sense to have support for
      both states<br>
      in the same inc file because both refer to the same arch. <br>
    </tt><br>
    <blockquote cite="mid:1459203003.2322.29.camel@pbcl.net" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+TUNEVALID[crc] = "Enable CRC instructions for ARMv8-a"
+ARMPKGSFX_FPU .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','crc','-crc','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'crc', '-crc', '', d)}"</a>
+ARMPKGSFX_FPU_64 = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','crc','-crc','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'crc', '-crc', '', d)}"</a>
</pre>
      </blockquote>
      <pre wrap="">
Why is this involved with ARMPKGSFX_FPU?  The crc instructions are not
related to the fpu.  Also, the fact that you need to duplicate both this
and the crypto one for both FPU and FPU_64 seems like an indication that
something elsewhere is misdesigned.</pre>
    </blockquote>
    <tt><br>
      You're right. I'll add a new suffix variable for crc and crypto
      witch will<br>
      be use for both 32 and 64 tunes.<br>
      <br>
    </tt><tt>ARMPKGSFX_EXT - This is the EXTENSIONS specific suffix. 
      The suffix </tt><tt><br>
    </tt><tt>indicates specific extentions enabled. 'crc' and 'crypto'
      are defined.</tt><tt><br>
    </tt><tt>Curently it is used just for armv8a architecture.</tt><br>
    <br>
    <blockquote cite="mid:1459203003.2322.29.camel@pbcl.net" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+TUNEVALID[fp-armv8] = "Enable ARMv8 Vector Floating Point unit."
+ARMPKGSFX_FPU .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','fp-armv8','-fp-armv8','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'fp-armv8', '-fp-armv8', '', d)}"</a>
</pre>
      </blockquote>
      <pre wrap="">
I don't entirely understand why this one doesn't have an FPU_64
equivalent.  Are you always enabling vfp for A64?</pre>
    </blockquote>
    <tt><br>
    </tt><tt>Yes. Floating point is enabled by default. From
      documentation:</tt><tt><br>
    </tt><samp><span class="samp">"fp</span></samp><tt> - Enable
      floating-point instructions. This is on by default for all
      possible
      values for options </tt><samp><span class="option">-march</span></samp><tt>
      and </tt><samp><span class="option">-mcpu</span></samp><tt>."<br>
      <a class="moz-txt-link-freetext" href="https://gcc.gnu.org/onlinedocs/gcc/AArch64-Options.html">https://gcc.gnu.org/onlinedocs/gcc/AArch64-Options.html</a><br>
      <br>
    </tt>
    <blockquote cite="mid:1459203003.2322.29.camel@pbcl.net" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+MACHINEOVERRIDES =. <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','aarch32','aarch32:','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'aarch32', 'aarch32:', '' ,d)}"</a>
+MACHINEOVERRIDES .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','aarch64',':aarch64','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ':aarch64', '' ,d)}"</a>
</pre>
      </blockquote>
      <pre wrap="">
As previously discussed, I am not wild about "aarch32" as the name of an
override which really means "ARMv8 in AArch32 state".  I know there is a
school of thought that says that the execution state of older cpus is
not AArch32 even if in practice it is indistinguishable, but this
doesn't seem to match either the expectations that a rational user of OE
is likely to have, or the information in the published literature.
</pre>
    </blockquote>
    <br>
    <tt>I changed armv8a with aarch32 because Khem Raj asked for a
      previous version<br>
      of the patch and in uther discussions related... <br>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118904.html">http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118904.html</a><br>
      <br>
      So, you say that we should not use aarch32 and aarch64 for armv8a,
      but <br>
      to use something like armv8a64 and armv8a32?<br>
      I have no problem with this, but we need </tt><tt><span
        id="result_box" class="short_text" lang="en"><span
          class="alt-edited">to take a decision agreed by everyone.<br>
          It's the second time I change the tune names :)<br>
          <br>
        </span></span></tt>
    <blockquote cite="mid:1459203003.2322.29.camel@pbcl.net" type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+ARMPKGARCH_tune-aarch64            ?= "aarch64"
</pre>
      </blockquote>
      <pre wrap="">
This seems a tiny bit short-sighted since presumably there will be an
ARMv9 (or ARMv8.2) at some point.  What will ARMPKGARCH for A64 be then?</pre>
    </blockquote>
    <tt><br>
    </tt><tt>Maybe with </tt><tt>armv8a64 and armv8a32 this will be
      solved.</tt><br>
    <br>
    <blockquote cite="mid:1459203003.2322.29.camel@pbcl.net" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+BASE_LIB_tune-aarch64            = "lib64"
</pre>
      </blockquote>
      <pre wrap="">
This seems like more a matter of distro policy and I'm not sure it
belongs in a tune file.  If it does then can't you rely on the aarch64
MACHINEOVERRIDE and just write "BASE_LIB_aarch64" rather than having to
duplicate this for all four of the tunes (and the -be equivalents)?
</pre>
    </blockquote>
    <tt></tt><br>
    <pre wrap="">BASE_LIB is defined also in many other tune files without any overwrites. 
It was in aarch64.inc and I simply copied here.

It need to be used with suffix... see in Readme:
BASE_LIB_tune-&lt;tune&gt; - The "/lib" location for a specific ABI.  This is
used in a multilib configuration to place the libraries in the correct,
non-conflicting locations.

And this is how it's used in multilib.conf
baselib = <a class="moz-txt-link-rfc2396E" href="mailto:${@d.getVar('BASE_LIB_tune-'+(d.getVar('DEFAULTTUNE',True)or'INVALID'),True)ord.getVar('BASELIB',True)}">"${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or d.getVar('BASELIB', True)}"</a>
</pre>
    <tt>I can use ${BASE_LIB_tune-aarch64} for all the other tunes to be
      easier <br>
      to override.<br>
    </tt><tt><br>
    </tt>
    <blockquote cite="mid:1459203003.2322.29.camel@pbcl.net" type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+# Duplicated from arch-arm.inc
</pre>
      </blockquote>
      <pre wrap="">
Please add a comment explaining why you can't include arch-arm.inc.
</pre>
    </blockquote>
    <br>
    <tt>I took the content from arch-arm64.inc and add it here. This
      duplication <br>
      was done in the first commit that add the </tt><tt><tt>arch-arm64.inc
        file</tt>.<br>
      So, I don't know exactly the reason. Maybe this was discussed on
      the first<br>
      implementation of aarch64 tune made by Mark.<br>
      <br>
      Daniel<br>
    </tt><br>
    <blockquote cite="mid:1459203003.2322.29.camel@pbcl.net" type="cite">
      <pre wrap="">
p.


</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------010603090809040903070802--
