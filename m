Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0268260125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 12:01:08 +0000 (UTC)
Received: by pabru16 with SMTP id ru16so21466582pab.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 05:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Zm6fxNojlLmtwPoIA/TXk+kXZuDnJ55QdFg3RdLr30M=;
	b=wCD/HsDCC1Fwf8+VMAzW2lZ7rMPm9mrrXxM1Z/hdqDqmKcOOyR4/tL6D303iLm5Nqh
	zfhj+UTUleVzXVdFzrqZzNeIrzzH/viwbsdvoJ73H8hVkIVvxx0Yaihvd2AR1GExbl1o
	jvR6vxM33eSH4V5aZolV/ASD0rV+akoZtiBFHHJUbArIKDyw9aoOEBx9F/rqyDXLDYjl
	9AsO0Omdy7Y/KDZ8Jka0qsbctDX+wNN+Bg2JOkZWhCO+LfT+g/5j6VoNbKaNO4EzlhXc
	EpPyHpDLTJam9vSjIe2Mwj8bKJO05prKD8kW4GxlvjCIFxHJnkFvuzeraJS/0m/7sBrp
	4lSw==
MIME-Version: 1.0
X-Received: by 10.70.50.71 with SMTP id a7mr42030307pdo.14.1432036869569; Tue,
	19 May 2015 05:01:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Tue, 19 May 2015 05:01:09 -0700 (PDT)
In-Reply-To: <3230301C09DEF9499B442BBE162C5E482599AC00@SESTOEX04.enea.se>
References: <3230301C09DEF9499B442BBE162C5E48258ED362@sestoex09.enea.se>
	<20150508162311.GA20977@bang.betafive.co.uk>
	<3230301C09DEF9499B442BBE162C5E48258F1A57@sestoex09.enea.se>
	<2514335.muUPAEFR2j@peggleto-mobl.ger.corp.intel.com>
	<3230301C09DEF9499B442BBE162C5E48258F21ED@sestoex09.enea.se>
	<3230301C09DEF9499B442BBE162C5E482599AC00@SESTOEX04.enea.se>
Date: Tue, 19 May 2015 09:01:09 -0300
X-Google-Sender-Auth: F7uyVgY-1Ry3Wwm_C4mhGjjTWOI
Message-ID: <CAP9ODKoZrbZdx5xuGZASmUL_1X6uoXpu_Hnz4+3RX58AMEn0NQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maxin John <Maxin.John@enea.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 19 May 2015 12:01:09 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 19, 2015 at 8:47 AM, Sona Sarmadi <sona.sarmadi@enea.com> wrote:
>
>> > I'm guessing you would want something like this in your custom distro
>> > config (or local.conf if you must):
>> >
>> > PACKAGECONFIG_append_pn-opkg = " sha256"
>> > PACKAGECONFIG_append_pn-opkg-native = " sha256"
>>
>
> Thanks a lot guys for your help, this is now working :)
> There is support for sha256 in opkg but not in the opkg-utils.
> opkg-utils (opkg.py) just uses md5 as default option. I changed
>
> opkg.py:
> ........
>         # compute the MD5.
>         if not self.fn:
>             self.md5 = 'Unknown'
>         else:
>             f = open(self.fn, "rb")
>             sum = hashlib.md5()
> to
>             sum = hashlib.sha256()
>
> and now I get checksum sha256 in the "Packages" file:
>
> SHA256Sum: 6be1fb5b9dab3de5848fd578d515d05adc5c6cd3b0009f8c1b13ab1250cee594
>
> Do you think this patch would be of interest for someone?

Yes but it would be good to make it choosable at distro level.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

