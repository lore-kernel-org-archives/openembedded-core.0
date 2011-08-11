Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QrWGw-0000OL-CG
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 16:30:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1283231536AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 16:19:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id rvFRFE7M2kBA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 16:19:32 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c4c7e.pool.mediaWays.net [89.12.76.126])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B4B3031536AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 16:19:32 +0200 (CEST)
Message-ID: <4E43E4F4.4080902@opendreambox.org>
Date: Thu, 11 Aug 2011 16:19:32 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1313065027.6733.127.camel@phil-desktop>
In-Reply-To: <1313065027.6733.127.camel@phil-desktop>
Subject: Re: X11 as DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2011 14:30:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11.08.2011 14:17, Phil Blundell wrote:
> Right now, there are a bunch of recipes (e.g. dbus, cairo) which always
> build against X11 even though the underlying software can work without
> it.  This makes it somewhat painful to build a display system using
> clutter (for example) without X.
> 
> It's also moderately fiddly to stop X11 from leaking in by mistake; you
> can't just BBMASK the whole of "xorg-*" because things like pixman are
> still needed by cairo even when not using X11.
> 
> So, to combat this, I would like to make X11 be a DISTRO_FEATURE and
> arrange for:
> 
> a) libx11 to skip itself; and
> 
> b) recipes for which x11 is optional to not depend on X stuff 
> 
> if that feature isn't selected.
> 
> Any objections, better suggestions, ...?

That would be great!

My current workaround (using OE 2011.03, not OE-core) is rather
ugly, because it's hard to read and to extend and it creates tons
of warnings[1]:

# mask libx11 and related packages
BBMASK = "(/(nonworking|obsolete)/)|(/(efl1|gtk+|microwindows|preboot)/)|(/xorg-lib/lib.*)"

Plus, further workarounds in amend.inc or bbappend files are required, e.g.:

cairo/cairo/amend.inc:DEPENDS := "${@oe_filter_out('^(libsm|libxrender|virtual/libx11)$', '${DEPENDS}', d)}"
gnome/libsoup-2.4/amend.inc:DEPENDS := "${@oe_filter_out('^(gconf|gconf-native|gnome-common|gnome-keyring|libproxy)$', '${DEPENDS}', d)}"
gstreamer/gst-plugins-bad/amend.inc:DEPENDS := "${@oe_filter_out('^(librsvg|opencv)$', '${DEPENDS}', d)}"
gstreamer/gst-plugins-base/amend.inc:DEPENDS := "${@oe_filter_out('^(gnome-vfs|gtk\+|libsm|libxrandr|libxv|virtual/libx11)$', '${DEPENDS}', d)}"
gstreamer/gst-plugins-good/amend.inc:DEPENDS := "${@oe_filter_out('^(esound|gconf|hal|pulseaudio)$', '${DEPENDS}', d)}"
pango/pango/amend.inc:DEPENDS := "${@oe_filter_out('^(libxft|virtual/libx11)$', '${DEPENDS}', d)}"

Regards,
Andreas

[1]:
ERROR: Nothing PROVIDES 'libxext'
NOTE: Runtime target 'libsdl-x11' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libsdl-x11', 'libxext']
NOTE: Runtime target 'python-pygtk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-pygtk', 'gtk+', 'libxext']
NOTE: Runtime target 'avahi-python' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['avahi-python', 'python-pygtk', 'gtk+', 'libxext']
NOTE: Runtime target 'libglade' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libglade', 'gtk+', 'libxext']
NOTE: Runtime target 'gtk+' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gtk+', 'libxext']
NOTE: Runtime target 'gtk+-fastscaling' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gtk+-fastscaling', 'libxext']
ERROR: Nothing PROVIDES 'libxcursor'
ERROR: Nothing PROVIDES 'libxrandr'
...


