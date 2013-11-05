Return-Path: <net147@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id D00DF6D44C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 05:16:42 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id q10so7835339pdj.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2013 21:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=NHRcy/DfGPHPEgvskuhe+wTRV+i+Bsa/MhU7Q14LCQU=;
	b=H4tdcvqfKMw1T1DkYVVfpFCGusIr8szbCAcj2kwx4X/Q+p4aTPPunSFqISyNm2bm8p
	7HkpFddUsD8aqGvmGnu2dyz3JseVu8SNpufoIbKRSuuByKcOEdxqR4YVoJoavBBixW+3
	Z+n8GNp3xHPvsvzwrwtQytjEUDZ38/feV1bX9q2cuvfDqXDwt+zGjJswDwULl27HVk3A
	qaFArbZBaQO4QbDsiFmJ/uCRhTLS46rFfxBXCvWuBsNBStP5npGEviDgypWOOABTt1X3
	qJ1yHGwZXbSnfBO1cqUEMk7ifUJ3/zx5PVLfPPn+fGjjyenaARBNxjKX1+JCYECLySQw
	cpLg==
X-Received: by 10.69.0.228 with SMTP id bb4mr21227358pbd.66.1383628604640;
	Mon, 04 Nov 2013 21:16:44 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	qn1sm31897794pbc.34.2013.11.04.21.16.42 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Nov 2013 21:16:43 -0800 (PST)
Message-ID: <52787DF9.2080902@gmail.com>
Date: Tue, 05 Nov 2013 16:11:21 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: ml@communistcode.co.uk, openembedded-core@lists.openembedded.org
References: <1383546699-23050-1-git-send-email-net147@gmail.com>
	<52779491.2020505@communistcode.co.uk>
In-Reply-To: <52779491.2020505@communistcode.co.uk>
Subject: Re: [PATCH] eglibc_2.17.bb: accept make versions 4.0 and greater
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
X-List-Received-Date: Tue, 05 Nov 2013 05:16:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/2013 11:35 PM, Jack Mitchell wrote:
> On 04/11/13 06:31, Jonathan Liu wrote:
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta/recipes-core/eglibc/eglibc-2.17/make-4.patch | 31 +++++++++++++++++++++++
>>   meta/recipes-core/eglibc/eglibc_2.17.bb           |  1 +
>>   2 files changed, 32 insertions(+)
>>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/make-4.patch
>>
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.17/make-4.patch b/meta/recipes-core/eglibc/eglibc-2.17/make-4.patch
>> new file mode 100644
>> index 0000000..8349c18
>> --- /dev/null
>> +++ b/meta/recipes-core/eglibc/eglibc-2.17/make-4.patch
>> @@ -0,0 +1,31 @@
>> +Accept make versions 4.0 and greater
>> +
>> +Backport of glibc 28d708c44bc47b56f6551ff285f78edcf61c208a.
>> +
>> +Upstream-Status: Backport
>> +Signed-off-by: Jonathan Liu <net147@gmail.com>
>> +
>> +diff -Nur libc.orig/configure libc/configure
>> +--- libc.orig/configure	2012-12-03 08:11:45.000000000 +1100
>> ++++ libc/configure	2013-11-04 17:15:31.344984184 +1100
>> +@@ -4995,7 +4995,7 @@
>> +   ac_prog_version=`$MAKE --version 2>&1 | sed -n 's/^.*GNU Make[^0-9]*\([0-9][0-9.]*\).*$/\1/p'`
>> +   case $ac_prog_version in
>> +     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
>> +-    3.79* | 3.[89]*)
>> ++    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
>> +        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
>> +     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
>> +
>> +diff -Nur libc.orig/configure.in libc/configure.in
>> +--- libc.orig/configure.in	2012-12-03 08:11:45.000000000 +1100
>> ++++ libc/configure.in	2013-11-04 17:15:31.351650849 +1100
>> +@@ -958,7 +958,7 @@
>> +   critic_missing="$critic_missing gcc")
>> + AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
>> +   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
>> +-  [3.79* | 3.[89]*], critic_missing="$critic_missing make")
>> ++  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
>> +
>> + AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
>> +   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bb b/meta/recipes-core/eglibc/eglibc_2.17.bb
>> index 22129e6..c62ff36 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.17.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
>> @@ -28,6 +28,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr22
>>              file://tzselect-awk.patch \
>>              file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
>>              file://fix-tibetian-locales.patch \
>> +           file://make-4.patch \
>>              ${BACKPORTS} \
>>             "
>>   BACKPORTS = "\
>>
> Jonathan,
>
> Does this actually build and work on your system? I have had issues with
> make 4.0 and autotools 2.69 which lead to a failed configure/compile.
>
> Cheers,
>
I was able to build eglibc 2.18 and compile images for my x86 target 
successfully.

Relevant output from configure:
checking version of make... 4.0, ok
...
checking for autoconf... autoconf
checking whether autoconf works... no
configure: WARNING:
*** These auxiliary programs are missing or incompatible versions: autoconf
*** some features will be disabled.
*** Check the INSTALL file for required versions.

I don't build any SDKs though.

Regards,
Jonathan

