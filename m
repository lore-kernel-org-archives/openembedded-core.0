Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 109F775E2D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 22:05:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id B645D600503
To: openembedded-core@lists.openembedded.org
References: <1446077658-61623-1-git-send-email-tudor.florea@enea.com>
	<56318C62.1080101@gmail.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <563BD296.40408@collabora.co.uk>
Date: Thu, 5 Nov 2015 22:05:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56318C62.1080101@gmail.com>
Subject: Re: [PATCH] unzip: CVE-2015-7696, CVE-2015-7697
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
X-List-Received-Date: Thu, 05 Nov 2015 22:05:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/15 03:02, akuster808 wrote:
> Patches should apply to Fido and Dizzy. both are have the same version.
>
> Thanks for the patches.

Patch applies and I've pushed this change to my joshuagl/fido-next 
branch of openembedded-core-contrib and am testing it now.

Thanks,

Joshua

1. 
http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next

>
> regards,
> - armin
>
> On 10/28/2015 05:14 PM, Tudor Florea wrote:
>> CVE-2015-7696: Fixes a heap overflow triggered by unzipping a file with password
>> CVE-2015-7697: Fixes a denial of service with a file that never finishes unzipping
>>
>> References:
>> http://www.openwall.com/lists/oss-security/2015/10/11/5
>> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-7696
>> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-7697
>>
>> Signed-off-by: Tudor Florea <tudor.florea@enea.com>
>> ---
>>   .../unzip/unzip/CVE-2015-7696.patch                | 38 ++++++++++++++++++++++
>>   .../unzip/unzip/CVE-2015-7697.patch                | 31 ++++++++++++++++++
>>   meta/recipes-extended/unzip/unzip_6.0.bb           |  2 ++
>>   3 files changed, 71 insertions(+)
>>   create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch
>>   create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch
>>
>> diff --git a/meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch b/meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch
>> new file mode 100644
>> index 0000000..ea93823
>> --- /dev/null
>> +++ b/meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch
>> @@ -0,0 +1,38 @@
>> +Upstream-Status: Backport
>> +Signed-off-by: Tudor Florea <tudor.flore@enea.com>
>> +
>> +From 68efed87fabddd450c08f3112f62a73f61d493c9 Mon Sep 17 00:00:00 2001
>> +From: Petr Stodulka <pstodulk@redhat.com>
>> +Date: Mon, 14 Sep 2015 18:23:17 +0200
>> +Subject: [PATCH 1/2] upstream fix for heap overflow
>> +
>> +https://bugzilla.redhat.com/attachment.cgi?id=1073002
>> +---
>> + crypt.c | 12 +++++++++++-
>> + 1 file changed, 11 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/crypt.c b/crypt.c
>> +index 784e411..a8975f2 100644
>> +--- a/crypt.c
>> ++++ b/crypt.c
>> +@@ -465,7 +465,17 @@ int decrypt(__G__ passwrd)
>> +     GLOBAL(pInfo->encrypted) = FALSE;
>> +     defer_leftover_input(__G);
>> +     for (n = 0; n < RAND_HEAD_LEN; n++) {
>> +-        b = NEXTBYTE;
>> ++        /* 2012-11-23 SMS.  (OUSPG report.)
>> ++         * Quit early if compressed size < HEAD_LEN.  The resulting
>> ++         * error message ("unable to get password") could be improved,
>> ++         * but it's better than trying to read nonexistent data, and
>> ++         * then continuing with a negative G.csize.  (See
>> ++         * fileio.c:readbyte()).
>> ++         */
>> ++        if ((b = NEXTBYTE) == (ush)EOF)
>> ++        {
>> ++            return PK_ERR;
>> ++        }
>> +         h[n] = (uch)b;
>> +         Trace((stdout, " (%02x)", h[n]));
>> +     }
>> +--
>> +2.4.6
>> diff --git a/meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch b/meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch
>> new file mode 100644
>> index 0000000..da68988
>> --- /dev/null
>> +++ b/meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch
>> @@ -0,0 +1,31 @@
>> +Upstream-Status: Backport
>> +Signed-off-by: Tudor Florea <tudor.flore@enea.com>
>> +
>> +From bd8a743ee0a77e65ad07ef4196c4cd366add3f26 Mon Sep 17 00:00:00 2001
>> +From: Kamil Dudka <kdudka@redhat.com>
>> +Date: Mon, 14 Sep 2015 18:24:56 +0200
>> +Subject: [PATCH 2/2] fix infinite loop when extracting empty bzip2 data
>> +
>> +---
>> + extract.c | 6 ++++++
>> + 1 file changed, 6 insertions(+)
>> +
>> +diff --git a/extract.c b/extract.c
>> +index 7134bfe..29db027 100644
>> +--- a/extract.c
>> ++++ b/extract.c
>> +@@ -2733,6 +2733,12 @@ __GDEF
>> +     int repeated_buf_err;
>> +     bz_stream bstrm;
>> +
>> ++    if (G.incnt <= 0 && G.csize <= 0L) {
>> ++        /* avoid an infinite loop */
>> ++        Trace((stderr, "UZbunzip2() got empty input\n"));
>> ++        return 2;
>> ++    }
>> ++
>> + #if (defined(DLL) && !defined(NO_SLIDE_REDIR))
>> +     if (G.redirect_slide)
>> +         wsize = G.redirect_size, redirSlide = G.redirect_buffer;
>> +--
>> +2.4.6
>> diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
>> index 4a0a713..9e63d3a 100644
>> --- a/meta/recipes-extended/unzip/unzip_6.0.bb
>> +++ b/meta/recipes-extended/unzip/unzip_6.0.bb
>> @@ -14,6 +14,8 @@ SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
>>   	file://09-cve-2014-8139-crc-overflow.patch \
>>   	file://10-cve-2014-8140-test-compr-eb.patch \
>>   	file://11-cve-2014-8141-getzip64data.patch \
>> +	file://CVE-2015-7696.patch \
>> +	file://CVE-2015-7697.patch \
>>   "
>>
>>   SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
>>


