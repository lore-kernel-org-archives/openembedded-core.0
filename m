Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5E353710BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 06:46:16 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id mc6so15951408lab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 23:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=YluesYAUzY1lfs35wXHScrXTimYgualVwr+ZoQW4ps4=;
	b=LE9U1Ts7ZOeEtUUL3O9tULUnGsgDapKK1c8l4eBQPlamCcTQd3iJ3OU7q9mLbBDTjx
	34JoHGvZKgGxDyqz/vRUKbqiebB22BryBylfxpaGA0u3d/mcUTCja95PhkLTNVkX6W2X
	PnARmIDIzONOrmkMYsxNQ0pSjGj7yRoYyTHPmEGA4ECAmvywkXasObKZKpLWqGVB4MZ+
	rxZ87oisCVSEpNYGy5kT7thqSGYqqCIDLIQTsXkETouukftbIJWeGFptiEUewD0CvXqY
	CkTIoF1BfZguZzU73zvORtrLe5Jw++2aQlZa2hdKs1JA775itNgE9JGVdPoc0zmh8eUS
	g2qQ==
X-Gm-Message-State: ALoCoQlWAij9P+CaeZw/Uc4SdSieQmMhuU23c/Aj3ENIobG16OsNblRRZtj4lEwP8g0SFOga9PXX
MIME-Version: 1.0
X-Received: by 10.152.19.5 with SMTP id a5mr31984658lae.21.1409121976945; Tue,
	26 Aug 2014 23:46:16 -0700 (PDT)
Received: by 10.112.247.68 with HTTP; Tue, 26 Aug 2014 23:46:16 -0700 (PDT)
In-Reply-To: <CAAqcGH=tx9fny+_HYW5HyKi=7u3ENV67ZH6zErfm=KRQmssBhw@mail.gmail.com>
References: <1408007033-22777-1-git-send-email-riku.voipio@linaro.org>
	<CAAqcGH=tx9fny+_HYW5HyKi=7u3ENV67ZH6zErfm=KRQmssBhw@mail.gmail.com>
Date: Wed, 27 Aug 2014 09:46:16 +0300
Message-ID: <CAGNsrLBMhd2An6pcAz7jOU3bRC+ug1tPyT1c3QU5bQgohe89Pw@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: fix /var/volatile/tmp permissions
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
X-List-Received-Date: Wed, 27 Aug 2014 06:46:23 -0000
Content-Type: text/plain; charset=UTF-8

On 18 August 2014 10:46, Riku Voipio <riku.voipio@linaro.org> wrote:
> Hi,
>
> Any updates on this one?

<rant>it's in master-next since 4 days. ~10 days after you posted the
patch.</rant>

> Riku
>
> On 14 August 2014 12:03, Riku Voipio <riku.voipio@linaro.org> wrote:
>> Mariadb postinstall will fail with:
>>
>> ERROR: 1  Can't create/write to file '/tmp/#sql_a2a_0.MAI' (Errcode: 13)
>> 140814  8:14:06 [ERROR] Aborting
>>
>> /tmp is a link to /var/volatile/tmp, set as:
>>
>> drwxr-xr-x 3 root root 60 Aug 14 08:07 .
>>
>> populate-volatiles.sh does not create the directory or set
>> permissions, because it already exists:
>>
>> Checking for -/var/volatile/tmp-.
>> Creating directory -/var/volatile/tmp-.
>> Target already exists. Skipping.
>>
>> Traced the creation to the initfile in udev. Create with -m 1755
>> to be sure. With this patch applied, mysql postinst succeeds and
>> creates the neccesary user tables.
>>
>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>> ---
>>  meta/recipes-core/udev/udev/init | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
>> index f2c84d5..a442c74 100644
>> --- a/meta/recipes-core/udev/udev/init
>> +++ b/meta/recipes-core/udev/udev/init
>> @@ -57,7 +57,7 @@ case "$1" in
>>      # the automount rule for udev needs /tmp directory available, as /tmp is a symlink
>>      # to /var/tmp which in turn is a symlink to /var/volatile/tmp, we need to make sure
>>      # /var/volatile/tmp directory to be available.
>> -    mkdir -p /var/volatile/tmp
>> +    mkdir -m 1777 -p /var/volatile/tmp
>>
>>      # Cache handling.
>>      # A list of files which are used as a criteria to judge whether the udev cache could be reused.
>> --
>> 2.0.1
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

