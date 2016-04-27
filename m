Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E36696018C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 01:10:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3R1AMRE003122
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Apr 2016 18:10:22 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Apr 2016 18:10:21 -0700
To: Khem Raj <raj.khem@gmail.com>, Denys Dmytriyenko <denis@denix.org>
References: <cover.1461650616.git.liezhi.yang@windriver.com>
	<c53c41d6a33a354b8030e5a4b325aeb2753e9258.1461650616.git.liezhi.yang@windriver.com>
	<20160426143425.GF31113@denix.org>
	<EB8A7A83-DED7-4406-8EE2-829D71970499@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5720117C.9070305@windriver.com>
Date: Wed, 27 Apr 2016 09:10:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <EB8A7A83-DED7-4406-8EE2-829D71970499@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] coreutils: fix for native and nativesdk
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
X-List-Received-Date: Wed, 27 Apr 2016 01:10:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 04/27/2016 12:42 AM, Khem Raj wrote:
>
>> On Apr 26, 2016, at 7:34 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> On Mon, Apr 25, 2016 at 11:04:37PM -0700, Robert Yang wrote:
>>> From: Dengke Du <dengke.du@windriver.com>
>>>
>>> The do_install_append is used for moving/renaming for ALTERNATIVE, but
>>> it breaks native, for example there is no ln, but ln.coreutils, that
>>> makes coreutils-native don't work. This patch fixes the problem.
>>>
>>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>> meta/recipes-core/coreutils/coreutils_8.25.bb | 10 +++++-----
>>> 1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb b/meta/recipes-core/coreutils/coreutils_8.25.bb
>>> index 419a693..77b3862 100644
>>> --- a/meta/recipes-core/coreutils/coreutils_8.25.bb
>>> +++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
>>> @@ -70,6 +70,11 @@ do_compile_prepend () {
>>> }
>>>
>>> do_install_append() {
>>> +	if [ "${CLASSOVERRIDE}" = "class-native" ]; then
>>> +		rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
>>> +		return
>>> +	fi
>>
>> Would that skip the rest of do_install_append() for class-native due to the
>> return call? Is it expected?
>
> it would ignore anything below it yes. Can this be done via override instead

Yes, thanks.

>
> do_something_class-native () { …. }

Updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/core
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/core

Dengke Du (1):
   coreutils: fix for native and nativesdk

Author: Dengke Du <dengke.du@windriver.com>
Date:   Mon Apr 25 22:59:19 2016 -0700

     coreutils: fix for native and nativesdk

     The do_install_append is used for moving/renaming for ALTERNATIVE, but
     it breaks native, for example there is no ln, but ln.coreutils, that
     makes coreutils-native don't work. This patch fixes the problem.

     Signed-off-by: Dengke Du <dengke.du@windriver.com>
     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb 
b/meta/recipes-core/coreutils/coreutils_8.25.bb
index 419a693..b1aaf53 100644
--- a/meta/recipes-core/coreutils/coreutils_8.25.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
@@ -69,6 +69,15 @@ do_compile_prepend () {
         mkdir -p ${B}/src
  }

+do_install_class-native() {
+       autotools_do_install
+       # remove groups to fix conflict with shadow-native
+       rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
+       # The return is a must since native doesn't need the
+       # do_install_append() in the below.
+       return
+}
+
  do_install_append() {
         for i in df mktemp base64; do mv ${D}${bindir}/$i 
${D}${bindir}/$i.${BPN}; done

@@ -91,11 +100,6 @@ do_install_append() {
         cp -a ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
  }

-do_install_append_class-native(){
-       # remove groups to fix conflict with shadow-native
-       rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
-}
-
  inherit update-alternatives

  ALTERNATIVE_PRIORITY = "100"


// Robert

>>
>>
>>> 	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
>>>
>>> 	install -d ${D}${base_bindir}
>>> @@ -91,11 +96,6 @@ do_install_append() {
>>> 	cp -a ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
>>> }
>>>
>>> -do_install_append_class-native(){
>>> -	# remove groups to fix conflict with shadow-native
>>> -	rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
>>> -}
>>> -
>>> inherit update-alternatives
>>>
>>> ALTERNATIVE_PRIORITY = "100"
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

