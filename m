Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA7C7DE8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 19:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version;
	bh=M4l+cmX4gz1u3CQ7RInTBiNVxvdQaWdhzyi4M8DO9Io=; 
	b=ZEtxrLYmMRzVYPVXCX2oNz5iGVutlxxuHbHRrAoXMWtXU/TbtI7j7ifa8efJ5UgCxbb1Oc9Cke1IjslqecOVT63KUKVaHupyL+kKgkV1JzPJC2NrdmOL6TqID6nsMiD0EQsobOb4J8KNcguCZpt8pMi5c1ljcGbE3ealj9UJsoCKvIH+wVX0GLK5ozNKRe2r1EoZKuNU1xa0rw1HVL5r9oCSTbxCwvKgADOznJE+PXPmXDGEgaTDJllPKZRWxO+KbC46RuOoK+zwE9CF2uEDtORAQpc/Wa6cIMxGz2qgk3BH7XAL7vfVrHqwEs7t4NpDnU/gx6wZy81gLJHbZtFjbg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hVhzB-0006CY-FW; Tue, 28 May 2019 21:42:13 +0200
Received: from webmail.local.igalia.com ([192.168.10.121])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hVhz8-0004VD-Vt; Tue, 28 May 2019 21:42:13 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.local.igalia.com with esmtp (Exim 4.84_2)
	(envelope-from <philn@igalia.com>)
	id 1hVhz8-0000Eq-TS; Tue, 28 May 2019 21:42:10 +0200
MIME-Version: 1.0
Date: Tue, 28 May 2019 20:42:10 +0100
From: Philippe Normand <philn@igalia.com>
To: Andre McCurdy <armccurdy@gmail.com>
In-Reply-To: <CAJ86T=VEKBv21mMo9cxh-VG8OstFF5bwte_g41k2=RUNAcbnRA@mail.gmail.com>
References: <69e7b572a514abba106b28255461cf17720e68e1.camel@igalia.com>
	<CAJ86T=VEKBv21mMo9cxh-VG8OstFF5bwte_g41k2=RUNAcbnRA@mail.gmail.com>
Message-ID: <311ab3c4894c8397a5a0ffc4ca52cf6a@igalia.com>
X-Sender: philn@igalia.com
User-Agent: Roundcube Webmail/1.3.3
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Use compiler launcher variable when ccache is enabled
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
X-List-Received-Date: Tue, 28 May 2019 19:42:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-05-28 20:22, Andre McCurdy wrote:
> On Tue, May 28, 2019 at 12:13 PM Philippe Normand <philn@igalia.com> wrote:
>>
>> Setting the CMAKE_C{,XX}_COMPILER_LAUNCHER variables is the recomended way to
>> deal with ccache in CMake. It allows build scripts to optionally opt-out of
>> CMake, which is especially useful when the pre-processed GCC output is required.
> 
> Opt out of CMake? Or ccache ?
> 

The latter. Sorry about this typo, I'll send an amended patch :)

Philippe

>>
>> Signed-off-by: Philippe Normand <philn@igalia.com>
>> ---
>>  meta/classes/cmake.bbclass | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>> index d3f0d70847..a5cffedbc6 100644
>> --- a/meta/classes/cmake.bbclass
>> +++ b/meta/classes/cmake.bbclass
>> @@ -26,14 +26,16 @@ python() {
>>      if not d.getVar('OECMAKE_C_COMPILER'):
>>          cc_list = d.getVar('CC').split()
>>          if cc_list[0] == 'ccache':
>> -            d.setVar('OECMAKE_C_COMPILER', '%s %s' % (cc_list[0], cc_list[1]))
>> +            d.setVar('OECMAKE_C_COMPILER_LAUNCHER', cc_list[0])
>> +            d.setVar('OECMAKE_C_COMPILER', cc_list[1])
>>          else:
>>              d.setVar('OECMAKE_C_COMPILER', cc_list[0])
>>
>>      if not d.getVar('OECMAKE_CXX_COMPILER'):
>>          cxx_list = d.getVar('CXX').split()
>>          if cxx_list[0] == 'ccache':
>> -            d.setVar('OECMAKE_CXX_COMPILER', '%s %s' % (cxx_list[0], cxx_list[1]))
>> +            d.setVar('OECMAKE_CXX_COMPILER_LAUNCHER', cxx_list[0])
>> +            d.setVar('OECMAKE_CXX_COMPILER', cxx_list[1])
>>          else:
>>              d.setVar('OECMAKE_CXX_COMPILER', cxx_list[0])
>>  }
>> @@ -49,6 +51,9 @@ OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LD
>>  CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
>>  CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
>>
>> +OECMAKE_C_COMPILER_LAUNCHER ?= ""
>> +OECMAKE_CXX_COMPILER_LAUNCHER ?= ""
>> +
>>  OECMAKE_RPATH ?= ""
>>  OECMAKE_PERLNATIVE_DIR ??= ""
>>  OECMAKE_EXTRA_ROOT_PATH ?= ""
>> @@ -86,6 +91,8 @@ set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).
>>  set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
>>  set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
>>  set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
>> +set( CMAKE_C_COMPILER_LAUNCHER ${OECMAKE_C_COMPILER_LAUNCHER} )
>> +set( CMAKE_CXX_COMPILER_LAUNCHER ${OECMAKE_CXX_COMPILER_LAUNCHER} )
>>  set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
>>  set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
>>  set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
>> --
>> 2.20.1
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

