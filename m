Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 73CA46EE3B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 12:29:06 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wo20so5406147obc.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 05:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gBZxznYavBeUSZg93JPXpnuUw6OmpAEBQceUWCAhOsc=;
	b=elnBtedxMTAkWVXd3x7yDtLeOSLJGE7ckqZYLFv6td5ayRA/8cigTOK3++P2JZ5GV6
	MrkwsTPPUIIEImnNUN3vCJ6KYyH7KseBed3WjKfv0kStG6e75rgquHPhWl8TOCaz5LM+
	BfyWKc1VDWL0DVk5nSkby8d/rG0H5a83uadjGaj9/M04lpC3Y+G7PhIVWOEBupl7Z97D
	sDqkT7XcSFt4VXCCU1VPBpIbW1FoyUAfbrID7Rv3C2OKZ/V9xxUf9qIUUFb//D1okxtu
	/j8ukPNF855VwJtENYW5OWmyHPjV0FYEtiPRYB5jdn6l4pXO4n+Xs+d6NV3IGHWiVKn0
	AYWw==
X-Received: by 10.60.54.138 with SMTP id j10mr2014284oep.51.1395059347794;
	Mon, 17 Mar 2014 05:29:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.116.194 with HTTP; Mon, 17 Mar 2014 05:28:47 -0700 (PDT)
In-Reply-To: <5326B28C.5000705@windriver.com>
References: <1394717224-15283-1-git-send-email-ricardo.ribalda@gmail.com>
	<1394717224-15283-2-git-send-email-ricardo.ribalda@gmail.com>
	<1395010872.3808.16.camel@ted>
	<CAPybu_1RgpyAU++8oiW4avYeyQzKOV6NV65OknFUooaeANdVEA@mail.gmail.com>
	<5326B28C.5000705@windriver.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 17 Mar 2014 13:28:47 +0100
Message-ID: <CAPybu_12YTAqvWrWHi+06CX3c05ST8UNgv3sdhgmhmK+pF_5BA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] package_deb: Use apt-ftparchive
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
X-List-Received-Date: Mon, 17 Mar 2014 12:29:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Robert.

I have just resend the patch. Is there any document describing this
conventions?


Thanks!

On Mon, Mar 17, 2014 at 9:30 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Hi Ricardo,
>
>
> On 03/17/2014 03:59 PM, Ricardo Ribalda Delgado wrote:
>>
>> Hello Richard.
>>
>> I have tested it with dora. I can rebase it.
>>
>
> If it is for dora, then the Subject should in include [dora]
>
>
>> Shall I rebase it over git://git.yoctoproject.org/poky or over
>> git://git.openembedded.org/openembedded-core
>>
>
> I think that openembedded-core is preferred.
>
> // Robert
>
>
>> Thanks!
>>
>> On Mon, Mar 17, 2014 at 12:01 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> On Thu, 2014-03-13 at 14:27 +0100, Ricardo Ribalda Delgado wrote:
>>>>
>>>> Use apt-ftparchive to create a Release file compatible with SecureApt.
>>>>
>>>> apt-ftparchive is not compatible with libpseudo. The calls to ftw()
>>>> returns the path in absolute format instead of relative. This produces
>>>> wrong Packages and Release files.
>>>>
>>>> ie:
>>>> MD5Sum:
>>>> d20227a958f6870137ce0e41b7b84307             1453
>>>>
>>>> /home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/all/Release
>>>>
>>>> This is why it is called with PSEUDO_UNLOAD.
>>>>
>>>> apt-ftparchive is also a more efficient replacement of
>>>> dpkg-scanpackages:
>>>>
>>>>
>>>> root@neopili:~/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/bobcat
>>>> _64# time PSEUDO_UNLOAD=1 apt-ftparchive packages . >/tmp/kkk
>>>> real 0m26.873s
>>>> user 0m20.968s
>>>> sys 0m1.212s
>>>>
>>>>
>>>> root@neopili:~/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/bobcat
>>>> _64# time PSEUDO_UNLOAD=1 dpkg-scanpackages . >/tmp/kkk
>>>> dpkg-scanpackages: info: Wrote 6022 entries to output Packages file.
>>>> real 0m59.721s
>>>> user 0m16.668s
>>>> sys 0m11.164s
>>>>
>>>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>>>> ---
>>>>   meta/classes/package_deb.bbclass | 4 +++-
>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>>
>>> This doesn't apply against master? What was this tested against?
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>
>>
>>
>



-- 
Ricardo Ribalda

