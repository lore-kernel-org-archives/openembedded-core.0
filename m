Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8E86E660
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:11:52 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 4138068A01C; Fri, 12 Feb 2016 11:11:53 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id A0B7E68A019;
	Fri, 12 Feb 2016 11:11:52 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 62B4D67400F0;
	Fri, 12 Feb 2016 12:11:52 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <1455249507-30989-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0LaveuPmPrhLf9bc4H0PkyEz-cVGfiH+fjxqk=ynxJkhew@mail.gmail.com>
	<56BDBC07.3060907@mlbassoc.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56BDBDF8.8020605@mlbassoc.com>
Date: Fri, 12 Feb 2016 12:11:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56BDBC07.3060907@mlbassoc.com>
Subject: Re: [PATCH] ffmpeg: Add -dbg packages for all libraries
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
X-List-Received-Date: Fri, 12 Feb 2016 11:11:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-12 12:03, Gary Thomas wrote:
> On 2016-02-12 11:49, Burton, Ross wrote:
>>
>> On 12 February 2016 at 03:58, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>>
>>     Improve the packaging of the libraries built by this recipe.  These
>>     are created using special code in the recipe and the debug (-dbg)
>>     packages were not being created.  Adding these packages allow the
>>     libraries in question to be debugged using GDB.
>>
>>
>> oe-pkgdata-utils says:
>>
>> ffmpeg-dbg:
>>          /usr/bin/.debug/ffmpeg
>>          /usr/bin/.debug/ffprobe
>>          /usr/bin/.debug/ffserver
>>          /usr/lib/.debug/libavcodec.so.56.60.100
>>          /usr/lib/.debug/libavdevice.so.56.4.100
>>          /usr/lib/.debug/libavfilter.so.5.40.101
>>          /usr/lib/.debug/libavformat.so.56.40.101
>>          /usr/lib/.debug/libavutil.so.54.31.100
>>          /usr/lib/.debug/libpostproc.so.53.3.100
>>          /usr/lib/.debug/libswresample.so.1.2.101
>>          /usr/lib/.debug/libswscale.so.3.1.101
>>
>> So I'm not sure why this would be needed.
>>
>
> I'll check again, maybe it's as simple as ffmpeg-dbg wasn't
> brought in as an automatic dependency of mplayer2-dbg although
> a bunch of others were.
>

That's definitely it.  When I install mplayer2-dbg which was has
ffmpeg in DEPENDS, the library debug info was not found and ffmpeg-dbg
was not installed:

# opkg install mplayer2-dbg
Installing mplayer2-dbg (2.0+gitr0+2c378c71a4-r13.1) on root.
mplayer2-dbg: unsatisfied recommendation for libavformat-dbg
mplayer2-dbg: unsatisfied recommendation for libavutil-dbg
mplayer2-dbg: unsatisfied recommendation for libfaad-dbg
mplayer2-dbg: unsatisfied recommendation for libasound-dbg
mplayer2-dbg: unsatisfied recommendation for libavcodec-dbg
mplayer2-dbg: unsatisfied recommendation for libswresample-dbg
mplayer2-dbg: unsatisfied recommendation for libpostproc-dbg
mplayer2-dbg: unsatisfied recommendation for ncurses-libtinfo-dbg
mplayer2-dbg: unsatisfied recommendation for libswscale-dbg
...

So, how should this have worked, or is it a little broken?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

