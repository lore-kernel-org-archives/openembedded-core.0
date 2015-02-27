Return-Path: <openembedded-devel@urbanec.net>
Received: from mail14.tpgi.com.au (mail14.tpgi.com.au [203.12.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8BB718DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 03:28:13 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Fri, 27 Feb 2015 14:28:08 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail14.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t1R3S5US029300
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Fri, 27 Feb 2015 14:28:08 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YRBav-0006Lw-LC; Fri, 27 Feb 2015 14:28:05 +1100
Message-ID: <54EFE445.7030209@urbanec.net>
Date: Fri, 27 Feb 2015 14:28:05 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1424971893-6258-1-git-send-email-openembedded-devel@urbanec.net>	<1424987235.26813.42.camel@linuxfoundation.org>
	<CAP9ODKoZO1m-2BomHz6h_YtmwKsoEURsCxAMXPmYN3X6E1xqfQ@mail.gmail.com>
In-Reply-To: <CAP9ODKoZO1m-2BomHz6h_YtmwKsoEURsCxAMXPmYN3X6E1xqfQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: Shorten __FILE__ in gst_debug_log output on all platforms.
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
X-List-Received-Date: Fri, 27 Feb 2015 03:28:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/15 09:00, Otavio Salvador wrote:
> On Thu, Feb 26, 2015 at 6:47 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2015-02-27 at 04:31 +1100, Peter Urbanec wrote:
>>> On WIN32 the file argument to gst_debug_log_valist is shortened to just
>>> the filename. This is useful not only for MSVC, but also with gcc/Linux
>>> when doing cross-compilation builds and out-of-tree builds.
>>
>> Ultimately I think we need to address this issue in gcc itself, probably
>> setting some kind of base path in the environment which it removes from
>> __FILE__ (set to ${S}). There were more complex discussions about using
>> the same mapping code as can be used with the debug symbols code too.
>
> Agreed; this should indeed be a global fix as this affects virtually
> all packages.

I also agree, but this patch can go ahead regardless of what the global 
solution is. The patch enables a mechanism that already exists in 
gstreamer (but is only enabled on WIN32) and solves an immediate need in 
that context. Whatever the global solution is, this patch is very likely 
to continue working correctly.

Having a proper solution at the gcc level will significantly reduce the 
size of the generated files, so there is certainly a win to be had 
there. I had a look at both C99 and C++98 standards and the semantics of 
the __FILE__ macro are implementation defined and do not stipulate any 
particular interpretation. In particular, there's no requirement to have 
path information preserved.

I think a simple patch to gcc to transform a full pathname to basename 
is probably sufficient for oe-core - the less complexity is introduced 
the better.

