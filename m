Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TiiDT-00018a-Qy
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 10:03:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBC8mOpe022441
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Dec 2012 00:48:24 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 12 Dec 2012 00:48:24 -0800
Message-ID: <50C844E0.2080904@windriver.com>
Date: Wed, 12 Dec 2012 16:48:32 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1354531187.git.Qi.Chen@windriver.com>
	<4973f2f88641f8a8c02b0062b31f159977d9ba0a.1354531187.git.Qi.Chen@windriver.com>
	<50C6126F.3020401@linux.intel.com>
	<50C657CD.2040103@linux.intel.com>
	<CALbNGRT1RmSpKaH9ZJf+aaDoNddqgQckUR2BK8sYCc3em4b-8A@mail.gmail.com>
	<50C69367.7000801@linux.intel.com>
In-Reply-To: <50C69367.7000801@linux.intel.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] ICU: add pkgconfig support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 09:03:18 -0000
X-Groupsio-MsgNum: 32543
Content-Type: multipart/mixed; boundary="------------050702000107040209080803"

--------------050702000107040209080803
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id qBC8mOpe022441

On 12/11/2012 09:59 AM, Saul Wold wrote:
> On 12/10/2012 05:07 PM, Andreas M=C3=BCller wrote:
>> On Mon, Dec 10, 2012 at 10:44 PM, Saul Wold <sgw@linux.intel.com> wrot=
e:
>>> On 12/10/2012 08:48 AM, Saul Wold wrote:
>>>>
>>>> On 12/04/2012 12:46 AM, Qi.Chen@windriver.com wrote:
>>>>>
> <SNIP>
>>>>>               "
>>>>>    SRC_URI =3D "${BASE_SRC_URI} \
>>>>>               file://noldlibpath.patch \
>>>>> @@ -28,6 +29,12 @@ inherit autotools pkgconfig binconfig
>>>>>    do_configure() {
>>>>>        libtoolize --force
>>>>>        gnu-configize --force
>>>>> +    if [ "${PN}" !=3D "icu-native" ]; then
>>>>> +        OLD=3D`pwd`
>>>>> +        cd ${S}
>>>>> +        autoconf
>>>>> +        cd ${OLD}
>>>>> +    fi
>>>
>>>
>>> I had some time this morning to investigate this more deeply.  What=20
>>> I found
>>> was that the ICU tarball was being delivered with a "configure" and=20
>>> that the
>>> do_configure was avoiding the "autoconf" conversion of configure.in -=
>
>>> configure.  I am not sure if this is historical or if this is truly=20
>>> needed.
>>>
>>> So by doing the autoconf above you changed the "configure" script,=20
>>> this in
>>> turn caused some configuration changes to occur in the platform.h=20
>>> file.  Why
>>> these changed (particularly the U_HAVE_NAMESPACE define) then caused=20
>>> the ICU
>>> libraries to be built with different namespace.
>>>
>>> So a couple of key questions that need to be resolved:
>>> 1) Will updating to 4.6 solve this issue, if not then we need to=20
>>> dive into 2
>>> + 3 Below:
>>>
>>> 2) Why does icu tarball have a generated configure?
>>>
>>> 3) Why does the autoconf generated configure fail to configure things
>>> correctly?
>>>
>>> Sau!
>>>
>> Also got this error but reported it to the wrong mailing list - sorry.
>> I also looked around for this. The patch added pkg-config to icu. Just
>> a guess: webkit-gtk fails due to a mixture of renamed symbols
>> (EventListener_3_6 - see sysroot/usr/include/unicode/urename.h) and
>> unrenamed symbols. Before the icu-patch this did not happen because
>> (icu's) urename.h was not included and no symbols were renamed or
>> renamed differently. My problem: The error gives me information about
>> renamed symbol but I did not yet find the time to search for
>> unrenamed. As I said: Just a guess
>>
> I am not sure that's it, the renaming is actually in the NAMESPACE,=20
> the older (no pkg-config) sets HAVE_NAMESPACE in the platform.h file=20
> and then the symbols have icu_2_6 in them, that's the real issue,=20
> which is caused by running autoconf and getting a bad/wrong=20
> "configure" script vs the one suplied in the tarball.
>
> Sau!
>
>> Andreas
>>
>>
>
Hi Saul,

The errors are:
configure.in:219: error: possibly undefined macro: AC_CHECK_STRICT_COMPIL=
E
       If this token and others are legitimate, please use m4_pattern_all=
ow.
       See the Autoconf documentation.
configure.in:222: error: possibly undefined macro: AC_CHECK_64BIT_LIBS
configure.in:492: error: possibly undefined macro: AC_SEARCH_LIBS_FIRST

The recipe's in attachment.

I first tried it on my own computer without yocto, everything's OK. The=20
autoconf-generated configure is the same with the shipped one. So I=20
figured maybe we don't need to override the do_configure and do_compile=20
method here.



--------------050702000107040209080803
Content-Type: text/plain; charset="UTF-8"; name="icu_50.bb"
Content-Disposition: attachment; filename="icu_50.bb"
Content-Transfer-Encoding: base64

cmVxdWlyZSBpY3UtNTAuaW5jCgpQUiA9ICJyMSIKClNSQ19VUklbbWQ1c3VtXSA9ICJjZjdiZjll
NTZhYTZjMjA1N2E4YjZmNDY0MDQ2NDgzZSIKU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4NTkyYjNj
MDdkOWI4NjEwMGY0MWQwMTcyZWIxYTgxZjNmZmIyYThmZWYxMTA0ZDczOTUwOTkwNzliYTczNTAi

--------------050702000107040209080803
Content-Type: text/plain; charset="UTF-8"; name="icu-50.inc"
Content-Disposition: attachment; filename="icu-50.inc"
Content-Transfer-Encoding: base64

U1VNTUFSWSA9ICJJbnRlcm5hdGlvbmFsIENvbXBvbmVudCBmb3IgVW5pY29kZSBsaWJyYXJpZXMi
CkRFU0NSSVBUSU9OID0gIlRoZSBJbnRlcm5hdGlvbmFsIENvbXBvbmVudCBmb3IgVW5pY29kZSAo
SUNVKSBpcyBhIG1hdHVyZSwgcG9ydGFibGUgc2V0IG9mIEMvQysrIGFuZCBKYXZhIGxpYnJhcmll
cyBmb3IgVW5pY29kZSBzdXBwb3J0LCBzb2Z0d2FyZSBpbnRlcm5hdGlvbmFsaXphdGlvbiAoSTE4
TikgYW5kIGdsb2JhbGl6YXRpb24gKEcxMU4pLCBnaXZpbmcgYXBwbGljYXRpb25zIHRoZSBzYW1l
IHJlc3VsdHMgb24gYWxsIHBsYXRmb3Jtcy4iCkhPTUVQQUdFID0gImh0dHA6Ly9zaXRlLmljdS1w
cm9qZWN0Lm9yZy8iCgpCQVNFX1NSQ19VUkkgPSAiaHR0cDovL2Rvd25sb2FkLmljdS1wcm9qZWN0
Lm9yZy9maWxlcy9pY3U0Yy81MC4xL2ljdTRjLTUwXzEtc3JjLnRneiIKClNSQ19VUkkgPSAiJHtC
QVNFX1NSQ19VUkl9IgoKU1JDX1VSSV9jbGFzcy1uYXRpdmUgPSAiJHtCQVNFX1NSQ19VUkl9IgoK
TElDRU5TRSA9ICJJQ1UiCkxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovLy4uL2xpY2Vuc2UuaHRt
bDttZDU9NWM5NDc2N2NlZGI1ZDY5ODdjOTAyYWM4NTBkZWQyYzYiCkRFUEVORFMgPSAiaWN1LW5h
dGl2ZSIKREVQRU5EU19jbGFzcy1uYXRpdmUgPSAiIgoKUyA9ICIke1dPUktESVJ9L2ljdS9zb3Vy
Y2UiCgpQQVJBTExFTF9NQUtFID0gIiIKRlVMTF9PUFRJTUlaQVRJT05fYXJtID0gIi1PcyIKCmlu
aGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBiaW5jb25maWcKClBBQ0tBR0VTID0rICJsaWJpY3Vk
YXRhIGxpYmljdXVjIGxpYmljdWkxOG4gbGliaWN1bGUgbGliaWN1bHggbGliaWN1dHUgbGliaWN1
aW8iCgpGSUxFU18ke1BOfS1kZXYgKz0gIiR7bGliZGlyfS8ke0JQTn0vIgoKRklMRVNfbGliaWN1
ZGF0YSA9ICIke2xpYmRpcn0vbGliaWN1ZGF0YS5zby4qIgpGSUxFU19saWJpY3V1YyA9ICIke2xp
YmRpcn0vbGliaWN1dWMuc28uKiIKRklMRVNfbGliaWN1aTE4biA9ICIke2xpYmRpcn0vbGliaWN1
aTE4bi5zby4qIgpGSUxFU19saWJpY3VsZSA9ICIke2xpYmRpcn0vbGliaWN1bGUuc28uKiIKRklM
RVNfbGliaWN1bHggPSAiJHtsaWJkaXJ9L2xpYmljdWx4LnNvLioiCkZJTEVTX2xpYmljdXR1ID0g
IiR7bGliZGlyfS9saWJpY3V0dS5zby4qIgpGSUxFU19saWJpY3VpbyA9ICIke2xpYmRpcn0vbGli
aWN1aW8uc28uKiIKCkJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIgo=

--------------050702000107040209080803--
