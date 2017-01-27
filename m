Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.41])
	by mail.openembedded.org (Postfix) with ESMTP id 86BE5773AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:00:00 +0000 (UTC)
Received: from 1cX5CB-0002Gb-Tf by out11c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cX5CB-0002HA-Up
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2017 03:59:59 -0800
Received: by emcmailer; Fri, 27 Jan 2017 03:59:59 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11c.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cX5CB-0002Gb-Tf
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2017 03:59:59 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Fri, 27 Jan 2017 12:59:37 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jan 2017 12:59:35 +0100
Message-ID: <1485518375-44527-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH][morty] libXrandr: fix for CVE-2016-7947 and CVE-2016-7948
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
X-List-Received-Date: Fri, 27 Jan 2017 12:00:01 -0000
Content-Type: text/plain

CVE-2016-7947
Insufficient validation of server responses result in Integer overflows

CVE-2016-7948
Insufficient validation of server responses result in various data mishandlings

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-7947
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-7948
https://lists.x.org/archives/xorg-announce/2016-October/002720.html

Upstream patch for both CVEs:
https://cgit.freedesktop.org/xorg/lib/libXrandr/commit/?id=a0df3e1c7728205e5c7650b2e6dce684139254a6

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../libxrandr/CVE-2016-7947_CVE-2016-7948.patch    | 439 +++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxrandr_1.5.0.bb  |   3 +
 2 files changed, 442 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxrandr/CVE-2016-7947_CVE-2016-7948.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxrandr/CVE-2016-7947_CVE-2016-7948.patch b/meta/recipes-graphics/xorg-lib/libxrandr/CVE-2016-7947_CVE-2016-7948.patch
new file mode 100644
index 0000000..a9b3dbc
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxrandr/CVE-2016-7947_CVE-2016-7948.patch
@@ -0,0 +1,439 @@
+From a0df3e1c7728205e5c7650b2e6dce684139254a6 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 25 Sep 2016 22:21:40 +0200
+Subject: Avoid out of boundary accesses on illegal responses
+
+The responses of the connected X server have to be properly checked
+to avoid out of boundary accesses that could otherwise be triggered
+by a malicious server.
+
+CVE: CVE-2016-7947
+libXrandr: Insufficient validation of server responses result in Integer overflows
+
+CVE: CVE-2016-7948
+libXrandr: Insufficient validation of server responses result in various data mishandlings
+
+Upstream-Status: Backport
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff --git a/src/XrrConfig.c b/src/XrrConfig.c
+index 2f0282b..e68c45a 100644
+--- a/src/XrrConfig.c
++++ b/src/XrrConfig.c
+@@ -29,6 +29,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <limits.h>
+ #include <stdio.h>
+ #include <X11/Xlib.h>
+ /* we need to be able to manipulate the Display structure on events */
+@@ -272,23 +273,30 @@ static XRRScreenConfiguration *_XRRGetScreenInfo (Display *dpy,
+ 	rep.rate = 0;
+ 	rep.nrateEnts = 0;
+     }
++    if (rep.length < INT_MAX >> 2) {
++	nbytes = (long) rep.length << 2;
+ 
+-    nbytes = (long) rep.length << 2;
++	nbytesRead = (long) (rep.nSizes * SIZEOF (xScreenSizes) +
++			    ((rep.nrateEnts + 1)& ~1) * 2 /* SIZEOF(CARD16) */);
+ 
+-    nbytesRead = (long) (rep.nSizes * SIZEOF (xScreenSizes) +
+-			 ((rep.nrateEnts + 1)& ~1) * 2 /* SIZEOF (CARD16) */);
++	/*
++	 * first we must compute how much space to allocate for
++	 * randr library's use; we'll allocate the structures in a single
++	 * allocation, on cleanlyness grounds.
++	 */
+ 
+-    /*
+-     * first we must compute how much space to allocate for
+-     * randr library's use; we'll allocate the structures in a single
+-     * allocation, on cleanlyness grounds.
+-     */
++	rbytes = sizeof (XRRScreenConfiguration) +
++	  (rep.nSizes * sizeof (XRRScreenSize) +
++	   rep.nrateEnts * sizeof (int));
+ 
+-    rbytes = sizeof (XRRScreenConfiguration) +
+-      (rep.nSizes * sizeof (XRRScreenSize) +
+-       rep.nrateEnts * sizeof (int));
++	scp = (struct _XRRScreenConfiguration *) Xmalloc(rbytes);
++    } else {
++	nbytes = 0;
++	nbytesRead = 0;
++	rbytes = 0;
++	scp = NULL;
++    }
+ 
+-    scp = (struct _XRRScreenConfiguration *) Xmalloc(rbytes);
+     if (scp == NULL) {
+ 	_XEatData (dpy, (unsigned long) nbytes);
+ 	return NULL;
+diff --git a/src/XrrCrtc.c b/src/XrrCrtc.c
+index 5ae35c5..6665092 100644
+--- a/src/XrrCrtc.c
++++ b/src/XrrCrtc.c
+@@ -24,6 +24,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <limits.h>
+ #include <stdio.h>
+ #include <X11/Xlib.h>
+ /* we need to be able to manipulate the Display structure on events */
+@@ -57,22 +58,33 @@ XRRGetCrtcInfo (Display *dpy, XRRScreenResources *resources, RRCrtc crtc)
+ 	return NULL;
+     }
+ 
+-    nbytes = (long) rep.length << 2;
++    if (rep.length < INT_MAX >> 2)
++    {
++	nbytes = (long) rep.length << 2;
+ 
+-    nbytesRead = (long) (rep.nOutput * 4 +
+-			 rep.nPossibleOutput * 4);
++	nbytesRead = (long) (rep.nOutput * 4 +
++			     rep.nPossibleOutput * 4);
+ 
+-    /*
+-     * first we must compute how much space to allocate for
+-     * randr library's use; we'll allocate the structures in a single
+-     * allocation, on cleanlyness grounds.
+-     */
++	/*
++	 * first we must compute how much space to allocate for
++	 * randr library's use; we'll allocate the structures in a single
++	 * allocation, on cleanlyness grounds.
++	 */
+ 
+-    rbytes = (sizeof (XRRCrtcInfo) +
+-	      rep.nOutput * sizeof (RROutput) +
+-	      rep.nPossibleOutput * sizeof (RROutput));
++	rbytes = (sizeof (XRRCrtcInfo) +
++		  rep.nOutput * sizeof (RROutput) +
++		  rep.nPossibleOutput * sizeof (RROutput));
++
++	xci = (XRRCrtcInfo *) Xmalloc(rbytes);
++    }
++    else
++    {
++	nbytes = 0;
++	nbytesRead = 0;
++	rbytes = 0;
++	xci = NULL;
++    }
+ 
+-    xci = (XRRCrtcInfo *) Xmalloc(rbytes);
+     if (xci == NULL) {
+ 	_XEatDataWords (dpy, rep.length);
+ 	UnlockDisplay (dpy);
+@@ -194,12 +206,21 @@ XRRGetCrtcGamma (Display *dpy, RRCrtc crtc)
+     if (!_XReply (dpy, (xReply *) &rep, 0, xFalse))
+ 	goto out;
+ 
+-    nbytes = (long) rep.length << 2;
++    if (rep.length < INT_MAX >> 2)
++    {
++	nbytes = (long) rep.length << 2;
+ 
+-    /* three channels of CARD16 data */
+-    nbytesRead = (rep.size * 2 * 3);
++	/* three channels of CARD16 data */
++	nbytesRead = (rep.size * 2 * 3);
+ 
+-    crtc_gamma = XRRAllocGamma (rep.size);
++	crtc_gamma = XRRAllocGamma (rep.size);
++    }
++    else
++    {
++	nbytes = 0;
++	nbytesRead = 0;
++	crtc_gamma = NULL;
++    }
+ 
+     if (!crtc_gamma)
+     {
+@@ -357,7 +378,7 @@ XRRGetCrtcTransform (Display	*dpy,
+     xRRGetCrtcTransformReq	*req;
+     int				major_version, minor_version;
+     XRRCrtcTransformAttributes	*attr;
+-    char			*extra = NULL, *e;
++    char			*extra = NULL, *end = NULL, *e;
+     int				p;
+ 
+     *attributes = NULL;
+@@ -395,9 +416,17 @@ XRRGetCrtcTransform (Display	*dpy,
+ 	else
+ 	{
+ 	    int extraBytes = rep.length * 4 - CrtcTransformExtra;
+-	    extra = Xmalloc (extraBytes);
++	    if (rep.length < INT_MAX / 4 &&
++		rep.length * 4 >= CrtcTransformExtra) {
++		extra = Xmalloc (extraBytes);
++		end = extra + extraBytes;
++	    } else
++		extra = NULL;
+ 	    if (!extra) {
+-		_XEatDataWords (dpy, rep.length - (CrtcTransformExtra >> 2));
++		if (rep.length > (CrtcTransformExtra >> 2))
++		    _XEatDataWords (dpy, rep.length - (CrtcTransformExtra >> 2));
++		else
++		    _XEatDataWords (dpy, rep.length);
+ 		UnlockDisplay (dpy);
+ 		SyncHandle ();
+ 		return False;
+@@ -429,22 +458,38 @@ XRRGetCrtcTransform (Display	*dpy,
+ 
+     e = extra;
+ 
++    if (e + rep.pendingNbytesFilter > end) {
++	XFree (extra);
++	return False;
++    }
+     memcpy (attr->pendingFilter, e, rep.pendingNbytesFilter);
+     attr->pendingFilter[rep.pendingNbytesFilter] = '\0';
+     e += (rep.pendingNbytesFilter + 3) & ~3;
+     for (p = 0; p < rep.pendingNparamsFilter; p++) {
+ 	INT32	f;
++	if (e + 4 > end) {
++	    XFree (extra);
++	    return False;
++	}
+ 	memcpy (&f, e, 4);
+ 	e += 4;
+ 	attr->pendingParams[p] = (XFixed) f;
+     }
+     attr->pendingNparams = rep.pendingNparamsFilter;
+ 
++    if (e + rep.currentNbytesFilter > end) {
++	XFree (extra);
++	return False;
++    }
+     memcpy (attr->currentFilter, e, rep.currentNbytesFilter);
+     attr->currentFilter[rep.currentNbytesFilter] = '\0';
+     e += (rep.currentNbytesFilter + 3) & ~3;
+     for (p = 0; p < rep.currentNparamsFilter; p++) {
+ 	INT32	f;
++	if (e + 4 > end) {
++	    XFree (extra);
++	    return False;
++	}
+ 	memcpy (&f, e, 4);
+ 	e += 4;
+ 	attr->currentParams[p] = (XFixed) f;
+diff --git a/src/XrrMonitor.c b/src/XrrMonitor.c
+index a9eaa7b..adc5330 100644
+--- a/src/XrrMonitor.c
++++ b/src/XrrMonitor.c
+@@ -24,6 +24,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <limits.h>
+ #include <stdio.h>
+ #include <X11/Xlib.h>
+ /* we need to be able to manipulate the Display structure on events */
+@@ -65,6 +66,15 @@ XRRGetMonitors(Display *dpy, Window window, Bool get_active, int *nmonitors)
+ 	return NULL;
+     }
+ 
++    if (rep.length > INT_MAX >> 2 ||
++	rep.nmonitors > INT_MAX / SIZEOF(xRRMonitorInfo) ||
++	rep.noutputs > INT_MAX / 4 ||
++	rep.nmonitors * SIZEOF(xRRMonitorInfo) > INT_MAX - rep.noutputs * 4) {
++	_XEatData (dpy, rep.length);
++	UnlockDisplay (dpy);
++	SyncHandle ();
++	return NULL;
++    }
+     nbytes = (long) rep.length << 2;
+     nmon = rep.nmonitors;
+     noutput = rep.noutputs;
+@@ -111,6 +121,14 @@ XRRGetMonitors(Display *dpy, Window window, Bool get_active, int *nmonitors)
+ 	    mon[m].outputs = output;
+ 	    buf += SIZEOF (xRRMonitorInfo);
+ 	    xoutput = (CARD32 *) buf;
++	    if (xmon->noutput > rep.noutputs) {
++	        Xfree(buf);
++	        Xfree(mon);
++	        UnlockDisplay (dpy);
++	        SyncHandle ();
++	        return NULL;
++	    }
++	    rep.noutputs -= xmon->noutput;
+ 	    for (o = 0; o < xmon->noutput; o++)
+ 		output[o] = xoutput[o];
+ 	    output += xmon->noutput;
+diff --git a/src/XrrOutput.c b/src/XrrOutput.c
+index 85f0b6e..30f3d40 100644
+--- a/src/XrrOutput.c
++++ b/src/XrrOutput.c
+@@ -25,6 +25,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <limits.h>
+ #include <stdio.h>
+ #include <X11/Xlib.h>
+ /* we need to be able to manipulate the Display structure on events */
+@@ -60,6 +61,16 @@ XRRGetOutputInfo (Display *dpy, XRRScreenResources *resources, RROutput output)
+ 	return NULL;
+     }
+ 
++    if (rep.length > INT_MAX >> 2 || rep.length < (OutputInfoExtra >> 2))
++    {
++        if (rep.length > (OutputInfoExtra >> 2))
++	    _XEatDataWords (dpy, rep.length - (OutputInfoExtra >> 2));
++	else
++	    _XEatDataWords (dpy, rep.length);
++	UnlockDisplay (dpy);
++	SyncHandle ();
++	return NULL;
++    }
+     nbytes = ((long) (rep.length) << 2) - OutputInfoExtra;
+ 
+     nbytesRead = (long) (rep.nCrtcs * 4 +
+diff --git a/src/XrrProvider.c b/src/XrrProvider.c
+index 9e620c7..d796cd0 100644
+--- a/src/XrrProvider.c
++++ b/src/XrrProvider.c
+@@ -25,6 +25,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <limits.h>
+ #include <stdio.h>
+ #include <X11/Xlib.h>
+ /* we need to be able to manipulate the Display structure on events */
+@@ -59,12 +60,20 @@ XRRGetProviderResources(Display *dpy, Window window)
+       return NULL;
+     }
+ 
+-    nbytes = (long) rep.length << 2;
++    if (rep.length < INT_MAX >> 2) {
++	nbytes = (long) rep.length << 2;
+ 
+-    nbytesRead = (long) (rep.nProviders * 4);
++	nbytesRead = (long) (rep.nProviders * 4);
+ 
+-    rbytes = (sizeof(XRRProviderResources) + rep.nProviders * sizeof(RRProvider));
+-    xrpr = (XRRProviderResources *) Xmalloc(rbytes);
++	rbytes = (sizeof(XRRProviderResources) + rep.nProviders *
++		  sizeof(RRProvider));
++	xrpr = (XRRProviderResources *) Xmalloc(rbytes);
++    } else {
++	nbytes = 0;
++	nbytesRead = 0;
++	rbytes = 0;
++	xrpr = NULL;
++    }
+ 
+     if (xrpr == NULL) {
+        _XEatDataWords (dpy, rep.length);
+@@ -121,6 +130,17 @@ XRRGetProviderInfo(Display *dpy, XRRScreenResources *resources, RRProvider provi
+ 	return NULL;
+     }
+ 
++    if (rep.length > INT_MAX >> 2 || rep.length < ProviderInfoExtra >> 2)
++    {
++	if (rep.length < ProviderInfoExtra >> 2)
++	    _XEatDataWords (dpy, rep.length);
++	else
++	    _XEatDataWords (dpy, rep.length - (ProviderInfoExtra >> 2));
++	UnlockDisplay (dpy);
++	SyncHandle ();
++	return NULL;
++    }
++
+     nbytes = ((long) rep.length << 2) - ProviderInfoExtra;
+ 
+     nbytesRead = (long)(rep.nCrtcs * 4 +
+diff --git a/src/XrrScreen.c b/src/XrrScreen.c
+index b8ce7e5..1f7ffe6 100644
+--- a/src/XrrScreen.c
++++ b/src/XrrScreen.c
+@@ -24,6 +24,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <limits.h>
+ #include <stdio.h>
+ #include <X11/Xlib.h>
+ /* we need to be able to manipulate the Display structure on events */
+@@ -105,27 +106,36 @@ doGetScreenResources (Display *dpy, Window window, int poll)
+ 	xrri->has_rates = _XRRHasRates (xrri->minor_version, xrri->major_version);
+     }
+ 
+-    nbytes = (long) rep.length << 2;
++    if (rep.length < INT_MAX >> 2) {
++	nbytes = (long) rep.length << 2;
+ 
+-    nbytesRead = (long) (rep.nCrtcs * 4 +
+-			 rep.nOutputs * 4 +
+-			 rep.nModes * SIZEOF (xRRModeInfo) +
+-			 ((rep.nbytesNames + 3) & ~3));
++	nbytesRead = (long) (rep.nCrtcs * 4 +
++			     rep.nOutputs * 4 +
++			     rep.nModes * SIZEOF (xRRModeInfo) +
++			     ((rep.nbytesNames + 3) & ~3));
+ 
+-    /*
+-     * first we must compute how much space to allocate for
+-     * randr library's use; we'll allocate the structures in a single
+-     * allocation, on cleanlyness grounds.
+-     */
++	/*
++	 * first we must compute how much space to allocate for
++	 * randr library's use; we'll allocate the structures in a single
++	 * allocation, on cleanlyness grounds.
++	 */
++
++	rbytes = (sizeof (XRRScreenResources) +
++		  rep.nCrtcs * sizeof (RRCrtc) +
++		  rep.nOutputs * sizeof (RROutput) +
++		  rep.nModes * sizeof (XRRModeInfo) +
++		  rep.nbytesNames + rep.nModes);    /* '\0' terminate names */
+ 
+-    rbytes = (sizeof (XRRScreenResources) +
+-	      rep.nCrtcs * sizeof (RRCrtc) +
+-	      rep.nOutputs * sizeof (RROutput) +
+-	      rep.nModes * sizeof (XRRModeInfo) +
+-	      rep.nbytesNames + rep.nModes);	/* '\0' terminate names */
++	xrsr = (XRRScreenResources *) Xmalloc(rbytes);
++	wire_names = (char *) Xmalloc (rep.nbytesNames);
++    } else {
++	nbytes = 0;
++	nbytesRead = 0;
++	rbytes = 0;
++	xrsr = NULL;
++	wire_names = NULL;
++    }
+ 
+-    xrsr = (XRRScreenResources *) Xmalloc(rbytes);
+-    wire_names = (char *) Xmalloc (rep.nbytesNames);
+     if (xrsr == NULL || wire_names == NULL) {
+ 	Xfree (xrsr);
+ 	Xfree (wire_names);
+@@ -174,6 +184,14 @@ doGetScreenResources (Display *dpy, Window window, int poll)
+     wire_name = wire_names;
+     for (i = 0; i < rep.nModes; i++)  {
+ 	xrsr->modes[i].name = names;
++	if (xrsr->modes[i].nameLength > rep.nbytesNames) {
++	    Xfree (xrsr);
++	    Xfree (wire_names);
++	    UnlockDisplay (dpy);
++	    SyncHandle ();
++	    return NULL;
++	}
++	rep.nbytesNames -= xrsr->modes[i].nameLength;
+ 	memcpy (names, wire_name, xrsr->modes[i].nameLength);
+ 	names[xrsr->modes[i].nameLength] = '\0';
+ 	names += xrsr->modes[i].nameLength + 1;
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.0.bb
index abbbae5..35c60b4 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.0.bb
@@ -19,5 +19,8 @@ XORG_PN = "libXrandr"
 
 BBCLASSEXTEND = "native nativesdk"
 
+SRC_URI += "file://CVE-2016-7947_CVE-2016-7948.patch \
+	"
+
 SRC_URI[md5sum] = "309762867e41c6fd813da880d8a1bc93"
 SRC_URI[sha256sum] = "6f864959b7fc35db11754b270d71106ef5b5cf363426aa58589cb8ac8266de58"
-- 
1.9.1


