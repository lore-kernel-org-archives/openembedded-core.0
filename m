Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id D8EC1601A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 13:55:57 +0000 (UTC)
Received: (qmail 19727 invoked by uid 1003); 19 Sep 2014 13:55:58 -0000
Received: from unknown (HELO ?192.168.10.66?) (philip@opensdr.com@50.195.70.9)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	19 Sep 2014 13:55:58 -0000
Message-ID: <541C35ED.9040503@balister.org>
Date: Fri, 19 Sep 2014 09:55:57 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1410964399-31077-1-git-send-email-philip@balister.org>
	<CAMKF1spggZ4tP2A6oOq_-mw9bPhrdYj9dWR9n5dr-5YNFyP_EQ@mail.gmail.com>
In-Reply-To: <CAMKF1spggZ4tP2A6oOq_-mw9bPhrdYj9dWR9n5dr-5YNFyP_EQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass : Add support for cmake projects that use .S files.
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
X-List-Received-Date: Fri, 19 Sep 2014 13:56:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/17/2014 07:07 PM, Khem Raj wrote:
> On Wed, Sep 17, 2014 at 7:33 AM, Philip Balister <philip@balister.org> wrote:
>> UHD and GNU radio use the cmake build system. The toolchain file made
>> from cmake.bbclass does not set the variable needs by cmake projects
>> that use .S files. UHD added some .S files and these changes are required
>> to build recent UHD.
>>
> 
> I dont know if this is right thing to do in a generic bbclass. Since
> some packages might use bare assembler to compiler assembly files

If a cmake project enables assembler and doesn't set the CMAKE_ASM_*
flags to some sane defaults, the build fails. Settings these vars in the
toolchain files fixes the problem.

I am not a cmake guru, but it seems like we should be able to build code
that builds OK natively.

Philip

> 
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  meta/classes/cmake.bbclass | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>> index ab2adec..bfa5995 100644
>> --- a/meta/classes/cmake.bbclass
>> +++ b/meta/classes/cmake.bbclass
>> @@ -34,10 +34,13 @@ set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).
>>  set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )
>>  set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
>>  set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
>> +set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
>>  set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
>>  set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
>> +set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
>>  set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "CFLAGS for release" )
>>  set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLAGS for release" )
>> +set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "ASM FLAGS for release" )
>>  set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>>  set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>>
>> --
>> 1.8.3.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

