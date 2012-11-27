Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TdBEL-0004Qz-Eo
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 03:49:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAR2YlYK004410
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Nov 2012 18:34:47 -0800 (PST)
Received: from [128.224.162.208] (128.224.162.208) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Mon, 26 Nov 2012 18:34:46 -0800
Message-ID: <50B426C4.3020108@windriver.com>
Date: Tue, 27 Nov 2012 10:34:44 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, <aws.ismail@windriver.com>
References: <cover.1353564658.git.jackie.huang@windriver.com>
	<6ef7001b467caa7cebe92e399a94a9680265efb8.1353564658.git.jackie.huang@windriver.com>
	<CAJTo0LYHjhAfak4gFoRWeo+R7g86P9q4rgmWreAnOosr0A+a-Q@mail.gmail.com>
In-Reply-To: <CAJTo0LYHjhAfak4gFoRWeo+R7g86P9q4rgmWreAnOosr0A+a-Q@mail.gmail.com>
Cc: saul.wold@intel.com, Shiqun.Lin@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] pulseaudio: fix compilation on RHEL-5.8 64bit machine
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
X-List-Received-Date: Tue, 27 Nov 2012 02:49:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/22/2012 4:55 PM, Burton, Ross wrote:
> Hi,
>
> This patch is too hacky to go in at the moment.

Hi Ross,

Thanks for your comments, in fact the patch was for a weird edge case in 
the old version, I looked for the history and it seemed to be added as a 
workaround. And I tried some days but couldn't reproduce the issue
in current pulseaudio 2.1, so I shouldn't have send this, sorry about that.

Aws, please correct me if I'm wrong, thanks!

Thanks,
Jackie

>
> On 22 November 2012 06:46,  <jackie.huang@windriver.com> wrote:
>> ../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRGetOutputInfo'
>
> Which means your GTK+ linkage is broken, because libgdk should be
> linking to libXrandr.  Mine is, can you verify that yours is too?
>
>> +-AM_LDADD = $(PTHREAD_LIBS) $(INTLLIBS)
>> ++AM_LDADD = $(PTHREAD_LIBS) $(INTLLIBS) -lXrandr
>
> You're adding linkage to libXrandr to every part of PulseAudio.  What
> binary in pulseaudio is failing to compile with this error?
>
>> -DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
>> +DEPENDS += "libjson gdbm speex libxml-parser-perl-native \
>> +  ${@base_contains('DISTRO_FEATURES', 'x11', 'libxrandr', '', d)}"
>
> pulseaudio.inc has:
>
> DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool \
>             ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11
> libxtst libice libsm libxcb gtk+', '', d)}"
>
> As gtk+ pulls in libxrandr, this is redundant.
>
> Ross
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


