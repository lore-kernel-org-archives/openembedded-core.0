Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 72E726E791
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 10:14:49 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id n12so7761933wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 02:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=zAPt9qSPOePFS/5JBMikXUeOdZ8BiaLXnyhOgDs6w6E=;
	b=dlcN2yd2vBa3qGAxIZH7YnCpHjZvnLiCL4UoyoYC3JiJpi76MgEYRPse2D5I/DaVlh
	keOZ5CavhZesWSGNID1P0j5QgdqN1jF/YFgh7vphigvV5PQOtTTXNht+cIVqf5W6x5Ig
	l9vcEZdqXq+MnTGS9rsFQsohrppoaqmF92K5XJXtAwFudc04bVhdUEN9+GmWYLj2yLBg
	jQJ/PEsggeVBUWPmA1RSqze4skVIxaBUXyX8SHY698SCWlFg6aA5yzLAjcXZPh6DKuRU
	534u12DnMVhR6JoT7fXvblDZM5+TE1WWge66xFV5sq2tOfcVGYNorU5b40sPQa21Bl4U
	qhzg==
X-Gm-Message-State: ALoCoQmuPiKNCrBPhiY1526zed96IzxXbZilv50RHiGZoOA60po2x3r5l0y54mugwb6sOqMLZGzV
X-Received: by 10.194.62.243 with SMTP id b19mr462708wjs.63.1390990489778;
	Wed, 29 Jan 2014 02:14:49 -0800 (PST)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id f7sm3775952wjb.7.2014.01.29.02.14.48
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 Jan 2014 02:14:48 -0800 (PST)
Message-ID: <52E8D497.1080708@dresearch-fe.de>
Date: Wed, 29 Jan 2014 11:14:47 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1390833588.17424.254.camel@ted>
In-Reply-To: <1390833588.17424.254.camel@ted>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Wed, 29 Jan 2014 10:14:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 27.01.2014 15:39, Richard Purdie wrote:
> Its rather sad that people don't appear to read local.conf and then complain
> about slow builds when they're just using a single thread. Most systems have
> more than one core now so we might as well use a more automatic default
> for these values. This may lead to better experiences for new users.
> 
> [YOCTO #2528]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 71856b8..36d33e1 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -18,12 +18,18 @@
>  # option determines how many tasks bitbake should run in parallel:
>  #
>  #BB_NUMBER_THREADS ?= "4"
> +#
> +# Default to setting automatically based on cpu count
> +BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
>  # 
>  # The second option controls how many processes make should run in parallel when
>  # running compile tasks:
>  #
>  #PARALLEL_MAKE ?= "-j 4"
>  #
> +# Default to setting automatically based on cpu count
> +PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
> +#
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>  # be appropriate for example.

On our Fedora-18 build host this change leads to the following exception. :(

----------------------> snip <-------------------------
Loading cache...done.
Loaded 2167 entries from dependency cache.

Parsing recipes...done.
Parsing of 1729 .bb files complete (1727 cached, 2 parsed). 2168 targets, 85 skipped, 1 masked, 0 errors.

NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.20.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-18"
TARGET_SYS        = "arm-angstrom-linux-gnueabi"
MACHINE           = "hikirk"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2013.12"
TUNE_FEATURES     = "armv5 thumb dsp"
TARGET_FPU        = "soft"
meta-hipos        = "(nobranch):6f2ad6754c9c9ddd6f1c5505e584e0eb62cfcf83"
meta-hipos-kirkwood = "(nobranch):1a43f75e217fea3c6b4493536b3b66945ce53921"
meta-hipos-fsl    = "(nobranch):ad3beec4157a96d0c506969a29d14f6354e7406f"
meta-fsl-arm      = "(nobranch):af392c22bf6b563525ede4a81b6755ff1dd2c1c6"
meta-fsl-arm-extra = "(nobranch):07ad83db0fb67c5023bd627a61efb7f474c52622"
meta-java         = "(nobranch):9dfb7ecb87e67052e94641d6e02907c582264217"
meta-angstrom     = "(nobranch):8fcd781b777a7a94f2b97514c9691a2b5c74eaf2"
meta-oe
meta-systemd
meta-multimedia
meta-networking
meta-efl
meta-gnome        = "(nobranch):eb4563b83be0a57ede4269ab19688af6baa62cd2"
meta              = "(nobranch):e86622a932bbd0acdea67ecfb15c8b06c27353d8"

NOTE: Preparing runqueue
ERROR: An uncaught exception occured in runqueue, please see the failure below:
ERROR: Running idle function
Traceback (most recent call last):
  File "/CACHE/jenkins-workspace/hipos/bitbake/lib/bb/runqueue.py", line 1111, in RunQueueExecuteScenequeue.__init__(rq=<bb.runqueue.RunQueue instance at 0x1534b2d8>):

    >        self.number_tasks = int(self.cfgData.getVar("BB_NUMBER_THREADS", True) or 1)
             self.scheduler = self.cfgData.getVar("BB_SCHEDULER", True) or "speed"
  File "/CACHE/jenkins-workspace/hipos/bitbake/lib/bb/data_smart.py", line 516, in DataSmart.getVar(var='BB_NUMBER_THREADS', expand=True, noweakdefault=False):
         def getVar(self, var, expand=False, noweakdefault=False):
    >        return self.getVarFlag(var, "_content", expand, noweakdefault)

  File "/CACHE/jenkins-workspace/hipos/bitbake/lib/bb/data_smart.py", line 606, in DataSmart.getVarFlag(var='BB_NUMBER_THREADS', flag='_content', expand=True, noweakdefault=False):
                     cachename = var + "[" + flag + "]"
    >            value = self.expand(value, cachename)
             if value is not None and flag == "_content" and local_var is not None and "_removeactive" in local_var:
  File "/CACHE/jenkins-workspace/hipos/bitbake/lib/bb/data_smart.py", line 344, in DataSmart.expand(s='${@oe.utils.cpu_count()}', varname='BB_NUMBER_THREADS'):
         def expand(self, s, varname = None):
    >        return self.expandWithRefs(s, varname).value

  File "/CACHE/jenkins-workspace/hipos/bitbake/lib/bb/data_smart.py", line 334, in DataSmart.expandWithRefs(s='${@oe.utils.cpu_count()}', varname='BB_NUMBER_THREADS'):
                 except Exception as exc:
    >                raise ExpansionError(varname, s, exc)

ExpansionError: Failure expanding variable BB_NUMBER_THREADS, expression was ${@oe.utils.cpu_count()} which triggered exception AttributeError: 'module' object has no attribute 'cpu_count'
----------------------> snip <-------------------------

Any ideas? A missing python package at the build host? ...?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

