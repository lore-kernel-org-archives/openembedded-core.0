Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DC27373173
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 15:35:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2016 08:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,345,1455004800"; d="scan'208";a="765368943"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 16 Mar 2016 08:35:45 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id D53206A4006; Wed, 16 Mar 2016 09:23:30 -0700 (PDT)
Received: from 10.252.1.171 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Wed, 16 Mar 2016 18:23:30 +0200 (EET)
Message-ID: <56781.10.252.1.171.1458145410.squirrel@linux.intel.com>
In-Reply-To: <CALbNGRQwKQpougA7Jus51MKUsC=TmAiqf0mptLUebeodsB6_yA@mail.gmail.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<15c0b6ce47e45b3be9db55c6b32bb2830766e932.1457535622.git.alexander.kanavin@linux.intel.com>
	<CALbNGRSZXjynMUy2B3Ke9k4g=DwFnhb2eO=xpJj4fGXHT2HBMw@mail.gmail.com>
	<56E8315D.2080906@linux.intel.com>
	<CAMKF1srbyaUBZO0Lu49x0FKoZR+-6CQcMX6h5ze8r4z9Yu6oHw@mail.gmail.com>
	<53372.10.252.1.171.1458080995.squirrel@linux.intel.com>
	<CALbNGRQwKQpougA7Jus51MKUsC=TmAiqf0mptLUebeodsB6_yA@mail.gmail.com>
Date: Wed, 16 Mar 2016 18:23:30 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: Andreas =?iso-8859-1?Q?M=C3=BCller?= <schnitzeltony@googlemail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/24] python3-native: use the previous version of python-config script
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
X-List-Received-Date: Wed, 16 Mar 2016 15:35:48 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> Apologies for being terse. I should've explained that when building
>> recipes that make use of this script, it will be run with the native
>> python (instead of host python) because native python will come first in
>> the PATH, and so the version reported will be correct, because native
>> python will match target python. This is set up in pythonnative.bbclass
>> for python 2, and in python3native.bbclass for python 3.
> Sorry but I don't get it: The script reports the version of host's
> python which might be different from what we are building native and
> cross. When something is trying to link against python libs and is
> using this script this crashes for host's with python < 3.5. This is a
> bug. It should be either corrected or using of pkg-config should be
> enforced if possible.

The script reports the version of the host python, because you are running
it with the host python. If you run it with the native python, it will
report version of the native python. All recipes that need to execute
python code as a part of their build are doing that, and therefore are
getting the correct version. Where is the bug here? Can you demonstrate
it? (by something else than running the script using host python,
obviously)

I agree that we should generally get rid of such custom,
separately-maintained configuration scripts and migrate everything to
pkgconfig, but that is a separate issue.

> By the way: What was wrong with the shell script exactly? We have used
> it for long time and it reported the correct version.

The shell script was introduced with Python 3.4. All previous versions of
python, including python 2.x, are using a different, python-based version
of the script, to which we do some patching so that it reports things
correctly in our cross-compilation environment. [1]

The problem with the shell script is that it lacks those tweaks, and
things break down when you try to build python3-based software with it.
Specifically, I ran into issues building pygobject 3.x, and after trying
to fix the shell script, I gave up and reverted to tried and tested
python-based version - which is what this patch does. I believe the
problem wasn't noticed earlier, because prior to pygobject 3.x there was
no other python3-based software using python-config.

Now you need to be exact: where and how did you use the shell script for a
long time? Why should oe-core start using it, if it's known to be broken
and requires patching?

Alex

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/python-config.patch


