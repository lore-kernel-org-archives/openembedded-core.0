Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1Ue3yu-0003v8-3Y
	for openembedded-core@lists.openembedded.org;
	Sun, 19 May 2013 15:49:14 +0200
Received: by mail-pb0-f54.google.com with SMTP id ro8so4588675pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 06:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=63k4NLnRtfHbWOQZkXR6FC3klFH3EyFR+ClEOwVuxg0=;
	b=QbQ3eq7WBA1PMvy4OqRllUOrQKHZPzErbBZpImJwomD7gw6vY3WZv0ZLa4RU6MAuIE
	ORqSR09CAJZFJ85S3Hsh9jFUuZLb6vSBakmDGoktvDJIVe0AjK5ChefgmPlGy3imdnHa
	UuwB98KJUR7Y4CXx7jfCHK0aQwbdhJdePfm8FCXcZdMC3f/ls2OoebiIIhSLHkY7fgLi
	L/amymEFwF62VsOWTCZ/pDoT9UF6VS654pMpEmBL5DPDEthEeBWkp8GEsVPpO7evd39C
	owc/vfRb7r34VHMc+dPVpEh6cjaOpabgEdLRmXoEaF58dBGpKYexk2bMy4j7mQivsJuc
	CUuw==
X-Received: by 10.66.159.234 with SMTP id xf10mr56985830pab.203.1368970240753; 
	Sun, 19 May 2013 06:30:40 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	uv1sm19738545pbc.16.2013.05.19.06.30.38 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 19 May 2013 06:30:39 -0700 (PDT)
Message-ID: <5198D2E0.1050705@gmail.com>
Date: Sun, 19 May 2013 23:25:52 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1368417521-9219-1-git-send-email-net147@gmail.com>
	<CAJTo0Las4vi+firZWYxq22uSrGUmeZTG8eQSX+cADXLFiV3D+w@mail.gmail.com>
In-Reply-To: <CAJTo0Las4vi+firZWYxq22uSrGUmeZTG8eQSX+cADXLFiV3D+w@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: add /run to dirs755 for systemd
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
X-List-Received-Date: Sun, 19 May 2013 13:49:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2013 8:53 PM, Burton, Ross wrote:
> On 13 May 2013 04:58, Jonathan Liu <net147@gmail.com> wrote:
>> The /run directory needs to exist when using systemd otherwise startup
>> fails with the following error:
>> systemd[1]: Failed to mount /run: No such file or directory
> This is a genuine bug, but I'm not convinced it is the whole fix.
> What about non-systemd images?  /run is meant to be a tmpfs, which is
> why udev installs a volatile link from /run to /var/run.  If we create
> a directory in sysvinit cases, we'll also need to mount a tmpfs on it.
>
> The FHS 3 draft specification actually ratifies /run[1] so we could
> take this advantage to start cleaning up our volatile layout in /var.
> Start by always creating /run in base-files, and always mounting it as
> tmpfs in fstab for the non-systemd case.  Then we can symlink /var/run
> to /run, /var/lock to /run/lock, and so on.
I have submitted a more complete patch for your review.
> Ross
>
> [1] http://www.linuxbase.org/betaspecs/fhs/fhs.html#runRuntimeVariableData
Regards,
Jonathan


