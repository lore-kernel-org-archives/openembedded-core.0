Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1Stk5l-0007kJ-3w
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 20:44:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6OIWp7Z012316
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 11:32:51 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 24 Jul 2012 11:32:50 -0700
Message-ID: <500EEA46.9000507@windriver.com>
Date: Tue, 24 Jul 2012 14:32:38 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343137799-12032-1-git-send-email-yao.zhao@windriver.com>
	<CAJTo0LYuuOvzPSW6g8HSr8_6bPHgP8A0jD5Rb3wbRneNEkdUQg@mail.gmail.com>
	<1343144070.22222.14.camel@ted> <500EC6B0.60103@windriver.com>
In-Reply-To: <500EC6B0.60103@windriver.com>
X-Originating-IP: [128.224.147.210]
Subject: Re: [PATCH] bzip2-native: fix problems when bzip2-native is installed in parallel
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
X-List-Received-Date: Tue, 24 Jul 2012 18:44:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-24 12:00 PM, Yao Zhao wrote:
> On 12-07-24 11:34 AM, Richard Purdie wrote:
>> On Tue, 2012-07-24 at 14:57 +0100, Burton, Ross wrote:
>>> On 24 July 2012 14:49, Yao Zhao <yao.zhao@windriver.com> wrote:
>>>> when bzip2-native is installed in parallel to sysroot, it is 
>>>> possible that
>>>> some packages are using bzip2 to unpack, there are chances that 
>>>> bzip2 is
>>>> installed to sysroot but libbz2.so.0 not installed yet because 
>>>> parallel
>>>> installation.
>>>> link bzip2 and bzip2recover statically to avoid this problem and 
>>>> don't lose
>>>> parallel installation. libbz2.so is still available.
>>> Is it me, or is this officially getting silly?  This probably happens
>>> for *every* binary in the sysroot that links to a library, which is
>>> probably a fair proportion of them.  Statically linking every single
>>> one and then special-casing further problems where a static link isn't
>>> sufficient (see pythonnative) just isn't going to scale.
>> It happens for things in ASSUME_PROVIDED so there is only a finite list
>> of these issues. I'm curious what is actually triggering bzip2-native to
>> build given its in ASSUME_PROVIDED...
> Yeah, it is in the ASSUME_PROVIDED but somehow it was built too. I 
> will take a further look at why it was built.
>
It seems that python-native is depending on "bzip2-full-native" and 
bzip2 does provide this "bzip2-full-native".
Change it from "bzip2-full-native" to "bzip2-native" , bzip2-native is 
not built any more. The code may not check the
Why we need the bzip2-full-native? any idea?

thanks,
yao
> thanks,
> yao
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




