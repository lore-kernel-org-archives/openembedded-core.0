Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGF4t-0006vG-5B
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 21:11:55 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 18 Oct 2011 12:06:03 -0700
Received: by wyg24 with SMTP id 24so927404wyg.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 12:06:02 -0700 (PDT)
Received: by 10.216.82.145 with SMTP id o17mr1236282wee.78.1318964762038;
	Tue, 18 Oct 2011 12:06:02 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id y10sm5239653wbm.14.2011.10.18.12.05.59
	(version=SSLv3 cipher=OTHER); Tue, 18 Oct 2011 12:06:01 -0700 (PDT)
Message-ID: <4E9DCE16.6060906@intel.com>
Date: Tue, 18 Oct 2011 12:05:58 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318796061.git.sgw@linux.intel.com>
	<bd5259c1b77e280bf7c076b50eedd0c3dc3424dc.1318796061.git.sgw@linux.intel.com>
	<CA+chaQfUYO5MZqKq5FCvx9D_yxXsGcg5KJo0RADXCB2BruhHPA@mail.gmail.com>
In-Reply-To: <CA+chaQfUYO5MZqKq5FCvx9D_yxXsGcg5KJo0RADXCB2BruhHPA@mail.gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [v2 -CONSOLIDATED PULL 06/14] pulseaudio: make bluetooth support conditional upon DISTRO_FEATURES
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
X-List-Received-Date: Tue, 18 Oct 2011 19:11:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2011 11:49 AM, Martin Jansa wrote:
> On Sun, Oct 16, 2011 at 10:17 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>> From: Paul Eggleton<paul.eggleton@linux.intel.com>
>>
>> If "bluetooth" is in DISTRO_FEATURES then enable bluetooth and depend on
>> bluez4, otherwise disable it.
>>
>> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
>> ---
>>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    5 +++--
>>   .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
>>   .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
>>   3 files changed, 5 insertions(+), 4 deletions(-)
>
> It's not caused by this patch.. but if you're looking into pulseaudio,
> can you also fix this:
>
> Building man pages is using host perl and fails if there isn't
> XML/Parser.pm on host:
>
> | perl ./xmltoman default.pa.5.xml>  default.pa.5 || rm -f default.pa.5
> | Can't locate XML/Parser.pm in @INC (@INC contains: /etc/perl
> /usr/lib64/perl5/site_perl/5.12.4/x86_64-linux
> /usr/lib64/perl5/site_perl/5.12.4
> /usr/lib64/perl5/vendor_perl/5.12.4/x86_64-linux
> /usr/lib64/perl5/vendor_perl/5.12.4 /usr/lib
> 64/perl5/site_perl /usr/lib64/perl5/vendor_perl
> /usr/lib64/perl5/5.12.4/x86_64-linux /usr/lib64/perl5/5.12.4
> /usr/local/lib/site_perl .) at ./xmltoman line 21.
> | BEGIN failed--compilation aborted at ./xmltoman line 21.
> | test -z "/usr/share/man/man1" || /bin/mkdir -p
> "/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/pulseaudio-0.9.23-r5/image/usr/share/man/man1"
> |  /usr/bin/install -c -m 644 ./pulseaudio.1 ./esdcompat.1
> ./pax11publish.1 ./paplay.1 ./pacat.1 ./pacmd.1 ./pactl.1
> ./pasuspender.1 ./padsp.1 ./pabrowse.1
> '/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/pulseaudio-0.9.23-r5/image/usr/share/man/man1'
> | /usr/bin/install: cannot stat `./pulseaudio.1': No such file or directory
> | /usr/bin/install: cannot stat `./esdcompat.1': No such file or directory
> | /usr/bin/install: cannot stat `./pax11publish.1': No such file or directory
> | /usr/bin/install: cannot stat `./paplay.1': No such file or directory
> | /usr/bin/install: cannot stat `./pacat.1': No such file or directory
> | /usr/bin/install: cannot stat `./pacmd.1': No such file or directory
> | /usr/bin/install: cannot stat `./pactl.1': No such file or directory
> | /usr/bin/install: cannot stat `./pasuspender.1': No such file or directory
> | /usr/bin/install: cannot stat `./padsp.1': No such file or directory
> | /usr/bin/install: cannot stat `./pabrowse.1': No such file or directory
> | make[3]: *** [install-man1] Error 1
> | make[3]: Leaving directory
> `/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/pulseaudio-0.9.23-r5/pulseaudio-0.9.23/man'
>
> inherit perlnative works for me as work around as it puts perl
> perl-native in PATH before host perl and XML/Parser.pm is installed in
> native sysroot, but maybe you'll find cleaner solution (maybe patching
> Makefile to use env perl will be enough).
>
Martin,

Could you please file this as a bug in bugzilla.yoctoproject.org.

Thanks
	Sau!


> Regards,
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



