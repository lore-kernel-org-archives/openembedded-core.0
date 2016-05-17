Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 824C7770EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 00:21:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 16 May 2016 17:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,322,1459839600"; d="scan'208";a="808085044"
Received: from pianodaemon-contraption.zpn.intel.com (HELO [10.219.128.59])
	([10.219.128.59])
	by orsmga003.jf.intel.com with ESMTP; 16 May 2016 17:21:37 -0700
To: "Randle, William C" <william.c.randle@intel.com>
References: <1463429996-24056-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
	<1407DCB5-D6A6-45D4-8F5B-DE43C8F74E59@gmail.com>
	<573A3DA4.9060900@linux.intel.com> <1463437315.2768.29.camel@intel.com>
From: Plauchu Edwin <edwin.plauchu.camacho@linux.intel.com>
Message-ID: <573A641D.90808@linux.intel.com>
Date: Mon, 16 May 2016 19:21:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1463437315.2768.29.camel@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta:recipes-extended: stat fix security gaps
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
X-List-Received-Date: Tue, 17 May 2016 00:21:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Ok Bill

I rewrote the patch without using macros 
http://lists.openembedded.org/pipermail/openembedded-core/2016-May/121581.html

On 16/05/16 17:21, Randle, William C wrote:
> On Mon, 2016-05-16 at 16:37 -0500, Plauchu Edwin wrote:
>> On 16/05/16 16:28, Khem Raj wrote:
>>>> On May 16, 2016, at 1:19 PM, edwin.plauchu.camacho@linux.intel.com wrote:
>>>>
>>>> From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>>>>
>>>> This patch avoids stat fails to compile with compiler flags which elevate
>>>> common string formatting issues into an error (-Wformat -Wformat-security
>>>> -Werror=format-security).
>>>>
>>>> [YOCTO #9550]
>>>>
>>>> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>>>> ---
>>>> meta/conf/distro/include/security_flags.inc        |  1 -
>>>> .../stat/stat-3.3/fix-security-format.patch        | 77
>>>> ++++++++++++++++++++++
>>>> meta/recipes-extended/stat/stat_3.3.bb             |  1 +
>>>> 3 files changed, 78 insertions(+), 1 deletion(-)
>>>> create mode 100644 meta/recipes-extended/stat/stat-3.3/fix-security-
>>>> format.patch
>>>>
>>>> diff --git a/meta/conf/distro/include/security_flags.inc
>>>> b/meta/conf/distro/include/security_flags.inc
>>>> index 7a91cec..5ae6dd8 100644
>>>> --- a/meta/conf/distro/include/security_flags.inc
>>>> +++ b/meta/conf/distro/include/security_flags.inc
>>>> @@ -105,7 +105,6 @@ SECURITY_STRINGFORMAT_pn-gettext = ""
>>>> SECURITY_STRINGFORMAT_pn-kexec-tools = ""
>>>> SECURITY_STRINGFORMAT_pn-makedevs = ""
>>>> SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
>>>> -SECURITY_STRINGFORMAT_pn-stat = ""
>>>> SECURITY_STRINGFORMAT_pn-unzip = ""
>>>> SECURITY_STRINGFORMAT_pn-zip = ""
>>>>
>>>> diff --git a/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
>>>> b/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
>>>> new file mode 100644
>>>> index 0000000..7d9f8df
>>>> --- /dev/null
>>>> +++ b/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
>>>> @@ -0,0 +1,77 @@
>>>> +meta: recipes-extended: Fixing security formatting issues on stat
>>>> +
>>>> +Fix security formatting issues related to printf without NULL argument
>>>> +
>>>> +stat.c: In function 'print_human_access':
>>>> +stat.c:292:13: error: format not a string literal and no format arguments
>>>> [-Werror=format-security]
>>>> +     printf (access);
>>>> +             ^
>>>> +stat.c: In function 'print_human_time':
>>>> +stat.c:299:57: error: format not a string literal and no format arguments
>>>> [-Werror=format-security]
>>>> +   if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
>>>> +                                                         ^
>>>> +stat.c: In function 'print_it':
>>>> +stat.c:613:6: error: format not a string literal and no format arguments
>>>> [-Werror=format-security]
>>>> +      printf(b);
>>>> +      ^
>>>> +stat.c:642:6: error: format not a string literal and no format arguments
>>>> [-Werror=format-security]
>>>> +      printf(b);
>>>> +      ^
>>>> +
>>>> +[YOCTO #9550]
>>>> +[https://bugzilla.yoctoproject.org/show_bug.cgi?id=9550]
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>>>> +
>>>> +diff --git a/stat.c b/stat.c
>>>> +index 1ed07a9..351ab54 100644
>>>> +--- a/stat.c
>>>> ++++ b/stat.c
>>>> +@@ -21,6 +21,8 @@
>>>> +
>>>> + #include "fs.h"
>>>> +
>>>> ++#define __PRINT(STR) printf (STR,NULL)
>>>> ++
>>> Can we use proper formatting string here something like
>>> printf(“%s”, access );
>>>
>>> or use fputs() Call instead
>> With fputs we need to specify stdout stream and
>> the printf "%s" option needs a little bit more processing in formatting.
>>
>> The actual change covers the security considerations with minimal add of
>> NULL if you
>> know why the another ways will be better please tell me.
>>
>> Thanks in advance
>> Edwin Plauchu
>>>
>>>> + void print_human_type(unsigned short mode)
>>>> + {
>>>> +   switch (mode & S_IFMT)
>>>> +@@ -289,15 +291,15 @@ void print_human_access(struct stat *statbuf)
>>>> +     default:
>>>> +       access[0] = '?';
>>>> +     }
>>>> +-    printf (access);
>>>> ++    __PRINT(access);
>>>> + }
>>>> +
>>>> + void print_human_time(time_t *t)
>>>> + {
>>>> +   char str[40];
>>>> +
>>>> +-  if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
>>>> +-  else printf("Cannot calculate human readable time, sorry");
>>>> ++  if (strftime(str, 40, "%c", localtime(t)) > 0) __PRINT(str);
>>>> ++  else __PRINT("Cannot calculate human readable time, sorry");
>>>> + }
>>>> +
>>>> + /* print statfs info */
>>>> +@@ -610,7 +612,7 @@ void print_it(char *masterformat, char *filename,
>>>> + 	{
>>>> + 	    strcpy (pformat, "%");
>>>> + 	    *m++ = '\0';
>>>> +-	    printf(b);
>>>> ++	    __PRINT(b);
>>>> +
>>>> + 	    /* copy all format specifiers to our format string */
>>>> + 	    while (isdigit(*m) || strchr("#0-+. I", *m))
>>>> +@@ -639,7 +641,7 @@ void print_it(char *masterformat, char *filename,
>>>> + 	}
>>>> + 	else
>>>> + 	{
>>>> +-	    printf(b);
>>>> ++	    __PRINT(b);
>>>> + 	    b = NULL;
>>>> + 	}
>>>> +     }
>
> Is there a particular reason you used a macro for this package when all the
> others you submitted so far use printf(arg, NULL) directly? I think it would be
> good to be consistent.
>
>      -Bill
>


