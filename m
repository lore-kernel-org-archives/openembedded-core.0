Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SUjFR-0002qB-08
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:46:57 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 052E6F8123A; Wed, 16 May 2012 12:36:56 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2FE68F8122F;
	Wed, 16 May 2012 12:36:31 -0600 (MDT)
Message-ID: <4FB3F3AF.4000204@mlbassoc.com>
Date: Wed, 16 May 2012 12:36:31 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <1337191928-4807-1-git-send-email-gary@mlbassoc.com>
	<CAEsOVNc1rANV_mYhsBm5u0CJjiryXB=9Lo30b4uSYgAbGiG0MA@mail.gmail.com>
In-Reply-To: <CAEsOVNc1rANV_mYhsBm5u0CJjiryXB=9Lo30b4uSYgAbGiG0MA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Fix X server on PowerPC when built with GCC 4.7.x
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
X-List-Received-Date: Wed, 16 May 2012 18:46:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-16 12:29, McClintock Matthew-B29882 wrote:
> Gary,
>
> I'm curious what did you test this on?

An internal platform based on MPC8379 using a PCI graphics + touch screen.

> On Wed, May 16, 2012 at 1:12 PM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> Incorporate patch from upstream:
>>   http://cgit.freedesktop.org/xorg/xserver/patch/Xext/xace.c?id=6dae7f3792611aace1df0cca63bf50c50d93de43
>>   Subject: xace: Invalid reference to out-of-scope data.
>> ---
>>   .../fix-bogus-stack-variables.patch                |  231 ++++++++++++++++++++
>>   .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    3 +-
>>   2 files changed, 233 insertions(+), 1 deletions(-)
>>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
>>
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
>> new file mode 100644
>> index 0000000..d900fc3
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
>> @@ -0,0 +1,231 @@
>> +From 6dae7f3792611aace1df0cca63bf50c50d93de43 Mon Sep 17 00:00:00 2001
>> +From: Chris Wilson<chris@chris-wilson.co.uk>
>> +Date: Tue, 10 Aug 2010 18:30:20 +0000
>> +Subject: xace: Invalid reference to out-of-scope data.
>> +
>> +The callback data passed by reference to the hook was allocated on stack
>> +within the scope of the case statement. The compiler is free to reuse
>> +any of that stack space whilst making the function call so we may end up
>> +passing garbage into the callback.
>> +
>> +References:
>> +
>> +  Bug 18451 - Xorg server 1.5.2 SEGV during XFixesGetCursorImage()
>> +  https://bugs.freedesktop.org/show_bug.cgi?id=18451
>> +
>> +v2: Drop the unrelated hunk that snuck in when ammending the commit
>> +message.
>> +
>> +Signed-off-by: Chris Wilson<chris@chris-wilson.co.uk>
>> +Reviewed-by: Alan Coopersmith<alan.coopersmith@oracle.com>
>> +Signed-off-by: Keith Packard<keithp@keithp.com>
>> +---
>> +(limited to 'Xext/xace.c')
>> +
>> +diff --git a/Xext/xace.c b/Xext/xace.c
>> +index e10d837..c757cad 100644
>> +--- a/Xext/xace.c
>> ++++ b/Xext/xace.c
>> +@@ -87,7 +87,18 @@ void XaceHookAuditEnd(ClientPtr ptr, int result)
>> +  */
>> + int XaceHook(int hook, ...)
>> + {
>> +-    pointer calldata; /* data passed to callback */
>> ++    union {
>> ++      XaceResourceAccessRec res;
>> ++      XaceDeviceAccessRec dev;
>> ++      XaceSendAccessRec send;
>> ++      XaceReceiveAccessRec recv;
>> ++      XaceClientAccessRec client;
>> ++      XaceExtAccessRec ext;
>> ++      XaceServerAccessRec server;
>> ++      XaceScreenAccessRec screen;
>> ++      XaceAuthAvailRec auth;
>> ++      XaceKeyAvailRec key;
>> ++    } u;
>> +     int *prv = NULL;  /* points to return value from callback */
>> +     va_list ap;               /* argument list */
>> +     va_start(ap, hook);
>> +@@ -99,117 +110,86 @@ int XaceHook(int hook, ...)
>> +      */
>> +     switch (hook)
>> +     {
>> +-      case XACE_RESOURCE_ACCESS: {
>> +-          XaceResourceAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.id = va_arg(ap, XID);
>> +-          rec.rtype = va_arg(ap, RESTYPE);
>> +-          rec.res = va_arg(ap, pointer);
>> +-          rec.ptype = va_arg(ap, RESTYPE);
>> +-          rec.parent = va_arg(ap, pointer);
>> +-          rec.access_mode = va_arg(ap, Mask);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_RESOURCE_ACCESS:
>> ++          u.res.client = va_arg(ap, ClientPtr);
>> ++          u.res.id = va_arg(ap, XID);
>> ++          u.res.rtype = va_arg(ap, RESTYPE);
>> ++          u.res.res = va_arg(ap, pointer);
>> ++          u.res.ptype = va_arg(ap, RESTYPE);
>> ++          u.res.parent = va_arg(ap, pointer);
>> ++          u.res.access_mode = va_arg(ap, Mask);
>> ++          u.res.status = Success; /* default allow */
>> ++          prv =&u.res.status;
>> +           break;
>> +-      }
>> +-      case XACE_DEVICE_ACCESS: {
>> +-          XaceDeviceAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.dev = va_arg(ap, DeviceIntPtr);
>> +-          rec.access_mode = va_arg(ap, Mask);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_DEVICE_ACCESS:
>> ++          u.dev.client = va_arg(ap, ClientPtr);
>> ++          u.dev.dev = va_arg(ap, DeviceIntPtr);
>> ++          u.dev.access_mode = va_arg(ap, Mask);
>> ++          u.dev.status = Success; /* default allow */
>> ++          prv =&u.dev.status;
>> +           break;
>> +-      }
>> +-      case XACE_SEND_ACCESS: {
>> +-          XaceSendAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.dev = va_arg(ap, DeviceIntPtr);
>> +-          rec.pWin = va_arg(ap, WindowPtr);
>> +-          rec.events = va_arg(ap, xEventPtr);
>> +-          rec.count = va_arg(ap, int);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_SEND_ACCESS:
>> ++          u.send.client = va_arg(ap, ClientPtr);
>> ++          u.send.dev = va_arg(ap, DeviceIntPtr);
>> ++          u.send.pWin = va_arg(ap, WindowPtr);
>> ++          u.send.events = va_arg(ap, xEventPtr);
>> ++          u.send.count = va_arg(ap, int);
>> ++          u.send.status = Success; /* default allow */
>> ++          prv =&u.send.status;
>> +           break;
>> +-      }
>> +-      case XACE_RECEIVE_ACCESS: {
>> +-          XaceReceiveAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.pWin = va_arg(ap, WindowPtr);
>> +-          rec.events = va_arg(ap, xEventPtr);
>> +-          rec.count = va_arg(ap, int);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_RECEIVE_ACCESS:
>> ++          u.recv.client = va_arg(ap, ClientPtr);
>> ++          u.recv.pWin = va_arg(ap, WindowPtr);
>> ++          u.recv.events = va_arg(ap, xEventPtr);
>> ++          u.recv.count = va_arg(ap, int);
>> ++          u.recv.status = Success; /* default allow */
>> ++          prv =&u.recv.status;
>> +           break;
>> +-      }
>> +-      case XACE_CLIENT_ACCESS: {
>> +-          XaceClientAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.target = va_arg(ap, ClientPtr);
>> +-          rec.access_mode = va_arg(ap, Mask);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_CLIENT_ACCESS:
>> ++          u.client.client = va_arg(ap, ClientPtr);
>> ++          u.client.target = va_arg(ap, ClientPtr);
>> ++          u.client.access_mode = va_arg(ap, Mask);
>> ++          u.client.status = Success; /* default allow */
>> ++          prv =&u.client.status;
>> +           break;
>> +-      }
>> +-      case XACE_EXT_ACCESS: {
>> +-          XaceExtAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.ext = va_arg(ap, ExtensionEntry*);
>> +-          rec.access_mode = DixGetAttrAccess;
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_EXT_ACCESS:
>> ++          u.ext.client = va_arg(ap, ClientPtr);
>> ++          u.ext.ext = va_arg(ap, ExtensionEntry*);
>> ++          u.ext.access_mode = DixGetAttrAccess;
>> ++          u.ext.status = Success; /* default allow */
>> ++          prv =&u.ext.status;
>> +           break;
>> +-      }
>> +-      case XACE_SERVER_ACCESS: {
>> +-          XaceServerAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.access_mode = va_arg(ap, Mask);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_SERVER_ACCESS:
>> ++          u.server.client = va_arg(ap, ClientPtr);
>> ++          u.server.access_mode = va_arg(ap, Mask);
>> ++          u.server.status = Success; /* default allow */
>> ++          prv =&u.server.status;
>> +           break;
>> +-      }
>> +       case XACE_SCREEN_ACCESS:
>> +-      case XACE_SCREENSAVER_ACCESS: {
>> +-          XaceScreenAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.screen = va_arg(ap, ScreenPtr);
>> +-          rec.access_mode = va_arg(ap, Mask);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_SCREENSAVER_ACCESS:
>> ++          u.screen.client = va_arg(ap, ClientPtr);
>> ++          u.screen.screen = va_arg(ap, ScreenPtr);
>> ++          u.screen.access_mode = va_arg(ap, Mask);
>> ++          u.screen.status = Success; /* default allow */
>> ++          prv =&u.screen.status;
>> +           break;
>> +-      }
>> +-      case XACE_AUTH_AVAIL: {
>> +-          XaceAuthAvailRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.authId = va_arg(ap, XID);
>> +-          calldata =&rec;
>> ++      case XACE_AUTH_AVAIL:
>> ++          u.auth.client = va_arg(ap, ClientPtr);
>> ++          u.auth.authId = va_arg(ap, XID);
>> +           break;
>> +-      }
>> +-      case XACE_KEY_AVAIL: {
>> +-          XaceKeyAvailRec rec;
>> +-          rec.event = va_arg(ap, xEventPtr);
>> +-          rec.keybd = va_arg(ap, DeviceIntPtr);
>> +-          rec.count = va_arg(ap, int);
>> +-          calldata =&rec;
>> ++      case XACE_KEY_AVAIL:
>> ++          u.key.event = va_arg(ap, xEventPtr);
>> ++          u.key.keybd = va_arg(ap, DeviceIntPtr);
>> ++          u.key.count = va_arg(ap, int);
>> +           break;
>> +-      }
>> +-      default: {
>> ++      default:
>> +           va_end(ap);
>> +           return 0;   /* unimplemented hook number */
>> +-      }
>> +     }
>> +     va_end(ap);
>> +
>> +     /* call callbacks and return result, if any. */
>> +-    CallCallbacks(&XaceHooks[hook], calldata);
>> ++    CallCallbacks(&XaceHooks[hook],&u);
>> +     return prv ? *prv : Success;
>> + }
>> +
>> +--
>> +cgit v0.9.0.2-2-gbebe
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
>> index 360a0f3..d90dc25 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
>> @@ -7,7 +7,7 @@ RDEPENDS_${PN} += "xkeyboard-config"
>>   EXTRA_OECONF += "--disable-glx"
>>
>>   PE = "1"
>> -PR = "r29"
>> +PR = "r30"
>>
>>   SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
>>         file://extra-kmodes.patch \
>> @@ -20,6 +20,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
>>         file://fix-newer-xorg-headers.patch \
>>         file://crosscompile.patch \
>>         file://error-address-work-around.patch \
>> +        file://fix-bogus-stack-variables.patch \
>>         file://nodolt.patch"
>>   #      file://kdrive-evdev.patch
>>   #      file://kdrive-use-evdev.patch
>> --
>> 1.7.7.6
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


