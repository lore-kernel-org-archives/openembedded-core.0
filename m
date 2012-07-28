Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SvCCv-0000Fi-B1
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 20:57:45 +0200
Received: by eaaq10 with SMTP id q10so627467eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2012 11:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=3Kt4exDkTkaptcFiI01fd0f6KLz4i/zuypq+dUuIwEc=;
	b=kSZtYce8NyFmtaykTWw+qYE8sWj1OlRBiuAk8Ms3PmEcu5/Jlu/JE5CdGsVaifLvwF
	JqJPzIJpCe548Xts31XgM444HuMBsOaxyLfSmh65Pk7ovJm14CCVQWDhp+PCZ7y+qxuD
	KWAZRE9A1sXjl9MMwHSUYpeKPrb4FuloA5mfqDpQeeT0785PTC2qAERbwQtKUyaivXpg
	5fblCzdQGkP+l9aHFuvrigQ13ad6FRPx2HE9aQASYvoIqwNN0X+597mlw4cq+Qx0xMlv
	sChT/VBpS3j7O5kIm9GYAzykDrBwFNC93QV6WC82qtqQsKuhDnLZtoEOjua3y/p4f68U
	42qw==
Received: by 10.14.173.71 with SMTP id u47mr6765092eel.22.1343501171883; Sat,
	28 Jul 2012 11:46:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Sat, 28 Jul 2012 11:45:41 -0700 (PDT)
In-Reply-To: <5013C1BB.9020504@communistcode.co.uk>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
	<4d738395bf7cd05c924a9facf9677bab784cb1b6.1341763346.git.raj.khem@gmail.com>
	<5013C1BB.9020504@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Jul 2012 11:45:41 -0700
Message-ID: <CAMKF1spLQ5M7fpjninE_Gbyq=faW9V0psMN1Hb9NZKfXGDTMBg@mail.gmail.com>
To: ml@communistcode.co.uk, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/19] bison: Fix for gets being removed from eglibc 2.16
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
X-List-Received-Date: Sat, 28 Jul 2012 18:57:45 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 28, 2012 at 3:40 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> On 08/07/2012 17:10, Khem Raj wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../recipes-devtools/bison/bison/remove-gets.patch |   20
>> ++++++++++++++++++++
>>   meta/recipes-devtools/bison/bison_2.5.bb           |    6 ++++--
>>   2 files changed, 24 insertions(+), 2 deletions(-)
>>   create mode 100644 meta/recipes-devtools/bison/bison/remove-gets.patch
>>
>> diff --git a/meta/recipes-devtools/bison/bison/remove-gets.patch
>> b/meta/recipes-devtools/bison/bison/remove-gets.patch
>> new file mode 100644
>> index 0000000..2dfa00f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/bison/bison/remove-gets.patch
>> @@ -0,0 +1,20 @@
>> +gets has been removed from eglibc 2.16
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +Upstream-Status: Pending
>> +Index: bison-2.5/lib/stdio.in.h
>> +===================================================================
>> +--- bison-2.5.orig/lib/stdio.in.h      2012-07-04 09:09:48.336532195
>> -0700
>> ++++ bison-2.5/lib/stdio.in.h   2012-07-04 09:10:22.868533884 -0700
>> +@@ -180,8 +180,10 @@
>> + /* It is very rare that the developer ever has full control of stdin,
>> +    so any use of gets warrants an unconditional warning.  Assume it is
>> +    always declared, since it is required by C89.  */
>> ++#if defined gets
>> + #undef gets
>> + _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
>> ++#endif
>> +
>> + #if @GNULIB_FOPEN@
>> + # if @REPLACE_FOPEN@
>> diff --git a/meta/recipes-devtools/bison/bison_2.5.bb
>> b/meta/recipes-devtools/bison/bison_2.5.bb
>> index fc3bb6d..687f06a 100644
>> --- a/meta/recipes-devtools/bison/bison_2.5.bb
>> +++ b/meta/recipes-devtools/bison/bison_2.5.bb
>> @@ -9,14 +9,16 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>   SECTION = "devel"
>>   DEPENDS = "bison-native flex-native"
>>   -PR = "r1"
>> +PR = "r2"
>>     BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
>>            file://m4.patch \
>>           "
>>     SRC_URI = "${BASE_SRC_URI} \
>> -        file://fix_cross_manpage_building.patch "
>> +           file://fix_cross_manpage_building.patch \
>> +           file://remove-gets.patch \
>> +          "
>>     SRC_URI[md5sum] = "687e1dcd29452789d34eaeea4c25abe4"
>>   SRC_URI[sha256sum] =
>> "722def46e4a19a5b7a579ef30db1965f86c37c1a20a5f0113743a2e4399f7c99"
>
>
> Hi Khem,
>
> This patch doesn't fix the Bison gets issue for me, I had to create a patch
> that removed the line altogether to get it to compile successfully. Even
> though gets isn't present on my system it still matches the #if defined gets
> and tries to #undef gets which results in an error.
>
> However, I don't think removing the line altogether is the correct fix for
> the global userbase...
>

send me the preprocessed output.

> Regards,
> Jack.
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


