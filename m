Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C380B73D89
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 10:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6LAsFwY017002; Tue, 21 Jul 2015 11:54:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TRyKY6R6NbS0; Tue, 21 Jul 2015 11:54:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6LAs0ta016969
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Jul 2015 11:54:13 +0100
Message-ID: <1437469894.821.60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <1437134486.22526.45.camel@linuxfoundation.org>
References: <20150714142140.GC2184@jama> <20150716212956.GA7193@jama>
	<CAJTo0LaC2922F34uaejPiMAqyZTtrE6yW-wno+a36nN_Ty_tdg@mail.gmail.com>
	<1437134486.22526.45.camel@linuxfoundation.org>
Date: Tue, 21 Jul 2015 10:11:34 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 21 Jul 2015 10:54:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-07-17 at 13:01 +0100, Richard Purdie wrote:
> On Thu, 2015-07-16 at 23:22 +0100, Burton, Ross wrote:
> > 
> > On 16 July 2015 at 22:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> >         ERROR: Nothing PROVIDES 'gtk+-native' (but
> >         virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb DEPENDS on or otherwise requires it). Close matches:
> >
> > So libwmf does this:
> >
> > DEPENDS_virtclass-native = "freetype-native libpng-native jpeg-native"
> > DEPENDS = "freetype libpng jpeg expat gtk+"
> >
> > Interestingly changing this to _class-native fixes the problem.
> 
> Strangely, the answer as to what might be wrong occurred to me in the
> shower this morning. We should try changing:
> 
> native.bbclass:    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-native")
> 
> to
> 
> e.data.setVar("FOO", "virtclass-native")
> e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":${FOO}")
> 
> and if that makes things work, its the override caching mechanism that
> is bust for direct changes to OVERRIDES which don't use variable
> indirection (most do).
> 
> If that is the case, a fix shouldn't be hard.

Its actually much simpler than this. DEPENDS is evaluated in
native_virtclass_handler(e):28 [map_dependencies] which is before
virtclass-native is added to OVERRIDES. The act of setting the DEPENDS
variable wipes out any other overrides which may not have been applied
to that point. The fixes are:

a) Move the virtclass-native addition to OVERRIDES to earlier in the
function
b) Change meta-oe use of virtclass -> class
c) Drop use of virtclass-native and virtclass-nativesdk entirely (only
multilib really makes sense now).

Cheers,

Richard




