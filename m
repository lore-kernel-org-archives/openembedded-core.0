Return-Path: <andrej.valek@siemens.com>
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id A533F719C8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 11:56:35 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id v94BuRit028848
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 4 Oct 2017 13:56:27 +0200
Received: from [192.168.253.100] ([163.242.56.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id v94BuR8J012098
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Oct 2017 13:56:27 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <1507045133-16665-1-git-send-email-andrej.valek@siemens.com>
	<CAJ86T=Xh4HZO8e-u6r9gn0nCx+ZbzkjV+AJOP3-Cgt1fF3xr7w@mail.gmail.com>
	<bb590f7b-67d0-f106-785f-9f4ecf3127a0@siemens.com>
	<CAJTo0Lb-QW_zHVs3eyGsVE6sXwBb9AwWDSFEhoe=EWMrCKF7uA@mail.gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <ba1bbc29-6515-e99f-be98-921ccd96c614@siemens.com>
Date: Wed, 4 Oct 2017 13:56:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb-QW_zHVs3eyGsVE6sXwBb9AwWDSFEhoe=EWMrCKF7uA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] busybox updating
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
X-List-Received-Date: Wed, 04 Oct 2017 11:56:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I have unpacked the rpm package over command "rpm -qp --scripts
busybox-1.27.2-r0.i586.rpm" and links to /bin/sh looks good for me.

update-alternatives --install /bin/sh sh /bin/busybox.nosuid 50


>   chrt
>   cttyhack
>   init
>   mdev
>   setsid
>   partprobe

You have right, there was a mistake. These applets are disabled in
defconfig, so they are not installed.

Only lzcat, xzcat and nproc are new.

Regards,
Andrej

On 10/04/2017 12:15 PM, Burton, Ross wrote:
> On 4 October 2017 at 07:20, Andrej Valek <andrej.valek@siemens.com 
> <mailto:andrej.valek@siemens.com>> wrote:
> 
>     I have compared no/suid links between these versions. So, I was trying
>     to enable the same applets like in older version and do not enable the
>     new one. Some applets could not be disabled (they are automatically
>     enabled) due to dependencies.
> 
>     For this version of defconfig the new applets are:
>     chrt
>     cttyhack
>     init
>     lzcat
>     mdev
>     nproc
>     setsid
>     xzcat
>     partprobe
> 
> 
> This doesn't quite match what I'm seeing by comparing old and new links in the 
> postinst:
> 
> $ diff then now
> 44c44,45
> < update-alternatives --install /bin/sh sh /bin/busybox.nosuid 50
> ---
>  > update-alternatives --install /bin/sh sh /bin/busybox.suid 50
>  > update-alternatives --install /bin/sh sh /bin/busybox.suid 50
> 122a124
>  > update-alternatives --install /usr/bin/lzcat lzcat /bin/busybox.nosuid 50
> 128a131
>  > update-alternatives --install /usr/bin/nproc nproc /bin/busybox.nosuid 50
> 167a171
>  > update-alternatives --install /usr/bin/xzcat xzcat /bin/busybox.nosuid 50
> 
> Note the two lines installing an alternative of /bin/sh to busybox.suid.
> 
> Assuming they should have alternative links installed, the following applets are 
> still disabled too:
> 
>   chrt
>   cttyhack
>   init
>   mdev
>   setsid
>   partprobe
> 
> Ross
> 

