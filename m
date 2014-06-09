Return-Path: <akuster808@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA8A609C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 21:06:38 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id up15so5399282pbc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 14:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=bd17GxUDni8PPxmmuUKKnKlOL4lHs/RoAg6OSRLn7gA=;
	b=IwcFOZDcseB4L569whbxE8qXa2s0mzkH0I6/Y/Wn1uZKqAC9MgPHgBTG+UQAx3kvvX
	+r36pBgS6e9O/zdDZCA4gQt6En0LUSt/MidKEApIqr6YnMBBTDuDzxRn8PiFVdXr9phD
	pYRRlrR+yIvoXeQ7YM872uaGmbR/XfrOZUUyFuAY092qa21TsGWwYcD40T3Efp7kYYbA
	YSAyA5PCWNT1gyqxuRvPOedrL6hPczGHqEDOgu5WPjmXuLZUBWg/pBVNtf2rPRP2JB/0
	2P2tQeXQP8UkMHb1nTa17tmnt8DnvFK4VzmOzk6YxcfGc/mthqfBFa+iTDlB4wL0M4Cq
	PA5Q==
X-Received: by 10.66.150.228 with SMTP id ul4mr1001628pab.16.1402347999780;
	Mon, 09 Jun 2014 14:06:39 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	nw13sm1939150pab.37.2014.06.09.14.06.37 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Jun 2014 14:06:38 -0700 (PDT)
Message-ID: <539621DA.5010706@gmail.com>
Date: Mon, 09 Jun 2014 14:06:34 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, Armin Kuster <akuster@mvista.com>, 
	openembedded-core@lists.openembedded.org
References: <1402345571-28475-1-git-send-email-akuster@mvista.com>
	<53961C58.3020509@linux.intel.com>
In-Reply-To: <53961C58.3020509@linux.intel.com>
Subject: Re: [PATCH] v2 cups: Shouldn't link against libgcrypt without using gcrypt functions
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
X-List-Received-Date: Mon, 09 Jun 2014 21:06:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Saul,

Thanks. I have booked marked 
http://openembedded.org/wiki/Commit_Patch_Message_Guidelines
and maybe I will to remember to review that.

- Armin

On 06/09/2014 01:43 PM, Saul Wold wrote:
> On 06/09/2014 01:26 PM, Armin Kuster wrote:
>> backported patch from cups.org to address the cryto dependency issue 
>> I am seeing.
>>
>> http://www.cups.org/str.php?L4399
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   meta/recipes-extended/cups/cups.inc                |  1 +
>>   .../cups/cups/cups-no-gcrypt.patch                 | 40 
>> ++++++++++++++++++++++
>>   2 files changed, 41 insertions(+)
>>   create mode 100644 
>> meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
>>
>> diff --git a/meta/recipes-extended/cups/cups.inc 
>> b/meta/recipes-extended/cups/cups.inc
>> index fd88552..3b8027b 100644
>> --- a/meta/recipes-extended/cups/cups.inc
>> +++ b/meta/recipes-extended/cups/cups.inc
>> @@ -8,6 +8,7 @@ SRC_URI = 
>> "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
>>              file://use_echo_only_in_init.patch \
>> file://0001-don-t-try-to-run-generated-binaries.patch \
>>              file://cups_serverbin.patch \
>> +           file://cups-no-gcrypt.patch \
>>         "
>>
>>   LEAD_SONAME = "libcupsdriver.so"
>> diff --git a/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch 
>> b/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
>> new file mode 100644
>> index 0000000..465d353
>> --- /dev/null
>> +++ b/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
>
> Please add an Upstream-Status: Backport and included the pointer to 
> the bug entry.
>
> The patch file itself needs a Signed-off-by: tag.
>
> Thanks
>     Sau!
>
>> @@ -0,0 +1,40 @@
>> +Description: Don't build-depend on libgcrypt, as nothing is used 
>> from it
>> +Author: Didier Raboud <odyx@debian.org>
>> +Bug-Debian: https://bugs.debian.org/638416
>> +Bug: http://www.cups.org/str.php?L????
>> +Last-Update: 2014-04-07
>> +--- a/config-scripts/cups-ssl.m4
>> ++++ b/config-scripts/cups-ssl.m4
>> +@@ -66,7 +66,6 @@
>> +     dnl Then look for GNU TLS...
>> +     if test $have_ssl = 0 -a "x$enable_gnutls" != "xno" -a 
>> "x$PKGCONFIG" != x; then
>> +         AC_PATH_PROG(LIBGNUTLSCONFIG,libgnutls-config)
>> +-        AC_PATH_PROG(LIBGCRYPTCONFIG,libgcrypt-config)
>> +     if $PKGCONFIG --exists gnutls; then
>> +         have_ssl=1
>> +         SSLLIBS=`$PKGCONFIG --libs gnutls`
>> +@@ -84,14 +83,6 @@
>> +     if test $have_ssl = 1; then
>> +         CUPS_SERVERCERT="ssl/server.crt"
>> +         CUPS_SERVERKEY="ssl/server.key"
>> +-
>> +-            if $PKGCONFIG --exists gcrypt; then
>> +-            SSLLIBS="$SSLLIBS `$PKGCONFIG --libs gcrypt`"
>> +-            SSLFLAGS="$SSLFLAGS `$PKGCONFIG --cflags gcrypt`"
>> +-        elif test "x$LIBGCRYPTCONFIG" != x; then
>> +-            SSLLIBS="$SSLLIBS `$LIBGCRYPTCONFIG --libs`"
>> +-            SSLFLAGS="$SSLFLAGS `$LIBGCRYPTCONFIG --cflags`"
>> +-        fi
>> +     fi
>> +     fi
>> +
>> +--- a/cups/http-private.h
>> ++++ b/cups/http-private.h
>> +@@ -80,7 +80,6 @@
>> + #  elif defined HAVE_GNUTLS
>> + #    include <gnutls/gnutls.h>
>> + #    include <gnutls/x509.h>
>> +-#    include <gcrypt.h>
>> + #  elif defined(HAVE_CDSASSL)
>> + #    include <CoreFoundation/CoreFoundation.h>
>> + #    include <Security/Security.h>
>>


