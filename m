Received: from mail-ob0-f177.google.com ([209.85.214.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U74jV-0007sO-6B
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 14:56:47 +0100
Received: by mail-ob0-f177.google.com with SMTP id wc18so4800161obb.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 05:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=L3sPmNzO99sjAFUKfQgENCdhXEFT4l7Ysdaofh44ftQ=;
	b=sXTl/8p5CB6C4VR6S7fJYy/ICI4qGxjWOmd705YHHKPbTrB3ZZGJw0t3FV0StQkw6Z
	YvqKz8RbLRvsOc6dkh8u/OSolTFMVbVVINeJWvEVzCzuvgOQOqKyQ8Eq+AVYIk5xfN2K
	lEF4sbxTKsbmM3HEV3XQjiAXckMG4ARM6zG+Zr6+EJOBPFDrg9two7Bz7lWXIBSornsY
	jgkw5gqkbU6ARAvC417i3R6ZkjSadSOjHJ6LuWF80HEbvTjpG+5Smghh9SvmVB1jEvPS
	bWvKCmT8V1EOcYMS41MXR8MCi5q952n8A+Xq5bwd4eQUVsE2bAeNI+W2Q7racr6HG6gw
	oV0w==
MIME-Version: 1.0
X-Received: by 10.182.231.39 with SMTP id td7mr4767967obc.86.1361108438213;
	Sun, 17 Feb 2013 05:40:38 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sun, 17 Feb 2013 05:40:37 -0800 (PST)
In-Reply-To: <1361087244.31795.105.camel@ted>
References: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
	<1361049644-27904-2-git-send-email-otavio@ossystems.com.br>
	<1361087244.31795.105.camel@ted>
Date: Sun, 17 Feb 2013 10:40:37 -0300
X-Google-Sender-Auth: h9QsgWl322loNWbeuPKfL9eyrIY
Message-ID: <CAP9ODKoC6MHFy11Pp6=78+GbfuKnL3xYs6EfNcKPA6HudUk_vQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] dbus: Drop libx11 dependency when building without 'x11' distro feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Feb 2013 13:57:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 17, 2013 at 4:47 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2013-02-16 at 19:20 -0200, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta/recipes-core/dbus/dbus.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
>> index 292ab29..cebab28 100644
>> --- a/meta/recipes-core/dbus/dbus.inc
>> +++ b/meta/recipes-core/dbus/dbus.inc
>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>>  X11DEPENDS = "virtual/libx11 libsm"
>>  DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>>  DEPENDS_class-native = "expat-native virtual/libintl-native"
>> -DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl virtual/libx11"
>> +DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
>>  RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest', '', d)}"
>>  RDEPENDS_class-native = ""
>
> This tends to be a really bad idea for dbus-nativesdk. If you install an
> SDK compiled with these options into PATH only a system which does have
> x11, it will break functionality in a way unacceptable to users.

I don't see how it'd break anything being deployed in a toolchain. We
don't initialize the dbus daemon so it is mostly used to fulfill
dependencies.

> I'm not sure we should ever ship dbus-launch with the SDK so perhaps we
> should just delete it like we now do for the -native version, then we
> could drop the x11 requirement in all cases.

That could be an option (ignore x11 feature for nativesdk) and it does
make some sense.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


