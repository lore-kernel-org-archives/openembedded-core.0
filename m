Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9926041D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 23:17:10 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so2080836pab.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 16:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:from:mime-version:in-reply-to:date:message-id:subject:to
	:cc:content-type;
	bh=FEvy7ckG4hjSaCYiOoEF+RgA8+569mehAbN7uGcOyvg=;
	b=WZIZ0pygau0mw1SxCLzzrcoHc1vguXGLIwO2DmbRmfG0JuKystTYPNqEzTeVHI5C37
	9sntzzYnYGnIDwqyViePpxEhX7/5OhW1wr1QgOCrVsKwujDFHp/P+Q9meeANiJAeFl96
	IyxaI1fRfpu2iLzBfACnCWjmKdLCUVceSj9lV80V/JUfwiEDkrmrjFSB4W2DfbwSJ35c
	d5XnjUqM8gnd8htDnj8qM2Xc0ld/z3ki0d73VhzmrxiNupY8PiMqkqHU2UGeaRWBm5Fb
	gMVEIjKVyvOnf2uCWP1qbgDeNA8beBcuGzOIfURqTEG92pBuzmsGgGyqaVnm5lPMoiBe
	VCTA==
X-Received: by 10.66.172.172 with SMTP id bd12mr40560320pac.139.1370560631245; 
	Thu, 06 Jun 2013 16:17:11 -0700 (PDT)
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
	<2054363.UxqkIOrzAJ@helios> <51AF6ED5.4010500@linux.intel.com>
	<14899581.O0scG6jzAS@helios>
	<CAGrhNMzSY-ow4PNzscD31qSW8st1tv9Fjmc9Xxx_Oqa2CjsuJA@mail.gmail.com>
	<51B0EBE2.3020909@linux.intel.com>
From: Jonathan Liu <net147@gmail.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <51B0EBE2.3020909@linux.intel.com>
Date: Fri, 7 Jun 2013 09:17:09 +1000
Message-ID: <3011112518438126591@unknownmsgid>
To: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Thu, 06 Jun 2013 23:17:11 -0000
Content-Type: text/plain; charset=UTF-8

On 07/06/2013, at 6:07 AM, Saul Wold <sgw@linux.intel.com> wrote:

> On 06/06/2013 12:18 PM, Felipe Tonello wrote:
>> On Thu, Jun 6, 2013 at 2:54 AM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>>> On Wednesday 05 June 2013 10:01:09 Saul Wold wrote:
>>>> On 06/05/2013 09:57 AM, Paul Eggleton wrote:
>>>>> On Wednesday 05 June 2013 09:46:49 Saul Wold wrote:
>>>>>> On 06/05/2013 02:30 AM, Martin Jansa wrote:
>>>>>>> On Wed, Jun 05, 2013 at 07:01:50PM +1000, Jonathan Liu wrote:
>>>>>>>> qconfig.pri was not being loaded by qmake properly. This means Qt
>>>>>>>> qmake projects are unable to query QT_ARCH, QT_VERSION and other
>>>>>>>> variables defined in qconfig.pri.
>>>>>>>>
>>>>>>>> Export OE_QMAKE_QT_CONFIG, setting it to the location of qconfig.pri
>>>>>>>> so that it can be located by qmake.
>>>>>>>
>>>>>>> There is such patch already:
>>>>>>> http://lists.openembedded.org/pipermail/openembedded-core/2013-May/07831
>>>>>>> 4.
>>>>>>> html
>>>>>>
>>>>>> Got lost in my queue, adding it for the next MUT.
>>>>>
>>>>> FWIW I am still concerned by the assertion in the commit message about it
>>>>> causing undesirable behaviour. I'd want that checked out and the note
>>>>> removed before we look at merging this.
>>>>
>>>> OK, I will shelf this until I hear more about the testing of this change
>>>> regarding the original patch's note.
>>>
>>> So I tested a rebuild of qt4-x11-free with Felipe's patch and two of
>>> Jonathan's ("qt4: fix QMAKE_QT_CONFIG being overwritten with empty value" and
>>> "classes/qmake_base: allow parallel make"), and did not observe any unexpected
>>> behaviour and buildhistory looks clean for qt itself and fotowall/quicky. So
>>> I'd say feel free to throw these into MUT, but I think we need to drop the
>>> note.
>>
>> Awesome.
>
> So can someone put a final updated patch series together.  I am still not sure about Jonathans's allow parallel make change, it seemed to have the -j option since it's added with a _prepend which is not overriden by the = assignment.
>
> Sau!

It has make -j 16 MAKEFLAGS=.
-j 16 adds to MAKEFLAGS, and MAKEFLAGS= clears it. It is trivial to
check this is the case and I have verified it both when building
fotowall and independently on command line for building Qt projects
outside of Yocto.

Regards,
Jonathan

>
>>
>> Thank you,
>> Felipe
>>
>>

