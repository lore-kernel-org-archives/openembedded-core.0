Return-Path: <moritz.blume@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3AD606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 14:47:19 +0000 (UTC)
Received: from exchange2010.bmw-carit.intra ([192.168.100.28]:12778
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Moritz.Blume@bmw-carit.de>)
	id 1Z5EcS-0000xa-1j; Wed, 17 Jun 2015 16:47:12 +0200
Received: from [192.168.101.32] (192.168.101.32) by
	Exchange2010.bmw-carit.intra (192.168.100.28) with Microsoft SMTP
	Server (TLS) id 14.1.218.12; Wed, 17 Jun 2015 16:47:11 +0200
X-CTCH-RefID: str=0001.0A0C0205.55818870.01F8, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
Message-ID: <55818872.5000102@bmw-carit.de>
Date: Wed, 17 Jun 2015 16:47:14 +0200
From: Moritz Blume <moritz.blume@bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
	<openembedded-core@lists.openembedded.org>
References: <1433921778-1835-1-git-send-email-moritz.blume@bmw-carit.de>
	<1433921778-1835-2-git-send-email-moritz.blume@bmw-carit.de>
	<5579DD2D.10104@herbrechtsmeier.net>
In-Reply-To: <5579DD2D.10104@herbrechtsmeier.net>
X-Originating-IP: [192.168.101.32]
Subject: Re: [PATCH v3 2/2] cmake: Upgrade 2.8.12.2 -> 3.2.2
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
X-List-Received-Date: Wed, 17 Jun 2015 14:47:20 -0000
Content-Type: multipart/alternative;
	boundary="------------090101090701040002040401"

--------------090101090701040002040401
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 11.06.2015 21:10, Stefan Herbrechtsmeier wrote:
> Am 10.06.2015 um 09:36 schrieb Moritz Blume:
>> Patches "qt4-fail-silent.patch" and "support-oe-qt4-tools-names.patch"
>> were adapted in order to fit to CMake 3.2.2 (refer to the commit
>> message in the respective patch for details).
>> Patch "cmake-2.8.11.2-FindFreetype.patch" was dropped since it was
>> rejected upstream and its functionality otherwise implemented in the
>> meantime.
>>
>> Note that CMake 3 needs to have the full compiler path in the toolchain
>> file (see cmake.bbclass).
> Why is the full path needed?

https://public.kitware.com/Bug/view.php?id=15251

"Having a full path to the compiler is a new requirement starting in 
CMake 3.0. The incompatibility was introduced across a major version 
number bump and is considered acceptable. The project will have to be 
fixed to use a full path."

Without a full path, you get the following error message:

CMake Error at CMakeLists.txt:5 (project):
| The CMAKE_C_COMPILER:
|
| gcc
|
| is not a full path and was not found in the PATH.
|
| Tell CMake where to find the compiler by setting either the environment
| variable "CC" or the CMake cache entry CMAKE_C_COMPILER to the full 
path to
| the compiler, or to the compiler name if it is in the PATH.

>
> Have you try to add STAGING_BINDIR_TOOLCHAIN to the CMAKE_FIND_ROOT_PATH?

I don't understand, is this related to the compiler path?

>
> <snip>
>
>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>> index 1ebb936..c97fd02 100644
>> --- a/meta/classes/cmake.bbclass
>> +++ b/meta/classes/cmake.bbclass
>> @@ -10,9 +10,11 @@ CCACHE = ""
>>   # We want the staging and installing functions from autotools
>>   inherit autotools
>>   -# C/C++ Compiler (without cpu arch/tune arguments)
>> -OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
>> -OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
>> +# Full path to C/C++ Compiler (without cpu arch/tune arguments)
>> +C_COMPILER = "$(echo ${CC} | sed 's/^\([^ ]*\).*/\1/')"
>> +CXX_COMPILER = "$(echo ${CXX} | sed 's/^\([^ ]*\).*/\1/')"
>> +OECMAKE_C_COMPILER ?= "$(which ${C_COMPILER})"
>> +OECMAKE_CXX_COMPILER ?= "$(which ${CXX_COMPILER})"
>>   OECMAKE_AR ?= "${AR}"
> Why you don't use the full path for AR?
>

It is not required to have a full path here...

-- 
BMW Car IT GmbH
Dr. Moritz Blume
Spezialist Entwicklung
Petuelring 116
80809 München

Tel.: ­+49 89 189311-25
Fax:  +49 89 189311-20
Mail: moritz.blume@bmw-carit.de
Web: http://www.bmw-carit.de

-------------------------------------------------------------
BMW Car IT GmbH
Geschäftsführer: Michael Würtenberger und Reinhard Stolle
Sitz und Registergericht: München HRB 134810
------------------------------------------------------------


--------------090101090701040002040401
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 11.06.2015 21:10, Stefan Herbrechtsmeier wrote:<br>
    <blockquote cite="mid:5579DD2D.10104@herbrechtsmeier.net"
      type="cite">Am 10.06.2015 um 09:36 schrieb Moritz Blume:
      <br>
      <blockquote type="cite">Patches "qt4-fail-silent.patch" and
        "support-oe-qt4-tools-names.patch"
        <br>
        were adapted in order to fit to CMake 3.2.2 (refer to the commit
        <br>
        message in the respective patch for details).
        <br>
        Patch "cmake-2.8.11.2-FindFreetype.patch" was dropped since it
        was
        <br>
        rejected upstream and its functionality otherwise implemented in
        the
        <br>
        meantime.
        <br>
        <br>
        Note that CMake 3 needs to have the full compiler path in the
        toolchain
        <br>
        file (see cmake.bbclass).
        <br>
      </blockquote>
      Why is the full path needed?
      <br>
    </blockquote>
    <br>
    <a class="moz-txt-link-freetext" href="https://public.kitware.com/Bug/view.php?id=15251">https://public.kitware.com/Bug/view.php?id=15251</a><br>
    <br>
    "Having a full path to the compiler is a new requirement starting in
    CMake 3.0. The incompatibility was introduced across a major version
    number bump and is considered acceptable. The project will have to
    be fixed to use a full path."<br>
    <br>
    Without a full path, you get the following error message:<br>
    <br>
    <font size="3">CMake Error at CMakeLists.txt:5 (project):<br>
      | The CMAKE_C_COMPILER:<br>
      | <br>
      | gcc<br>
      | <br>
      | is not a full path and was not found in the PATH.<br>
      | <br>
      | Tell CMake where to find the compiler by setting either the
      environment<br>
      | variable "CC" or the CMake cache entry CMAKE_C_COMPILER to the
      full path to<br>
      | the compiler, or to the compiler name if it is in the PATH.</font><br>
    <br>
    <blockquote cite="mid:5579DD2D.10104@herbrechtsmeier.net"
      type="cite">
      <br>
      Have you try to add STAGING_BINDIR_TOOLCHAIN to the
      CMAKE_FIND_ROOT_PATH?
      <br>
    </blockquote>
    <br>
    I don't understand, is this related to the compiler path?<br>
    <br>
    <blockquote cite="mid:5579DD2D.10104@herbrechtsmeier.net"
      type="cite">
      <br>
      &lt;snip&gt;
      <br>
      <br>
      <blockquote type="cite">diff --git a/meta/classes/cmake.bbclass
        b/meta/classes/cmake.bbclass
        <br>
        index 1ebb936..c97fd02 100644
        <br>
        --- a/meta/classes/cmake.bbclass
        <br>
        +++ b/meta/classes/cmake.bbclass
        <br>
        @@ -10,9 +10,11 @@ CCACHE = ""
        <br>
          # We want the staging and installing functions from autotools
        <br>
          inherit autotools
        <br>
          -# C/C++ Compiler (without cpu arch/tune arguments)
        <br>
        -OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
        <br>
        -OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^
        ]*\).*/\1/'`"
        <br>
        +# Full path to C/C++ Compiler (without cpu arch/tune arguments)
        <br>
        +C_COMPILER = "$(echo ${CC} | sed 's/^\([^ ]*\).*/\1/')"
        <br>
        +CXX_COMPILER = "$(echo ${CXX} | sed 's/^\([^ ]*\).*/\1/')"
        <br>
        +OECMAKE_C_COMPILER ?= "$(which ${C_COMPILER})"
        <br>
        +OECMAKE_CXX_COMPILER ?= "$(which ${CXX_COMPILER})"
        <br>
          OECMAKE_AR ?= "${AR}"
        <br>
      </blockquote>
      Why you don't use the full path for AR?
      <br>
      <br>
    </blockquote>
    <br>
    It is not required to have a full path here...<br>
    <pre class="moz-signature" cols="72">-- 
BMW Car IT GmbH
Dr. Moritz Blume
Spezialist Entwicklung
Petuelring 116
80809 München

Tel.: ­+49 89 189311-25
Fax:  +49 89 189311-20
Mail: <a class="moz-txt-link-abbreviated" href="mailto:moritz.blume@bmw-carit.de">moritz.blume@bmw-carit.de</a>
Web: <a class="moz-txt-link-freetext" href="http://www.bmw-carit.de">http://www.bmw-carit.de</a>

-------------------------------------------------------------
BMW Car IT GmbH
Geschäftsführer: Michael Würtenberger und Reinhard Stolle
Sitz und Registergericht: München HRB 134810
------------------------------------------------------------
</pre>
  </body>
</html>

--------------090101090701040002040401--
