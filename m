Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UVTfM-0002xC-Tb
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 23:25:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3PL7ZMY015390
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 14:07:36 -0700 (PDT)
Received: from msp-dhcp5.wrs.com (172.25.34.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 25 Apr 2013 14:07:35 -0700
Message-ID: <51799B15.2050600@windriver.com>
Date: Thu, 25 Apr 2013 16:07:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20130424072004.GE3217@jama>
	<B57A220D1EE1644685BA9AD5C790D20526BE5531DF@SOUTHSIDE.devonintlgroup.com>
In-Reply-To: <B57A220D1EE1644685BA9AD5C790D20526BE5531DF@SOUTHSIDE.devonintlgroup.com>
Subject: Re: debugedit: canonicalization unexpectedly shrank by one character
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
X-List-Received-Date: Thu, 25 Apr 2013 21:26:00 -0000
X-List-Received-Date: Thu, 25 Apr 2013 21:26:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/13 3:43 PM, Ian Geiser wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Martin Jansa
>> Sent: Wednesday, April 24, 2013 3:20 AM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] debugedit: canonicalization unexpectedly shrank by
>> one character
>>
>> Hi,
>>
>> with debugedit errors now catched and shown after:
>> commit 262a69ffd33e9d001a7a15fc73671a015e3b5dd1
>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Date:   Mon Mar 25 16:52:07 2013 +0000
>>
>>      package.bbclass: Handle subprocess errors correctly
>>
>>      If an error occurs in subprocess.call() we currently don't catch
>> it. In particular
>>      we have issues where debugedit is segfaulting unnoticed. This fixes
>> up
>>      various code paths to catch the errors.
>>
>> I get couple of recipes failing with errors like:
> [...]
>> This leads to
>> https://bugzilla.redhat.com/show_bug.cgi?id=304121
>> https://bugs.launchpad.net/rpm/+bug/638633
>> https://qa.mandriva.com/show_bug.cgi?id=62391
>>
>> but no clear solution (it would be nice to show which path triggered
>> that message as suggested in redhat bugzilla)
>>
>> I can INHIBIT_PACKAGE_DEBUG_SPLIT in failing recipes or adding slash to
>> -d '/usr/src/debug/' works in this case too..
> I tried set PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src" in the package and that seemed to work around the problem.  In my package that was offending was because there was an -rpath that had a trailing /.  It seems debugedit is very sensitive to rogue path separators. Are there ways to make this more robust?

Source for debugedit is part of RPM.  I don't see any reason why we wouldn't 
accept patches for something like this.  (However, it does seem like the rpath 
may be wrong as well.  Fixing the rpath should probably be done as well.)

--Mark

>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



