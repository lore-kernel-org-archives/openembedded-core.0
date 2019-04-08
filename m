Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
	by mail.openembedded.org (Postfix) with ESMTP id A7CDB7D485
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 20:19:34 +0000 (UTC)
Received: from [192.168.178.34] (i59F77E15.versanet.de [89.247.126.21])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id E544A11A007A;
	Mon,  8 Apr 2019 22:19:34 +0200 (CEST)
To: richard.purdie@linuxfoundation.org
References: <58b4bdc8-f722-41f4-8c0b-7671b44397e0@email.android.com>
	<1cde16c3b778fe783faa1e93f2004ba392e2387f.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <43d132a6-40d6-3c88-c404-85f47dc53d62@herbrechtsmeier.net>
Date: Mon, 8 Apr 2019 22:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1cde16c3b778fe783faa1e93f2004ba392e2387f.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Circular dependency of do_populate_sysroot
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
X-List-Received-Date: Mon, 08 Apr 2019 20:19:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Am 08.04.19 um 08:55 schrieb richard.purdie@linuxfoundation.org:
> On Mon, 2019-04-08 at 07:43 +0200, Stefan Herbrechtsmeier wrote:
>> Am 07.04.2019 23:35 schrieb richard.purdie@linuxfoundation.org:
>>> You're saying A runtime depends on B and B runtime depends on A.
>>
>> Yes, only the run time depends on each other. This means the
>> dependency doesn't exist during a native build of a or b.
> 
> In which case this is easy, simply set:
> 
> RDEPENDS_${PN}_class-native = ""
> 
> By default the system assumes that native packages have the same
> dependencies as target.

I mean that the build of a-native and b-native don't need b-native or 
a-native to populate the sysroot directory but a-native and b-native 
require b-native or a-native at run time.

I have take a deeper look into the problem and understand that this 
isn't supported by oe because of the native sysroot implementation. The 
implementation evaluates the rdepends during do_populate_sysroot task 
and therefore need to finish all other do_populate_sysroot task before.

It would be nice if the native sysroot uses packages and supports the 
same features as the cross packages which handle dependencies independently.

Best regards
   Stefan

