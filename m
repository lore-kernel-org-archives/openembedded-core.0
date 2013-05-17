Received: from atl4mhfb02.myregisteredsite.com ([209.17.115.56])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1UdImo-0007hu-CQ
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 13:25:28 +0200
Received: from atl4mhob09.myregisteredsite.com
	(atl4mhob09.myregisteredsite.com [209.17.115.47])
	by atl4mhfb02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4HB4w4c013474 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 07:04:58 -0400
Received: from mail.hostingplatform.com ([10.30.71.207])
	by atl4mhob09.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4HB4vve022713 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 07:04:57 -0400
Received: (qmail 25457 invoked by uid 0); 17 May 2013 11:04:56 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 17 May 2013 11:04:56 -0000
Message-ID: <51960ED8.8080500@topic.nl>
Date: Fri, 17 May 2013 13:04:56 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1368689187-4714-1-git-send-email-xiao.zhang@windriver.com>
	<1368689187-4714-2-git-send-email-xiao.zhang@windriver.com>
	<5194AE0D.8030508@windriver.com>
	<5195D693.9090003@linux.intel.com> <5195FBBA.6030309@topic.nl>
	<20130517101526.GI24809@jama.dyndns-home.com>
	<51960BB9.5000706@topic.nl>
In-Reply-To: <51960BB9.5000706@topic.nl>
Subject: Re: package_write_ipk somehow looks into the wrong path
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
X-List-Received-Date: Fri, 17 May 2013 11:25:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2013 12:51 PM, Mike Looijmans wrote:
> On 05/17/2013 12:15 PM, Martin Jansa wrote:
>> On Fri, May 17, 2013 at 11:43:22AM +0200, Mike Looijmans wrote:
>>>
>>> I got this very weird build failure. It builds fine for one machine
>>> (zedboard), but it craps out in a really weird way on the "zynq-zc702"
>>> machine.
>>>
>>> Somehow the "package_write_ipk" task wants to find files in a directory
>>> with "1-r0" (a version that has once existed a long long time ago) in
>>> the version part, instead of the proper git hashed name.
>>>
>>> I've tried a "cleansstate" but that did not help. The "compile" step in
>>> this recipe takes about 1,5 hour on my i7 system, so debugging this
>>> recipe is painfully slow...
>>>
>>> I've attached the recipes, pasted the log below.
>>
>> try it with 2/2 patch from
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4102
>>
>
> I somehow fail to extract the patch from the mail correctly (probably
> lack of skilz on my side, I am not often at the receiving end of mailed
> patches).
>
> But my recipe does mess with the PV string because the Xilinx tools will
> fail to work properly when there is a "+" sign in the path. I'll try to
> fix it in a more proper way than using a python replace, see if that helps.

Replaced
SRCPV_NOPLUS = "${@d.getVar('SRCPV',True).replace('+','-')}"
with
SRCPV = "${@bb.fetch2.get_srcrev(d).replace('+','-')}"

did a cleansstate, but still the same error.

Mike.


