Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 40E9A65CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 12:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6HC1dtc026815; Fri, 17 Jul 2015 13:01:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F9dWxQBZSgLZ; Fri, 17 Jul 2015 13:01:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6HC1Qk5026812
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 17 Jul 2015 13:01:37 +0100
Message-ID: <1437134486.22526.45.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jul 2015 13:01:26 +0100
In-Reply-To: <CAJTo0LaC2922F34uaejPiMAqyZTtrE6yW-wno+a36nN_Ty_tdg@mail.gmail.com>
References: <20150714142140.GC2184@jama> <20150716212956.GA7193@jama>
	<CAJTo0LaC2922F34uaejPiMAqyZTtrE6yW-wno+a36nN_Ty_tdg@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 17 Jul 2015 12:01:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-16 at 23:22 +0100, Burton, Ross wrote:
> 
> On 16 July 2015 at 22:29, Martin Jansa <martin.jansa@gmail.com> wrote:
>         ERROR: Nothing PROVIDES 'gtk+-native' (but
>         virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb DEPENDS on or otherwise requires it). Close matches:
>
> So libwmf does this:
>
> DEPENDS_virtclass-native = "freetype-native libpng-native jpeg-native"
> DEPENDS = "freetype libpng jpeg expat gtk+"
>
> Interestingly changing this to _class-native fixes the problem.

Strangely, the answer as to what might be wrong occurred to me in the
shower this morning. We should try changing:

native.bbclass:    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-native")

to

e.data.setVar("FOO", "virtclass-native")
e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":${FOO}")

and if that makes things work, its the override caching mechanism that
is bust for direct changes to OVERRIDES which don't use variable
indirection (most do).

If that is the case, a fix shouldn't be hard.

Cheers,

Richard



