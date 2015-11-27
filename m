Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4446011F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 01:31:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAR1V8gP031932
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 17:31:08 -0800
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 26 Nov 2015 17:31:08 -0800
To: Mark Hatle <mark.hatle@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1448534065.git.liezhi.yang@windriver.com>
	<ffc91bbcddb6b8806c4e4aacaaaf8ea122adc1c1.1448534065.git.liezhi.yang@windriver.com>
	<56571E00.2040503@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5657B25A.30901@windriver.com>
Date: Fri, 27 Nov 2015 09:31:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56571E00.2040503@windriver.com>
Subject: Re: [PATCH 1/1] rpm: fix for N32 MIPS64
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
X-List-Received-Date: Fri, 27 Nov 2015 01:31:13 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Thanks, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/n32


commit b817f6b15376e9fc95c6ab50c6dae825a6c81ce6
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Thu Nov 26 02:05:17 2015 -0800

     rpm: fix for N32 MIPS64

     Issue: LIN8-1726

     Older versions of 'file' reported it as N32 MIPS32, newer versions are
     reporting it as N32 MIPS64. So we should check for both.

     $ file image/usr/bin/getent
     getent: ELF 32-bit MSB executable, MIPS, N32 MIPS64 [snip]

     (LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20151126

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch 
b/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
new file mode 100644
index 0000000..99cdf85
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
@@ -0,0 +1,33 @@
+From e864ec768ad0736bddcd951b2db8fe12c7b30e4e Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 26 Nov 2015 01:36:40 -0800
+Subject: [PATCH] lib/rpmfc.c: fix for N32 MIPS64
+
+Older versions of 'file' reported it as N32 MIPS32, newer versions are
+reporting it as N32 MIPS64. So we should check for both.
+
+$ file image/usr/bin/getent
+getent: ELF 32-bit MSB executable, MIPS, N32 MIPS64 [snip]
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ lib/rpmfc.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/rpmfc.c b/lib/rpmfc.c
+index fde00c7..c9c82bf 100644
+--- a/lib/rpmfc.c
++++ b/lib/rpmfc.c
+@@ -575,6 +575,7 @@ static struct rpmfcTokens_s rpmfcTokens[] = {
+   { " not stripped",          RPMFC_NOTSTRIPPED },
+   { " archive",                       RPMFC_ARCHIVE },
+
++  { "MIPS, N32 MIPS64",               RPMFC_ELFMIPSN32|RPMFC_INCLUDE },
+   { "MIPS, N32 MIPS32",               RPMFC_ELFMIPSN32|RPMFC_INCLUDE },
+   { "ELF 32-bit",             RPMFC_ELF32|RPMFC_INCLUDE },
+   { "ELF 64-bit",             RPMFC_ELF64|RPMFC_INCLUDE },
+--
+1.7.9.5
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb 
b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 951b251..0d14728 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -111,6 +111,7 @@ SRC_URI = "cvs://anonymous@rpm5.org/cvs;tag=rpm-5_4;module=rpm \
            file://rpm-rpmpgp-fix.patch \
            file://rpm-disable-Wno-override-init.patch \
            file://rpm-realpath.patch \
+          file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
           "

  # Uncomment the following line to enable platform score debugging
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb 
b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 3930410..8e1d3cb 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -101,6 +101,7 @@ SRC_URI = 
"http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
            file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
            file://configure.ac-check-for-both-gpg2-and-gpg.patch \
            file://0001-define-EM_AARCH64.patch \
+          file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
           "

  # Uncomment the following line to enable platform score debugging


// Robert

On 11/26/2015 10:58 PM, Mark Hatle wrote:
> On 11/26/15 4:35 AM, Robert Yang wrote:
>> It is 'N32 MIPS64', not 'N32 MIPS32' as command file shows:
>> $ file image/usr/bin/getent
>> getent: ELF 32-bit MSB executable, MIPS, N32 MIPS64 [snip]
>>
>> And "rpm -qp --filecolor" was wrong (it was 1, but should be 4), which
>> caused multilib installation error.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch   |   34 ++++++++++++++++++++
>>   meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    1 +
>>   meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    1 +
>>   3 files changed, 36 insertions(+)
>>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch b/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
>> new file mode 100644
>> index 0000000..a516574
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
>> @@ -0,0 +1,34 @@
>> +From 16dc683aa50be9789d1674734b06a8a955ff22ad Mon Sep 17 00:00:00 2001
>> +From: Robert Yang <liezhi.yang@windriver.com>
>> +Date: Thu, 26 Nov 2015 01:36:40 -0800
>> +Subject: [PATCH] lib/rpmfc.c: fix for N32 MIPS64
>> +
>> +It is 'N32 MIPS64', not 'N32 MIPS32' as command file shows:
>> +$ file image/usr/bin/getent
>> +getent: ELF 32-bit MSB executable, MIPS, N32 MIPS64 [snip]
>> +
>> +And "rpm -qp --filecolor" was wrong (it was 1, but should be 4).
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> +---
>> + lib/rpmfc.c |    2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/lib/rpmfc.c b/lib/rpmfc.c
>> +index fde00c7..49779f8 100644
>> +--- a/lib/rpmfc.c
>> ++++ b/lib/rpmfc.c
>> +@@ -575,7 +575,7 @@ static struct rpmfcTokens_s rpmfcTokens[] = {
>> +   { " not stripped",		RPMFC_NOTSTRIPPED },
>> +   { " archive",			RPMFC_ARCHIVE },
>> +
>> +-  { "MIPS, N32 MIPS32",		RPMFC_ELFMIPSN32|RPMFC_INCLUDE },
>> ++  { "MIPS, N32 MIPS64",		RPMFC_ELFMIPSN32|RPMFC_INCLUDE },
>
> I mentioned this to Robert off the list as well.  But I believe we need to look
> for both N32 MIPS32 and N32 MIPS64 here.
>
> Older versions of file 'magic' (which is what rpmfc.c is looking at) reported
> 'N32 MIPS32', while it appears newer versions report 'N32 MIPS64'.  So checking
> both is my recommendation.  But this does fix an issue where you can't install
> both N32 and O32 multilibs without ELF collisions.
>
> --Mark
>
>> +   { "ELF 32-bit",		RPMFC_ELF32|RPMFC_INCLUDE },
>> +   { "ELF 64-bit",		RPMFC_ELF64|RPMFC_INCLUDE },
>> +
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
>> index 951b251..0d14728 100644
>> --- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
>> @@ -111,6 +111,7 @@ SRC_URI = "cvs://anonymous@rpm5.org/cvs;tag=rpm-5_4;module=rpm \
>>   	   file://rpm-rpmpgp-fix.patch \
>>   	   file://rpm-disable-Wno-override-init.patch \
>>   	   file://rpm-realpath.patch \
>> +	   file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
>>   	  "
>>
>>   # Uncomment the following line to enable platform score debugging
>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
>> index 3930410..8e1d3cb 100644
>> --- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
>> @@ -101,6 +101,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
>>   	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
>>   	   file://configure.ac-check-for-both-gpg2-and-gpg.patch \
>>   	   file://0001-define-EM_AARCH64.patch \
>> +	   file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
>>   	  "
>>
>>   # Uncomment the following line to enable platform score debugging
>>
>

