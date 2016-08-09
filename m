Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 50D1B75E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 08:24:03 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3])
	by metis.ext.pengutronix.de with esmtp (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1bX2KR-0002xE-MR; Tue, 09 Aug 2016 10:24:03 +0200
To: openembedded-core@lists.openembedded.org
References: <1470663448-5191-1-git-send-email-ejo@pengutronix.de>
	<20160809051730.2j5xuc3tud3mrj6g@ad.chargestorm.se>
From: Enrico Joerns <ejo@pengutronix.de>
Message-ID: <d615b7c7-2520-9425-06c6-e1e9d14f4abf@pengutronix.de>
Date: Tue, 9 Aug 2016 10:24:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160809051730.2j5xuc3tud3mrj6g@ad.chargestorm.se>
X-SA-Exim-Connect-IP: 2001:67c:670:100:76d4:35ff:fee8:98b3
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH] systemd: fix useradd parameter generation
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
X-List-Received-Date: Tue, 09 Aug 2016 08:24:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 08/09/2016 07:17 AM, Anders Darander wrote:
> * Enrico Jorns <ejo@pengutronix.de> [160808 15:55]:
>> Constructing the USERADD_PARAM_${PN} value with += (as done before)
>> resulted in having a whitespace added for each entry not having its
>> PACKAGECONFIG parameter activated.
>
>> This is not only a cosmetical issue. The useradd class concatenates all
>> useradd commands from all subpackages of a package by doing a
>> ";".join(). When having a useradd command that ends with ";" and some
>> extra spaces, concatenation will result in an empty useradd argument
>> ("commandA;    ;commandB"). The useradd command will be called with this
>> and make the Yocto build break by returning an error code.
>
>> Fortunately, there is no problem when having a "commandA;;commandB" in
>> the useradd string, this will be ignored. Thus using "_append" instead of
>> "+=" is sufficient here.
>
> NAK
>
> Fix useradd.bbclass instead. Otherwise, the same issue will happen with
> other recipes. Having a single variable, that you're not allowed to use
> the normal way to add to, would be more confusing. Personally, I would
> find it hard to rember that I need to use .= for USERADD_PARAM...

Yes, I did not have .= in mind when creating this solution, but this 
would be the better approach.
Nevertheless, I also prefer a more general solution, but was not sure 
about how it could look like. Maybe I've found one now.

So, forget about this patch, I will post a useradd class patch in a 
separate thread instead.

Regards, Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


