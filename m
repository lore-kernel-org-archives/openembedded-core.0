Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R8LzD-0002xq-Lm
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 02:57:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8R0q1As013120
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 17:52:01 -0700 (PDT)
Received: from Macintosh-5.local (128.224.18.66) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 26 Sep 2011 17:52:01 -0700
Message-ID: <4E811E28.1020106@windriver.com>
Date: Mon, 26 Sep 2011 20:51:52 -0400
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1316955346-12756-1-git-send-email-julian.pidancet@gmail.com>
	<4E810D02.6080101@linux.intel.com>
	<CAKZ=5EV1JWxf4MaMmHNNkvZDa6OmoLTqThUuteuG7zOxJkFPxA@mail.gmail.com>
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
X-List-Received-Date: Tue, 27 Sep 2011 00:57:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/26/11 8:47 PM, Julian Pidancet wrote:
> On Tue, Sep 27, 2011 at 12:59 AM, Julian Pidancet
> <julian.pidancet@gmail.com> wrote:
>> On Tue, Sep 27, 2011 at 12:38 AM, Saul Wold <sgw@linux.intel.com> wrote:
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
> 

If the long options got disabled due to the path, it's a bug.

(File a bug on bugzilla.yoctoproject.org and someone will look at it.. or submit
a patch...)

--Mark


