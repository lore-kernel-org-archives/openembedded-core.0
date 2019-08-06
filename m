Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id AEE5A7F3B6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 23:14:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 16:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="202984959"
Received: from jchan1-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.68.210])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2019 16:14:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 07 Aug 2019 11:14:20 +1200
Message-ID: <3053753.Zs8syfq2pI@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <CANNYZj83RCwo3mtTkRxnyN45pi4qCg5ifrihWcyhQuk+0arZxA@mail.gmail.com>
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
	<8d33f7f60b0fb8394b459ed4c43e9f21d844b269.camel@linuxfoundation.org>
	<CANNYZj83RCwo3mtTkRxnyN45pi4qCg5ifrihWcyhQuk+0arZxA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 5/9] python-setuptools: update to 41.0.1
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
X-List-Received-Date: Tue, 06 Aug 2019 23:14:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex,

On Thursday, 25 April 2019 4:20:40 AM NZST Alexander Kanavin wrote:
> On Wed, 24 Apr 2019 at 18:02, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > I think this breaks buildhistory.
> >
> > The autobuilder runs:
> >
> > '/home/pokybuild/yocto-worker/qemuppc/yocto-autobuilder-helper/scripts/collect-results', '/home/pokybuild/yocto-worker/qemuppc/build/build', '/srv/autobuilder/autobuilder.yoctoproject.org/pub/non-release/20190424-4/testresults', 'qemuppc'
> >
> > which results in a call like:
> >
> > /home/pokybuild/yocto-worker/qemuppc/build/build/../scripts/buildhistory-diff -p /home/pokybuild/yocto-worker/qemuppc/build/build/buildhistory ab-fetchrev
> >
> > which results in a comparision between:
> >
> >...
> >
> > which trips over:
> >
> > '/opt/poky/2.7+snapshot/sysroots/i686-pokysdk-linux/usr/lib/python3.7/site-packages/setuptools/script (dev).tmpl'
> >
> > and results in:
> >
> > Traceback (most recent call last):
> >   File "/home/pokybuild/yocto-worker/qemuppc/build/build/../scripts/buildhistory-diff", line 139, in <module>
> >     main()
> >   File "/home/pokybuild/yocto-worker/qemuppc/build/build/../scripts/buildhistory-diff", line 132, in main
> >     out = str(chg)
> >   File "/home/pokybuild/yocto-worker/qemuppc/build/meta/lib/oe/buildhistory_analysis.py", line 67, in __str__
> >     return self._str_internal(True)
> >   File "/home/pokybuild/yocto-worker/qemuppc/build/meta/lib/oe/buildhistory_analysis.py", line 133, in _str_internal
> >     depvera = bb.utils.explode_dep_versions2(self.oldvalue, sort=False)
> >   File "/home/pokybuild/yocto-worker/qemuppc/build/bitbake/lib/bb/utils.py", line 231, in explode_dep_versions2
> >     raise VersionStringException('Invalid version specification in "(%s" - invalid or missing operator' % i)
> >
> > This doesn't block the upgrade but it does need a bug and for us to
> > figure out some way of improving bb.utils.explode_dep_versions2 to
> > handle this better.
> 
> It seems as though the parser for package dependency lists is called
> on a plain file list, which should not be happening at all (as
> obviously files are allowed to have just about anything in their
> names). I'll look into it closer.

Did you get anywhere with this?

FYI I filed a bug for the issue:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=13467

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



