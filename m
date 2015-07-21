Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A41CF734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 10:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6LAs1e5016987; Tue, 21 Jul 2015 11:54:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ncW9on-n5mWD; Tue, 21 Jul 2015 11:54:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6LAret5016901
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Jul 2015 11:53:54 +0100
Message-ID: <1437471860.821.63.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20150714142140.GC2184@jama>
References: <20150714142140.GC2184@jama>
Date: Tue, 21 Jul 2015 10:44:20 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: dbus-test no longer built for dbus-ptest after last bitbake changes
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
X-List-Received-Date: Tue, 21 Jul 2015 10:54:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-07-14 at 16:21 +0200, Martin Jansa wrote:
> I'm not 100% sure it's related to recent bitbake variable expansion
> changes, but my recent builds are failing with errors about
> dbus-ptest cannot be installed because dbus-test-ptest doesn't exist
> 
> ERROR: 
> Collected errors:
> 
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies
>  * for dbus-ptest:
> 
>  * 	dbus-test-ptest * 
> 
>  * opkg_install_cmd: Cannot install package dbus-ptest.
> 
> It's using a bit strange construct to add it to RDEPENDS:
> meta/recipes-core/dbus/dbus.inc:RDEPENDS_dbus-ptest_class-target =
> "dbus-test-ptest"
> 
> but checking cooker log shows that dbus-test
> (meta/recipes-core/dbus/dbus-test_1.8.18.bb) wasn't built at all, only
> dbus-test message is from opkg error and this QA error from dbus itself:
> 
> NOTE: recipe dbus-1.8.18-r0: task do_package_write_ipk: Started
> WARNING: QA Issue: dbus-ptest rdepends on dbus-test-ptest, but it isn't
> a build dependency? [build-deps]
> 
> Any ideas?

I've confirmed this is a bug in the bitbake data store changes. The fix
is to replace a copy.copy() with a copy.deepcopy(). I'll sort out
patches as soon as I can although I'm travelling a bit this week. Also
need to write a testcase for it.

Cheers,

Richard


