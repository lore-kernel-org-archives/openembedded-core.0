Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A05F601E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 14:23:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4JENeVL015095
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 07:23:40 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Tue, 19 May 2015 07:23:40 -0700
Message-ID: <555B476B.9040400@windriver.com>
Date: Tue, 19 May 2015 09:23:39 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <3230301C09DEF9499B442BBE162C5E48258ED362@sestoex09.enea.se>	<20150508162311.GA20977@bang.betafive.co.uk>	<3230301C09DEF9499B442BBE162C5E48258F1A57@sestoex09.enea.se>	<2514335.muUPAEFR2j@peggleto-mobl.ger.corp.intel.com>	<3230301C09DEF9499B442BBE162C5E48258F21ED@sestoex09.enea.se>	<3230301C09DEF9499B442BBE162C5E482599AC00@SESTOEX04.enea.se>
	<CAP9ODKoZrbZdx5xuGZASmUL_1X6uoXpu_Hnz4+3RX58AMEn0NQ@mail.gmail.com>
In-Reply-To: <CAP9ODKoZrbZdx5xuGZASmUL_1X6uoXpu_Hnz4+3RX58AMEn0NQ@mail.gmail.com>
Subject: Re: opkg and gpg signed ipk packages
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
X-List-Received-Date: Tue, 19 May 2015 14:23:40 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 5/19/15 7:01 AM, Otavio Salvador wrote:
> On Tue, May 19, 2015 at 8:47 AM, Sona Sarmadi <sona.sarmadi@enea.com> wrote:
>>
>>>> I'm guessing you would want something like this in your custom distro
>>>> config (or local.conf if you must):
>>>>
>>>> PACKAGECONFIG_append_pn-opkg = " sha256"
>>>> PACKAGECONFIG_append_pn-opkg-native = " sha256"
>>>
>>
>> Thanks a lot guys for your help, this is now working :)
>> There is support for sha256 in opkg but not in the opkg-utils.
>> opkg-utils (opkg.py) just uses md5 as default option. I changed
>>
>> opkg.py:
>> ........
>>         # compute the MD5.
>>         if not self.fn:
>>             self.md5 = 'Unknown'
>>         else:
>>             f = open(self.fn, "rb")
>>             sum = hashlib.md5()
>> to
>>             sum = hashlib.sha256()
>>
>> and now I get checksum sha256 in the "Packages" file:
>>
>> SHA256Sum: 6be1fb5b9dab3de5848fd578d515d05adc5c6cd3b0009f8c1b13ab1250cee594
>>
>> Do you think this patch would be of interest for someone?
> 
> Yes but it would be good to make it choosable at distro level.

I agree.. and RPM(5) has the ability to switch the default checksum from MD5 to
others as well.  So a global distro setting would make sense.  (I don't know how
the deb package manager is configured.)

Let me know if we come up with a distribution level switch (or if we just want
to make the policy be sha256, as it's definitely better then MD5) and I can help
make the RPM configuration change as well.

--Mark

