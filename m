Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U6H3f-0002fy-8S
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 09:54:17 +0100
Received: from atl4mhob05.myregisteredsite.com
	(atl4mhob05.myregisteredsite.com [209.17.115.43])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1F8cCUA006597 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 03:38:13 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob05.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1F8cB3v004821 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 03:38:11 -0500
Received: (qmail 30378 invoked by uid 0); 15 Feb 2013 08:38:11 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 15 Feb 2013 08:38:11 -0000
Message-ID: <511DF3F2.6000606@topic.nl>
Date: Fri, 15 Feb 2013 09:38:10 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <511BB265.8030505@windriver.com> <511CA4B2.1090307@intel.com>
	<511CA9E2.70700@windriver.com>
	<CAJTo0LYLtan2=YkzCN9Xvkj7k695LGba7T1QMHwYQ8EK46YvgQ@mail.gmail.com>
	<511CDA0F.9060002@topic.nl> <511CDBA1.70906@linaro.org>
	<511CDF1D.2060805@topic.nl> <511CE9B9.2010405@topic.nl>
In-Reply-To: <511CE9B9.2010405@topic.nl>
X-MIME-Autoconverted: from 8bit to quoted-printable by
	atl4mhfb03.myregisteredsite.com id r1F8cCUA006597
Subject: Re: How to "implement" systemd
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
X-List-Received-Date: Fri, 15 Feb 2013 08:54:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02/14/2013 02:42 PM, Mike Looijmans wrote:
> On 02/14/2013 01:57 PM, Mike Looijmans wrote:
>> On 02/14/2013 01:42 PM, Marcin Juszkiewicz wrote:
>>> W dniu 14.02.2013 13:35, Mike Looijmans pisze:
>>>> So far i've been using good old initscripts for my systems. I want t=
o
>>>> try out systemd. Having zero experience with that, I just added
>>>> "systemd" to the DISTRO_FEATURES and started a fresh  build. The bui=
ld
>>>> ran fine, but it produced something that still seems to be using
>>>> initscripts, albeit that a few things stopped working (the network d=
id
>>>> not start, for example).
>>>
>>> DISTRO_FEATURES_INITMAN =3D "systemd" is what you want.
>>
>> Sorry, I have to amend my original post.
>>
>> DISTRO_FEATURES_INITMAN =3D "systemd"
>>
>> is just what I did (added it to my distro .conf file), because from th=
e
>> source I gathered that that was the way to get it into DISTRO_FEATURES.
>>
>> How can I check whether it's using systemd? I don't see any obvious
>> difference in the rootfs, and I never saw any systemd package being
>> built either.
>
> Ah, to (probably) answer my own question, there was a hidden
> VIRTUAL-RUNTIME_init_manager =3D "sysvinit"
> in my config chain, which was probably the cause. Running another build=
,
> and I've seen a systemd task being run now...

That indeed "solved" the issue. However, the image doesn't get to a=20
point that I can actually log in or do something useful, so I guess the=20
default is still sysvinit for good reasons :)

Here's all the logging I get before it "dies":


systemd[1]: systemd 197 running in system mode. (-PAM -LIBWRAP -AUDIT=20
-SELINUX +IMA +S
YSVINIT -LIBCRYPTSETUP +GCRYPT +ACL +XZ)=20

Welcome to Linux!=20

=20

=C5=A1=EF=BF=BD=EF=BF=BD=EF=BF=BD=CD=95=EF=BF=BD=EF=BF=BDm=EF=BF=BD]: Can=
not add dependency job for unit display-manager.service,=20
ignoring: Uni t
  display-manager.service failed to load: No such file or directory. See=20
system logs an
          Expecting device dev-ttyPS0.device.....Wall Directory Watch..=20

[  OK  ] Reached target Remote File Systems.=20

[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.=20

[  OK  ] Listening on Delayed Shutdown Socket.ility Named Pipe.=20

[  OK  ] Listening on udev Kernel Socket.ests to Console Directory=20
Watch..
[  OK  ] Listening on udev Control Socket.t.=20

=C5=A1=EF=BF=BD=EF=BF=BD=EF=BF=BD=CD=95=EF=BF=BD=EF=BF=BDm=EF=BF=BD]: Set=
 up automount Arbitrary Executable File Formats File=20
System Automount  P
[  OK  ] Reached target Swap.=20

[  OK  ] Listening on Journal Socket.=20

          Mounting Temporary Directory.....=20

          Starting Remount Root and Kernel File Systems.....=20

          Starting Load Kernel Modules......=20

EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)=20

          Mounting Debug File System......=20






