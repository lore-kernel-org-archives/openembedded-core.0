Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id BCDFA60662
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:01:24 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wm4so3782612obc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 04:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=NYXdCcQ/wT1ZSHmtHRnCn8IR75+jr5l8ehWv6AKQ/mc=;
	b=lkOgKsegFh1i1cVRzDlzHul0sfr8gpV3GeOZKBZ/zJnHyn/TcACSESwLTqPjcXGjBN
	hQ60SyYXQFWbqEtFMTRX1JjpwXBvZlsTWhpukRg/hZy4xAYaBnYtj+H2gidVJ+6/d88b
	mIzEmAjiXvki659p+iRhz3Ci002vDEddeCtsvDn0K3y5VPenon3/YiIINbz+rZlJsbe3
	mES0Vr4bwZAgPTvUuf1PImcyllhoiszKTpbUx9ngohnk3y7kP3yTr8mT2IdnQetAQjpT
	4kfHI1QfNzGsa/uJJ7shEYmwAE5jpGdk83B3gPxo6i/zSaT8Hp8RJ1jk5M3Qqn4y0nTt
	jziw==
MIME-Version: 1.0
X-Received: by 10.60.17.136 with SMTP id o8mr25072398oed.7.1379329286549; Mon,
	16 Sep 2013 04:01:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 16 Sep 2013 04:01:26 -0700 (PDT)
In-Reply-To: <5236AEF3.4000609@linux.intel.com>
References: <1379295470-3444-1-git-send-email-otavio@ossystems.com.br>
	<5236AEF3.4000609@linux.intel.com>
Date: Mon, 16 Sep 2013 08:01:26 -0300
X-Google-Sender-Auth: -IzlN57pWVJgHl_YZf_9o0v5zgI
Message-ID: <CAP9ODKp2-Gj1PMuFuBft+5v4WWzMPWFjWkfnaasN8au+D1vM9A@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Sep 2013 11:01:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 16, 2013 at 4:10 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 09/15/2013 06:37 PM, Otavio Salvador wrote:
>>
>> The kernel build system does the right thing here and we should stop
>> overriding it. This code has been added based on a change from
>> 'meta-metro' layer, revision 9d698004137c1a888d40d6a4808d94afa22387e7,
>> without any information about what problem it fixes so I am reverting
>> it.
>>
>> Using the CFLAGS makes it impossible for kernel build system to append
>> to it, thus making the build fail in various ways as:
>>
>> |     CC /.../perf/1.0-r8/perf-1.0/perf.o
>> | In file included from builtin.h:4:0,
>> |                  from perf.c:9:
>> | util/util.h:74:24: fatal error: lk/debugfs.h: No such file or directory
>> |  #include <lk/debugfs.h>
>> |                         ^
>> | compilation terminated.
>>
>> Cc: Christopher Larson <kergoth@gmail.com>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>   meta/recipes-kernel/perf/perf.bb | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb
>> b/meta/recipes-kernel/perf/perf.bb
>> index d2c1048..8d35fc6 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -72,13 +72,7 @@ EXTRA_OEMAKE = \
>>                 NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
>>                 '
>>
>> -# We already pass the correct arguments to our compiler for the CFLAGS
>> (if we
>> -# don't override it, it'll add -m32/-m64 itself). For LDFLAGS, it was
>> failing
>> -# to find bfd symbols.
>>   EXTRA_OEMAKE += "\
>> -       'CFLAGS=${CFLAGS} -fPIC' \
>> -       'LDFLAGS=${LDFLAGS} -lpthread -lrt -lelf -lm -lbfd' \
>> -       \
>
> Maybe not, I got a compile error with this on the Autobuilder.
>
> http://autobuilder.yoctoproject.org:8011/builders/nightly-x86-64/builds/286/steps/Building%20Images/logs/stdio

I only reproduce this error if I build with EXTRA_CFLAGS set. There
are no other changes in perf?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

