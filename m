Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id A20157EEE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 04:55:54 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 0C6461C06DD;
	Thu, 11 Jul 2019 16:55:54 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: Mikko Rapeli <mikko.rapeli@bmw.de>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
	<1543494097-19534-4-git-send-email-mikko.rapeli@bmw.de>
	<bb5aeb0e-14b2-4304-3c95-e546159792ed@taitradio.com>
Message-ID: <76c0a90d-9cf8-2968-e33d-46e3bdf6ff4b@taitradio.com>
Date: Thu, 11 Jul 2019 16:55:53 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <bb5aeb0e-14b2-4304-3c95-e546159792ed@taitradio.com>
Subject: Re: [PATCH 3/5] cmake.bbclass: append includedir to implicit include dirs
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
X-List-Received-Date: Thu, 11 Jul 2019 04:55:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

An error in my analysis below: We *do* delete the dependency files in=20
the in-tree build case as well. The side-effect is masked in both=20
in-tree and out-of-tree build cases except here at Tait, where we don't=20
delete the entire build at configure time, due to a 20min+ rebuild time,=20
even with the benefit of icecc.

The rest of my concern still applies: This setting has no effect in the=20
target case, and only an unfortunate side effect in the -native case.=20
I'm not clear what the benefit is.


On 11/07/19 2:51 PM, Douglas Royds wrote:

> This commit is having an unintended side-effect in the -native (and=20
> probably nativesdk) case.
>
> In the target build, $includedir is normally /usr/include,=20
> fully-qualified. This path is already in CMake's list of implicit=20
> include directories, and we don't include any header files from the=20
> build PC's /usr/include in a target build in any case. This addition=20
> to CMAKE_C/CXX_IMPLICIT_INCLUDE_DIRECTORIES has no effect.
>
> In the -native case, the $includedir is set to STAGING_INCDIR_NATIVE,=20
> but this path has already been added to the BUILD_CPPFLAGS as a system=20
> include directory, so there will already be no warnings for any header=20
> file in the STAGING_INCDIR_NATIVE.
>
> There is a nasty side-effect in the -native case: CMake excludes=20
> headers in the CMAKE_C/CXX_IMPLICIT_INCLUDE_DIRECTORIES from its=20
> generated dependency files, meaning that a change in any library=20
> header file will not trigger a recompile of affected source files in=20
> the dependent CMake component. In out-of-tree builds this isn't a=20
> problem, as cmake.bbclass deletes the *entire* ${B} directory at=20
> configure time, but where this is not the case, the build breaks with=20
> any change in library headers.
>
> I haven't examined the nativesdk case. The $includedir is set off to=20
> $SDKPATHNATIVE/usr/include, but this path is not added as a system=20
> include dir. The same problem will apply as in the -native case, that=20
> CMake will not generate dependencies for headers staged in the=20
> SDKPATHNATIVE.
>
> Was nativesdk perhaps the intended case for this commit? Is there a=20
> better way to silence warnings in this case? Do we need to silence=20
> library header warnings at all? Should we instead add=20
> $SDKPATHNATIVE/usr/include as a system include dir via the=20
> BUILDSDK_CPPFLAGS?
>
> I examined this problem using the Unix Makefiles generator. CMake=20
> appears to equally exclude these headers from the ninja *.o.d=20
> dependency files, though I haven't examined it closely.
>
>
> On 30/11/18 1:21 AM, Mikko Rapeli wrote:
>
>> From: Michael Ho <Michael.Ho@bmw.de>
>>
>> This resolves issues with paths being marked as system includes that
>> differ from /usr/include but are considered implicit by the toolchain.
>> This enables developers to add directories to system includes
>> to supress compiler compiler warnings from them.
>>
>> Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
>> Cc: Pascal Bach <pascal.bach@siemens.com>
>> ---
>> =C2=A0 meta/classes/cmake.bbclass | 4 ++++
>> =C2=A0 1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>> index fd40a98..485aea6 100644
>> --- a/meta/classes/cmake.bbclass
>> +++ b/meta/classes/cmake.bbclass
>> @@ -108,6 +108,10 @@ list(APPEND CMAKE_MODULE_PATH=20
>> "${STAGING_DATADIR}/cmake/Modules/")
>> =C2=A0 # add for non /usr/lib libdir, e.g. /usr/lib64
>> =C2=A0 set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
>> =C2=A0 +# add include dir to implicit includes in case it differs from=
=20
>> /usr/include
>> +list(APPEND CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES ${includedir})
>> +list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${includedir})
>> +
>> =C2=A0 EOF
>> =C2=A0 }
>
>


