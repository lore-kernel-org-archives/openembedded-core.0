Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TiFLl-00010l-Fa
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 03:13:37 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Dec 2012 17:58:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,255,1355126400"; d="scan'208";a="255515914"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.85])
	by orsmga002.jf.intel.com with ESMTP; 10 Dec 2012 17:59:04 -0800
Message-ID: <50C69367.7000801@linux.intel.com>
Date: Mon, 10 Dec 2012 17:59:03 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
References: <cover.1354531187.git.Qi.Chen@windriver.com>
	<4973f2f88641f8a8c02b0062b31f159977d9ba0a.1354531187.git.Qi.Chen@windriver.com>
	<50C6126F.3020401@linux.intel.com>
	<50C657CD.2040103@linux.intel.com>
	<CALbNGRT1RmSpKaH9ZJf+aaDoNddqgQckUR2BK8sYCc3em4b-8A@mail.gmail.com>
In-Reply-To: <CALbNGRT1RmSpKaH9ZJf+aaDoNddqgQckUR2BK8sYCc3em4b-8A@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Dec 2012 02:13:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2012 05:07 PM, Andreas Müller wrote:
> On Mon, Dec 10, 2012 at 10:44 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 12/10/2012 08:48 AM, Saul Wold wrote:
>>>
>>> On 12/04/2012 12:46 AM, Qi.Chen@windriver.com wrote:
>>>>
<SNIP>
>>>>               "
>>>>    SRC_URI = "${BASE_SRC_URI} \
>>>>               file://noldlibpath.patch \
>>>> @@ -28,6 +29,12 @@ inherit autotools pkgconfig binconfig
>>>>    do_configure() {
>>>>        libtoolize --force
>>>>        gnu-configize --force
>>>> +    if [ "${PN}" != "icu-native" ]; then
>>>> +        OLD=`pwd`
>>>> +        cd ${S}
>>>> +        autoconf
>>>> +        cd ${OLD}
>>>> +    fi
>>
>>
>> I had some time this morning to investigate this more deeply.  What I found
>> was that the ICU tarball was being delivered with a "configure" and that the
>> do_configure was avoiding the "autoconf" conversion of configure.in ->
>> configure.  I am not sure if this is historical or if this is truly needed.
>>
>> So by doing the autoconf above you changed the "configure" script, this in
>> turn caused some configuration changes to occur in the platform.h file.  Why
>> these changed (particularly the U_HAVE_NAMESPACE define) then caused the ICU
>> libraries to be built with different namespace.
>>
>> So a couple of key questions that need to be resolved:
>> 1) Will updating to 4.6 solve this issue, if not then we need to dive into 2
>> + 3 Below:
>>
>> 2) Why does icu tarball have a generated configure?
>>
>> 3) Why does the autoconf generated configure fail to configure things
>> correctly?
>>
>> Sau!
>>
> Also got this error but reported it to the wrong mailing list - sorry.
> I also looked around for this. The patch added pkg-config to icu. Just
> a guess: webkit-gtk fails due to a mixture of renamed symbols
> (EventListener_3_6 - see sysroot/usr/include/unicode/urename.h) and
> unrenamed symbols. Before the icu-patch this did not happen because
> (icu's) urename.h was not included and no symbols were renamed or
> renamed differently. My problem: The error gives me information about
> renamed symbol but I did not yet find the time to search for
> unrenamed. As I said: Just a guess
>
I am not sure that's it, the renaming is actually in the NAMESPACE, the 
older (no pkg-config) sets HAVE_NAMESPACE in the platform.h file and 
then the symbols have icu_2_6 in them, that's the real issue, which is 
caused by running autoconf and getting a bad/wrong "configure" script vs 
the one suplied in the tarball.

Sau!

> Andreas
>
>


