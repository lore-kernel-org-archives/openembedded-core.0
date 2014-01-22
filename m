Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3130B6E786
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:52:12 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id n16so533138oag.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=nIUhURD3I0qWp2WM804cnQ0XMqg+PCIoICPcdvpwpQw=;
	b=ISj8RleSECBTxwbXjX4e85JEtdHNjg/misoEZoZFR7qxc9HActz+jt/jjF5rnnfyVC
	L+b7SbkXpc5K1q1YEEEinz1CFeLNfl3MwflWCQ1e2kMD7szGmsCtnV2xrzzV70D+9Krt
	ZZNTep7vxFpf1/gbzgDEtJTPQiTO3D+2rh4o4+D+Q6yN0Ig0wBXjlcUyNpg03oyBnX1M
	djiUVX5Yfa/Zt0RCRhu6h39FstdirJRFH3cCNEFknHEBCntqQiQ4kXBf5vGElHaFnCTF
	rLhu8qzn9u76yWCnOiLKerzcbNc7cfa2MYQBNMztWOzutT4W8dPdedqmrON4E7H8bk4X
	Pf9Q==
MIME-Version: 1.0
X-Received: by 10.182.233.77 with SMTP id tu13mr1624558obc.58.1390402332792;
	Wed, 22 Jan 2014 06:52:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:52:12 -0800 (PST)
In-Reply-To: <20140122125724.GU4100@jama>
References: <20140108173801.GB3709@jama> <52DFB95F.5080206@intel.com>
	<52DFBE2C.2080209@intel.com> <20140122125724.GU4100@jama>
Date: Wed, 22 Jan 2014 12:52:12 -0200
X-Google-Sender-Auth: XL9Q9flG61stzPgyeK59hQ94BJI
Message-ID: <CAP9ODKrRV=AMOeGhUmJ6jGj=hxqGowpAm+fNio-+od5wd-mkug@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 22 Jan 2014 14:52:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 22, 2014 at 10:57 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Jan 22, 2014 at 02:48:44PM +0200, Valentin Popa wrote:
>> On 01/22/2014 02:28 PM, Valentin Popa wrote:
>> > On 01/08/2014 07:38 PM, Martin Jansa wrote:
>> >> Hi,
>> >>
>> >> since this patch:
>> >> commit 263e654e5d28fa7f6b0c8cc23f57a31448e88a40
>> >> Author: Valentin Popa <valentin.popa@intel.com>
>> >> Date:   Wed Oct 30 12:27:39 2013 +0200
>> >>
>> >>      Mesa: upgrade to 9.2.2
>> >>
>> >>      * License is still MIT
>> >>      * removed patches were already merged or
>> >>        another solution was backported.
>> >>
>> >> I have to define MESA_EGL_NO_X11_HEADERS in qtbase and qtwebkit again to
>> >> build them without xlib.h available (DISTRO without x11 in
>> >> DISTRO_FEATURES).
>> >>
>> >> Are you sure that
>> >> meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
>> >>
>> >> was resolved in upstream?
>> >>
>> >> Regards,
>> > Hi,
>> > Sorry for this late response,
>> > I removed that patch after testing wayland without X and worked.
>> > I've tried yesterday to build qtbase  (meta-qt5) to see exactly what's
>> > the problem and determine if indeed part of that patch has to be
>> > upstream, but it was failing for not finding libGL (which of course,
>> > we don't build with mesa when
>> I meant: libGL is not built together with the other mesa libraries when
>> DISTRO_FEATURES_remove="x11" .
>> > DISTRO_FEATURES_remove="x11". Just not having X11 in DISTRO_FEATURES
>> > doesn't mean you'll not have it).
>> > Can you please give me some info about your config vars or your
>> > environment so I find out what's the problem!? (I'm trying to
>> > reproduce the issue).
>
> Hi,
>
> I don't see how building libGL relates to this problem, which is more
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

This looks like a plan :-)


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

