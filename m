Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1970160167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 10:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sADA6B6r012565; Thu, 13 Nov 2014 10:06:11 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id juf_ZeOgaWFX; Thu, 13 Nov 2014 10:06:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sADA5xvw012561
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 13 Nov 2014 10:06:10 GMT
Message-ID: <1415873194.2820.60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Thu, 13 Nov 2014 10:06:34 +0000
In-Reply-To: <54636528.6060403@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
	<4df30acac92f854aa92f221c7663c952da8d9f1f.1415647839.git.pab@pabigot.com>
	<1415790370.2820.45.camel@linuxfoundation.org>
	<54636528.6060403@pabigot.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 07/14] qt-mobility: switch to virtual/bluez
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
X-List-Received-Date: Thu, 13 Nov 2014 10:06:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-11-12 at 07:48 -0600, Peter A. Bigot wrote:
> You raise some good questions.  I'll come back to whether the name for 
> "whatever provides build-time support for bluetooth" should be spelled 
> "virtual/bluez" or something else.

Naming is probably the least of the worries here. I will say that
virtual/* has a very specific meaning in DEPENDS space though.

> I think using bluez5 (bluetooth5) and bluez4 (bluetooth) as distinct 
> PACKAGECONFIG options would be a mistake, because it propagates the 
> assumption that "bluetooth" in Linux is a multivalent concept. Bluetooth 
> in Linux is bluez.  Bluez is bluez5.  Work stopped on bluez4 over two 
> years ago, and nobody's come up with third alternative.  IMO, the 
> packageconfig option should be "bluetooth", not "bluez*".  I did see 
> what Chris Larson wrote in 
> http://lists.openembedded.org/pipermail/openembedded-core/2014-March/091008.html 
> but I just don't see the value in adding extra infrastructure for a 
> bunch of options that either don't exist now or won't exist in the near 
> future.

This kind of misses the problem though. Personally, I'd love to just
switch to bluez5 and be done with it. Our userbase expects something
with a little more thought though, there are people who will be
transitioning at different times and we can't really force them into a
flag day.

The issue is that if we just have a single "blue*" option, you basically
have no idea what you're going to get out of the build, it fails on the
determinism tests. You say qt5 may or may not work with 4, I suspect
there are several packages with this issue. My concern is that as we
update software, we basically have no idea what we're enabling or
disabling. This is exactly the kind of thing PACKAGECONFIG is meant to
spell out though.

This is why I suggested a 4 and 5 PACKAGECONFIG option since it then
clearly states what its building.

FWIW I do agree bluez4 is a dead end so calling the options "bluez4" and
"bluez" (for v5) would be ideal. We have some issues with legacy
namespace though and I'm not sure how we handle that.

> Of the roughly 16 recipes I had to touch, only one (pulseaudio) clearly 
> distinguishes between bluez4 and bluez5 when being configured, and I 
> suspect that's just to simplify transition.  The others either figure 
> out which version they were given and use it, or will only work with one 
> or the other.  They all at least build with virtual/bluez, though they 
> might internally disable bluetooth support or fail at runtime if bluez5 
> is what's available.  (Qt 5.4 will support bluez5; it's unclear to me 
> whether it still supports bluez4.)
> 
> There are and will continue to be certain recipes that will never move 
> beyond bluez4, because they're no longer maintained or nobody has found 
> it worthwhile (obex stuff) or a priority (headset stuff) to re-implement 
> the functionality they depend on under the new API. So we do need to 
> support using bluez4 and bluez5 as alternatives. But most recipes don't 
> seem to care who provides "bluetooth", and if it's currently bluez4 and 
> the package is maintained it'll eventually become bluez5.  Thus 
> "virtual/bluez".  AFAIK the libbluetooth API is unchanged; it's the dbus 
> API that's different.  If consensus is to substitute something like 
> "distro/bluez" instead of "virtual/bluez" to remove the implication it's 
> completely API-equivalent that'd be fine, but I think we do need some 
> name to serve that role without putting the conditional in every recipe 
> that might reference the selected bluetooth solution.

My reasoning is that if we need to provide specific PACKAGECONFIG for
determinism, we may as well then depend specifically on the recipe
namespaces.

"virtual/*" does not map to this usage as Chris mentions. I've been
around long enough to see what misuse of the provider namespace does and
I don't want to go there again. Introducing a "distro/bluez" would
probably just confuse things since its a new convention without well
defined meaning and we don't have a common case of this to deal with in
general.

> Using bluez4 and bluez5 in DISTRO_FEATURES makes some sense, as a 
> parallel to systemd vs sysvinit.  (I don't like "bluetooth5" because 
> there's no such thing; since we already have "bluetooth" I'd suggest 
> making "bluez4" the canonical spelling and interpreting "bluetooth" in 
> the absence of "bluez5" as being an alias for "bluez4".)

That alias support means more anonymous code we can likely never get rid
of so it makes me nervous. The DISTRO_FEATURES part is actually the part
I like least about my proposal as it happens, but I'm failing to see a
good way of presenting this to users in a way which lets them choose the
time of their upgrade clearly and ensures that builds are deterministic.

>   This provides 
> a way to set the PREFERRED_PROVIDER for "distro/bluez" and possibly to 
> set the PNBLACKLISTs to exclude the recipes that are not appropriate 
> under bluez4.
> 
> Then we just use "distro/bluez" instead of "virtual/bluez" in all the 
> recipes.
> 
> Is that any closer to acceptable?

I remain sceptical I'm afraid, I certainly don't see distro/ as having
any value over virtual/ :(.

Cheers,

Richard


