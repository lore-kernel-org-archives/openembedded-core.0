Return-Path: <kirgene@gmail.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 07D3F6D9AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 17:25:57 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id i7so429064qcq.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 09:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ieT6JJltpkDdMP4E8tiWvnEbWkAx2AouXIvsf+2JwpI=;
	b=JgXlbZE/IrAt3rCsO+S4oPepBdcXrEuAVTXGXVEXIuW0lj1GXDdYNVkpLbw5XKpJhV
	BU968mNDAJvk2DP6b/+JoDBVA+tPibLUVeLGeceBHF4WZOuz6XBxgWU3p2toc25HBPWY
	6TGcIORfAoMq1wqowDmtx6ggrSvX/uivR6cIPvpKPWQCycSMKPo90o5EAngNAJl56Bsw
	0A85+GK9qIVUzzLqMFBnPpE76XUqR6FNqSIisa0+SmaOVfeEaf9FFdmjvjgqFPsakTXm
	lic2EjjZOdWMt4PDRvjzc03TgIy91SijIA8La2G4bp5hVtDhHwAiaf0OimYJs6y4JzmK
	QF8g==
MIME-Version: 1.0
X-Received: by 10.49.24.161 with SMTP id v1mr34521131qef.75.1384363558971;
	Wed, 13 Nov 2013 09:25:58 -0800 (PST)
Received: by 10.96.55.197 with HTTP; Wed, 13 Nov 2013 09:25:58 -0800 (PST)
In-Reply-To: <5283AA52.4090102@linux.intel.com>
References: <1384354266-15425-1-git-send-email-kirgene@gmail.com>
	<5283AA52.4090102@linux.intel.com>
Date: Wed, 13 Nov 2013 19:25:58 +0200
Message-ID: <CADV-EXGSZuXVO7DqgGUnxCzNQUYXyCtNt1XXAbEAuN9gWisPSA@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Phil Blundell <philb@gnu.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curl: allow build with c-ares library support.
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
X-List-Received-Date: Wed, 13 Nov 2013 17:26:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

2013/11/13 Saul Wold <sgw@linux.intel.com>:
> On 11/13/2013 06:51 AM, Yevhen Kyriukha wrote:
>>
>> Also added c-ares library recipe.
>>
>> In libcurl there is an issue with DNS lookups that cause crash on some
>> platforms:
>> http://curl.haxx.se/mail/lib-2008-09/0197.html
>> To avoid this issue libcurl has to be built with c-ares name resolver.
>>
> This still does not fully explain why this is needed. Nor credits to origin
> of the c-ares recipe.
>

Do you meen to note layer name where I get this recipe from in commit?
The c-ares recipe was borrowed from meta-webos-ports.

> You also did not address Phil Blundell's comment about causing other issues,
> and possibibly using the existing libcurl internal threaded resolver.
>
> Can you test with the internal resolver to see if it address your issues,
> before we add a new recipe.
>

As far as I've tested curl crashes on i386 and Intel Cedartrail
platforms with internal threaded resolver.

Best regards,
Yevhen

>
>> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
>> ---
>>   meta/recipes-support/c-ares/c-ares_1.10.0.bb | 24
>> ++++++++++++++++++++++++
>>   meta/recipes-support/curl/curl_7.33.0.bb     |  2 ++
>>   2 files changed, 26 insertions(+)
>>   create mode 100644 meta/recipes-support/c-ares/c-ares_1.10.0.bb
>>
>
> This still needs to be split into 2 distict patches, one adding the c-ares
> recipe and a second one to use the PACKAGECONFIG.
>
> Sau!
>
>
>> diff --git a/meta/recipes-support/c-ares/c-ares_1.10.0.bb
>> b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
>> new file mode 100644
>> index 0000000..23b3d0e
>> --- /dev/null
>> +++ b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
>> @@ -0,0 +1,24 @@
>> +# Copyright (c) 2012-2013 LG Electronics, Inc.
>> +
>> +DESCRIPTION = "c-ares is a C library that resolves names asynchronously."
>> +HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
>> +SECTION = "libs"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM =
>> "file://README;beginline=17;endline=18;md5=b320556568bc067d215a1e34c5b34a14"
>> +
>> +inherit autotools
>> +inherit pkgconfig
>> +
>> +SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz"
>> +SRC_URI[md5sum] = "1196067641411a75d3cbebe074fd36d8"
>> +SRC_URI[sha256sum] =
>> "3d701674615d1158e56a59aaede7891f2dde3da0f46a6d3c684e0ae70f52d3db"
>> +
>> +EXTRA_OECONF = "--enable-shared"
>> +
>> +# install private headers to ares subdirectory
>> +do_install_append() {
>> +    install -d ${D}/${includedir}/ares
>> +    install -m 0644 ares*.h ${D}/${includedir}/ares/
>> +}
>> +
>> +FILES_${PN}-dev += "${includedir}/ares/*.h"
>> diff --git a/meta/recipes-support/curl/curl_7.33.0.bb
>> b/meta/recipes-support/curl/curl_7.33.0.bb
>> index 8539fec..717c4f9 100644
>> --- a/meta/recipes-support/curl/curl_7.33.0.bb
>> +++ b/meta/recipes-support/curl/curl_7.33.0.bb
>> @@ -23,6 +23,8 @@ SRC_URI[sha256sum] =
>> "0afde4cd949e2658eddc3cda675b19b165eea1af48ac5f3e1ec1607922
>>
>>   inherit autotools pkgconfig binconfig
>>
>> +PACKAGECONFIG[c-ares] = "--enable-ares,--disable-ares,c-ares"
>> +
>>   EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
>>                   --without-libssh2 \
>>                   --with-random=/dev/urandom \
>>
>


Best regards,
Yevhen

