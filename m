Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SaCVj-0001Ye-Bm
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 23:02:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4VKq1h1009424
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 13:52:02 -0700 (PDT)
Received: from msp-dhcp42.wrs.com (172.25.34.42) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 31 May 2012 13:52:01 -0700
Message-ID: <4FC7D9F0.20203@windriver.com>
Date: Thu, 31 May 2012 15:52:00 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <72EA6980-26CF-4ABB-A6F9-9CD5F555EBEB@gmail.com>
	<F243C528-1700-497D-A358-B43DB67CE753@gmail.com>
In-Reply-To: <F243C528-1700-497D-A358-B43DB67CE753@gmail.com>
Subject: Re: [meta-xilinx] WARNING: QA Issue: bash & shell scripts
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
X-List-Received-Date: Thu, 31 May 2012 21:02:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/12 12:40 PM, Elvis Dowson wrote:
> Hi,
>
> On May 31, 2012, at 7:38 PM, Elvis Dowson wrote:
>
>> I've found the following warnings while attempting to build linux-xilinx. How can I trace which package it's originating from and what can I do to fix it?
>>
>> WARNING: QA Issue: bash: Found a reference to /usr/ in /tool/yocto/poky/build/tmp/work/ppc440-poky-linux/bash-4.2-r2/packages-split/bash/bin/bashbug
>> WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir should not reference anything in exec_prefix
>
> Sorry about that silly question, its originating from the bash-4.2 package. What should I do to fix it?

It's just a warning.... you don't need to fix it.

We're working on a fix for that right now.. the bashbug file is a shell script 
that adds /usr/bin to the path.  This causes the QA warning to hit and complain 
that there may be references to /usr/bin items in the script.

The warning is because things in /bin are assumed to be required for booting, 
and you may boot w/o /usr being mounted.. causing a potential problem.  I can't 
see why bashbug would ever be used for booting, so this shouldn't be a problem.

Right now, I expect we're going to "fix" the problem with a two step patch.. 
The first being to move bashbug from base_bindir to bindir, and the second to 
split it into a new package so that it's not always installed..  (it's only 7k 
or so.. but why even install it on an embedded system unless it's really needed.)

--Mark

> Elvis Dowson
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



