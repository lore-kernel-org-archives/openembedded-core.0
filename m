Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.6203.1602709341119128607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 14:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LTV84UUb;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id m65so310924qte.11
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZvY50aQJb784O8RiSUdvYocnHkz3qNVdoLuBa8RZzek=;
        b=LTV84UUbkNZtOksPByYa3o9ULg3CIG7JfvjyjogPKfL1ZA3uCbgaz1DVASlqZ6XJr3
         gbNICfBZop4SRn1kCWcwZQn3KcYLpFJ3uG1rEyq+w+f6RIyG67juVsh0z6B3DjpV7EEI
         QoCftg5B/elQ6d2BWQILh323mZCrU1oSVdRYqdoN4X/72j50pJ7hBX0Y4E0oGVKOZThq
         AzvZBaQT4TjzSrA7wxfC5dQU9PSKkJp5GteFG7JwUaLaU9nCnIdZfETPYkeE6EzoKtoG
         FtlIVEikk6oZML3zBZ6XKY1gOSgDD9KCS995VN5FhzmzW3u83wHz5BZjjR9uQvRbWvMA
         J3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZvY50aQJb784O8RiSUdvYocnHkz3qNVdoLuBa8RZzek=;
        b=rE7AZ5RNOGZx6ga1dlbhyL4ecvQ8vadUthltieIi/1PmmQzqpy2wZor/liD2jVwLlW
         eHDAJbBpHR3HZLDR0SSxcziCSVdpFv62+FxzWc0/o0oU5XROkwhjY6I8A0PmmBM4cLba
         BA/Bv61ctO1UmUHdSgqIMVylBaw+KCSJco+c3zFuF8QBvSRzQAb7NU6W429eq5BmnkMI
         TfHgudnAmVgLvWn6fBEj0ypq9FkTtGHwh1K3uLmWj7H59kdTTNkabMv3EJWsDdXN0mUQ
         gvkB7BAAU/QTnmJDyOTciF34v+6ccVYdi+2xKmhR6TWeUlc1ccjKLjjivObfDBsRz6Yp
         HDkQ==
X-Gm-Message-State: AOAM532eUDCPk2yMJMiQGZi61ffAG+vFcZeAkGA3cy/4H585Fi1U5PHf
	3WH2nU4Dp6Sa0HD3sBiu2gldkPQJ3h1o/IG6Pbk=
X-Google-Smtp-Source: ABdhPJxNVJ/D9td+W0zoIsoBoWeNF5HthdeyfFUcte1L0F79duJyYxgN9XN1xhlSc15fQhAfdxNtjPKcD75FL/X+bss=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr1082622qtb.80.1602709340121;
 Wed, 14 Oct 2020 14:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201014112620.2244199-1-ross.burton@arm.com> <CAJdd5GY4QD03+UWP_y-ALi4vE54cf8-DTAYxMNOGrG1BZ-cHUw@mail.gmail.com>
In-Reply-To: <CAJdd5GY4QD03+UWP_y-ALi4vE54cf8-DTAYxMNOGrG1BZ-cHUw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Oct 2020 14:01:54 -0700
Message-ID: <CAMKF1soMBC6dk0DvaG=HjUD+Y0h4uh5LMkiNOJptxRibt_e=jQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] waf: explicitly run waf under Python 3
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2020 at 5:41 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
>
>
> On Wed, Oct 14, 2020, 6:26 AM Ross Burton <ross@burtonini.com> wrote:
>>
>> We don't assume Python 2 is on the host and don't expose an unversioned
>> python in HOSTTOOLS, but waf uses the unversion python binary.
>>
>> Typically this is solved by patching waf (see the glmark2 recipe) but
>> this can be solved centrally by invoking python3 directly.  All wscripts
>> that needed Python 2 would have been fixed by now.
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  meta/classes/waf.bbclass | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
>> index 309f625a40..df6d4d53e8 100644
>> --- a/meta/classes/waf.bbclass
>> +++ b/meta/classes/waf.bbclass
>> @@ -42,7 +42,7 @@ python waf_preconfigure() {
>>      subsrcdir = d.getVar('S')
>>      wafbin = os.path.join(subsrcdir, 'waf')
>>      try:
>> -        result = subprocess.check_output([wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
>> +        result = subprocess.check_output(['python3', wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
>
>
> This will break our internal usage... We still use waf 1 which runs under python 2 only :(, although we are working on transitioning

this is for master and we have already said goodbye to python2 in
oe-core. perhaps reverse patching waf in your app might be an option ?

>
>>          version = result.decode('utf-8').split()[1]
>>          if StrictVersion(version) >= StrictVersion("1.8.7"):
>>              d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
>> @@ -55,16 +55,16 @@ python waf_preconfigure() {
>>  do_configure[prefuncs] += "waf_preconfigure"
>>
>>  waf_do_configure() {
>> -       (cd ${S} && ./waf configure -o ${B} --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
>> +       (cd ${S} && python3 ./waf configure -o ${B} --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
>>  }
>>
>>  do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
>>  waf_do_compile()  {
>> -       (cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
>> +       (cd ${S} && python3 ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
>>  }
>>
>>  waf_do_install() {
>> -       (cd ${S} && ./waf install --destdir=${D} ${EXTRA_OEWAF_INSTALL})
>> +       (cd ${S} && python3 ./waf install --destdir=${D} ${EXTRA_OEWAF_INSTALL})
>>  }
>>
>>  EXPORT_FUNCTIONS do_configure do_compile do_install
>> --
>> 2.25.1
>>
>>
>>
>>
>
> 
>
