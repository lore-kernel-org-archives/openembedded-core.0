Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5933C77C37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 16:57:29 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o81so1407337wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RZegCJ9KnxOLajx4tN0ZnkaLGMQlSVIPNLJ/2Dv+TEs=;
	b=uxqO/YxJL/P54hyOhxy+wqOC6Wf46ttWSdh7Pn+SfW2RoSPYkw34oHVqImzVKdewmQ
	HH4EpxfBx+25LLNubP+RDMKKtXqihiz3aITJJqd9Xzbtbv2FDxW9Zd7d6XEJKJIRcOix
	eqgZJz35RGrJdduz7TzzD6JhFXOmQ33h1RzIvE259itnavUnj7gxx5lD2EbZLwb9usMa
	T0h4ibeX4yzFsorRRj21CR7uVdz9i4mYchlDho+lK7a7ZL5tBYF73JY2O3tc66ujo/+m
	1P/dGHHJzm5P2DVYS8EoaoRUS3hgQswcNoxiyvUuGL5s9JRWNfqz9Wtjf3KU77u0hdv/
	7PWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RZegCJ9KnxOLajx4tN0ZnkaLGMQlSVIPNLJ/2Dv+TEs=;
	b=XVVypOGny1rY+63MuBNROT4Df2FKB16xjig9zT6DxemeByp4iaDowbJN7JbmQ5KCd4
	Ecarfq99FucyfHZXzvM91bY+VGmeuOZlABrTpOkAfy8vfTFXZ7BJ/pfUznPNCPrHoZDy
	wjbbxfw5fGNmrPmQGRlSaAhsNrH8hmkzJ3VtuJ6pvUJ687UK/wLDDLLgNAKU0wIRVr02
	LGYWh+YErWESbnhHmI0nlLY6CNP34jS6FUIA8tq2om+a+DZiYod1ujrJYwOzTW1K0etT
	+0dPVGsk1hICtJhyoCnYbK2Iz/AcUx2CvR4Vdo11UvAVJOyKT9y6+aoZCvZT2Pu19mp/
	45JQ==
X-Gm-Message-State: AN3rC/7Yz4sGrbpqJIvijGNT/6NZSN0QAFN50VX1bZLNKqx8pAkHH1xlxWVav19et5MnHob7wgrjEF1r0tJq8A==
X-Received: by 10.28.69.68 with SMTP id s65mr15761137wma.13.1491929849902;
	Tue, 11 Apr 2017 09:57:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Tue, 11 Apr 2017 09:56:59 -0700 (PDT)
In-Reply-To: <97be7aaf-58b0-05a2-b352-942cd82aca01@windriver.com>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
	<5a067d85afa569bc5b03df89acdb5914ccd86764.1491922350.git-series.patrick.ohly@intel.com>
	<97be7aaf-58b0-05a2-b352-942cd82aca01@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Apr 2017 09:56:59 -0700
Message-ID: <CAMKF1soHs+EAqyhmD4y=BuRizF-tVunUWnjs4a3a8qe8Oq3Oig@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/8] gdb-cross: avoid tune specific paths
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
X-List-Received-Date: Tue, 11 Apr 2017 16:57:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 11, 2017 at 8:16 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 4/11/17 9:56 AM, Patrick Ohly wrote:
>> gdb-cross used to be specific to the tune flags, but isn't
>> anymore. Therefore it is enough to use TARGET_SYS instead of
>> TUNE_PKGARCH to create a unique path.
>
> Are you sure about this.  On non-intel architectures, it used to be VERY common
> that the specific instruction set for a process was programmed into gdb.
>
> Sometimes the user could (after loading gdb) change the instructions, but this
> was an aweful user experience.
>
> Good example of this would be Power, e500, etc.  The instruction sets are not
> actually compatible with each other, so GDB needs to know the specific
> instruction in order to work.

if its mainly disassembly and opcodes if we compile bfd to support
them then gdb should be able to use it.  you can use something like

(gdb) set processor

to tune it to specific one

>
> --Mark
>
>> Fixes a sstate signature difference that was found via
>> yocto-compat-layer.py's test_machine_signatures check. In practice it
>> probably showed up as unnecessarily rebuilding gdb-cross when
>> switching between machines like intel-corei7-64 and qemux86-64.
>>
>> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>> ---
>>  meta/recipes-devtools/gdb/gdb-cross.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
>> index a34223e..d92f31f 100644
>> --- a/meta/recipes-devtools/gdb/gdb-cross.inc
>> +++ b/meta/recipes-devtools/gdb/gdb-cross.inc
>> @@ -24,4 +24,4 @@ BPN = "gdb"
>>  inherit cross
>>  inherit gettext
>>
>> -datadir .= "/gdb-${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
>> +datadir .= "/gdb-${TARGET_SYS}${TARGET_VENDOR}-${TARGET_OS}"
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

