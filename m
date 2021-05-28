Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.2099.1622161795214551721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 17:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=KDv6x7XS;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.99] (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8F35D20B7188;
	Thu, 27 May 2021 17:29:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8F35D20B7188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1622161794;
	bh=IQX+AHk6+b7qsL6mBSJLKp6QqEEFBZMp9YuqvOlOa9s=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=KDv6x7XSFRpXU52LPaKJicUEQQlUJlV7Yh2o8VBxVvtB+61tl8UrSjFJ2/sBzvjsd
	 UOcg5qpaBqBefMxD8tZN32rR7h9nsinSfLc2dDsdbDmrjCWYc9+KI+ifu1LnvUVvEg
	 g8PSMiaVdZRXqPF/sImzmndBcwPmJb4fgba/qywU=
Subject: Re: [OE-core] [dunfell-backport][PATCH] gcc-cross-canadian: Install gcc/g++ wrappers for musl
To: Steve Sakoman <sakoman@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
 Leon Woestenberg <leon@sidebranch.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20210527171628.2181867-1-alhe@linux.microsoft.com>
 <CAGDS+nnDGVY-iOwPWD1OD-auRXejkn+eMcMQK4GE20VV9uBZhA@mail.gmail.com>
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
Message-ID: <9a800d99-6b6a-329f-7a21-034d8cc3cb3b@linux.microsoft.com>
Date: Thu, 27 May 2021 18:29:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAGDS+nnDGVY-iOwPWD1OD-auRXejkn+eMcMQK4GE20VV9uBZhA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------4B217B203EAC5BF49213A1D8"
Content-Language: en-US

--------------4B217B203EAC5BF49213A1D8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Perhaps, I will take a look at it.

Thanks


Alejandro

On 5/27/21 2:25 PM, Steve Sakoman wrote:
> I get an autobuilder failure on core-image-mingw-sdktest, details here:
>
> https://errors.yoctoproject.org/Errors/Details/585665/
>
> Perhaps we need additional patch/patches from master?
>
> Steve
>
> On Thu, May 27, 2021 at 7:16 AM Alejandro Hernandez Samaniego
> <alhe@linux.microsoft.com> wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> gcc needs -mmusl option to be passed in SDK since we ship crossdk compiler
>> configured for glibc by default, this helps in creating correct
>> compiler defaults for musl based SDK compilers
>>
>> [YOCTO #13459]
>>
>> (From OE-Core rev: e6fbac7aeabe00d8fb734992012dd629a8527b25)
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Leon Woestenberg <leon@sidebranch.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   .../gcc/gcc-cross-canadian.inc                | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> index 553ef7fe62..c5935b978d 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>> @@ -139,6 +139,29 @@ do_install () {
>>          chown -R root:root ${D}
>>
>>          cross_canadian_bindirlinks
>> +
>> +       for i in linux ${CANADIANEXTRAOS}
>> +       do
>> +               for v in ${CANADIANEXTRAVENDOR}
>> +               do
>> +                       d=${D}${bindir}/../${TARGET_ARCH}$v-$i
>> +                       install -d $d
>> +                       for j in ${TARGET_PREFIX}gcc${EXEEXT} ${TARGET_PREFIX}g++${EXEEXT}
>> +                       do
>> +                               p=${TARGET_ARCH}$v-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
>> +                               case $i in
>> +                               *musl*)
>> +                                       rm -rf $d/$p
>> +                                       echo "#!/usr/bin/env sh" > $d/$p
>> +                                       echo "exec \`dirname \$0\`/../${TARGET_SYS}/$j -mmusl \$@" >> $d/$p
>> +                                       chmod 0755 $d/$p
>> +                                       ;;
>> +                               *)
>> +                                       ;;
>> +                               esac
>> +                       done
>> +               done
>> +       done
>>   }
>>
>>   ELFUTILS = "nativesdk-elfutils"
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>> 
>>

--------------4B217B203EAC5BF49213A1D8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Perhaps, I will take a look at it.</p>
    <p>Thanks</p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <div class="moz-cite-prefix">On 5/27/21 2:25 PM, Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAGDS+nnDGVY-iOwPWD1OD-auRXejkn+eMcMQK4GE20VV9uBZhA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">I get an autobuilder failure on core-image-mingw-sdktest, details here:

<a class="moz-txt-link-freetext" href="https://errors.yoctoproject.org/Errors/Details/585665/">https://errors.yoctoproject.org/Errors/Details/585665/</a>

Perhaps we need additional patch/patches from master?

Steve

On Thu, May 27, 2021 at 7:16 AM Alejandro Hernandez Samaniego
<a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>

gcc needs -mmusl option to be passed in SDK since we ship crossdk compiler
configured for glibc by default, this helps in creating correct
compiler defaults for musl based SDK compilers

[YOCTO #13459]

(From OE-Core rev: e6fbac7aeabe00d8fb734992012dd629a8527b25)

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Cc: Leon Woestenberg <a class="moz-txt-link-rfc2396E" href="mailto:leon@sidebranch.com">&lt;leon@sidebranch.com&gt;</a>
Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 .../gcc/gcc-cross-canadian.inc                | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 553ef7fe62..c5935b978d 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -139,6 +139,29 @@ do_install () {
        chown -R root:root ${D}

        cross_canadian_bindirlinks
+
+       for i in linux ${CANADIANEXTRAOS}
+       do
+               for v in ${CANADIANEXTRAVENDOR}
+               do
+                       d=${D}${bindir}/../${TARGET_ARCH}$v-$i
+                       install -d $d
+                       for j in ${TARGET_PREFIX}gcc${EXEEXT} ${TARGET_PREFIX}g++${EXEEXT}
+                       do
+                               p=${TARGET_ARCH}$v-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
+                               case $i in
+                               *musl*)
+                                       rm -rf $d/$p
+                                       echo "#!/usr/bin/env sh" &gt; $d/$p
+                                       echo "exec \`dirname \$0\`/../${TARGET_SYS}/$j -mmusl \$@" &gt;&gt; $d/$p
+                                       chmod 0755 $d/$p
+                                       ;;
+                               *)
+                                       ;;
+                               esac
+                       done
+               done
+       done
 }

 ELFUTILS = "nativesdk-elfutils"
--
2.25.1




</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------4B217B203EAC5BF49213A1D8--
