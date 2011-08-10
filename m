Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Qr907-0001zY-7f
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 15:39:16 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 038E11660442; Wed, 10 Aug 2011 07:34:42 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id BDB271660401;
	Wed, 10 Aug 2011 07:34:40 -0600 (MDT)
Message-ID: <4E4288F0.2010904@mlbassoc.com>
Date: Wed, 10 Aug 2011 07:34:40 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312912632.14274.312.camel@rex>	<C10D3FB0CD45994C8A51FEC1227CE22F2FA76750B1@shsmsx502.ccr.corp.intel.com>	<27DA7A3C-0FE9-43CA-963C-F6217A1D2C9F@kernel.crashing.org>	<1312981676.14274.376.camel@rex>
	<1312982631.14274.379.camel@rex>
In-Reply-To: <1312982631.14274.379.camel@rex>
Subject: Re: populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Aug 2011 13:39:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-08-10 07:23, Richard Purdie wrote:
> On Wed, 2011-08-10 at 14:07 +0100, Richard Purdie wrote:
>> On Wed, 2011-08-10 at 07:59 -0500, Kumar Gala wrote:
>>> On Aug 9, 2011, at 11:00 PM, Lu, Lianhao wrote:
>>>
>>>> Richard Purdie wrote on 2011-08-10:
>>>>> If we don't do this, the SDK target sysroot is named generically even
>>>>> when it contains package architecture specific optimisations.
>>>>>
>>>>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>  ---
>>>>> diff --git a/meta/classes/populate_sdk.bbclass
>>>>> b/meta/classes/populate_sdk.bbclass index 0f3591b..8c19e83 100644 ---
>>>>> a/meta/classes/populate_sdk.bbclass +++
>>>>> b/meta/classes/populate_sdk.bbclass @@ -5,7 +5,7 @@ SDK_DIR =
>>>>> "${WORKDIR}/sdk"
>>>>> SDK_OUTPUT = "${SDK_DIR}/image"
>>>>> SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
>>>>> -SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${TARGET_SYS}"
>>>>> +SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"
>>>>
>>>> In gcc-configure-sdk.inc, it is set "--with-sysroot=${SDKPATH}/sysroots/${TARGET_SYS}".
>>>> Is there any inconsistency?
>>>
>>> Binutils might also need updating.
>>
>> This is an interesting question. We certainly compile in a default path
>> for the sysroot but we in general always override it from the
>> environment anyway.
>>
>> As long as the package architectures for the sdk components are correct
>> we should be able to update the defaults. I've not yet checked that
>> though.
>
> This is something which gets built into
> gcc-cross-canadian-${TARGET_ARCH} (i.e i586/armpowerpc). Since we use
> the target libs (inc libgcc) and everything in that package is multiple
> platform enabled, I think the current behaviour is correct. It might
> point an an invalid default sysroot but its up to the package
> architecture specific environment files to correct that. This means the
> one toolchain can be shared over multiple package architectures.
>
> I'm open to other views of that but I think what we have there is
> correct and should work with the above change.

On a related thought to these changes - how does this play if
you use multiple SDKs for different, but somewhat related, architectures?
I'd like to create a simple SDK (just toolchain mostly) using 'meta-toolchain'
for both armv5te and armv7a and install them simultaneously on the same
host.  My previous attempts at this fell flat as there were a number of
files marked as "arm" (i.e. not armv5te or arvm7a) that were common between
the two SDK packages, but they didn't seem to be identical.

With these changes, will it be possible to support such sets of multiple
toolchains?  (No, ADT is not the answer - I just want the toolchains)

Thanks

(sorry if this seems I hijacked your thread - my question is related to
what you are discussing here)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


