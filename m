Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PvBMB-0005sr-Sp
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 17:29:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p23GOthn025822
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 08:24:55 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 3 Mar 2011 08:24:54 -0800
Message-ID: <4D6FC0D5.8@windriver.com>
Date: Thu, 3 Mar 2011 10:24:53 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.14) Gecko/20110221 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <394EA6D4-E718-4BE7-93A2-6AF67AAF6E0D@dominion.thruhere.net>
	<4D6FC05B.6040908@windriver.com>
In-Reply-To: <4D6FC05B.6040908@windriver.com>
X-Originating-IP: [172.25.36.227]
Subject: Re: lots of WARNING: QA Issue: Bit size did not match (32 to	0) warnings, what do they mean?
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
X-List-Received-Date: Thu, 03 Mar 2011 16:29:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

I found the issue.  Somewhere in a code merge in lib/oe/qa.py "self.bits = 32"
became "self.bits == 32"

lines 43 and 45 are incorrect.  I'll submit a patch shortly to resolve this.

--Mark

> On 3/3/11 9:45 AM, Koen Kooi wrote:
>> > Hi,
>> > 
>> > I started noticing a lot of warnings like this:
>> > 
>> > WARNING: QA Issue: Bit size did not match (32 to 0) on /work/armv7a-angstrom-linux-gnueabi/udev-165-r2/packages-split/udev/sbin/udevd
> If the file is an ELF file, there are specific checks that are performed,
> machine type, os type.. and bit size.  (I suspect the QA message for all of them
> probably need to be improved.)
> 
> What I find interesting is it came back as "0".  0 indicates that the elf
> comparison loader was never run.. 0 is "unknown".  (32 and 64 are obvious values...)
> 
> The code that determines the size is in meta/lib/oe/qa.py.  The normal use of
> the code is from the meta/classes/insane.bbclass function.  The fact the
> comparison returned a 0 indicates that the qa.py functions did not run.  This
> could be a bug in meta/lib/oe/qa.py, or it could be that the routine call in
> package_qa_walk (in insane.bbclass) failed for some reason and something went
> wrong with the exception handler?
> 
>> > What do they mean and how can I (help to) fix them?
> First thing to do is check the binary that is being referenced and verify that
> it is infact a valid ARM EABI binary.  Assuming it is file, we need to track
> down the code likely starting in qa.py and figure out why it didn't determine
> the bit size.
> 
> --Mark
> 
>> > regards,
>> > 
>> > Koen
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


