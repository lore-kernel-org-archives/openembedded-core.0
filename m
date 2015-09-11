Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 90DEE60053
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 20:16:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 11 Sep 2015 13:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,513,1437462000"; d="scan'208";a="787638930"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2015 13:16:09 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 71B5B6A4087; Fri, 11 Sep 2015 13:15:17 -0700 (PDT)
Received: from 10.252.58.194
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 11 Sep 2015 23:15:17 +0300 (EEST)
Message-ID: <64584.10.252.58.194.1442002517.squirrel@linux.intel.com>
In-Reply-To: <CAJTo0LYETBvMzwYDqNJGRpKhgG79TJBYg-psQdGi7fEqGHn0yg@mail.gmail.com>
References: <1441909087-3860-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAJTo0LYETBvMzwYDqNJGRpKhgG79TJBYg-psQdGi7fEqGHn0yg@mail.gmail.com>
Date: Fri, 11 Sep 2015 23:15:17 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Burton, Ross" <ross.burton@intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: add a new recipe for latest upstream version
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
X-List-Received-Date: Fri, 11 Sep 2015 20:16:14 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit




> This is now failing on qemumips for me:
....

| CMakeFiles/JavaScriptCore.dir/runtime/JSArray.cpp.o: In function
> `JSC::JSArray::push(JSC::ExecState*, JSC::JSValue)':
> |
> /data/poky-master/tmp/work/mips32r2-poky-linux/webkitgtk/2.8.5-r0/webkitgtk-2.8.5/Source/JavaScriptCore/runtime/JSArray.cpp:566:
> undefined reference to `void
> JSC::JSObject::putByIndexBeyondVectorLengthWithoutAttributes<(unsigned
> char)20>(JSC::ExecState*, unsigned int, JSC::JSValue)'
> | collect2: error: ld returned 1 exit status
> | Source/JavaScriptCore/CMakeFiles/JavaScriptCore.dir/build.make:14167:
> recipe for target 'lib/libjavascriptcoregtk-4.0.so.18.1.12' failed
>
> (similar failure on qemuppc too)

'git bisect' identified this as the reason:


3d81a56912fb2c6ca1c5aafb93cbc6e2cfea20b3 is the first bad commit
commit 3d81a56912fb2c6ca1c5aafb93cbc6e2cfea20b3
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Fri Sep 4 16:27:41 2015 +0100

    tcmode-default: Set gcc 5.2 as the default

    gcc 5.X is now working in all the places we test it in, its been in
    testing for quite some time. Time to make it the default (we have some
    room in M4 for any other bugfixes). Its easy to switch back to 4.9, we
    should really remove 4.8 at this point (to meta-oe?).

    (From OE-Core rev: 039211f0d8fe79d07b65f2f02e299b9656034214)

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

:040000 040000 e99162e4020b9b8b286c355c8afef5d63317c149
69db8e38223a0107e38e2a054a8b1b2b5dc6974d M      meta

Regards,
Alex

