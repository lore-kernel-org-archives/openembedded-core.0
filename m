Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2DB6E717
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 15:06:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Jan 2014 07:06:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,700,1384329600"; d="scan'208";a="470748231"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.47])
	([10.237.105.47])
	by orsmga002.jf.intel.com with ESMTP; 22 Jan 2014 07:06:08 -0800
Message-ID: <52DFDE73.1040201@intel.com>
Date: Wed, 22 Jan 2014 17:06:27 +0200
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20140108173801.GB3709@jama> <52DFB95F.5080206@intel.com>
	<52DFBE2C.2080209@intel.com> <20140122125724.GU4100@jama>
In-Reply-To: <20140122125724.GU4100@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Mesa: upgrade to 9.2.2
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
X-List-Received-Date: Wed, 22 Jan 2014 15:06:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2014 02:57 PM, Martin Jansa wrote:
> On Wed, Jan 22, 2014 at 02:48:44PM +0200, Valentin Popa wrote:
>> On 01/22/2014 02:28 PM, Valentin Popa wrote:
>>> On 01/08/2014 07:38 PM, Martin Jansa wrote:
>>>> Hi,
>>>>
>>>> since this patch:
>>>> commit 263e654e5d28fa7f6b0c8cc23f57a31448e88a40
>>>> Author: Valentin Popa <valentin.popa@intel.com>
>>>> Date:   Wed Oct 30 12:27:39 2013 +0200
>>>>
>>>>       Mesa: upgrade to 9.2.2
>>>>
>>>>       * License is still MIT
>>>>       * removed patches were already merged or
>>>>         another solution was backported.
>>>>
>>>> I have to define MESA_EGL_NO_X11_HEADERS in qtbase and qtwebkit again to
>>>> build them without xlib.h available (DISTRO without x11 in
>>>> DISTRO_FEATURES).
>>>>
>>>> Are you sure that
>>>> meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
>>>>
>>>> was resolved in upstream?
>>>>
>>>> Regards,
>>> Hi,
>>> Sorry for this late response,
>>> I removed that patch after testing wayland without X and worked.
>>> I've tried yesterday to build qtbase  (meta-qt5) to see exactly what's
>>> the problem and determine if indeed part of that patch has to be
>>> upstream, but it was failing for not finding libGL (which of course,
>>> we don't build with mesa when
>> I meant: libGL is not built together with the other mesa libraries when
>> DISTRO_FEATURES_remove="x11" .
>>> DISTRO_FEATURES_remove="x11". Just not having X11 in DISTRO_FEATURES
>>> doesn't mean you'll not have it).
>>> Can you please give me some info about your config vars or your
>>> environment so I find out what's the problem!? (I'm trying to
>>> reproduce the issue).
> Hi,
>
> I don't see how building libGL relates to this problem, which is more
that was my problem trying to build qtbase
> about mesa headers trying to include xlib.h which isn't available in
> sysroot for DISTRO without x11 DISTRO_FEATURE.
>
> Here is part of my discussion with Ross about this problem, let me know
> if it's enough for you to see what the problem is:
>
> 18:33 < JaMa> rburton: do you still maintain mesa in oe-core?
> 18:47 < rburton> JaMa: i guess :)
> 18:47 < JaMa> rburton: http://lists.openembedded.org/pipermail/openembedded-core/2014-January/088072.html
> 18:48 < JaMa> rburton: I know you were working with upstream on this, so maybe you have better info than Valentin
> 18:54 < RP> JaMa: you'd be better addressing your email to ross as valentin  is away for a few weeks
> 18:55 < JaMa> ah OK, I've used valentin as author of that commit
> 20:43 < rburton> JaMa:  oh, *that*.  noted, will re-open that can of worms tomorrow.
> 20:43 < rburton> the upstream solution was effectively "use pkgconfig"
> 20:59 < JaMa> hmm checking if .pc really has that flag :)
> 21:00 < JaMa> rburton: it's there for gl.pc, but not in gles*.pc, but that doesn't mean it has to be there
> 21:01 < JaMa> I need to check what that failing build was using in qtbase/qtwebkit
> 21:04 < rburton> JaMa: if you can mail the build log of what failed, that would be great
> 21:05 < JaMa> I'll have to simulate that with public layers first :)
> 21:05 < rburton> heh, yes :)
> 21:07 < JaMa> looking at qtbase/config.tests/x11/opengl/opengl.pro it just doesn't use pkg-config at all to read gl.pc
> 21:08 < JaMa> so as soon as  -DMESA_EGL_NO_X11_HEADERS was removed from mesa header it can try to load xlib.h
> 21:09 < rburton> that entire platform thing is mostly arse
> 21:10 < JaMa> somewhere in ./src/platformsupport/glxconvenience it loads some mesa header which in turn loads xlib.h and fails
> 21:10 < JaMa> http://patchwork.openembedded.org/patch/60673/ this is basically the same
>
> The conclusion is that if we cannot fix all apps to use pkgconfig when
> searching for mesa, can we restore rebased
> meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> to fix them automatically?
>

Nice reply, now I know what's the problem!
You are right, for an app that doesn't use pkgconfig this patch is a must .
I'll put the patch back.
Thanks !

