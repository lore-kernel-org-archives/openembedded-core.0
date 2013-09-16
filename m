Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 118796C7B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 13:53:02 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id k18so15075oag.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=cLhIYjz7g+bLHygaHqyGjFx2D/AJVEZjC6Sbw0P8GHM=;
	b=CPGD71Phyoz54Zqv1biysuPIhhuBAeTg7vXnBv2jC9gd3op9mEw5XMOpWTj73dzwcm
	aT3wgkNS6OiQqhK7FmpHhNLQaaX+Zb7fO4iAdPJgmxH7AuGA72f3ENa7jrlOJyaOkDXY
	94swMBbQR0klyV+75N69QmEB1K3+yD+95jigZKacqDECfOrb1B2YoMWMvZr1qhWGT9CE
	uKUL580PMhUpJtRLwffjEKdymEr571Izp1aPyxJEyiT6EZnGlkGMlTSeTk059adlk7lg
	1LtU8ZWu4/lGLa3pqN7OX4FskwQ6GCq0asaqkuCEyk5yO+AW1hW3tX1KktaxF84QIEi0
	5D0Q==
MIME-Version: 1.0
X-Received: by 10.182.129.201 with SMTP id ny9mr25840511obb.0.1379339583630;
	Mon, 16 Sep 2013 06:53:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 16 Sep 2013 06:53:03 -0700 (PDT)
In-Reply-To: <CAP9ODKp2-Gj1PMuFuBft+5v4WWzMPWFjWkfnaasN8au+D1vM9A@mail.gmail.com>
References: <1379295470-3444-1-git-send-email-otavio@ossystems.com.br>
	<5236AEF3.4000609@linux.intel.com>
	<CAP9ODKp2-Gj1PMuFuBft+5v4WWzMPWFjWkfnaasN8au+D1vM9A@mail.gmail.com>
Date: Mon, 16 Sep 2013 10:53:03 -0300
X-Google-Sender-Auth: WtxtKD7l-_y1EdnNzxZ_4DwQg_A
Message-ID: <CAP9ODKo8-_pt9SQrNiBWvEsFxVyDPg8+bBsr-hN1DSxCRJX-kw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Remove CFLAGS and LDFLAGS override
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
X-List-Received-Date: Mon, 16 Sep 2013 13:53:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 16, 2013 at 8:01 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Sep 16, 2013 at 4:10 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 09/15/2013 06:37 PM, Otavio Salvador wrote:
>>>
>>> The kernel build system does the right thing here and we should stop
>>> overriding it. This code has been added based on a change from
>>> 'meta-metro' layer, revision 9d698004137c1a888d40d6a4808d94afa22387e7,
>>> without any information about what problem it fixes so I am reverting
>>> it.
>>>
>>> Using the CFLAGS makes it impossible for kernel build system to append
>>> to it, thus making the build fail in various ways as:
>>>
>>> |     CC /.../perf/1.0-r8/perf-1.0/perf.o
>>> | In file included from builtin.h:4:0,
>>> |                  from perf.c:9:
>>> | util/util.h:74:24: fatal error: lk/debugfs.h: No such file or directory
>>> |  #include <lk/debugfs.h>
>>> |                         ^
>>> | compilation terminated.
>>>
>>> Cc: Christopher Larson <kergoth@gmail.com>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>> ---
>>>   meta/recipes-kernel/perf/perf.bb | 6 ------
>>>   1 file changed, 6 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/perf/perf.bb
>>> b/meta/recipes-kernel/perf/perf.bb
>>> index d2c1048..8d35fc6 100644
>>> --- a/meta/recipes-kernel/perf/perf.bb
>>> +++ b/meta/recipes-kernel/perf/perf.bb
>>> @@ -72,13 +72,7 @@ EXTRA_OEMAKE = \
>>>                 NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
>>>                 '
>>>
>>> -# We already pass the correct arguments to our compiler for the CFLAGS
>>> (if we
>>> -# don't override it, it'll add -m32/-m64 itself). For LDFLAGS, it was
>>> failing
>>> -# to find bfd symbols.
>>>   EXTRA_OEMAKE += "\
>>> -       'CFLAGS=${CFLAGS} -fPIC' \
>>> -       'LDFLAGS=${LDFLAGS} -lpthread -lrt -lelf -lm -lbfd' \
>>> -       \
>>
>> Maybe not, I got a compile error with this on the Autobuilder.
>>
>> http://autobuilder.yoctoproject.org:8011/builders/nightly-x86-64/builds/286/steps/Building%20Images/logs/stdio
>
> I only reproduce this error if I build with EXTRA_CFLAGS set. There
> are no other changes in perf?

I reproduced the error too. I am on it but still have no clue why it
worked and now fails.

Checking...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

