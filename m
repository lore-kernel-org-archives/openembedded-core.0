Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.1007.1587850190706143170
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 14:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vDocGZsw;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id l19so13598824lje.10
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 14:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A8L+q57EIM38NRCsMnOdCiukabovUPdeku5mKPpTIpE=;
        b=vDocGZsweuTgp+Uh2IsLuprkTsUSWdzvbCU2a3iGIKvJMvndQu2CZxy79sTcHZzBxF
         oi8ERuoiaTPO+GIiEOGhirn7xrG9oOnKb6Sa0+JCMdZux5YBAgJwEw9E748ho6mGWD8u
         UcMBeZhb+pv/dVueSyvCohAMiFNkhW0OGFlBK2PvV9zHUqs0iwBgtZzDTzSRWZD/5DoO
         Tc/HrqQKMqUnSOI+Lf0GK9lXYdFWQpCdtQATiZMLtZG0em0ROqcFS1VE0h5k8QA+KWdV
         OHVKIDcpOJtN/gmN9jjYg9OYrSOGNBIfoIbKTuK4HXaF//muFaxZzlAXiDFhalq0alI9
         B3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A8L+q57EIM38NRCsMnOdCiukabovUPdeku5mKPpTIpE=;
        b=cZnYvILlOxNMGZthpoutKpdSN3IkDjYdzkm9oEYLssiyhphaYkQh89N5HeqmbgzoDG
         bbIhRlkhUSWw/iF/6OsNiH7Zfz9ubt70p1Hajsfx5igYQ3MtEvM3zMZ39oyX/FlN3VT7
         WPGBXl3sX1RxRArEBr8bQxHdrq+HAIsGjjQ76ZYJenAb+uJPup/8Jh9zAugjp7uEUkct
         P1W+kqqB36hAyQ6VOC2D/xQWC/hJxuNDpe7ChqN4vYDhZ3PUkBRCy1KQQc5RFSsTpENz
         sRmZ20d2oRJab2khud2iOXV+fwXrs2ZkfOZS1KiFmQJ/bZC4AszRHRlGkQs3liG05vYu
         5yeA==
X-Gm-Message-State: AGi0PuY7B0DpPZiXK8nDq7rj9fmRYaek8rxCg00hgrnzIJe4jXoC3JtW
	ed4i5fGXU94AkBraVVj0XzTi5iCdcsCy6NgDFTk=
X-Google-Smtp-Source: APiQypJSz9yqLBmh6qUcODhMA6PKe1mjVxFUoVOERUDbKij/YLPAdjhxCIGBvEbxMfrArWLqNAQcYQX4nh5fsZwLHnY=
X-Received: by 2002:a2e:8e22:: with SMTP id r2mr9641922ljk.286.1587850188997;
 Sat, 25 Apr 2020 14:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200424133032.7181-1-ricardo@ribalda.com> <CABcZANkfogiK1+DoZ4r4RFr_mNpBySa69o0ZeTrTUvwu6DJRYg@mail.gmail.com>
In-Reply-To: <CABcZANkfogiK1+DoZ4r4RFr_mNpBySa69o0ZeTrTUvwu6DJRYg@mail.gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Sat, 25 Apr 2020 23:29:32 +0200
Message-ID: <CAPybu_1iontd3rYTx52Tqhs3TxVWF0J1nkO5P3LhywxNJJb8_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] RFC wic: Support .wks files for multiple machines
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Henrik Andersen <henrik@newtec.dk>
Content-Type: text/plain; charset="UTF-8"

Hi Christopher

On Fri, Apr 24, 2020 at 5:56 PM Christopher Larson <kergoth@gmail.com> wrote:
>
> This will only work the way you expect if hte user's local.conf uses ?= or ??= for MACHINE, otherwise setting it in the environment will do nothing.
>

Good catch, You are right :(,

Any idea of how could I fix it. I think I would have to change
site.conf, or local.conf from wic, and I do not want to do that.

Ignoring this bug we are still covering a big number of usecases:

- bibake
- wic with user provided rootfs-dir
- wic without userprovided rootfs-dir and ?= or ??=

At the end of the day this is just a RFC ;), so i am open to any
implementation. I would love to hear your thoughts

Best regards



> On Fri, Apr 24, 2020 at 6:30 AM Ricardo Ribalda <ricardo.ribalda@gmail.com> wrote:
>>
>> If you want to make a disk image containing rootfs for different
>> machines, the only way to do it today is by calling wic and passing the
>> different rootfs-paths.
>>
>> Eg:
>> combined.wks
>> part /export --source rootfs --rootfs-dir=target-image
>> part / --source rootfs
>>
>> bitbake multiconfig:arm:target-image
>> wic create combined --rootfs-dir target-image=/workdir/build/tmp/work/arm-poky-linux/target-image/1.0-r0/rootfs/ -e main
>>
>> This has many drawbacks:
>> 1) You need to know the folder location for the target-image
>> 2) It is easy to forget updating the target (only running wic and not
>>    bitbake)
>> 3) It is slow
>> 4) It does not scale when you have multiple machines
>>
>> Instead, wic can be given a hint of what machine to search for:
>>
>> combined.wks
>> part /export --source rootfs --rootfs-dir=arm:target-image
>> part / --source rootfs
>>
>> bitbake main
>>
>> If we ensoure the dependency of target-image from main via
>> do_image[mcdepends], all the dependencies are automatically
>> handled.
>>
>> This patch makes wic aware of the machine to use.
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
>> ---
>>  scripts/lib/wic/misc.py | 16 +++++++++++++---
>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
>> index 91975ba151..51b43b49aa 100644
>> --- a/scripts/lib/wic/misc.py
>> +++ b/scripts/lib/wic/misc.py
>> @@ -206,7 +206,12 @@ class BitbakeVars(defaultdict):
>>
>>          if image not in self:
>>              if image and self.vars_dir:
>> -                fname = os.path.join(self.vars_dir, image + '.env')
>> +                if image.find(":") != -1:
>> +                    [machine, img] = image.split(":")
>> +                    fname = os.path.join(self.vars_dir, "../../",
>> +                                         machine, "imgdata", img + '.env')
>> +                else:
>> +                    fname = os.path.join(self.vars_dir, image + '.env')
>>                  if os.path.isfile(fname):
>>                      # parse .env file
>>                      with open(fname) as varsfile:
>> @@ -220,11 +225,16 @@ class BitbakeVars(defaultdict):
>>                  # Get bitbake -e output
>>                  cmd = "bitbake -e"
>>                  if image:
>> -                    cmd += " %s" % image
>> +                    if image.find(":") != -1:
>> +                        [machine, img] = image.split(":")
>> +                        cmd = "MACHINE=%s %s" % (machine, cmd)
>> +                    else:
>> +                        img = image
>> +                    cmd += " %s" % img
>>
>>                  log_level = logger.getEffectiveLevel()
>>                  logger.setLevel(logging.INFO)
>> -                ret, lines = _exec_cmd(cmd)
>> +                ret, lines = _exec_cmd(cmd, as_shell=True)
>>                  logger.setLevel(log_level)
>>
>>                  if ret:
>> --
>> 2.26.1
>>
>> 
>
>
>
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics



-- 
Ricardo Ribalda
