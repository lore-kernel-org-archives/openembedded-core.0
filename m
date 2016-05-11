Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 08E3A700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 21:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4BLoOcC031932; Wed, 11 May 2016 22:50:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id y2odIcYsTIzZ; Wed, 11 May 2016 22:50:24 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4BLYg3e031768
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 May 2016 22:34:44 +0100
Message-ID: <1463002482.21831.291.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 22:34:42 +0100
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 00/16] Simplify how to stage directories in the sysroot
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
X-List-Received-Date: Wed, 11 May 2016 21:50:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-05-11 at 19:27 +0200, Peter Kjellerstedt wrote:
> The first commit in this set makes it possible to specify the
> directories that will be staged in the sysroot via variables rather
> than hardcoding it in sysroot_stage_dirs(). This should make it a lot
> easier to add/remove directories to stage.
> 
> The rest of the commits just change recipes to take advantage of the
> new variables.
> 
> Because of the following if statement in sysroot_stage_dirs():
> 
> 	if [ "${BUILD_SYS}" = "${HOST_SYS}" ]; then
> 
> I have split the list of directories into SYSROOT_DIRS and
> SYSROOT_DIRS_NATIVE, where the latter is included if that if
> statement
> is true. I am not sure when that statement is true (my understanding
> is that it should be true for native builds, but I am not sure if it
> is also true for other builds like cross, nativesdk, etc). If it is
> only true for native builds then that if statement could be removed,
> and the SYSROOT_DIRS_NATIVE variable could be replaced by
> SYSROOT_DIRS_append_class-native...

It matches binaries that can run on the build system so it needs to
match native and cross. Something like:

SYSROOT_DIRS_append_class-native = "${SYSROOT_DIRS_NATIVE}"
SYSROOT_DIRS_append_class-cross = "${SYSROOT_DIRS_NATIVE}"

I hadn't realised how much duplication there was in that class. Cleanup
I'd never gotten around to doing. I guess most people don't even
remember how we ended up with that code or the horrors of do_stage
functions :)

Cheers,

Richard


