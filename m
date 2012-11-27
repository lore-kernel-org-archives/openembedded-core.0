Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1TdVXw-00049y-3a
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 01:30:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qARM4C2M002125
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2012 14:04:16 -0800 (PST)
Received: from [128.224.147.212] (128.224.147.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 27 Nov 2012 14:04:13 -0800
Message-ID: <50B5380F.4030401@windriver.com>
Date: Tue, 27 Nov 2012 17:00:47 -0500
From: Aws Ismail <aws.ismail@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: jhuang0 <jackie.huang@windriver.com>
References: <cover.1353564658.git.jackie.huang@windriver.com>
	<6ef7001b467caa7cebe92e399a94a9680265efb8.1353564658.git.jackie.huang@windriver.com>
	<CAJTo0LYHjhAfak4gFoRWeo+R7g86P9q4rgmWreAnOosr0A+a-Q@mail.gmail.com>
	<50B426C4.3020108@windriver.com>
In-Reply-To: <50B426C4.3020108@windriver.com>
Cc: saul.wold@intel.com, Shiqun.Lin@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] pulseaudio: fix compilation on RHEL-5.8 64bit machine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: aws.ismail@windriver.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 00:30:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2012 09:34 PM, jhuang0 wrote:
>
>
> On 11/22/2012 4:55 PM, Burton, Ross wrote:
>> Hi,
>>
>> This patch is too hacky to go in at the moment.
>
> Hi Ross,
>
> Thanks for your comments, in fact the patch was for a weird edge case 
> in the old version, I looked for the history and it seemed to be added 
> as a workaround. And I tried some days but couldn't reproduce the issue
> in current pulseaudio 2.1, so I shouldn't have send this, sorry about 
> that.
>
> Aws, please correct me if I'm wrong, thanks!
Agreed. This was a quick fix for a very specific case. If you can 
confirm that it is not there anymore, which, by the looks of it, seems 
that you have done; then let's get rid of it.

Thanks Jackie.

Aws\
>
> Thanks,
> Jackie
>
>>
>> On 22 November 2012 06:46,  <jackie.huang@windriver.com> wrote:
>>> ../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined 
>>> reference to `XRRGetOutputInfo'
>>
>> Which means your GTK+ linkage is broken, because libgdk should be
>> linking to libXrandr.  Mine is, can you verify that yours is too?
>>
>>> +-AM_LDADD = $(PTHREAD_LIBS) $(INTLLIBS)
>>> ++AM_LDADD = $(PTHREAD_LIBS) $(INTLLIBS) -lXrandr
>>
>> You're adding linkage to libXrandr to every part of PulseAudio. What
>> binary in pulseaudio is failing to compile with this error?
>>
>>> -DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
>>> +DEPENDS += "libjson gdbm speex libxml-parser-perl-native \
>>> +  ${@base_contains('DISTRO_FEATURES', 'x11', 'libxrandr', '', d)}"
>>
>> pulseaudio.inc has:
>>
>> DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 
>> libtool \
>>             ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11
>> libxtst libice libsm libxcb gtk+', '', d)}"
>>
>> As gtk+ pulls in libxrandr, this is redundant.
>>
>> Ross
>>
>>
>


-- 



