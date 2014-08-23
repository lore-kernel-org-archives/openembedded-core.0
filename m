Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E5EE070F3F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Aug 2014 11:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7NBBGh1015917; Sat, 23 Aug 2014 12:11:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id P1Egjigm0A-X; Sat, 23 Aug 2014 12:11:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7NBBDXJ015913
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 23 Aug 2014 12:11:14 +0100
Message-ID: <1408792274.5457.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Richard Tollerton <rich.tollerton@ni.com>
Date: Sat, 23 Aug 2014 12:11:14 +0100
In-Reply-To: <7db18f933460f111085749ee49a70796eab4068a.1408742574.git.rich.tollerton@ni.com>
References: <cover.1408742574.git.rich.tollerton@ni.com>
	<7db18f933460f111085749ee49a70796eab4068a.1408742574.git.rich.tollerton@ni.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: otavio@ossystems.com.br, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 09/12] udev-cache: get system config immediately before cache
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
X-List-Received-Date: Sat, 23 Aug 2014 11:11:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-08-22 at 16:30 -0500, Richard Tollerton wrote:
> The system device configuration -- /proc/devices, /proc/cmdline, etc. --
> and the contents of /dev must be stored as simultaneously as possible.
> Otherwise, hotplug events could be processed between the time we get the
> system config and the time we archive /dev, and the udev cache may be
> incorrect.
> 
> To solve this, update the cached system configuration inside the
> udev-cache initscript, not the udev initscript. Also, run it before
> archiving /dev, because it should execute nearly instantaneously.
> 
> We still need to compute the system configuration inside the udev
> initscript, to detect if it changed, so refactor it into a new function
> sysconf_cmd(). This also allows administrators to modify it for
> machine-specific requirements.
> 
> Evaluating the system configuration requires a shell function
> readfiles() defined in the udev initscript. The only salient differences
> between readfiles() and just using `cat` directly are a) readfiles()
> skips files without error if they don't exist, which is necessary
> because /proc/atags is in CMP_FILE_LIST but does not exist on all
> targets; and b) input lines are concatenated into an output shell
> variable with newlines stripped. (a) can be eliminated by not including
> /proc/atags in CMP_FILE_LIST if it doesn't exist. (b) is O(n^2) anyway,
> and makes $NEWDATA, $OLDDATA etc. very hard to read, and we don't need
> to strip newlines anyway. So make sysconf_cmd() use `cat` and remove
> readfiles().

The reason this was done was actually c) avoid having to execute cat as
a new process.

> Instead of storing system configuration in shell variables ($NEWDATA,
> $OLDDATA), store them directly in files: redirect to $SYSCONF_TMP
> instead of storing in $NEWDATA; read from $SYSCONF_CACHED directly
> instead of reading it into $OLDDATA. This turns comparing $NEWDATA vs.
> $OLDDATA into a call to `cmp`. However, busybox lacks `cmp -q`, so
> instead, redirect cmp's output to /dev/null.

The above reason c) is also why we don't use cmp. It turned out to be
faster to read into a variable than fork/exec cmp.

Cheers,

Richard


