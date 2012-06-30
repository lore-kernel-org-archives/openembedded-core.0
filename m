Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Skz5i-0001oQ-A4
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 16:56:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5UEj8JD015980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2012 07:45:08 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sat, 30 Jun 2012 07:45:08 -0700
Message-ID: <4FEF10F4.2030801@windriver.com>
Date: Sat, 30 Jun 2012 09:45:08 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1206300923060.17865@oneiric>
	<20120630132935.GA3689@jama.jama.net>
	<alpine.DEB.2.02.1206300940100.18253@oneiric>
In-Reply-To: <alpine.DEB.2.02.1206300940100.18253@oneiric>
Subject: Re: is it best practice to use ${sysconfdir} rather than hard-coding "/etc"?
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
X-List-Received-Date: Sat, 30 Jun 2012 14:56:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/12 8:41 AM, Robert P. J. Day wrote:
> On Sat, 30 Jun 2012, Martin Jansa wrote:
>
>> On Sat, Jun 30, 2012 at 09:25:57AM -0400, Robert P. J. Day wrote:
>>>
>>>    i suspect i know the answer to this, but in the recipe file
>>> usbinit.bb, we have:
>>>
>>> do_install() {
>>>      install -d ${D}/etc
>>>      install -d ${D}/etc/init.d
>>>      install usb-gether ${D}/etc/init.d
>>> }
>>>
>>>    i'm guessing that would more properly be coded:
>>>
>>> do_install() {
>>>      install -d ${D}${sysconfdir}
>>>      install -d ${D}${sysconfdir}/init.d
>>>      install usb-gether ${D}${sysconfdir}/init.d
>>> }
>>>
>>>    the end result is functionally identical, of course, it's all just a
>>> matter of style.
>>
>> using sysconfdir is better as someone can define it to different value
>> then 'etc' and the later will still work (be consistent across image)
>
>    there are definitely a number of examples of hard-coded "/etc" in
> the recipes, but i'm not about to run around cleaning them -- i just
> wanted to make sure there was no compelling reason to do that
> hard-coding.  thanks.

There are instances where programs have hard coded paths, such as /etc/init.d. 
In those cases, it may be better to do the install and FILES_ work using the 
same hard coded path, since the item won't work if the variable version is renamed.

But for most things that use autoconf, the install locations are completely 
variable, so using the path variables is preferred.

My rule of thumb, if in doubt, use the path variables.  If you know that the 
path variables won't work for some reason -- either fix the problem, or use hard 
coded paths... IMHO this will help someone discover places that need to be 
modified if they ever change the value.

--Mark

> rday
>




