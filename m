Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1AA16AC36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 20:37:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t2UKbw41023538
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 13:37:58 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Mon, 30 Mar 2015 13:37:58 -0700
Message-ID: <5519B425.1040906@windriver.com>
Date: Mon, 30 Mar 2015 15:37:57 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <BN3PR0501MB1090B5CDC1B3FF89CCC4D286BBF50@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<1427747268.14020.326.camel@linuxfoundation.org>
In-Reply-To: <1427747268.14020.326.camel@linuxfoundation.org>
Subject: Re: Verification on how TARGET_CFLAGS is set
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
X-List-Received-Date: Mon, 30 Mar 2015 20:37:59 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/30/15 3:27 PM, Richard Purdie wrote:
> On Mon, 2015-03-30 at 13:09 +0000, Bryan Evenson wrote:
>> I am about to upgrade to the dizzy branch.  I have a built a bootable
>> image on my test build machine, and now I'm going to be applying
>> changes to the system I use for building production images.  I'm
>> planning on deleting my tmp directory to force a re-build of
>> everything.  Since I'm rebuilding everything anyway, I'm taking a
>> deeper look at the CFLAGS related settings and I'm getting a little
>> lost in the logic.  I'd like to verify these settings before I start
>> rebuilding everything.
>>
>> If I'm following the default logic correctly in bitbake.conf, by
>> default TARGET_CFLAGS will be set to "-O2 -pipe -g
>> -feliminate-unused-debug-types".  I want the default TARGET_CFLAGS for
>> my production image to be "-O2 -pipe".  What's the suggested variable
>> to change, and where, to get this final value?  Do I set TARGET_CFLAGS
>> directly, or do I set SELECTED_OPTIMIZATIONS or even
>> FULL_OPTIMIZATIONS?  Do I set it in local.conf or should I be setting
>> it somewhere else?
> 
> If I remember rightly, you need the -g option there to generate the -dbg
> packages correctly. The target system binaries won't change since we
> separate out the debug data into separate files as part of the packaging
> process.
> 
> You therefore can gain some build performance from turning that off but
> your runtime won't alter much (other than the debuglink ID which is a
> few bytes).

I strongly caution people against removing '-g' from their production builds.
If you do, you will no longer have any way to do any type of production/field
debug.  As Richard indicated the -g will cause the symbols and debug information
to get separated into special -dbg packages that you generally don't distribute
on a production device -- but those same -dbg package (preserved) can be later
used for debugging of production devices.

This is why the default is what it is.

The difference in executable size between -g (split debug) and w/o -g, is
usually around 15 - 30 bytes.  Roughly the length of the path to the executable
and/or library plus ".debug/" (7 characters)

--Mark

> Cheers,
> 
> Richard
> 


