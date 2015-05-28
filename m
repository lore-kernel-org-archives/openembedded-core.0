Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9C45473D6A;
	Thu, 28 May 2015 10:04:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 28 May 2015 03:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,512,1427785200"; d="scan'208";a="578116322"
Received: from ecurley-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.28.106])
	by orsmga003.jf.intel.com with ESMTP; 28 May 2015 03:04:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@intel.com>
Date: Thu, 28 May 2015 11:04:56 +0100
Message-ID: <1978636.L3ktc4a7s3@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <20150528084536.GB2383@jama>
References: <20150528084536.GB2383@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] State of bitbake world, Failed tasks 2015-05-27
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
X-List-Received-Date: Thu, 28 May 2015 10:05:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 28 May 2015 10:45:36 Martin Jansa wrote:
> This time without sstate-cache, so the list of QA issues should be
> almost complete (except recipes which fail to build or their
> dependencies failed to build)
> 
> http://www.openembedded.org/wiki/Bitbake_World_Status
> 
> == Failed tasks 2015-05-27 ==
> 
> INFO: jenkins-job.sh-1.3.1 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150528_084227.log
>...
> === common-x86 (1) ===
>     * /openembedded-core/meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb, do_compile

This seems to be related to gstreamer 0.10 removal; though it's QtWebkit that's
failing rather than Phonon:

| cd WebKit/qt/tests/ && /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/qmake2 -after              INCPATH+=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/freetype2 LIBS+=-L/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/lib /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/qt4-x11-free/4.8.6-r0/qt-everywhere-opensource-src-4.8.6/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pro -spec /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/qt4-x11-free/4.8.6-r0/qt-everywhere-opensource-src-4.8.6/mkspecs/linux-g++ -after  INCPATH+=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/freetype2 LIBS+=-L/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/lib -o Makefile.WebKit
| WARNING: (internal):1: Variable INCPATH is deprecated; use INCLUDEPATH instead.
| WARNING: (internal):3: Variable INCPATH is deprecated; use INCLUDEPATH instead.
| WARNING: (internal):1: Variable INCPATH is deprecated; use INCLUDEPATH instead.
| WARNING: (internal):3: Variable INCPATH is deprecated; use INCLUDEPATH instead.
| WARNING: (internal):1: Variable INCPATH is deprecated; use INCLUDEPATH instead.
| WARNING: (internal):3: Variable INCPATH is deprecated; use INCLUDEPATH instead.
| WARNING: (internal):1: Variable INCPATH is deprecated; use INCLUDEPATH instead.
| WARNING: (internal):3: Variable INCPATH is deprecated; use INCLUDEPATH instead.
| WARNING: (internal):1: Variable INCPATH is deprecated; use INCLUDEPATH instead.
| WARNING: (internal):3: Variable INCPATH is deprecated; use INCLUDEPATH instead.
| Project ERROR: Package gstreamer-app-0.10 not found
| make[1]: *** [WebCore/Makefile.WebKit] Error 2
| make[1]: *** Waiting for unfinished jobs....
| Project ERROR: Package gstreamer-app-0.10 not found
| make[1]: *** [WebKit/qt/Makefile.WebKit.QtWebKit] Error 2
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/qt4-x11-free/4.8.6-r0/qt-everywhere-opensource-src-4.8.6/src/3rdparty/webkit/Source'
| make: *** [sub-webkit-make_default-ordered] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/qt4-x11-free/4.8.6-r0/temp/log.do_compile.14903)

Alex, can you take a look at this?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

