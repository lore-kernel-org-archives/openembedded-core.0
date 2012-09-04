Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1T8pNY-0002L7-9D
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 11:25:04 +0200
Received: from [192.168.0.2] (host81-153-84-143.range81-153.btcentralplus.com
	[81.153.84.143]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 6CC2E9ADE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2012 10:12:44 +0100 (BST)
Message-ID: <5045C60B.1020600@r-finger.com>
Date: Tue, 04 Sep 2012 10:12:43 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5040A5BB.7040601@r-finger.com>
	<20120903070832.GC3205@jama.jama.net>
In-Reply-To: <20120903070832.GC3205@jama.jama.net>
Subject: Re: runstrip() in package.bbclass fails when run against a kernel module
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
X-List-Received-Date: Tue, 04 Sep 2012 09:25:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 03/09/12 08:08, Martin Jansa wrote:
> On Fri, Aug 31, 2012 at 12:53:31PM +0100, Tomas Frydrych wrote:
>>
>> runstrip() in package.bbclass fails when run against a kernel module,
>> because it tries to do a bitwise & with a 'None' argument. This throws:
>> TypeError: unsupported operand type(s) for &: 'NoneType' and 'int'.
> 
> Was this for denzil?
> 
> In master it was fixed a month ago by:
> http://git.openembedded.org/openembedded-core/commit/meta/classes/package.bbclass?id=a834ab8a6d53cae504fa112a89bab93d726539ec
> 
> Don't know why they merged your patch to master too now..

Yes, I run into the bug on Denzil and did not see the alternative fix in
master; either one of those fixes the problem, of course.

Tomas


> 
> Cheers,
> 
>>
>> Tomas
>>
> 
>> From 6abe978d8e0acdb35c1abfed83e775b276b1231f Mon Sep 17 00:00:00 2001
>> From: Tomas Frydrych <tomas@sleepfive.com>
>> Date: Fri, 31 Aug 2012 12:02:18 +0100
>> Subject: [PATCH] package.bbclass: fix stripping for kernel modules
>>
>> runstrip(path, elftype, d) does bitwise & on the elftype parameter, so it has
>> to be passed an integer. Passing None fails with: TypeError: unsupported
>> operand type(s) for &: 'NoneType' and 'int'.
>>
>> Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
>> ---
>>  meta/classes/package.bbclass |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 44e551f..f046fbb 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -877,7 +877,7 @@ python split_and_strip_files () {
>>  			for f in files:
>>  				if not f.endswith(".ko"):
>>  					continue
>> -				runstrip(os.path.join(root, f), None, d)
>> +				runstrip(os.path.join(root, f), 0, d)
>>  	#
>>  	# End of strip
>>  	#
>> -- 
>> 1.7.10.4
>>
>>
> 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 



