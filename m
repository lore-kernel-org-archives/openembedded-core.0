Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 31AD97229E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:08:41 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id eu11so12175702pac.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 08:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=abbtyMo4LwmsDnezC7WfXHK9g17iQ2fdKujitV6SKvc=;
	b=eiSkJnk8kG8xCA7Rwa96v/TO5eP4N5iq4KLLKl/7I6v12pvuGwT3I3zDDPVeWPHW2W
	2l9dEz9kQzfTY6dDkQ3Ohrp/lXtztKYZshi6c9RTl6qh3sQ6KF/vQzWZL5YIlNDvblaD
	sqnu6kObzYJ18Ea6nZvudeirc/CbCB+94Q3Lu9rhJfBsLayuHnlGeOV06YRji4PZtRNf
	XzbFwYOtHdDBSFIsync2/j4ruCVCgmIktiT7oEeFrF9z0Mt9xEeaPF+RUgNQ2xz8/nWa
	RRpBJEV4+k33OYZV04xoKSMR1MQoQZDl7BXpPeLB2W4XIreCtDCrIcvdie5oX2rMC4T3
	8hAw==
X-Received: by 10.68.101.195 with SMTP id fi3mr53848245pbb.168.1421770122394; 
	Tue, 20 Jan 2015 08:08:42 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:85c3:ac0d:1e5c:6c15?
	([2601:c:a700:272f:85c3:ac0d:1e5c:6c15])
	by mx.google.com with ESMTPSA id lo3sm3663562pab.26.2015.01.20.08.08.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Jan 2015 08:08:41 -0800 (PST)
Message-ID: <54BE7D84.5090808@gmail.com>
Date: Tue, 20 Jan 2015 08:08:36 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Maxin B. John" <maxin.john@enea.com>, 
	openembedded-core@lists.openembedded.org
References: <1420632703-13393-1-git-send-email-maxin.john@enea.com>
	<20150119135710.GA21148@sestofb10.enea.se>
In-Reply-To: <20150119135710.GA21148@sestofb10.enea.se>
Subject: Re: [dizzy][PATCH] coreutils: Fix CVE-2014-9471
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
X-List-Received-Date: Tue, 20 Jan 2015 16:08:43 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

thanks for the reminder.

merged into my staging for dizzy-next

- armin

On 01/19/2015 05:57 AM, Maxin B. John wrote:
> Gentle ping on this.
>
> On Wed, Jan 07, 2015 at 01:11:43PM +0100, Maxin B. John wrote:
>> Fiedler Roman discovered that coreutils' parse_datetime() function
>> has some flaws that may be exploitable if the date(1), touch(1),
>> or potentially other programs, accept untrusted input for certain
>> parameters. While researching this issue, he discovered that it
>> was independently discovered by Bertrand Jacquin and reported at
>> http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16872
>>
>> $ touch '--date=TZ="123"345" @1'
>> *** Error in `touch': free(): invalid pointer: 0x00007fffd33e55e0 ***
>> Aborted
>>
>> $ date '--date=TZ="123"345" @1'
>> date[394]: segfault at 7fff24000000 ip 00007f6dd5b73404 sp 00007fff27cce8f8
>> error 4 in libc-2.20.so[7f6dd5af7000+199000]
>> Segmentation fault
>>
>> Signed-off-by: Maxin B. John <maxin.john@enea.com>
>> ---
>>   .../coreutils/coreutils-8.22/date-tz-crash.patch   | 43 ++++++++++++++++++++++
>>   meta/recipes-core/coreutils/coreutils_8.22.bb      |  1 +
>>   2 files changed, 44 insertions(+)
>>   create mode 100644 meta/recipes-core/coreutils/coreutils-8.22/date-tz-crash.patch
>>
>> diff --git a/meta/recipes-core/coreutils/coreutils-8.22/date-tz-crash.patch b/meta/recipes-core/coreutils/coreutils-8.22/date-tz-crash.patch
>> new file mode 100644
>> index 0000000..570e4fd
>> --- /dev/null
>> +++ b/meta/recipes-core/coreutils/coreutils-8.22/date-tz-crash.patch
>> @@ -0,0 +1,43 @@
>> +This was reported in http://bugs.gnu.org/16872
>> +from the coreutils command: date -d 'TZ="""'
>> +
>> +The infinite loop for this case was present since the
>> +initial TZ="" parsing support in commit de95bdc2 29-10-2004.
>> +This was changed to a crash or heap corruption depending
>> +on the platform with commit 2e3e4195 18-01-2010.
>> +
>> +* lib/parse-datetime.y (parse_datetime): Break out of the
>> +TZ="" parsing loop once the second significant " is found.
>> +Also skip over any subsequent whitespace to be consistent
>> +with the non TZ= case.
>> +
>> +Fixes: CVE-2014-9471
>> +
>> +Upstream-Status: backport
>> +
>> +Signed-off-by: Maxin B. John <maxin.john@enea.com>
>> +Signed-off-by: Pádraig Brady <P@draigBrady.com>
>> +---
>> +diff -Naur coreutils-8.22-origin/lib/parse-datetime.y coreutils-8.22/lib/parse-datetime.y
>> +--- coreutils-8.22-origin/lib/parse-datetime.y	2013-12-04 15:53:33.000000000 +0100
>> ++++ coreutils-8.22/lib/parse-datetime.y	2015-01-05 17:11:16.754358184 +0100
>> +@@ -1303,8 +1303,6 @@
>> +             char tz1buf[TZBUFSIZE];
>> +             bool large_tz = TZBUFSIZE < tzsize;
>> +             bool setenv_ok;
>> +-            /* Free tz0, in case this is the 2nd or subsequent time through. */
>> +-            free (tz0);
>> +             tz0 = get_tz (tz0buf);
>> +             z = tz1 = large_tz ? xmalloc (tzsize) : tz1buf;
>> +             for (s = tzbase; *s != '"'; s++)
>> +@@ -1317,6 +1315,10 @@
>> +               goto fail;
>> +             tz_was_altered = true;
>> +             p = s + 1;
>> ++            while (c = *p, c_isspace (c))
>> ++              p++;
>> ++
>> ++            break;
>> +           }
>> +     }
>> +
>> diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
>> index f85baca..4a1aee6 100644
>> --- a/meta/recipes-core/coreutils/coreutils_8.22.bb
>> +++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
>> @@ -17,6 +17,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>>              file://dummy_help2man.patch \
>>              file://fix-for-dummy-man-usage.patch \
>>              file://fix-selinux-flask.patch \
>> +           file://date-tz-crash.patch \
>>             "
>>
>>   SRC_URI[md5sum] = "8fb0ae2267aa6e728958adc38f8163a2"
>> --
>> 1.9.1

