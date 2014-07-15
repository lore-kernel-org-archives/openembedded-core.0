Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D60160CEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 02:21:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6F2LeHM025509
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Jul 2014 19:21:40 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 14 Jul 2014 19:21:39 -0700
Message-ID: <53C49032.8030603@windriver.com>
Date: Tue, 15 Jul 2014 10:21:38 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1405043280.git.liezhi.yang@windriver.com>
	<5912151dc1b33e4b1c156e50d02e3a426fb880ad.1405043280.git.liezhi.yang@windriver.com>
	<53C41BE8.2080508@linux.intel.com>
In-Reply-To: <53C41BE8.2080508@linux.intel.com>
Subject: Re: [PATCH 1/2] file: fix perl reported as awk
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
X-List-Received-Date: Tue, 15 Jul 2014 02:21:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Thanks, updated in the repo:

The awk pattern was checked *before* the Perl pattern, so the perl
script with BEGIN{...} would be reported as awk, this patch fixes it.

Upstream-Status: Backport [debian]

Signed-off-by: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

=======
REPO:
git://git.openembedded.org/openembedded-core-contrib rbt/file
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/file

Robert Yang (2):
   file: fix perl reported as awk
   file: remove dump and filesystems

// Robert

On 07/15/2014 02:05 AM, Saul Wold wrote:
> On 07/10/2014 06:51 PM, Robert Yang wrote:
>> The awk pattern was checked *before* the Perl pattern, so the perl
>> script with BEGIN{...} would be reported as awk, this patch fixes it.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../recipes-devtools/file/file/debian-742262.patch |   16 ++++++++++++++++
>>   meta/recipes-devtools/file/file_5.18.bb            |    4 +++-
>>   2 files changed, 19 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-devtools/file/file/debian-742262.patch
>>
>> diff --git a/meta/recipes-devtools/file/file/debian-742262.patch
>> b/meta/recipes-devtools/file/file/debian-742262.patch
>> new file mode 100644
>> index 0000000..5cfe380
>> --- /dev/null
>> +++ b/meta/recipes-devtools/file/file/debian-742262.patch
>> @@ -0,0 +1,16 @@
>> +The awk pattern was checked *before* the Perl pattern, so the perl
>> +script with BEGIN{...} would be reported as awk, this patch fixes it.
>> +
>> +Upstream-Status: Backport [debian]
>> +
>
> Missing the Signed-off-by here also.
>
> Sau!
>
>> +diff --git a/magic/Magdir/commands b/magic/Magdir/commands
>> +--- a/magic/Magdir/commands
>> ++++ b/magic/Magdir/commands
>> +@@ -50,6 +50,7 @@
>> + 0    string/wt    #!\ /usr/bin/awk    awk script text executable
>> + !:mime    text/x-awk
>> + 0    regex        =^\\s{0,100}BEGIN\\s{0,100}[{]    awk script text
>> ++!:strength - 12
>> +
>> + # AT&T Bell Labs' Plan 9 shell
>> + 0    string/wt    #!\ /bin/rc    Plan 9 rc shell script text executable
>> diff --git a/meta/recipes-devtools/file/file_5.18.bb
>> b/meta/recipes-devtools/file/file_5.18.bb
>> index a7db410..ba61f22 100644
>> --- a/meta/recipes-devtools/file/file_5.18.bb
>> +++ b/meta/recipes-devtools/file/file_5.18.bb
>> @@ -13,7 +13,9 @@ DEPENDS_class-native = "zlib-native"
>>
>>   SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
>>              file://dump \
>> -           file://filesystems"
>> +           file://filesystems \
>> +           file://debian-742262.patch \
>> +          "
>>
>>   SRC_URI[md5sum] = "d420d8f2990cd344673acfbf8d76ff5a"
>>   SRC_URI[sha256sum] =
>> "6519fb706d583231c2419592ebecdbb21d33c62eaf7a1a0b24ddfcb80c08bf07"
>>
>
>

