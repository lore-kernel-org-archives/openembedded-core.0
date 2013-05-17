Received: from atl4mhfb02.myregisteredsite.com ([209.17.115.56])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1UdItA-0008Dp-Ny
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 13:32:04 +0200
Received: from atl4mhob05.myregisteredsite.com
	(atl4mhob05.myregisteredsite.com [209.17.115.43])
	by atl4mhfb02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4HBDg7b024076 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 07:13:42 -0400
Received: from mail.hostingplatform.com ([10.30.71.210])
	by atl4mhob05.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4HBDci5010489 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 07:13:38 -0400
Received: (qmail 32096 invoked by uid 0); 17 May 2013 11:13:38 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 17 May 2013 11:13:38 -0000
Message-ID: <519610E1.1030607@topic.nl>
Date: Fri, 17 May 2013 13:13:37 +0200
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
	<5196105C.8080808@topic.nl>
In-Reply-To: <5196105C.8080808@topic.nl>
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
X-List-Received-Date: Fri, 17 May 2013 11:32:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2013 01:11 PM, Mike Looijmans wrote:
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
>
> Okay, I just manually applied those changes. Then I get:
>
> ERROR: Recipe fpga-image is trying to change PV from
> '2.AUTOINC-bfd37feb034919cc11b3879745f2770810a4e796' to '1'. This will
> cause do_package_write_ipk failing to find right workdir.
>
>
> That helps, but I still don't have the faintest idea what is going on
> here. What's wrong with my recipe?

As a last resort, I tried just putting PV="3" into the recipe. WTF?


ERROR: Recipe fpga-image is trying to change PV from '3' to '1'. This 
will cause do_package_write_ipk failing to find right workdir.
ERROR: Function failed: read_subpackage_metadata
ERROR: Logfile of failure stored in: 
/home/mike/zynq/build/tmp-eglibc/work/zynq-zc702-oe-linux-gnueabi/fpga-image/3-r0/temp/log.do_package_write_ipk.13519
ERROR: Task 12 
(/home/mike/zynq/meta-zynq/recipes-bsp/fpga/fpga-image.bb, 
do_package_write_ipk) failed with exit code '1'


Who's touching my PV?

Mike.


