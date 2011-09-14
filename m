Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R3dnC-0002tx-AT
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 02:57:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8E0qNuV010281
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:52:23 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 13 Sep 2011 17:52:22 -0700
Message-ID: <4E6FFAC6.60404@windriver.com>
Date: Tue, 13 Sep 2011 19:52:22 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <840A81C1B782724A8EB52725BD519EFF18E621@MBX20.4emm.local>
	<4E6A3770.4060307@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18E85D@MBX20.4emm.local>
	<4E6E1C1D.7010500@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18E950@MBX20.4emm.local>
	<1315905402.2519.116.camel@phil-desktop>
In-Reply-To: <1315905402.2519.116.camel@phil-desktop>
Subject: Re: Problem with new image-prelink
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
X-List-Received-Date: Wed, 14 Sep 2011 00:57:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Please try the new version of the prelinker.  I just sent a pull request for it,
but there was a missing typecast on a printf.  This was causing problems on
various systems, and likely could be causing the issue that you observed on ARM
as well.

I did build the latest version for the ARM target, and successfully ran it there
under QEMU.

--Mark

On 9/13/11 4:16 AM, Phil Blundell wrote:
> On Tue, 2011-09-13 at 02:58 +0000, James Limbouris wrote:
>> root@192:~# gdb prelink
>> <...>
>> Reading symbols from /usr/sbin/prelink...Reading symbols from /usr/sbin/.debug/prelink...done.
>> done.
>> (gdb) set follow-fork-mode child
>> (gdb) run -a
>> Starting program: /usr/sbin/prelink -a
>> [New process 1712]
>> process 1712 is executing new program: /usr/sbin/prelink-rtld
>> [ 2777.370000] Alignment trap: prelink-rtld (1712) PC=0x410f9990 Instr=0xe5922024 Address=0x00000025 FSR 0x001
>>
>> Program received signal SIGBUS, Bus error.
>> [Switching to process 1712]
>> 0x410f9990 in __ctype_b_loc () at ../include/ctype.h:30
>> 30          *tablep = (const uint16_t *) _NL_CURRENT (LC_CTYPE, _NL_CTYPE_CLASS) + 128;
> 
> Just in case it's not obvious, the fact that this address is unaligned
> is the least of your worries.  Even if alignment didn't matter, you
> would just get a segfault instead since 0x25 is never going to be a
> valid pointer.
> 
> I guess you need to investigate where the value in r2 is coming from and
> figure out why it has this bogus value.
> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



