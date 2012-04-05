Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SFenN-0006Vh-0p
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 06:59:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q354oQPV011746
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Apr 2012 21:50:26 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 4 Apr 2012 21:50:26 -0700
Message-ID: <4F7D2490.5060102@windriver.com>
Date: Thu, 5 Apr 2012 12:50:24 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
	<2905489.oBl1N3jSJA@helios> <4F77BE14.6000304@windriver.com>
	<1967286.NbkyaBu6kN@helios>
In-Reply-To: <1967286.NbkyaBu6kN@helios>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Thu, 05 Apr 2012 04:59:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/01/2012 08:00 PM, Paul Eggleton wrote:
> On Sunday 01 April 2012 10:31:48 Robert Yang wrote:
>> On 04/01/2012 08:47 AM, Paul Eggleton wrote:
>>> usr/bin/icemaker: No such file or directory
>>
>> This is a known issue, there is an work around, it seems that the MACHINE is
>> qemux86, and host is x86_64, we can:
>>
>> cp
>> tmp/work/i586-poky-linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e9
>> 6d2ed61fc-r0/git/build/bin/icemaker
>> tmp/sysroots/x86_64-linux/usr/bin/icemaker
>>
>> The problem is that we don't have a kdelibs4-native, and it seems it is not
>> easy to add it.
>
> Ah, I see I neglected to install kdelibs-devel; but on the version of Fedora I
> am building on when I do install it that executable is not provided (at
> version 4.6.5 perhaps it is too old). I've copied it as you suggested but then
> I run into the lack of kconfig_compiler. On this machine "yum whatprovides"
> tells me that the only package that provides kconfig_compiler is kdelibs3-devel
> which is clearly not what is needed.
>

For the kconfig_compiler issue, I used a hacked workaround:

1) cd /usr/bin
2) ln -s kconfig_compiler4 kconfig_compiler
3) ln -s kconfig_compiler4 makekdewidgets

Fortunately, kdelibs4-native has been successfully ported currently, we will
submit the patch sooner, so these problems would be fixed with kdelibs4-native.

Other problems you may meet are:

1) Sometimes the raptor and rasqal_git.bb may fail, just rebuild them
    would fix the error, seems strange errors.

2) After then build successed, we can start the kde:
    $ runqemu qemux86
    edit /usr/bin/startkde there is a host absolute path in it:
    LD_BIND_NOW=true 
/host/path/to/tmp/sysroots/qemux86/usr/lib/kde4/libexec/start_kdeinit_wrapper 
kcminit_startup

    Fix it to:

    LD_BIND_NOW=true /usr/lib/kde4/libexec/start_kdeinit_wrapper +kcminit_startup

    Then

    $ startkde

// Robert

> I can't help feeling we need to have kdelibs4-native and forget the
> consequences of having to extend qt4-native if that's what's required;
> otherwise it's just too hard for people to build.
>
> Cheers,
> Paul
>


