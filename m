Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id C07766F89F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 18:58:44 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f10so9521940yha.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 11:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=8TWwESvG+jDyH3HFV7t3OYxs9n+zpDTMa0o2SvC3Ul0=;
	b=fMyTw+10cHcqAv+Nr3ZHBwMaI9Ya5/slMqPWqs0tqy7H75Se/NwyI4cLJYxMxeyQw5
	dCbavlcWVnvdQQ1XcH9SjsE0F8WausEK4xJ41D/NxR59f84t6yFLsHJv/ajmoKShrLIi
	5CySpU+00zBXm8J0QgmQFvXj3KK0BQDoJnObPoXcoFxxuyUSak8sPzRkvfi2is8v7oN+
	U70f82tUiuq9wO+cvGaR/1UAe1e+GhG+Goh8lfcjp32cCv3roFck05BD+8i/Y5HZarhO
	Ymxjv02q6pkbqvvu39fhon8nSthl40/meHIETahHKBytjRMF7hTSblehqPXg+ikgAQih
	2krQ==
MIME-Version: 1.0
X-Received: by 10.236.110.77 with SMTP id t53mr46596264yhg.78.1396378725832;
	Tue, 01 Apr 2014 11:58:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 1 Apr 2014 11:58:45 -0700 (PDT)
In-Reply-To: <20140401185000.GA3370@denix.org>
References: <1396372080-27607-1-git-send-email-otavio@ossystems.com.br>
	<1396372080-27607-2-git-send-email-otavio@ossystems.com.br>
	<20140401185000.GA3370@denix.org>
Date: Tue, 1 Apr 2014 15:58:45 -0300
X-Google-Sender-Auth: _3L3meisF66rK5Pxm3fviN_70i4
Message-ID: <CAP9ODKpgDQ-ADUUfPyY1+73LZrxqeKHA4qc=2FxVWVPEk0uCGg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] alsa-tools: Enable GTK support for X11 and Wayland
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
X-List-Received-Date: Tue, 01 Apr 2014 18:58:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 1, 2014 at 3:50 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Apr 01, 2014 at 02:08:00PM -0300, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> This patch depends on the alsa-tools one I sent some minutes ago
>>
>>  meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
>> index 4f64a38..fdbe82a 100644
>> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
>> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
>>  SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
>>             file://mips_has_no_io_h.patch \
>>             file://autotools.patch \
>> -           ${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)}"
>> +           ${@base_any_contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)}"
>
> What's the reason to use any_contains here?

Forgot to add the wayland to the list. Good catch.

>>  SRC_URI[md5sum] = "1ea381d00a6069a98613aa7effa4cb51"
>>  SRC_URI[sha256sum] = "6562611b5a6560712f109e09740a9d4fa47296b07ed9590cb44139c5f154ada2"
>> @@ -20,7 +20,7 @@ inherit autotools-brokensep
>>
>>  EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
>>
>> -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
>> +PACKAGECONFIG ??= "${@base_any_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
>
> Same here - what's the reason for the change?

Same here.

>>  PACKAGECONFIG[gtk+] = ",,gtk+ gtk+3,"
>>
>>  # configure.ac/.in doesn't exist so force copy

I am looking at the other changes Richard has commented and will send a v2.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

