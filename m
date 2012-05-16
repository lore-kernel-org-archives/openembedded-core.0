Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SUeTG-00072Y-Dz
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 15:40:54 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A972CF811F0; Wed, 16 May 2012 07:30:54 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 030BDF811DA;
	Wed, 16 May 2012 07:30:41 -0600 (MDT)
Message-ID: <4FB3AC00.2070901@mlbassoc.com>
Date: Wed, 16 May 2012 07:30:40 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1337173763-27981-1-git-send-email-gary@mlbassoc.com>
	<CA+chaQfhDC9crzPtxRbQ7NSvjDQRzYibiWPhTCOHd2bkhnuC3A@mail.gmail.com>
In-Reply-To: <CA+chaQfhDC9crzPtxRbQ7NSvjDQRzYibiWPhTCOHd2bkhnuC3A@mail.gmail.com>
Subject: Re: [PATCH] Fix X server on PowerPC when using GCC 4.7.x
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
X-List-Received-Date: Wed, 16 May 2012 13:40:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-16 07:23, Martin Jansa wrote:
> On Wed, May 16, 2012 at 3:09 PM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> The function XaceHook() was trying to do something like this:
>>    void *ptr;
>>    switch(XX) {
>>       case a:
>>          define_some_structure A;
>>          ptr =&A;
>>          break;
>>       case b:
>>          define_some_structure B;
>>          ptr =&B;
>>          break;
>>    }
>>    call_some_function(ptr);
>>
>> Clearly this is not even legal - the scope of the variables A&  B
>> is not well defined outside of the switch cases.  This code pattern
>> stopped working on PowerPC with GCC>= 4.7.1 (it has worked forever
>> up to&  including 4.6.3).  Replace this sequence with legal code:
>>    switch(XX) {
>>       case a:
>>          define_some_structure A;
>>          call_some_function(&A);
>>          break;
>>       case b:
>>          define_some_structure B;
>>          call_some_function(&B);
>>          break;
>>    }
>> ---
>>   .../fix-bogus-stack-variables.patch                |  130 ++++++++++++++++++++
>>   .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    3 +-
>>   2 files changed, 132 insertions(+), 1 deletions(-)
>>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
>>
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
>> new file mode 100644
>> index 0000000..0946dfb
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
>> @@ -0,0 +1,130 @@
>> +Index: xorg-server-1.7.99.2/Xext/xace.c
>> +===================================================================
>> +--- xorg-server-1.7.99.2.orig/Xext/xace.c
>> ++++ xorg-server-1.7.99.2/Xext/xace.c
>> +@@ -87,8 +87,7 @@ void XaceHookAuditEnd(ClientPtr ptr, int
>> +  */
>> + int XaceHook(int hook, ...)
>> + {
>> +-    pointer calldata; /* data passed to callback */
>> +-    int *prv = NULL;  /* points to return value from callback */
>> ++    int res = Success;
>> +     va_list ap;               /* argument list */
>> +     va_start(ap, hook);
>> +
>> +@@ -109,8 +108,8 @@ int XaceHook(int hook, ...)
>> +           rec.parent = va_arg(ap, pointer);
>> +           rec.access_mode = va_arg(ap, Mask);
>> +           rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++          CallCallbacks(&XaceHooks[hook],&rec);
>> ++          res = rec.status;
>> +           break;
>> +       }
>> +       case XACE_DEVICE_ACCESS: {
>> +@@ -119,8 +118,8 @@ int XaceHook(int hook, ...)
>> +           rec.dev = va_arg(ap, DeviceIntPtr);
>> +           rec.access_mode = va_arg(ap, Mask);
>> +           rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++          CallCallbacks(&XaceHooks[hook],&rec);
>> ++          res = rec.status;
>> +           break;
>> +       }
>> +       case XACE_SEND_ACCESS: {
>> +@@ -131,8 +130,8 @@ int XaceHook(int hook, ...)
>> +           rec.events = va_arg(ap, xEventPtr);
>> +           rec.count = va_arg(ap, int);
>> +           rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++          CallCallbacks(&XaceHooks[hook],&rec);
>> ++          res = rec.status;
>> +           break;
>> +       }
>> +       case XACE_RECEIVE_ACCESS: {
>> +@@ -142,8 +141,8 @@ int XaceHook(int hook, ...)
>> +           rec.events = va_arg(ap, xEventPtr);
>> +           rec.count = va_arg(ap, int);
>> +           rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++          CallCallbacks(&XaceHooks[hook],&rec);
>> ++          res = rec.status;
>> +           break;
>> +       }
>> +       case XACE_CLIENT_ACCESS: {
>> +@@ -152,8 +151,8 @@ int XaceHook(int hook, ...)
>> +           rec.target = va_arg(ap, ClientPtr);
>> +           rec.access_mode = va_arg(ap, Mask);
>> +           rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++          CallCallbacks(&XaceHooks[hook],&rec);
>> ++          res = rec.status;
>> +           break;
>> +       }
>> +       case XACE_EXT_ACCESS: {
>> +@@ -162,8 +161,8 @@ int XaceHook(int hook, ...)
>> +           rec.ext = va_arg(ap, ExtensionEntry*);
>> +           rec.access_mode = DixGetAttrAccess;
>> +           rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++          CallCallbacks(&XaceHooks[hook],&rec);
>> ++          res = rec.status;
>> +           break;
>> +       }
>> +       case XACE_SERVER_ACCESS: {
>> +@@ -171,8 +170,8 @@ int XaceHook(int hook, ...)
>> +           rec.client = va_arg(ap, ClientPtr);
>> +           rec.access_mode = va_arg(ap, Mask);
>> +           rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++          CallCallbacks(&XaceHooks[hook],&rec);
>> ++          res = rec.status;
>> +           break;
>> +       }
>> +       case XACE_SCREEN_ACCESS:
>> +@@ -182,15 +181,15 @@ int XaceHook(int hook, ...)
>> +           rec.screen = va_arg(ap, ScreenPtr);
>> +           rec.access_mode = va_arg(ap, Mask);
>> +           rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++          CallCallbacks(&XaceHooks[hook],&rec);
>> ++          res = rec.status;
>> +           break;
>> +       }
>> +       case XACE_AUTH_AVAIL: {
>> +           XaceAuthAvailRec rec;
>> +           rec.client = va_arg(ap, ClientPtr);
>> +           rec.authId = va_arg(ap, XID);
>> +-          calldata =&rec;
>> ++          CallCallbacks(&XaceHooks[hook],&rec);
>> +           break;
>> +       }
>> +       case XACE_KEY_AVAIL: {
>> +@@ -198,7 +197,7 @@ int XaceHook(int hook, ...)
>> +           rec.event = va_arg(ap, xEventPtr);
>> +           rec.keybd = va_arg(ap, DeviceIntPtr);
>> +           rec.count = va_arg(ap, int);
>> +-          calldata =&rec;
>> ++          CallCallbacks(&XaceHooks[hook],&rec);
>> +           break;
>> +       }
>> +       default: {
>> +@@ -208,9 +207,7 @@ int XaceHook(int hook, ...)
>> +     }
>> +     va_end(ap);
>> +
>> +-    /* call callbacks and return result, if any. */
>> +-    CallCallbacks(&XaceHooks[hook], calldata);
>> +-    return prv ? *prv : Success;
>> ++    return res;
>> + }
>> +
>> + /* XaceCensorImage
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
>> index 360a0f3..dc17e2b 100644
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
>> @@ -21,6 +21,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
>>         file://crosscompile.patch \
>>         file://error-address-work-around.patch \
>>         file://nodolt.patch"
>> +        file://fix-bogus-stack-variables.patch \
>>   #      file://kdrive-evdev.patch
>>   #      file://kdrive-use-evdev.patch
>>   #      file://enable-builtin-fonts.patch
>> --
>> 1.7.7.6
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> Isn't this better fix?
> http://cgit.freedesktop.org/xorg/xserver/commit/Xext/xace.c?id=6dae7f3792611aace1df0cca63bf50c50d93de43

Either way - they are pretty much the same (I had actually done it the
freedesktop.org way before but I thought it obfuscated what was happening).
I'm sure the person that wrote this was being clever, trying to have only
one function  call, but a smart compiler will unwind this anyway and writing
it out explicitly is easier to read...

All I care is that it gets fixed and my X server starts working again :-)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


