Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SH6rF-0007ol-Vn
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 07:09:42 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 08 Apr 2012 22:00:24 -0700
Received: by pbcuo15 with SMTP id uo15so15698654pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Apr 2012 22:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=9P2+KltPdIGv+6G6ffwNxdWrchBQEeIMzvfOLvbj9wo=;
	b=KdhKiLAhOxe074p3vrmoFOWxuCV8KLJHx4LRhcNAOvwZvSvhx8c9Y+eZZkS2/D85sP
	Y3LctNhEN1rtAhMxDbwKF8U6zIFXFXgb3H497N0il3xaOJTjdpsZkdqfsV+mIQ+IpJZ4
	QPJqJmC2GhefrisCezck3DHPRox9R0GSJzIuKwpiLMuAOek2ylp6w6mIF7dxRwfS0CJF
	XqJ5vs+aoN4CRhf2qPaMas2bNKJV8RdeS3m1Mt41qeQu2LUhojePZ+xXBrOos+6tlKRO
	eg2MZZ6eA1wzxppauc0wpR+KW/aPOZo9qMMPF28zraYP2Ypi/iArxW3+KAeS7iVXeP0p
	jj7Q==
Received: by 10.68.219.226 with SMTP id pr2mr16529906pbc.66.1333947624609;
	Sun, 08 Apr 2012 22:00:24 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id st4sm9582170pbc.51.2012.04.08.22.00.22
	(version=SSLv3 cipher=OTHER); Sun, 08 Apr 2012 22:00:23 -0700 (PDT)
Message-ID: <4F826CEE.9040107@intel.com>
Date: Sun, 08 Apr 2012 22:00:30 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1333695164.git.scott.a.garman@intel.com>
	<4F80D4EF.8090704@linux.intel.com>
In-Reply-To: <4F80D4EF.8090704@linux.intel.com>
X-Gm-Message-State: ALoCoQk7Y4RF4cGmN62X0D453I+0ZoL8Bz1pOWRwX1Y4rTVyXPuevyV5isiXEvX7xG8CqVLVZBUI
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] shadow-native: disable logging to syslog
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
X-List-Received-Date: Mon, 09 Apr 2012 05:09:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2012 04:59 PM, Saul Wold wrote:
> On 04/05/2012 11:53 PM, Scott Garman wrote:
>> Hello,
>>
>> This pull request includes a patch to shadow to disable logging to
>> syslog, to prevent sysroot user and group additions from writing
>> entries to the host's syslog.
>>
>> I have build-tested this with core-image-sato (which builds a few
>> useradd-based recipes, such as avahi and dbus) for all 5 of our
>> qemu architectures, while watching my syslog to verify that no
>> useradd or groupadd entries were written.
>>
>
> With this patch applied, the following error was seen on the AB:
>
> | Running useradd commands...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | ERROR: tried running useradd command 10 times without success, giving up
>
> Check the AB here:
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/369/steps/shell_19/logs/stdio

Hi Saul,

The syslog disable patch cannot trigger this error, I'm pretty certain 
you have encountered another problem.

The useradd class now uses code which checks that the user account or 
group account was created in the passwd and group files, respectively. 
If the account was not created (which is verified via a grep command), 
the script sleeps for 1 second and tries again, up to 10 times. This is 
intended to avoid lockfile races, as useradd and groupadd lock the 
passwd and group files when creating accounts.

It seems extremely unlikely that the passwd file was locked for a full 
10s worth of attempts to access it. I also see from the logs that the 
base-passwd package was installed before this error was encountered, 
which *should* rule out the possibility that the useradd command was 
failing because /etc/passwd didn't exist yet.

Later useradd commands are also failing in this manner, which makes me 
suspect that something is wrong with the /etc/passwd file in this image. 
The groupadd commands, on the other hand, are succeeding without any 
retries.

So it would be helpful for me to know answers to the following:

Was this a build from scratch or from sstate?

Is this problem reproducible? (I'm starting a build from scratch 
overnight on my end)

What does the etc/passwd file in this image look like?

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


