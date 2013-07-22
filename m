Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2EC560667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 05:20:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6M5KBhk019603
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 21 Jul 2013 22:20:12 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 21 Jul 2013 22:20:09 -0700
Message-ID: <51ECC108.60800@windriver.com>
Date: Mon, 22 Jul 2013 13:20:08 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1374224424.git.hongxu.jia@windriver.com>
	<dce62f416d4a1d8f0acb0f18545868932aff45c9.1374224424.git.hongxu.jia@windriver.com>
	<51E984DF.2030207@linux.intel.com>
	<51ECC0A5.9060800@linux.intel.com>
In-Reply-To: <51ECC0A5.9060800@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] python: fix importing readline with probably escape sequence output
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
X-List-Received-Date: Mon, 22 Jul 2013 05:20:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2013 01:18 PM, Saul Wold wrote:
> On 07/19/2013 11:26 AM, Saul Wold wrote:
>> On 07/19/2013 02:13 AM, Hongxu Jia wrote:
>>> While imports readline in python, if TERM in terminfo is available and
>>> it contains the variable 'km' and 'smm', the readline initialization 
>>> will
>>> output the value of 'smm' which is the escape sequence '\E[?1034h'.
>>>
>>> 'km' means the terminal has a meta key which is a special key on MIT
>>> keyboards
>>> such as the space-cadet keyboard, and on Sun Microsystems keyboards,
>>> marked
>>> as a solid diamond. It almost doesn't exist in our keyboard, so it has
>>> no side
>>> effect to disable it.
>>> 'smm' means turn on the meta key if this terminal has one.
>>>
>>> Explicitly set meta key off to avoid probable escape sequence output
>>> while gnu readline library initialization.
>>>
>> I am still not sure about this change, there was some discussion that
>> the readline library would do be making a similar change and we should
>> back port that change.  I contacted the readline maintainer to find out
>> about that.
>>
>> I am going to hold off until I hear from him.
>>
> Hongxu, please look at the "Bash" Git for readline library and see if 
> you can find the changes that Chet made to back port.
>
>
> http://git.savannah.gnu.org/cgit/bash.git/?h=devel
>
Got it.

//Hongxu
> Thanks
>> Sau!
>>
>>> [YOCTO #4835]
>>> [YOCTO #4732]
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   meta/recipes-devtools/python/python.inc            |  4 +-
>>>   ...-to-avoid-probable-escape-sequence-output.patch | 43
>>> ++++++++++++++++++++++
>>>   2 files changed, 46 insertions(+), 1 deletion(-)
>>>   create mode 100644
>>> meta/recipes-devtools/python/python/readline-set-meta-key-off-to-avoid-probable-escape-sequence-output.patch 
>>>
>>>
>>>
>>> diff --git a/meta/recipes-devtools/python/python.inc
>>> b/meta/recipes-devtools/python/python.inc
>>> index 80609a8..9f787c9 100644
>>> --- a/meta/recipes-devtools/python/python.inc
>>> +++ b/meta/recipes-devtools/python/python.inc
>>> @@ -7,7 +7,9 @@ INC_PR = "r0"
>>>
>>>   LIC_FILES_CHKSUM =
>>> "file://LICENSE;md5=ed3abfd1059e2d3a36a8cff3986f9bb6"
>>>
>>> -SRC_URI = 
>>> "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2"
>>> +SRC_URI = 
>>> "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
>>> +
>>> file://readline-set-meta-key-off-to-avoid-probable-escape-sequence-output.patch 
>>>
>>> \
>>> +"
>>>
>>>   SRC_URI[md5sum] = "c57477edd6d18bd9eeca2f21add73919"
>>>   SRC_URI[sha256sum] =
>>> "726457e11cb153adc3f428aaf1901fc561a374c30e5e7da6742c0742a338663c"
>>> diff --git
>>> a/meta/recipes-devtools/python/python/readline-set-meta-key-off-to-avoid-probable-escape-sequence-output.patch 
>>>
>>> b/meta/recipes-devtools/python/python/readline-set-meta-key-off-to-avoid-probable-escape-sequence-output.patch 
>>>
>>>
>>> new file mode 100644
>>> index 0000000..104fc36
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-devtools/python/python/readline-set-meta-key-off-to-avoid-probable-escape-sequence-output.patch 
>>>
>>>
>>> @@ -0,0 +1,43 @@
>>> +readline:explicitly set meta key off to avoid probable escape
>>> sequence output
>>> +
>>> +While imports readline in python, if TERM in terminfo is available and
>>> +it contains the variable 'km' and 'smm', the readline initialization
>>> will
>>> +output the value of 'smm' which is the escape sequence '\E[?1034h'.
>>> +
>>> +'km' means the terminal has a meta key which is a special key on MIT
>>> keyboards
>>> +such as the space-cadet keyboard, and on Sun Microsystems keyboards,
>>> marked
>>> +as a solid diamond. It almost doesn't exist in our keyboard, so it
>>> has no side
>>> +effect to disable it.
>>> +'smm' means turn on the meta key if this terminal has one.
>>> +
>>> +Explicitly set meta key off to avoid probable escape sequence output
>>> +while gnu readline library initialization.
>>> +
>>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> +Upstream-Status: inappropriate [oe specific]
>>> +---
>>> + Modules/readline.c | 9 +++++++++
>>> + 1 file changed, 9 insertions(+)
>>> +
>>> +diff --git a/Modules/readline.c b/Modules/readline.c
>>> +--- a/Modules/readline.c
>>> ++++ b/Modules/readline.c
>>> +@@ -909,6 +909,15 @@ setup_readline(void)
>>> +     rl_read_init_file(NULL);
>>> +     else
>>> + #endif /* __APPLE__ */
>>> ++
>>> ++    /* Explicitly set meta key off to avoid probable escape sequence
>>> output
>>> ++     * while gnu readline library initialization. The meta key is a
>>> special
>>> ++     * key in MIT keyboards such as the space-cadet keyboard, and on
>>> Sun
>>> ++     * Microsystems keyboards, marked as a solid diamond. It almost
>>> doesn't
>>> ++     * exist in our keyboards, so it has no side effect to disable 
>>> it.
>>> ++     */
>>> ++    rl_variable_bind("enable-meta-key", "off");
>>> ++
>>> +         rl_initialize();
>>> +
>>> +     RESTORE_LOCALE(saved_locale)
>>> +--
>>> +1.8.1.2
>>> +
>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>


