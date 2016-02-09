Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B63B731A7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 00:01:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1901Jw3023697
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Feb 2016 16:01:19 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Feb 2016 16:01:18 -0800
To: Andre McCurdy <armccurdy@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <CAJ86T=UvphArYq85qN1yNsCeCtbr_AaapGoZmhprS7cCU3FM0Q@mail.gmail.com>
	<CAMKF1sqdRHprniyiaiUNrghVwZ4tY=hn7gEHwf1g2fxi3SWEtA@mail.gmail.com>
	<CAJ86T=UjJMJ_44ws-Esuak2nGC8ML-_-=vPAGHXJS0=0rU0fEQ@mail.gmail.com>
	<CAJTo0LayxZ-T_cw0H5ndoxHkUHXwcqRdfu7oYjUevX+QzR4CTw@mail.gmail.com>
	<CAJ86T=VqhcakK1zhS2CdaD0-ZwdeBufLH1b06DZqrOraLiZFkw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56B92C4D.2070507@windriver.com>
Date: Mon, 8 Feb 2016 18:01:17 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VqhcakK1zhS2CdaD0-ZwdeBufLH1b06DZqrOraLiZFkw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: TARGET_CFLAGS for non-target builds
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
X-List-Received-Date: Tue, 09 Feb 2016 00:01:21 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 2/8/16 5:43 PM, Andre McCurdy wrote:
> On Mon, Feb 8, 2016 at 3:00 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 8 February 2016 at 20:03, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> Can you give an example? Looking at native.bbclass it seems to replace
>>> TARGET_CFLAGS with BUILD_CFLAGS, not manipulate it.
>>
>> Sure, so in doing a native build TARGET_CFLAGS is used.  But as
>> security_flags.inc was using TARGET_CFLAGS_append, the end result was
>> BUILD_CFLAGS appended with the security flags.
> 
> Yes, for native, TARGET_CFLAGS will end up being "${BUILD_CFLAGS}
> ${SECURITY_CFLAGS}".
> 
> However it shouldn't matter - native.bbclass sets CFLAGS to
> BUILD_CFLAGS, not TARGET_CFLAGS.
> 
> Do you have an example where host gcc can legitimately be invoked with
> TARGET_CFLAGS?

You have to remember the order of the operators.  _append says to make the
append, AFTER everything else has been evaluated (and before _remove).  This
includes override behaviors.

So if you do:

TARGET_CFLAGS = "-deadbeef"
BUILD_CFLAGS = "-badc0ffee"
TARGET_CFLAGS_append = " -foobar"
TARGET_CFLAGS = "${BUILD_CFLAGS}"

The final value of TARGET_CFLAGS is "-badc0ffee -foobar"

Thus by changing the append to:

TARGET_CFLAGS_append_class-target = " -foobar"
TARGET_CFLAGS_class-native = "${BUILD_CFLAGS}"

In the case where the 'class-target' is the override you will get:

TARGET_CFLAGS = "-deadbeef -foobar"

In the case where the 'class-native' is the override you will get:

TARGET_CFLAGS = "-badc0ffee"

--Mark

