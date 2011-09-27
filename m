Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1R8ecW-0006dz-Mw
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 22:51:16 +0200
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga01.intel.com with ESMTP/TLS/RC4-MD5; 27 Sep 2011 13:44:44 -0700
Received: by pzk32 with SMTP id 32so33583820pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 13:44:44 -0700 (PDT)
Received: by 10.68.29.138 with SMTP id k10mr38869796pbh.70.1317156284589;
	Tue, 27 Sep 2011 13:44:44 -0700 (PDT)
Received: from [192.168.1.12] (c-98-246-165-28.hsd1.or.comcast.net.
	[98.246.165.28])
	by mx.google.com with ESMTPS id 2sm102912pbu.1.2011.09.27.13.44.43
	(version=SSLv3 cipher=OTHER); Tue, 27 Sep 2011 13:44:43 -0700 (PDT)
Message-ID: <4E8235BA.2040206@intel.com>
Date: Tue, 27 Sep 2011 13:44:42 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1316955346-12756-1-git-send-email-julian.pidancet@gmail.com>	<4E810D02.6080101@linux.intel.com>	<CAKZ=5EV1JWxf4MaMmHNNkvZDa6OmoLTqThUuteuG7zOxJkFPxA@mail.gmail.com>
	<CAKZ=5EUPf9GrTjP=odYcxRYqkONZnqzoDd0kBWn-UdqOO5efFw@mail.gmail.com>
In-Reply-To: <CAKZ=5EUPf9GrTjP=odYcxRYqkONZnqzoDd0kBWn-UdqOO5efFw@mail.gmail.com>
Subject: Re: [PATCH] Use useradd and update-rc.d classes in the OpenSSH recipe
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
X-List-Received-Date: Tue, 27 Sep 2011 20:51:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2011 05:47 PM, Julian Pidancet wrote:
> On Tue, Sep 27, 2011 at 12:59 AM, Julian Pidancet
> <julian.pidancet@gmail.com>  wrote:
>> On Tue, Sep 27, 2011 at 12:38 AM, Saul Wold<sgw@linux.intel.com>  wrote:
>>>
>>> Is there a reason you did not include the group and --disable-password here?
>>>
>>> I think it would be good to leave thelong name options in also.
>>>
>>> Sau!
>>>
>>
>> The -U option creates a group with the same name. The
>> --disable-password option only exists with adduser and is default with
>> useradd -r.
>> I'd just like to point out that adduser is originally a perl script
>> from debian and reimplemented in busybox. The options it takes are not
>> compatible with the more standard useradd from the shadow package.
>>
>> For some reason, some long options like --system (which is supposed to
>> be supported in useradd) did not work during my first
>> experimentations, but I will investigate and respin a patch with long
>> options if possible.
>>
>> Also, I discovered that the following recipes still depends on adduser:
>> ppp-dialin, avahi, distcc, xserver-nodm-init, pulseaudio, hal, dbus
>>
>> It would be good to use the useradd class with all of them.
>>
>
> In the shadow-sysroot package that we build to be able to use the
> useradd class, we apply the add_root_cmd_options.patch to add the
> --root option to useradd.
>
> The --root option allows useradd to chroot somewhere so it can modify
> /etc/passwd, but at the same time, it disables all the other long
> options in the program.
>
> It looks like it is impossible to use long options with the useradd
> class. I don't know how straighforward it would be to modify this
> patch to get the long options back. But is it worth the pain ?

Hi Julian,

Are you using the latest from oe-core master? I thought this patch from 
Phil addressed this issue:

http://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?id=8fce8180c802ad187c4df44c17207bfb026ce6c7

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


