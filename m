Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 431306E3BB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 09:58:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s259wm6Z016692
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Mar 2014 01:58:49 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 5 Mar 2014 01:58:48 -0800
Message-ID: <5316F554.1030201@windriver.com>
Date: Wed, 5 Mar 2014 17:58:44 +0800
From: Lu Chong <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1394010463.git.Chong.Lu@windriver.com>	
	<c00e7a2047ec6a4b4f46722f49176b08ded90509.1394010463.git.Chong.Lu@windriver.com>
	<1394011283.31845.97.camel@ted>
In-Reply-To: <1394011283.31845.97.camel@ted>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] flex: not to build shared libraries
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
X-List-Received-Date: Wed, 05 Mar 2014 09:58:50 -0000
Content-Type: multipart/alternative;
	boundary="------------010708040505070205080503"

--------------010708040505070205080503
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 03/05/2014 05:21 PM, Richard Purdie wrote:
> On Wed, 2014-03-05 at 17:18 +0800, Chong Lu wrote:
>> Some packages do not link successfully using shared libraries.
>> When link something to libfl.so, we will get this:
>>
>> 	libfl.so: undefined reference to `yylex'
>>
>> So we only build static libraries to fix this issue.
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   .../files/flex-not-to-build-shared-libraries.patch | 39 ++++++++++++++++++++++
>>   meta/recipes-devtools/flex/flex.inc                |  1 +
>>   2 files changed, 40 insertions(+)
>>   create mode 100644 meta/recipes-devtools/flex/files/flex-not-to-build-shared-libraries.patch
> Why aren't the shared libraries working? Which packages show this
> problem? Is this not a problem in the recipes using the shared
> libraries?
>
> At the very least this patch needs more explanation but I don't like the
> idea.
>
> Cheers,
>
> Richard
>
>
>
In flex 2.5.38, libfl.so was built by libtool.

ipsec-tools shows this problem.
When link libipsec.so to libfl.so, it uses '-lfl' flag. It will link 
from libfl.so.
But libfl.so doesn't define yylex, we may get "libfl.so not found" 
through `ldd libipsec.so'.
If we only build static libraries, libipsec.so will not link to 
libfl.so. it will link to libfl.a.
Then libipsec.so uses yylex function by itself rather than libfl.so 
provided.

In Mageia distribution, revert building libraries with libtool.
http://www.rpmfind.net//linux/RPM/mageia/cauldron/x86_64/media/core/release/flex-2.5.38-1.mga5.x86_64.html
And in flex 2.5.37 version, it will only generate static libraries.
So in order to ignore blocking some packages(likes ipsec-tools), I have 
two ways to fix this issue.
1. revert building libraries with libtool.
2. modify libtool to make it only build static libraries.
I choose the second way. The same result to first.

Best Regards
Chong


--------------010708040505070205080503
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 03/05/2014 05:21 PM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote cite="mid:1394011283.31845.97.camel@ted" type="cite">
      <pre wrap="">On Wed, 2014-03-05 at 17:18 +0800, Chong Lu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Some packages do not link successfully using shared libraries.
When link something to libfl.so, we will get this:

	libfl.so: undefined reference to `yylex'

So we only build static libraries to fix this issue.

Signed-off-by: Chong Lu <a class="moz-txt-link-rfc2396E" href="mailto:Chong.Lu@windriver.com">&lt;Chong.Lu@windriver.com&gt;</a>
---
 .../files/flex-not-to-build-shared-libraries.patch | 39 ++++++++++++++++++++++
 meta/recipes-devtools/flex/flex.inc                |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/files/flex-not-to-build-shared-libraries.patch
</pre>
      </blockquote>
      <pre wrap="">
Why aren't the shared libraries working? Which packages show this
problem? Is this not a problem in the recipes using the shared
libraries?

At the very least this patch needs more explanation but I don't like the
idea.

Cheers,

Richard



</pre>
    </blockquote>
    In flex 2.5.38, libfl.so was built by libtool.<br>
    <br>
    ipsec-tools shows this problem.<br>
    When link libipsec.so to libfl.so, it uses '-lfl' flag. It will link
    from libfl.so.<br>
    But libfl.so doesn't define yylex, we may get "libfl.so not found"
    through `ldd libipsec.so'.<br>
    If we only build static libraries, libipsec.so will not link to
    libfl.so. it will link to libfl.a.<br>
    Then libipsec.so uses yylex function by itself rather than libfl.so
    provided.<br>
    <br>
    In Mageia distribution, revert building libraries with libtool.<br>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <a
href="http://www.rpmfind.net//linux/RPM/mageia/cauldron/x86_64/media/core/release/flex-2.5.38-1.mga5.x86_64.html">http://www.rpmfind.net//linux/RPM/mageia/cauldron/x86_64/media/core/release/flex-2.5.38-1.mga5.x86_64.html</a><br>
    And in flex 2.5.37 version, it will only generate static libraries.<br>
    So in order to ignore blocking some packages(likes ipsec-tools), I
    have two ways to fix this issue.<br>
    1. revert building libraries with libtool.<br>
    2. modify libtool to make it only build static libraries.<br>
    I choose the second way. The same result to first.<br>
    <br>
    Best Regards<br>
    Chong<br>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <blockquote cite="mid:1394011283.31845.97.camel@ted" type="cite">
      <pre wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------010708040505070205080503--
